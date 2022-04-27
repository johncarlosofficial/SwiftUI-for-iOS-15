//
//  SignUpView.swift
//  SwiftUI for iOS 15
//
//  Created by João Carlos Magalhães on 26/04/22.
//

import SwiftUI

struct SignUpView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Sign up")
                .font(.largeTitle).bold()
            Text("Welcome to John Carlos' SwiftUI app!")
                .font(.headline)
            Button {} label: {
                Text("Create an account")
                    .frame(maxWidth: .infinity)
            }
            .buttonStyle(.angular)
            .tint(.accentColor)
            .controlSize(.large)
            
            Group {
                Text("By clicking on ")
                + Text("__Create and account__").foregroundColor(.primary.opacity(0.7))
                + Text(", you agree to our **Terms of Service** and **[Privacy Policy](https://apple.com)**")
                
                Divider()
                
                HStack{
                    Text("Already have an account?")
                    Button {
                        
                    } label: {
                        Text("**Sign In**")
                    }
                }
            }
            .font(.footnote)
            .foregroundColor(.secondary)
            .accentColor(.secondary)
        }
        .padding(20)
        .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 30, style: .continuous))
        .strokeStyle(cornerRadious: 30)
        .shadow(color: Color("Shadow").opacity(0.2), radius: 30, x: 0, y: 30)
        .padding(20)
        .background(
            Image("Blob 1").offset(x: 200, y: -100)
        )
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
            
    }
}
