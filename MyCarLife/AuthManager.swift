//
//  AuthManager.swift
//  MyCarLife
//
//  Created by 松田拓海 on 2023/01/24.
//

import Foundation
import FirebaseAuth
final class AuthManager{
    
    static let shared = AuthManager()
    let auth = Auth.auth()
    var errMessage:String = ""
        
//    // MARK: - ログインwith email/password
//    func Login(email:String,password:String,complition: @escaping (Bool) -> Void ) {
//        auth.signIn(withEmail: email, password: password) { result, error in
//            if error == nil {
//                if result?.user != nil{
//                    complition(true)
//                }else{
//                    complition(false)
//                }
//            }else{
//                self.setErrorMessage(error)
//                complition(false)
//            }
//        }
//    }
//     // MARK: - 新規登録
////    func createUser(email:String,password:String,name:String,complition: @escaping (Bool) -> Void ) {
////        Auth.auth().createUser(withEmail: email, password: password) { result, error in
////            if error == nil {
////                if let user = result?.user {
////                    self.editUserInfo(user: user, name: name) { result in
////                        complition(result)
////                    }
////                }else{
////                    complition(false)
////                }
////            }else{
////                self.setErrorMessage(error)
////                complition(false)
////            }
////        }
////    }
    
    func setErrorMessage(_ error:Error?){
        if let error = error as NSError? {
            if let errorCode = AuthErrorCode.Code(rawValue: error.code) {
                switch errorCode {
                case .invalidEmail:
                    self.errMessage = "メールアドレスの形式が違います。"
                case .emailAlreadyInUse:
                    self.errMessage = "このメールアドレスはすでに使われています。"
                case .weakPassword:
                      self.errMessage = "パスワードが弱すぎます。"
                case .userNotFound, .wrongPassword:
                    self.errMessage = "メールアドレス、またはパスワードが間違っています"
                case .userDisabled:
                    self.errMessage = "このユーザーアカウントは無効化されています"
                default:
                    self.errMessage = "予期せぬエラーが発生しました。\nしばらく時間を置いてから再度お試しください。"
                }
            }
        }
    }
}
