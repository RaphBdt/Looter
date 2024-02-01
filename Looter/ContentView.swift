import SwiftUI

class Inventory: ObservableObject {
    @Published var loot: [LootItem] = [
        LootItem(quantity: 1, name: "Excalibur", type: .unknown, rarity: .legendary, attackStrength: 25, game: availableGames[0]),
        LootItem(quantity: 1, name: "Bouclier divin", type: .unknown, rarity: .epic, attackStrength: nil, game: availableGames[1]),
        LootItem(quantity: 1, name: "Armure du Dragon", type: .unknown, rarity: .rare, attackStrength: nil, game: availableGames[1]),
        LootItem(quantity: 1, name: "Bâton des Anciens", type: .magic, rarity: .legendary, attackStrength: 30, game: availableGames[2]),
        LootItem(quantity: 1, name: "Lame du Chaos", type: .unknown, rarity: .epic, attackStrength: 28, game: availableGames[2]),
        LootItem(quantity: 1, name: "Arc éthéré", type: .bow, rarity: .rare, attackStrength: 18, game: availableGames[3]),
        LootItem(quantity: 1, name: "Pistolet à plasma", type: .unknown, rarity: .epic, attackStrength: 22, game: availableGames[4]),
        LootItem(quantity: 1, name: "Sceptre des Ombres", type: .magic, rarity: .legendary, attackStrength: 35, game: availableGames[4])

    ]
    
    func addItem(item: LootItem) {
        loot.append(item)
    }
}

struct ContentView: View {
    @StateObject var inventory = Inventory()
    
    @State var addItemSheetPresented = false

    var body: some View {
        NavigationStack {
            List {
                
                Button(action: {
                    let newItem = LootItem(quantity: 1, name: "Magie de feu", type: .fire, rarity: .rare, attackStrength: nil, game: availableGames[4])
                    inventory.addItem(item: newItem)
                }, label: {
                    Text("Ajouter")
                })
                
                ForEach(inventory.loot, id: \.self) { item in
                    Text(item.name)
                }
            }
            .sheet(isPresented: $addItemSheetPresented, content: {
                    AddItemView()
                })
            .navigationBarTitle("Loot")
                .toolbar(content: {
                    ToolbarItem(placement: ToolbarItemPlacement.automatic) {
                        Button(action: {
                            addItemSheetPresented.toggle() // L'action de notre bouton
                        }, label: {
                            Image(systemName: "plus.circle.fill")
                        })
                    }
                })
            .environmentObject(inventory)
        }
    }
}

#Preview {
    ContentView()
}
