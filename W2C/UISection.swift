import UIKit
import SnapKit

class CustomCell: UICollectionViewCell {
    static let identifier = "myCell"
    static var textInfo = String()
    
    override var isSelected: Bool {
        didSet {
            updateAppearance()
            print(collapsedConstraint.isActive)
            print(expandedConstraint.isActive)
            print("")
            print("")
            if collapsedConstraint.isActive {
                self.topContainer.backgroundColor = .systemGray4
                titleLabel.textColor = .black
                arrowImageView.image = UIImage(named: "blackArrow")
            }
            else {
                self.topContainer.backgroundColor = UIColor(named: "mainRed")
                titleLabel.textColor = .white
                arrowImageView.image = UIImage(named: "whiteArrow")
            }
        }
    }
    
    private var expandedConstraint: Constraint!
    private var collapsedConstraint: Constraint!
    
    private lazy var mainContainer = UIView()
    private lazy var topContainer = UIView()
    lazy var bottomContainer = UIView()
    
    
    private lazy var arrowImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "blackArrow")!.withRenderingMode(.alwaysTemplate))
        imageView.tintColor = .black
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        return label
    }()
    
    lazy var informationLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Arial", size: 13)
        label.textAlignment = .left
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.textColor = .white
        print(CustomCell.textInfo)
        label.text = CustomCell.textInfo
        label.sizeToFit()

        return label
    }()
    
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        configureView()
    }
    
    private func updateAppearance() {
        collapsedConstraint.isActive = !isSelected
        expandedConstraint.isActive = isSelected
        

        UIView.animate(withDuration: 0.3) {
            let upsideDown = CGAffineTransform(rotationAngle: .pi * -0.999 )
            self.arrowImageView.transform = self.isSelected ? upsideDown : .identity
        }
    }
    
    private func configureView() {
        mainContainer.clipsToBounds = true
        topContainer.backgroundColor = .systemGray4
        bottomContainer.backgroundColor = UIColor(named: "mainRed")
        bottomContainer.translatesAutoresizingMaskIntoConstraints = false

        let tapGesture = UITapGestureRecognizer()
        bottomContainer.addGestureRecognizer(tapGesture)
        
        contentView.layer.cornerRadius = 12
        contentView.clipsToBounds = true
        
        
        
        makeConstraints()
        updateAppearance()
    }
    
    private func makeConstraints() {
        contentView.addSubview(mainContainer)
        
        mainContainer.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        mainContainer.addSubview(topContainer)
        mainContainer.addSubview(bottomContainer)
        
        topContainer.snp.makeConstraints { make in
            make.top.left.right.equalToSuperview()
            make.height.equalTo(50)
        }
        
        topContainer.snp.prepareConstraints { make in
            collapsedConstraint = make.bottom.equalToSuperview().constraint
            collapsedConstraint.layoutConstraints.first?.priority = .defaultLow
        }
        
        topContainer.addSubview(arrowImageView)
        topContainer.addSubview(titleLabel)
        bottomContainer.addSubview(informationLabel)
        
        arrowImageView.snp.makeConstraints { make in
            make.height.equalTo(16)
            make.width.equalTo(24)
            make.centerY.equalToSuperview()
            make.right.equalToSuperview().offset(-20)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().offset(20)
        }
        
        informationLabel.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.left.equalToSuperview().offset(15)
            make.width.equalToSuperview().multipliedBy(0.95)
        }
        
        bottomContainer.snp.makeConstraints { make in
            make.top.equalTo(topContainer.snp.bottom)
            make.left.right.equalToSuperview()
            make.height.equalTo(informationLabel.snp.height).offset(20)
        }
        
        bottomContainer.snp.prepareConstraints { make in
            expandedConstraint = make.bottom.equalToSuperview().constraint
            expandedConstraint.layoutConstraints.first?.priority = .defaultLow
        }
    }

    
    

    
    
}
