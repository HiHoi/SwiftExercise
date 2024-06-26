//
//  SettingsView.swift
//  Hike
//
//  Created by Hosung Lim on 10/23/23.
//

import SwiftUI

struct SettingsView: View {
	// MARK: - PROPERTIES
	
	private let alternateAppIcons: [String] = [
		"AppIcon-MagnifyingGlass",
		"AppIcon-Map",
		"AppIcon-Campfire",
		"AppIcon-Mushroom",
		"AppIcon-Backpack",
		"AppIcon-Camera"
	]
	
	var body: some View {
		List {
			// MARK: - SECTION: HEADER
			
			Section{
				HStack {
					Spacer()
					
					Image(systemName: "laurel.leading")
						.font(.system(size: 80, weight: .black))
					
					VStack(spacing: -10) {
						Text("Hike")
							.font(.system(size: 66, weight: .black))
						
						Text("Editors' Choice")
							.fontWeight(.medium)
					}
					
					Image(systemName: "laurel.trailing")
						.font(.system(size: 80, weight: .black))
					
					Spacer()
				}
				.foregroundStyle(
					LinearGradient(
						colors: [
							.customGreenLight,
							.customGreenMedium,
							.customGreenDark
						],
						startPoint: .top,
						endPoint: .bottom
					)
				)
				.padding(.top, 8)
				
				VStack(spacing: 8) {
					Text("Where can you find \nperfect tracks?")
						.font(.title2)
						.fontWeight(.heavy)
					
					Text("The hike which looks gorgeous in photos but is even better once you are actually there. The hike that you hope to do again someday. \nFind the best day hikes in app.")
						.font(.footnote)
						.italic()
					
					Text("Dust off your shoes! It's time for a walk.")
						.fontWeight(.heavy)
						.foregroundColor(.customGreenMedium)
				}
				.multilineTextAlignment(.center)
				.padding(.bottom, 16)
				.frame(maxWidth: .infinity)
			} //: HEADER
			.listRowSeparator(.hidden)
			
			// MARK: - SECTION: ICONS
			
			Section(header: Text("ALTERNATE Icons")) {
				ScrollView(.horizontal, showsIndicators: false) {
					HStack(spacing: 12) {
						ForEach(alternateAppIcons.indices, id: \.self) { item in
							Button {
								print("pressed")
								
								UIApplication.shared.setAlternateIconName(alternateAppIcons[item]) { error in
									if error != nil {
										print("Failed : \(String(describing: error?.localizedDescription))")
									} else {
										print("Success!")
									}
								}
							} label: {
								Image("\(alternateAppIcons[item])-Preview")
									.resizable()
									.scaledToFit()
									.frame(width: 80, height: 80)
									.cornerRadius(16)
							}
						.buttonStyle(.borderless)
						}
					}
				} //: SCROLLVIEW
				.padding(.top, 12)
				
				Text("Choose your favorite app icon from the collection above.")
					.frame(minWidth: 0, maxWidth: .infinity)
					.multilineTextAlignment(.center)
					.foregroundColor(.secondary)
					.font(.footnote)
					.padding(.bottom, 12)
			} //: SECTION
			.listRowSeparator(.hidden)
			
			// MARK: - SECTION: ABOUT
			
			Section (
				header: Text("ABOUT THE APP"),
				footer: HStack {
					Spacer()
					Text("Copyright © All right reserved.")
					Spacer()
				}
					.padding(.vertical, 8)
			) {
				
				CustomListRowView(
					rowLable: "Application",
					rowIcon: "apps.iphone",
					rowContent: "HIKE",
					rowTintColor: .blue
				)
				
				CustomListRowView(
					rowLable: "Compatibility",
					rowIcon: "info.circle",
					rowContent: "iOS, iPadOS",
					rowTintColor: .red
				)
				
				CustomListRowView(
					rowLable: "Technology",
					rowIcon: "swift",
					rowContent: "Swift",
					rowTintColor: .orange
				)
				
				CustomListRowView(
					rowLable: "Version",
					rowIcon: "gear",
					rowContent: "1.0",
					rowTintColor: .purple
				)
				
				CustomListRowView(
					rowLable: "Developer",
					rowIcon: "ellipsis.curlybraces",
					rowContent: "Hoslim",
					rowTintColor: .mint
				)
				
				CustomListRowView(
					rowLable: "Designer",
					rowIcon: "paintpalette",
					rowContent: "Hoslim",
					rowTintColor: .pink
				)
				
				CustomListRowView(
					rowLable: "Website",
					rowIcon: "globe",
					rowContent: nil,
					rowTintColor: .indigo,
					rowLinkLabel: "Github Link",
					rowLinkDestination: "https://github.com/HiHoi"
				)
				
			} //: SECTION
			
		} //: LIST
	}
}

#Preview {
	SettingsView()
}
