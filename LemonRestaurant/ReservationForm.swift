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
    
    // 1) labels for guest
    func guestLabel(_ count: Int) -> String {
        count == 1 ? "Guest" : "Guests"
    }

    // 2) Estimation
    func estimateTotal(adults: Int, children: Int) -> Double {
        let adultPrice = 15.0
        let childPrice = 8.0

        return Double(adults) * adultPrice + Double(children) * childPrice
    }

    var body: some View {
        Form {
            // Header
            Section {
                VStack(spacing: 4) {
                    Text(restaurantName)
                        .font(.largeTitle.bold())
                        .foregroundColor(.green)
                    Text("Reservation Form")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
                .frame(maxWidth: .infinity, alignment: .center)
                .padding(.vertical, 4)
            }
            
            // Reservation details
            Section(header: Text("Reservation Details").font(.headline)) {
                TextField("Name", text: $userName)
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
            
            // Contact
            Section(header: Text("Contact").font(.headline)) {
                TextField("Phone", text: $phoneNumber)
                    .keyboardType(.numberPad)
            }
            
            // Occasion
            Section(header: Text("Occasion").font(.headline)) {
                TextField("Special Occasion", text: $occasion)
                    .textInputAutocapitalization(.words)
                    .autocorrectionDisabled()
            }
            
            // Preview button
            Section {
                Button("Preview reservation") {
                    previewText =
                    """
                    Name: \(userName)
                    Guest: \(guestCount)
                    Children: \(childrenCount)
                    Phone: \(phoneNumber)
                    Occasion: \(occasion)
                    """
                }
                .buttonStyle(.borderedProminent)
                .tint(.green)
                .frame(maxWidth: .infinity, alignment: .center)
                .disabled(userName.isEmpty)
            }
            
            // Preview text
            Section(header: Text("Preview").font(.headline)) {
                Text(previewText)
                    .font(.footnote)
                    .foregroundColor(.secondary)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(8)
                    .background(Color.yellow.opacity(0.1))
                    .cornerRadius(8)
                    .textSelection(.enabled)
            }

            // Summary
            Section(header: Text("Summary").font(.headline)) {
                VStack(alignment: .leading, spacing: 12) {
                    HStack {
                        Text("Reservation Summary")
                            .font(.headline)
                        Spacer()
                        Image(systemName: "doc.text.magnifyingglass")
                            .foregroundColor(.green)
                    }

                    HStack {
                        Text("Name")
                        Spacer()
                        Text(userName)
                            .fontWeight(.semibold)
                    }

                    HStack {
                        Text(guestLabel(guestCount))
                        Spacer()
                        Text("\(guestCount)")
                            .fontWeight(.semibold)
                    } // display guests

                    HStack {
                        Text("Children")
                        Spacer()
                        Text("\(childrenCount)")
                            .fontWeight(.semibold)
                    } // display children

                    Divider()

                    HStack {
                        Text("Estimated total")
                            .fontWeight(.semibold)
                        Spacer()
                        Text(
                            "$\(estimateTotal(adults: guestCount, children: childrenCount), specifier: "%.2f")"
                        )
                        .font(.title3.bold())
                        .foregroundColor(.green)
                    }
                    // estimate
                }
                .padding(8)
                .background(Color.gray.opacity(0.1))
                .cornerRadius(12)
            }
        }
    }
}


#Preview {
    ReservationForm()
}
