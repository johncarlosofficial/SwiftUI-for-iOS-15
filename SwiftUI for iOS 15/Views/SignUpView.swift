//
//  SignUpView.swift
//  SwiftUI for iOS 15
//
//  Created by João Carlos Magalhães on 26/04/22.
//

import SwiftUI

struct SignUpView: View {
    enum Field: Hashable {
    case email
    case password
    }
    
    @State var email = ""
    @State var password = ""
    @FocusState var focuseField: Field?
    @State var circleY: CGFloat = 120
    @State var emailY: CGFloat = 0
    @State var passwordY: CGFloat = 0
    @State var circleColor: Color = .blue
    @EnvironmentObject var model: Model
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Sign up")
                .font(.largeTitle).bold()
            Text("Access 120+ hours of courses, tutorials and livesteams")
                .font(.headline)
            TextField("Email",text: $email)
                .inputStyle(icon: "mail")
                .textContentType(.emailAddress)
                .keyboardType(.emailAddress)
                .autocapitalization(.none)
                .disableAutocorrection(true)
                .focused($focuseField, equals: .email)
                .shadow(color: focuseField == .email ? .primary.opacity(0.3) : .clear, radius: 10, x: 0, y: 3)
                .overlay(geometry)
                .onPreferenceChange(CirclePerferenceKey.self){
                    value in
                    emailY = value
                    circleY = value
                }
            SecureField("Password",text: $password)
                .inputStyle(icon:  "lock")
                .textContentType(.password)
                .focused($focuseField, equals: .password)
                .shadow(color: focuseField == .password ? .primary.opacity(0.3) : .clear, radius: 10, x: 0, y: 3)
                .overlay(geometry)
                .onPreferenceChange(CirclePerferenceKey.self){
                    value in
                    passwordY = value

                }
            
            Button {} label: {
                Text("Creat an account")
                    .frame(maxWidth: .infinity)
            }
            .font(.headline)
            .blendMode(.overlay)
            .buttonStyle(.angular)
            .tint(.accentColor)
            .controlSize(.large)
            .shadow(color: Color("Shadow").opacity(0.2), radius: 30, x: 0, y: 30)
            
            Group {
                Text("By clicking on ")
                + Text("_Create an account_")
                    .foregroundColor(.primary.opacity(0.7))
                + Text(", you agree to our **Terms of Service** and **[Privacy Policy](https?..design.io)**")
                
                Divider()
                
                HStack {
                    Text("Already have an account?")
                    Button{
                        
                    } label: {
                           Text("**Sign in**")
                    }

                }
            }
            .font(.footnote)
            .foregroundColor(.secondary)
//                .accentColor(.secondary)


        }
        .padding(20)
        .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 30, style: .continuous))
        .background(
            Circle().fill(circleColor)
                .frame(width:68 ,height: 68)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                .offset(y: circleY)
        )
        .coordinateSpace(name: "container")
        .strokeStyle(cornerRadious: 30)
//        .shadow(color: Color("Shadow").opacity(0.2), radius: 30, x: 0, y: 30)
//        .padding(20)
//        .background(Image("Blob 1").offset(x:200 ,y:-100))
        .onChange(of: focuseField){
            value in
            withAnimation{
                if value == .email {
                    circleY = emailY
                    circleColor = .blue
                } else {
                    circleY = passwordY
                    circleColor = .red
                }
            }

        }
    }
    var geometry:some View{
        GeometryReader {proxy in
            Color.clear.preference(key: CirclePerferenceKey.self, value: proxy.frame(in: .named("container")).minY)
        }
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            SignUpView()
                .preferredColorScheme(.light)
                .environmentObject(Model())
        }
    }
}
