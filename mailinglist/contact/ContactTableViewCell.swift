//
//  ContactTableViewCell.swift
//  mailinglist
//
//  Created by Stant 02 on 26/06/18.
//  Copyright © 2018 angelorobson. All rights reserved.
//

import UIKit

class ContactTableViewCell: UITableViewCell {
    
    @IBOutlet weak var lbInstagram: UILabel!
    @IBOutlet weak var lbCategory: UILabel!
    @IBOutlet weak var lbGender: UILabel!
    @IBOutlet weak var lbRoles: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func populateCell(with contact: Contact) {
        
    }

}
