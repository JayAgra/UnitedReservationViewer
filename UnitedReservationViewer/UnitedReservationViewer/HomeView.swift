//
//  HomeView.swift
//  UnitedReservationViewer
//
//  Created by Jayen Agrawal on 11/11/24.
//

import SwiftUI

struct HomeView: View {
    @State var savedReservations: [ReservationStore] = UserDefaults.standard.savedReservations
    
    var body: some View {
        NavigationStack {
            VStack {
                if savedReservations.isEmpty {
                    Spacer()
                    Text("You have no saved reservations.")
                    Spacer()
                } else {
                    List {
                        ForEach(savedReservations, id: \.unitedReservation.recordLocator) { res in
                            NavigationLink(destination: {
                                ReservationViewer(reservation: nil, lookupInfo: [res.unitedReservation.recordLocator ?? "ERROR0", res.unitedReservation.lastName ?? "Error"], status: 1)
                            }, label: {
                                VStack(alignment: .leading) {
                                    Text(res.unitedReservation.recordLocator ?? "ERROR0")
                                    Text(String(format: "\n%1$@ to %2$@", res.unitedReservation.pnr?.segments.first?.departure.city ?? "N/A",  res.unitedReservation.pnr?.segments.first?.arrival.city ?? "N/A"))
                                    Text(res.unitedReservation.pnr?.segments.first?.scheduledDepartureDateTime ?? "N/A")
                                    Text("^[\n\(Int(res.unitedReservation.pnr?.numberOfPassengers ?? "1") ?? 1) passenger](inflect: true)")
                                }
                            })
                        }
                    }
                }
            }
            .navigationTitle("Reservations")
            .refreshable {
                savedReservations = UserDefaults.standard.savedReservations
            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    NavigationLink(destination: {
                        ReservationViewer()
                    }, label: {
                        Label("Look up a reservation", systemImage: "magnifyingglass")
                            .labelStyle(.iconOnly)
                    })
                }
            }
        }
        .refreshable {
            savedReservations = UserDefaults.standard.savedReservations
        }
    }
}

#Preview {
    HomeView()
}
