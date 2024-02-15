//
//  CourseModel.swift
//  SwiftUIAPIcalls
//
//  Created by Ioannis Andreoulakis on 14/2/24.
//
// -6- In here i create a Course struct that conforms to Hashable and Codable protocols.
// Furthermore i will add the coresponding properties based on the JSON. If i open the URL link in a browser
// i see that inside the JSON, each set of {} has inside a name and an image of the course. For that reason
// i create them here.
//
// To continue go back to ViewModel

import Foundation
import SwiftUI

struct Course: Hashable, Codable {                  // -6-
    
    let name: String
    let image: String
    
}
