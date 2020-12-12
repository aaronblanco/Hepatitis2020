//
//  TableViewCellPrueba.swift
//  Hepatitis2020
//
//  Created by Bruno on 11/12/2020.
//  Copyright © 2020 ual. All rights reserved.
//

import UIKit

class TableViewCellPrueba: UITableViewCell {
    
    
    @IBOutlet weak var numero: UILabel!
    var viewcontroller: UIViewController!
    var resultado: Double!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    @IBAction func resultado(_ sender: Any) {
        var alert = UIAlertController()
        alert = UIAlertController(title: "Resultado." , message: "", preferredStyle: .alert)
        let actionDismiss = UIAlertAction(title: "Cerrar", style: .cancel)
        alert.addAction(actionDismiss)
        
        alert.message = String(resultado)+"%"
        
        viewcontroller.present(alert, animated: true, completion: nil)
   
    }
}
