
import UIKit

class DetailCell: UITableViewCell {
    
    @IBOutlet var mainImageView: UIImageView!
    @IBOutlet var fvtImageView: UIImageView!
    @IBOutlet var backgroundCellView: UIView!
    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var subTitleLabel: UILabel!
    @IBOutlet var titleLabel: UILabel!
    var dataModel: DsportsViewModel?
    var indexVal: Int?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundCellView.addTopBorder(with: .gray, andWidth: 1)
        backgroundCellView.addBottomBorder(with: .gray, andWidth: 2)
        backgroundCellView.addLeftBorder(with: .gray, andWidth: 1)
        backgroundCellView.addRightBorder(with: .gray, andWidth: 4)
        backgroundCellView.layer.masksToBounds = true
        backgroundCellView.layer.cornerRadius = 5
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    public func createBorderForView(color: UIColor, radius: CGFloat, width: CGFloat = 0.7) {
        self.layer.borderWidth = width
        self.layer.cornerRadius = radius
        self.layer.shouldRasterize = false
        self.layer.rasterizationScale = 2
        self.clipsToBounds = true
        self.layer.masksToBounds = true
        let cgColor: CGColor = color.cgColor
        self.layer.borderColor = cgColor
    }
    
    func updateCOnfiguration() {
        guard let datIndexValue = indexVal, let dataModel = dataModel else {
            return
        }
        
        if let performace = dataModel.dSportValues[datIndexValue].performers, let venue =  dataModel.dSportValues[datIndexValue].venue, let idVal = dataModel.dSportValues[datIndexValue].id  {
            titleLabel.text = venue.name ?? ""
            subTitleLabel.text = venue.state ?? ""
            for datVal in performace {
                if let imageUrl = datVal.image  {
                    let url = URL(string: imageUrl)
                    if let data = try? Data(contentsOf: url!)
                    {
                        let image: UIImage = UIImage(data: data) ?? UIImage()
                        mainImageView.image = image
                    }
                }
                
                if let dateTime = dataModel.dSportValues[datIndexValue].datetime_utc {
                    let formatter = ISO8601DateFormatter()
                    let datetime = formatter.string(from: dateTime)
                    let resultStr = CommonUtility.dateFormatDisplay(dateString: datetime)
                    print("DateTime is:\(resultStr)")
                    dateLabel.text = resultStr
                }
                
                
                let idV = String(idVal)
                if !isKeyPresentInUserDefaults(key: idV) {
                    fvtImageView.image = UIImage(named:"images")
                    UserDefaults.standard.removeObject(forKey: idV)
                    fvtImageView.isHidden = true
                } else {
                    UserDefaults.standard.setValue(true, forKey: idV)
                    fvtImageView.image = UIImage(named:"filled_heart")
                    fvtImageView.isHidden = false
                }
                
            }
        }
    }
    
    func isKeyPresentInUserDefaults(key: String) -> Bool {
        return UserDefaults.standard.object(forKey: key) != nil
    }
}
