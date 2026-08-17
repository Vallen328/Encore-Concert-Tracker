//
//  AttendedViewModel.swift
//  Encore
//
//  Created by Admin on 15/08/26.
//

import Foundation
import SwiftData

@Observable
final class AttendedViewModel{
    var searchText = ""   // Going to drive the search bar
    var showingAddSheet = false   // controls whether the add show form is presented. Both are screen level state. So they live here in the                               view model, not the view.
    func filteredShows(_ shows: [Show]) -> [Show]{
        let attended = shows.filter({ $0.status == .attended })
        guard !searchText.isEmpty else { return attended }
        return attended.filter{
            $0.artistName.localizedCaseInsensitiveContains(searchText) ||
                $0.venueName.localizedCaseInsensitiveContains(searchText) ||
                    $0.city.localizedCaseInsensitiveContains(searchText)
        }
    }
    
    func delete(_ show: Show, context: ModelContext){
        context.delete(show)
    }
}
