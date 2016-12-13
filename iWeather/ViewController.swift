//
//  ViewController.swift
//  iWeather
//
//  Created by NguyenDucBien on 11/18/16.
//  Copyright © 2016 NguyenDucBien. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var lbl_city: UILabel!
    
    
    @IBOutlet weak var lbl_quoet: UILabel!
    
   
    @IBOutlet weak var btn_Temp: UIButton!
    
    
    @IBOutlet weak var lblCF: UILabel!

    
    @IBOutlet weak var btnTemp: UIButton!
    
    @IBOutlet weak var imv_background: UIImageView!
    
    var qouets = ["Một đầu bếp giỏi thì tốt bằng bảy bác sĩ.","Khi nói ít đi, bạn sẽ nghe thấy nhiều hơn.", "Kẻ ăn bám là nửa người, người chăm chỉ là mười người.", "Say là cái điên tự nguyện.", "Không có hoàn cảnh nào tuyệt vọng, chỉ có người tuyệt vọng vì hoàn cảnh.", "Đừng thở dài hãy vươn vai mà sống. Bùn dưới chân nhưng nắng ở trên đầu.", "Đừng ngại thay đổi. Bạn có thể mất một cái gì đó tốt nhưng bạn có thể đạt được một cái gì đó còn tốt hơn."]
    

    var city = ["Yên Bái", "Bắc Giang", "Lào Cai", "Điện Biên" , "Lạng Sơn", "Tuyên Quang", "Phú Thọ"]
    
    var bacgroundImage = ["Blood", "Moon", "Sun"]
    
    var degreeC : Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func btnChangeTemp(sender: AnyObject) {
        degreeC = !degreeC
        var currentTemp = Double((btnTemp.titleLabel?.text)!)
        
        if degreeC {
            currentTemp = (currentTemp! - 32) / 1.8
            
            btnTemp.setTitle(String(format: "%2.1f", currentTemp!), forState: UIControlState())
            
            lblCF.text = "C"
        }else{
            currentTemp = currentTemp! * 1.8 + 32
            
            btnTemp.setTitle(String(format: "%2.1f", currentTemp!), forState: UIControlState())
            
            lblCF.text = "F"
        }
    }


    @IBAction func btn_refresh(sender: AnyObject) {
        
        let cityIndex = Int(arc4random_uniform(UInt32(city.count
            )))
        
        lbl_city.text = city[cityIndex]
        
        
        let qouetIndex = Int(arc4random_uniform(UInt32(qouets.count
            )))
        
        lbl_quoet.text = qouets[qouetIndex]
        
        
        let imageIndex = Int(arc4random_uniform(UInt32(bacgroundImage.count
            )))
        
        imv_background.image = UIImage.init(named: bacgroundImage[imageIndex])
        
        
        getTemp()
    }
    
    func getTemp() -> Void {
        let temp = String(format: "%2.1f", tempRandom())
        //lbl_temp.text = randomNumber
        btnTemp.setTitle(temp, forState: UIControlState())
    }
    
    func tempRandom() -> Double {
        if degreeC{
            return Double(arc4random_uniform(18) + 14) + Double(arc4random())   / Double(INT32_MAX)}
        else{
            return (Double(arc4random_uniform(18) + 14) + Double(arc4random()) / Double(INT32_MAX)) * 1.8 + 32
        }
    }

}

