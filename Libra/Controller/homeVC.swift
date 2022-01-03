//
//  homeVC.swift
//  LibraFinalVersion
//
//  Created by Vivaan Baid on 23/10/21.
//

import Foundation
import UIKit

class homeVC: UIViewController{
    
    var appointments_Arr = [appointment(full_name: "Vivaan, cognitive therapy", date: "24th Oct", typeOfTherapist: "Video call"), appointment(full_name: "Vivaan, cognitive therapy", date: "24th Oct", typeOfTherapist: "Video call"), appointment(full_name: "Vivaan, cognitive therapy", date: "24th Oct", typeOfTherapist: "Video call"), appointment(full_name: "Vivaan, cognitive therapy", date: "24th Oct", typeOfTherapist: "Video call"), appointment(full_name: "Vivaan, cognitive therapy", date: "24th Oct", typeOfTherapist: "Video call"), appointment(full_name: "Vivaan, cognitive therapy", date: "24th Oct", typeOfTherapist: "Video call"), appointment(full_name: "Vivaan, cognitive therapy", date: "24th Oct", typeOfTherapist: "Video call"), appointment(full_name: "Vivaan, cognitive therapy", date: "24th Oct", typeOfTherapist: "Video call"), appointment(full_name: "Vivaan, cognitive therapy", date: "24th Oct", typeOfTherapist: "Video call"), appointment(full_name: "Vivaan, cognitive therapy", date: "24th Oct", typeOfTherapist: "Video call"), appointment(full_name: "Vivaan, cognitive therapy", date: "24th Oct", typeOfTherapist: "Video call")]
    
    @IBOutlet weak var UpcomingMeetingsTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UpcomingMeetingsTableView.dataSource = self
        UpcomingMeetingsTableView.delegate = self
        UpcomingMeetingsTableView.separatorStyle = .none
        let nib = UINib(nibName: K.UpcomingTableViewCellIdentifier, bundle: nil)
        UpcomingMeetingsTableView.register(nib, forCellReuseIdentifier: K.UpcomingTableViewCellIdentifier)
    }
}


extension homeVC: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return appointments_Arr.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: K.UpcomingTableViewCellIdentifier) as! UpcomingTableViewCell
        cell.dateLabel.text = appointments_Arr[indexPath.row].date
        cell.Psychologist_name_label.text = appointments_Arr[indexPath.row].full_name
        cell.modeOfSession_Label.text = appointments_Arr[indexPath.row].typeOfTherapist
        return cell
    }
    
    
}

extension homeVC: UITableViewDelegate{
    
    
}
