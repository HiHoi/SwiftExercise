//
//  EmojiArtApp.swift
//  EmojiArt
//
//  Created by Hosung Lim on 2/19/24.
//

import SwiftUI

@main
struct EmojiArtApp: App {
	@StateObject var defaultDocument = EmojiArtDocument()
	@StateObject var paletteStore = PaletteStore(named: "Main")
	
    var body: some Scene {
//        WindowGroup { // 하나의 뷰모델로 여러 창이 떠도 같은 내용이 있음
//            EmojiArtDocumentView(document: defaultDocument)
//				.environmentObject(paletteStore)
//        }
		DocumentGroup(newDocument: { EmojiArtDocument() }) { config in
			EmojiArtDocumentView(document: config.document)
				.environmentObject(paletteStore)
		}
    }
}
