# Swift 6.4 fork

- Upgraded the package to Swift tools 6.4 and Swift 6 language mode
- Upgraded Rearrange to 2.1.1
- Raised minimum deployment versions to macOS 15.4, iOS 18.4, and visionOS 2.4 for actor-isolated cleanup
- Isolated editor state, language services, and location conversion to the main actor
- Checked synchronous TextKit and notification callback boundaries on the main actor
- Made themes and diagnostic messages Sendable
- Made default themes immutable; customize a local theme value and pass it through the editor environment
- Replaced shared non-Sendable regex constants with computed values

LanguageService and LocationConverter implementations now run on the main actor, including async requirements
TextKit storage is UI-thread confined; it must not be read or edited from background tasks
