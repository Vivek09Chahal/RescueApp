import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 20) {
                Text("Rescue App")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.top)

                Text("Safety Tips")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .padding(.bottom, 10)

                HStack {
                    Image(systemName: "seatbelt.fill")
                    Text("Always wear your seatbelt and ensure that all passengers are buckled up.")
                }
                HStack {
                    Image(systemName: "speedometer")
                    Text("Observe and obey traffic laws and speed limits.")
                }
                HStack {
                    Image(systemName: "phone.fill")
                    Text("Avoid distractions such as texting, talking on the phone, or eating while driving.")
                }
                HStack {
                    Image(systemName: "car.fill")
                    Text("Keep a safe distance from the vehicle in front of you to allow for sudden stops.")
                }
                HStack {
                    Image(systemName: "arrow.turn.up.right")
                    Text("Use turn signals to indicate your intentions to other drivers.")
                }
                HStack {
                    Image(systemName: "eye.fill")
                    Text("Check your mirrors frequently and be aware of your surroundings.")
                }
                HStack {
                    Image(systemName: "exclamationmark.triangle.fill")
                    Text("Avoid aggressive driving behaviors such as tailgating or excessive speeding.")
                }
                HStack {
                    Image(systemName: "nosign")
                    Text("Do not drive under the influence of alcohol or drugs.")
                }

                Spacer()
            }
            .padding()
        }
    }
}

#Preview {
    HomeView()
}
