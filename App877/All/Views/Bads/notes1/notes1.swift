//
//  notes1.swift
//  App877
//
//  Created by IGOR on 10/10/2024.
//

import SwiftUI

struct notes1: View {

    @StateObject var viewModel: BadsViewModel
    @Environment(\.presentationMode) var router
    
    var body: some View {

        ZStack {
            
            Color("bg3")
                .ignoresSafeArea()
            
            VStack(alignment: .leading) {
                
                HStack {
                    
                    Button(action: {
                        
                        router.wrappedValue.dismiss()
                        
                    }, label: {
                        
                        Image(systemName: "chevron.left")
                            .foregroundColor(Color("prim"))
                            .font(.system(size: 17, weight: .medium))
                        
                        Text("Back")
                            .foregroundColor(Color("prim"))
                            .font(.system(size: 15, weight: .regular))
                    })
                    
                    Spacer()
                }
            .padding(.vertical, 30)
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    VStack(alignment: .leading) {
                        
                        Text("Everything has its time.")
                            .foregroundColor(.white)
                            .font(.system(size: 32, weight: .medium))
                            .padding(.vertical, 20)
                        
                        Image("im4")
                            .resizable()
                            .frame(maxWidth: .infinity)
                            .frame(height: 220)
                        
                            Text("""
                                 The simplest and most accessible way to maintain a balanced lifestyle is by taking vitamins and other dietary supplements. However, it’s important to note that they are most effective when taken correctly. Each micronutrient is best absorbed at a specific time of day.
                                 
                                 Here's how to take supplements so they work effectively:

                                 Vitamins C and B12
                                 Vitamin C is the primary antioxidant in the body.

                                 Strengthens blood vessel walls and supports skin elasticity;
                                 Promotes the production of sex and adrenal hormones;
                                 Prevents the development of malignant tumors;
                                 Boosts the immune system.
                                 Vitamin B12

                                 Stimulates blood formation processes;
                                 Participates in the synthesis of DNA and RNA;
                                 Normalizes the functioning of the nervous system;
                                 Accelerates metabolism.
                                 These two vitamins are water-soluble, so it's important to take them with a large amount of liquid. They should be taken in the morning on an empty stomach with a glass of water. Since they can stimulate the nervous system, plan to take them in the first half of the day.

                                 Vitamin D and other fat-soluble vitamins
                                 These vitamins dissolve and are absorbed only in a fatty environment. They include:

                                 Vitamin A (Retinol)

                                 Supports growth processes;
                                 Functions of the skin epithelium and bone tissue;
                                 Maintenance of immunological status;
                                 Light perception by the retina.
                                 Vitamin D (Calciferol)
                                 A vital vitamin necessary for the normal formation of a newborn's skeleton.

                                 Facilitates calcium and phosphorus metabolism in the body;
                                 Ensures bone strength.
                                 Vitamin E (Tocopherol)

                                 Removes toxic substances and free radicals;
                                 Prevents cell destruction.
                                 Vitamin K

                                 Facilitates the synthesis of some blood clotting factors in the liver;
                                 Participates in bone tissue formation.
                                 For maximum absorption, fat-soluble vitamins should be taken at lunch after consuming fatty foods, such as fatty fish (salmon, mackerel, tuna), eggs, dairy products, or any other meal cooked with added oil.

                                 Omega-3 Polyunsaturated Fatty Acids (PUFAs)

                                 'Cleanse' the walls of blood vessels from excess 'bad' cholesterol and prevent the formation of 'cholesterol plaques';
                                 Normalize blood pressure;
                                 Strengthen blood vessel walls, making them elastic;
                                 Prevent the development of atherosclerosis, coronary heart disease, stroke, myocardial infarction, and thrombosis.
                                 In general, omega-3 and other PUFAs can be taken at any time of the day, but it's important to take them with meals for maximum absorption. To avoid side effects like acid reflux or nausea (which are common with omega-3 intake), split the dose into two parts during breakfast and dinner.

                                 Pacific Omega 3 + AGE from Dr. More is the only omega in the world made from squid liver, one of the best sources of PUFAs. It has the highest concentration of fatty acids: omega-3 is present in phospholipid form, so it is almost completely absorbed by the body. The enhanced Omega-3 formula provides maximum protection and benefits for the body without causing typical fish oil side effects like burping, heartburn, bloating, or stress on the pancreas.

                                 Calcium
                                 Calcium can be taken throughout the day. The method of administration depends on the type of calcium.

                                 Calcium carbonate: For normal absorption, stomach acid is needed, so it’s important to take it during meals.

                                 Calcium citrate is best taken 1–1.5 hours before meals. Generally, this type is absorbed almost twice as well as calcium carbonate, so doctors often prescribe it.

                                 Iron
                                 One of the main components of hemoglobin. It oxygenates the body and participates in DNA repair and metabolism processes.

                                 Iron is best absorbed in the morning on an empty stomach right before a meal, with a glass of water or fruit juice.

                                 Collagen
                                 This is the 'building material' for teeth, bones, muscles, skin, and connective tissues.

                                 Collagen should be taken on an empty stomach in the morning, 30 minutes to an hour before a meal (preferably) or in the evening, two hours after the last meal.

                                 Zinc
                                 Plays a crucial role in immune formation.

                                 Reduces the duration of acute respiratory viral infections and colds;
                                 Slows down the aging process of cells;
                                 Promotes the synthesis of the important male hormone testosterone.
                                 It is best to take it during the day with food. At other times, it may cause nausea.

                                 Multivitamin complexes
                                 These are a bit more complicated: complexes usually contain both water- and fat-soluble vitamins. Therefore, they should be taken with food for optimal absorption. Typically, the timing and method of each complex are individual, so it's important to read the instructions before taking them.

                                 Remember: an excess of vitamins is just as dangerous as a deficiency! Before starting to take vitamins and supplements, be sure to consult a specialist.
                            """)
                            .foregroundColor(.white)
                            .font(.system(size: 14, weight: .regular))
                        
                    }
                }
                
            }
            .padding()
        }
    }
}

#Preview {
    notes1(viewModel: BadsViewModel())
}
