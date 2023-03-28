//
//  ViewController.swift
//  CraveRetailPusherTakeHome
//
//  Created by Jess Berler on 3/26/23.
//

import UIKit
import PusherSwift
import Foundation

class MessageListViewController: UIViewController {
  
  let webService = WebServices()
  var messages = [Message]()
  
  @IBOutlet weak var tableView: UITableView!
  
  @IBAction func disconnect() {
    let disconnectAlert = UIAlertController(title: "Pusher Disconnected", message: "Please press Reconnect to resume messages.", preferredStyle: .alert)
    let OKAction = UIAlertAction(title: "OK", style: .default) { (action) in
    }
    disconnectAlert.addAction(OKAction)
    
    webService.disconnectFromPusher()
    self.present(disconnectAlert, animated: true)
  }
  
  @IBAction func reconnect() {
    webService.connectToPusher()
  }
  
  
  // calculate and format size of received json object
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

    webService.connectToPusher()
    
    // MARK: - Subscribe to Pusher channel
    let sampleChannel = webService.subscribeToPusherChannel(channelName: "sample")
    
    //bind function needs to be moved to webservice as well. ran out of time.
    let _ = sampleChannel.bind(eventName: "sampleMessage", callback: { (data: Any?) -> Void in
      if let sampleData = data as? [String : AnyObject] {
        let message = sampleData["message"] as! String
        let title = sampleData["title"] as! String
        let messageSize = self.calculateSize(data as AnyObject)
        let thumbnail = UIImage(systemName: "sun.and.horizon.filled")
        
        let pusherMessage = Message(title: title, body: message, dataSize: messageSize, thumbnail: thumbnail)
        
        self.messages.insert(pusherMessage, at: self.messages.startIndex)
        
        let indexPath = IndexPath(row: 0, section: 0)
        self.tableView.insertRows(at: [indexPath], with: UITableView.RowAnimation.left)
      }
    })
  }
  

}

//MARK: - Table View Data Source
extension MessageListViewController: UITableViewDataSource {
  internal func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return messages.count
  }
  
  internal func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: MessageCell.identifier, for: indexPath) as? MessageCell else { fatalError("Could not create MessageCell") }
    let message = messages[indexPath.row]
    cell.titleLabel.text = message.title
    cell.bodyLabel.text = message.body
    cell.dataSizeLabel.text = message.dataSize
    return cell
  }
}
