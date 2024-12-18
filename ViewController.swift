//
//  ViewController.swift
//  notes-app
//
//  Created by Rishabh Rishabh on 6/11/21.
//

import UIKit

protocol DataDelegate{
    func updateArray(newArray:String);
}
class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource
{
    //var notesArray = ["John","Jackie","Rishabh","Sunny"];
    var notesArray = [Note]();
    
    @IBOutlet weak var updateField: UITextField!
    
    
    @IBAction func DelNote(_ sender: Any) {
        let currentId = notesArray[0]._id;
        APIFunctions.functions.delNote(id: currentId);
        
    }
    @IBAction func UpdNote(_ sender: Any) {
        
        print("Update First Item");
        //print(updateField.text!);
        //print(notesArray[0]._id);
        var currentNote = notesArray[0];
        //currentNote.title = currentNote.title + "changed";
        currentNote.title = updateField.text!;
        APIFunctions.functions.updNote(id: currentNote._id, date: currentNote.date, title: currentNote.title, note: currentNote.note)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("test1");
        return notesArray.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print("test2");
        let cell = tableView.dequeueReusableCell(withIdentifier: "proCellF", for: indexPath);
       // cell.textLabel?.text = notesArray[indexPath.row];
        //print(notesArray[indexPath.row]);
       
        cell.textLabel?.text = notesArray[indexPath.row].title;
        return cell
    }
    

    @IBOutlet weak var newTable: UITableView!

    
    //@IBOutlet weak var notesTableView: UITableView!
    
    override func viewDidLoad() {
        print("test");
        APIFunctions.functions.delegate = self;
        APIFunctions.functions.getNotes();
        print(notesArray);
        super.viewDidLoad()
        newTable.delegate = self
        newTable.dataSource = self
       // newTable.register(UINib(nibName: "proCellF", bundle: nil), forCellReuseIdentifier: "proCellF")
        newTable.register(UITableViewCell.self, forCellReuseIdentifier: "proCellF")
        // notesTableView.separatorStyle = UITableViewCell.SeparatorStyle.singleLine;
        // Do any additional setup after loading the view.
    }


}

extension ViewController:DataDelegate{
    func updateArray(newArray: String) {
        do{
            notesArray = try JSONDecoder().decode([Note].self,from : newArray.data(using: .utf8)!);
            print(notesArray);
            
        }catch{
            
            print("Failed to decode ");
        }
        
        self.newTable?.reloadData();
    }
    
    
}
