//
//  WeatherData.swift
//  weaterdataAPIapp
//
//  Created by Deepak Gupta on 25/01/23.
//

import Foundation
struct WeatherData:Codable
{
    let location:LocationData
    let current:CurrentData
}
