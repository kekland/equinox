class EqBorderRadiusThemeData {
  final double rectangleRadius;
  final double semiRoundRadius;

  EqBorderRadiusThemeData({
    this.rectangleRadius,
    this.semiRoundRadius,
  });

  EqBorderRadiusThemeData copyWith(
      {double rectangleRadius, double semiRoundRadius}) {
    return EqBorderRadiusThemeData(
      rectangleRadius: rectangleRadius,
      semiRoundRadius: semiRoundRadius,
    );
  }

  EqBorderRadiusThemeData merge(EqBorderRadiusThemeData other) {
    if (other == null) return this;
    return copyWith(
      rectangleRadius: other.rectangleRadius,
      semiRoundRadius: other.semiRoundRadius,
    );
  }
}
