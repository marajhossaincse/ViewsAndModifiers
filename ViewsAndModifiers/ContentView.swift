//
//  ContentView.swift
//  ViewsAndModifiers
//
//  Created by Maraj Hossain on 8/27/23.
//

/**
  Create a custom ViewModifier (and accompanying View extension) that makes a view have a large, blue font suitable for prominent titles in a view.
 **/

struct Watermark: ViewModifier {
    var text: String

    func body(content: Content) -> some View {
        ZStack(alignment: .bottomTrailing) {
            content
            Text(text)
                .font(.caption)
                .foregroundColor(.white)
                .padding(5)
                .background(.black)
        }
    }
}

extension View {
    func watermarked(with text: String) -> some View {
        modifier(Watermark(text: text))
    }
}

import SwiftUI

struct Title: ViewModifier {
    var text: String

    func body(content: Content) -> some View {
        Text(text)
            .foregroundColor(.blue)
            .font(.system(.title, weight: .semibold))
            .padding(5)
            .frame(width: 100, height: 100, alignment: .top)

        content
    }
}

extension View {
    func titled(with text: String) -> some View {
        modifier(Title(text: text))
    }
}

struct ContentView: View {
    var body: some View {
        VStack {
            Text("Some content")
        }
        .titled(with: "Title")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
