//
//  UserWallpaperCell.swift
//  BackgroundMaker
//
//  Created by HeonJin Ha on 2022/10/30.
//

import UIKit
import SnapKit

class UserWallpaperCell: UICollectionViewCell {
    
    static let reuseID = "UserWallpaperCell"
    
    var imageView = UIImageView()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        backgroundColor = .clear
        //MARK: SubView (imageView) 구성하기.
        contentView.backgroundColor = .clear
        contentView.clipsToBounds = true
        imageView.contentMode = .scaleToFill
        imageView.backgroundColor = .clear
        ViewModelForCocoa.shared.cropCornerRadius(view: imageView, radius: 5)
        
        addSubview(imageView)

        //MARK: AutoLayout 구성 (Snapkit 사용)
        imageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}
