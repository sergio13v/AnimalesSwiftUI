/*
See LICENSE folder for this sample’s licensing information.

Abstract:
A view showing the details for a animal.
*/

import SwiftUI


struct AnimalDetail: View {
    @EnvironmentObject var animalFacade: AnimalFacade
    var animal: Animal
    
    var animalIndex: Int {
        animalFacade.animales.firstIndex(where: { $0.id == animal.id })!
    }

    var body: some View {
        VStack {
            
            VStack(alignment: .leading) {
                HStack {
                    Text(animal.nombre)
                        .font(.title)
                  
                    }
                

                HStack(alignment: .top) {
                    Text(animal.descripcion)
                        .font(.subheadline)
                }
            }
            .padding()

            Spacer()
        }
        .navigationBarTitle(Text(verbatim: animal.nombre), displayMode: .inline)
    }
}

struct AnimalDetail_Previews: PreviewProvider {
    static var previews: some View {
        AnimalDetail(animal: animalData[0])
        .environmentObject(AnimalFacade())
    }
}
