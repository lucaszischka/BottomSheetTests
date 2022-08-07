//
//  ContentView.swift
//
//  Created by Lucas Zischka.
//  Copyright © 2022 Lucas Zischka. All rights reserved.
//

import SwiftUI
import BottomSheet

struct ContentView: View {
    
    @State private var bottomSheetPosition: BottomSheetPosition = .relative(0.5)
    
    @State private var isAppleScrollBehaviourEnabled: Bool = false
    @State private var isBackgroundBlurEnabled: Bool = false
    @State private var isCloseButtonEnabled: Bool = false
    @State private var isContentDragEnabled: Bool = false
    @State private var isDragIndicatorEnabled: Bool = false
    @State private var isFlickThroughEnabled: Bool = false
    @State private var isResizableEnabled: Bool = true
    @State private var isSwipeToDismissEnabled: Bool = false
    @State private var isTapToDismissEnabled: Bool = false
    
    @State private var isHeaderEnabled: Bool = true
    
    @State private var rectangle1Height: CGFloat = 100
    @State private var rectangle2Height: CGFloat = 100
    
    var positionAsString: String {
        switch self.bottomSheetPosition {
        case .dynamic:
            return "dynamic"
        case .dynamicTop:
            return "dynamicTop"
        case .dynamicBottom:
            return "dynamicBottom"
        case .absolute(let value):
            return "absolute\(value)"
        case .absoluteTop(let value):
            return "absoluteTop\(value)"
        case .absoluteBottom(let value):
            return "absoluteBottom\(value)"
        case .relative(let value):
            return "relative\(value)"
        case .relativeTop(let value):
            return "relativeTop\(value)"
        case .relativeBottom(let value):
            return "relativeBottom\(value)"
        case .hidden:
            return "hidden"
        }
    }
    
    var body: some View {
        HStack(alignment: .center, spacing: 20) {
            self.positionSwitchingView
            
            self.modifierToggleView1
            
            self.modifierToggleView2
        }
        .bottomSheet(bottomSheetPosition: self.$bottomSheetPosition, switchablePositions: [
            // Dynamic
            // .dynamicBottom,
            // .dynamic,
            // .dynamicTop,
            
            // Absolute
            // .absoluteBottom(200),
            // .absolute(400),
            // .absolute(600),
            // .absoluteTop(800),
            
            // Relative
            .relativeBottom(0.2),
            .relative(0.5),
            .relative(0.6),
            .relativeTop(0.8)
        ], headerContent: {
            if self.isHeaderEnabled {
                Text(self.positionAsString)
                    .font(.title)
                    .bold()
                    .lineLimit(1)
                    .padding()
            }
        }, mainContent: {
            if self.rectangle1Height >= 0 {
                RoundedRectangle(cornerRadius: 20)
                    .fill(.red)
                    .frame(width: 20, height: self.rectangle1Height)
            }
            
            if self.rectangle2Height >= 0 {
                RoundedRectangle(cornerRadius: 20)
                    .fill(.blue)
                    .frame(height: self.rectangle2Height)
            }
        })
        .enableAppleScrollBehavior(self.isAppleScrollBehaviourEnabled)
        .enableBackgroundBlur(self.isBackgroundBlurEnabled)
        // .backgroundBlurMaterial(.systemDark)
        .showCloseButton(self.isCloseButtonEnabled)
        .enableContentDrag(self.isContentDragEnabled)
        // .customAnimation(.linear)
        // .customBackground(.gray, ignoresSafeAreaEdges: [])
        .onDragChanged({ value in
            print("changed: ", value)
        })
        .onDragEnded({ value in
            print("ended: ", value)
        })
        // .dragPositionSwitchAction({ geometry, value in
        //     //
        // })
        .showDragIndicator(self.isDragIndicatorEnabled)
        // .dragIndicatorColor(.pink)
        // .dragIndicatorAction({ geometry in
        //     //
        // })
        .enableFlickThrough(self.isFlickThroughEnabled)
        .onDismiss {
            print("dismissed")
        }
        .isResizable(self.isResizableEnabled)
        .enableSwipeToDismiss(self.isSwipeToDismissEnabled)
        .enableTapToDismiss(self.isTapToDismissEnabled)
    }
    
