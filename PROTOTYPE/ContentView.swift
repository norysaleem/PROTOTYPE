import SwiftUI

struct HomeView: View {
    @State private var merits: Int = 0
    @State private var isLoading: Bool = true

    var body: some View {
        NavigationView {
            VStack {
                // Welcome Message
                VStack {
                    Text("Deepseek-V3")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    Text("Welcome back...")
                        .font(.title2)
                        .foregroundColor(.gray)
                }
                .padding(.top, 50)

                Spacer()

                // Merit Viewing System
                if isLoading {
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle())
                        .padding()
                } else {
                    Text("Your Merits: \(merits)")
                        .font(.title)
                        .fontWeight(.semibold)
                        .padding()
                }

                Spacer()

                // Bottom Navigation Bar
                BottomNavigationBar()
            }
            .onAppear {
                fetchMeritsFromGoogleSheet()
            }
        }
    }

    // Function to fetch merits from Google Spreadsheet
    private func fetchMeritsFromGoogleSheet() {
        // Replace with your Google Sheets API logic
        // For now, simulate a network call with a delay
        DispatchQueue.global().asyncAfter(deadline: .now() + 2) {
            DispatchQueue.main.async {
                self.merits = 100 // Replace with actual data
                self.isLoading = false
            }
        }
    }
}

// Bottom Navigation Bar
struct BottomNavigationBar: View {
    var body: some View {
        HStack {
            // Profile Button
            NavigationLink(destination: ProfileView()) {
                VStack {
                    Image(systemName: "person.circle")
                        .font(.system(size: 24))
                    Text("Profile")
                        .font(.caption)
                }
                .foregroundColor(.black)
            }
            .frame(maxWidth: .infinity)

            // Clubs Button
            NavigationLink(destination: ClubsView()) {
                VStack {
                    Image(systemName: "list.bullet")
                        .font(.system(size: 24))
                    Text("Clubs")
                        .font(.caption)
                }
                .foregroundColor(.black)
            }
            .frame(maxWidth: .infinity)

            // Home Button
            NavigationLink(destination: HomeView()) {
                VStack {
                    Image(systemName: "house.fill")
                        .font(.system(size: 24))
                    Text("Home")
                        .font(.caption)
                }
                .foregroundColor(.black)
            }
            .frame(maxWidth: .infinity)

            // Videos Button
            NavigationLink(destination: VideosView()) {
                VStack {
                    Image(systemName: "play.circle")
                        .font(.system(size: 24))
                    Text("Videos")
                        .font(.caption)
                }
                .foregroundColor(.black)
            }
            .frame(maxWidth: .infinity)

            // Settings Button
            NavigationLink(destination: SettingsView()) {
                VStack {
                    Image(systemName: "gear")
                        .font(.system(size: 24))
                    Text("Settings")
                        .font(.caption)
                }
                .foregroundColor(.black)
            }
            .frame(maxWidth: .infinity)
        }
        .padding(.vertical, 10)
        .background(Color.white)
        .shadow(radius: 5)
    }
}

// Placeholder Views for Navigation
struct ProfileView: View {
    var body: some View {
        Text("Profile Page")
            .font(.largeTitle)
            .padding()
    }
}

struct ClubsView: View {
    var body: some View {
        Text("Clubs Page")
            .font(.largeTitle)
            .padding()
    }
}

struct VideosView: View {
    var body: some View {
        Text("Videos Page")
            .font(.largeTitle)
            .padding()
    }
}

struct SettingsView: View {
    var body: some View {
        Text("Settings Page")
            .font(.largeTitle)
            .padding()
    }
}

// Main App Entry
@main
struct MyApp: App {
    var body: some Scene {
        WindowGroup {
            HomeView()
        }
    }
}
