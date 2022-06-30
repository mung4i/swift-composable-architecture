import SwiftUI

public struct NavigationBarAccessor: UIViewControllerRepresentable {
    public init(callback: @escaping (UINavigationBar?) -> Void) {
        self.callback = callback
    }
    
    var callback: (UINavigationBar?) -> Void
    private let proxyController = ViewController()

    public func makeUIViewController(context: UIViewControllerRepresentableContext<NavigationBarAccessor>) -> UIViewController {
        proxyController.callback = callback
        return proxyController
    }

    public func updateUIViewController(_ uiViewController: UIViewController, context: UIViewControllerRepresentableContext<NavigationBarAccessor>) {}

    public typealias UIViewControllerType = UIViewController

    private class ViewController: UIViewController {
        var callback: (UINavigationBar?) -> Void = { _ in }

        override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            callback(navigationController?.navigationBar)
        }
    }
}
