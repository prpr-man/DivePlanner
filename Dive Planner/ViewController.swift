//
//  ViewController.swift
//  Dive Planner
//
//  Created by PeroPeroMan on 2015/07/27.
//  Copyright © 2015年 TMDC. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    var calculator = Calculator()
    var default_view_height: CGFloat = 0.0
    
    @IBOutlet weak var initialGroup: UITextField!
    @IBOutlet weak var initialSI: UITextField!
    @IBOutlet weak var waterDepth: UITextField!
    @IBOutlet weak var bottomTime: UITextField!
    
    @IBOutlet weak var newGroup: UILabel!
    
    @IBAction func next(sender: AnyObject) {
        if(newGroup.text != ""){
            initialGroup.text = newGroup.text
        } else {
            initialGroup.text = ""
        }
        initialSI.text = ""
        waterDepth.text = ""
        bottomTime.text = ""
        newGroup.text = ""
    }
    
    @IBAction func backgroundTapped(sender: AnyObject) {
        view.endEditing(true)
        calc()
    }
    
    override func viewDidAppear(animated: Bool) {
        default_view_height = view.frame.size.height
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initialGroup.delegate = self
        initialSI.delegate = self
        waterDepth.delegate = self
        bottomTime.delegate = self
        
        let notification_center = NSNotificationCenter.defaultCenter()
        
        notification_center.addObserver(self, selector: "keyboardDidShow:", name: UIKeyboardDidShowNotification, object: nil)
        notification_center.addObserver(self, selector: "keyboardDidHide:", name: UIKeyboardDidHideNotification, object: nil)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    func keyboardDidShow(notification: NSNotification) {
        var info = notification.userInfo! as Dictionary
        
        let bValue = info[UIKeyboardFrameEndUserInfoKey] as! NSValue
        let kbFrame = bValue.CGRectValue()
        
        view.frame.size.height = default_view_height - kbFrame.size.height
    }
    
    func keyboardDidHide(notification: NSNotification) {
        view.frame.size.height = default_view_height
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        view.endEditing(true)
        calc()
        return true
    }
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        
        if(textField == initialGroup) {
            if(string == "") {
                return true
            }
            if NSString(string: textField.text!).length >= 1 {
                return false
            }
            let word = string.unicodeScalars.first
            if (word >= "a" && word <= "z") || (word >= "A" && word <= "Z") {
                return true
            } else {
                return false
            }
        } else {
            if(string == "" || string == "."){
                return true
            }
        
            let input = Int(string)
        
            if(input == nil){
                return false
            }
        
            switch (input!) {
            case 0...9:
                return true
            default:
                return false
            }
        }
    }
    
    func calc() {
        var group: String = ""
        
        if initialGroup.text != "" && initialSI.text != "" {
            let ig = (initialGroup.text!).uppercaseString
            group = calculator.getGroupAfterSI(Group: ig, SurfaceInterval: NSString(string: initialSI.text!).integerValue)
            newGroup.text = group
        }
        if waterDepth.text != "" && bottomTime.text != "" {
            let depth: Float = NSString(string: waterDepth.text!).floatValue
            let time: Int = NSString(string: bottomTime.text!).integerValue
            
            var add_time: Int = 0
            if group != "" {
                add_time = calculator.getRNT(Group: group, WaterDepth: depth)
                if add_time == -1 {
                    newGroup.text = ""
                    return
                }
            }
            let group :String = calculator.getGroup(WaterDepth: depth,  BottomTime: time + add_time)
            newGroup.text = group
        }
    }
    

}

