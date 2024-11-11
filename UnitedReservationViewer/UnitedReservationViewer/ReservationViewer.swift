//
//  ContentView.swift
//  UnitedReservationViewer
//
//  Created by Jayen Agrawal on 11/10/24.
//

import SwiftUI

struct ReservationViewer: View {
    @State var reservation: UnitedReservationContent?
    @State var lookupInfo: [String] = ["", ""]
    @State var status: Int = 0
    @State var reservationAlreadyAdded: Bool = false
    
    var body: some View {
        NavigationStack {
            VStack {
                if status == 0 {
                    Spacer()
                    TextField("Record Locator", text: $lookupInfo[0])
                        .padding()
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .textInputAutocapitalization(.characters)
                        .autocorrectionDisabled(true)
                    TextField("Last Name", text: $lookupInfo[1])
                        .padding()
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .textInputAutocapitalization(.words)
                        .autocorrectionDisabled(true)
                    Spacer()
                }
                if status == 0 {
                    Button(action: {
                        status = 1
                        reservationAlreadyAdded = checkIfReservationIsSaved(airline: "UAL", confirmation: lookupInfo[0].uppercased())
                        loadPnr(confirmation: lookupInfo[0], lastName: lookupInfo[1]) { (output) in
                            if output != nil {
                                reservation = output
                                status = 2
                            } else {
                                lookupInfo = ["", ""]
                                status = 1
                            }
                        }
                    }) {
                        Text("view")
                            .padding()
                    }
                    .padding()
                } else if status == 1 {
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle())
                } else {
                    VStack {
                        List {
                            Text("Passengers (\(reservation?.pnr?.numberOfPassengers ?? "1"))")
                                .bold()
                            Section {
                                ReservationViewerPassengers(reservation: reservation)
                            }
                            Text("Segments (\(reservation?.pnr?.segments.count ?? 1))")
                                .bold()
                            Section {
                                ReservationViewerSegments(reservation: reservation)
                            }
                            Text("Seat Assignments")
                                .bold()
                            Section {
                                ReservationViewerSeats(reservation: reservation)
                            }
                            Text("Ticket Details")
                                .bold()
                            Section {
                                ReservationViewerDetails(reservation: reservation)
                            }
                        }
                    }
                }
            }
            .navigationTitle(status == 2 ? "United \(lookupInfo[0].uppercased())" : "PNR Viewer")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    if status == 2 {
                        if reservationAlreadyAdded {
                            Button(action: {
                                removeReservation(airline: "UAL", confirmation: lookupInfo[0])
                                UINotificationFeedbackGenerator().notificationOccurred(.success)
                                reservationAlreadyAdded = false
                            }, label: {
                                Label("Remove from device", systemImage: "checkmark.circle")
                                    .labelStyle(.iconOnly)
                            })
                        } else {
                            if reservation?.pnr?.isActive ?? true {
                                Button(action: {
                                    if let safeReservation = reservation {
                                        addReservation(reservation: ReservationStore(airline: "UAL", unitedReservation: safeReservation))
                                        UINotificationFeedbackGenerator().notificationOccurred(.success)
                                        reservationAlreadyAdded = true
                                    } else {
                                        UINotificationFeedbackGenerator().notificationOccurred(.error)
                                    }
                                }, label: {
                                    Label("Save to device", systemImage: "plus.circle")
                                        .labelStyle(.iconOnly)
                                })
                            } else {
                                Button(action: {
                                    UINotificationFeedbackGenerator().notificationOccurred(.error)
                                }, label: {
                                    Label("Not available", systemImage: "exclamationmark.triangle")
                                        .labelStyle(.iconOnly)
                                })
                                .disabled(true)
                            }
                        }
                    }
                }
            }
            .onAppear {
                if status == 1 {
                    reservationAlreadyAdded = checkIfReservationIsSaved(airline: "UAL", confirmation: lookupInfo[0].uppercased())
                    loadPnr(confirmation: lookupInfo[0], lastName: lookupInfo[1]) { (output) in
                        if output != nil {
                            reservation = output
                            status = 2
                        } else {
                            lookupInfo = ["", ""]
                            status = 1
                        }
                    }
                }
            }
        }
    }
}

struct ReservationViewerPassengers: View {
    var reservation: UnitedReservationContent?
    
    var body: some View {
        ForEach(0..<(reservation?.pnr?.passengers.count ?? 0), id: \.self) { num in
            VStack(alignment: .leading) {
                Text(String(format: "%2$@/%1$@", reservation?.pnr?.passengers[num].passengerName.first ?? "Unknown", reservation?.pnr?.passengers[num].passengerName.last ?? "Unknown"))
                Text(String(format: "MileagePlus: %1$@", reservation?.pnr?.passengers[num].mileagePlus?.mileagePlusId ?? "None"))
            }
        }
    }
}

struct ReservationViewerSegments: View {
    var reservation: UnitedReservationContent?
    
