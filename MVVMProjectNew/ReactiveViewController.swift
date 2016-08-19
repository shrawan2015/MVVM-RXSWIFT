//
//  ReactiveViewController.swift
//  MVVMProjectNew
//
//  Created by ShrawanKumar Sharma on 19/08/16.
//  Copyright © 2016 ShrawanKumar Sharma. All rights reserved.
//

import UIKit

import RxSwift
import RxCocoa

class ReactiveViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    let disposeBag = DisposeBag()
    var carViewModel: CarViewModel?
    var cars: Variable<[CarViewModel]> = Variable((UIApplication.sharedApplication().delegate as! AppDelegate).cars)
    
    override func viewDidLoad() {
        super.viewDidLoad()

      
        
        tableView.estimatedRowHeight = 100

        
        cars.asObservable().bindTo(tableView.rx_itemsWithCellIdentifier("ReactiveCell", cellType: ReactiveCell.self)) { (index, carViewModel: CarViewModel, cell) in
            
            cell.carViewModel = carViewModel
            
            }.addDisposableTo(disposeBag)
        
        
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
