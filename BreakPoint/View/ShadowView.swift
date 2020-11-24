//
//  ShadowView.swift
//  BreakPoint
//
//  Created by Maksim Ponomarev on 23.11.2020.
//

import UIKit

class ShadowView: UIView {

    override func awakeFromNib() {
        setupView()
    }
    
    func setupView() {
        self.layer.shadowOpacity = 1
        self.layer.shadowRadius = 30
        self.layer.shadowColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    }

}
