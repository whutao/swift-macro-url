import Foundation
import SwiftCompilerPlugin
import SwiftSyntax
import SwiftSyntaxBuilder
import SwiftSyntaxMacros

public struct MacroURL: ExpressionMacro {
    
    public static func expansion(
        of node: some FreestandingMacroExpansionSyntax,
        in context: some MacroExpansionContext
    ) throws -> ExprSyntax {
        guard
            let argument = node.arguments.first,
            let stringLiteral = argument.expression.as(StringLiteralExprSyntax.self),
            stringLiteral.segments.count == 1,
            let segment = stringLiteral.segments.first?.as(StringSegmentSyntax.self)
        else {
            throw MacroURLError.invalidStringLiteral
        }
        
        let text = segment.content.text
        
        guard URL(string: text) != nil else {
            throw MacroURLError.invalidURL
        }
        
        return #"URL(string: "\#(raw: text)")!"#
    }
    
}

enum MacroURLError: Error, CustomStringConvertible {
    
    var description: String {
        switch self {
        case .invalidStringLiteral:
            return "Argument must be a string literal."
        case .invalidURL:
            return "The string literal does not represent a valid URL."
        }
    }
    
    case invalidStringLiteral
    case invalidURL
}
