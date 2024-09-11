import SwiftUI
import Contacts

struct EmergencyContactsView: View {
    @State private var contacts: [EmergencyContact] = [
        EmergencyContact(name: "John Doe", phoneNumber: "123-456-7890"),
        EmergencyContact(name: "Jane Smith", phoneNumber: "098-765-4321")
    ]
    @State private var showingContactPicker = false

    var body: some View {
        NavigationView {
            List {
                ForEach(contacts) { contact in
                    HStack {
                        VStack(alignment: .leading) {
                            Text(contact.name)
                                .font(.headline)
                            Text(contact.phoneNumber)
                                .font(.subheadline)
                        }
                        Spacer()
                        Button(action: {
                            let personalInfo = gatherPersonalInformation()
                            if let url = URL(string: "sms:\(contact.phoneNumber)&body=\(personalInfo.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? "")"),
                               UIApplication.shared.canOpenURL(url) {
                                UIApplication.shared.open(url)
                            }
                        }) {
                            Image(systemName: "message.fill")
                                .foregroundColor(.blue)
                        }
                        .buttonStyle(BorderlessButtonStyle())
                        Button(action: {
                            if let url = URL(string: "tel:\(contact.phoneNumber)"),
                               UIApplication.shared.canOpenURL(url) {
                                UIApplication.shared.open(url)
                            }
                        }) {
                            Image(systemName: "phone.fill")
                                .foregroundColor(.green)
                        }
                        .buttonStyle(BorderlessButtonStyle())
                    }
                }
                .onDelete(perform: deleteContact)
            }
            .navigationTitle("Emergency Contacts")
            .navigationBarItems(trailing: Button(action: {
                showingContactPicker = true
            }) {
                Image(systemName: "plus")
            })
            .sheet(isPresented: $showingContactPicker) {
                ContactPickerView(contacts: $contacts)
            }
        }
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

    private func deleteContact(at offsets: IndexSet) {
        contacts.remove(atOffsets: offsets)
    }
}

struct ContactPickerView: View {
    @Binding var contacts: [EmergencyContact]
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        VStack {
            Text("Contact Picker Placeholder")
            Button("Add Sample Contact") {
                let newContact = EmergencyContact(name: "New Contact", phoneNumber: "111-222-3333")
                contacts.append(newContact)
                presentationMode.wrappedValue.dismiss()
            }
        }
    }
}

#Preview {
    EmergencyContactsView()
}
