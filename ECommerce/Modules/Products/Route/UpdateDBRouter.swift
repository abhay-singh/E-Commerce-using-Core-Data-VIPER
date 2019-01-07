//
//  UpdateDBRouter.swift
//  ECommerce
//
//  Created by Abhay Singh Naurang on 05/01/19.
//  Copyright © 2019 Abhay Singh Naurang. All rights reserved.
//

import Foundation
import UIKit

class UdapteDBRouter: PresenterToRouterProtocol {

    static var mainstoryboard: UIStoryboard{
        return UIStoryboard(name:"Main",bundle: Bundle.main)
    }

    static func createModule() -> UIViewController {
        let view = mainstoryboard.instantiateViewController(withIdentifier: "UpdateLocalDBViewController") as!UpdateLocalDataViewController
        let presenter: ViewToPresenterProtocol & InteractorToPresenterProtocol = UpdateLocalDBPresenter()
        let interactor: PresenterToInteractorProtocol = UpdateLocalDBInteractor()
        let router:PresenterToRouterProtocol = UdapteDBRouter()

        view.presentor = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter

        return view
    }

    func pushToProductScreen(navigationConroller: UINavigationController) {
        let productModule = ProductRouter.createModule()
        let nav = UINavigationController()
        nav.viewControllers = [productModule]
        DispatchQueue.main.async {
        UIApplication.shared.keyWindow!.replaceRootViewControllerWith(nav, animated: true, completion: nil)
        }

    }

}
extension UIView {
    func snapshot() -> UIImage {
        UIGraphicsBeginImageContextWithOptions(bounds.size, false, UIScreen.main.scale)
        drawHierarchy(in: bounds, afterScreenUpdates: true)
        let result = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return result!
    }
}

extension UIWindow {
    func replaceRootViewControllerWith(_ replacementController: UIViewController, animated: Bool, completion: (() -> Void)?) {
        let snapshotImageView = UIImageView(image: self.snapshot())
        self.addSubview(snapshotImageView)

        let dismissCompletion = { () -> Void in // dismiss all modal view controllers
            self.rootViewController = replacementController
            self.bringSubviewToFront(snapshotImageView)
            if animated {
                UIView.animate(withDuration: 0.4, animations: { () -> Void in
                    snapshotImageView.alpha = 0
                }, completion: { (success) -> Void in
                    snapshotImageView.removeFromSuperview()
                    completion?()
                })
            }
            else {
                snapshotImageView.removeFromSuperview()
                completion?()
            }
        }
        if self.rootViewController!.presentedViewController != nil {
            self.rootViewController!.dismiss(animated: false, completion: dismissCompletion)
        }
        else {
            dismissCompletion()
        }
    }
}
