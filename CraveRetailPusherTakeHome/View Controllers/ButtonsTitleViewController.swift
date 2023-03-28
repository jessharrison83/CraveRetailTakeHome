//
//  ViewController.swift
//  CraveRetailPusherTakeHome
//
//  Created by Jess Berler on 3/27/23.
//

import UIKit

class ButtonsTitleViewController: UIViewController {
  let messageList = MessageListViewController()
  
  @IBAction func disconnect (_ sender: AnyObject?) {
    messageList.disconnect()
  }
  
  @IBAction func reconnect (_ sender: AnyObject?) {
    messageList.reconnect()
  }

    override func viewDidLoad() {
        super.viewDidLoad()

    }

}
