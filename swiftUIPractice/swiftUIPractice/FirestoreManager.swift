//
//  FirestoreManager.swift
//  swiftUIPractice
//
//  Created by poonam mittal on 20/01/23.
//

import Foundation
import Firebase

class FirestoreManager: ObservableObject {
    
    func createUser(mobileNumber: String){
        let db = Firestore.firestore()
        
        let docRef = db.collection("UserData").document(mobileNumber)
        
        docRef.setData(["mobileNumber": mobileNumber]){ error in
            if let error = error{
                print("error writing document: \(error)")
            }else{
                print ("Document succesfully written!")
            }
        }
    }
    
}
