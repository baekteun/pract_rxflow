//
//  HomeVC.swift
//  pract_rxflow
//
//  Created by baegteun on 2021/10/25.
//

import Then
import UIKit
import SnapKit
import RxFlow
import RxSwift
import RxCocoa

class HomeVC: baseVC, Stepper{
    // MARK: - Properties
    var steps = PublishRelay<Step>()
    
    private let logoutBtn = UIButton().then {
        $0.setTitle("Logout", for: .normal)
        $0.setTitleColor(.black, for: .normal)
        $0.titleLabel?.font = .systemFont(ofSize: 20)
    }
    
    // MARK: - Helpers
    override func configureVC() {
        super.configureVC()
        addView()
        setLayout()
    }
    private func addView(){
        [logoutBtn].forEach{view.addSubview($0)}
    }
    private func setLayout(){
        
        logoutBtn.snp.makeConstraints {
            $0.left.right.equalToSuperview().inset(bound.width*0.05)
            $0.bottom.equalToSuperview().inset(bound.height*0.1)
        }
        
    }
    override func bind() {
        logoutBtn.rx.tap
            .subscribe(onNext: {
                self.steps.accept(sampleStep.LoginIsRequired)
            })
            .disposed(by: disposeBag)
    }
}
