//
//  CardView.swift
//  Memorize
//
//  Created by Hosung Lim on 1/20/24.
//

import SwiftUI


struct CardView: View {
	typealias Card = MemoryGame<String>.Card
	
	var card: Card
	
	init(_ card: Card) {
		self.card = card
	}
	
	var body: some View {
		TimelineView(.animation) { timeline in
			if card.isFaceUp || !card.isMatched {
				Pie(endAngle: .degrees(card.bonusPercentRemaining * 360))
					.opacity(Constants.Pie.opacity)
					.overlay(cardContents.padding(Constants.Pie.inset))
					.padding(Constants.inset)
					.cardify(isFaceUp: card.isFaceUp)
					.transition(.opacity)
			} else {
				Color.clear
			}
		}
	}
	
	var cardContents: some View {
		Text(card.content)
			.font(.system(size: Constants.FontSize.largest))
			.minimumScaleFactor(Constants.FontSize.scaleFactor)
			.multilineTextAlignment(.center)
			.aspectRatio(1, contentMode: .fit)
			.rotationEffect(.degrees(card.isMatched ? 360 : 0))
			.animation(.spin(duration: 1), value: card.isMatched)
	}
	
	private struct Constants {
		static let cornerRadius: CGFloat = 12
		static let lineWidth: CGFloat = 2
		static let inset: CGFloat = 5
		struct FontSize {
			static let largest: CGFloat = 200
			static let smallest: CGFloat = 10
			static let scaleFactor = smallest / largest
		}
		struct Pie {
			static let opacity: CGFloat = 0.5
			static let inset: CGFloat = 5
		}
	}
}

extension Animation {
	static func spin(duration: TimeInterval) -> Animation {
		.linear(duration: duration).repeatForever(autoreverses: false)
	}
}

struct CardView_Preview: PreviewProvider {
	typealias Card = CardView.Card
	
	static var previews: some View {
		VStack {
			HStack {
				CardView(Card(content: "X", id: "test1"))
					.aspectRatio(4/3, contentMode: .fit)
				
				CardView(Card(isFaceUp: true, content: "X", id: "test1"))
			}
			
			HStack {
				CardView(Card(isMatched: true ,content: "X", id: "test1"))
				
				CardView(Card(isFaceUp: true, content: "Long text Long text Long text Long text Long text", id: "Long text"))
			}
		}
		.padding()
		.foregroundColor(.blue)
	}
}