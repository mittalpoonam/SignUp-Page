//
//  LoginView.swift
//  swiftUIPractice
//
//  Created by poonam mittal on 20/01/23.
//

import SwiftUI

struct LoginView: View {
    @StateObject var globalString = GlobalString()
    @State var usernameLogin = ""
    @State var mobilenoLogin = ""
    var body: some View {
        GeometryReader { geo in
            ZStack {
                
                Image("wallpaper")
                   .resizable()
                   .aspectRatio(geo.size, contentMode: .fill)
                   .edgesIgnoringSafeArea(.all)
                
                VStack(alignment: .leading, spacing: 16) {
                    Text("Logn In")
                        .foregroundColor(.white)
                        .font(.system(size: 36))
                        .bold()
                    Text("")
                      
                 Group{
                HStack(spacing: 15){
                    Text("Username")
                        .foregroundColor(.white)
                        .bold()
                    TextField("", text: self.$usernameLogin )
                        .foregroundColor(.white)
                    }
                Divider()
                    .overlay(.white)
           
                HStack(spacing: 15){
                    Text("Mobile No.")
                        .foregroundColor(.white)
                        .bold()
                    TextField("", text: self.$mobilenoLogin)
                        .foregroundColor(.white)
                    }
                    
                Divider()
                    .overlay(.white)
                }
                 Group{
                     Text("")
                     HStack(spacing: 20) {

                     Text("")
                     Button{
                         print("log in tapped")
                     } label: {
                         Text("Log in")
                             .font(.system(size: 20, weight: .bold, design: .default))
                           
                     }
                     .padding(.horizontal, 120)
                     .padding(.vertical, 10)
                     .background(Color(red:100, green:100, blue:100))
                     .foregroundColor(.black)
                     .clipShape(Capsule())
                     }
                }
                }.padding(EdgeInsets(top: 0, leading: 20, bottom: 90, trailing: 15))
       
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
