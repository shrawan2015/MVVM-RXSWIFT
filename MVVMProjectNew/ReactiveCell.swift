//
//  ReactiveCell.swift
//  MVVMProjectNew
//
//  Created by ShrawanKumar Sharma on 19/08/16.
//  Copyright © 2016 ShrawanKumar Sharma. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa


class ReactiveCell: UITableViewCell {
  
    @IBOutlet weak var descriptionNaem: UILabel!
    @IBOutlet weak var titleName: UILabel!
    @IBOutlet weak var imageOutlet: UIImageView!
    let disposeBag = DisposeBag()
   
    var carViewModel: CarViewModel?{
        didSet {
            guard let cvm = carViewModel else {
                return
            }
            
    
            cvm.titleText.bindTo(titleName.rx_text).addDisposableTo(self.disposeBag)
            cvm.horsepowerText.bindTo(descriptionNaem.rx_text).addDisposableTo(self.disposeBag)
            
       
            guard let photoURL = cvm.photoURL else {
                return
            }
            
            
            NSURLSession.sharedSession().rx_data(NSURLRequest(URL: photoURL)).subscribeNext({ (data) in
                dispatch_async(dispatch_get_main_queue(), {
                    self.imageOutlet.image = UIImage(data: data)
                    self.imageOutlet.setNeedsLayout()
                })
            }).addDisposableTo(self.disposeBag)

        
        
        }}
    
    
  
    
            
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
