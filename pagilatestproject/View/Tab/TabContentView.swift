import SwiftUI

struct TabContentView: View {
    
    @State var selectedSection: TabSection = .home
    
    var body: some View {
        TabView(selection: $selectedSection) {
            
            Tab(value: .home) {
                HomeListView()
            } label: {
                Image(systemName: "house.fill")
                Text("Home")
            }

            Tab(value: .search) {
                
            } label: {
                Image(systemName: "magnifyingglass")
                Text("Search")
            }
            
            Tab(value: .rentals) {
                
            } label: {
                Image(systemName: "bag")
                Text("My Rental")
            }
            
            Tab(value: .account) {
                
            } label: {
                Image(systemName: "person.crop.circle")
                Text("Account")
            }
        }
    }
}

enum TabSection: Hashable {
    case home
    case rentals
    case search
    case account
}

#Preview {
    TabContentView()
}

