//
//  MovieCellView.swift
//  SmallWorldTest
//
//  Created by Sabih Haris on 11/12/2023.
//

import SwiftUI
import Kingfisher

struct MovieCellView: View {
    
    let item : MovieResult
    
    var body: some View {
        
        HStack(alignment:.top) {
            KFImage(URL(string: "https://image.tmdb.org/t/p/w500\(item.backdropPath ?? "")"))
                .resizable()
                .frame(width: 50,height: 50)
                .cornerRadius(25)
            Spacer()
            VStack(alignment: .leading) {
                Text(item.originalTitle ?? "")
                    .bold()
                Text(item.overview ?? "")
                
            }
        }
        
    }
}

#Preview {
    MovieCellView(item: MovieResult(adult: true, backdropPath: "", id: 0, originalLanguage: "", originalTitle: "Sabih", overview: "SabihSabihSabihSabihSabihSabihSabihSabihSabihSabihSabihSabihSabihSabihSabihSabihSabihSabihSabihSabihSabihSabihSabihSabihSabihSabih", popularity: 0.0, posterPath: "", releaseDate: "", title: "", video:false, voteAverage: 0.0, voteCount: 0))
}

