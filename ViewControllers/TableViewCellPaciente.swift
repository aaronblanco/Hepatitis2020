//
//  TableViewPaciente.swift
//  Hepatitis2020
//
//  Created by Bruno on 11/12/2020.
//  Copyright © 2020 ual. All rights reserved.
//

import UIKit



class TableViewCellPaciente: UITableViewCell {

    @IBOutlet weak var nombre: UILabel!
    
    @IBOutlet weak var apellidos: UILabel!
    
    @IBOutlet weak var dni: UILabel!
    
    @IBOutlet weak var fotoPerfil: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
