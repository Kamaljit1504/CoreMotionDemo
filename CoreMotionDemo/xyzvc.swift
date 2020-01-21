//
//  xyzvc.swift
//  CoreMotionDemo
//
//  Created by MacStudent on 2020-01-21.
//  Copyright © 2020 MacStudent. All rights reserved.
//

import UIKit
import CoreMotion
class xyzvc: UIViewController {

    @IBOutlet weak var squre: UIView!
    @IBOutlet weak var xL: UILabel!
    @IBOutlet weak var yL: UILabel!
    @IBOutlet weak var zL: UILabel!
    // like location manager we need motion manger
    
    var motionManager: CMMotionManager!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
         motionManager = CMMotionManager()
         motionManager.startAccelerometerUpdates(to: .main)
         {    (data,error) in
               guard let accelerometerData = data
                else { return }
             
            
              let formatter = NumberFormatter()
              formatter.minimumFractionDigits = 1
              formatter.maximumFractionDigits = 2
              
              let x = accelerometerData.acceleration.x
              let y = accelerometerData.acceleration.y
              let z = accelerometerData.acceleration.z
              print(x,y,z)
            
            self.xL.text = "x:\(x)"
             self.yL.text = "y:\(y)"
            self.zL.text = "z:\(z)"
            self.moveSqure(x: CGFloat(accelerometerData.acceleration.x), y: CGFloat(accelerometerData.acceleration.y))
        }
    }
        
        func moveSqure(x: CGFloat,y: CGFloat)
        {
            let xPosition = squre.frame.origin.x
            let yPosition = squre.frame.origin.y
            
            let width = squre.frame.size.width
            let height = squre.frame.size.height
            
            let screen = UIScreen.main.bounds
            let screeWidth = screen.width
            let screenHeight = screen.height
            
            UIView.animate(withDuration: 0)
            {
                guard (xPosition + x >= 0 && xPosition + width  <= screeWidth) && (yPosition - y >= 0 && yPosition + height <= screenHeight) else { return }
                self.squre.frame = CGRect(x: xPosition + x , y: yPosition - y , width: width, height: height)
            }
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
