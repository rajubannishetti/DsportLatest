
import UIKit

class DetailViewController: UIViewController {

    @IBOutlet var fvtImageView: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var backactionImageView: UIImageView!
    @IBOutlet var descriptionImageView: UIImageView!
    @IBOutlet var placeLabel: UILabel!
    var dataModel = DsportsViewModel()
    var dataIndex: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        dataConfiguration()
        
    }
 
    override func viewWillAppear(_ animated: Bool) {
        let fvtImage = UITapGestureRecognizer(target: self, action: #selector(favouriteSelectUnselect))
        fvtImageView.isUserInteractionEnabled = true
        fvtImageView.addGestureRecognizer(fvtImage)
        
        let backBtn = UITapGestureRecognizer(target: self, action: #selector(backAction))
        backactionImageView.isUserInteractionEnabled = true
        backactionImageView.addGestureRecognizer(backBtn)
        guard let datIndexValue = dataIndex else {
            return
        }
        if  let idVal = dataModel.dSportValues[datIndexValue].id {
            let idV = String(idVal)
            if isKeyPresentInUserDefaults(key: idV) {
                UserDefaults.standard.setValue(true, forKey: idV)
                fvtImageView.image = UIImage(named:"filled_heart")
            } else {
                fvtImageView.image = UIImage(named:"images")
                UserDefaults.standard.removeObject(forKey: idV)
            }
        }
    }

    /*This method will help us to select and deselect the favourite
     Note: I didn't find the api for to updating favourite because of this just added the method and local updation just.
     */
    @objc func favouriteSelectUnselect() {
        print("Selected..")
        guard let datIndexValue = dataIndex else {
            return
        }
        if  let idVal = dataModel.dSportValues[datIndexValue].id {
            let idV = String(idVal)
            if isKeyPresentInUserDefaults(key: idV) {
                fvtImageView.image = UIImage(named:"images")
                UserDefaults.standard.removeObject(forKey: idV)
            } else {
                UserDefaults.standard.setValue(true, forKey: idV)
                fvtImageView.image = UIImage(named:"filled_heart")
            }
        }
    }
    
    /*This method will help us to navigating to back action*/
    @objc func backAction() {
        self.dismiss(animated: true, completion: nil)
    }
    
    /*
     This method will help us to configure the data.
     */
    func dataConfiguration() {
        guard let datIndexValue = dataIndex else {
            return
        }
        if let performace = dataModel.dSportValues[datIndexValue].performers, let venue =  dataModel.dSportValues[datIndexValue].venue{
            titleLabel.text = venue.name ?? ""
            placeLabel.text = venue.timezone ?? ""
            for datVal in performace {
                if let imageUrl = datVal.image  {
                    let url = URL(string: imageUrl)
                    if let data = try? Data(contentsOf: url!)
                    {
                        let image: UIImage = UIImage(data: data) ?? UIImage()
                        descriptionImageView.image = image
                    }
                }
                
                if let dateTime = dataModel.dSportValues[datIndexValue].datetime_utc {
                    let formatter = ISO8601DateFormatter()
                    let datetime = formatter.string(from: dateTime)
                    //print("DateTime is:\(dateTime)")
                    
                    let resultStr = CommonUtility.dateFormatDisplay(dateString: datetime)
                    dateLabel.text = resultStr
                    //print("DATE:\(resultStr)")
                }
                
                
            }
        }
    }
    
    /*
     For local favourite verification purpose we added this method.
     */
    func isKeyPresentInUserDefaults(key: String) -> Bool {
        return UserDefaults.standard.object(forKey: key) != nil
    }
}
