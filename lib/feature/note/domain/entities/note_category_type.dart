enum NoteCategoryType {
  job,
  home,
  sport,
  trip,
}

extension NoteCategoryTypeExtension on NoteCategoryType {
  String get toText {
    switch (this) {
      case NoteCategoryType.job:
        return "İş";
      case NoteCategoryType.home:
        return "Ev";
      case NoteCategoryType.sport:
        return "Spor";
      case NoteCategoryType.trip:
        return "Seyahat";
    }
  }

  int get toId {
    switch (this) {
      case NoteCategoryType.job:
        return 1;
      case NoteCategoryType.home:
        return 2;
      case NoteCategoryType.sport:
        return 3;
      case NoteCategoryType.trip:
        return 4;
    }
  }
}
