import Foundation
enum GameGenre {
    case mmorpg, rpg, looter, fps, tps, strategy, unset
}

struct Game: Identifiable, Hashable {
    let name: String
    let id: UUID = UUID()
    let genre: GameGenre
    let coverName : String?
    
    static var emptyGame = Game(name: "", genre: .unset, coverName: nil)
}

// Hesitez pas mettre vos propres jeux dans la liste
let availableGames = [
    Game(name: "Alan Wake II", genre: .rpg, coverName: "co6jar"),
    Game(name: "MW3", genre: .rpg, coverName: "co7ctx"),
    Game(name: "Robocop", genre: .mmorpg, coverName: "co4ykm"),
    Game(name: "CS:GO", genre: .fps, coverName: nil),
    Game(name: "Diablo IV", genre: .looter, coverName: nil)
]
