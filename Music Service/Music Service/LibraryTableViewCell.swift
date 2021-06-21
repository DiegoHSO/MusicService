//
//  LibraryTableViewCell.swift
//  Music Service
//
//  Created by Diego Henrique on 21/06/21.
//

import UIKit

class LibraryTableViewCell: UITableViewCell {

    @IBOutlet weak var coverImage: UIImageView!
    @IBOutlet weak var songLabel: UILabel!
    @IBOutlet weak var songDetailLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
