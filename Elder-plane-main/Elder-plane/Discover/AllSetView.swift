import SwiftUI

struct AllSetView: View {
    
    @Binding var isShowAbout : Bool
    
    var body: some View {
        VStack {
            
            Text("All set up!")
                .font(.system(size: 30)) // Set the font size here
                .bold()
                .foregroundColor(Color(hex: "#006564"))
                .padding(.top, 10)
            
            HStack {
                Image("opt_1")
                    .resizable()  // Make it resizable before setting frame
                    .frame(width: 30, height: 30) // Set the width and height
                    .padding(.leading, 20)
                Text("BASED ON YOUR INPUT")
                    .foregroundColor(Color(hex: "#73C1AF"))
                    .padding(.leading, 2)
                    .padding(.top, 3)
                Spacer()
            }

            Button(action: {}) {
                HStack(alignment: .center) {
                    Image("choice_1") // replace "your_image" with your image name
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 140, height: 110)
                        .clipped()
                        .cornerRadius(20)

                    VStack(alignment: .leading) { // Add this VStack
                        HStack {
                            Image("opt_3")
                                .resizable()  // Make it resizable before setting frame
                                .frame(width: 20, height: 20) // Set the width and height
                                .padding(.leading, 0)
                        }
                    
                        Text("Free & slow\nitinerary")
                            .multilineTextAlignment(.leading)
                            .bold()
                            .foregroundColor(Color(hex: "#006564"))
                            .padding(.leading, 0) // Additional padding to content
//                            .multilineTextAlignment(.leading)
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading) // Align content to left
                .frame(height: 130)
                .padding(.leading, 30) // Additional padding to content
                .background(Color(hex: "ECF6F5"))
                .cornerRadius(20)
                .padding([.leading, .trailing], 20)
            }


            
            
            
            
            HStack {
                Image("opt_2")
                    .resizable()  // Make it resizable before setting frame
                    .frame(width: 30, height: 30) // Set the width and height
                    .padding(.leading, 20)
                Text("BASED ON AI")
                    .foregroundColor(Color(hex: "#73C1AF"))
                    .padding(.leading, 2)
                    .padding(.top, 15)
                Spacer()
            }

            Button(action: {}) {
                HStack(alignment: .center) {
                    Image("choice_2") // replace "your_image" with your image name
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 140, height: 110)
                        .clipped()
                        .cornerRadius(20)
                    
                    VStack(alignment: .leading) { // Add this VStack
                        HStack {
                            Image("opt_4")
                                .resizable()  // Make it resizable before setting frame
                                .frame(width: 20, height: 20) // Set the width and height
                                .padding(.leading, 0)
                            
                            Text("Blood Glucose Control")
                                .padding(.leading, 1)
                                .font(.system(size: 13)) // Set the font size here
                                .foregroundColor(Color(hex: "#73C1AF"))
                        }
                    
                        
                        Text("Low-Sugar &\nlow-Carbs meal")
                            .bold()
                            .foregroundColor(Color(hex: "#006564"))
                            .padding(.leading, 0) // Additional padding to content
                            .multilineTextAlignment(.leading)
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading) // Align content to left
                .frame(height: 130)
                .padding(.leading, 30) // Additional padding to content
                .background(Color(hex: "ECF6F5"))
                .cornerRadius(20)
                .padding([.leading, .trailing], 20)
            }
            
            
            
            Button(action: {}) {
                HStack(alignment: .center) {
                    Image("choice_3") // replace "your_image" with your image name
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 140, height: 110)
                        .clipped()
                        .cornerRadius(20)

                    VStack(alignment: .leading) { // Add this VStack
                        HStack {
                            Image("opt_4")
                                .resizable()  // Make it resizable before setting frame
                                .frame(width: 20, height: 20) // Set the width and height
                                .padding(.leading, 0)
                            
                            Text("Relaxes th blood vessels")
                                .multilineTextAlignment(.leading)
                                .padding(.leading, 1)
                                .font(.system(size: 13)) // Set the font size here
                                .foregroundColor(Color(hex: "#73C1AF"))
                        }
                    
                        Text("Prevent &\nintensive activities")
                            .multilineTextAlignment(.leading)
                            .bold()
                            .foregroundColor(Color(hex: "#006564"))
                            .padding(.leading, 0) // Additional padding to content
//                            .multilineTextAlignment(.leading)
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading) // Align content to left
                .frame(height: 130)
                .padding(.leading, 30) // Additional padding to content
                .background(Color(hex: "ECF6F5"))
                .cornerRadius(20)
                .padding([.leading, .trailing], 20)
            }.padding(.top, 5)

            Spacer() // to push the header and title to top
            Button(action: {
                isShowAbout = false
            }) {
                Text("Start explore the world")
                    .font(.system(size: 22)) // Set the font size here
                    .bold()
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity) // Full width of the button
                    .padding()
                    .background(Color(hex: "73C1AF"))
                    .cornerRadius(10)
            }
            .padding([.leading, .trailing], 20)  // Add horizontal padding
            .frame(height: 120) // Set the height of the button
        }
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .principal) {
                VStack(spacing: 0) {
                    Text("Your perference")
                        .font(.headline)
                        .foregroundColor(Color(hex: "FFFFFF"))
                }
            }
        }
    }
}

struct AllSetView_Previews: PreviewProvider {
    static var previews: some View {
        AllSetView(isShowAbout: Binding.constant(true))
    }
}