    var positionSwitchingView: some View {
        VStack(alignment: .center, spacing: 10) {
            Button(action: {
                self.bottomSheetPosition = .hidden
            }, label: {
                Text(".hidden")
            })
            
            Button(action: {
                self.bottomSheetPosition = .dynamicBottom
            }, label: {
                Text(".dynamicBottom")
            })
            
            Button(action: {
                self.bottomSheetPosition = .dynamic
            }, label: {
                Text(".dynamic")
            })
            
            Button(action: {
                self.bottomSheetPosition = .dynamicTop
            }, label: {
                Text(".dynamicTop")
            })
            
            Button(action: {
                self.bottomSheetPosition = .relativeBottom(0.2)
            }, label: {
                Text(".relativeBottom(0.2)")
            })
            
            Button(action: {
                self.bottomSheetPosition = .relative(0.5)
            }, label: {
                Text(".relative(0.5)")
            })
            
            Button(action: {
                self.bottomSheetPosition = .relativeTop(0.8)
            }, label: {
                Text(".relativeTop(0.8)")
            })
            
            Button(action: {
                self.bottomSheetPosition = .absoluteBottom(200)
            }, label: {
                Text(".absoluteBottom(200)")
            })
            
            Button(action: {
                self.bottomSheetPosition = .absolute(400)
            }, label: {
                Text(".absolute(400)")
            })
            
            Button(action: {
                self.bottomSheetPosition = .absoluteTop(800)
            }, label: {
                Text(".absoluteTop(800)")
            })
        }
    }
    
    var modifierToggleView1: some View {
        VStack(alignment: .center, spacing: 10) {
            Button(action: {
                self.isAppleScrollBehaviourEnabled.toggle()
            }, label: {
                Text("AppleScrollBehaviour")
            })
                .foregroundColor(self.isAppleScrollBehaviourEnabled ? .green : .red)
            
            Button(action: {
                self.isBackgroundBlurEnabled.toggle()
            }, label: {
                Text("BackgroundBlur")
            })
                .foregroundColor(self.isBackgroundBlurEnabled ? .green : .red)
            
            Button(action: {
                self.isCloseButtonEnabled.toggle()
            }, label: {
                Text("CloseButton")
            })
                .foregroundColor(self.isCloseButtonEnabled ? .green : .red)
            
            Button(action: {
                self.isContentDragEnabled.toggle()
            }, label: {
                Text("ContentDrag")
            })
                .foregroundColor(self.isContentDragEnabled ? .green : .red)
            
            Button(action: {
                self.isDragIndicatorEnabled.toggle()
            }, label: {
                Text("DragIndicator")
            })
                .foregroundColor(self.isDragIndicatorEnabled ? .green : .red)
            
            Button(action: {
                self.isFlickThroughEnabled.toggle()
            }, label: {
                Text("FlickThrough")
            })
                .foregroundColor(self.isFlickThroughEnabled ? .green : .red)
        }
    }
    
    var modifierToggleView2: some View {
        VStack(alignment: .center, spacing: 10) {
            Button(action: {
                self.isResizableEnabled.toggle()
            }, label: {
                Text("Resizable")
            })
                .foregroundColor(self.isResizableEnabled ? .green : .red)
            
            Button(action: {
                self.isSwipeToDismissEnabled.toggle()
            }, label: {
                Text("SwipeToDismiss")
            })
                .foregroundColor(self.isSwipeToDismissEnabled ? .green : .red)
            
            Button(action: {
                self.isTapToDismissEnabled.toggle()
            }, label: {
                Text("TapToDismiss")
            })
                .foregroundColor(self.isTapToDismissEnabled ? .green : .red)
            
            Button(action: {
                self.isHeaderEnabled.toggle()
            }, label: {
                Text("Header")
            })
                .foregroundColor(self.isHeaderEnabled ? .green : .red)
            
            HStack(alignment: .center, spacing: 10) {
                Text("Red rectangle")
                Slider(value: self.$rectangle1Height, in: -10...1000, step: 10)
            }
            
            HStack(alignment: .center, spacing: 10) {
                Text("Blue rectangle")
                Slider(value: self.$rectangle2Height, in: -10...1000, step: 10)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
