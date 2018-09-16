//
//  UIViewController+Extensions.swift
//  MMExtensions
//
//  Created by Muthuraj Muthulingam.
//

import Foundation

public typealias MMAlertBlock = (_ action: UIAlertAction) -> Void
public typealias MMAlertCompletion = () -> Void

// MARK: - UIAlert Rules
public protocol MMUIAlertRules {
    var title: String { get set }
    var message: String { get set }
    var cancelButtonTitle: String { get set }
    var cancelButtonAction: MMAlertBlock? { get set }
    var completionBlock: MMAlertCompletion? { get set }
}

public struct MMUIAlert: MMUIAlertRules {
    public var title: String
    public var message: String
    public var cancelButtonTitle: String
    public var cancelButtonAction: MMAlertBlock?
    public var completionBlock: MMAlertCompletion?
    
    public init(title: String, message: String, cancelButtonTitle: String, cancelButtonAction: MMAlertBlock? = nil, completionBlock: MMAlertCompletion? = nil) {
        self.title = title
        self.message = message
        self.cancelButtonTitle = cancelButtonTitle
        self.cancelButtonAction = cancelButtonAction
        self.completionBlock = completionBlock
    }
}

public protocol MMUIDialogAlertRules: MMUIAlertRules {
    var okButtonTitle: String { get set }
    var okButtonAction: MMAlertBlock? { get set }
}

public struct MMUIDialogAlert: MMUIDialogAlertRules {
    public var okButtonTitle: String
    public var okButtonAction: MMAlertBlock?
    public var title: String
    public var message: String
    public var cancelButtonTitle: String
    public var cancelButtonAction: MMAlertBlock?
    public var completionBlock: MMAlertCompletion?
    
    public init(title: String, message: String, cancelButtonTitle: String, okButtonTitle: String, okButtonAction: MMAlertBlock? = nil, cancelButtonAction: MMAlertBlock? = nil, completionBlock: MMAlertCompletion? = nil) {
        self.title = title
        self.message = message
        self.cancelButtonTitle = cancelButtonTitle
        self.cancelButtonAction = cancelButtonAction
        self.completionBlock = completionBlock
        self.okButtonTitle = okButtonTitle
        self.okButtonAction = okButtonAction
    }
}

public protocol MMAlertRules {
    func showAlert(using alertInfo: MMUIAlert)
    func showDiologAlert(using dialogAlertInfo: MMUIDialogAlert)
}

extension MMAlertRules where Self: UIViewController {
    public func showAlert(using alertInfo: MMUIAlert) {
        let alert = UIAlertController(title: alertInfo.title, message: alertInfo.message, preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: alertInfo.cancelButtonTitle, style: .cancel, handler: alertInfo.cancelButtonAction)
        alert.addAction(cancelAction)
        self.present(alert, animated: true, completion: alertInfo.completionBlock)
    }
    
    public func showDiologAlert(using dialogAlert: MMUIDialogAlert) {
        let alert = UIAlertController(title: dialogAlert.title, message: dialogAlert.message, preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: dialogAlert.cancelButtonTitle, style: .cancel, handler: dialogAlert.cancelButtonAction)
        alert.addAction(cancelAction)
        let okAction = UIAlertAction(title: dialogAlert.okButtonTitle, style: .default, handler: dialogAlert.okButtonAction)
        alert.addAction(okAction)
        self.present(alert, animated: true, completion: dialogAlert.completionBlock)
    }
}

extension UIViewController: MMAlertRules {
    // default implementation available in protocol extension
}
