//
//  HomeFlow.swift
//  pract_rxflow
//
//  Created by baegteun on 2021/10/25.
//

import RxFlow

class HomeFlow: Flow{
    var root: Presentable{
        return self.rootViewController
    }
    
    private var rootViewController = UINavigationController()
    
    init() {}
    
    func navigate(to step: Step) -> FlowContributors {
        guard let step = step as? sampleStep else { return .none }
        switch step {
        case .LoginIsRequired:
            return .end(forwardToParentFlowWithStep: sampleStep.LoginIsRequired)
        case .HomeIsRequired:
            return self.navigateToHome()
        }
    }
    
    private func navigateToHome() -> FlowContributors{
        let vc = HomeVC()
        self.rootViewController.setViewControllers([vc], animated: true)
        return .one(flowContributor: .contribute(withNext: vc))
    }
}
