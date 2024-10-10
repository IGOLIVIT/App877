//
//  ArticlesViewModel.swift
//  App877
//
//  Created by IGOR on 09/10/2024.
//

import SwiftUI
import CoreData

final class ArticlesViewModel: ObservableObject {
    
    @AppStorage("name") var name: String = ""
    @AppStorage("photo") var photo: String = ""
    
    @Published var protein: Double = Double(.random(in: 1...20))
    @Published var amino: Double = Double(.random(in: 1...20))
    @Published var vitamins: Double = Double(.random(in: 1...20))
    @Published var creatine: Double = Double(.random(in: 1...20))
    @Published var chromium: Double = Double(.random(in: 1...20))

    @AppStorage("gr") var gr: Int = 0

    @Published var enterName: String = ""
    @Published var enterPhoto: String = ""

    @Published var photos: [String] = ["avatar"]
    
    @Published var isProfile: Bool = false
    
    @Published var types: [String] = ["All", "Support general health", "Tailored support for body functions", "Weight control", "External beauty support", "Improved physical and mental activity", "Healthy eating support"]
    @Published var selType: String = ""
    @Published var curTypeForShow: String = "All"
    
    @Published var images: [String] = ["protein"]
    @Published var imageForAdd: String = ""

    @Published var isAdd: Bool = false
    @Published var isDetail: Bool = false
    @Published var isDelete: Bool = false
    
    @Published var artName: String = ""
    @Published var artPhoto: String = ""
    @Published var artGramm: String = ""
    @Published var artType: String = ""
    @Published var artDescr: String = ""
    @Published var artInstr: String = ""

    @Published var articles: [ArtModel] = []
    @Published var selectedArticle: ArtModel?

    func addArticle() {

        let context = CoreDataStack.shared.persistentContainer.viewContext
        let loan = NSEntityDescription.insertNewObject(forEntityName: "ArtModel", into: context) as! ArtModel

        loan.artName = artName
        loan.artPhoto = artPhoto
        loan.artGramm = artGramm
        loan.artType = artType
        loan.artDescr = artDescr
        loan.artInstr = artInstr

        CoreDataStack.shared.saveContext()
    }

    func fetchArticles() {

        let context = CoreDataStack.shared.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<ArtModel>(entityName: "ArtModel")

        do {

            let result = try context.fetch(fetchRequest)

            self.articles = result

        } catch let error as NSError {

            print("catch")

            print("Error fetching persons: \(error), \(error.userInfo)")

            self.articles = []
        }
    }
}
