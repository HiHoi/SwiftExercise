//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Hosung Lim on 1/7/24.
//

import SwiftUI

@main
struct MemorizeApp: App {
	@StateObject var game = EmojiMemoryGame()
	
    var body: some Scene {
        WindowGroup {
            EmojiMemoryGameView(viewModel: game)
        }
    }
}
