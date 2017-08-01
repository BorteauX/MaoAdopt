//
//  indexPageViewController.swift
//  FoodPin
//
//  Created by user on 2017/7/6.
//  Copyright © 2017年 user. All rights reserved.
//

import UIKit

class indexPageViewController: UIViewController {
    
    @IBOutlet weak var cat1ImgLabel: UIImageView!
    
    @IBOutlet weak var cat2ImgLabel: UIImageView!

    @IBOutlet weak var dog1ImgLabel: UIImageView!
    @IBOutlet weak var catdogImgLabel: UIImageView!
    
   
    @IBOutlet weak var miluImgLabel: UIImageView!
    
    @IBOutlet weak var wait: UIActivityIndicatorView!

    
    
    @IBAction func enter(_ sender: Any) {
       
       
    }
        
    @IBAction func notice(_ sender: Any) {
    }
    
    
    
    // cat1 動畫
    private func cat1(_ sender: Any) {
        UIView.animate(withDuration: 1, animations: {() in
            self.cat1ImgLabel.center.x += 100
            self.cat1ImgLabel.center.y += -80
            
            UIView.animate(withDuration: 1, animations: {
            self.cat1ImgLabel.transform = CGAffineTransform.identity
            
            })
        })
    }
    
    // cat2 動畫(先延遲再位移)
    private func cat2(_ sender: Any) {
        //延遲
        UIView.animate(withDuration: 1, delay: 1, options: UIViewAnimationOptions.allowAnimatedContent, animations: {()
            in
            //位移
            self.cat2ImgLabel.center.x += -100
            self.cat2ImgLabel.center.y += -100
            //縮放
            self.cat2ImgLabel.transform = CGAffineTransform.identity
    })
    }
    
    // dog1 動畫(先延遲再位移)
    private func dog1(_ sender: Any) {
        //延遲
        UIView.animate(withDuration: 1, delay: 2, options: UIViewAnimationOptions.allowAnimatedContent, animations: {()
            in
            //位移
            self.dog1ImgLabel.center.x += 40
            self.dog1ImgLabel.center.y += -10
            //縮放
            self.dog1ImgLabel.transform = CGAffineTransform.identity
        })
    }
    
    // catdog 動畫(先延遲再位移)
    private func catdog(_ sender: Any) {
        //延遲
        UIView.animate(withDuration: 1, delay: 3, options: UIViewAnimationOptions.allowAnimatedContent, animations: {()
            in
            //位移
            self.catdogImgLabel.center.y += 110
            //縮放
            self.catdogImgLabel.transform = CGAffineTransform.identity
        })
    }
    
    // muli 動畫(先延遲再位移)
    private func milu(_ sender: Any) {
        //延遲
        UIView.animate(withDuration: 1, delay: 4, options: UIViewAnimationOptions.allowAnimatedContent, animations: {()
            in
        
            //縮放
            self.miluImgLabel.transform = CGAffineTransform.identity
        })
    }
    
   
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //cat1 圖片初始設定
        cat1ImgLabel.transform = CGAffineTransform.init(scaleX: 0, y: 0)
        cat1(Any)
        
        //cat2 圖片初始設定
        cat2ImgLabel.transform = CGAffineTransform.init(scaleX: 0, y: 0)
        cat2(Any)
        
        //dpg1 圖片初始設定
        dog1ImgLabel.transform = CGAffineTransform.init(scaleX: 0, y: 0)
        dog1(Any)
        
        //catdog 圖片初始設定
        catdogImgLabel.transform = CGAffineTransform.init(scaleX: 0, y: 0)
        catdog(Any)
        
        //milu 圖片初始設定
        miluImgLabel.transform = CGAffineTransform.init(scaleX: 0, y: 0)
        milu(Any)
        
        
        // Do any additional setup after loading the view.
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
