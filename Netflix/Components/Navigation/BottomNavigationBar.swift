//
//  BottomNavigationBar.swift
//  Netflix
//
//  Created on 09/11/25.
//

import SwiftUI

/// Tab item configuration
struct TabItem {
    let id: String
    let title: String
    let selectedIcon: String
    let unselectedIcon: String
    let action: () -> Void
}

/// Bottom navigation bar component
struct BottomNavigationBar: View {
    let tabs: [TabItem]
    let selectedTabId: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            HStack {
                ForEach(tabs, id: \.id) { tab in
                    TabButton(
                        tab: tab,
                        isSelected: selectedTabId == tab.id
                    )
                    
                    if tab.id != tabs.last?.id {
                        Spacer()
                    }
                }
            }
            .padding(.top, 2)
            .padding(.horizontal, 38)
        }
        .frame(height: 48)
        .background(Color.black.opacity(0.9))
    }
}

/// Individual tab button
struct TabButton: View {
    let tab: TabItem
    let isSelected: Bool
    
    var body: some View {
        VStack(spacing: 4) {
            if tab.unselectedIcon.isEmpty {
                // Custom view for My Netflix (placeholder)
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(width: 24, height: 24)
                    .background(Color(red: 0.85, green: 0.85, blue: 0.85).opacity(0.1))
            } else {
                Image(isSelected ? tab.selectedIcon : tab.unselectedIcon)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 24, height: 24)
            }
            
            Text(tab.title)
                .font(.system(size: 10))
                .foregroundColor(isSelected ? .white : .gray)
        }
        .onTapGesture {
            tab.action()
        }
    }
}

#Preview {
    BottomNavigationBar(
        tabs: [
            TabItem(
                id: "home",
                title: "Home",
                selectedIcon: "home",
                unselectedIcon: "homeline",
                action: { print("Home tapped") }
            ),
            TabItem(
                id: "newHot",
                title: "New & Hot",
                selectedIcon: "hotfill",
                unselectedIcon: "hot",
                action: { print("New & Hot tapped") }
            ),
            TabItem(
                id: "myNetflix",
                title: "My Netflix",
                selectedIcon: "",
                unselectedIcon: "",
                action: { print("My Netflix tapped") }
            )
        ],
        selectedTabId: "home"
    )
    .preferredColorScheme(.dark)
    .background(Color.black)
}

