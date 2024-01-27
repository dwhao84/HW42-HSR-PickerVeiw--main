//
//  SceneDelegate.swift
//  HW42-HSR(PickerVeiw)
//
//  Created by Dawei Hao on 2023/12/25.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
        window?.rootViewController = createTabBarController()
        self.window?.makeKeyAndVisible()
    }

    func createMyTicketViewController () -> UINavigationController {
        let myTicketVC = MyTicketViewController()
        myTicketVC.tabBarItem = UITabBarItem(title: "我的車票", image: Images.ticket, tag: 1)
        myTicketVC.tabBarItem.badgeColor = Colors.brightGray
        let myTicketNC = UINavigationController(rootViewController: myTicketVC)
        return myTicketNC
    }
    
    func createTicketOrderViewController () -> UINavigationController {
        let ticketVC = TickerOrderViewController()
        ticketVC.tabBarItem = UITabBarItem(title: "訂票", image: Images.seatsIconForTabBar, tag: 2)
        ticketVC.tabBarItem.badgeColor = Colors.brightGray
        let ticketNC = UINavigationController(rootViewController: ticketVC)
        return ticketNC
    }
    
    func createPayAndCollectViewController () -> UINavigationController {
        let payAndCollectTicketVC = PayAndCollectTicketViewController()
        payAndCollectTicketVC.tabBarItem = UITabBarItem(title: "付款/取票", image: Images.payAndLoad, tag: 2)
        payAndCollectTicketVC.tabBarItem.badgeColor = Colors.brightGray
        let payAndCollectTicketNC = UINavigationController(rootViewController: payAndCollectTicketVC)
        return payAndCollectTicketNC
    }
    
    func createLoadReservationViewController () -> UINavigationController {
        let loadReservationVC = LoadReservationViewController()
        loadReservationVC.tabBarItem = UITabBarItem(title: "載入訂位", image: Images.loadReservation, tag: 2)
        loadReservationVC.tabBarItem.badgeColor = Colors.brightGray
        let loadReservationNC = UINavigationController(rootViewController: loadReservationVC)
        return loadReservationNC
    }

    
    func createMoreTableViewController () -> UINavigationController {
        let moreTableVC = MoreTableViewController()
        moreTableVC.tabBarItem = UITabBarItem(title: "其他", image: Images.more, tag: 4)
        moreTableVC.tabBarItem.badgeColor = Colors.brightGray
        let moreTableNC = UINavigationController(rootViewController: moreTableVC)
        return moreTableNC
    }
    
    func createTabBarController () -> UITabBarController {
        let tabBarController = UITabBarController()
        tabBarController.tabBar.barTintColor  = Colors.white
        tabBarController.viewControllers      = [createMyTicketViewController(),
                                                 createTicketOrderViewController(),
                                                 createPayAndCollectViewController(),
                                                 createLoadReservationViewController(),
                                                 createMoreTableViewController()]
        tabBarController.tabBar.tintColor     = Colors.orange
        tabBarController.tabBar.isTranslucent = true
        let standardAppearance = UITabBarAppearance()
        tabBarController.tabBar.standardAppearance = standardAppearance
        tabBarController.tabBar.scrollEdgeAppearance = standardAppearance
        return tabBarController
    }
    
    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }


}
//
//#Preview(
//    UITabBarController(
//)
