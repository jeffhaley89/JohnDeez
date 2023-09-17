//
//  HomeViewModel.swift
//  JohnD
//
//  Created by Jeff Haley on 9/17/23.
//

import UIKit

protocol HomeViewModelLogic {
    func getRandomColor() -> UIColor
}

class HomeViewModel: HomeViewModelLogic {
    let range = 0...255

    func getRandomColor() -> UIColor {
        UIColor(
            red: getRandomNumber() / 255,
            green: getRandomNumber() / 255,
            blue: getRandomNumber() / 255,
            alpha: 1)
    }
}

extension HomeViewModel {
    func getRandomNumber() -> CGFloat {
        CGFloat(range.randomElement() ?? 0)
    }
}
