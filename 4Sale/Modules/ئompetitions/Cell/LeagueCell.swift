//
//  LeagueCell.swift
//  4Sale
//
//  Created by Al-attar on 03/06/2023.
//

import UIKit
import SDWebImage
import SVGKit
import SDWebImageSVGKitPlugin

class LeagueCell: UITableViewCell {

    @IBOutlet weak var numberOfTeams_lbl: UILabel!
    @IBOutlet weak var logo_iv: UIImageView!
    @IBOutlet weak var numberOfGames_lbl: UILabel!
    @IBOutlet weak var leagueName_lbl: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func configure(_ data: Competitions){
        let imageUrl = data.area?.ensignUrl ?? ""
        self.logo_iv.getImage(imageUrl: imageUrl)
        self.leagueName_lbl.text = data.name ?? ""
    }
}
