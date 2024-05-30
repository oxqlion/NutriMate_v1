//
//  iOSHomepageView.swift
//  NutriMate_v1
//
//  Created by zenzen on 28/05/24.
//

import SwiftUI

struct iOSHomepageView: View {
    
    @State private var showSheet = false
    
    var body: some View {
        VStack {
            Image("25")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 150, height: 150)
                .padding()
            
            Text("You haven’t set any plans yet. Start planning today!📝🍌")
                .font(.subheadline)
                .padding()
            
            Button(action: {
                showSheet.toggle()
            }) {
                Text("Set Plan")
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.black)
                    .cornerRadius(10)
            }
            .sheet(isPresented: $showSheet) {
                SheetView()
            }
        }
        .padding()
    }
}

struct SheetView: View {
    @State private var target: String = ""
    @State private var selectedDate = Date()
    
    @State private var selectedOptions: [String] = ["","","","",""]
    private let options = ["🥬 Vegetables", "🍉 Fruits", "🐟 Proteins", "🥛 Milk", "🫚 Herbs"]
    
    
    var body: some View {
        ScrollView {
            
            VStack {
                Rectangle()
                    .foregroundColor(.gray)
                    .frame(width: 80, height: 10)
                    .cornerRadius(100)
                    .padding()
                
                Text("Create new plan")
                
                Section(header: Text("Input Weigh Loss (kg)")) {
                    TextField("Target", text: $target)
                        .padding()
                        .background(.white)
                        .cornerRadius(10)
                        .onChange(of: target) { newValue in
                            let filtered = newValue.filter { "0123456789".contains($0) }
                            if target != filtered {
                                target = filtered
                            }
                        }
                    
                }
                
                Section(header: Text("Due Date")) {
                    DatePicker("Date", selection: $selectedDate, displayedComponents: .date)
                        .datePickerStyle(GraphicalDatePickerStyle())
                }
                
                HStack {
                    Text("+ 🥬 Vegetables")
                        .padding()
                        .background(selectedOptions.contains("Vegetables") ? Color(hex: 0xD3D3D3) : Color.white)
                        .cornerRadius(100)
                        .onTapGesture {
                            if selectedOptions.contains("Vegetables") {
                                selectedOptions[0] = ""
                            } else {
                                self.selectedOptions[0] = "Vegetables"                            }
                        }
                    
                    Text("+ 🍉 Fruits")
                        .padding()
                        .background(selectedOptions.contains("Fruits") ? Color(hex: 0xD3D3D3) : Color.white)
                        .cornerRadius(100)
                        .onTapGesture {
                            if selectedOptions.contains("Fruits") {
                                selectedOptions[1] = ""
                            } else {
                                self.selectedOptions[1] = "Fruits"                            }
                        }
                    Spacer()
                }
                
                HStack {
                    
                    Text("+ 🫚 Herbs")
                        .padding()
                        .background(selectedOptions.contains("Herbs") ? Color(hex: 0xD3D3D3) : Color.white)
                        .cornerRadius(100)
                        .onTapGesture {
                            if selectedOptions.contains("Herbs") {
                                selectedOptions[2] = ""
                            } else {
                                self.selectedOptions[2] = "Herbs"                            }
                        }
                    
                    Text("+ 🥛 Milk")
                        .padding()
                        .background(selectedOptions.contains("Milk") ? Color(hex: 0xD3D3D3) : Color.white)
                        .cornerRadius(100)
                        .onTapGesture {
                            if selectedOptions.contains("Milk") {
                                selectedOptions[3] = ""
                            } else {
                                self.selectedOptions[3] = "Milk"                            }
                        }
                    Spacer()
                }
                
                HStack {
                    
                    Text("+ 🐟 Proteins")
                        .padding()
                        .background(selectedOptions.contains("Proteins") ? Color(hex: 0xD3D3D3) : Color.white)
                        .cornerRadius(100)
                        .onTapGesture {
                            if selectedOptions.contains("Proteins") {
                                selectedOptions[4] = ""
                            } else {
                                self.selectedOptions[4] = "Proteins"                            }
                        }
                    
                    Spacer()
                }
                
                Text("Selected Options: \(selectedOptions.joined(separator: ", "))")
                    .padding()
                
                Button{
                    
                } label: {
                    Text("Done")
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.black)
                        .cornerRadius(10)
                }
                .padding()
            }
            .padding(.horizontal)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .cornerRadius(10)
            .background(Color(hex: 0xf4f4f4))
#if os(iOS)
            .navigationBarTitle("Input Form", displayMode: .inline)
#endif
        }
    }
}

#Preview {
    iOSHomepageView()
}

extension Color {
    init(hex: Int, opacity: Double = 1) {
        self.init(
            .sRGB,
            red: Double((hex >> 16) & 0xff) / 255,
            green: Double((hex >> 08) & 0xff) / 255,
            blue: Double((hex >> 00) & 0xff) / 255,
            opacity: opacity
        )
    }
}
