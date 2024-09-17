import SwiftUI
// TODO: https://www.fivestars.blog/articles/custom-view-styles/ 
struct TextInputConfiguration {
    
}

protocol TextInputStyle {
    associatedtype Body: View
    typealias Configuration = TextInputConfiguration
    
    func makeBody(configuration: Self.Configuration) -> Self.Body
}

struct BasicTextInputStyle: TextInputStyle {
    
    func makeBody(configuration: Configuration) -> some View {
        EmptyView()
    }
}



struct TextInputView<TopView: View>: View {
    var topView: TopView
    
    init(@ViewBuilder top: () -> TopView) {
        self.topView = top()
    }
    
    var body: some View {
        VStack {
            topView
            Text("I am a text field")
                .padding()
                .background(.orange, in: .rect(cornerRadius: 8))
        }
    }
}

struct SampleView: View {
    var body: some View {
        TextInputView {
            Text("User name")
        }
        
    }
}

#Preview {
    SampleView()
}
