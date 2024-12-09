//
//  Note.swift
//  Notes Watch App
//
//  Created by Anthony on 29/10/24.
//

import Foundation

struct Note: Identifiable, Codable {
  let id: UUID
  let text: String
}
