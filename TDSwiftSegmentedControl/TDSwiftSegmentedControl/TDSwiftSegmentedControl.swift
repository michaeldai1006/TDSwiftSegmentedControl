import Foundation
import UIKit

public class TDSwiftSegmentedControl: UIView {
    // Static values
    static private let buttonGap: CGFloat = 2.0
    
    // Default control config
    static public let defaultConfig = TDSwiftSegmentedControlConfig.init(cornerRadius: 5.0,
                                                                  baseBackgroundColor: UIColor(red:0.95, green:0.95, blue:0.95, alpha:1.0),
                                                                  baseLabelFont: UIFont.boldSystemFont(ofSize: 14.0),
                                                                  baseLabelColor: UIColor(red:0.73, green:0.73, blue:0.73, alpha:1.0),
                                                                  buttonColor: .white,
                                                                  buttonLabelFont: UIFont.boldSystemFont(ofSize: 14.0),
                                                                  buttonLabelColor: .black)
    
    // Control properties
    public var cornerRadius: CGFloat! { didSet { self.updateCornerRadius() } }
    
    // Base properties
    public var baseBackgroundColor: UIColor! { didSet { self.backgroundColor = baseBackgroundColor } }
    public var baseLabelFont: UIFont! { didSet { self.updateBaseLabel() } }
    public var baseLabelColor: UIColor! { didSet { self.updateBaseLabel() } }
    
    // Button properties
    public var buttonColor: UIColor! { didSet { self.controlButton.backgroundColor = buttonColor } }
    public var buttonLabelFont: UIFont! { didSet { self.controlButton.titleLabel?.font = buttonLabelFont } }
    public var buttonLabelColor: UIColor! { didSet { self.controlButton.setTitleColor(buttonLabelColor, for: .normal) } }
    
    // Items
    private var itemTitles: [String]!
    private var baseLabels: [UILabel]!
    private var controlButton: UIButton!
    
    // Computed properties
    private var itemWidth: CGFloat {
        get {
            return itemTitles.isEmpty ? 0.0 : self.frame.width / CGFloat(itemTitles.count)
        }
    }
    
    public init(frame: CGRect, itemTitles: [String], config: TDSwiftSegmentedControlConfig = TDSwiftSegmentedControl.defaultConfig) {
        super.init(frame: frame)
        self.itemTitles = itemTitles
        self.baseLabels = []
        setup()
        configControlProperties(config: config)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.itemTitles = []
        self.baseLabels = []
        setup()
        configControlProperties(config: TDSwiftSegmentedControl.defaultConfig)
    }
    
    private func setup() {
        // Create base labels
        for i in 0..<itemTitles.count {
            let label = UILabel(frame: CGRect(x: CGFloat(i) * itemWidth, y: 0.0, width: itemWidth, height: frame.height))
            label.textAlignment = .center
            label.text = itemTitles[i]
            baseLabels.append(label)
            
            self.addSubview(label)
        }
        
        // Control button
        controlButton = UIButton(frame: CGRect(x: TDSwiftSegmentedControl.buttonGap,
                                               y: TDSwiftSegmentedControl.buttonGap,
                                               width: itemWidth - TDSwiftSegmentedControl.buttonGap * 2,
                                               height: frame.height - TDSwiftSegmentedControl.buttonGap * 2))
        controlButton.setTitle(itemTitles.first, for: .normal)
        self.addSubview(controlButton)
    }
    
    private func configControlProperties(config: TDSwiftSegmentedControlConfig) {
        self.cornerRadius = config.cornerRadius
        self.baseBackgroundColor = config.baseBackgroundColor
        self.baseLabelFont = config.baseLabelFont
        self.baseLabelColor = config.baseLabelColor
        self.buttonColor = config.buttonColor
        self.buttonLabelFont = config.baseLabelFont
        self.buttonLabelColor = config.buttonLabelColor
    }
    
    private func updateCornerRadius() {
        // Base corner radius
        self.clipsToBounds = true
        self.layer.cornerRadius = self.cornerRadius
        
        // Control button
        self.controlButton.clipsToBounds = true
        self.controlButton.layer.cornerRadius = self.cornerRadius
    }
    
    private func updateBaseLabel() {
        for label in baseLabels {
            label.font = baseLabelFont
            label.textColor = baseLabelColor
        }
    }
}
