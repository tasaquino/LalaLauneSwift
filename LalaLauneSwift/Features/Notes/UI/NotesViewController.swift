//
//  NotesViewController.swift
//  LalaLauneSwift
//
//  Created by Thais Aquino on 9/10/2023.
//

import Foundation
import UIKit

class NotesViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var selectedNote: Note?
    
    var notes: [Note] = [
        Note(id: "123", title: "title a", description: "descr", createdDate: Date.now),
        Note(id: "456", title: "title b", description: "descr", createdDate: Date.now),
        Note(id: "789", title: "title c", description: "descr", createdDate: Date.now),
        Note(id: "012", title: "title d", description: "descr", createdDate: Date.now)]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
    }
}

extension NotesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ReusableCell", for: indexPath)
        let note = notes[indexPath.row]
        var config = cell.defaultContentConfiguration()
        config.text = note.title
        config.secondaryText = note.description
        config.textProperties.numberOfLines = 1
        config.secondaryTextProperties.numberOfLines = 2
        cell.contentConfiguration = config
        return cell
    }
}

extension NotesViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        navigateToWriteNote(note: notes[indexPath.row])
    }

    func navigateToWriteNote(note: Note) {
        selectedNote = note
        self.performSegue(withIdentifier: Constants.notesToWriteSegue, sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc: WriteViewController = segue.destination as? WriteViewController {
            vc.setNote(note: selectedNote)
        }
        super.prepare(for: segue, sender: sender)
    }
}
