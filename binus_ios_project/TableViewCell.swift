//
//  TableViewCell.swift
//  binus_ios_project
//
//  Created by Abhi Wisesa on 11/12/20.
//  Copyright © 2020 Garry. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var thumbnailNews: UIImageView!
    @IBOutlet weak var titleNews: UILabel!
    @IBOutlet weak var authorAndDate: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
