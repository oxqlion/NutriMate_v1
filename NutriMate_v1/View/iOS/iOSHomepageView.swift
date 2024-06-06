import SwiftUI
import SwiftData
import GoogleGenerativeAI

struct iOSHomepageView: View {
    @State private var showSheet = false
    let isIpad = ScreenSizeDetector().screenWidth > 650
    @Environment(\.modelContext) var modelContexts
    @Query var recipes: [Recipes]
    
    var body: some View {
        
        if recipes.isEmpty {
            VStack {
                Image("25")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: isIpad ? 250 : 150, height: isIpad ? 250 : 150)
                    .padding()
                
                Text("You haven’t set any plans yet. Start planning today!📝🍌")
                    .font(.system(size: isIpad ? 24 : 16))
                    .multilineTextAlignment(.center)
                    .padding()
                
                Button(action: {
                    showSheet.toggle()
                }) {
                    Text("Set Plan")
                        .font(.system(size: isIpad ? 20 : 16))
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
        } else {
            ProfileView()
        }
    }
}

struct SheetView: View {
    @Environment(\.modelContext) var modelContexts
    //    @StateObject private var viewModel = OpenAIViewModel()
    let model = GenerativeModel(name: "gemini-pro", apiKey: APIKey.default)
    @State private var target: String = ""
    @State private var responseText: String = ""
    @State private var selectedDate = Date()
    @State private var totalDays: String = ""
    @State private var gender: String = "male"
    @State private var age: String = ""
    @State private var weight: String = ""
    @State private var height: String = ""
    @State private var activityLevel: String = "sedentary"
    
    let genders = ["male", "female"]
    let activityLevels = ["sedentary", "lightly active", "moderately active", "very active", "super active"]
    
    
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
            
            Picker("Gender", selection: $gender) {
                ForEach(genders, id: \.self) {
                    Text($0.capitalized)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            
            TextField("Age", text: $age)
                .keyboardType(.numberPad)
                .padding()
                .background(.white)
                .cornerRadius(10)
            TextField("Weight (kg)", text: $weight)
                .keyboardType(.decimalPad)
                .padding()
                .background(.white)
                .cornerRadius(10)
            TextField("Height (cm)", text: $height)
                .keyboardType(.decimalPad)
                .padding()
                .background(.white)
                .cornerRadius(10)
            
            Picker("Activity Level", selection: $activityLevel) {
                ForEach(activityLevels, id: \.self) {
                    Text($0.capitalized)
                }
            }
            .pickerStyle(WheelPickerStyle())
            
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
            Text(responseText)
            
            Button{
                generateResponse()
            } label: {
                Text("Done")
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.black)
                    .cornerRadius(15)
            }
            .padding(.bottom, 10)
            //            .padding(.top, 330)
            
            
        }
        .padding()
        .background(Color(hex: 0xF4F4F4))
    }
    
    func generateResponse() {
        Task {
            do {
                let calendar = Calendar.current
                let today = Date()
                let components = calendar.dateComponents([.day], from: today, to: selectedDate)
                let days = components.day ?? 0
                
                func calculateCalories() {
                    guard let loseTargetInt = Int(target),
//                          let totalDaysInt = days,
                          let ageInt = Int(age),
                          let weightDouble = Double(weight),
                          let heightDouble = Double(height) else {
                        print("Invalid input")
                        return
                    }
                    
                    let allowedCalories = calculateAllowedCaloriesPerDay(
                        loseTarget: loseTargetInt,
                        totalDays: days,
                        gender: gender,
                        age: ageInt,
                        weight: weightDouble,
                        height: heightDouble,
                        activityLevel: activityLevel
                    )
                    
                    print("Allowed calories per day: \(allowedCalories)")
                }
                
                func calculateAllowedCaloriesPerDay(loseTarget: Int, totalDays: Int, gender: String, age: Int, weight: Double, height: Double, activityLevel: String) -> Double {
                    let caloriesPerKg = 7700.0
                    let totalCaloricDeficit = Double(loseTarget) * caloriesPerKg
                    let dailyCaloricDeficit = totalCaloricDeficit / Double(totalDays)
                    
                    let bmr: Double
                    if gender.lowercased() == "male" {
                        bmr = 88.362 + (13.397 * weight) + (4.799 * height) - (5.677 * Double(age))
                    } else if gender.lowercased() == "female" {
                        bmr = 447.593 + (9.247 * weight) + (3.098 * height) - (4.330 * Double(age))
                    } else {
                        return 0.0
                    }
                    
                    let activityMultiplier: Double
                    switch activityLevel.lowercased() {
                    case "sedentary":
                        activityMultiplier = 1.2
                    case "lightly active":
                        activityMultiplier = 1.375
                    case "moderately active":
                        activityMultiplier = 1.55
                    case "very active":
                        activityMultiplier = 1.725
                    case "super active":
                        activityMultiplier = 1.9
                    default:
                        return 0.0
                    }
                    
                    let tdee = bmr * activityMultiplier
                    let allowedCaloriesPerDay = tdee - dailyCaloricDeficit
                    let minimumCalories = gender.lowercased() == "male" ? 1500.0 : 1200.0
                    return max(allowedCaloriesPerDay, minimumCalories)
                }
                
                for _ in 1...5 {
                    
                    let prompt = """
                                I want to start a diet. I want to lose \(target) kg in \(days) days.
                                Give me a food recipe to help me on my diet. Generate it with this format:
                                meal name: meal description: meal total calories: meal total fat:
                                meal total carbs: meal total protein: meal total sugar: meal cook time:
                                meal step by step to make, separate each step with a /:
                                meal ingredients, separate each ingredients with a /:
                                I prefer a meal with these ingredients: \(selectedOptions.joined(separator: ", "))
                                """
                    let result = try await model.generateContent(prompt)
                    responseText = result.text ?? "No response ... "
                    target = ""
                    
                    let resModel = parseAIResponse(response: responseText)
                    
                    modelContexts.insert(resModel)
                }
            } catch {
                responseText = "Something went wrong ..."
            }
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
