import SwiftUI

struct Home: View {
    var body: some View {
        VStack {
            Text("오늘의 글")
                .font(.title)
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
