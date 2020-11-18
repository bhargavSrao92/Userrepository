//
//  tablecell.swift
//  UserRepo
//
//  Created by Rao on 17/11/20.
//

import UIKit

class tablecell: UITableViewCell {

    @IBOutlet weak var titlenaem: UILabel!
    
    @IBOutlet weak var desc: UILabel!
    
    @IBOutlet weak var date: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
