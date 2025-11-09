//
//  TopTenSectionView.swift
//  Netflix
//
//  Refactored Top 10 section using MVVM architecture
//

import SwiftUI

struct TopTenSectionView: View {
    let section: HomeSection
    @StateObject private var viewModel: SectionViewModel
    
    init(section: HomeSection) {
        self.section = section
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
                        ForEach(1...10, id: \.self) { rank in
                            TopTenCard(rank: rank, imageURL: nil)
                        }
                    } else {
                        if section.contentType == .movies {
                            ForEach(Array(viewModel.movies.prefix(10).enumerated()), id: \.element.id) { index, movie in
                                TopTenCard(
                                    rank: index + 1,
                                    imageURL: movie.posterPath.flatMap { path in
                                        !path.isEmpty ? TMDBService.shared.posterURL(path: path) : nil
                                    }
                                )
                            }
                        } else {
                            ForEach(Array(viewModel.tvShows.prefix(10).enumerated()), id: \.element.id) { index, show in
                                TopTenCard(
                                    rank: index + 1,
                                    imageURL: show.posterPath.flatMap { path in
                                        !path.isEmpty ? TMDBService.shared.posterURL(path: path) : nil
                                    }
                                )
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

