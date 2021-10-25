//
//  AppStepper.swift
//  pract_rxflow
//
//  Created by baegteun on 2021/10/25.
//

import RxFlow
import RxSwift
import RxCocoa
class AppStepper: Stepper{
    let steps: PublishRelay<Step> = PublishRelay<Step>()
    private let disposeBag: DisposeBag = .init()
    init(){}
    var initialStep: Step{
        return sampleStep.LoginIsRequired
    }
}
