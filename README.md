![logo](assets/idonethis-kit-logo.png)

[![CI Status](http://img.shields.io/travis/carambalabs/DoneThisKit.svg?style=flat)](https://travis-ci.org/carambalabs/DoneThisKit)
[![codecov](https://codecov.io/gh/carambalabs/DoneThisKit/branch/master/graph/badge.svg)](https://codecov.io/gh/carambalabs/DoneThisKit)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

## Installation

To install it, simply add the following line to your Podfile:

```ruby
pod "DoneThisKit"
```

## TODO
- [ ] Authentication

## How to

### 1. Client

```swift
let client = DoneThisClient()
```

### 2. Requests

```swift
client.entryIndex().subscribeNext { response  in
  // Entries
}
client.entryShow(hashId: hashId)
client.entryCreate(body body: body, teamId: teamId, occurredOn: nil, status: .Done)
client.entryUpdate(hashId: hashId, body body: body, teamId: teamId, occurredOn: nil, status: .Done)
client.entryDelete(hashId: hashId)
client.hookIndex()
client.hookShow(identifier: id)
client.hookUpdate(identifier: id, targetUrl: targetUrl, teamId: teamId)
client.hookDelete(identifier: id)
client.teamIndex()
client.teamShow(hashId: hashId)
  .doOnError { error in
    // We got an error
  }
  .doOnNext { response in
    // We got data
  }
  .subscribe()
```

## References
- API Documentation: [Link](https://i-done-this.readme.io/docs)

## Author

- Pedro Piñera Buendía, pepibumur@gmail.com
- Sergi Gracia, sergigram@gmail.com
- Isaac Roldán, isaac.roldan@gmail.com

## License

DoneThisKit is available under the MIT license. See the LICENSE file for more info.