    var body: some View {
        ForEach(0..<(reservation?.pnr?.segments.count ?? 0), id: \.self) { num in
            VStack(alignment: .leading) {
                Text(String(format: "%1$@ (%2$@) to %3$@ (%4$@)\n", reservation?.pnr?.segments[num].departure.city ?? "ERR", reservation?.pnr?.segments[num].departure.code ?? "ERR", reservation?.pnr?.segments[num].arrival.city ?? "ERR", reservation?.pnr?.segments[num].arrival.code ?? "ERR"))
                Text(reservation?.pnr?.segments[num].flightTime ?? "00H 00M")
                Text(String(format: "Departs %1$@", reservation?.pnr?.segments[num].scheduledDepartureDateTime ?? "Unknown"))
                Text(String(format: "Arrives %1$@\n", reservation?.pnr?.segments[num].scheduledArrivalDateTime ?? "Unknown\n"))
                Text(String(format: "%1$@ %2$@ operated by %3$@", reservation?.pnr?.segments[num].codeshareCarrier.code ?? "Unknown", reservation?.pnr?.segments[num].codeshareCarrier.flightNumber ?? "Unknown", reservation?.pnr?.segments[num].operationoperatingCarrier.name ?? "Unknown"))
                Text(reservation?.pnr?.segments[num].aircraft.longName ?? "Unknown")
                Text(String(format: "%1$@ (%2$@)", reservation?.pnr?.segments[num].classOfServiceDescription ?? "ERR", reservation?.pnr?.segments[num].classOfService ?? "ERR"))
            }
        }
    }
}

struct ReservationViewerSeats: View {
    var reservation: UnitedReservationContent?
    
    var body: some View {
        ForEach(0..<(reservation?.pnr?.segments.count ?? 0), id: \.self) { seg_num in
            VStack(alignment: .leading) {
                Text(String(format: "%1$@ → %2$@ (%3$@)\n", reservation?.pnr?.segments[seg_num].departure.code ?? "ERR", reservation?.pnr?.segments[seg_num].arrival.code ?? "ERR", reservation?.pnr?.segments[seg_num].flightTime ?? "00H 00M"))
                ReservationViewerSeatsSegment(reservation: reservation, segment_number: seg_num)
            }
        }
    }
}

struct ReservationViewerSeatsSegment: View {
    var reservation: UnitedReservationContent?
    var segment_number: Int
    
    var body: some View {
        ForEach(0..<(reservation?.pnr?.passengers.count ?? 0), id: \.self) { pax_num in
            HStack {
                Text(String(format: "%2$@/%1$@", reservation?.pnr?.passengers[pax_num].passengerName.first ?? "Unknown", reservation?.pnr?.passengers[pax_num].passengerName.last ?? "Unknown"))
                Spacer()
                Text(String(format: "%1$@", reservation?.pnr?.segments[segment_number].seats[pax_num].number.uppercased() ?? "N/A"))
            }
        }
    }
}

struct ReservationViewerDetails: View {
    var reservation: UnitedReservationContent?
    
    var body: some View {
        HStack {
            Text("Refundable")
            Spacer()
            Text(String(reservation?.pnr?.isSCRefundEligible ?? false))
        }
        HStack {
            Text("Changeable")
            Spacer()
            Text(String(reservation?.pnr?.isChangeEligible ?? false || reservation?.pnr?.isSCChangeEligible ?? false))
        }
        HStack {
            Text("Award ticket")
            Spacer()
            Text(String(reservation?.pnr?.awardTravel ?? false))
        }
        HStack {
            Text("Miles & Money ticket")
            Spacer()
            Text(String(reservation?.pnr?.isMilesAndMoney ?? false))
        }
        HStack {
            Text("Ticketed")
            Spacer()
            Text(String(reservation?.pnr?.isETicketed ?? false))
        }
        HStack {
            Text("Unaccompanied minor")
            Spacer()
            Text(String(reservation?.pnr?.isUnaccompaniedMinor ?? false))
        }
        HStack {
            Text("Group fare")
            Spacer()
            Text(String(reservation?.pnr?.isgroup ?? false))
        }
        HStack {
            Text("Bulk fare")
            Spacer()
            Text(String(reservation?.pnr?.isBulk ?? false))
        }
        HStack {
            Text("Created")
            Spacer()
            Text(reservation?.pnr?.dateCreated ?? "Unknown")
        }
        HStack {
            Text("Email")
            Spacer()
            Text(reservation?.pnr?.emailAddress ?? "Unknown")
        }
        HStack {
            Text("Type")
            Spacer()
            Text(reservation?.pnr?.tripType ?? "Unknown")
        }
        HStack {
            Text("Product category")
            Spacer()
            Text(reservation?.pnr?.productCategory ?? "Unknown")
        }
        HStack {
            Text("Market type")
            Spacer()
            Text(reservation?.pnr?.marketType ?? "Unknown")
        }
    }
}

#Preview {
    ReservationViewer()
}
