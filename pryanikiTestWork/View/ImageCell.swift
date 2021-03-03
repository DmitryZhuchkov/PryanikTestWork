//
//  HZCell.swift
//  pryanikiTestWork
//
//  Created by Дмитрий Жучков on 12.02.2021.
//

import UIKit
import Kingfisher
class ImageCell:UITableViewCell {
    var path:String?
    lazy var Image: ImageModel = {
        let image = ImageModel()
            return image
         }()
    func setImage(url: URL) {
        let resource = ImageResource(downloadURL: url)
        Image.kf.setImage(with: resource)
    }
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
           super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(Image)
        Image.topAnchor.constraint(equalTo:topAnchor).isActive = true
        Image.leftAnchor.constraint(equalTo:leftAnchor).isActive = true
        Image.rightAnchor.constraint(equalTo:rightAnchor).isActive = true
        Image.bottomAnchor.constraint(equalTo:bottomAnchor).isActive = true
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
