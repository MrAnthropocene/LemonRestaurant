//
//  ReservationForm.swift
//  LemonRestaurant
//
//
//

import SwiftUI

struct ReservationForm: View {
    let restaurantName = "Little Lemon"
    let maxGuest = 10
    let maxChildren = 5
    @State private var userName = ""
    @State private var guestCount = 1
    @State private var childrenCount = 0
    @State private var occasion = ""
    @State private var phoneNumber = ""
    @State private var previewText = ""
    var body: some View {
        Form{
            //Header
            Section{
                Text(restaurantName)
                    .font(.title2)
                    .bold()
                Text("Reservation Form")
                    .foregroundColor(.secondary)
            }
            Section(header: Text("Reservation Details")){
                TextField("Name",text:$userName)
                    .textInputAutocapitalization(.words)
                    .autocorrectionDisabled(true)
                
                if userName.isEmpty {
                    Text("Please enter your name")
                        .foregroundColor(.red)
                        .font(.caption)
                }
                
                Stepper("Guest: \(guestCount)", value: $guestCount, in: 1 ... maxGuest)
                if guestCount >= 8 {
                    Text("Large group — please call ahead")
                        .foregroundColor(.orange)
                        .font(.caption)
                }
                Stepper("Children: \(childrenCount)", value: $childrenCount, in: 0 ... maxChildren)
            }
            
            
            Section(header: Text("Contact")){
                TextField("Phone",text:$phoneNumber)
                    .keyboardType(.numberPad)
            }
            
            Section(header: Text("Occasion")){
                TextField("Special Occasion",text:$occasion)
                    .textInputAutocapitalization(.words)
                    .autocorrectionDisabled()
            }
            
            Section {
                Button("Preview reservation"){
                    previewText =
                    """
                    Name: \(userName)
                    Guest: \(guestCount)
                    Children: \(childrenCount)
                    Phone: \(phoneNumber)
                    Occasion: \(occasion)
                    """
                }
                .disabled(userName.isEmpty)
            }
            
            Section(header: Text("Preview")){
                Text(previewText)
            }
        }
    }
}

#Preview {
    ReservationForm()
}
