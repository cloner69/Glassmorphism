//
//  TransparentBlurView.swift
//  GlassMorphismApp
//
//  Created by Adrian Suryo Abiyoga on 06/06/24.
//

import SwiftUI

struct TransparentBlurView: UIViewRepresentable {
    var removeAllFilters: Bool = false
    func makeUIView(context: Context) ->  TransparentBlurViewHelper {
        return TransparentBlurViewHelper(removeAllFilters: removeAllFilters)
    }
    
    func updateUIView(_ uiView: TransparentBlurViewHelper, context: Context)
    {
        
    }
}
// disabling trait viewfor our transparentblur view
class TransparentBlurViewHelper: UIVisualEffectView {
    
    init(removeAllFilters: Bool) {
        super.init(effect: UIBlurEffect(style: .systemThinMaterial))
        
        // removing background view if its available
        if subviews.indices.contains(1){
            subviews[1].alpha = 0
        }
        if let backdropLayer = layer.sublayers?.first {
            if removeAllFilters{
                backdropLayer.filters = []
            } else{
                // remove allexpect blur filter
                backdropLayer.filters?.removeAll(where: { filter in
                    String(describing: filter) != "gaussianBlur"
                })
            }
        }
    }
    
            required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    //Diasable trait changes
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        
    }
}

#Preview {
    TransparentBlurView()
        .padding(15)
}
