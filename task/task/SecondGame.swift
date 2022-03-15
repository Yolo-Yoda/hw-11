import UIKit

class SecondGame: UIViewController {

// MARK: - Public properties
    var heartCount = 0
    var actionguard = false
    
//MARK: - IBOutlets
    
    @IBOutlet weak var numberBeats: UITextField!
    @IBOutlet weak var heartImage: UIImageView!
    @IBOutlet weak var showButton: UIButton!
    @IBOutlet weak var sizeHeart: NSLayoutConstraint!
    
// MARK: - Override methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        }
    
// MARK: - IBActions
    
    @IBAction func showActionButton(_ sender: UIButton) {
        if actionguard == false{
            actionguard = true
            heartAnimation()
        } else {
            return
        }
            
    }
    
// MARK: - Private methods
    
    @objc
    private func heartAnimation () {
        let enterNumberBeats = numberBeats.text
        let enterNumberBeatsinminute = 60 / (Double(enterNumberBeats ?? "0") ?? 0)
        UIView.animate(withDuration: TimeInterval(enterNumberBeatsinminute / 2),
                       delay: 0,
                       animations: {
            if enterNumberBeats == "" {
                self.actionguard = false
            }
            self.sizeHeart.constant = 200
            self.view.layoutIfNeeded()
        }, completion: {_ in
            UIView.animate(withDuration: TimeInterval(enterNumberBeatsinminute / 2),
                           delay: 0,
                           animations: {
                if enterNumberBeats == "" {
                    self.actionguard = false
                }
                self.sizeHeart.constant = 120
                self.view.layoutIfNeeded()
            }, completion: {_ in
                self.heartCount += 1
                if self.heartCount < 15 {
                    self.heartAnimation()
                    self.view.layoutIfNeeded()
                }else {
                    self.numberBeats.text = ""
                    self.heartCount = 0
                    self.sizeHeart.constant = 120
                    self.actionguard = false
                    self.view.layoutIfNeeded()
                }
            })
        })
    }
}

