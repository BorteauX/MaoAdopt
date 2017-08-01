//
//  RestaurantDetailViewController.swift
//  FoodPin
//
//  Created by Lee on 2017/7/2.
//  Copyright © 2017年 user. All rights reserved.
//

import UIKit
import Social

class RestaurantDetailViewController: UIViewController , UITableViewDelegate , UITableViewDataSource{
    
    //空的變數 以便我們可以利用他跟 Storyboard 的 Viewcontroller 物件連結（自訂外觀物件）
    @IBOutlet var tableView:UITableView!
    
    @IBOutlet weak var detailImg: UIImageView!
    
    var animal:Animal!
    var detailImage:UIImage!
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 14
    }
   
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) ->
        UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for:indexPath) as! DetailTableViewCell
           
        //設定cell
        switch indexPath.row {
        case 0:
            
            cell.fieldLabel.text = "ID"
            cell.valueLabel.text = " : \(animal.id)"
        case 1:
            cell.fieldLabel.text = "種類"
            cell.valueLabel.text = " : \(animal.kind)"
        case 2:
            cell.fieldLabel.text = "性別"
            cell.valueLabel.text = " : \(animal.sex)"
        case 3:
            cell.fieldLabel.text = "年齡"
            cell.valueLabel.text = " : \(animal.age)"
        case 4:
            cell.fieldLabel.text = "體型"
            cell.valueLabel.text = " : \(animal.bodytype)"
        case 5:
            cell.fieldLabel.text = "毛色"
            cell.valueLabel.text = " : \(animal.colour)"
        case 6:
            cell.fieldLabel.text = "絕育"
            cell.valueLabel.text = " : \(animal.sterilization)"
        case 7:
            cell.fieldLabel.text = "狂犬病疫苗"
            cell.valueLabel.text = " : \(animal.bacterin)"
        case 8:
            cell.fieldLabel.text = "發現地點"
            cell.valueLabel.text = " : \(animal.foundplace)"
        case 9:
            cell.fieldLabel.text = "開放領養時間"
            cell.valueLabel.text = " : \(animal.opendate)"
        case 10:
            cell.fieldLabel.text = "關閉領養時間"
            cell.valueLabel.text = " : \(animal.closeddate)"
        case 11:
            cell.fieldLabel.text = "收容所名稱"
            cell.valueLabel.text = " : \(animal.sheltername)"
        case 12:
            cell.fieldLabel.text = "收容所地址"
            cell.valueLabel.text = " : \(animal.shelteraddress)"
        case 13:
            cell.fieldLabel.text = "收容所電話"
            cell.valueLabel.text = " : \(animal.sheltertel)"

        default:
            cell.fieldLabel.text = ""
            cell.valueLabel.text = ""
        }
            
        //Cell的背景顏色 .clear為透明
        cell.backgroundColor = UIColor.clear
        return cell
    }
 
    //分享按鈕
    @IBAction func shareBtn(_ sender: Any) {
        let actionSheet = UIAlertController(title: "", message: "", preferredStyle: UIAlertControllerStyle.actionSheet)
    
        
    //設定臉書動作
        let facebookPostAction = UIAlertAction(title: "Share on Facebook", style: UIAlertActionStyle.default) { (action) -> Void in
    if SLComposeViewController.isAvailable(forServiceType: SLServiceTypeFacebook) {
                let facebookVC = SLComposeViewController(forServiceType: SLServiceTypeFacebook)
        
                facebookVC?.setInitialText(
                    "ID:\(self.animal.id)\n種類:\(self.animal.kind)\n性別:\(self.animal.sex)\n收容所名稱: \(self.animal.sheltername)")
                facebookVC?.add(self.detailImage!)
                self.present(facebookVC!, animated: true, completion: nil)
            }
            else {
                self.showAlertMessage(message: "You are not connected to your Facebook account.")
            }
        }
    
    //設定取消動作
    let dismissAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.cancel, handler: {(action)in
        

        })
    actionSheet.addAction(facebookPostAction)
    actionSheet.addAction(dismissAction)
    present(actionSheet, animated: true, completion: nil)
    
            
}

    func showAlertMessage(message: String!) {
        let alertController = UIAlertController(title: "EasyShare", message: message, preferredStyle: UIAlertControllerStyle.alert)
        alertController.addAction(UIAlertAction(title: "Okay", style: UIAlertActionStyle.default, handler: nil))
        present(alertController, animated: true, completion: nil)
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //顯示圖片
        detailImg.image = detailImage
            
            
        //tableView背景顏色
        tableView.backgroundColor = UIColor(colorLiteralRed: 240.0/255.0, green: 240.0/255.0, blue: 240.0/255.0, alpha: 0.2)
        
        //清除cell多餘隔線
        tableView.tableFooterView = UIView(frame: .zero)
        
        //變更cell隔線顏色
        tableView.separatorColor = UIColor(colorLiteralRed: 240.0/255.0, green: 240.0/255.0, blue: 240.0/255.0, alpha: 1)
        
        
        //啟用自適應cell
        tableView.estimatedRowHeight = 36.0 //cell 估算的行高
        tableView.rowHeight = UITableViewAutomaticDimension //iOS10的預設行高
        
        
           }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
