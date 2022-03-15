import UIKit

class ViewController: UIViewController {
    
//MARK: - IBOutlets
    
    @IBOutlet weak var ballImage: UIImageView!
    @IBOutlet weak var textMenu: UILabel!
    @IBOutlet weak var leftConstraint: NSLayoutConstraint!
    @IBOutlet weak var topConstraint: NSLayoutConstraint!
    @IBOutlet weak var ballHeight: NSLayoutConstraint!

// MARK: - Override methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ballImage.center = view.center
        self.view.layoutIfNeeded()
        ballComes()
        timetText()
    }

//MARK: - Private methods
    
    @objc
    private func timetText() {
        Timer.scheduledTimer(timeInterval: 3, target: self, selector: #selector(showText), userInfo: nil, repeats: false)
    }
    
    @objc
    private func showText() {
        textMenu.text = "well, where did you go? come to me!"
    }
    
    @objc
    private func ballComes() {
        Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ballAnimationSecond), userInfo: nil, repeats: false)
    }
    
    @objc
    private func ballAnimationSecond () {
        let maxY = view.frame.height
        let maxX = view.frame.width
        UIView.animate(withDuration: 1.5, delay: 0, animations: {
            let randomHeight = Int.random(in: 50...150)
            self.ballHeight.constant = CGFloat(randomHeight)
            self.ballImage.transform = CGAffineTransform(rotationAngle: .pi)
            self.leftConstraint.constant = 50
            self.topConstraint.constant = 150
            self.view.layoutIfNeeded()
        }, completion: {_ in
            UIView.animate(withDuration: 1.5, delay: 0, animations: {
                let randomHeight = Int.random(in: 50...150)
                self.ballHeight.constant = CGFloat(randomHeight)
                self.leftConstraint.constant = maxX - 100 - CGFloat((randomHeight / 2))
                self.ballImage.transform = CGAffineTransform(rotationAngle: 0)
                self.topConstraint.constant = 150
                self.view.layoutIfNeeded()
            }, completion: {_ in
                UIView.animate(withDuration: 1.5, delay: 0, animations: {
                    let randomHeight = Int.random(in: 50...150)
                    self.ballHeight.constant = CGFloat(randomHeight)
                    self.ballImage.transform = CGAffineTransform(rotationAngle: .pi)
                    self.topConstraint.constant = maxY - 200 - CGFloat((randomHeight / 2))
                    self.leftConstraint.constant = maxX - 100 - CGFloat((randomHeight / 2))
                    self.view.layoutIfNeeded()
                }, completion: {_ in
                    UIView.animate(withDuration: 1.5, delay: 0, animations: {
                        let randomHeight = Int.random(in: 50...150)
                        self.ballHeight.constant = CGFloat(randomHeight)
                        self.ballImage.transform = CGAffineTransform(rotationAngle: 0)
                        self.leftConstraint.constant = 50
                        self.topConstraint.constant = maxY - 200 - CGFloat((randomHeight / 2))
                        self.view.layoutIfNeeded()
                    }, completion: {_ in
                        self.ballAnimationSecond()
                    })
                })
            })
        })
    }
    
}

