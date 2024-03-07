//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Hosung Lim on 1/14/24.
//

import SwiftUI

//모든 항목에서 공유가 될 뷰모델

class EmojiMemoryGame: ObservableObject {
	typealias Card = MemoryGame<String>.Card
	
	private static let emojis = ["👻", "⭐️", "💻", "🎄", "👍","🛫","📔","😕","🤩","🤬","😰","😍", "🕚"]
	//여기서 static를 통해 정적으로 만들어 주는 이유:
	// emojis가 초기화 되기 전에 model의 emojis가 호출되어서 사실상 초기화가 불가능
	// 이를 정적으로 만들면 이니셜라이저의 선순위가 되어서 정적으로 만들어서 초기화
	
	private static func createMemoryGame() -> MemoryGame<String> {
		return MemoryGame(numberOfPairsOfCards: 12) { pairIndex in
			if emojis.indices.contains(pairIndex) {
				return emojis[pairIndex]
			} else {
				return "😭"
			}
		}
	}
	
	@Published private var model = createMemoryGame()

	var cards: Array<Card> {
		model.cards
	}
	
	var color: Color {
		.mint
	}
	
	var score: Int {
		model.score
	}
	
	// MARK: - Intents
	
	func shuffle() {
		model.shuffle()
	}
	
	func choose(_ card: Card) {
		model.choose(card)
	}
}
