// swift-tools-version:6.4
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "CodeEditorView",
  platforms: [
    .macOS("15.4"),
    .iOS("18.4"),
    .visionOS("2.4")
  ],
  products: [
    .library(
      name: "LanguageSupport",
      targets: ["LanguageSupport"]),
    .library(
      name: "CodeEditorView",
      targets: ["CodeEditorView"]),
  ],
  dependencies: [
    .package(
      url: "https://github.com/ChimeHQ/Rearrange.git",
      .upToNextMajor(from: "2.1.1")),
  ],
  targets: [
    .target(
      name: "LanguageSupport",
      dependencies: [
        "Rearrange",
      ]),
    .target(
      name: "CodeEditorView",
      dependencies: [
        "LanguageSupport",
        "Rearrange",
      ]),
    .testTarget(
      name: "CodeEditorTests",
      dependencies: ["CodeEditorView"]),
  ]
)
