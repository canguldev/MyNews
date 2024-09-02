//
//  SplashScreen.swift
//  MyNews
//
//  Created by Can Gül on 2.09.2024.
//

import UIKit

class SplashScreen: UIViewController {

    //MARK: - UI Elements
    private lazy var splashScreenBackground: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "splashScreenBackground")
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        return image
    }()
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        splashScreenDelay()
    }
    
    //MARK: - Helper Functions
    private func setupUI() {
        view.backgroundColor = .systemBackground
        view.addSubview(splashScreenBackground)
        splashScreenBackground.anchorFromExt(top: view.topAnchor, left: view.leftAnchor, right: view.rightAnchor, bottom: view.bottomAnchor)
    }
    
    private func splashScreenDelay() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.8) {
            self.navigateToHomePage()
        }
    }
    
    private func navigateToHomePage() {
        let destinationVC = HomePageVC()
        destinationVC.modalTransitionStyle = .flipHorizontal
        destinationVC.modalPresentationStyle = .fullScreen
        navigationController?.pushViewController(destinationVC, animated: true)
    }
}
