//
//  AddItemView.swift
//  Looter
//
//  Created by Raphaël Beaudet on 10/01/2024.
//

import SwiftUI

enum Rarity: String, Equatable, CaseIterable {
    case common = "Common"
    case uncommon = "uncommon"
    case rare = "rare"
    case epic = "epic"
    case legendary = "legendary"
    case unique = "unique"
    
    var localizedName: LocalizedStringKey { LocalizedStringKey(rawValue) }
}

struct AddItemView: View {
    @State private var name: String = ""
    @State private var rarity: Rarity = .common
    @EnvironmentObject var inventory: Inventory
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("Nom de l'objet", text: $name)
                    Picker("Rareté", selection: $rarity) {
                        ForEach(Rarity.allCases, id: \.self) { rarity in
                            Text(rarity.localizedName)
                                .tag(rarity)
                        }
                    }
                }
                
                Section {
                    Button("Ajouter") {
                        let newItem = LootItem(quantity: 1, name: name, type: .unknown, rarity: rarity, attackStrength: nil, game: availableGames[4])
                        inventory.addItem(item: newItem)
                        dismiss()
                    }
                }
            }
            .navigationBarTitle("Ajouter un objet")
        }
    }
}

#Preview {
    AddItemView()
}

