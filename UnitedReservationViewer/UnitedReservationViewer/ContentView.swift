//
//  ContentView.swift
//  UnitedReservationViewer
//
//  Created by Jayen Agrawal on 11/10/24.
//

import SwiftUI

struct ContentView: View {
    @State var reservation: ReservationContent?
    @State var lookupInfo: [String] = ["", ""]
    @State var status: Int = 0
    
    var body: some View {
        VStack {
            Spacer()
            if status == 0 {
                TextField("Record Locator", text: $lookupInfo[0])
                    .padding()
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .textInputAutocapitalization(.characters)
                TextField("Last Name", text: $lookupInfo[1])
                    .padding()
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .textInputAutocapitalization(.words)
                Spacer()
            }
            if status == 0 {
                Button(action: {
                    status = 1
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
                }
            } else if status == 1 {
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle())
            } else {
                VStack {
                    List {
                        Section {
                            HStack {
                                Text("Confirmation")
                                Spacer()
                                Text(reservation?.recordLocator ?? "Error")
                            }
                            HStack {
                                Text("^[\(Int(reservation?.pnr?.numberOfPassengers ?? "1") ?? 1) passenger](inflect: true)")
                            }
                        }
                        Text("Passengers")
                            .bold()
                        Section {
                            ForEach(0..<(reservation?.pnr?.passengers.count ?? 0), id: \.self) { num in
                                VStack(alignment: .leading) {
                                    Text(String(format: "%2$@/%1$@", reservation?.pnr?.passengers[num].passengerName.first ?? "Unknown", reservation?.pnr?.passengers[num].passengerName.last ?? "Unknown"))
                                    Text(String(format: "MileagePlus: %1$@", reservation?.pnr?.passengers[num].mileagePlus?.mileagePlusId ?? "None"))
                                }
                            }
                        }
                        Text("Segments")
                            .bold()
                        Section {
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
                        Text("Ticket Details")
                            .bold()
                        Section {
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
                }
                Button(action: {
                    self.reservation = nil
                    self.lookupInfo = ["", ""]
                    self.status = 0
                }) {
                    Text("reset")
                }
            }
            Spacer()
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
