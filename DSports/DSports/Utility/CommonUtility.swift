
import Foundation
import UIKit

final class CommonUtility {
    
    /*This method help us to display the alert message whenevr error occured. */
    static func alertMessage(message: String?, title: String? = "") {
        
        let alertView = UIAlertController(title: "", message: message, preferredStyle: .alert)
        alertView.addAction(UIAlertAction(title: "Ok", style: .default, handler: { _ in
        }))
        DispatchQueue.main.async {
            var presentVC = UIApplication.shared.keyWindow?.rootViewController
            while let next = presentVC?.presentedViewController {
                presentVC = next
            }
            presentVC?.present(alertView, animated: true, completion: nil)
            presentVC?.view.bringSubviewToFront(alertView.view)
        }
        
    }
    
    /*This method help us get the date in particular format.
     */
    static func dateFormatDisplay(dateString: String) -> String {
        let inputDate = dateString.replacingOccurrences(of: "T", with: " ")
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ssZ"
        let date = dateFormatter.date(from: inputDate) ?? Date()
        dateFormatter.dateFormat = "EEEE, MMM d yyyy h:mm a"
        print("DATE:\(dateFormatter.string(from: date))")
        let resultStr = dateFormatter.string(from: date)
        return resultStr
    }
    
}
