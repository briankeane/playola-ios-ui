//
//  SignInView.swift
//  PlayolaiOSUI
//
//  Created by Brian Keane on 12/18/20.
//

import SwiftUI

import SwiftUI

struct SignInView: View {
  @ObservedObject var signInViewModel: SignInViewModel = SignInViewModel()
  
    var body: some View {
      NavigationView {
        ZStack{
          VStack {
            Spacer()
            Image("Login-Logo")
              .resizable()
              .scaledToFit()
              .padding(75)
            Spacer()
            Button { signInViewModel.isSignedIn ? signInViewModel.signOut(): signInViewModel.signIn()
            } label: {
              Text(signInViewModel.isSignedIn ? "Log Out" : "Log In / Sign Up")
                .font(.title)
                .padding()
            }
            .background(Color.playolaRed)
            .foregroundColor(.white)
            .cornerRadius(20)
            .padding()
            Spacer()
          }
        }.background(Color.black)
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
        .edgesIgnoringSafeArea(.all)
        .navigationBarHidden(true)
      }
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}
