//
//  testView.swift
//  RescueApp
//
//  Created by Vivek on 11/09/24.
//

import SwiftUI

struct SimpleView: View {
    @State private var text = ""

    var body: some View {
        TextField("Enter text", text: $text)
            .padding()
            .textFieldStyle(RoundedBorderTextFieldStyle())
    }
}

#Preview {
    SimpleView()
}
