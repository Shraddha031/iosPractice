//
//  sortView.swift
//  JustEatNew
//
//  Created by Shraddha on 02/03/23.
//

import SwiftUI

struct sortView: View {
    @State private var isShowingSheet = true
    @State private var sortNumber = [false,false,false,false,false]
    @Binding var sortSelected: Int
    @State var vegLoaded = false
    var action: (()->())
    var body: some View {
        VStack{
//            Button("Show"){
//                isShowingSheet = true
//            }.sheet(isPresented: $isShowingSheet)
//           }
                VStack{
                    HStack{
                        Text("Sort").font(.title2).fontWeight(.medium)
                        Spacer()
                    }.padding()
                    Divider()
                    VStack{
                        HStack{
                            Text("Rating: High To Low")
                                .font(.headline)
                                .fontWeight(.regular)
                            Spacer()
                            Circle()
                                .foregroundColor(sortNumber[0] ? Color.red : Color.clear)
                                .frame(width: 15)
                                .padding(4)
                                .overlay(Circle().stroke(sortNumber[0] ? Color.red : Color.gray, lineWidth: 2))
                        }.contentShape(Rectangle())
                            .padding()
                            .onTapGesture {
                                updatingState(selected: 0)
                            }
                        HStack{
                            Text("Delivery Time:Low To High")
                                .font(.headline)
                                .fontWeight(.regular)
                            Spacer()
                            Circle()
                                .foregroundColor(sortNumber[1] ? Color.red : Color.clear)
                                .frame(width: 15)
                                .padding(4)
                                .overlay(Circle().stroke(sortNumber[1] ? Color.red : Color.gray, lineWidth: 2))
                        }.contentShape(Rectangle())
                            .padding()
                            .onTapGesture {
                                updatingState(selected: 1)
                            }
                        HStack{
                            Text("Distance:Low To High")
                                .font(.headline)
                                .fontWeight(.regular)
                            Spacer()
                            Circle()
                                .foregroundColor(sortNumber[2] ? Color.red : Color.clear)
                                .frame(width: 15)
                                .padding(4)
                                .overlay(Circle().stroke(sortNumber[2] ? Color.red : Color.gray, lineWidth: 2))
                        }.contentShape(Rectangle())
                            .padding()
                            .onTapGesture {
                                updatingState(selected: 2)
                            }
                        HStack{
                            Text("Cost: Low To High")
                                .font(.headline)
                                .fontWeight(.regular)
                            Spacer()
                            Circle()
                                .foregroundColor(sortNumber[3] ? Color.red : Color.clear)
                                .frame(width: 15)
                                .padding(4)
                                .overlay(Circle().stroke(sortNumber[3] ? Color.red : Color.gray, lineWidth: 2))
                        }.contentShape(Rectangle())
                            .padding()
                            .onTapGesture {
                                updatingState(selected: 3)
                            }
                        HStack{
                            Text("Cost: High To Low")
                                .font(.headline)
                                .fontWeight(.regular)
                            Spacer()
                            Circle()
                                .foregroundColor(sortNumber[4] ? Color.red : Color.clear)
                                .frame(width: 15)
                                .padding(4)
                                .overlay(Circle().stroke(sortNumber[4] ? Color.red : Color.gray, lineWidth: 2))
                        }.contentShape(Rectangle())
                            .padding()
                            .onTapGesture {
                                updatingState(selected: 4)
                            }
                        Divider()
                        //
                        HStack{
                            Button(action: {
                                
                            }, label: {
                                Text("Clear All").font(.title2).fontWeight(.semibold).foregroundColor(.pink)
                            }).frame(width: UIScreen.main.bounds.width * 0.25)
                            
                            Button(action: action, label: {
                                Text("Apply")
                            }).frame(width: UIScreen.main.bounds.width * 0.6)
                                .padding()
                                .background(.pink).foregroundColor(.white).fontWeight(.semibold).font(.title2).cornerRadius(15)
                        }
                    }.onAppear(){
                        if sortSelected != 0 {
                            sortNumber[sortSelected - 1] = true
                        }
                    }
                }.presentationDetents([.height(UIScreen.main.bounds.height * 0.55)])
                    .presentationDragIndicator(.visible)
            
        }
    }
    func updatingState(selected: Int){
        for i in 0..<sortNumber.count {
            if(i != selected){
                sortNumber[i] = false
            }
        }
        sortNumber[selected] = true
        sortSelected = selected + 1
    }

    }

//struct sortView_Previews: PreviewProvider {
//    static var previews: some View {
//        sortView(action: <#() -> ()#>)
//    }
//}
