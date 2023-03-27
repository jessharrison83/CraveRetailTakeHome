//
//  ViewController.swift
//  CraveRetailPusherTakeHome
//
//  Created by Jess Berler on 3/26/23.
//

import UIKit
import PusherSwift
import Foundation

class ViewController: UIViewController {
  
  var pusher: Pusher! = nil
  let decoder = JSONDecoder()
  
  @IBAction func reconnect(_ sender: AnyObject) {
    pusher.connect()
  }
  
  @IBAction func disconnect(_ sender: AnyObject) {
    pusher.disconnect()
  }
  
  func calculateSize(_ data: AnyObject) -> String {
    let bytes = data.count
    let formatter = ByteCountFormatter()
    formatter.allowedUnits = [.useBytes]
    formatter.countStyle = .file
    let sizeString = formatter.string(fromByteCount: Int64(bytes ?? 0))
    return sizeString
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    let options = PusherClientOptions(
      host: .cluster("us3")
    )
    pusher = Pusher(key: "5d3657875c763e1b0282", options: options)
    pusher.connect()
    
    let sampleChannel = pusher.subscribe(channelName: "sample")
    let _ = sampleChannel.bind(eventName: "sampleMessage", callback: { (data: Any?) -> Void in
      if let sampleData = data as? [String : AnyObject] {
        let message = sampleData["message"] as! String
        let title = sampleData["title"] as! String
        let messageSize = self.calculateSize(data as AnyObject)
        print("Title: \(title), Message: \(message), Size: \(messageSize)")
      }
    })
  }
}
