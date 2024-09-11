import SwiftUI

struct AddContactView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var name = ""
    @State private var phoneNumber = ""
    @Binding var contacts: [EmergencyContact]

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Contact Info")) {
                    TextField("Name", text: $name)
                        .autocapitalization(.words)
                        .disableAutocorrection(true)
                    TextField("Phone Number", text: $phoneNumber)
                        .keyboardType(.phonePad)
                }
            }
            .navigationTitle("Add Contact")
            .navigationBarItems(leading: Button("Cancel") {
                presentationMode.wrappedValue.dismiss()
            }, trailing: Button("Save") {
                saveContact()
            })
        }
        .onAppear {
            print("AddContactView appeared")
        }
    }

    private func saveContact() {
        guard !name.isEmpty, !phoneNumber.isEmpty else {
            presentationMode.wrappedValue.dismiss()
            return
        }
        let newContact = EmergencyContact(name: name, phoneNumber: phoneNumber)
        contacts.append(newContact)
        presentationMode.wrappedValue.dismiss()
    }
}

#Preview {
    AddContactView(contacts: .constant([]))
}
