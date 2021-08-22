//apply this protocol to anything you need for filtering via Core Data
public protocol Filtering {
  //to conform, you only need to return a predicate for Core Data to filter on
  var predicate: NSPredicate { get }
}
