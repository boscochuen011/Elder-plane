//
//  FirstView.swift
//  Elder-plane
//
//  Created by itst on 11/18/23.
//

import SwiftUI
import PDFKit

var dataDict = [
    "fill_6": "John Doe",
    "fill_7": "M",
    "fill_8": "John@gmail.com",
    "fill_9": "Hong Kong",
    "fill_10": "10/10/2011",
    "fill_11": "M09972633",
    "fill_12": "99722223",
    "fill_13": "123 Main St",
    "fill_1": "Mebeverine Hydrochloride & Chlordiazepoxide Tablet",
    "fill_2": "Tablet",
    "fill_3": "270",
    "Text5": "10/10/2023",
    "Text6": "HongKong",
    "Text8": "12/10/2023",
    "Text11": "Hong Kong",
    "Text10": "Hong Kong",
    "fill_14": "19/11/2023"
 ]

struct DiscoverView: View {
    @State var isShowAbout = false
    @State var isShowPDF = false
    @State var doc : PDFDocument?
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                
                // Set alignment to .leading
                NavigationLink(destination: SelectTypeView(isShowAbout: $isShowAbout)) {
                    Button(action: {
                        // Perform your action here
                        isShowAbout = true
                    }) {
                        VStack(alignment: .leading) {
                            HStack {
                                Image("old_man")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 140, height: 110)
                                    .padding(.horizontal, 20)
                                
                                Spacer()
                                
                                Image(systemName: "arrow.right.circle.fill")
                                    .font(.system(size: 40))
                                    .padding(.trailing, 20)
                                    .foregroundColor(Color(uiColor: #colorLiteral(red: 0.4499112964, green: 0.7566919327, blue: 0.6881037354, alpha: 1)))
                                    .offset(x: 0, y: 20)
                            }
                            Text("Let us know about you")
                                .font(.title) // Change this to your desired size
                                .bold() // Makes the text bold
                                .foregroundColor(Color(red: 0.0/255.0, green: 101.0/255.0, blue: 100.0/255.0))
                                .padding(.leading, 20) // Adjust this value to move text further to the left
                                .padding(.bottom, 10) // Adjust this value to move text further to the left
                    }

                        
                    }
                    .frame(height: 200)
                    .background(Color(red: 236.0/255.0, green: 246.0/255.0, blue: 245.0/255.0))
                    .cornerRadius(25) // This creates rounded corners
                    .overlay(
                        RoundedRectangle(cornerRadius: 25)
                            .stroke(Color(red: 0.0/255.0, green: 101.0/255.0, blue: 100.0/255.0), lineWidth: 2)
                    )
                    .padding(.horizontal, 10) // This padding is applied to the button itself
                    .padding(.vertical, 10)  // This padding is applied to the button itself
                }
                
                Text("DECLARAION FORMS")
                    .font(.system(size: 10, weight: .bold))
                    .foregroundColor(Color(red: 0.0/255.0, green: 101.0/255.0, blue: 100.0/255.0))
                    .padding(.top, 10)
                    .padding(.leading, 20)
                
                HStack {
                    
                    Button {
                        let doc = PDFDocument(url: Bundle.main.url(forResource: "TW_form", withExtension: "pdf")!)
                        
                        for index in 0..<doc!.pageCount{
                            if let page = doc?.page(at: index){
                                let annotations = page.annotations
                                for annotation in annotations{
                                    print("Annotation Name :: \(annotation.fieldName ?? "")")
                                    for (key, value) in dataDict {
                                        if annotation.fieldName == key {
                                            print("matched - fill value: \(value)")
                                            //page.removeAnnotation(annotation)
                                            //annotation.setValue(value, forAnnotationKey: .widgetValue)
                                            
                                            annotation.widgetStringValue = "\(value)"
                                            //page.addAnnotation(annotation)
                                        }
                                    }
                                    
                                    //
                                    //                                if annotation.fieldName == "firstName"{
                                    //                                    annotation.setValue("David", forAnnotationKey: .widgetValue)
                                    //                                    page.removeAnnotation(annotation)
                                    //                                    page.addAnnotation(annotation)
                                    //                                }else if annotation.fieldName == "checkBox"{
                                    //                                    annotation.buttonWidgetState = .onState
                                    //                                    page.removeAnnotation(annotation)
                                    //                                    page.addAnnotation(annotation)
                                    //                                }
                                }
                            }
                        }
                        
                        Task {
                            
                            self.doc = doc
                            isShowPDF = true
                            
                        }
                        
                    } label: {
                        HStack {
                            Spacer()
                            Image(systemName: "clipboard")
                                .foregroundColor(Color(red: 0.0/255.0, green: 101.0/255.0, blue: 100.0/255.0))
                            Text("View Form")
                                .foregroundColor(Color(red: 0.0/255.0, green: 101.0/255.0, blue: 100.0/255.0))
                                .padding(27)
                            Spacer()
                        }
                        .overlay(
                            RoundedRectangle(cornerRadius: 15)
                                .stroke(Color(red: 0.0/255.0, green: 101.0/255.0, blue: 100.0/255.0), lineWidth: 2)
                        )
                        
                    }
                    
                    Spacer()
                    
                    Button {
                        let doc = PDFDocument(url: Bundle.main.url(forResource: "TW_form", withExtension: "pdf")!)
                        
                        for index in 0..<doc!.pageCount{
                            if let page = doc?.page(at: index){
                                let annotations = page.annotations
                                for annotation in annotations{
                                    print("Annotation Name :: \(annotation.fieldName ?? "")")
                                    for (key, value) in dataDict {
                                        if annotation.fieldName == key {
                                            print("matched - fill value: \(value)")
                                            //page.removeAnnotation(annotation)
                                            //annotation.setValue(value, forAnnotationKey: .widgetValue)
                                            
                                            annotation.widgetStringValue = "\(value)"
                                            //page.addAnnotation(annotation)
                                        }
                                    }
                                    
                                    //
                                    //                                if annotation.fieldName == "firstName"{
                                    //                                    annotation.setValue("David", forAnnotationKey: .widgetValue)
                                    //                                    page.removeAnnotation(annotation)
                                    //                                    page.addAnnotation(annotation)
                                    //                                }else if annotation.fieldName == "checkBox"{
                                    //                                    annotation.buttonWidgetState = .onState
                                    //                                    page.removeAnnotation(annotation)
                                    //                                    page.addAnnotation(annotation)
                                    //                                }
                                }
                            }
                        }
                        
                        Task {
                            
                            self.doc = doc
                            isShowPDF = true
                            
                        }
                        
                    } label: {
                        HStack {
                            Spacer()
                            Image(systemName: "pencil.and.list.clipboard")
                                .foregroundColor(Color(red: 0.0/255.0, green: 101.0/255.0, blue: 100.0/255.0))
                            Text("Quick Fill Form")
                                .foregroundColor(Color(red: 0.0/255.0, green: 101.0/255.0, blue: 100.0/255.0))
                                .padding()
                            Spacer()
                        }
                        .overlay(
                            RoundedRectangle(cornerRadius: 15)
                                .stroke(Color(red: 0.0/255.0, green: 101.0/255.0, blue: 100.0/255.0), lineWidth: 2)
                        )
                        
                    }
                }
                .padding(10)
                
                Text("FOR YOU")
                    .font(.system(size: 10, weight: .bold))
                    .foregroundColor(Color(red: 0.0/255.0, green: 101.0/255.0, blue: 100.0/255.0))
                    .padding(.top, 10)
                    .padding(.leading, 20)
                
                VStack (spacing: 0) {
                   // NavigationLink(destination: SelectTypeView(isShowAbout: $isShowAbout)) {
                        VStack {
                            Spacer()
                            HStack {
                                VStack (alignment: .leading) {
                                    Text("KYOTO")
                                        .font(.largeTitle)
                                        .bold()
                                        .foregroundColor(.white)
                                        .padding(.leading, 10)
                                    Text("Cultural Experiences in Japan")
                                        .bold()
                                        .font(.subheadline)
                                        .foregroundColor(.white)
                                        .padding(.leading, 10)
                                }
                                Spacer()
                            }
                            
                            HStack {
                                Text("5 Days Up")
                                    .foregroundColor(.white)
                                    .bold()
                                    .padding(.leading, 15)
                                Spacer()
                                Text("$12,800 per")
                                    .bold()
                                    .foregroundColor(.white)
                                    .padding(.trailing, 15)
                            }
                            .frame(height: 54)
                            .background(.ultraThinMaterial)
                            
                        }
                        .frame(height: 183)
                        .background(
                            Image("bg_01")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                        )
                        .clipShape(Rectangle())
                    //}
                    
                    
                   // NavigationLink(destination: SelectTypeView(isShowAbout: $isShowAbout)) {
                        VStack {
                            Spacer()
                            HStack {
                                VStack (alignment: .leading) {
                                    Text("SPAIN")
                                        .font(.largeTitle)
                                        .bold()
                                        .foregroundColor(.white)
                                        .padding(.leading, 10)
                                    Text("Cultural Experiences in Spain")
                                        .bold()
                                        .font(.subheadline)
                                        .foregroundColor(.white)
                                        .padding(.leading, 10)
                                }
                                Spacer()
                            }
                            
                            HStack {
                                Text("2 Weeks Up")
                                    .foregroundColor(.white)
                                    .bold()
                                    .padding(.leading, 15)
                                Spacer()
                                Text("$34,800 per")
                                    .bold()
                                    .foregroundColor(.white)
                                    .padding(.trailing, 15)
                            }
                            .frame(height: 54)
                            .background(.ultraThinMaterial)
                            
                        }
                        .frame(height: 183)
                        .background(
                            Image("bg_02")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                        )
                        .clipShape(Rectangle())
                   // }
                    
                }
                
                Spacer()
            }
            .fullScreenCover(isPresented: $isShowAbout, content: {
                NavigationStack {
                    SelectTypeView(isShowAbout: $isShowAbout)
                        .accentColor(.white)
                }.accentColor(.white)
            })
            .popover(isPresented: $isShowPDF, content: {
                if doc != nil {
                    PDFUIView(doc: doc!)
                } else {
                    PDFUIView()
                }
                
            })
        }
    }
}

#Preview {
    NavigationStack {
        DiscoverView()
    }
}
