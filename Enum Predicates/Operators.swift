//boolean operators to describe how to treat the items in the associated array
public enum Operator: Filtering {
  //each operator is associated with an array of objects that also conform to Filtering
  case AND([Filtering])
  case OR([Filtering])

  //to conform to Filtering we need to return a predicate, so here we switch self to determine what operator to use, then we return the appropriate NSCompoundPredicate related to self
  public var predicate: NSPredicate {
    switch self {
      case .AND(let filters):
        //we map the associated filters, returning their predicate
        //nice thing with NSCompoundPredicate is it will return a single NSPredicate, meaning we still conform to Filtering
        return NSCompoundPredicate(andPredicateWithSubpredicates: filters.map({ $0.predicate }))
      case .OR(let filters):
        //we map the associated filters, returning their predicate
        //nice thing with NSCompoundPredicate is it will return a single NSPredicate, meaning we still conform to Filtering
        return NSCompoundPredicate(orPredicateWithSubpredicates: filters.map({ $0.predicate }))
    }
  }
}
