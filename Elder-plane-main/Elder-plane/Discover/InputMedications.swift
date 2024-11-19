import SwiftUI


struct InputMedications: View {
    
    @State private var isNextPageShown = false
    @State private var isShowAI = false
    
    @Binding var isShowAbout : Bool
    
    var body: some View {
        
        VStack(spacing: 10) {
            Spacer().frame(height: 20)
            Image(systemName: "3.circle.fill")
                .font(.system(size: 18))
                .foregroundColor(Color.midLightGreen)
            
            Text("Types of Travel")
                .font(.system(size: 22,weight: .bold))
                .foregroundColor(Color.darkGreen)
            
            Button(action: {
                print("AI recognition button was tapped")
                isShowAI = true
            }) {
                HStack {
                    Spacer().frame(width: 20)
                    VStack (alignment: .leading) {
                        Image("Ai_takephoto")
                            .resizable()
                            .frame(width: 100, height: 100)
                        
                        Spacer().frame(height: 12)
                        Text("AI recognition")
                            .bold()
                            .foregroundColor(Color(hex: "006564"))
                            .font(.system(size: 25, weight:.bold))
                    }
                    .frame(height: 180)
                    .cornerRadius(20)
                    .offset(y: -1)
                    Spacer()
                    
                    Image(systemName: "arrow.right.circle.fill")
                        .font(.system(size: 35, weight: .bold))
                        .foregroundColor(Color.darkGreen)
                        .padding()
                }
                .background {
                    
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(Color(hex: "006564"), lineWidth: 4)
                        .fill(Color(hex: "ECF6F6"))
                }
                
            }.padding([.leading, .trailing], 10)
            
            Button(action: {
                print("From other services button was tapped")
            }) {
                HStack {
                    VStack (alignment:.leading) {
                        Image("app") // 加入的相片
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 260) // Increase image size
                    
                        Text("From other services")
                            .foregroundColor(Color(hex: "006564"))
                            .font(.system(size: 18, weight:.bold))

                    }.padding(5)
                    
                    Spacer()
                    Image(systemName: "arrow.right.circle.fill")
                        .font(.system(size: 35, weight: .bold))
                        .foregroundColor(Color.darkGreen)
                        .padding(.trailing)
                }
                .frame(height: 180) // Increase button height
                .offset(y: -1)
                .background {
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(Color(hex: "006564"), lineWidth: 4)
                        .fill(Color(hex: "ECF6F6"))
                }
                .padding([.leading, .trailing], 10)
                
            }
            
            Spacer()
            Button(action: {
                print("Input manually button was tapped")
            }) {
                HStack {
                    Image("touch") // 加入的相片
                        .resizable()
                        .frame(width: 40, height: 40) // Increase image size
                        .foregroundColor(.white) // Change icon color to white for better contrast
                    Text("Input manually")
                        .bold()
                        .foregroundColor(.white) // Change text color to white for better contrast
                        .font(.system(size: 18, weight: .bold))
                }
                .padding()
                .frame(height: 64)
                .background(Color(hex: "006564")) // Change background color to "006564"
                .cornerRadius(32)
            }
            
            .offset(y: 10)
            
            NavigationLink(destination: AllSetView(isShowAbout: $isShowAbout), isActive: $isNextPageShown) {
                EmptyView()
            }
            
            Spacer() 
            
            Button(action: {
                self.isNextPageShown = true
            }) {
                ZStack {
                    HStack {
                        Text("Next")
                            .font(.system(size: 20, weight: .bold))
                            .foregroundColor(.white)
                            .padding(.vertical, 20)
                            .frame(maxWidth: .infinity)
                    }
                    HStack {
                        Spacer()
                        Image(systemName: "arrow.right")
                            .foregroundStyle(.white)
                            .font(.system(size: 20, weight: .bold))
                            .padding(20)
                    }
                }
            }
            .frame(height: 75)
            .background(Color(hex: "73C1AF"))
            .cornerRadius(23)
            .padding(.horizontal)
            Spacer()
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
        .popover(isPresented: $isShowAI, content: {
            AIContainer()
                .ignoresSafeArea()
        })
        .onAppear {
            let appearance = UINavigationBarAppearance()
            appearance.configureWithTransparentBackground()
            appearance.backgroundColor = UIColor(Color(hex: "006564"))
            UINavigationBar.appearance().standardAppearance = appearance
            UINavigationBar.appearance().scrollEdgeAppearance = appearance
        }
        
    }
}

struct InputMedications_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            InputMedications(isShowAbout: Binding.constant(true))
        }
    }
}
