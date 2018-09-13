//
//  ViewController.swift
//  AppWithoutInterfaceBuilder
//
//  Created by Bassuni on 9/6/18.
//  Copyright © 2018 Bassuni. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    var mainView : MainView { return self.view as! MainView }
    var like = false ;
    override func viewDidLoad() {
        super.viewDidLoad()
        self.mainView.likeAction =
            {
                [weak self] in
                guard let strongRef = self  else {  return  }
                strongRef.like = !strongRef.like
                if(strongRef.like)
                {
                    UIView.animate(withDuration: 0.5, animations: {
                         strongRef.mainView.likeButton.setTitle("unLike", for: .normal)
                         strongRef.mainView.contentView.backgroundColor = UIColor.red.withAlphaComponent(0.5)
                        })
                }
                else
                {
                    UIView.animate(withDuration: 0.5, animations: {
                        strongRef.mainView.likeButton.setTitle("Like", for: .normal)
                        strongRef.mainView.contentView.backgroundColor = .clear
                    })
                }
               
           }
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func loadView() {
        self.view = MainView(frame: UIScreen.main.bounds)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


