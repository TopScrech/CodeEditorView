#if os(macOS)
import AppKit
import Testing
@testable import CodeEditorView

@MainActor
struct EditorLayoutTests {
  @Test func editingAndLayoutOnMainActor() throws {
    _ = NSApplication.shared
    let view = CodeView(frame: CGRect(x: 0, y: 0, width: 640, height: 480),
                        with: .swift(),
                        viewLayout: .standard,
                        indentation: .standard,
                        theme: .defaultLight,
                        setText: { _ in },
                        setMessages: { _ in })
    let storage = try #require(view.textStorage)
    storage.replaceCharacters(in: NSRange(location: 0, length: 0), with: "let value = 1\n")
    view.textLayoutManager?.ensureLayout(for: try #require(view.textContentStorage?.documentRange))
    view.layoutSubtreeIfNeeded()
    #expect(view.string == "let value = 1\n")
    storage.replaceCharacters(in: NSRange(location: 12, length: 1), with: "2")
    view.textLayoutManager?.ensureLayout(for: try #require(view.textContentStorage?.documentRange))
    #expect(view.string == "let value = 2\n")
  }
}
#endif
