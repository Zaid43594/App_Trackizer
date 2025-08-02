class ProfileModel {
  final String name;
  final String number;
  final String imageUrl;

  ProfileModel({
    required this.name,
    required this.number,
    required this.imageUrl,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
      name: json['name'] ?? '',
      number: json['number'] ?? '',
      imageUrl: json['image_url'] ?? '',
    );
  }
}
