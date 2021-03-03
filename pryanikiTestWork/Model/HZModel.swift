//
//  HZModel.swift
//  pryanikiTestWork
//
//  Created by Дмитрий Жучков on 12.02.2021.
//

import UIKit
class HZModel: UILabel {
    override init(frame: CGRect) {
          super.init(frame: frame)
      }
      init(){
          super.init(frame: .zero)
          translatesAutoresizingMaskIntoConstraints = false
      }
      required init?(coder: NSCoder) {
          fatalError("init(coder:) has not been implemented")
      }
}
