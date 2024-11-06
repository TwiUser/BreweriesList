//
//  BreweriesTableViewCell.swift
//  BreweriesList
//
//  Created by Lavanya K on 05/11/2024.
//

import UIKit

class BreweriesTableViewCell: UITableViewCell {

    private var listdata : BreweriesList?
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var countryLbl: UILabel!
    @IBOutlet weak var addrLbl: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setData(data:BreweriesList?)
    {
        self.listdata = data
        self.label.text = data?.name
        self.addrLbl.text = data?.address_1
        self.countryLbl.text = data?.country
    }

    @IBAction func webBtnAction(_ sender: Any) {
        DispatchQueue.main.async {
            if let url = URL(string: self.listdata?.website_url ?? "" ) {
                UIApplication.shared.open(url)
            }
        }
  
    }
    @IBAction func mapBtnAction(_ sender: Any) {
    }
}
