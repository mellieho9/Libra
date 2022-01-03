//
//  video_call_vc.swift
//  LibraFinalVersion
//
//  Created by Vivaan Baid on 24/10/21.
//

import Foundation
import UIKit
class video_call_vc: UIViewController{
    
    @IBAction func book_pressed(_ sender: Any) {
        let myalert = UIAlertController(title: "Success!", message: "Your zoom link will be emailed to you!", preferredStyle: .alert)
        let myaction = UIAlertAction(title: "Okay", style: .cancel) { myac in
            myalert.dismiss(animated: true, completion: nil)
            self.dismiss(animated: true, completion: nil)
        }
        myalert.addAction(myaction)
        present(myalert, animated: true, completion: nil)
    }
    
    
    @IBOutlet weak var booked_outlet: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        booked_outlet.layer.cornerRadius = 15.0
    }
}
