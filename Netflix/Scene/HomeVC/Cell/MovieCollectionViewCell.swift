//
//  MovieCollectionViewCell.swift
//  Netflix
//
//  Created by Ali ahmet Erdoğdu on 29.07.2024.
//

import UIKit
import AlamofireImage

class MovieCollectionViewCell: UICollectionViewCell {
    static let identifier = "MovieCollectionViewCell"
    private let posterImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.frame.size = CGSize(width: UIView().screenWidth * 0.2, height: UIView().screenWidth * 0.3)
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(posterImageView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    public func configure( model: String) {
        guard let url = URL(string: "https://image.tmdb.org/t/p/w500\(model)") else {
            print("Invalid URL string: \(model)")
            return
        }

        posterImageView.frame = CGRect(x: 0, y: 0, width: 100, height: 150) // Example frame

        guard posterImageView.frame != .zero else {
            print("posterImageView has an invalid frame: \(posterImageView.frame)")
            return
        }
        
        self.posterImageView.af.setImage(withURL: url)

    }

    
}
