//
//  TableViewController.swift
//  AbfallABC
//
//  Created by Benedikt Kurz on 28.03.19.
//  Copyright © 2019 Benedikt Kurz. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    var personen : [Person]?
    var stoffe : [Stoff]?
    var sorten = [Sorte]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        personen = Reader.getPersonen()
     //   stoffe = Reader.getStoffe()
        
        
        
        print(stoffe?[0].name)
        print(stoffe?[1].name)
        print(stoffe?[0].avv)
        print(stoffe?[1].avv)
        
        
        var decoder = JSONDecoder()
        
        
        // PERSONEN
        if let url = Bundle.main.url(forResource: "personen", withExtension: "json") {
        
            if let data = try? Data(contentsOf: url) {
                
                if let jsondata = try? decoder.decode(Personen.self, from: data) {
                    
                    
                    print(jsondata.person)
             
                    
                } else { print("keine dekodierung") }
                
                
            } else { print("keine daten") }
            
            
        } else { print("keine url") }
        
        // STOFFE
        if let url = Bundle.main.url(forResource: "Sorte", withExtension: "json") {
            
            if let data = try? Data(contentsOf: url) {
                
                if let jsondata = try? decoder.decode(Sorten.self, from: data) {
                    
                    
                    self.sorten = jsondata.sorten
                    
                    
                    print(jsondata.sorten)
                    
                    
                    print(jsondata.sorten[0].Name)
                    print(jsondata.sorten[0].avv)
                    print(jsondata.sorten[1].Name)
                    print(jsondata.sorten[1].avv)
                    print(jsondata.sorten[2].Name)
                    print(jsondata.sorten[2].avv)
                    
                } else { print("keine dekodierung") }
                
                
            } else { print("keine daten") }
            
            
        } else { print("keine url") }
        
        
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return sorten.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Stoffzelle", for: indexPath) as! TableViewCell_Stoff
        let row = (indexPath as NSIndexPath).row
        
        //if (personen?[row] != nil ) 
            cell.lblTitel.text = sorten[row].Name
            cell.lblSubtitel.text = "AVV des Abfalls: \(sorten[row].avv)"
        
        
        return cell
    }
    
    
    /*
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    /*
     // Override to support editing the table view.
     override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
     if editingStyle == .delete {
     // Delete the row from the data source
     tableView.deleteRows(at: [indexPath], with: .fade)
     } else if editingStyle == .insert {
     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
     }
     }
     */
    
    /*
     // Override to support rearranging the table view.
     override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
     
     }
     */
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
