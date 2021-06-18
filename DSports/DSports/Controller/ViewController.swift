

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    
    }

    /*
     This method will help us to beging the app and start api calling
     */
    @IBAction func startAction(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "DetailListViewController") as! DetailListViewController
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)
    }
}

