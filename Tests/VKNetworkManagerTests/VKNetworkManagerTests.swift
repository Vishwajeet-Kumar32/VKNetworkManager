import Testing
@testable import VKNetworkManager

@Test func example() async throws {
    // Write your test here and use APIs like `#expect(...)` to check expected conditions.
}

@Test("Validate URL")
func validateUrl() async throws {
    let urlString = "https://vk.com/dev"
    #expect(urlString.isValidURL)
}
