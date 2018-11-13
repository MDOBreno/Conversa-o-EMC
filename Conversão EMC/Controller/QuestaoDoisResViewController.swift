//
//  QuestaoDoisResViewController.swift
//  Conversão EMC
//
//  Created by Breno Medeiros on 12/11/18.
//  Copyright © 2018 ProgramasBMO. All rights reserved.
//

import UIKit

class QuestaoDoisResViewController: UIViewController {

    @IBOutlet weak var tfRc: UITextField!
    @IBOutlet weak var tfXm: UITextField!
    @IBOutlet weak var lbR: UILabel!
    @IBOutlet weak var lbX: UILabel!
    
    var rc = String()
    var r = String()
    var xm = String()
    var x = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tfRc.text = rc
        lbR.text = r
        tfXm.text = xm
        lbX.text = x
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
