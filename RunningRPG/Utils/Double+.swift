//
//  Double+.swift
//  RunningRPG
//
//  Created by 김호세 on 6/10/23.
//

import Foundation

extension Double {
  func uptoSecondDecimal() -> String {

    let numberFomatter = NumberFormatter()
    numberFomatter.roundingMode = .floor
    numberFomatter.maximumFractionDigits = 2
    return numberFomatter.string(from: NSNumber(value: self)) ?? "0.0"

  }
}
