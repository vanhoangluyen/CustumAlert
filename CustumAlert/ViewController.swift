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
        let alert = UIAlertController(title: "Warning", message: "Message Warning", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: {action in
            print("OK")
        })
        let yesAction = UIAlertAction(title: "Yes", style: .destructive, handler: {action in
            print("YES")
        })
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: {action in
            print("Cancel")
        })
        alert.addAction(okAction)
        alert.addAction(yesAction)
        alert.addAction(cancelAction)
        self.present(alert, animated: true, completion: nil)
    }
    

}

