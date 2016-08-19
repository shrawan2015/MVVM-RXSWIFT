//
//  CarViewModel.swift
//  MVVMProjectNew
//
//  Created by ShrawanKumar Sharma on 18/08/16.
//  Copyright © 2016 ShrawanKumar Sharma. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

class CarViewModel {
    
    private var car:CarModel?



///NoN reactive Code
//
//    
//    var modelText: NSString? {
//        return car?.model
//    }
//    var makeText:NSString? {
//        return car?.make
//    }
//    var horsePowerText:NSString? {
//        return car?.horsePoser
//    }
//    var titleText:NSString? {
//        
//        guard let make = car?.make, model = car?.model else {
//            return nil
//        }
//        return "\(make) \(model)"
//    }
//    var photoURL:NSURL? {
//        
//        guard let photo = car?.photoURL else {
//            return nil
//        }
//        
//        return photo
//    }
//    
//    init(car:CarModel) {
//        self.car = car
//    }
    
    
        let disposeBag = DisposeBag()
        var makeText : BehaviorSubject<String>
        var modelText : BehaviorSubject<String>

        var horsepowerText : BehaviorSubject<String>
        var titleText : BehaviorSubject<String>
      //var  photoURL : BehaviorSubject<String>
        var kilowattText: BehaviorSubject<String>

        var photoURL: NSURL? {
            return NSURL(string: car!.photoURL!)
        }
    
    
    init(car:CarModel) {
        self.car = car
        
        
        modelText = BehaviorSubject<String>(value: car.model! )
        modelText.subscribeNext{ model in
            
            car.model = model
            
        }.addDisposableTo(disposeBag)
        
    
         makeText = BehaviorSubject<String> (value : car.make!)
         makeText.subscribeNext{
            make in
            car.make = make
        }
        
        
//         photoURL = BehaviorSubject<NSURL>(value : car.photoURL)
//        photoURL.subscribeNext{
//            photoURL  in
//            car.photoURL = photoURL
//        }
        
         titleText = BehaviorSubject (value : "\(car.model) \(car.make)")
        [makeText,modelText].combineLatest{ (carInfo) -> String in
            return "\(carInfo[0]) \(carInfo[1])"
        }.bindTo(titleText).addDisposableTo(disposeBag)
   
    
        horsepowerText = BehaviorSubject(value: "0")
        kilowattText = BehaviorSubject(value: String(car.kilowattText))
        kilowattText.map({ (kilowatts) -> String in
            let kw = Int(kilowatts) ?? 0
            let horsepower = max(Int(round(Double(kw) * 5)), 0)
            return "\(horsepower) HP"
        }).bindTo(horsepowerText).addDisposableTo(disposeBag)
        
    
    
    
}

}