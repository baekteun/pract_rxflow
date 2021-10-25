//
//  LoginVC.swift
//  pract_rxflow
//
//  Created by baegteun on 2021/10/25.
//

import UIKit
import RxFlow
import RxSwift
import Then
import SnapKit
import RxCocoa

class LoginVC: baseVC, Stepper{
    // MARK: - Properties
    var steps: PublishRelay<Step> = PublishRelay<Step>()
    
    var initialStep: Step{
        sampleStep.HomeIsRequired
    }
    
    private let loginBtn = UIButton().then {
        $0.setTitle("Login", for: .normal)
        $0.setTitleColor(.black, for: .normal)
        $0.titleLabel?.font = .systemFont(ofSize: 20)
        $0.backgroundColor = .blue
    }
    
    // MARK: - Helpers
    override func configureVC() {
        super.configureVC()
        addView()
        setLayout()
    }
    private func addView(){
        [loginBtn].forEach{view.addSubview($0)}
    }
    private func setLayout(){
        loginBtn.snp.makeConstraints {
            $0.height.equalTo(bound.height*0.1)
            $0.left.right.equalToSuperview().inset(bound.width*0.05)
            $0.bottom.equalToSuperview().inset(bound.height*0.1)
        }
    }
    override func bind() {
        loginBtn.rx.tap
            .subscribe(onNext: {
                self.steps.accept(sampleStep.HomeIsRequired)
            })
            .disposed(by: disposeBag)
    }
}
