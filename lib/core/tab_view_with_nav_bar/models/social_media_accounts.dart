import '../../../config/icons/icons.dart';

enum SocialMediaAccounts {
  github,
  linkedin,
  medium,
  twitter,
  instagram,
  youtube,
  ;

  Uri get url {
    switch (this) {
      case SocialMediaAccounts.github:
        return Uri.parse('https://www.github.com/obenkucuk');
      case SocialMediaAccounts.linkedin:
        return Uri.parse('https://www.linkedin.com/in/obenkucuk');
      case SocialMediaAccounts.medium:
        return Uri.parse('https://www.medium.com/@obenkucuk');
      case SocialMediaAccounts.twitter:
        return Uri.parse('https://www.twitter.com/obenkucuk');
      case SocialMediaAccounts.instagram:
        return Uri.parse('https://www.instagram.com/obenkucuk');
      case SocialMediaAccounts.youtube:
        return Uri.parse('https://www.youtube.com/obenkucuk');
    }
  }

  MyIcons get icon {
    switch (this) {
      case SocialMediaAccounts.github:
        return MyIcons.github;
      case SocialMediaAccounts.linkedin:
        return MyIcons.linkedin;
      case SocialMediaAccounts.medium:
        return MyIcons.medium;
      case SocialMediaAccounts.twitter:
        return MyIcons.twitter;
      case SocialMediaAccounts.instagram:
        return MyIcons.instagram;
      case SocialMediaAccounts.youtube:
        return MyIcons.youtube;
    }
  }
}
