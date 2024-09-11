import SwiftUI

struct PersonalInformationView: View {
    @State private var name: String = UserDefaults.standard.string(forKey: "name") ?? ""
    @State private var age: String = UserDefaults.standard.string(forKey: "age") ?? ""
    @State private var bloodGroup: String = UserDefaults.standard.string(forKey: "bloodGroup") ?? ""
    @State private var phoneNumber: String = UserDefaults.standard.string(forKey: "phoneNumber") ?? ""
    @State private var address: String = UserDefaults.standard.string(forKey: "address") ?? ""
    @State private var isEditing: Bool = false

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Personal Information")) {
                    TextField("Name", text: $name)
                        .disabled(!isEditing)
                    TextField("Age", text: $age)
                        .disabled(!isEditing)
                    TextField("Blood Group", text: $bloodGroup)
                        .disabled(!isEditing)
                    TextField("Phone Number", text: $phoneNumber)
                        .disabled(!isEditing)
                    TextField("Address", text: $address)
                        .disabled(!isEditing)
                }
                Section {
                    if isEditing {
                        Button(action: savePersonalInformation) {
                            Text("Save")
                        }
                    } else {
                        Button(action: { isEditing = true }) {
                            Text("Edit")
                        }
                    }
                }
            }
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
}

#Preview {
    PersonalInformationView()
}