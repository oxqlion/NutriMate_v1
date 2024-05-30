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
                .multilineTextAlignment(.center)
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
                    .presentationDragIndicator(.visible)
                    .ignoresSafeArea()
            }
        }
        .padding()
    }
}

struct SheetView: View {
    @State private var target: String = ""
    @State private var selectedDate = Date()
    
    @State private var selectedOptions: [String] = ["", "", "", "", ""]
    private let options = ["🥬 Vegetables", "🍉 Fruits", "🐟 Proteins", "🥛 Milk", "🫚 Herbs"]
    
    var body: some View {
        
        VStack {
            
//            Rectangle()
//                .frame(width: 50, height: 6)
//                .foregroundColor(.gray)
//                .padding(.top, 20)
            
            Text("Set Plan")
                .font(.title2)
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                .padding(.top, 20)
                .padding(.horizontal)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            TextField("Target in Kg", text: $target)
                .padding()
                .background(.white)
                .cornerRadius(10)
            DatePicker("Deadline", selection: $selectedDate, displayedComponents: .date)
                .padding(.horizontal)
                .padding(.vertical, 10)
                .background(.white)
                .cornerRadius(10)
                .foregroundColor(.gray)
            
            VStack {
                Text("Select preffered meal")
                    .font(.headline)
                    .fontWeight(.bold)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                HStack {
                    Text("+ 🥬 Vegetables")
                        .font(.caption)
                        .padding()
                        .background(selectedOptions.contains("Vegetables") ? Color(hex: 0xD3D3D3) : Color.white)
                        .cornerRadius(100)
                        .onTapGesture {
                            if selectedOptions.contains("Vegetables") {
                                selectedOptions[0] = ""
                            } else {
                                self.selectedOptions[0] = "Vegetables"
                            }
                        }
                    
                    Text("+ 🍉 Fruits")
                        .font(.caption)
                        .padding()
                        .background(selectedOptions.contains("Fruits") ? Color(hex: 0xD3D3D3) : Color.white)
                        .cornerRadius(100)
                        .onTapGesture {
                            if selectedOptions.contains("Fruits") {
                                selectedOptions[1] = ""
                            } else {
                                self.selectedOptions[1] = "Fruits"
                            }
                        }
                    Text("+ 🫚 Herbs")
                        .font(.caption)
                        .padding()
                        .background(selectedOptions.contains("Herbs") ? Color(hex: 0xD3D3D3) : Color.white)
                        .cornerRadius(100)
                        .onTapGesture {
                            if selectedOptions.contains("Herbs") {
                                selectedOptions[2] = ""
                            } else {
                                self.selectedOptions[2] = "Herbs"
                            }
                        }
                    Spacer()
                }
                HStack {
                    
                    Text("+ 🥛 Milk")
                        .font(.caption)
                        .padding()
                        .background(selectedOptions.contains("Milk") ? Color(hex: 0xD3D3D3) : Color.white)
                        .cornerRadius(100)
                        .onTapGesture {
                            if selectedOptions.contains("Milk") {
                                selectedOptions[3] = ""
                            } else {
                                self.selectedOptions[3] = "Milk"
                            }
                        }
                    Text("+ 🐟 Proteins")
                        .font(.caption)
                        .padding()
                        .background(selectedOptions.contains("Proteins") ? Color(hex: 0xD3D3D3) : Color.white)
                        .cornerRadius(100)
                        .onTapGesture {
                            if selectedOptions.contains("Proteins") {
                                selectedOptions[4] = ""
                            } else {
                                self.selectedOptions[4] = "Proteins"
                            }
                        }
                    Spacer()
                }
            }
//            .padding(.horizontal)
            
            Button(action: {
                
            }) {
                Text("See Plan")
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.black)
                    .cornerRadius(15)
            }
            .padding(.bottom, 10)
            .padding(.top, 330)
        }
        .padding()
        .background(Color(hex: 0xF4F4F4))
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
