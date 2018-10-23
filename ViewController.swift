//
//  ViewController.swift
//  RealTimeBitcoin
//
//  Created by Jesus Santiago Carrasco Campa on 10/7/18.
//  Copyright © 2018 Techson. All rights reserved.
//

import UIKit
import Alamofire
import SVProgressHUD

class ViewController: UIViewController {

    
    @IBOutlet weak var precioLabel: UILabel!
    @IBOutlet weak var fechaLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        agarrarPrecio()
    }
    
    
    func agarrarPrecio(){
        
        SVProgressHUD.show()
        
        Alamofire.request("https://api.coindesk.com/v1/bpi/currentprice.json").responseJSON { (response) in
            
            if let bitcoinJSON = response.result.value {
                let bitcoinObj:Dictionary = bitcoinJSON as! Dictionary<String, Any>
                
                //Tener precio del bitcoin
                let bpiObj:Dictionary = bitcoinObj["bpi"] as! Dictionary<String, Any>
                let usdObj:Dictionary = bpiObj["USD"] as! Dictionary<String, Any>
                let rate:String = usdObj["rate"] as! String
                
                //Tener fecha de ultima actualizacion
                let time = bitcoinObj["time"] as! Dictionary<String, Any>
                let update = time["updated"] as! String
                
                self.precioLabel.text = "$\(rate) USD"
                self.fechaLabel.text = update
            }
            
        }
        
        SVProgressHUD.dismiss()
        
    }
    


}





