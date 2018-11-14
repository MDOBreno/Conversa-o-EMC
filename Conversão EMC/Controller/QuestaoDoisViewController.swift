//
//  QuestaoDoisViewController.swift
//  Conversão EMC
//
//  Created by Breno Medeiros on 12/11/18.
//  Copyright © 2018 ProgramasBMO. All rights reserved.
//

import UIKit

class QuestaoDoisViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.hideKeyboardWhenTappedAround()
    }
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    @objc func dismissKeyboard() {
        self.view.endEditing(true)
    }
    
    @IBOutlet weak var swCC: UISwitch!
    @IBOutlet weak var tfTensao: UITextField!
    @IBOutlet weak var tfPotencia: UITextField!
    @IBOutlet weak var tfCorrente: UITextField!
    
    var Rc = Float()
    var Rxm = Float()
    
    @IBAction func Calcular(_ sender: UIButton) {
        if let T = Float(tfTensao.text!),
            let P = Float(tfPotencia.text!),
           let I = Float(tfCorrente.text!) {
            
            var Ixm = Float()
            if swCC.isOn {
                Rc = P / pow(I,2)
                Rxm = sqrt( pow((T/I),2) - powf(Rc,2) )
            } else {
                Rc = pow(T,2) / P
                Ixm = sqrt( powf(I,2) - powf((T/Rc), 2) )
                Rxm = (-T) / Ixm
            }
            performSegue(withIdentifier: "questaoDoisResViewController", sender: nil)
            
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! QuestaoDoisResViewController
        
        if swCC.isOn {
            vc.r = "Req"
            vc.x = "Xeq"
        } else {
            vc.r = "Rc"
            vc.x = "Xm"
        }
        vc.rc = NSString(format: "%.2f", Rc) as String
        vc.xm = NSString(format: "%.2f", Rxm) as String
        
        
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
