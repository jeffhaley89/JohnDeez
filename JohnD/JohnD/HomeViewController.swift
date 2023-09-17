//
//  HomeViewController.swift
//  JohnD
//
//  Created by Jeff Haley on 9/16/23.
//

import UIKit

class HomeViewController: UIViewController {
    var rootView: HomeView?
    var viewModel = HomeViewModel()

    override func loadView() {
        rootView = HomeView(delegate: self)
        view = rootView
    }
}

extension HomeViewController: HomeViewDelegate {
    func buttonTapped() {
        rootView?.backgroundColor = viewModel.getRandomColor()
    }
}
