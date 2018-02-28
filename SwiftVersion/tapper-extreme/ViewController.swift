
import UIKit

class ViewController: UIViewController {
    
    var maxTaps = 0
    var currentTaps = 0
    
    @IBOutlet weak var logoImg: UIImageView!
    @IBOutlet weak var howManyTapsTxt: UITextField!
    @IBOutlet weak var playBtn: UIButton!
    
    @IBOutlet weak var tapBtn: UIButton!
    @IBOutlet weak var tapsLbl: UILabel!
    
    
    @IBAction func onCoinTapped(_ sender: UIButton) {
        currentTaps += 1
        updateTapsLbl()
        if isGameOver() {restartGame()}
    }

    @IBAction func onPlayBtnPress(_ sender: UIButton) {
        if howManyTapsTxt.text != nil && howManyTapsTxt.text != "" {
            
            logoImg.isHidden = true
            playBtn.isHidden = true
            howManyTapsTxt.isHidden = true
            
            tapBtn.isHidden = false
            tapsLbl.isHidden = false
            
            maxTaps = Int(howManyTapsTxt.text!)!
            currentTaps = 0
            
            updateTapsLbl()
        }
    }

    func restartGame() {
        maxTaps = 0
        howManyTapsTxt.text = ""
        
        logoImg.isHidden = false
        playBtn.isHidden = false
        howManyTapsTxt.isHidden = false
        
        tapBtn.isHidden = true
        tapsLbl.isHidden = true
        
    }
    
    func isGameOver() -> Bool {
        return currentTaps >= maxTaps
    }
    
    func updateTapsLbl() {
        tapsLbl.text = "\(currentTaps) Taps"
    }
}

