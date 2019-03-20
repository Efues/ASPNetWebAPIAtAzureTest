//
//  ListTableViewController.swift
//  iOS
//
//  Created by Toshiyasu Shimizu on 2019/03/20.
//  Copyright © 2019 Efues. All rights reserved.
//

import UIKit

class ListTableViewController: UITableViewController {
    var selected: ContactEntity?

    // データソース
    var contactList: [ContactEntity]? {
        didSet {
            self.tableView.reloadData()
            if !(contactList?.isEmpty ?? false) {
                tableView.scrollToRow(at: IndexPath(row: 0, section: 0), at: .top, animated: false)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // 画面表示のタイミングでWeb APIにリクエスト
        API.getAllList { [weak self] results in
            self?.contactList = results
        }
    }


    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contactList?.count ?? 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // セルのインスタンスを取得
        let cell = tableView.dequeueReusableCell(withIdentifier: "listTableCell", for: indexPath)

        // セルの内容
        guard let contact = contactList?[indexPath.row] else { return cell }
        
        // name
        let nameLabel = cell.viewWithTag(1) as! UILabel
        nameLabel.text = contact.name
        
        // address
        let addressLabel = cell.viewWithTag(2) as! UILabel
        addressLabel.text = contact.address
        
        // phone
        let phoneLabel = cell.viewWithTag(3) as! UILabel
        phoneLabel.text = contact.phone
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70;
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let contact = contactList?[indexPath.row] else { return }
        selected = contact
        performSegue(withIdentifier: "toDetailView", sender: nil)
    }
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    // MARK: - Navigation
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "toDetailView")
        {
            let nextVC: DetailViewController = (segue.destination as? DetailViewController)!
            nextVC.selected = self.selected
        }
    }
}


// MARK: - アクションメソッド
extension ListTableViewController {
    @IBAction func backToTop(segue: UIStoryboardSegue) {}

}
