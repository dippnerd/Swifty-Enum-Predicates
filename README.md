# Swifty Enum Predicates
This is an easy way to abstract Core Data Predicates into Swift Enums, as it ensures consistency with your filters, since you won't need to interact with the predicates directly (less risk of typos etc upon reuse). As long as your object (doesn't have to be an enum even) conforms to the **Filtering** protocol (which simply produces an NSPredicate or NSCompoundPredicate) it can be used with this helper. 

There are two main Enums involved:

1. **Operator** accepts an array of anything conforming to Filtering, and can be set to AND or OR to determine how to filter the included items, like: ```(This AND That) OR (This OR That)```
2. **Filter** provides the enum cases to use for filtering. Combined with Operators, you can create complex filter predicates with ease.  


## Example Usage
```swift
let filter: Operator = .AND([
  Operator.OR([
    Filter.state(.active),
    Filter.state(.expired)
  ]),
  Filter.color("red"),
  Filter.icon("timer")
])

print(filter.predicate.predicateFormat)
//should get: (state == "active" OR state == "expired") AND color == "red" AND icon == "timer"
```
