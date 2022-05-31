class FeatureFlags {
  final Map<String, bool> featureFlags = Map();

  FeatureFlags() {
    featureFlags["premium"] = false;

    /// TODO: register feature flags
  }

  bool isEnabled(String key) {
    return featureFlags.containsKey(key) && featureFlags[key] == true;
  }
}
