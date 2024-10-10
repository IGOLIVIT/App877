//
//  BadsViewModel.swift
//  App877
//
//  Created by IGOR on 10/10/2024.
//

import SwiftUI
import CoreData

final class BadsViewModel: ObservableObject {
    
    @Published var images: [String] = ["im1", "im2", "im3", "im4", "im5"]
    @Published var currentIm: String = ""

    @Published var isAdd: Bool = false
    @Published var isDetail: Bool = false
    @Published var isDelete: Bool = false
    @Published var isNot1: Bool = false
    @Published var isNot2: Bool = false

    
    @Published var notName: String = ""
    @Published var notPhoto: String = ""
    @Published var notTxt: String = ""
    @Published var notSub: String = ""

    @Published var notes: [NotesModel] = []
    @Published var selectedNote: NotesModel?

    func addNote() {

        let context = CoreDataStack.shared.persistentContainer.viewContext
        let loan = NSEntityDescription.insertNewObject(forEntityName: "NotesModel", into: context) as! NotesModel

        loan.notName = notName
        loan.notPhoto = notPhoto
        loan.notTxt = notTxt
        loan.notSub = notSub

        CoreDataStack.shared.saveContext()
    }

    func fetchNotes() {

        let context = CoreDataStack.shared.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NotesModel>(entityName: "NotesModel")

        do {

            let result = try context.fetch(fetchRequest)

            self.notes = result

        } catch let error as NSError {

            print("catch")

            print("Error fetching persons: \(error), \(error.userInfo)")

            self.notes = []
        }
    }
}
