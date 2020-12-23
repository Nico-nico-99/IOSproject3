//
//  Table1.swift
//  project3
//
//  Created by Nico on 2020/11/20.
//

import UIKit

class Table1: UITableViewController {

    var students:[inf] = [inf]();
    
    // 存储数组内容到磁盘中
    func saveContacts(){
        let success = NSKeyedArchiver.archiveRootObject(students, toFile: inf.userPath)
        if !success{
            print("failed to saveContacts")
        }
    }
    
    // 加载磁盘中的数组内容
    func loadContacts(){
        if let contacts = NSKeyedUnarchiver.unarchiveObject(withFile: inf.userPath) as? [inf] {
            students = contacts
            print("load failed")
        }
    }
    
    func studentsload()->Void{
        students.append(inf(name: "nico", tel: "123456", avatar: nil));
        students.append(inf(name: "maki", tel: "123456", avatar: nil));
        students.append(inf(name: "kokodayo", tel: "123456", avatar: nil));
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // 调用函数初始化students数组
        studentsload()
        loadContacts()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    @IBAction func saveToList(segue: UIStoryboardSegue){
        if let sourceVC = segue.source as? detailsViewController, let contact =
            sourceVC.contactForEdit{
            if let selectedIndex = tableView.indexPathForSelectedRow{
                students[selectedIndex.row] = contact
                tableView.reloadRows(at: [selectedIndex], with: UITableView.RowAnimation.automatic)
            }else{
                students.append(contact)
                // 刷新新增的一行
                // tableView.insertRows(at: , with:<#T##UITableView.RowAnimation#>)
                tableView.reloadData()  // 整个页面刷新
            }
        }
        saveContacts();
    }
    
    @IBAction func cancelToList(segue: UIStoryboardSegue){
        
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        // tableview 的分组
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        // 分组里显示多少行 -- 行数为数组长度
        return students.count
    }

    // 处理每个单元格的样式
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> infTableViewCell {
        //let cell = tableView.dequeueReusableCell(withIdentifier: "tablecell", for: indexPath)
        let cell = tableView.dequeueReusableCell(withIdentifier: "tablecell", for: indexPath)as! infTableViewCell

        // Configure the cell...
        cell.tableName?.text = students[indexPath.row].name
        cell.tableTel?.text = students[indexPath.row].tel
        cell.tableAvatar?.image = students[indexPath.row].avatar
        return cell
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            students.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            saveContacts()
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }

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
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        // 目标页的代理
        if let destVC = segue.destination as? detailsViewController{
            // 选中行行号
            if let selectedIndex = tableView.indexPathForSelectedRow{
                destVC.contactForEdit = students[selectedIndex.row]
            }
        }
    }

}
