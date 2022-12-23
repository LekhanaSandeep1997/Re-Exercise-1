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
    
    let vc = SubViewController()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemTeal
        setupUI()
        
        button.addTarget(self, action: #selector(getNextAction), for: .touchUpInside)
//        button.titleLabel?.textColor = .red
        vc.delegate = self
        
    }
    
    //objective c function ( if we use #selector for data transfer we should
    //use objc
    @objc func getNextAction(){
        navigationController?.pushViewController(vc, animated: true)
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

extension MainViewController : UpdateTextDelegate{
    func updateText(text: String) {
        print(text)
    }
}
