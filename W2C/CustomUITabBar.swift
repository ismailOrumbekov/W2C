import UIKit

class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        generateTabBar()
        setTabBarAppearance()
    }
    
    private func generateTabBar() {
        viewControllers = [
            generateVC(
                viewController: ApartmentsViewController(),
                title: "Home",
                image: UIImage(named: "homeIcon")
            ),
            generateVC(
                viewController: RoommatesViewController(),
                title: "RoomatesIcon",
                image: UIImage(named: "roomatesIcon")
            ),
            generateVC(
                viewController: DialogsViewController(),
                title: "Чаты",
                image: UIImage(named: "chatsIcon")),
            generateVC(
                viewController: EventsPageViewController(),
                title: "Events",
                image: UIImage(named: "eventsIcon")),
            generateVC(
                viewController: ProfilePageViewController(),
                title: "Profile",
                image: UIImage(named: "profileIcon")
            )
        ]
    }
    
    private func generateVC(viewController: UIViewController, title: String, image: UIImage?) -> UIViewController {
        viewController.tabBarItem.title = title
        viewController.tabBarItem.image = image
        return viewController
    }
    
    private func setTabBarAppearance() {
        let positionOnX: CGFloat = 10
        let positionOnY: CGFloat = 14
        let width = tabBar.bounds.width - positionOnX * 2
        let height = tabBar.bounds.height + positionOnY * 2
        
        let roundLayer = CAShapeLayer()
        
        let bezierPath = UIBezierPath(
            roundedRect: CGRect(
                x: positionOnX,
                y: tabBar.bounds.minY - positionOnY,
                width: width,
                height: height
            ),
            cornerRadius: height / 2
        )
        
        roundLayer.path = bezierPath.cgPath
        
        tabBar.layer.insertSublayer(roundLayer, at: 0)
        
        tabBar.itemWidth = width / 5
        tabBar.itemPositioning = .centered
        
        roundLayer.fillColor = UIColor(named: "mainRed")?.cgColor
        
        tabBar.tintColor = .tertiarySystemFill
        tabBar.unselectedItemTintColor = .white
    }
}
