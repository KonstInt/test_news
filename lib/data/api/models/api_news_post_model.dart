class ApiNewsPostModel {
  final String id;
  final String imageLink;
  final String title;
  final String subtitle;
  final String text;
  final String dateCreated;

  ApiNewsPostModel(
      {required this.id,
      required this.imageLink,
      required this.title,
      required this.subtitle,
      required this.text,
      required this.dateCreated});
}
