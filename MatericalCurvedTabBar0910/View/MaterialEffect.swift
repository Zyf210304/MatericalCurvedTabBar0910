//
//  MaterialEffect.swift
//  MatericalCurvedTabBar0910
//
//  Created by 张亚飞 on 2021/9/10.
//

import SwiftUI

struct MaterialEffect: UIViewRepresentable {
    
    var style: UIBlurEffect.Style
    
    func makeUIView(context: Context) -> UIVisualEffectView {
    
        let view = UIVisualEffectView(effect: UIBlurEffect(style: style))
        
        return view
    }

    func updateUIView(_ uiView: UIVisualEffectView, context: Context) {
        
    }
}

