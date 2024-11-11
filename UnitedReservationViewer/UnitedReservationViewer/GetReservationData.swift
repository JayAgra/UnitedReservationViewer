//
//  GetReservationData.swift
//  UnitedReservationViewer
//
//  Created by Jayen Agrawal on 11/10/24.
//

import Foundation

func loadPnr(confirmation: String, lastName: String, completionBlock: @escaping (ReservationContent?) -> Void) {
    guard let url = URL(string: "https://mobileshopapi.united.com/managereservationservice/api/ManageReservation/GetPNRByRecordLocatorV2") else { return }
    
    let requestData: [String: Any] = [
        "accessCode": "ACCESSCODE",
        "isOTFConversion": false,
        "lastName": lastName.uppercased(),
        "isAddTripToMyAccount": false,
        "requestor": "",
        "application": [
            "id": 1,
            "name": "iOS",
            "isProduction": false,
            "version": [
                "minor": "4.2.20",
                "major": "4.2.20",
                "displayText": "",
                "build": ""
            ],
        ],
        "languageCode": "en-US",
        "sessionId": "",
        "flow": "VIEWRES",
        "recordLocator": confirmation.uppercased(),
        "misConnectDestination": "",
        "encryptedRequest": "",
        "isMisconnect": false
    ]
    let jsonData = try? JSONSerialization.data(withJSONObject: requestData)
    
    var request = URLRequest(url: url)
    request.httpMethod = "POST"
    request.setValue("mobileshopapi.united.com", forHTTPHeaderField: "Host")
    request.setValue("keep-alive", forHTTPHeaderField: "Connection")
    request.setValue("*/*", forHTTPHeaderField: "Accept")
    request.setValue("UnitedCustomerFacingIPhone/4.2.20 (Version 18.2 (Build 22C5109p))", forHTTPHeaderField: "User-Agent")
    request.setValue("en-US,en;q=0.9", forHTTPHeaderField: "Accept-Language")
    request.setValue("application/json", forHTTPHeaderField: "Content-Type")
    request.httpBody = jsonData
    
    let requestTask = URLSession(configuration: URLSessionConfiguration.default).dataTask(with: request) { (data: Data?, response: URLResponse?, error: Error?) in
        if let data = data {
            do {
                let decoder = JSONDecoder()
                let result = try decoder.decode(ReservationContent.self, from: data)
                DispatchQueue.main.async {
                    completionBlock(result)
                }
            } catch {
                print("parse error \(error)")
                completionBlock(nil)
            }
        } else if let error = error {
            print("fetch error: \(error)")
            completionBlock(nil)
        }
    }
    requestTask.resume()
}

func loadPnrTest() {
    loadPnr(confirmation: "ABC123", lastName: "Stalin") { (output) in
        if let pnr = output {
            print("\(pnr.pnr?.emailAddress ?? "Unknown")")
        } else {
            print("shitty fuckin error man")
        }
    }
}
