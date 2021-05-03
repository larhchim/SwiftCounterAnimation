//
//  ViewController.swift
//  TimerAnimationCount
//
//  Created by LARHCHIM ISMAIL on 5/3/21.
//  Copyright © 2021 LARHCHIM ISMAIL. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var time = Timer()
    var cpt = 0
    var ps = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBOutlet weak var img: UIImageView!
    
    @IBOutlet weak var TimeLabel: UILabel!
    
    @IBOutlet weak var Message: UITextField!
    
    @IBAction func Pause(_ sender: Any) {
        
        if ps == 0 {
            
            Message.text = "Count Pause pressed"
            time.invalidate()
            ps += 1

        }else{
            
            Message.text = "Pause already pressed"
            
        }
        
    }
    
    @IBAction func Play(_ sender: Any) {
        
        Message.text = "Count Play Pressed"
        
        if(cpt >= 0){
            
             time = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(afficher), userInfo: nil, repeats: true)
            
            ps = 0

        }
        
       
    }
    
    @objc func afficher(){
        
        TimeLabel.text = String(cpt)
        cpt = cpt + 1
        
        if(cpt % 2 == 0){
            
            img.image = UIImage(named: "starfull")
            
        }else{
            
            img.image = UIImage(named: "starempty")
            
        }
    }
    
    @IBAction func Stop(_ sender: Any) {
        
        Message.text = "Count Stop pressed"
        time.invalidate()
        cpt = 0
        TimeLabel.text = "0"
        ps = 0

    }
}

