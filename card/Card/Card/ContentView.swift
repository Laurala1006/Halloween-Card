import SwiftUI

struct ContentView: View {
    @State private var showImage1 = false // 控制第一張圖片顯示的狀態
    @State private var showImage2 = false // 控制第二張圖片顯示的狀態
    @State private var position2 = CGPoint(x: 200, y: 300) // 第二張圖片初始位置
    private let targetPosition = CGPoint(x: 280, y: 60) // 固定目標位置
    @State private var showText = true // 控制文字顯示的狀態，預設為 true

    var body: some View {
        ZStack {
            // 背景顏色
            LinearGradient(gradient: Gradient(colors: [Color.orange, Color.black]), startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            
            Image("leaves")
                .resizable()
                .ignoresSafeArea()
                .opacity(0.35) // 透明度
            
            if showImage2 {
                Image("bat")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200)
                    .clipShape(Circle())
                    .position(position2)
                    .gesture(
                        DragGesture()
                            .onChanged { value in
                                position2 = value.location // 更新位置
                            }
                    )
                    .transition(.scale)
            }

            VStack {
                if showImage1 {
                    Image("master")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 350, height: 400)
                        .clipShape(Circle())
                        .transition(.scale)
                        .padding(.top, 100)
                }
                //Spacer()
                Text("Happy Halloween>~<")
                    .font(.custom("Kablammo-Regular", size: 35))
                    .rotationEffect(.degrees(showText ? 0 : 360))
                    .scaleEffect(showText ? 1 : 2)
                    .foregroundColor(.orange)
                    .animation(.easeInOut(duration: 0.5), value: showText)
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .center)
                    .padding(.bottom, 50)

                HStack {
                    Button(action: {
                        withAnimation {
                            showImage1.toggle()
                        }
                    }) {
                        Image("halloween2")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 50, height: 50)
                            .clipShape(Circle())
                            .overlay(Circle().stroke(Color.orange, lineWidth: 3))
                    }
                    .padding(.horizontal, 10)
                    
                    Button(action: {
                        withAnimation {
                            showImage2.toggle() //切換bat顯示狀態
                            if showImage2 {
                                withAnimation(.easeInOut(duration: 1.5)) {
                                    position2 = targetPosition // 先移動到目標位置
                                }
                            } else {
                                position2 = CGPoint(x: 200, y: 300) // 重設到初始位置
                            }
                        }
                    }) {
                        Image("halloween1")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 50, height: 50)
                            .clipShape(Circle())
                            .overlay(Circle().stroke(Color.orange, lineWidth: 3))
                    }
                    .padding(.horizontal, 10)
                    
                    Button(action: {
                        withAnimation {
                            showText.toggle()
                        }
                    }) {
                        Image("halloween6")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 50, height: 50)
                            .clipShape(Circle())
                            .overlay(Circle().stroke(Color.orange, lineWidth: 3))
                    }
                    .padding(.horizontal, 10)
                }
                .padding(.bottom, 20)
            }
        }
    }
}

#Preview {
    ContentView()
}

