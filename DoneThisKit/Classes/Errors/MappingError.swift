import Foundation

public enum MappingError: ErrorType {
    case MissingAttribute(String)
    case WrongValue(String)
}
