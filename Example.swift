//USAGE:
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
