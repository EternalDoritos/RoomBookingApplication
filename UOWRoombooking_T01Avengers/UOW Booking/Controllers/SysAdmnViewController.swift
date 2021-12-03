//
//  SysAdmnViewController.swift
//  UOW Booking
//
//  Created by Elroy C. on 30/10/21.
//

import UIKit
import SwiftUI
class SysAdmnViewController: UIViewController {
    
    let contentView = UIHostingController(rootView: MainStudentConentView())
    // we will use the rootView to access MainContentView for Staff.
    // we will use the rootBiew to access MainSysAdmContentView for SysAdmn
    // we will use the rootView to access MainStudentConentView for Student
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        addChild(contentView)
        view.addSubview(contentView.view)
        setupConstraints()
    }
    
    fileprivate func setupConstraints() {
        contentView.view.translatesAutoresizingMaskIntoConstraints = false
        contentView.view.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        contentView.view.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        contentView.view.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        contentView.view.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
    }
}
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


