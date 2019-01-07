//
//  SentMemesTableViewCell.swift
//  Mememe
//
//  Created by 尾山昌太郎 on 2019/01/07.
//  Copyright © 2019年 shotaro. All rights reserved.
//

import UIKit

class SentMemesTableViewCell: UITableViewCell {

    
    @IBOutlet weak var memedImage: UIImageView!
    @IBOutlet weak var memedTextOnTop: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
