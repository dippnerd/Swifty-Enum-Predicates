//our filters for the user to work with
//also conforms to Filtering so the different types can be interchanged
public enum Filter: Filtering {
  //each filter has an associated type to filter by
  case state(State)
  case group(String)
  case icon(String)
  case color(String)

  //an enum to define what states to filter by
  public enum State: String {
    case active = "active"
    case expired = "expired"
    case paused = "paused"
    case stopped = "stopped"
  }

  //the predicate for each filter, using its associated type to filter by
  public var predicate: NSPredicate {
    switch self {
    case .state(let state):
      return NSPredicate(format: "state == %@", state.rawValue)
    case .group(let groupId):
      return NSPredicate(format: "group == %@", groupId)
    case .icon(let icon):
      return NSPredicate(format: "icon == %@", icon)
    case .color(let color):
      return NSPredicate(format: "color == %@", color)
    }
  }
}
