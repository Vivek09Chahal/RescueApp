import SwiftUI
import Contacts

struct ContactPickerView: View {
    @Environment(\.presentationMode) var presentationMode
    @Binding var contacts: [EmergencyContact]
    @State private var contactStore = CNContactStore()
    @State private var contactList: [CNContact] = []
    @State private var permissionDenied = false

    var body: some View {
        NavigationView {
            if permissionDenied {
                VStack {
                    Text("Permission to access contacts was denied. Please enable it in settings.")
                        .padding()
                    Button(action: openSettings) {
                        Text("Open Settings")
                            .foregroundColor(.blue)
                    }
                }
            } else {
                List(contactList, id: \.identifier) { contact in
                    Button(action: {
                        addContact(contact)
                    }) {
                        VStack(alignment: .leading) {
                            Text(contact.givenName + " " + contact.familyName)
                                .font(.headline)
                            if let phoneNumber = contact.phoneNumbers.first?.value.stringValue {
                                Text(phoneNumber)
                                    .font(.subheadline)
                            }
                        }
                    }
                }
                .navigationTitle("Select Contact")
                .navigationBarItems(leading: Button("Cancel") {
                    presentationMode.wrappedValue.dismiss()
                })
                .onAppear(perform: requestAccess)
            }
        }
    }

    private func requestAccess() {
        contactStore.requestAccess(for: .contacts) { granted, error in
            DispatchQueue.main.async {
                if granted {
                    fetchContacts()
                } else {
                    permissionDenied = true
                }
            }
        }
    }

    private func fetchContacts() {
        let keys = [CNContactGivenNameKey, CNContactFamilyNameKey, CNContactPhoneNumbersKey]
        let request = CNContactFetchRequest(keysToFetch: keys as [CNKeyDescriptor])
        do {
            var contacts: [CNContact] = []
            try contactStore.enumerateContacts(with: request) { (contact, stop) in
                contacts.append(contact)
            }
            self.contactList = contacts
        } catch {
            print("Failed to fetch contacts: \(error)")
        }
    }

    private func addContact(_ contact: CNContact) {
        if let phoneNumber = contact.phoneNumbers.first?.value.stringValue {
            let newContact = EmergencyContact(name: contact.givenName + " " + contact.familyName, phoneNumber: phoneNumber)
            contacts.append(newContact)
            presentationMode.wrappedValue.dismiss()
        }
    }

    private func openSettings() {
        if let url = URL(string: UIApplication.openSettingsURLString) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
}
