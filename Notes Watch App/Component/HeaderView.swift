//
//  HeaderView.swift
//  Notes Watch App
//
//  Created by Anthony on 29/10/24.
//

import SwiftUI

struct HeaderView: View {
    //MARK: - PROPERTIES

  var title: String = "" // it is a value even though it is empty(not nil), that's why preview doesn't asks for value

    //MARK: - BODY
    var body: some View {
      VStack {
        // TITLE
        if title != "" {
          Text(title.uppercased())
            .font(.title3)
            .fontWeight(.bold)
            .foregroundStyle(.accent)
        }

        // SEPARATOR
        HStack {
          Capsule()
            .frame(height: 1)
          
          Image(systemName: "note.text")
          
          Capsule()
            .frame(height: 1)
        } //: HSTACK
        .foregroundStyle(.accent)
      } //: VSTACK
    }
}

#Preview {
  HeaderView(title: "Credits")
}
#Preview {
  HeaderView()
}
