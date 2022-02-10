//
//  ViewController.swift
//  TabmanPlayground
//
//  Created by Daichi Hayashi on 2022/02/10.
//

import UIKit
import Tabman
import Pageboy

class ViewController: TabmanViewController {

    private var childLeft: UIViewController {
        let vc = UIViewController()
        vc.view.backgroundColor = .orange.withAlphaComponent(0.3)
        return vc
    }

    private var childRight: UIViewController {
        let vc = UIViewController()
        vc.view.backgroundColor = .brown.withAlphaComponent(0.3)
        return vc
    }

    private lazy var viewControllers: [UIViewController] = [childLeft, childRight]

    override func viewDidLoad() {
        super.viewDidLoad()

        dataSource = self

        let bar = TMBar.ButtonBar()
        bar.layout.transitionStyle = .snap
        bar.layout.contentMode = .fit
        bar.indicator.tintColor = .orange

        bar.buttons.customize { button in
            button.tintColor = .gray
            button.selectedTintColor = .orange
        }

        addBar(bar, dataSource: self, at: .top)
    }
}

extension ViewController: PageboyViewControllerDataSource, TMBarDataSource {

    func numberOfViewControllers(in pageboyViewController: PageboyViewController) -> Int {
        return viewControllers.count
    }

    func viewController(for pageboyViewController: PageboyViewController,
                        at index: PageboyViewController.PageIndex) -> UIViewController? {
        return viewControllers[index]
    }

    func defaultPage(for pageboyViewController: PageboyViewController) -> PageboyViewController.Page? {
        return nil
    }

    func barItem(for bar: TMBar, at index: Int) -> TMBarItemable {
        let title = "Page \(index)"
        return TMBarItem(title: title)
    }
}

