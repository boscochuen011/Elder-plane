//
//  PDFViewer.swift
//  Elder-plane
//
//  Created by Yu Ho Kwok on 11/19/23.
//

import SwiftUI
import PDFKit

import SwiftUI
import PDFKit

struct PDFKitView: UIViewRepresentable {

    let pdfDocument: PDFDocument

    init(showing pdfDoc: PDFDocument) {
        self.pdfDocument = pdfDoc
    }

    //you could also have inits that take a URL or Data

    func makeUIView(context: Context) -> PDFView {
        let pdfView = PDFView()
        pdfView.document = pdfDocument
        pdfView.autoScales = true
        return pdfView
    }

    func updateUIView(_ pdfView: PDFView, context: Context) {
        pdfView.document = pdfDocument
    }
}

struct PDFUIView: View {

    let pdfDoc: PDFDocument

    init() {
        //for the sake of example, we're going to assume
        //you have a file Lipsum.pdf in your bundle
        let url = Bundle.main.url(forResource: "TW_form", withExtension: "pdf")!
        pdfDoc = PDFDocument(url: url)!
    }
    
    init(doc : PDFDocument){
        pdfDoc = doc
    }

    var body: some View {
        PDFKitView(showing: pdfDoc)
    }
}
