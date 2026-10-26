//
//  HomeListView.swift
//  pagilatestproject
//
//  Created by Jonathan Punongbayan on 10/25/26.
//

import SwiftUI

struct HomeListView: View {
    
    @State var viewModel = HomeViewModel()
    
    var body: some View {
        // ListView
        List(viewModel.films) { film in
            // CellView
            HStack (alignment: .top) {
                VStack (alignment: .leading) {
                    Text(film.title)
                        .fontWeight(.bold)
                        .font(.system(size: 24))
                    
                    FlowLayout(spacing: 8) {
                        ForEach(film.categoryName, id: \.self) { category in
                            
                            CategoryChip(name: category)
                        }
                    }
                }
                
                Spacer()
                
                VStack (alignment: .trailing) {
                    Text("$\(film.rentalRate.formatted(.number))")
                }
            }
            .frame(maxWidth: .infinity)
            .padding(16)
            .clipShape(
                RoundedRectangle(cornerRadius: 12)
            )
            .overlay {
                RoundedRectangle(cornerRadius: 12)
                    .stroke(
                        Color.gray,
                        lineWidth: 1
                    )
            }
            
            if let message = viewModel.errorMessage {
                Text(message)
            }
        }
        .task {
            await viewModel.fetchFilms()
        }
    }
}

#Preview {
    HomeListView()
}
