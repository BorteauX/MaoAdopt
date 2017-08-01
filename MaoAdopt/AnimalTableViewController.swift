//
//  RestaurantTableViewController.swift
//  FoodPin
//
//  Created by user on 2017/6/28.
//  Copyright © 2017年 user. All rights reserved.
//

import UIKit
import Social

class RestaurantTableViewController: UITableViewController {
    
    var animal:[Animal] = []
    
    private func getAdoptionOpenData() {
        // 農委會資料
        do {
            
            let url = URL(string: "http://data.coa.gov.tw/Service/OpenData/AnimalOpenData.aspx")
            let data = try Data(contentsOf: url!)
        parseJson(json: data)
        }catch {
            print("OKOK")
            // 處理 try 的錯誤
            print(error)
        }
    }
    private func parseJson(json:Data){
        do{
            if let jsonObj = try? JSONSerialization.jsonObject(with: json, options: .allowFragments) {
                let allObj = jsonObj as! [[String: AnyObject]]
                print(allObj.count)
                for r in allObj  {
                let animal = Animal()
                    animal.id = r["animal_id"]                   as! String
                    animal.kind = r["animal_kind"]               as! String
                    animal.sex = r["animal_sex"]                 as! String
                    animal.age = r["animal_age"]                 as! String
                    animal.bodytype = r["animal_bodytype"]       as! String
                    animal.colour = r["animal_colour"]           as! String
                    animal.sterilization = r["animal_sterilization"] as! String
                    animal.bacterin = r["animal_bacterin"]       as! String
                    animal.foundplace = r["animal_foundplace"]   as! String
                    animal.opendate = r["animal_opendate"]       as! String
                    animal.closeddate = r["animal_closeddate"]  as! String
                    animal.sheltername = r["shelter_name"]       as! String
                    animal.shelteraddress = r["shelter_address"] as! String
                    animal.sheltertel = r["shelter_tel"]         as! String
                    animal.PicURL = r["album_file"]              as! String
                    self.animal.append(animal)
                }
            }
        }catch{
            print(error)
        }
        
    }
    //如果資料有值就傳回。無值就nil
    func downloadPics(_ url:String) -> UIImage! {
        if let data = try? Data(contentsOf: URL(string: url)!){
            return UIImage(data: data)
        }else {
            return nil
        }
    }
    
    
//    var restaurantIsVisited = Array(repeating: false , count: 21)
//    var restaurantIsVisited = [false, false, false, false, false, false
//    , false,false,false, false, false, false, false, false, false, false, false, false,
//        false, false, false]
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellId = "cell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! RestaurantTableViewCell
        
        //id文字
        cell.nameLabel.text = "ID:\(animal[indexPath.row].id)"
        //kind文字
        cell.locationLabel.text = "種類:\(animal[indexPath.row].kind)"
        //sex文字
        cell.typeLabel.text = "性別:\(animal[indexPath.row].sex)"
        //sheltername文字(取前三個字)
        let country:String = animal[indexPath.row].sheltername
        let crountrySide = country.index(country.startIndex, offsetBy: 3)
        let ctry = country.substring(to: crountrySide)
        cell.shelternameLabel.text = "地點:\(ctry)"
        
        DispatchQueue.global().async {
            let downloadedImage = self.downloadPics(self.animal[indexPath.row].PicURL)
            DispatchQueue.main.async {
                cell.thumbnailImageView.image = downloadedImage
            }
        }
//        cell.thumbnailImageView.image = UIImage(named: animal[indexPath.row].image)
//        
        //縮圖圓角
        cell.thumbnailImageView.layer.cornerRadius = 30.0
        cell.thumbnailImageView.clipsToBounds = true
        
        
        //如果條件是true 就會在Cell顯示勾選，否則不顯示
//        if restaurantIsVisited[indexPath.row]{
//            cell.accessoryType = .checkmark
//        }else {
//            cell.accessoryType = .none
//        }
        return cell
    }
    
        //分享按鈕功能
    
        @IBAction func shareButton(_ sender: Any) {
            
            
    
        }
    
//    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        //建立一個類似動作清單的選項
//        let optionMenu = UIAlertController(title: nil, message: "What do you want?", preferredStyle: .actionSheet)
//        
//        //加入動作至選單中
//        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
//        optionMenu.addAction(cancelAction)
//        
//        //呈現選單
//        present(optionMenu, animated: true, completion: nil)}
//
//        
//        //加入call 打電話動作的閉包函式
//        let callActionHandler = { (action:UIAlertAction!) -> Void in
//            let alertMessage = UIAlertController(title: "Service Unavailable", message:
//                "Sorry, the call feature is not available yet. Please retry later.",
//                                                 preferredStyle: .alert)
//            alertMessage.addAction(UIAlertAction(title: "OK", style: .default, handler:
//                nil))
//            self.present(alertMessage, animated: true, completion: nil)
//        }
//        
//        //加入call 打電話的動作
//        let callAction = UIAlertAction(title: "Call " + "123-000-\(indexPath.row)",
//            style: .default, handler: callActionHandler)
//        optionMenu.addAction(callAction)
//        
//        //加入check in動作
//        let checkInAction = UIAlertAction(title: "Check in", style: .default, handler:{
//            (action:UIAlertAction!) -> Void in
//            
//            let cell = tableView.cellForRow(at: indexPath)
//            cell?.accessoryType = .checkmark
//            self.restaurantIsVisited[indexPath.row] = true
//        })
//        optionMenu.addAction(checkInAction)
//        //加入undo check 動作
//        let undoCheck = UIAlertAction(title: "Undo Check", style: .default, handler: {
//            (action:UIAlertAction!) -> Void in
//            
//            let cell = tableView.cellForRow(at: indexPath)
//            cell?.accessoryType = .none
//        })
//        optionMenu.addAction(undoCheck)
//        
//        
//        
//        tableView.deselectRow(at: indexPath, animated: false)
//    }
    
    
    //segue過去RestaurantDetailViewController
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showRestaurantDetail" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let destinationController = segue.destination as! RestaurantDetailViewController
                
                let cell = tableView.cellForRow(at: indexPath) as!
                    RestaurantTableViewCell
                
                destinationController.animal = animal[indexPath.row]
        destinationController.detailImage = cell.thumbnailImageView.image            }
        }
    }
    



    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //畫面出來前先跑函式 抓資料
        getAdoptionOpenData()
        
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
       
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return animal.count
    }

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */



}

