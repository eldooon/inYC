//
//  TestData.swift
//  inYC
//
//  Created by Eldon Chan on 11/16/16.
//  Copyright © 2016 Eldon. All rights reserved.
//

import Foundation

class eventInformation {
    
    var eventName = String()
    var eventDate = String()
    var eventLocation = String()
    var eventDescription = String()
    
    init(withEvent Name: String, Date: String, Location: String, Description: String) {
        
        eventName = Name
        eventDate = Date
        eventLocation = Location
        eventDescription = Description
        
    }
}

class testData {
    
    let testData1 = eventInformation(withEvent: "Event1", Date: "August 1", Location: "New York", Description: "Event in New York")
    let testData2 = eventInformation(withEvent: "Event2", Date: "August 1", Location: "New York", Description: "Event in New York")
    let testData3 = eventInformation(withEvent: "Event3", Date: "August 2", Location: "New York", Description: "Event in New York")
}
