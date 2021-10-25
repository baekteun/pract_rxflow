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
        guard let step = step as? sampleStep else { return.none }
        switch step {
        case .LoginIsRequired:
            return self.navigateToLogin()
        case .HomeIsRequired:
            return self.navigatToHome()
        }
    }
    
    private func navigateToLogin() -> FlowContributors{
        let flow = LoginFlow()
        Flows.use(flow, when: .created) { root in
            self.window.rootViewController = root
        }
        return .one(flowContributor: .contribute(withNextPresentable: flow, withNextStepper: OneStepper(withSingleStep: sampleStep.LoginIsRequired)))
    }
    
    private func navigatToHome() -> FlowContributors{
        let flow = HomeFlow()
        Flows.use(flow, when: .created) { root in
            self.window.rootViewController = root
        }
        return .one(flowContributor: .contribute(withNextPresentable: flow, withNextStepper: OneStepper(withSingleStep: sampleStep.HomeIsRequired)))
    }
}
