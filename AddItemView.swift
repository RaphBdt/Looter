//
//  AddItemView.swift
//  Looter
//
//  Created by Raphaël Beaudet on 10/01/2024.
//

import SwiftUI

enum Rarity: String {
    case common = "white"
    case uncommon = "green"
    case rare = "blue"
    case epic = "purple"
    case legendary = "gold"
    case unique = "red"
}

struct AddItemView: View {
    @State var name: String = ""
    @State var rarity: Rarity = .common
    @EnvironmentObject var inventory: Inventory
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("Nom de l'objet", text: $name)
                }
                
                Section {
                    Button("Ajouter") {
                        let newItem = LootItem(quantity: 1, name: name, type: .fire, rarity: .rare, attackStrength: nil, game: availableGames[4])
                        inventory.addItem(item: newItem)
                        dismiss()
                    }
                }
            }
        }
    }
}

/*
 Picker("Rarete", selection: $rarity) {
     ForEach(Rarity.allCases, id: \.self) { rarity in
         Text(String(describing: rarity).capitalized)
     }
 }
 */

#Preview {
    AddItemView()
}

