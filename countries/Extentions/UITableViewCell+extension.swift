//
//  UITableViewCell+extension.swift
//  countries
//
//  Created by Bahadır Kişisel on 29.05.2022.
//

import UIKit

protocol ReusableCell: AnyObject {
    static var reuseIdentifier: String { get }
    static var nib: UINib { get }
}

extension ReusableCell where Self: UITableViewCell {
    static var reuseIdentifier: String { String(describing: self) }
    static var nib: UINib { UINib(nibName: String(describing: self), bundle: nil) }
}

protocol CellTapConfigurable: AnyObject {
    var tapHandler: (() -> ())? { get set }
}

extension UITableViewCell: ReusableCell {}

extension UITableView {
    func register<C: ReusableCell>(cell: C.Type) {
        self.register(C.nib, forCellReuseIdentifier: C.reuseIdentifier)
    }
    
    func dequeue<C: ReusableCell>(cell: C.Type, for indexPath: IndexPath) -> C {
        self.dequeueReusableCell(withIdentifier: C.reuseIdentifier, for: indexPath) as! C
    }
}
