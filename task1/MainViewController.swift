//
//  MainViewController.swift
//  task1
//
//  Created by Lekhana on 12/10/22.
//

import UIKit

class MainViewController: UIViewController {
    
    let button : UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("Go to Next", for: .normal)
        return btn
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemTeal
        setupUI()
        
        button.addTarget(self, action: #selector(getNextAction), for: .touchUpInside)
//        button.titleLabel?.textColor = .red
        
    }
    
    //objective c function ( if we use #selector for data transfer we should
    //use objc
    @objc func getNextAction(){
        navigationController?.pushViewController(SubViewController(), animated: true)
    }
    
    func setupUI(){
        self.view.addSubview(button)
        button.snp.makeConstraints {make in
            make.leading.equalToSuperview().offset(20)
            make.bottom.equalToSuperview().offset(-100)
            make.trailing.equalToSuperview().offset(-20)
            make.height.equalTo(60)
        }
    }
    

}
