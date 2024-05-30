//
//  ListsRecipe.swift
//  NutriMate_v1
//
//  Created by student on 30/05/24.
//

import SwiftUI

import SwiftUI

struct ListsRecipe: View {
    @State private var searchTerm = ""
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                HStack {
                    Text("Hello Johnny,")
                        .font(.title)
                    Spacer()
                    Spacer()
                    Image(systemName: "person.circle")
                        .resizable()
                        .frame(width: 40, height: 40)
                        .clipShape(Circle())
                    
                }
            
                
                .padding(.horizontal)
              
                    HStack{
                        VStack{
                            Image(systemName: "clock")
                            Text("brodda")
                        }.padding(.top)
                            .padding(.bottom)
                            .background(Color(.white))
                    }.padding(.horizontal)
                  
                
                
                SearchBar(searchTerm: $searchTerm)
                    .padding(.horizontal)
                    .padding(.bottom)
                
                Text("Recommended for you")
                    .font(.subheadline)
                    .padding(.horizontal)
                    
                
                List{
                    VStack(spacing:20){
                        ZStack{
                            Image("image 11").resizable()
                                .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                            VStack{
                                HStack{
                                    Image(systemName: "star.fill")
                                    Text("5.0")
                                }.padding(2)
                                    .background(Color.yellow)
                                    .clipShape(RoundedRectangle(cornerRadius: 6))
                                    .offset(x:120,y:-76)
                            }
                        }
                        VStack(){
                            VStack{
                                HStack{
                                    
                                    Image(systemName: "clock").foregroundStyle(.green)
                                    Text("25 minutes").foregroundStyle(.green)
                                    
                                    Image(systemName: "flame").foregroundStyle(.red)
                                    Text("32 kcal")
                                        .foregroundStyle(.red)
                                }
                            }.frame(maxWidth: .infinity, alignment: .leading)
                            VStack(alignment:.leading){
                                Text("Brunch is here").font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                                Text("here is a discription").font(.caption2).foregroundStyle(.gray)
                            }.frame(maxWidth: .infinity, alignment: .leading)
                        }
                    }
                }
            }
            .background(Color(.systemGray6))
            .navigationTitle("Recipes")
        }.background(Color(.gray))
    }
}

struct SearchBar: View {
    @Binding var searchTerm: String
    
    var body: some View {
        HStack {
            TextField("Search for Recipe", text: $searchTerm)
                .padding(8)
                .background(Color(.systemGray5))
                .cornerRadius(14)
              
        }
    }
}

struct RecipePage_Previews: PreviewProvider {
    static var previews: some View {
        ListsRecipe()
    }
}

