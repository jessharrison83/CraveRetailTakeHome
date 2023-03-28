//
//  MessageCell.swift
//  CraveRetailPusherTakeHome
//
//  Created by Jess Berler on 3/27/23.
//

import UIKit

class MessageCell: UITableViewCell {
  
  static let identifier = "MessageCell"
  
  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet weak var bodyLabel: UILabel!
  @IBOutlet weak var dataSizeLabel: UILabel!
  
  @IBOutlet weak var thumbnail: UIImage!
}
