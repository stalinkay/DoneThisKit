import CarambaKit

internal struct RequestFactory {

    // MARK: - Instance

    internal static var instance: RequestFactory = RequestFactory()

    // MARK: - Attributes

    internal let urlRequestBuilder: UrlRequestBuilder

    // MARK: - Init

    internal init(urlRequestBuilder: UrlRequestBuilder = UrlRequestBuilder(baseUrl: "https://beta.idonethis.com")) {
        self.urlRequestBuilder = urlRequestBuilder
    }

}
