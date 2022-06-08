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
    @State var address: Address = Address(id: 1, country: "Canada")
    @Environment(\.dismiss) var dismiss
    @AppStorage("isLogged") var isLoegged = false
    @AppStorage("isLiteMode") var isLiteMode = true
    @ObservedObject var coinModel = CoinModel()
    
    func fetchAddress() async {
        do {
            let url = URL(string: "https://random-data-api.com/api/address/random_address")!
            let (data, _) = try await URLSession.shared.data(from: url)
            address = try JSONDecoder().decode(Address.self, from: data)
        } catch {
            address = Address(id: 1, country: "Error Fatching")
        }
        
    }
    
    var body: some View {
        NavigationView {
            List {
                
                profile
                
                menu
                
                Section{
                    Toggle(isOn: $isLiteMode){
                        Label("Lite Mode", systemImage: isLiteMode ? "tortoise" : "hare")
                    }
                }
                .accentColor(.primary)
                
                links
                
                coins
                
                Button{
                    isLoegged = false
                    dismiss()
                } label: {
                    Text("Sign out")
                }
                .tint(.red)
                
            }
            .task {
                await fetchAddress()
                await coinModel.fetchCoins()
            }
            .refreshable {
                await fetchAddress()
                await coinModel.fetchCoins()
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
                Text(address.country)
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
    
    var coins: some View{
        Section(header: Text("Coins")){
            ForEach(coinModel.coins){ coin in
                HStack {
                    AsyncImage(url: URL(string: coin.logo)){ image in
                        image.resizable()
                            .aspectRatio(contentMode: .fit)
                    } placeholder: {
                        ProgressView()
                    }
                    .frame(width: 32, height: 32)
                    VStack(alignment: .leading, spacing: 2) {
                        Text(coin.coin_name)
                        Text(coin.acronym)
                            .font(.caption)
                            .foregroundColor(.secondary)
                    }
                }
            }
        }
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
