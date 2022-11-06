//
//  ViewController.swift
//  task1
//
//  Created by Lekhana on 10/29/22.
//

import SnapKit
import UIKit

class DetailViewController: UIViewController {
    
    var view1 : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .red
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
        view.addSubview(view1)
        setupConstraints()
    }
    
    func setupConstraints(){
        view1.snp.makeConstraints { make in
            make.leading.equalTo(view.snp_leadingMargin).offset(20)
            make.trailing.equalTo(view.snp_trailingMargin).offset(-20)
            make.top.equalTo(view.snp_topMargin).offset(20)
            make.bottom.equalTo(view.snp_bottomMargin).offset(-20)
        }
    }


}

