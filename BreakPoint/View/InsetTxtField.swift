//
//  InsetTxtField.swift
//  BreakPoint
//
//  Created by Maksim Ponomarev on 22.11.2020.
//

import UIKit

class InsetTxtField: UITextField {

    private var textTectOffSet: CGFloat = 20
    private var padding = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 0)
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        <#code#>
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        <#code#>
    }
    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        <#code#>
    }
    
    
}
