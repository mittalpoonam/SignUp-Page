//
//  ContentView.swift
//  swiftUIPractice
//
//  Created by poonam mittal on 01/12/22.
//

import SwiftUI

class GlobalString: ObservableObject{
    @Published var username = ""
    @Published var name = ""
    @Published var mobileNumber = ""
    @Published var email = ""
    @Published var dateofBirth = Date()
}




struct ContentView: View {
    
    @StateObject var globalString = GlobalString()
    @StateObject var firestoreManager = FirestoreManager()
    
//    @State var username = ""
//    @State var name = ""
//    @State var mobileNumber = ""
//    @State var email = ""
//    @State var dateofBirth = Date()
    
    init(){
    let navBarAppearance = UINavigationBar.appearance()
    navBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
    navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
    }
    
    
    
    var body: some View {
        NavigationView {
          
                GeometryReader { geo in
                    ZStack {
                        
                        Image("wallpaper")
                           .resizable()
                           .aspectRatio(geo.size, contentMode: .fill)
                           .edgesIgnoringSafeArea(.all)
                        
                        VStack(alignment: .leading, spacing: 16) {
                            Text("Sign up to join our family")
                                .foregroundColor(.white)
                                .font(.system(size: 36))
                                .bold()
                            Text("")
                              
                         Group{
                        HStack(spacing: 15){
                            Text("Username")
                                .foregroundColor(.white)
                                .bold()
                            TextField("", text: $globalString.username)
                                .foregroundColor(.white)
                            }
                        Divider()
                            .overlay(.white)
                        
                        
                        HStack(spacing: 15){
                            Text("Name")
                                .foregroundColor(.white)
                                .bold()
                            TextField("", text: $globalString.name)
                                .foregroundColor(.white)
                            }
                        Divider()
                            .overlay(.white)
                        
                        
                        HStack(spacing: 15){
                            Text("Mobile No.")
                                .foregroundColor(.white)
                                .bold()
                            TextField("", text: $globalString.mobileNumber)
                                .foregroundColor(.white)
                          
                            }
                            
                        Divider()
                            .overlay(.white)
                        }
                         Group{
                             HStack(spacing: 15){
                            Text("Email")
                                .foregroundColor(.white)
                                .bold()
                                 TextField("", text: $globalString.email)
                                     .foregroundColor(.white)
                             }
                            Divider()
                                .overlay(.white)
                            
                            HStack {
                            Text("Date of Birth")
                                .foregroundColor(.white)
                                .bold()
                                
                                DatePicker("", selection: $globalString.dateofBirth, displayedComponents: .date)
                                    .colorScheme(.dark)
//                            Text("\(dateofBirth.formatted(date: .long, time: .omitted))")
//                                .foregroundColor(.white)
                        
                        }
                             Text("")
                             HStack(spacing: 20) {
    
                             Text("")
                             Button{
                                 print("button tapped")
                                 
                                 firestoreManager.createUser(mobileNumber: globalString.mobileNumber)
                                 
                                 print(globalString.username)
                                 print(globalString.dateofBirth)
                                 print(globalString.mobileNumber)
                                 print(globalString.name)
                                 
                             } label: {
                                 Text("Sign in")
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
               
                .navigationBarItems(trailing:
                                        Button(action: {
                    print("login tapped")}){
                        NavigationLink(destination: LoginView()){
                        Text("Login")
                            .fontWeight(.bold)
                            .font(.system(size: 23))
                            .foregroundColor(.white)
                            .padding(.vertical, 3.5)
                            .padding(.horizontal, 15)
                            .overlay(
                            RoundedRectangle(cornerRadius: 16)
                                .stroke(.white, lineWidth: 3)
                            )
                    }
                    }
               
                )
    }
}
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


