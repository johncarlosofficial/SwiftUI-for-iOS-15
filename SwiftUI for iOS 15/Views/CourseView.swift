//
//  CourseView.swift
//  SwiftUI for iOS 15
//
//  Created by João Carlos Magalhães on 31/03/22.
//

import SwiftUI

struct CourseView: View {
    var namespace : Namespace.ID
    var course : Course = courses[0]
    @Binding var show : Bool
    @State var appear = [false, false, false]
    @EnvironmentObject var model: Model
    @State var viewState: CGSize = .zero
    @State var isDraggable = true
    
    var body: some View {
        ZStack {
            ScrollView{
                cover
                
                content
                    .offset(y: 120)
                    .padding(.bottom, 200)
                    .opacity(appear[2] ? 1 : 0)
            }
            .coordinateSpace(name: "scroll")
            .onAppear { model.showDetail = true }
            .onDisappear { model.showDetail = false }
            .background(Color("Background"))
            .mask(RoundedRectangle(cornerRadius: viewState.width / 3.0, style: .continuous))
            .shadow(color: .black.opacity(0.3), radius: 30, x: 0, y: 10)
            .scaleEffect(viewState.width / -500 + 1)
            .background(.black.opacity(viewState.width / 500))
            .background(.ultraThinMaterial)
            .gesture(
                isDraggable ? drag : nil
            )
            .ignoresSafeArea()
            
            button
        }
        .onAppear {
            fadeIn()
        }
        .onChange(of: show){ newValue in
            fadeOut()
        }
    }
    
    var cover: some View {
        GeometryReader { proxy in
            let scrollY = proxy.frame(in: .named("scroll")).minY
            
            VStack {
                    Spacer()
                }
                .frame(maxWidth: .infinity)
                .frame(height: scrollY > 0 ? 500 + scrollY : 500)
                .foregroundStyle(.black)
                .background(
                    Image(course.image)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .padding(20)
                        .frame(maxWidth: 500)
                        .matchedGeometryEffect(id: "image\(course.id)", in: namespace)
                        .offset(y: scrollY > 0 ? scrollY * -0.8 : 0)
                    
                )
                .background(
                    Image(course.background)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .matchedGeometryEffect(id: "background\(course.id)", in: namespace)
                        .offset(y: scrollY > 0 ? -scrollY : 0)
                        .scaleEffect(scrollY > 0 ? scrollY / 1000 + 1 : 1)
                        .blur(radius: scrollY / 10)
                )
                .mask(
                    RoundedRectangle(cornerRadius: appear[0] ? 0 : 30, style: .continuous)
                        .matchedGeometryEffect(id: "mask\(course.id)", in: namespace)
                        .offset(y: scrollY > 0 ? -scrollY : 0)
                )
                .overlay(
                    overlayContent
                        .offset(y: scrollY > 0 ? scrollY * -0.6 : 0)
                )
        }
        .frame(height: 500)
    }
    
    var content: some View {
        VStack(alignment: .leading, spacing: 30){
            Text(course.contentDescription)
                .font(.title3).fontWeight(.medium)
            Text(course.contentTitle)
                .font(.title).bold()
            Text(course.contentText1)
            Text(course.contentText2)
            Text("Multiplatform App")
                .font(.title).bold()
            Text("For the first time, you can build entire apps using SwiftUI only. In Xcode 12, you can now create multi-platform apps with minimal code changes. SwiftUI will automatically translate the navigation, fonts, forms and controls to it's respective platform. For exemple, a side bar will look diferently on the Mac versus the iPad, while using exactly the same code. Dynamic type will adjust for the appropriate platform language, readability and information density.")
        }
        .padding(20)
    }
    
    var button: some View {
        Button{
            withAnimation(.closeCard){
                show.toggle()
                model.showDetail.toggle()
            }
        } label: {
            Image(systemName: "xmark")
                .font(.body.weight(.bold))
                .foregroundStyle(.secondary)
                .padding(8)
                .background(.ultraThinMaterial, in: Circle())
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
        .padding(20)
        .ignoresSafeArea()
    }
    
    var overlayContent: some View {
        
            VStack(alignment: .leading, spacing: 12){
                Text(course.title)
                    .font(.largeTitle.weight(.bold))
                    .matchedGeometryEffect(id: "title\(course.id)", in: namespace)
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text(course.subtitle.uppercased())
                    .font(.footnote.weight(.semibold))
                    .matchedGeometryEffect(id: "subtitle\(course.id)", in: namespace)
                Text(course.text)
                    .font(.footnote)
                    .matchedGeometryEffect(id: "text\(course.id)", in: namespace)
                Divider()
                    .opacity(appear[0] ? 1 : 0)
                HStack{
                    Image(course.avatar)
                        .resizable()
                        .frame(width: 26, height: 26)
                        .cornerRadius(10)
                        .padding(8)
                        .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 18, style: .continuous))
                        .strokeStyle(cornerRadious: 18)
                    Text(course.avatarDescription).font(.footnote)
                }
                .opacity(appear[1] ? 1 : 0)
            }
                .padding(20)
                .background(
                    Rectangle()
                        .fill(.ultraThinMaterial)
                        .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
                        .matchedGeometryEffect(id: "blur\(course.id)", in: namespace)
                
                )
                .offset(y: 250)
                .padding(20)
        
    }
    
    var drag : some Gesture {
        DragGesture(minimumDistance: 30, coordinateSpace: .local)
            .onChanged { value in
                guard value.translation.width > 0 else { return }
                
                if value.startLocation.x < 100 {
                    withAnimation(.closeCard){
                        viewState = value.translation
                    }
                }
                
                if viewState.width > 120 {
                    close()
                }
            }
            .onEnded { value in
                if viewState.width > 80 {
                    close()
                } else {
                    withAnimation(.closeCard){
                        viewState = .zero
                    }
                }
                
                
            }
    }
    
    func fadeIn() {
        withAnimation(.easeOut.delay(0.3)) {
            appear[0] = true
        }
        withAnimation(.easeOut.delay(0.4)) {
            appear[1] = true
        }
        withAnimation(.easeOut.delay(0.5)) {
            appear[2] = true
        }
    }
    
    func fadeOut(){
        appear[0] = false
        appear[1] = false
        appear[2] = false
    }
    
    func close(){
        withAnimation(.closeCard.delay(0.3)){
            show.toggle()
            model.showDetail.toggle()
        }
        
        withAnimation(.closeCard){
            viewState = .zero
        }
        
        isDraggable = false
    }
}

struct CourseView_Previews: PreviewProvider {
    @Namespace static var namespace
    static var previews: some View {
        CourseView(namespace: namespace, show: .constant(true))
            .environmentObject(Model())
    }
}
