//
//  ContentView.swift
//  generalcomponents
//
//  Created by Truong Luan on 7/23/24.
//

import SwiftUI

// TODO: make the callback to format the value before display it
// TODO: Add min image, max image


struct ContentView: View {
    
    private let horPadding: CGFloat = 10
    
    private let top: CGFloat = 30
    private let middle: CGFloat = 15
    
    private let rangeTrunkLeft: CGFloat = 30
    private let rangeTrunkTop: CGFloat = 40
    private let rangeTrunkRight: CGFloat = 30
    
    private let lineW: CGFloat = 1.5
    private let sizeThumb: CGFloat = 7
    
    @State private var centerControl: CGFloat = 0
    @State private var minValue: CGFloat = 0
    @State private var maxValue: CGFloat = 0
    
    @State private var sW: CGFloat = 0
    private let sH: CGFloat = 60
    
    @Binding var valuePercent: CGFloat // [0-100]%
    
    @Binding var value: Float
    var range: ClosedRange<Float>
    var isRounded: Bool
    
    init(percent: Binding<CGFloat>, value: Binding<Float>, range: ClosedRange<Float>, isRounded: Bool = true) {
        self._valuePercent = percent
        self._value = value
        self.range = range
        self.isRounded = isRounded
    }
    
    var body: some View {
        GeometryReader { geo in
            ZStack {
                Canvas { context, size in
                    let y = size.height - lineW/2
                    var curX = horPadding
                    let curC = horPadding + centerControl
                    var path = Path()
                    path.move(to: .init(x: curX, y: y))
                    
                    curX += (curC - rangeTrunkTop/2 - rangeTrunkLeft - horPadding)
                    let p1 = CGPoint(x: curX,
                                     y: y)
                    path.addLine(to: p1)
                    
                    curX += rangeTrunkLeft
                    let p2 = CGPoint(x: curX,
                                     y: y - middle)
                    let c2 = CGPoint(x: curX - rangeTrunkLeft/2,
                                     y: y)

                    path.addQuadCurve(to: p2, control: c2)

                    curX += rangeTrunkTop
                    let p3 = CGPoint(x: curX,
                                     y: y - middle)
                    let c3 = CGPoint(x: curX - rangeTrunkTop/2,
                                     y: y - top)

                    path.addQuadCurve(to: p3, control: c3)
                    
                    curX += rangeTrunkRight
                    let p4 = CGPoint(x: curX,
                                     y: y)
                    let c4 = CGPoint(x: curX - rangeTrunkRight/2,
                                     y: y)

                    path.addQuadCurve(to: p4, control: c4)
                    
                    curX += size.width - curX - horPadding
                    let end = CGPoint(x: curX,
                                      y: y)
                    path.addLine(to: end)
      
                    context.stroke(path, with: .color(.red), style: .init(lineWidth: lineW))
                }
                
                Canvas { context, size in
                    let y = size.height - sizeThumb
                    let curC = horPadding + centerControl
                    let centerP = CGPoint(x: curC,
                                          y: y)
                    let circle = makePoint(center: centerP,
                                           radius: sizeThumb)
                    context.fill(circle, with: .color(.brown))
                    
                    let iText = Text("Hello! I am Luan Truong")
                    let text = context.resolve(iText)
                    let textSize = text.measure(in: size)
                    let textY = CGFloat(0)
                    let centerText = CGPoint(x: centerP.x - textSize.width/2,
                                            y: textY)
                    context.draw(text, in: .init(origin: centerText,
                                                 size: textSize))
                }
                .gesture(
                    DragGesture()
                        .onChanged({ dragInfo in
                            let x = clampCGFloat(value: dragInfo.location.x,
                                                 min: minValue,
                                                 max: maxValue)
                            
                            let percent = Float(getPercent(xCenter: x))
                            
                            let disValue = range.upperBound - range.lowerBound
                            let xValue = ((percent*disValue)/100)+range.lowerBound
                            print("==>> raw value: \(xValue)")
                            if isRounded {
                                let tmpValue = value.rounded(.towardZero)
                                let next = tmpValue + 1
                                let pre = tmpValue - 1
                                print("     pre: \(pre) | next: \(next) | cur_v: \(tmpValue)")
                                if xValue >= next || xValue <= pre {
                                    value = xValue.rounded(.towardZero)
                                    centerControl = x
                                    print("     ------->>> value: \(value)")
                                }
                            } else {
                                // TODO: update if reach the next or previous value
                                centerControl = x
                            }
                            
                        })
                )
                HStack {
                    LinearGradient(colors: [.white,
                                            .clear],
                                   startPoint: .leading,
                                   endPoint: .trailing)
                    Spacer()
                        .frame(width: sW * 0.1)
                    LinearGradient(colors: [.white,
                                            .clear],
                                   startPoint: .trailing,
                                   endPoint: .leading)
                }
                .allowsHitTesting(false)
            }
            .frame(width: sW, height: sH)
            .onAppear(perform: {
                sW = geo.size.width
                minValue = horPadding + rangeTrunkLeft + rangeTrunkTop/2
                maxValue = sW - horPadding*2 - rangeTrunkRight - rangeTrunkTop/2
                if !range.contains(value) {
                    value = range.lowerBound
                }
                let disValue = range.upperBound - range.lowerBound
                let perValue = ((value-range.lowerBound)*100)/disValue
                valuePercent = CGFloat(perValue)

                var x = getXCenter(percent: valuePercent)
                x = x < minValue ? minValue : x
                x = x > maxValue ? maxValue : x
                self.centerControl = x
            })
        }
        .border(.cyan)
    }
    
    private func makePoint(center: CGPoint, radius: CGFloat = 3) -> Path {
        let p = UIBezierPath(arcCenter: center, radius: radius, startAngle: 0, endAngle: CGFloat.pi * 2, clockwise: true).cgPath
        return Path(p)
    }
    
    private func midPoint(p1: CGPoint, p2: CGPoint) -> CGPoint {
        .init(x: (p1.x + p2.x)/2, y: (p1.y + p2.y)/2)
    }
    
    private func clampCGFloat(value: CGFloat, min: CGFloat, max: CGFloat) -> CGFloat {
        if value > max {
            return max
        } else if value < min {
            return min
        }
        return value
    }
    
    private func getPercent(xCenter: CGFloat) -> CGFloat {
        let dis = maxValue - minValue
        let mile = xCenter - minValue
        let per = (mile * 100)/dis
        return per
    }
    
    private func getXCenter(percent: CGFloat) -> CGFloat {
        if percent < 0 || percent > 100 {
            return minValue
        }
        let dis = maxValue - minValue
        let x = (percent*dis)/100
        return x + minValue
    }
}

#Preview {
    ContentView(percent: .constant(10), value: .constant(16), range: 10.2...20.8)
}
