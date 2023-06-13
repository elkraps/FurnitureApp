//
//  HomeScreen.swift
//  Furniture_app
//
//  Created by Vlad Dzirko on 13.06.2023.
//

import SwiftUI

struct HomeScreen: View {
    
    @State private var selectedIndex: Int = 0
    private let categories = ["All","Chair","Sofa","Lamp","Kitchen","Table"]
    
    var body: some View {
        NavigationView {
            ZStack {
                Color("Bg")
                    .edgesIgnoringSafeArea(.all)
                
                ScrollView {
                    VStack(alignment: .leading) {
                        AppBarView()
                        
                        TagLineView()
                            .padding()
                        
                        SearchAndScanView()
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack {
                                ForEach(0 ..< categories.count) { i in
                                    CategoryView(isActive: i == selectedIndex, text: categories[i])
                                        .onTapGesture {
                                            selectedIndex = i
                                        }
                                }
                            }
                            .padding()
                        }
                        
                        Text("Popular")
                            .font(.custom("PlayfairDisplay-Bold", size: 24))
                            .padding()
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack {
                                ForEach(0 ..< 4) { index in
                                    NavigationLink(
                                        destination: DetailScreen()) {
                                        ProductCardView(image: Image("chair_\(index + 1)"), size: 210)
                                    }
                                        .navigationBarHidden(true)
                                        .foregroundColor(.black)
                                }
                                .padding(.trailing)
                            }
                            .padding(.leading)
                        }
                        
                        Text("Best")
                            .font(.custom("PlayfairDisplay-Bold", size: 24))
                            .padding(.horizontal)
                            .padding(.top)
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack {
                                ForEach(0 ..< 4) { index in
                                    ProductCardView(image: Image("chair_\(index + 1)"), size: 180)
                                }
                                .padding(.trailing)
                            }
                            .padding(.leading)
                        }
                    }
                }
                
                HStack {
                    BottomNavBar(image: Image("Home")) {}
                    BottomNavBar(image: Image("love")) {}
                    BottomNavBar(image: Image("shopping-cart")) {}
                    BottomNavBar(image: Image("User")) {}
                }
                .padding()
                .background(Color.white)
                .clipShape(Capsule())
                .padding()
                .shadow(color: Color.black.opacity(0.15), radius: 8, x: 2, y: 6)
                .frame(maxHeight: .infinity, alignment: .bottom)
            }
        }
    }
}


struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}

struct AppBarView: View {
    var body: some View {
        HStack {
            Button {
                
            } label: {
                Image("menu")
                    .padding()
                    .background(Color.white)
                    .cornerRadius(10)
            }
            
            Spacer()
            
            Button {
                
            } label: {
                Image("Profile")
                    .resizable()
                    .frame(width: 42, height: 42)
                    .cornerRadius(10)
            }
        }
        .padding(.horizontal)
    }
}

struct TagLineView: View {
    var body: some View {
        Text("Find The \nBest ")
            .font(.custom("PlayfairDisplay-Regular", size: 28))
            .foregroundColor(Color("Primary"))
        + Text("Furniture")
            .font(.custom("PlayfairDisplay-Bold", size: 28))
            .foregroundColor(Color("Primary"))
    }
}

struct SearchAndScanView: View {
    @State private var search: String = ""
    
    var body: some View {
        HStack {
            HStack {
                Image("Search")
                    .padding(.trailing, 8)
                TextField("Search Furniture", text: $search)
            }
            .padding()
            .background(Color.white)
            .cornerRadius(10)
            .padding(.trailing)
            
            Button {
                
            } label: {
                Image(systemName: "barcode.viewfinder")
                    .padding()
                    .background(Color("Primary"))
                    .foregroundColor(Color.white)
                    .cornerRadius(10)
            }
            
        }
        .padding(.horizontal)
    }
}

struct CategoryView: View {
    let isActive: Bool
    let text: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text(text)
                .font(.system(size: 18))
                .fontWeight(.medium)
                .foregroundColor(isActive ? Color("Primary"): Color.black.opacity(0.5))
            
            if (isActive) {
                Color("Primary")
                    .frame(width: 15, height: 2)
                    .clipShape(Capsule())
            }
        }
        .padding(.trailing)
    }
}

struct ProductCardView: View {
    let image: Image
    let size: CGFloat
    
    var body: some View {
        VStack {
            image
                .resizable()
                .frame(width: size, height: 200 * (size/210))
                .cornerRadius(20)
            
            Text("Luxury Swedian chair")
                .font(.title3)
                .fontWeight(.bold)
            
            HStack(spacing: 2) {
                ForEach(0 ..< 5) { item in
                    Image("star")
                }
                
                Spacer()
                
                Text("$1299")
                    .font(.title3)
                    .fontWeight(.bold)
            }
        }
        .frame(width: 210)
        .padding()
        .background(Color.white)
        .cornerRadius(20)
    }
}

struct BottomNavBar: View {
    
    let image: Image
    let action: ()-> Void
    var body: some View {
        Button(action: action) {
            image
                .frame(maxWidth: .infinity)
        }
    }
}

