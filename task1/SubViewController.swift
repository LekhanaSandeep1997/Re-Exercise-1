//
//  SubViewController.swift
//  task1
//
//  Created by Lekhana on 12/10/22.
//

import UIKit

class SubViewController: UIViewController {
    
    let textField : UITextField = {
        let text = UITextField()
        text.borderStyle = .roundedRect
        return text
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .blue
        
        self.view.addSubview(textField)
        
        setupUI()
    }
    
    func setupUI(){
        textField.snp.makeConstraints {make in
            make.top.equalToSuperview().offset(100)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.height.equalTo(50)
        }
    }
}
