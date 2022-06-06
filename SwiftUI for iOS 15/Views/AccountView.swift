//
//  AccountView.swift
//  SwiftUI for iOS 15
//
//  Created by João Carlos Magalhães on 16/02/22.
//

import SwiftUI

struct AccountView: View {
    
    @State var isDeleated = false
    @State var isPineed = false
    @Environment(\.dismiss) var dismiss
    @AppStorage("isLogged") var isLoegged = false
    
    var body: some View {
        NavigationView {
            List {
                
                profile
                
                menu
                
                links
                
                Button{
                    isLoegged = false
                    dismiss()
                } label: {
                    Text("Sign out")
                }
                .tint(.red)
                
            }
            .listStyle(.insetGrouped)
            .navigationTitle("Account")
            .navigationBarItems(trailing: Button { dismiss() } label: { Text("Done").bold() })
        }
    }
    
    var profile: some View {
        VStack(spacing: 8){
            Image(systemName:
                    "person.crop.circle.fill.badge.checkmark")
                .symbolVariant(.circle.fill)
                .font(.system(size: 32))
                .symbolRenderingMode(.palette)
                .foregroundStyle(.blue, .blue.opacity(0.3))
                .padding()
                .background(Circle().fill(.ultraThinMaterial))
                .background(
                    HexagonView()
//                    Image(systemName: "hexagon")
//                        .symbolVariant(.fill)
//                        .foregroundColor(.blue)
//                        .font(.system(size: 200))
                        .offset(x: -50, y: -100)
                )
                .background(
                    BlobView()
                        .offset(x: 200, y: 0)
                        .scaleEffect(0.6)
                )
            Text("João Carlos Magalhães")
                .font(.title.weight(.semibold))
            HStack{
                Image(systemName: "location")
                    .imageScale(.large)
                Text("Canada")
                    .foregroundColor(.secondary)
            }
        }
        .frame(maxWidth: .infinity)
        .padding()
    }
    
    var menu: some View{
        Section {
            NavigationLink(destination: HomeView()){
                Label("Settings", systemImage: "gear")
            }
            NavigationLink { Text("Billing") } label: {
                Label("Billing", systemImage: "creditcard")
            }
            NavigationLink { HomeView() } label: {
                Label("Help", systemImage: "questionmark")
            }
        }
        .accentColor(.primary)
        .listRowSeparatorTint(.blue)
        .listRowSeparator(.hidden)
    }
    
    var links: some View {
        Section{
            if !isDeleated {
                Link(destination: URL(string: "https://apple.com")!){
                    HStack{
                        Label("Website", systemImage: "house")
                        Spacer()
                        Image(systemName: "link")
                            .foregroundColor(.secondary)
                    }
                }
                .swipeActions(edge: .leading, allowsFullSwipe: true) {
                    Button(action: { isDeleated = true }) {
                        Label("Delete", systemImage: "trash")
                    }
                    .tint(.red)
                    
                    pinButton
                    
                }
            }
            Link(destination: URL(string: "https://youtube.com")!){
                HStack{
                    Label("YouTube", systemImage: "tv")
                    Spacer()
                    Image(systemName: "link")
                        .foregroundColor(.secondary)
                }
            }
            .swipeActions{
                pinButton
            }
        }
        .accentColor(.primary)
        .listRowSeparator(.hidden)
    }
    
    var pinButton: some View{
        Button { isPineed.toggle() } label: {
            if isPineed{
                Label("Unpin", systemImage: "pin.slash")
            } else{
                Label("Pin", systemImage: "pin")
            }
            
        }
        .tint(isPineed ? .gray : .yellow)
    }
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView()
    }
}
