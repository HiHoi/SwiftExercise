//
//  CustomListRowView.swift
//  Hike
//
//  Created by Hosung Lim on 10/23/23.
//

import SwiftUI

struct CustomListRowView: View {
	// MARK: - PROPERTIES
	
	@State var rowLable: String
	@State var rowIcon: String
	@State var rowContent: String? = nil
	@State var rowTintColor: Color
	@State var rowLinkLabel: String? = nil
	@State var rowLinkDestination: String? = nil
	
	var body: some View {
		LabeledContent {
			if rowContent != nil {
				Text(rowContent!)
					.foregroundColor(.primary)
					.fontWeight(.heavy)
			} else if (rowLinkLabel != nil && rowLinkDestination != nil ) {
				Link(rowLinkLabel!, destination: URL(string: rowLinkDestination!)!)
					.fontWeight(.heavy)
				
			} else {
				
			}
		} label: {
			HStack {
				ZStack {
					RoundedRectangle(cornerRadius: 8)
						.frame(width: 30, height: 30)
						.foregroundColor(rowTintColor)
					Image(systemName: rowIcon)
						.foregroundColor(.white)
						.fontWeight(.semibold)
				}
				
				Text(rowLable)
			}
		}
	}
}

#Preview {
	List() {
		CustomListRowView(
			rowLable: "Designer", 
			rowIcon: "paintpalette",
			rowContent: "Hoslim", 
			rowTintColor: .pink
		)
	}
}
