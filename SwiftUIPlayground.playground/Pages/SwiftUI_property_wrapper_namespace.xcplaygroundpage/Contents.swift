//: [Previous](@previous)
/*:
 ## @Namespace
 @Namespace is a property wrapper provided by SwiftUI that allows you to synchronize the namespace of matched views for use in animations. It’s commonly used in conjunction with matchedGeometryEffect to create smooth transitions between views when their positions or sizes change.
 
 @Namespace Tell SwiftUI that View1 is the same thing in ViewA as it is in ViewB, and ViewA/B could be any kind of view, or even different screens in your app.
 */
import SwiftUI
import PlaygroundSupport
struct MinimalMatchedGeometry: View {
	@State private var isFlipped = false
	@Namespace private var namespace

	var body: some View {
		VStack {
			if isFlipped {
				Circle()
					.fill(Color.blue)
					.frame(width: 100, height: 100)
					.matchedGeometryEffect(id: "circle", in: namespace)
			} else {
				RoundedRectangle(cornerRadius: 10)
					.fill(Color.red)
					.frame(width: 200, height: 200)
					.matchedGeometryEffect(id: "circle", in: namespace)
			}
		}
		.onTapGesture {
			withAnimation {
				isFlipped.toggle()
			}
		}
	}
}

struct NamespaceContentView: View {
    var body: some View {
        TabView {
            MinimalMatchedGeometry()
                .tabItem { Label("Minimal", systemImage: "circlebadge") }
            CardGridHero()
                .tabItem { Label("Cards", systemImage: "square.grid.2x2") }
            PillTabs()
                .tabItem { Label("Tabs", systemImage: "capsule") }
            ListToDetailHero()
                .tabItem { Label("List", systemImage: "list.bullet") }
        }
    }
}


struct Card: Identifiable {
    let id = UUID()
    let title: String
    let color: Color
}

struct CardGridHero: View {
    @Namespace private var ns
    @State private var selected: Card?
    
    let cards: [Card] = [
        .init(title: "Alpha", color: .purple),
        .init(title: "Bravo", color: .orange),
        .init(title: "Charlie", color: .teal)
    ]
    
    var body: some View {
        ZStack {
            // Grid of cards
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 120), spacing: 16)], spacing: 16) {
                    ForEach(cards) { card in
                        cardView(card)
                            .onTapGesture {
                                withAnimation(.spring(response: 0.45, dampingFraction: 0.8)) {
                                    selected = card
                                }
                            }
                    }
                }
                .padding()
                .opacity(selected == nil ? 1 : 0) // fade grid when detail is showing
            }
            
            // Detail overlay
            if let selected {
                detailView(selected)
                    .zIndex(1) // ensure overlay on top
            }
        }
    }
    
    @ViewBuilder
    private func cardView(_ card: Card) -> some View {
        VStack(alignment: .leading, spacing: 8) {
            RoundedRectangle(cornerRadius: 16)
                .fill(card.color)
                .frame(height: 100)
            // Match geometry for the colored block
                .matchedGeometryEffect(id: "color-\(card.id)", in: ns)
            
            Text(card.title)
                .font(.headline)
                .matchedGeometryEffect(id: "title-\(card.id)", in: ns)
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color(.systemBackground))
                .shadow(color: .black.opacity(0.08), radius: 6, x: 0, y: 4)
        )
    }
    
    @ViewBuilder
    private func detailView(_ card: Card) -> some View {
        VStack(spacing: 16) {
            RoundedRectangle(cornerRadius: 24)
                .fill(card.color)
                .frame(height: 260)
                .matchedGeometryEffect(id: "color-\(card.id)", in: ns)
            
            Text(card.title)
                .font(.largeTitle.bold())
                .matchedGeometryEffect(id: "title-\(card.id)", in: ns)
            
            Text("This is a detailed view for \(card.title). You can put more content here.")
                .foregroundStyle(.secondary)
            
            Button("Close") {
                withAnimation(.spring(response: 0.45, dampingFraction: 0.8)) {
                    selected = nil
                }
            }
            .buttonStyle(.borderedProminent)
        }
        .padding()
        .background(.ultraThinMaterial)
        .clipShape(RoundedRectangle(cornerRadius: 24))
        .padding()
        .onTapGesture {
            withAnimation(.spring(response: 0.45, dampingFraction: 0.8)) {
                selected = nil
            }
        }
    }
}


struct PillTabs: View {
    @Namespace private var ns
    @State private var selection = 0
    let tabs = ["Home", "Explore", "Profile"]
    
    var body: some View {
        HStack(spacing: 8) {
            ForEach(Array(tabs.enumerated()), id: \.offset) { idx, label in
                Button {
                    withAnimation(.spring(response: 0.4, dampingFraction: 0.8)) {
                        selection = idx
                    }
                } label: {
                    Text(label)
                        .font(.headline)
                        .padding(.vertical, 10)
                        .padding(.horizontal, 16)
                        .frame(maxWidth: .infinity)
                        .background(
                            ZStack {
                                if selection == idx {
                                    RoundedRectangle(cornerRadius: 12)
                                        .fill(Color.accentColor.opacity(0.15))
                                        .matchedGeometryEffect(id: "pill", in: ns)
                                }
                            }
                        )
                }
                .buttonStyle(.plain)
            }
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 12).fill(Color(.systemGray6))
        )
        .padding()
    }
}


struct Photo: Identifiable {
    let id = UUID()
    let name: String
    let imageName: String
}

struct ListToDetailHero: View {
    @Namespace private var ns
    @State private var selected: Photo?
    
    let items: [Photo] = [
        .init(name: "Mountains", imageName: "mountains"),
        .init(name: "Beach", imageName: "beach"),
        .init(name: "Forest", imageName: "forest")
    ]
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(items) { item in
                    HStack(spacing: 12) {
                        Image(item.imageName)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 64, height: 64)
                            .clipShape(RoundedRectangle(cornerRadius: 12))
                            .matchedGeometryEffect(id: "img-\(item.id)", in: ns)
                        Text(item.name)
                            .matchedGeometryEffect(id: "title-\(item.id)", in: ns)
                    }
                    .contentShape(Rectangle())
                    .onTapGesture {
                        withAnimation(.spring(response: 0.5, dampingFraction: 0.85)) {
                            selected = item
                        }
                    }
                }
            }
            .navigationTitle("Photos")
            .overlay {
                if let selected {
                    VStack {
                        Image(selected.imageName)
                            .resizable()
                            .scaledToFit()
                            .frame(maxWidth: .infinity)
                            .matchedGeometryEffect(id: "img-\(selected.id)", in: ns)
                        
                        Text(selected.name)
                            .font(.title.bold())
                            .matchedGeometryEffect(id: "title-\(selected.id)", in: ns)
                        
                        Button("Close") {
                            withAnimation(.spring(response: 0.5, dampingFraction: 0.85)) {
                                self.selected = nil
                            }
                        }
                        .padding(.top, 16)
                    }
                    .padding()
                    .background(.thinMaterial)
                    .ignoresSafeArea()
                    .transition(.opacity)
                    .zIndex(1)
                }
            }
        }
    }
}



PlaygroundPage.current.setLiveView(
    NamespaceContentView()
		.frame(width: 390, height: 844)
)

//: [Next](@next)
