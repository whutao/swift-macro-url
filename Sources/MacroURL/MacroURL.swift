import Foundation

@freestanding(expression)
public macro URL(_ string: String) -> URL = #externalMacro(
    module: "Macro",
    type: "MacroURL"
)
