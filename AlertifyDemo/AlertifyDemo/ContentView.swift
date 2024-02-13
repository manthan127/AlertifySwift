import SwiftUI
import AlertifySwift

struct ContentView: View {
    @Environment(\.alertify) var alertify

    var body: some View {
        List {
            alertSection

            sheetSection
        }
        .listStyle(.inset)
        .buttonStyle(.borderedProminent)
    }

    var alertSection: some View {
        Section("Alert") {
            Button("Alert") {
                alertify.alert(title: "Alert", message: "Ta da!!")
            }

            Button("Alert without animation") {
                alertify.alert(
                    title: "Alert without Animation",
                    message: "without animation this looks weird",
                    animated: false
                )
            }

            Button("Action Sheet") {
                alertify.alert(
                    title: "Action Sheet",
                    message: "Action Sheet message here",
                    style: .actionSheet
                )
            }

            Button("Multiple Buttons"){
                alertify.alert(
                    title: "More Buttons",
                    message: "There are more buttons in here",
                    actions: [
                        UIAlertAction(title: "OK"),
                        UIAlertAction(title: "Cancel", style: .destructive, action: {
                            print("Canceled somthing")
                        })
                    ])
            }

            Button("using AlertController") {
                let alert = UIAlertController(title: "Alert using AlertController", message: "customise it however you wish", preferredStyle: .alert)
                alertify.display(alert: alert)
            }
        }
    }

    var sheetSection: some View {
        Section("Sheet") {
            Button("Sheet") {
                alertify.present(view: SecondView(message: "Sheet Presented"))
            }

            Button("Stop dismiss on swipe-down") {
                alertify.present(
                    view: SecondView(message: "Only way out is that back on top of the screen"),
                    dismissOnSwipe: false
                )
            }
            Button("Without animation") {
                alertify.present(view: SecondView(message: "Sheet Presented without animation"))
            }

            Button("Sheet from ViewController") {
                let storyboard = UIStoryboard(name: "Main", bundle: .main)
                let vc = storyboard.instantiateViewController(withIdentifier: "Viewcontroller")

                alertify.present(viewController: vc)
            }
        }
    }
}

struct SecondView: View {
    let message: String
    var body: some View {
        VStack {
            Button("< Back"){
                Alertify.shared.dismiss()
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding([.leading, .top])

            Spacer()
            Text(message)
                .multilineTextAlignment(.center)
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
