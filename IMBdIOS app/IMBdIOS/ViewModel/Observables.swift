//
//  Observables.swift
//  IMBdIOS
//
//  Created by ChethanBhandarkar on 03/08/21.
//

import Foundation


class Observable<T>{
    
    init(_ v :T?){
        if v != nil{
            value = v!
        }
        else{
            value = nil
        }
        
    }
    var value: T?{
        
        didSet{
            
            if value != nil{
                bind(value!)
            }
            else{
                print("nil")
            }
           
        }
    }
    
    var bind: ((T) -> Void) = { _ in }
    
    
    
    func bindVC(_ closure: @escaping (T) -> Void) {
        bind = closure
    }
    
    
    
    
    
    
    
}







