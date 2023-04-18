//
//  JEStepper.swift
//  JustEatNew
//
//  Created by Shraddha on 16/03/23.
//

import SwiftUI

struct JEStepper: View {
    
    @Binding var showRemoveAlert: Bool
    var counter: String
    var decrementAction: (()->Void)
    var incrementAction: (()->Void)
    var alertAction: (()->Void)
    
    var body: some View {
        VStack { // Custom stepper
            HStack {
                Button("-", action: decrementAction).tint(Color("PrimaryColor"))
                Text(String(counter))
                    .padding(.horizontal, 4)
                Button("+", action: incrementAction).tint(Color("PrimaryColor"))
                    .alert(isPresented: $showRemoveAlert) {
                        Alert(
                            title: Text("Are you sure you want to remove this item from the caart"),
                            message: Text("There is no undo"),
                            primaryButton: .destructive(Text("Remove"), action: alertAction),
                            secondaryButton: .cancel()
                        )
                    }

            }.padding(.horizontal, 16).padding(.vertical, 2)
                .background(Color("SecondaryColor"))
                .cornerRadius(5)
                .overlay (
                    RoundedRectangle(cornerRadius: 8, style: .continuous)
                        .stroke(Color("PrimaryColor"), lineWidth: 2)
                )
        }
    }
}

//struct JEStepper_Previews: PreviewProvider {
//    static var previews: some View {
//        JEStepper()
//    }
//}
