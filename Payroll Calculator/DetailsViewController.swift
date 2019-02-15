//
//  DetailsViewController.swift
//  Payroll Calculator
//
//  Created by student19 on 2/9/19.
//  Copyright © 2019 Jose Alvarez. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {
    
    var titleText = String()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let titleTextValue = titleText
        
        if (titleTextValue.count > 1) {
            print(titleTextValue)
        }
        
        
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("DetailsViewController loaded!")

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
