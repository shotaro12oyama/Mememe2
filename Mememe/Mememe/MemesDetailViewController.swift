//
//  MemesDetailViewController.swift
//  Mememe
//
//  Created by 尾山昌太郎 on 2019/01/07.
//  Copyright © 2019年 shotaro. All rights reserved.
//

import UIKit

class MemesDetailViewController: UIViewController {

    // MARK: Properties
    
    var memedImage: UIImage!
    
    // MARK: Outlets
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var textLabel: UILabel!
    // MARK: Life Cycle
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.imageView!.image = memedImage
        //self.textLabel.text = meme.topText
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.tabBarController?.tabBar.isHidden = false
    }
    
}
