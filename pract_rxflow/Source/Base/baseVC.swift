//
//  baseVC.swift
//  pract_rxflow
//
//  Created by baegteun on 2021/10/25.
//

import UIKit
import RxSwift


class baseVC: UIViewController{
    // MARK: - Properties
    let bound = UIScreen.main.bounds
    let disposeBag: DisposeBag = .init()
    
    // MARK: - Lifecycle
    @available(*, unavailable)
    override func viewDidLoad() {
        super.viewDidLoad()
        configureVC()
    }
    // MAKR: - Helpers
    func configureVC(){view.backgroundColor = .white; bind()}
    func bind(){}
}
