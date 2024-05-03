import SwiftSyntaxMacros
import SwiftSyntaxMacrosTestSupport
import XCTest

#if canImport(Macro)
@testable import Macro

let macros: [String: Macro.Type] = [
    "URL": MacroURL.self
]
#endif

final class MacroURLTests: XCTestCase {
    
    func testCretionFromValidStringLiteral() {
        #if canImport(Macro)
        assertMacroExpansion(
            """
            #URL("https://www.swift.org")
            """,
            expandedSource:
            """
            URL(string: "https://www.swift.org")!
            """,
            macros: macros
        )
        #else
        XCTSkip("Macros are only supported when running tests for the host platform.")
        #endif
    }
    
    func testCretionFromNoArgumentFails() {
        #if canImport(Macro)
        assertMacroExpansion(
            """
            #URL()
            """,
            expandedSource:
            """
            #URL()
            """,
            diagnostics: [
                DiagnosticSpec(
                    message: MacroURLError.invalidStringLiteral.description,
                    line: 1,
                    column: 1
                )
            ],
            macros: macros
        )
        #else
        XCTSkip("Macros are only supported when running tests for the host platform.")
        #endif
    }
    
    func testCretionFromInvalidStringLiteralFails() {
        #if canImport(Macro)
        assertMacroExpansion(
            """
            #URL(1234)
            """,
            expandedSource:
            """
            #URL(1234)
            """,
            diagnostics: [
                DiagnosticSpec(
                    message: MacroURLError.invalidStringLiteral.description,
                    line: 1,
                    column: 1
                )
            ],
            macros: macros
        )
        #else
        XCTSkip("Macros are only supported when running tests for the host platform.")
        #endif
    }
    
    func testCretionFromInvalidURLStringFails() {
        #if canImport(Macro)
        assertMacroExpansion(
            """
            #URL("https:// www.swift.org")
            """,
            expandedSource:
            """
            #URL("https:// www.swift.org")
            """,
            diagnostics: [
                DiagnosticSpec(
                    message: MacroURLError.invalidURL.description,
                    line: 1,
                    column: 1
                )
            ],
            macros: macros
        )
        #else
        XCTSkip("Macros are only supported when running tests for the host platform.")
        #endif
    }
}
