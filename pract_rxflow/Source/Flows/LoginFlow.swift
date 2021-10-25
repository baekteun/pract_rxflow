//
//  LoginFlow.swift
//  pract_rxflow
//
//  Created by baegteun on 2021/10/25.
//

import RxFlow

class LoginFlow: Flow{
    var root: Presentable{
        self.rootViewController
    }
    
    private var rootViewController = UINavigationController()
    
    init() {}
    
    func navigate(to step: Step) -> FlowContributors {
        guard let step = step as? sampleStep else { return.none }
        switch step {
        case .LoginIsRequired:
            return self.navigateToLogin()
        case .HomeIsRequired:
            return .end(forwardToParentFlowWithStep: sampleStep.HomeIsRequired)
        }
    }
    
    private func navigateToLogin() -> FlowContributors{
        let vc = LoginVC()
        self.rootViewController.setViewControllers([vc], animated: true)
        return .one(flowContributor: .contribute(withNext: vc))
    }
}

