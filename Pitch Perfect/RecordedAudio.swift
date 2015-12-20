//
//  RecordedAudio.swift
//  Pitch Perfect
//
//  Created by Mike Weng on 12/5/15.
//  Copyright © 2015 Weng. All rights reserved.
//

import Foundation

class RecordedAudio: NSObject {
    let filePathUrl:NSURL!
    let title:String!
    init(filePathUrl:NSURL!, title:String!) {
        self.filePathUrl = filePathUrl
        self.title = title
    }
}