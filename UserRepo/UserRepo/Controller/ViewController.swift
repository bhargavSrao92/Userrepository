//
//  ViewController.swift
//  UserRepo
//
//  Created by Rao on 17/11/20.
//

import UIKit
import Alamofire
import SwiftyJSON


extension UIViewController{
func HideKeyboard()
{
let Tap : UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector((DismissKeyboard)))
view.addGestureRecognizer(Tap)
}
@objc func DismissKeyboard(){
view.endEditing(true)
}
}

class ViewController: UIViewController {
    
    @IBOutlet weak var searchbar: UISearchBar!
    var tablemodel = [Usermodel]()
    
    @IBOutlet weak var tableview: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchbar.delegate = self
                
        tableview.separatorColor = UIColor.white

    
        // Do any additional setup after loading the view.
    }


    
    
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print(searchbar.text)
        
        if searchText.isEmpty{
            tablemodel.removeAll()
            tableview.separatorColor = UIColor.white
            

           tableview.reloadData()
        }
        else{
            
            userlistrepo(searchText: searchbar.text!)
            self.tablemodel.removeAll()
            tableview.separatorColor = UIColor.black


        }
    }

    func userlistrepo(searchText  : String){
        let url = URL(string: "https://api.github.com/users/\(searchText)/repos")
        let urlRequest = URLRequest(url: url!)
        AF.request(urlRequest)
            .responseJSON { response in
                // do stuff with the JSON or error
                let myresult = try? JSON (data : response.data!)
                let jsonvalue = JSON(myresult)
                
                print(response)
             
                
            for i in 0...jsonvalue.count{
                
                
                let description = jsonvalue[i]["description"].string
                let updated = jsonvalue[i]["updated_at"].string
                let name = jsonvalue[i]["name"].string

    
                self.tablemodel.append(Usermodel(Title: name, Description: description, uploaded: updated))
                
            }
                self.tableview.reloadData()

        }
        
        
        
    }
}


extension ViewController : UITableViewDataSource, UITableViewDelegate ,UISearchBarDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return tablemodel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)  as! tablecell
        let um: Usermodel
        um = tablemodel[indexPath.row]
        cell.desc.text = um.Description as? String
        cell.date.text =  um.uploaded
        cell.titlenaem.text =   um.Title
        
        return cell
    }
    
    

    
   
    
    
    
  


    
    
 
    
    
    
}

