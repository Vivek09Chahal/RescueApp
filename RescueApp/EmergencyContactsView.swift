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
                            if let url = URL(string: "sms:\(contact.phoneNumber)"),
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
    
    private func deleteContact(at offsets: IndexSet) {
        contacts.remove(atOffsets: offsets)
    }
}

#Preview {
    EmergencyContactsView()
}
