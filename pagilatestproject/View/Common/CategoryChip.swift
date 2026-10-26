//
//  CategoryChip.swift
//  pagilatestproject
//
//  Created by Jonathan Punongbayan on 10/26/26.
//

import SwiftUI

struct CategoryChip: View {
    
    let name: String
    
    var body: some View {
        Text(name)
            .font(.caption2.weight(.medium))
            .foregroundStyle(.primary)
            .padding(.vertical, 8)
            .padding(.horizontal, 16)
            .overlay {
                RoundedRectangle(cornerRadius: 16)
                    .stroke(
                        Color.gray,
                        lineWidth: 1
                    )
            }
    }
}
