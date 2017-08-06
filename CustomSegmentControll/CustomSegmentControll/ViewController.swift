//
//  ViewController.swift
//  CustomSegmentControll
//
//  Created by sreekanth reddy iragam reddy on 8/5/17.
//  Copyright © 2017 com.sree.objc. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

   
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func customSegment(_ sender: CustomSegmentControll) {
        print("the selected index is")
        print(sender.selectedIndex)
    }

}

