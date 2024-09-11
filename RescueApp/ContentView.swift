import SwiftUI
import CoreLocation

struct ContentView: View {
    @StateObject private var locationManager = LocationManager()

    var body: some View {
        VStack {
            TabView {
                HomeView()
                    .tabItem {
                        Label("Home", systemImage: "house")
                    }
                
                PersonalInformationView()
                    .tabItem {
                        Label("Personal Information", systemImage: "person.fill")
                    }
                
                EmergencyContactsView()
                    .tabItem {
                        Label("Emergency Contacts", systemImage: "phone.fill")
                    }
            }
            
            if let location = locationManager.location {
                Text("Latitude: \(location.coordinate.latitude)")
                Text("Longitude: \(location.coordinate.longitude)")
            } else {
                Text("Getting location...")
            }
        }
        .padding()
        .onAppear {
            requestNotificationPermission()
        }
    }
}

#Preview {
    ContentView()
}
