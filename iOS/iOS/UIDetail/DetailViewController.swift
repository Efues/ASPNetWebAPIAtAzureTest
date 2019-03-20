//
//  UIDetailViewController.swift
//  iOS
//
//  Created by Toshiyasu Shimizu on 2019/03/20.
//  Copyright © 2019 Efues. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    var selected: ContactEntity?
    
    @IBOutlet weak var nameText: UILabel!
    @IBOutlet weak var addressText: UILabel!
    @IBOutlet weak var phoneText: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        print("UIDetailViewIsLoaded")
        nameText.text = selected?.name
        addressText.text = selected?.address
        phoneText.text = selected?.phone
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
