//
//  ReservationStore.swift
//  UnitedReservationViewer
//
//  Created by Jayen Agrawal on 11/11/24.
//

import Foundation

public class ReservationStore: NSObject, Codable {
    public var airline: String
    public var unitedReservation: UnitedReservationContent
    
    init(airline: String, unitedReservation: UnitedReservationContent) {
        self.airline = airline
        self.unitedReservation = unitedReservation
    }
    
    required public init(coder decoder: NSCoder) {
        self.airline = decoder.decodeObject(forKey: "airline") as? String ?? "Error"
        self.unitedReservation = decoder.decodeObject(forKey: "unitedReservation") as! UnitedReservationContent
    }
    
    public func encode(with coder: NSCoder) {
        coder.encode(airline, forKey: "airline")
        coder.encode(unitedReservation, forKey: "unitedReservation")
    }
}

extension UserDefaults {
    var savedReservations: [ReservationStore] {
        get {
            guard let data = UserDefaults.standard.data(forKey: "savedReservations") else { return [] }
            let decoder = PropertyListDecoder()
            do {
                let reservations = try decoder.decode([ReservationStore].self, from: data)
                return reservations
            } catch {
                print("Failed to decode reservations: \(error)")
                return []
            }
        }
        set {
            let encoder = PropertyListEncoder()
            do {
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "M/d/yyyy h:mm a"
                let sortedValues = newValue.sorted { (departure1, departure2) -> Bool in
                    if let date1 = dateFormatter.date(from: departure1.unitedReservation.pnr?.segments.first?.scheduledDepartureDateTime ?? "12/31/9999 11:59 PM"), let date2 = dateFormatter.date(from: departure2.unitedReservation.pnr?.segments.first?.scheduledDepartureDateTime ?? "12/31/9999 11:59 PM") {
                        return date1 < date2
                    }
                    return false
                }
                let data = try encoder.encode(newValue)
                UserDefaults.standard.set(data, forKey: "savedReservations")
            } catch {
                print("Failed to encode reservations: \(error)")
            }
        }
    }
}

public func getAllStoredReservations() -> [ReservationStore]? {
    return UserDefaults.standard.savedReservations
}

public func addReservation(reservation: ReservationStore) {
    UserDefaults.standard.savedReservations = [reservation] + (UserDefaults().savedReservations)
}

public func removeReservation(airline: String, confirmation: String) {
    UserDefaults.standard.savedReservations.removeAll(where: { $0.airline == airline.uppercased() && $0.unitedReservation.recordLocator == confirmation.uppercased() })
}

public func checkIfReservationIsSaved(airline: String, confirmation: String) -> Bool {
    return UserDefaults.standard.savedReservations.contains(where: { $0.airline == airline.uppercased() && $0.unitedReservation.recordLocator == confirmation.uppercased() })
}