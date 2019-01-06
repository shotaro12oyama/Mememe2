//
//  MemeCollectionViewController.swift
//  Mememe
//
//  Created by 尾山昌太郎 on 2019/01/06.
//  Copyright © 2019年 shotaro. All rights reserved.
//

import UIKit

class MemeCollectionViewController: UIViewController {

    var memes: [MemeModel]! {
        let object = UIApplication.shared.delegate
        let appDelegate = object as! AppDelegate
        return appDelegate.memes
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
