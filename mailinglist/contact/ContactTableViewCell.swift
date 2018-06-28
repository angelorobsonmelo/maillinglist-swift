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
    @IBOutlet weak var lbGender: UILabel!
    @IBOutlet weak var lbCategory: UILabel!
    @IBOutlet weak var lbRoles: UILabel!
    @IBOutlet weak var ivAvatar: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func populateCell(with contact: Contact) {
          lbInstagram.text = contact.userNameInstagram!
          lbCategory.text  = contact.category?.category!
          lbGender.text    = contact.gender!
        
        if contact.gender == "MALE" {
           ivAvatar.image = UIImage(named: "avatar_male")
        } else {
            ivAvatar.image = UIImage(named: "avatar_female")
        }
        
        lbRoles.text = "Some, Some, Some, Some, Some, Some, Some"
        
        ivAvatar.layer.cornerRadius = ivAvatar.frame.size.height/2        
    }

}
