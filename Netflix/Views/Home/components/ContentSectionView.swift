//
//  ContentSectionView.swift
//  Netflix
//
//  Refactored section view using MVVM architecture
//

import SwiftUI

struct ContentSectionView: View {
    let section: HomeSection
    @StateObject private var viewModel: SectionViewModel
    
    init(section: HomeSection) {
        self.section = section
        // SwiftUI views initialize on MainActor, so this is safe
        _viewModel = StateObject(wrappedValue: DIContainer.shared.makeSectionViewModel(for: section))
    }
    
    var body: some View {
        VStack(spacing: 0) {
            HStack(alignment: .center) {
                Text(section.title)
                    .font(.system(size: 17, weight: .semibold))
                    .kerning(0.34)
                    .foregroundColor(.white)
                
                Spacer()
            }
            .padding(.horizontal, 16)
            
            ScrollView(.horizontal) {
                HStack(spacing: 10) {
                    if viewModel.isLoading {
                        ForEach(0..<5, id: \.self) { _ in
                            AsyncImageCard(imageURL: nil, width: 110, height: 159)
                        }
                    } else {
                        if section.contentType == .movies {
                            ForEach(viewModel.movies.prefix(10)) { movie in
                                ContentCard(movie: movie)
                            }
                        } else {
                            ForEach(viewModel.tvShows.prefix(10)) { show in
                                ContentCard(tvShow: show)
                            }
                        }
                    }
                }
                .padding(.vertical, 10)
                .padding(.leading, 16)
                .padding(.trailing, 16)
            }
            .scrollIndicators(.hidden)
        }
        .task {
            await viewModel.loadContent()
        }
    }
}

struct ContentCard: View {
    let movie: Movie?
    let tvShow: TVShow?
    
    init(movie: Movie? = nil, tvShow: TVShow? = nil) {
        self.movie = movie
        self.tvShow = tvShow
    }
    
    var posterPath: String? {
        movie?.posterPath ?? tvShow?.posterPath
    }
    
    var body: some View {
        if let posterPath = posterPath, !posterPath.isEmpty {
            AsyncImageCard(
                imageURL: TMDBService.shared.posterURL(path: posterPath),
                width: 110,
                height: 159
            )
        } else {
            AsyncImageCard(imageURL: nil, width: 110, height: 159)
        }
    }
}


#Preview {
    // Use a concrete HomeSection for preview
    ContentSectionView(
        section: HomeSection(id: "preview-trending",
                             title: "Trending Now",
                             category: .trending,
                             contentType: .movies)
    )
    .frame(maxHeight:.infinity)
    .background(.black)
    .ignoresSafeArea()
}
