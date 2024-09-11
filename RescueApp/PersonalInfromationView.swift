import SwiftUI

struct PersonalInformationView: View {
    @State private var name: String = UserDefaults.standard.string(forKey: "name") ?? ""
    @State private var age: String = UserDefaults.standard.string(forKey: "age") ?? ""
    @State private var bloodGroup: String = UserDefaults.standard.string(forKey: "bloodGroup") ?? ""
    @State private var phoneNumber: String = UserDefaults.standard.string(forKey: "phoneNumber") ?? ""
    @State private var address: String = UserDefaults.standard.string(forKey: "address") ?? ""
    @State private var isEditing: Bool = true

    var body: some View {
        NavigationView {
            VStack() {
                Section(header: Text("Information")) {
                    InfoField(title: "Name", text: $name)
                        .disabled(!isEditing)
                    InfoField(title: "Age", text: $age)
                        .disabled(!isEditing)
                    InfoField(title: "Blood Group", text: $bloodGroup)
                        .disabled(!isEditing)
                    InfoField(title: "Phone Number", text: $phoneNumber)
                        .disabled(!isEditing)
                    InfoField(title: "Address", text: $address)
                        .disabled(!isEditing)
                }
                Section {
                    if isEditing {
                        Button(action: savePersonalInformation) {
                            Text("Save")
                                .font(.title2)
                        }
                    } else {
                        Button(action: { isEditing = true }) {
                            Text("Edit")
                                .font(.title2)
                        }
                    }
                }
            }
            .padding()
            .navigationTitle("Personal Information")
        }
    }

    private func savePersonalInformation() {
        UserDefaults.standard.set(name, forKey: "name")
        UserDefaults.standard.set(age, forKey: "age")
        UserDefaults.standard.set(bloodGroup, forKey: "bloodGroup")
        UserDefaults.standard.set(phoneNumber, forKey: "phoneNumber")
        UserDefaults.standard.set(address, forKey: "address")
        isEditing = false
    }

    private func gatherPersonalInformation() -> String {
        let name = UserDefaults.standard.string(forKey: "name") ?? "N/A"
        let age = UserDefaults.standard.string(forKey: "age") ?? "N/A"
        let bloodGroup = UserDefaults.standard.string(forKey: "bloodGroup") ?? "N/A"
        let phoneNumber = UserDefaults.standard.string(forKey: "phoneNumber") ?? "N/A"
        let address = UserDefaults.standard.string(forKey: "address") ?? "N/A"
        
        return """
        Name: \(name)
        Age: \(age)
        Blood Group: \(bloodGroup)
        Phone Number: \(phoneNumber)
        Address: \(address)
        """
    }

    private func sendEmergencyMessage() {
        let personalInfo = gatherPersonalInformation()
        let emergencyMessage = "Emergency! Please help. Here is my personal information:\n\(personalInfo)"
        
        // Code to send the emergency message
        print(emergencyMessage) // Replace with actual message sending logic
    }
}

#Preview {
    PersonalInformationView()
}


struct InfoField: View {
    
    let title:String
    @Binding var text: String
    @FocusState var isTyping: Bool
    
    var body: some View {
        ZStack(alignment: .leading){
            
            TextField("", text: $text).padding(.leading)
                .frame(height: 55).focused($isTyping)
                .background(isTyping ? .blue : Color.primary, in:RoundedRectangle(cornerRadius: 14).stroke(lineWidth: 2))
            Text(title).padding(.horizontal, 5)
                .background(.fTitle.opacity(isTyping || !text.isEmpty ? 1 : 0))
                .backgroundStyle(isTyping ? .blue : Color.primary)
                .padding(.leading).offset(y: isTyping || !text.isEmpty ? -27 : 0)
                .onTapGesture {
                    isTyping.toggle()
                }
        }
        .animation(.linear(duration: 0.2), value: isTyping)
    }
}
