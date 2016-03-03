//
//  ViewController.swift
//  RGBSliders
//
//  Created by Jinyou Liu on 3/2/16.
//  Copyright © 2016 Electricfish Electroincs. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var redSlider:UISlider!
    @IBOutlet weak var greenSlider:UISlider!
    @IBOutlet weak var blueSlider:UISlider!
    @IBOutlet weak var colorView:UIView!
    
    var red:CGFloat = CGFloat(0.5)
    var blue:CGFloat = CGFloat(0.5)
    var green:CGFloat = CGFloat(0.5)

    override func viewDidLoad() {
        super.viewDidLoad()
        
        colorView.layer.borderColor = UIColor.blackColor().CGColor
        colorView.layer.borderWidth = 1
        
        let defaults = NSUserDefaults.standardUserDefaults()
        redSlider.value = defaults.floatForKey("red")
        greenSlider.value = defaults.floatForKey("green")
        blueSlider.value = defaults.floatForKey("blue")
        
        updateBackground()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func updateBackground(){
        red = CGFloat(redSlider.value)
        green = CGFloat(greenSlider.value)
        blue = CGFloat(blueSlider.value)
        
        let defaults = NSUserDefaults.standardUserDefaults()  //1
        defaults.setFloat(redSlider.value, forKey: "red")   //2
        defaults.setFloat(greenSlider.value, forKey: "green")
        defaults.setFloat(blueSlider.value, forKey: "blue")
        defaults.synchronize()
        
        colorView.backgroundColor = UIColor(red: red, green: green, blue: blue, alpha: 1)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if(segue.identifier == "openColor"){
            let openColorView = segue.destinationViewController
            openColorView.view.backgroundColor = UIColor(red: red, green: green, blue: blue, alpha: 1)
        }
    }
    


}

