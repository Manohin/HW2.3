//
//  SceneDelegate.swift
//  HW2.3
//
//  Created by Alexey Manokhin on 16.11.2023.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        let window = UIWindow(windowScene: windowScene)
        let viewController = MainViewController()
        
        window.rootViewController = viewController
        window.makeKeyAndVisible()
        
        self.window = window
        
    }

}

