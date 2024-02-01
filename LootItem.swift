//
//  LootItem.swift
//  Looter
//
//  Created by Raphaël Beaudet on 10/01/2024.
//

import Foundation

struct LootItem: Identifiable, Hashable {
    var id: UUID = UUID()
    var quantity: Int
    var name: String
    var type: ItemType
    var rarity: Rarity
    var attackStrength: Int?
    var game: Game
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}

enum ItemType: String, Equatable, CaseIterable {
    case magic = "⭐️"
    case fire = "🔥"
    case ice = "❄️"
    case poison = "💀"
    case thunder = "⚡️"
    case bow = "🏹"
    case ring = "💍"
    case unknown = "🎲"
}
