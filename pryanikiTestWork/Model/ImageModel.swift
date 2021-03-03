//
//  ImageModel.swift
//  pryanikiTestWork
//
//  Created by Дмитрий Жучков on 12.02.2021.
//

import UIKit
class ImageModel: UIImageView {
    override init(frame: CGRect) {
          super.init(frame: frame)
      }
    init(){
          super.init(frame: .zero)
          layer.cornerRadius = 8
          layer.masksToBounds = true
          translatesAutoresizingMaskIntoConstraints = false
      }
      required init?(coder: NSCoder) {
          fatalError("init(coder:) has not been implemented")
      }
}
