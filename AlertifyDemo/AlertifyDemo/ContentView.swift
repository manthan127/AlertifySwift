import SwiftUI
import AlertifySwift

struct ContentView: View {
    @State var dismissOnSwipe = true
    @Environment(\.alertify) var alertify

    var body: some View {
        List {
            Section("Alert") {
                Button("Normal Alert") {
                    alertify.alert(title: "Title is optional", message: "message of alert")
                }
            }

            Section("Sheet") {
                Toggle("Dismiss Sheets on swipe down", isOn: $dismissOnSwipe)

                Button("Normal Sheet") {
                    alertify.present(view: SecondView(), dismissOnSwipe: dismissOnSwipe)
                }
            }
        }
        .buttonStyle(.bordered)
    }
}

struct SecondView: View {
    var body: some View {
        VStack {
            Button("< Back"){
                Alertify.shared.dismiss()
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding([.leading, .top])

            Spacer()
            Text("This is second View")
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
