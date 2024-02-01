//
//  AddItemView.swift
//  Looter
//
//  Created by Raphaël Beaudet on 10/01/2024.
//

import SwiftUI

enum Rarity: String, Equatable, CaseIterable {
    case common = "Common"
    case uncommon = "Uncommon"
    case rare = "Rare"
    case epic = "Epic"
    case legendary = "Legendary"
    case unique = "Unique"
    
    var localizedName: LocalizedStringKey { LocalizedStringKey(rawValue) }
}

struct AddItemView: View {
    @State private var name: String = ""
    @State private var rarity: Rarity = .common
    @State private var selectedGame: Game? = nil
    @State private var quantity: Int = 1
    @State private var selectedType: ItemType = .unknown
    
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
                    Picker("Jeu", selection: $selectedGame) {
                        Text("Sélectionnez un jeu").tag(nil as Game?)
                        ForEach(availableGames, id: \.self) { game in
                            Text(game.name).tag(game as Game?)
                        }
                    }
                    Stepper("Quantité : \(quantity)", value: $quantity)
                }
                
                Section {
                    Text("Type")
                    Picker("Type d'objet", selection: $selectedType) {
                        ForEach(ItemType.allCases, id: \.self) { type in
                            Text(type.rawValue)
                                .tag(type)
                        }
                    }.pickerStyle(.palette)
                }
                
                Section {
                    Button("Ajouter") {
                        let newItem = LootItem(quantity: quantity, name: name, type: selectedType, rarity: rarity, attackStrength: nil, game: availableGames[4])
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

