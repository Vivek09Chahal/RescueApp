import SwiftUI
import CoreLocation

struct HomeView: View {
    @StateObject private var locationManager = LocationManager()
    
    var body: some View {
        NavigationView {
            ZStack {
                // Gradient background
                LinearGradient(gradient: Gradient(colors: [.blue, .purple]), startPoint: .top, endPoint: .bottom)
                    .edgesIgnoringSafeArea(.all)
                
                // Semi-transparent overlay
                Color.black.opacity(0.3)
                    .edgesIgnoringSafeArea(.all)
                
                VStack(alignment: .leading, spacing: 20) {

                        if let location = locationManager.location {
                            Text("Latitude: \(location.coordinate.latitude)")
                            Text("Longitude: \(location.coordinate.longitude)")
                        } else {
                            Text("Fetching location...")
                        }
                    
                    HStack(alignment: .bottom){
                        Image(systemName: "exclamationmark.triangle.fill")
                            .resizable()
                            .frame(width: 30, height: 30)
                            .foregroundStyle(.yellow)
                        
                        Text("Rescue App")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .padding(.top)
                            .foregroundColor(.white)
                    }

                    Text("Safety Tips")
                        .font(.title2)
                        .fontWeight(.semibold)
                        .padding(.bottom, 10)
                        .foregroundColor(.white)

                    HStack {
                        Image(systemName: "seatbelt.fill")
                        Text("Always wear your seatbelt and ensure that all passengers are buckled up.")
                    }
                    .foregroundColor(.white)
                    HStack {
                        Image(systemName: "speedometer")
                        Text("Observe and obey traffic laws and speed limits.")
                    }
                    .foregroundColor(.white)
                    HStack {
                        Image(systemName: "phone.fill")
                        Text("Avoid distractions such as texting, talking on the phone, or eating while driving.")
                    }
                    .foregroundColor(.white)
                    HStack {
                        Image(systemName: "car.fill")
                        Text("Keep a safe distance from the vehicle in front of you to allow for sudden stops.")
                    }
                    .foregroundColor(.white)
                    HStack {
                        Image(systemName: "arrow.turn.up.right")
                        Text("Use turn signals to indicate your intentions to other drivers.")
                    }
                    .foregroundColor(.white)
                    HStack {
                        Image(systemName: "eye.fill")
                        Text("Check your mirrors frequently and be aware of your surroundings.")
                    }
                    .foregroundColor(.white)
                    HStack {
                        Image(systemName: "exclamationmark.triangle.fill")
                        Text("Avoid aggressive driving behaviors such as tailgating or excessive speeding.")
                    }
                    .foregroundColor(.white)
                    HStack {
                        Image(systemName: "nosign")
                        Text("Do not drive under the influence of alcohol or drugs.")
                    }
                    .foregroundColor(.white)
                }
                .padding()
            }
        }
    }
}

#Preview {
    HomeView()
}
