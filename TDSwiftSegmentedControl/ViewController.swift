import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let controlFrame = CGRect(x: 26.0, y: 100.0, width: self.view.frame.width - 52.0, height: 40.0)
        let segmentedControl = TDSwiftSegmentedControl(frame: controlFrame,
                                                       itemTitles: ["Apple", "Banana", "Orange"])
        self.view.addSubview(segmentedControl)
    }
}

