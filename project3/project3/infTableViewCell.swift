//
//  infTableViewCell.swift
//  project3
//
//  Created by Nico on 2020/12/4.
//

import UIKit

class infTableViewCell: UITableViewCell {

    @IBOutlet weak var tableName: UILabel!
    @IBOutlet weak var tableTel: UILabel!
    @IBOutlet weak var tableAvatar: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
