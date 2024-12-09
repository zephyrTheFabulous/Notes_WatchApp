  //
  //  CreditsView.swift
  //  Notes Watch App
  //
  //  Created by Anthony on 29/10/24.
  //

import SwiftUI

struct CreditsView: View {
    //MARK: - PROPERTIES

  @State private var randomNumber: Int = Int.random(in: 1..<4)

  private var randomImage: String {
    return "developer-no\(randomNumber)"
  }

    //MARK: - BODY
  var body: some View {
    VStack(spacing: 3) {
        // PROFILE IMAGE
      Image(randomImage)
        .resizable()
        .scaledToFit()
        .layoutPriority(1)


        // HEADER
      HeaderView(title: "Credits")


        // CONTENT
      Text("by Efimov Anton")
        .foregroundStyle(.primary)
        .fontWeight(.bold)

      Text("Developer")
        .font(.footnote)
        .foregroundStyle(.secondary)
        .fontWeight(.light)



    } //: VSTACK
  }
}

#Preview {
  CreditsView()
}
