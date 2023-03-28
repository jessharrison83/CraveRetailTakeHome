//
//  WebServices.swift
//  CraveRetailPusherTakeHome
//
//  Created by Jess Berler on 3/28/23.
//

import Foundation
import PusherSwift

class WebServices {
  
  var pusher: Pusher! = nil
  //Putting key and options here for time, would normally not do this in production.
  var pusherKey = "5d3657875c763e1b0282"
  var pusherOptions = PusherClientOptions(
    host: .cluster("us3")
  )
  
  func connectToPusher() {
    pusher = Pusher(key: pusherKey, options: pusherOptions)
    pusher.connect()
  }
  
  func subscribeToPusherChannel(channelName: String) -> PusherChannel {
    pusher = Pusher(key: pusherKey, options: pusherOptions)
    let pusherChannel = pusher.subscribe(channelName)
    return pusherChannel
  }
  
  func disconnectFromPusher() {
    pusher = Pusher(key: pusherKey, options: pusherOptions)
    pusher.disconnect()
  }
}
