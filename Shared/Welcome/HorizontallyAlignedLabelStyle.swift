//
//  HorizontallyAlignedLabelStyle.swift
//  Kuchi
//
//  Created by Baris Karalar on 15.11.22.
//

import SwiftUI

struct HorizontallyAlignedLabelStyle: LabelStyle {
    func makeBody(configuration: Configuration) -> some View {
        HStack {
            configuration.icon
            configuration.title
        }
    }
}
