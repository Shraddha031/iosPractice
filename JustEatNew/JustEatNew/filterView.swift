//
//  filterView.swift
//  JustEatNew
//
//  Created by Shraddha on 03/03/23.
//

import SwiftUI

struct filterView: View {
    @State private var isShowingSheet = true
    @State private var sortNumber = [false,false,false,false,false]
    @State private var sortSelected = 0
    @Binding var toggleIsOn: Bool
    @Binding var minValue: String
    @Binding var maxValue: String
    @Binding var categoryBool: [Bool]
    var action: (()->())
    var body: some View {
    VStack{
                    HStack{
                        Text("Filter").font(.title2).fontWeight(.medium)
                        Spacer()
                    }.padding()
                    Divider()
                    VStack{
                        HStack{
                            Text("Veg Only")
                                .font(.headline)
                                .fontWeight(.semibold)
                            Spacer()
                            Toggle(isOn: $toggleIsOn) {
                                Image(systemName: "circle.square").foregroundColor(.green)
                            }.tint(Color("DarkShade"))
                        }.contentShape(Rectangle())
                            .padding()
                        Divider()
                        VStack{
                            HStack{
                                Text("Price")
                                    .font(.headline)
                                    .fontWeight(.semibold)
                                Spacer()
                            }.padding(.horizontal)
                            HStack{
                                VStack{
                                    Text("Min")
                                        .font(.subheadline)
                                        .fontWeight(.semibold)
                                    HStack {
                                        TextField("Price", text: $minValue)
                                    }.frame(width: 50,height: 7).padding().overlay(RoundedRectangle(cornerRadius: 14).stroke(Color.gray,lineWidth: 2))
                                }.padding(.horizontal)
                                VStack{
                                    Text("Max").font(.subheadline)
                                        .fontWeight(.semibold)
                                    HStack {
                                        TextField("Price", text: $maxValue)
                                    }.frame(width: 50,height: 7).padding().overlay(RoundedRectangle(cornerRadius: 14).stroke(Color.gray,lineWidth: 2))
                                }.padding(.horizontal)
                            }.padding(.horizontal).padding(.bottom)
                        }
                        Divider()
                        VStack{
                            HStack {
                                Text("Category")
                                    .font(.headline)
                                    .fontWeight(.semibold)
                            }.padding()
                            VStack {
                                HStack {
                                    Spacer()
                                    Text("Starters").foregroundColor(categoryBool[0] ? Color("DarkShade") : Color.gray).padding(10).overlay(RoundedRectangle(cornerRadius: 15).stroke(categoryBool[0] ? Color("DarkShade") : Color.gray,lineWidth: 2)).onTapGesture {
                                        categoryBool[0] = !categoryBool[0]
                                    }
                                    Spacer()
                                    Text("Desert").foregroundColor(categoryBool[1] ? Color("DarkShade") : Color.gray).padding(10).overlay(RoundedRectangle(cornerRadius: 15).stroke(categoryBool[1] ? Color("DarkShade") : Color.gray,lineWidth: 2)).onTapGesture {
                                        categoryBool[1] = !categoryBool[1]
                                    }
                                    Spacer()
                                    Text("Pizza & Burgers").foregroundColor(categoryBool[2] ? Color("DarkShade") : Color.gray).padding(10).overlay(RoundedRectangle(cornerRadius: 15).stroke(categoryBool[2] ? Color("DarkShade") : Color.gray,lineWidth: 2)).onTapGesture {
                                        categoryBool[2] = !categoryBool[2]
                                    }
                                    Spacer()
                                }
                                HStack {
                                    Spacer()
                                    Text("South Indian").foregroundColor(categoryBool[3] ? Color("DarkShade") : Color.gray).padding(10).overlay(RoundedRectangle(cornerRadius: 15).stroke(categoryBool[3] ? Color("DarkShade") : Color.gray,lineWidth: 2)).onTapGesture {
                                        categoryBool[3] = !categoryBool[3]
                                    }
                                    Spacer()
                                    Text("North Indian").foregroundColor(categoryBool[4] ? Color("DarkShade") : Color.gray).padding(10).overlay(RoundedRectangle(cornerRadius: 15).stroke(categoryBool[4] ? Color("DarkShade") : Color.gray,lineWidth: 2)).onTapGesture {
                                        categoryBool[4] = !categoryBool[4]
                                    }
                                    Spacer()
                                    Text("Chinese").foregroundColor(categoryBool[5] ? Color("DarkShade") : Color.gray).padding(10).overlay(RoundedRectangle(cornerRadius: 15).stroke(categoryBool[5] ? Color("DarkShade") : Color.gray,lineWidth: 2)).onTapGesture {
                                        categoryBool[5] = !categoryBool[5]
                                    }
                                    Spacer()
                                }
                            }
                        }
                        Divider()
                        //
                        HStack{
                            Button(action: {
                                
                            }, label: {
                                Text("Clear All").font(.title2).fontWeight(.semibold).foregroundColor(Color("DarkShade"))
                            }).frame(width: UIScreen.main.bounds.width * 0.25).padding(.horizontal)
                            
                            Button(action:action, label: {
                                Text("Apply")
                            }).frame(maxWidth: .infinity)
                                .padding()
                                .background(Color("DarkShade")).foregroundColor(.white).fontWeight(.semibold).font(.title2).cornerRadius(15)
                        }.padding()
                    }
    }.presentationDetents([.height(UIScreen.main.bounds.height *  0.7)])
                    .presentationDragIndicator(.visible)
    }
//    func updatingState(selected: Int){
//        for i in 0..<sortNumber.count {
//            if(i != selected){
//                sortNumber[i] = false
//            }
//        }
//        sortNumber[selected] = true
//        sortSelected = selected + 1
//    }

    }

//struct filterView_Previews: PreviewProvider {
//    static var previews: some View {
//        filterView(toggleIsOn: .constant(false), minValue: .constant(""), maxValue: .constant(""), categoryBool: .constant([false,false,false,false,false,false]), action: <#() -> ()#>)
//    }
//}
