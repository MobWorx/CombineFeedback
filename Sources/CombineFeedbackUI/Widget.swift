import Combine
import CombineFeedback
import SwiftUI

public struct Widget<State, Event, Content: View>: View {
    private let store: Store<State, Event>
    private let content: (Context<State, Event>) -> Content

    public init(
        store: Store<State, Event>,
        @ViewBuilder content: @escaping (Context<State, Event>) -> Content
    ) {
        self.store = store
        self.content = content
    }

    public var body: some View {
        return content(store.context)
    }
}

public struct ViewModelWidget<State, Event, Content: View>: View {
    private let store: Store<State, Event>
    private let content: (Store<State, Event>, Context<State, Event>) -> Content

    public init(
        store: Store<State, Event>,
        @ViewBuilder content: @escaping (Store<State, Event>, Context<State, Event>) -> Content
    ) {
        self.store = store
        self.content = content
    }

    public var body: some View {
        return content(store, store.context)
    }
}

public struct OpaqueWidget<Opaque, Content: View>: View {
    private let object: Opaque
    private let content: (Opaque) -> Content

    public init(
        object: Opaque,
        @ViewBuilder content: @escaping (Opaque) -> Content
    ) {
        self.object = object
        self.content = content
    }

    public var body: some View {
        return content(object)
    }
}
