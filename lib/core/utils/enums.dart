enum ResourceType {
  video,
  article,
  file,
}

extension ResourceTypeExtension on ResourceType {
  String title() {
    switch (this) {
      case ResourceType.video:
        return "video";

      case ResourceType.article:
        return "article";

      case ResourceType.file:
        return "resource";
    }
  }
}

extension TypeExtension on String {
  ResourceType getResourceType() {
    switch (this.toLowerCase()) {
      case "video":
        return ResourceType.video;
      case "article":
        return ResourceType.article;
      case "file":
      default:
        return ResourceType.file;
    }
  }
}
