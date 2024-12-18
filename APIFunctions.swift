//
//  APIFunctions.swift
//  notes-app
//
//  Created by Rishabh Rishabh on 6/11/21.
//

import Foundation
import Alamofire
struct Note: Decodable{
    var _id :String;
    var title:String;
    var date:String;
    var note:String;
}

class APIFunctions{
    
    var delegate:DataDelegate?
    static let functions = APIFunctions(); // create instance
    func getNotes(){
        AF.request("https://ioappsserver.herokuapp.com/notes/allnotes").response{ response in
            print("Data fetch")
            print(response.data)
            print(response)
            let data = String(data:response.data!,encoding: .utf8)
            self.delegate?.updateArray(newArray: data!);
            
        }
    }
    
    func addNote(date:String,title:String,note:String){
        print(title)
        print(note);
        let parameters :[String: Any] = [
            "date":date,
            "title":title,
            "note":note
        ];
       AF.request("https://ioappsserver.herokuapp.com/notes/newNote",
                  method: .post, parameters : parameters,
                  encoding: JSONEncoding.default
                  // headers:["title" :title,"date":date,"note":note ] )
                   )
           .responseJSON{
                response in
               print(response);
            }
    }
    
    //
    func updNote(id:String,date:String,title:String,note:String){
       AF.request("https://ioappsserver.herokuapp.com/notes/updNote",
                  method: .post,
                  encoding: URLEncoding.httpBody,
                  headers:["title" :title,"date":date,"note":note,"id" : id] )
           .responseJSON{
                response in
               print(response);
            }
    }
  
    
    func delNote(id:String){
       AF.request("https://ioappsserver.herokuapp.com/notes/deleteNote",
                  method: .delete,
                  encoding: URLEncoding.httpBody,
                  headers:["id" : id] )
           .responseJSON{
                response in
               print(response);
            }
    }
    
}
