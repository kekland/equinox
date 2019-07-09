/// Controls how card's status will be displayed.
/// - If [statusAppearance] is [CardStatusAppearance.body], 
/// - If [statusAppearance] is [CardStatusAppearance.header], only the header will be painted in
/// the status's color.
/// - If [statusAppearance] is [CardStatusAppearance.strip], the status will be displayed as
/// tiny line on top of the card.
/// - Otherwise, no status will be displayed.
enum CardStatusAppearance {
  /// No status will be displayed
  none,
  /// A tiny line on top of the card will be painted in status's color
  strip,
  /// The header will be painted in status's color. If no header is present, nothing is painted.
  header,
  /// Entire body is painted in status's color.
  body,
}
