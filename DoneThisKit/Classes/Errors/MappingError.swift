import Foundation

/**
 Errors produced during the entities mapping.

 - MissingAttribute: Missing attribute in the source model.
 - WrongValue:       Wrong value in the source model.
 */
public enum MappingError: ErrorType {
    case MissingAttribute(String)
    case WrongValue(String)
}
