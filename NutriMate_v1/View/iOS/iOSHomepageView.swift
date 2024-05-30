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
    
    var body: some View {
        VStack {
            
            Text("Create new plan")
            
            Form {
                Section(header: Text("Input Weigh Loss (kg)")) {
                    TextField("target", text: $target)
                }
                
                Section(header: Text("Due Date")) {
                    DatePicker("Date", selection: $selectedDate, displayedComponents: .date)
                        .datePickerStyle(GraphicalDatePickerStyle())
                }
            }
            .cornerRadius(10)
            .padding(.horizontal)
            
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
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .cornerRadius(10)
        .padding(.vertical)
#if os(iOS)
        .navigationBarTitle("Input Form", displayMode: .inline)
#endif
    }
}

#Preview {
    iOSHomepageView()
}
