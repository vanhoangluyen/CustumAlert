//
//  ViewController.swift
//  CustumAlert
//
//  Created by HoangLuyen on 12/7/17.
//  Copyright © 2017 HoangLuyen. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {
    @IBOutlet weak var actionShowAlert: UIButton!
    let dispose = DisposeBag()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        actionShowAlert.rx
            .controlEvent(.touchUpInside)
            .debounce(RxTimeInterval.milliseconds(350), scheduler: MainScheduler.instance)
            .subscribe(onNext: { [weak self] _ in
                guard let strongSelf = self else {
                    return
                }
//                strongSelf.customizeBackground()
//                strongSelf.customizeFont()
                strongSelf.customizeViewController()
            }).disposed(by: dispose)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func customizeViewController() {
        let alertController = UIAlertController(title: nil, message: nil, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(okAction)
        
        // Create custom content viewController
        let contentViewController = CustomAlert()
        contentViewController.preferredContentSize = contentViewController.view.bounds.size
        alertController.setValue(contentViewController, forKey: "contentViewController")
        let datas = makeList(Int.random(in: 3...7))
        contentViewController.updateUI(message: "Hello world", items: datas)
        present(alertController, animated: true, completion: nil)
    }
    
    func makeList(_ maxNum: Int) -> [Int] {
        return (0..<maxNum).map { _ in .random(in: 1...20) }
    }
    
    func customizeBackground() {
        let alertController = UIAlertController(title: "Vietcombank", message: "Số dư tài khoản của bạn là 13.015 VNĐ", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(okAction)
        let backgroundView = alertController.view.subviews.last?.subviews.last
        backgroundView?.layer.cornerRadius = 14.0
        backgroundView?.backgroundColor = .purple
        present(alertController, animated: true, completion: nil)
    }
    
    func customizeFont() {
        let alertController = UIAlertController(title: nil, message: nil, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Nhận thưởng ngay", style: .default, handler: nil)
        alertController.addAction(okAction)
        // Create custom title
        let customTitle = NSMutableAttributedString(string: "Vietlott thông báo", attributes: [
            NSAttributedStringKey.font: UIFont(name: "Times New Roman", size: 24.0)!,
            NSAttributedStringKey.foregroundColor: UIColor.red
            ])
        alertController.setValue(customTitle, forKey: "attributedTitle")
        
        // Create custom message
        let customMessage = NSMutableAttributedString(string: "\nChúc mừng bạn đã trúng giải Jackpot với giá trị giải thưởng.\n\n", attributes: [
            NSAttributedStringKey.font: UIFont(name: "Times New Roman", size: 18.0)!,
            NSAttributedStringKey.foregroundColor: UIColor.blue
            ])
        customMessage.append(NSMutableAttributedString(string: "112.000.000.000 VNĐ", attributes: [
            NSAttributedStringKey.font: UIFont(name: "Georgia", size: 14.0)!,
            NSAttributedStringKey.foregroundColor: UIColor.black
            ]))
        alertController.setValue(customMessage, forKey: "attributedMessage")
        
        // Change action title color
        okAction.setValue(UIColor.orange, forKey: "titleTextColor")
        present(alertController, animated: true, completion: nil)
    }
}
