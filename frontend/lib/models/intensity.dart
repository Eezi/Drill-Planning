class Intensity {
  bool value;
  final String label;

  Intensity(this.value, this.label);

  @override
  String toString() {
    return 'Intensity: {label: ${label}, value: ${value}}';
  }

  Map<String, dynamic> toMap() {
    return {
      'value': value,
      'label': label,
    };
  }

  Intensity.fromMap(Map<String, dynamic> map)
      : value = map['value'],
      label = map['label'];
}
