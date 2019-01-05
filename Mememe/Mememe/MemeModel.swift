//
//  MemeModel.swift
//  Mememe
//
//  Created by 尾山昌太郎 on 2019/01/05.
//  Copyright © 2019年 shotaro. All rights reserved.
//

import UIKit

class MemeModel: NSObject {
    let topText: String
    let bottomText: String
    let originalImage: UIImage
    let memedImage: UIImage
    
    init(topText: String, bottomText: String, originalImage: UIImage, memedImage: UIImage) {
        self.topText = topText
        self.bottomText = bottomText
        self.originalImage = originalImage
        self.memedImage = memedImage
    }

}
