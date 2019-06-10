import UIKit

class ViewController: UIViewController, TDSwiftSegmentedControlDelegate {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Control instance
        let controlFrame = CGRect(x: 26.0, y: 100.0, width: self.view.frame.width - 52.0, height: 40.0)
        let segmentedControl = TDSwiftSegmentedControl(frame: controlFrame,
                                                       itemTitles: ["Apple", "Banana", "Orange"])
        
        // Control delegate
        segmentedControl.delegate = self
        
        // Add control as subview
        self.view.addSubview(segmentedControl)
    }
    
    func itemSelected(atIndex index: Int) {
        print("Item selected at index \(index)")
    }
}

