//
//  MessageCell.swift
//  CraveRetailPusherTakeHome
//
//  Created by Jess Berler on 3/27/23.
//

import UIKit

class MessageCell: UITableViewCell {
  @IBOutlet var titleLabel: UILabel!
  @IBOutlet var bodyLabel: UILabel!
  @IBOutlet var dataSizeLabel: UILabel!
  
  @IBOutlet var thumbnail: UIImage? = UIImage(systemName: "sun.and.horizon.filled")
}
