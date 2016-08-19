//
//  CarModel.swift
//  MVVMProjectNew
//
//  Created by ShrawanKumar Sharma on 18/08/16.
//  Copyright © 2016 ShrawanKumar Sharma. All rights reserved.
//

import Foundation


class CarModel {
    var model :String?
    var make : String?
    var horsePoser : String?
    var photoURL : String?
    var kilowattText:String?
    
    
    init(model:String,make:String,horsePower:String,photoURL:String) {
        self.horsePoser = horsePower
        self.make = make
        self.model = model
       // self.kilowattText = kilowattText
        self.photoURL = photoURL
    }
    
}