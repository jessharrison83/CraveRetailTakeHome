//
//  ViewController.swift
//  CraveRetailPusherTakeHome
//
//  Created by Jess Berler on 3/26/23.
//

import UIKit
import PusherSwift
import Foundation

class MessageListViewController: UITableViewController {
  
  var pusher: Pusher! = nil
  var messages = [Message]()
  
//time constraints prevented implementing disconnect/reconnect buttons. I decided to use my time to write unit tests. 
// func disconnect() {
//    pusher.disconnect()
//  }
//
//func reconnect() {
//    pusher.connect()
//  }
//
  
  // calculate size of received json object
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
    
    // MARK: - Subscribe to Pusher channel
    let sampleChannel = pusher.subscribe(channelName: "sample")
    let _ = sampleChannel.bind(eventName: "sampleMessage", callback: { (data: Any?) -> Void in
      if let sampleData = data as? [String : AnyObject] {
        let message = sampleData["message"] as! String
        let title = sampleData["title"] as! String
        let messageSize = self.calculateSize(data as AnyObject)
        let thumbnail = UIImage(systemName: "sun.and.horizon.filled")
        
        let pusherMessage = Message(title: title, body: message, dataSize: messageSize, thumbnail: thumbnail)
        
        self.messages.insert(pusherMessage, at: self.messages.startIndex)
        print(self.messages)
        
        let indexPath = IndexPath(row: 0, section: 0)
        self.tableView.insertRows(at: [indexPath], with: UITableView.RowAnimation.left)
      }
    })
  }
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return messages.count
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: "MessageCell", for: indexPath) as? MessageCell else { fatalError("Could not create MessageCell") }
    let message = messages[indexPath.row]
    cell.titleLabel.text = message.title
    cell.bodyLabel.text = message.body
    cell.dataSizeLabel.text = message.dataSize
    return cell
  }
}
