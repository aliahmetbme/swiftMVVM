//
//  MainHeroHeaderView.swift
//  Netflix
//
//  Created by Ali ahmet Erdoğdu on 29.07.2024.
//

import UIKit
import SnapKit

class MainHeroHeaderView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        drawUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func drawUI() {
        lazy var heroImage = UIImageView()
        heroImage.image = UIImage(named: "great")
        addSubview(heroImage)
        
        heroImage.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide)
            make.right.left.equalToSuperview()
            make.height.equalTo(screenHeigth * 0.35)
        }
        addGradient()
        
        lazy var playButton = UIButton()
        playButton.setTitle("Play", for: .normal)
        playButton.layer.borderColor = UIColor.white.cgColor
        playButton.layer.borderWidth = 1
        playButton.layer.cornerRadius = 10
        addSubview(playButton)
        
        playButton.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(0.3 * screenHeigth)
            make.left.equalToSuperview().offset(0.2 * screenWidth)
            make.width.equalTo(100)
        }
        
        lazy var downloadButton = UIButton()
        downloadButton.setTitle("Download", for: .normal)
        downloadButton.layer.borderColor = UIColor.white.cgColor
        downloadButton.layer.borderWidth = 1
        downloadButton.layer.cornerRadius = 10
        
        addSubview(downloadButton)
        
        downloadButton.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(0.3 * screenHeigth)
            make.right.equalToSuperview().offset(-0.2 * screenWidth)
            make.width.equalTo(100)
        }
        
    }
    private func addGradient() {
        lazy var gradientLayer = CAGradientLayer()
        gradientLayer.frame = bounds
        gradientLayer.colors = [
            UIColor.systemPink.cgColor,
        ]
        
        layer.addSublayer(gradientLayer)
    }
}
