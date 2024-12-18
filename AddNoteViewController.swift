//
//  AddNoteViewController.swift
//  notes-app
//
//  Created by Rishabh Rishabh on 9/11/21.
//

import UIKit

class AddNoteViewController: UIViewController {
    @IBOutlet weak var bodyText: UITextView!
    
    @IBOutlet weak var textTitleField: UITextField!
    
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    @IBAction func saveClick(_ sender: Any) {
        print("Save Button Pressed");
       APIFunctions.functions.addNote(date: "placeholder", title: textTitleField.text! , note:bodyText.text! )
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Add view")

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
