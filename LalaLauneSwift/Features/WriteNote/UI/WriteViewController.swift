//
//  WriteViewController.swift
//  LalaLauneSwift
//
//  Created by Thais Aquino on 9/10/2023.
//

import Foundation
import UIKit

class WriteViewController: UIViewController {
    var note: Note?
    @IBOutlet weak var titleView: UITextView!
    @IBOutlet weak var descriptionView: UITextView!
    
    override func viewDidLoad() {
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .done, target: self, action: #selector(save))
    }
    
    @objc func save() {
        print("here should save")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        guard let note = self.note
        else { return }
        
        print("\(note.title)")

        titleView.text = note.title
        descriptionView.text = note.description
    }
    
    func setNote(note: Note?) {
        self.note = note
    }
}
