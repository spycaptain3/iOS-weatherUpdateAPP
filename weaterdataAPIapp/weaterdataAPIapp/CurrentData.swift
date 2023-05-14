//
//  CurrentData.swift
//  weaterdataAPIapp
//
//  Created by Deepak Gupta on 24/01/23.
//

import Foundation
struct CurrentData:Codable
{
    let last_updated:String
    let temp_c:Float
    let wind_kph:Float
    let humidity:Int
    let wind_dir:String
}
