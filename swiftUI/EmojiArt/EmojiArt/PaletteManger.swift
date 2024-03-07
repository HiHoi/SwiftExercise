//
//  PaletteManger.swift
//  EmojiArt
//
//  Created by Hosung Lim on 2/25/24.
//

import SwiftUI

struct PaletteManger: View {
	let stores: [PaletteStore]
	
	@State private var selectedStore: PaletteStore?
	
    var body: some View {
		NavigationSplitView {
			List(stores, selection: $selectedStore) { store in
				Text(store.name)
					.tag(store)
			}
		} content: {
			if let selectedStore {
				EditablePaletteList(store: selectedStore)
			}
		} detail: {
			Text("Choose")
		}
    }
}

//#Preview {
//    PaletteManger()
//}
