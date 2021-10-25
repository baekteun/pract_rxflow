//
//  AppFlow.swift
//  pract_rxflow
//
//  Created by baegteun on 2021/10/25.
//

import RxFlow

class AppFlow: Flow{
    var window: UIWindow
    
    var root: Presentable{
        return self.window
    }
    
    init(window: UIWindow){
        self.window = window
    }
    
    func navigate(to step: Step) -> FlowContributors {
        guard let step = step as? sampleStep { return.none }
        
    }
}
