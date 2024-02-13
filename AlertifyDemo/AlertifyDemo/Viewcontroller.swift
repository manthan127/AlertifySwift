import UIKit
import AlertifySwift

class Viewcontroller: UIViewController {

    @IBAction func backAction(_ sender: Any) {
        Alertify.shared.dismiss()
    }
}
