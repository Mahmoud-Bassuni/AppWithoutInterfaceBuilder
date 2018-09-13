//
//  MainView.swift
//  AppWithoutInterfaceBuilder
//
//  Created by Bassuni on 9/7/18.
//  Copyright © 2018 Bassuni. All rights reserved.
//

import UIKit

class MainView: UIView {
    
    var likeAction : (() -> Void)?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView();
        setupConstrains();
        addFanctions();
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addFanctions()  {
        self.likeButton.addTarget(self, action: #selector(self.onLikeButton), for: .touchUpInside)
    }
    @objc func onLikeButton()
    {
        likeAction?()
    }
    
    
    
    func setupConstrains() {
        setupContentViewConstraint()
        extractedFunc()
    }
    
    fileprivate func setupContentViewConstraint() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10).isActive = true
        self.contentView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -10).isActive = true
        self.contentView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
        self.contentView.bottomAnchor.constraint(equalTo: self.centerYAnchor, constant:0).isActive = true
    }
    
    fileprivate func extractedFunc() {
        self.likeButton.translatesAutoresizingMaskIntoConstraints = false
        self.likeButton.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 0).isActive = true
        self.likeButton.topAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: 10).isActive = true
    }
    
    func setupView() {
        
        self.backgroundColor = .white
        self.addSubview(contentView)
        self.addSubview(likeButton)
        
    }
    let contentView : UIView  =
    {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 100));
        view.layer.borderWidth = 1.0
        view.layer.borderColor = UIColor.gray.cgColor
        return view;
    }()
    
    var likeButton : UIButton =
    {
        let button = UIButton(type: .system)
        button.setTitle("Like", for: .normal)
        return button;
    }()
    
    
    
}
