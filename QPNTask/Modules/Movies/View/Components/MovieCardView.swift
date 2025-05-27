//
//  MovieCardView.swift
//  QPNTask
//
//  Created by Ahmad Ellashy  on 26/05/2025.
//

import SwiftUI
import SDWebImageSwiftUI

struct MovieCardView: View {
    let moviePosterURL: URL?
    let movieName: String

    var body: some View {
        ZStack(alignment: .bottomLeading) {
            WebImage(url: moviePosterURL)
                .resizable()
                .scaledToFill()
                .frame(height: 200)
                .clipped()
                .clipShape(RoundedRectangle(cornerRadius: 8))

            Text(movieName)
                .font(.headline)
                .fontWeight(.bold)
                .foregroundStyle(.white)
                .padding()
                .shadow(radius: 5)
        }
        .frame(maxWidth: .infinity)
    }
}


#Preview {
    MovieCardView(moviePosterURL: URL(string: ""), movieName: "SuperMan")
}
