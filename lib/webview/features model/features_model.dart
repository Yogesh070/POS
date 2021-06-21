class FeaturesModel {
  final String featureItem;
  final String featureDescription;
  bool statusFeature;

  FeaturesModel({
    required this.featureItem,
    required this.featureDescription,
    this.statusFeature = false,
  });
}
