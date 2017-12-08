//
//  ViewController.swift
//  CustumAlert
//
//  Created by HoangLuyen on 12/7/17.
//  Copyright © 2017 HoangLuyen. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIPopoverPresentationControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func clickSave(_ sender: UIBarButtonItem) {
        let popoverVC = self.storyboard?.instantiateViewController(withIdentifier: "PopoverView") as! AlertVC
        popoverVC.modalPresentationStyle = UIModalPresentationStyle.popover
        popoverVC.modalTransitionStyle = UIModalTransitionStyle.crossDissolve
//        popoverVC.preferredContentSize = CGSize(width: 200, height: 200)
        popoverVC.providesPresentationContextTransitionStyle = true
        popoverVC.definesPresentationContext = true
        self.present(popoverVC, animated: true, completion: nil)
    }
    

}

