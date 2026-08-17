//
//  ContentView.swift
//  Encore
//
//  Created by Admin on 15/08/26.
//

import SwiftUI
import SwiftData

struct AttendedView: View {
    @Query(sort: \Show.date, order: .reverse) private var allShows: [Show]
    @Environment(\.modelContext) private var modelContext
    
    @State private var viewModel = AttendedViewModel()
    
    var body: some View {
        @Bindable var vm = viewModel
        NavigationStack{
            Group{
                if vm.filteredShows(allShows).isEmpty{
                    EmptyStateView(icon: "music.mic", title: viewModel.searchText.isEmpty ? "No Shows Yet" : "No Results", message: viewModel.searchText.isEmpty ? "Start logging for the concerts you've been to" : "Try searching for something else")
                }
                else{
                    List{
                        ForEach(viewModel.filteredShows(allShows)){
                            show in
                            
                            NavigationLink(value: show){
                                ShowRowView(show: show)
                            }
                        }
                        .onDelete{
                            IndexSet in
                            let shows = viewModel.filteredShows(allShows)
                            for index in IndexSet{
                                viewModel.delete(shows[index], context: modelContext)
                            }
                        }
                    }
                }
            }
            .navigationTitle("Attended")
            .searchable(text: $vm.searchText, prompt: "Artists, Venues, Cities")
            .navigationDestination(for: Show.self){ show in
                ShowDetailView(show: show)
            }
            .toolbar{
                Button("Add show!", systemImage: "plus"){
                    viewModel.showingAddSheet = true
                }
            }
            .sheet(isPresented: $vm.showingAddSheet){
                AddEditShowView(initialStatus: .attended)
            }
        }
    }
}

#Preview {
    AttendedView()
        .modelContainer(for: Show.self, inMemory: true)
}
