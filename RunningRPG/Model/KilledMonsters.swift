//
//  KilledMonsters.swift
//  RunningRPG
//
//  Created by 강주원 on 2023/06/10.
//

import Foundation
import ActivityKit

struct KilledAttributes: ActivityAttributes {
	struct ContentState: Codable & Hashable {
		let monsters: [Monster]
	}
}
