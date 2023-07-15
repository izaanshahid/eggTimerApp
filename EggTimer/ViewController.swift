import UIKit

class ViewController: UIViewController {
    var timer: Timer?
    var remainingSeconds = 4
    var totalTime: TimeInterval = 0
    var elapsedTime: TimeInterval = 0
    
    let eggTimes = ["Soft": 5, "Medium": 7, "Hard": 12]
    
    @IBOutlet weak var eggLabel: UILabel!
    @IBOutlet weak var progress: UIProgressView!
    
    @IBAction func eggButton(_ sender: UIButton) {
        let hardness = sender.currentTitle
        eggLabel.text = "How do you like your eggs?"
        
        
        remainingSeconds = eggTimes[hardness!]!
        totalTime = TimeInterval(remainingSeconds)
        startTimer()
    }
    
    func startTimer() {
        timer?.invalidate()
        elapsedTime = 0
        updateProgress()
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    
    @objc func updateTimer() {
        if remainingSeconds > 0 {
            remainingSeconds -= 1
            elapsedTime += 1
            updateProgress()
        } else {
            timer?.invalidate()
            print("Egg is cooked!")
            eggLabel.text = "Done!"
        }
    }
    
    func updateProgress() {
        let progressPercentage = Float(elapsedTime / totalTime)
        progress.progress = progressPercentage
    }
}
