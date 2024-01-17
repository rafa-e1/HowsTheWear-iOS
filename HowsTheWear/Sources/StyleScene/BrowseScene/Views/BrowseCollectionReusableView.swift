//
//  BrowseCollectionReusableView.swift
//  HowsTheWear
//
//  Created by 제민우 on 1/13/24.
//

import UIKit

import SnapKit

// BrowseCollectionView Header View

final class BrowseCollectionReusableView: UICollectionReusableView {
    
    static let reuseIdentifier = "browseCollectionViewHeader"
    
    let browseHeaderLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 15, weight: .semibold)
        $0.textColor = .black
        $0.textAlignment = .left
        $0.text = "헤더 레이블"
    }
    
    private let browseHeaderRightArrowButton = UIButton().then {
        $0.setImage(UIImage(systemName: "chevron.right"), for: .normal)
        $0.imageView?.contentMode = .scaleAspectFit
        $0.tintColor = .black
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        configureSubviews()
        configureLayout()
        
        let screenHeight = UIScreen.main.bounds.height
        if screenHeight >= 890 {
            browseHeaderLabel.font = .systemFont(ofSize: 17, weight: .semibold)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

// MARK: - Configure UI
extension BrowseCollectionReusableView {
    
    private func configureSubviews() {
        [browseHeaderLabel, browseHeaderRightArrowButton].forEach {
            addSubview($0)
        }
    }
    
    private func configureLayout() {
        browseHeaderLabel.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.bottom.equalToSuperview()
        }
        
        browseHeaderRightArrowButton.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview()
            make.trailing.equalToSuperview().offset(-16)
        }
    }
    
}
