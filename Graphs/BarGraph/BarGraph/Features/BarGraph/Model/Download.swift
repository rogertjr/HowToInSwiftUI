//
//  Download.swift
//  BarGraph
//
//  Created by Rogério Toledo on 13/01/22.
//

import SwiftUI

// Sample Graph Model and Data....
struct Download: Identifiable{
    var id = UUID().uuidString
    var downloads: CGFloat
    var day: String
    var color: Color
}

// MARK: - Download MOCK
var weekDownloads: [Download] = [
    Download(downloads: 30, day: "S", color: Color("Purple")),
    Download(downloads: 45, day: "M", color: Color("Purple")),
    Download(downloads: 60, day: "T", color: Color("Green")),
    Download(downloads: 90, day: "W", color: Color("Green")),
    Download(downloads: 40, day: "T", color: Color("Purple")),
    Download(downloads: 50, day: "F", color: Color("Green")),
    Download(downloads: 20, day: "S", color: Color("Purple")),
]
