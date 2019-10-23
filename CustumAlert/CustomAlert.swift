//
//  CustomAlert.swift
//  CustumAlert
//
//  Created by Apple on 10/23/19.
//  Copyright © 2019 HoangLuyen. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class CustomAlert: UIViewController {
    @IBOutlet weak var tableview: UITableView!
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var heightTableview: NSLayoutConstraint!
    let datas = BehaviorRelay<[Int]>(value: [Int]())
    let dispose = DisposeBag()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let cell = UINib(nibName: "TableViewCell", bundle: nil)
        tableview.register(cell, forCellReuseIdentifier: "Cell")
        datas.bind(to: tableview.rx.items(cellIdentifier: "Cell")) { _, value, cell in
            cell.textLabel?.text = String(value)
        }.disposed(by: dispose)
    }
    
    func updateUI(message: String, items: [Int]) {
        messageLabel.text = message
        datas.accept(items)
        heightTableview.constant = CGFloat(44 * (items.count + 1))
    }

}
