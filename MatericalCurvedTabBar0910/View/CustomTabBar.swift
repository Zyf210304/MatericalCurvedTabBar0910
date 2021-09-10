//
//  CustomTabBar.swift
//  MatericalCurvedTabBar0910
//
//  Created by 张亚飞 on 2021/9/10.
//

import SwiftUI

struct CustomTabBar: View {
    
    //Current Tabb...
    @State var currentTab : Tab = .Home
    
    //hiding native one...
    init() {
        
        UITabBar.appearance().isHidden = true
    }
    
    //Matched geometry effect...
    @Namespace var animation
    
    //current tab xvalue...
    @State var currentXValue: CGFloat = 0
    
    var body: some View {
        
        TabView(selection: $currentTab) {
            
            Text("Home")
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color("BG").ignoresSafeArea())
                .tag(Tab.Home)
            
            Text("Search")
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color("BG").ignoresSafeArea())
                .tag(Tab.Search)
            
            Text("Notifications")
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color("BG").ignoresSafeArea())
                .tag(Tab.Notifications)
            
            Text("Account")
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color("BG").ignoresSafeArea())
                .tag(Tab.Account)
        }
        .overlay(
            
            HStack(spacing: 0) {
                
                ForEach(Tab.allCases, id: \.rawValue) { tab in
                    
                    TabButton(tab: tab)
                }
            
            }
                .padding(.vertical)
            //preview wont show sagearea...
                .padding(.bottom, getSafeArea().bottom == 0 ? 10 : (getSafeArea().bottom - 10))
                .background(
                    MaterialEffect(style: .systemUltraThinMaterialDark)
                        .clipShape(BottomCurve(currentXValue: currentXValue))
                )
            
            , alignment: .bottom
        )
        .ignoresSafeArea(.container, edges: .bottom)
        //always dark
        .preferredColorScheme(.dark)
    }
    
    //tabbutton...
    @ViewBuilder
    func TabButton(tab: Tab) -> some View {
        
        //sine we need xaxis value for curve
        GeometryReader {proxy in
            
            Button {
                
                withAnimation(.spring()) {
                    currentTab = tab
                    
                    currentXValue = proxy.frame(in: .global).midX
                }
            } label: {
                
                //moving button up for  current tab...
                
                Image(systemName: tab.rawValue)
                //since we need perfect value for curve..
                    .resizable()
                    .aspectRatio( contentMode: .fit)
                    .frame(width: 25, height: 25)
                    .frame(maxWidth: .infinity)
                    .foregroundColor(.white)
                    .padding(currentTab == tab ? 15 : 0)
                    .background(
                        
                        ZStack {
                        
                            if currentTab == tab {
                                
                                MaterialEffect(style: .systemChromeMaterialDark)
                                    .clipShape(Circle())
                                    .matchedGeometryEffect(id: "TAB", in: animation)
                            }
                        }
                    )
                    .contentShape(Rectangle())
                    .offset(y: currentTab == tab ? -50 : 0)
            }
            //setting intial curve position
            .onAppear{
                
                if tab == Tab.allCases.first && currentXValue == 0 {
                
                currentXValue = proxy.frame(in: .global).midX
                }
            }
        }
        .frame(height: 30)
        //maxsize...

    }
    
}

struct CustomTabBar_Previews: PreviewProvider {
    static var previews: some View {
        CustomTabBar()
    }
}

//to iterate...
//enum for tab...
enum Tab:String, CaseIterable {
    
    case Home = "house.fill"
    case Search = "magnifyingglass"
    case Notifications = "bell.fill"
    case Account = "person.fill"
}


extension View {
    
    func getSafeArea() -> UIEdgeInsets {
        
        guard let screen = UIApplication.shared.connectedScenes.first as? UIWindowScene  else {
            
            return .zero
        }
        
        guard let safeArea = screen.windows.first?.safeAreaInsets  else{
            
            return .zero
        }
        
        return safeArea
    }
}
