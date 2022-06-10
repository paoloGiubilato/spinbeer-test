//
//  BaseViewController.swift
//  spinbeer
//
//  Created by Paolo Giubilato on 09/06/22.
//

import UIKit

class BaseViewController<VM>: UIViewController {

    var vm: VM
    
    required init(viewModel: VM) {
        self.vm = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("let's use init with presenter")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        buildUI()
    }
    
    func buildUI() {}
}
