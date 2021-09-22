//
//  Home.swift
//  MatericalCurvedTabBar0910
//
//  Created by 张亚飞 on 2021/9/15.
//

import SwiftUI

struct Home: View {
    
    @State var furnitures : [Furniture] = [
        
        Furniture(name: "Side Table", description: "Amazing stylish and widely selled table!!!", price: "$200", image: "sideTable"),
        Furniture(name: "Desktop Table", description: "Best IKEA  Table at affordable preice", price: "$120", image: "desktopTable"),
        Furniture(name: "Table Clock", description: "Best selling Table Clock in whole market", price: "$200", image: "clock")
    ]
    
    var body: some View {
        
        ScrollView(.vertical, showsIndicators: false) {
            
            VStack (spacing: 18){
                
                HStack {
                    
                    Button {
                        
                    } label: {
                        
                        Image(systemName: "sidebar.left")
                            .font(.title2)
                    }
                    
                    Spacer()
                    
                    
                    Button {
                        
                    } label: {
                        
                        Image(systemName: "slider.vertical.3")
                            .font(.title2)
                    }

                }
                .foregroundColor(.black)
                
                VStack(alignment: .leading, spacing: 10) {
                    
                    Text("Furnitrure in\nUnique Style")
                        .font(.largeTitle.bold())
                    
                    Text("We have wide range of furniture")
                        .font(.caption)
                        .foregroundColor(.gray)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.vertical, 20)
            }
            .padding()
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
