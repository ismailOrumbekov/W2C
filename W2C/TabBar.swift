//
//  TabBar.swift
//  W2C
//
//  Created by Ismail Orumbekov on 18.10.2023.
//
//
//import Foundation
//import UIKit
//
//class TabBarController: UITabBarController {
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        // Создаем экземпляры ваших вью-контроллеров
//        let viewController1 = ProfilePageViewController()
//        let viewController2 = ApartmentsViewController()
//        
//
//        // Создаем навигационные контроллеры для ваших вью-контроллеров
//        let navController1 = UINavigationController(rootViewController: viewController1)
//        let navController2 = UINavigationController(rootViewController: viewController2)
//        let navController3 = UINavigationController(rootViewController: viewController3)
//
//        // Устанавливаем ваши вью-контроллеры как вкладки
//        self.viewControllers = [navController1, navController2, navController3]
//
//        // Опционально, устанавливаем цвет фона навигационного бара
//        UINavigationBar.appearance().barTintColor = .yourCustomColor
//
//        // Опционально, устанавливаем цвет текста навигационного бара
//        UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
//
//        // Опционально, устанавливаем цвет иконок и текста на вкладках
//        self.tabBar.tintColor = .yourCustomColor
//    }
//}
//
//@main
//struct YourApp: App {
//    var body: some Scene {
//        WindowGroup {
//            TabBarController()
//        }
//    }
//}
//
//UIApplicationMain(CommandLine.argc, CommandLine.unsafeArgv, nil, NSStringFromClass(AppDelegate.self))
