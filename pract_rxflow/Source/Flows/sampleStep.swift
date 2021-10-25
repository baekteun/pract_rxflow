//
//  sampleStep.swift
//  pract_rxflow
//
//  Created by baegteun on 2021/10/25.
//

import RxFlow

enum sampleStep: Step{
    // Login
    case loginIsRequired
    case userIsLogged
    
    // OnBoarding
    case onBoardingIsRequired
    case onBoardingIsComplete
    
    // Home
    case dashBoardIsRequired
    
    // Movies
    case moviesAreRequired
    case movieIsPicked (withId: Int)
    case castIsPicked (withId: Int)
    
    // Settings
    case SettingsAreRequired
    case SettingsAreComplete
}
