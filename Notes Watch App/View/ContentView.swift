  //
  //  ContentView.swift
  //  Notes Watch App
  //
  //  Created by Anthony on 29/10/24.
  //

import SwiftUI

struct ContentView: View {
    //MARK: - PROPERTIES

  @AppStorage("lineCount") var lineCount: Int = 1

  @State private var notes: [Note] = [Note]()
  @State private var text: String = ""

    //MARK: - FUNCTIONS

    // storage method
  func getDocumentDirectory() -> URL {
    let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
    return path[0]
  }

  func save() {
      //    dump (notes)
    do {
        // 1.Convert the notes array to data using JSONEncoder
      let data = try JSONEncoder().encode(notes)

        // 2.Create a new URL to save the file using the getDocumentDirectory
      let url = getDocumentDirectory().appendingPathComponent("notes")

        // 3.Write data to the give URL
      try data.write(to: url)

    } catch {
      print("Couldn't save data")
    }
  }

  func load() {
    DispatchQueue.main.async {

      do {
          // 1.Get note URL path
        let url = getDocumentDirectory().appendingPathComponent("notes")

          // 2.Create new property for the data
        let data = try Data(contentsOf: url)

          // 3.Decode data
        notes = try JSONDecoder().decode([Note].self, from: data)

      } catch {
          // do nothing when user starts app for the first time or all notes are deleted
      }
    }
  }

  func delete(offsets: IndexSet) {
    withAnimation {
      notes.remove(atOffsets: offsets)
      save()
    }
  }

    //MARK: - BODY
  var body: some View {
    NavigationStack {
      VStack {
        HStack(alignment: .center, spacing: 6) {
          TextField("Add new note", text: $text)

          Button {
              // 1. Action only when TextField is not empty
            guard text.isEmpty == false else {
              return
            }

              // 2. Create new note item and initialize it with the text value
            let note = Note(id: UUID(), text: text)

              // 3. Append new note item to the array
            notes.append(note)

              // 4. Clear content of TextField
            text = ""

              // 5. Save note
            save()

          } label: {
            Image(systemName: "plus.circle")
              .font(.system(size: 42, weight: .semibold))
          }
          .fixedSize()
          .buttonStyle(.plain)
          .foregroundStyle(.accent)
            //          .frame(minWidth: 30)
            //          .tint(.accent)

        } //: HSTACK
        Spacer()

        if notes.count >= 1 { // two states when there are notes and when there are no notes at all
          List {
            ForEach(0..<notes.count, id: \.self) { item in
              NavigationLink(destination: DetailView(note: notes[item], count: notes.count, index: item)) {
                HStack {
                  Capsule()
                    .frame(width: 4)
                    .foregroundStyle(.accent)
                  Text(notes[item].text)
                    .lineLimit(lineCount)
                    .padding(.leading, 5)
                }
              } //: HSTACK
            } //: LOOP
            .onDelete(perform: delete)
          }
        } else {
          Spacer()
          Image(systemName: "note.text")
            .resizable()
            .scaledToFit()
            .foregroundStyle(.gray)
            .opacity(0.25)
            .padding(25)
          Spacer()
        } //: LIST
      } //: MAIN VSTACK
      .navigationTitle("Notes")
      .navigationBarTitleDisplayMode(.large)
      .onAppear {
        load()
      }
    }
  }
}

#Preview {

  ContentView()

}
