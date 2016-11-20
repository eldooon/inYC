//
//  TestData.swift
//  inYC
//
//  Created by Eldon Chan on 11/16/16.
//  Copyright © 2016 Eldon. All rights reserved.
//

import Foundation

public class EventInformation {
    
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

public class testData {
    
    public var eventTestData = [EventInformation]()
    
    let testData1 = EventInformation(withEvent: "Event1", Date: "August 1", Location: "New York", Description: "Event in New York")
    let testData2 = EventInformation(withEvent: "Event2", Date: "August 1", Location: "New York", Description: "Event in New York")
    let testData3 = EventInformation(withEvent: "Event3", Date: "August 2", Location: "New York", Description: "Event in New York")
    
    func generateTestData () {
        eventTestData.append(testData1)
        eventTestData.append(testData2)
        eventTestData.append(testData3)
    }
}
