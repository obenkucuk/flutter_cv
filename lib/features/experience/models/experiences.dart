enum Experiences {
  icrypex,
  marginCoins,
  freelance,
  ;

  String get label {
    switch (this) {
      case Experiences.marginCoins:
        return 'Margin Coins';
      case Experiences.icrypex:
        return 'Icrypex Crypto Exchange';
      case Experiences.freelance:
        return 'Freelance';
    }
  }

  List<String> get tasks {
    switch (this) {
      case Experiences.marginCoins:
        return [
          'Used GoRouter for navigation and GetX for state management',
          'Developed mobile application for crypto-trading',
          'Deployed applications to App Store and Google Play Store',
        ];

      case Experiences.icrypex:
        return [
          'Developed mobile application for crypto-trading',
          'Completed crypto-wallet integration as a seperate application',
          'Implemeted stete management approaches such as Bloc and Riverpod',
          'Integrated CI/CD pipeline for automated testing and deployment',
        ];

      case Experiences.freelance:
        return [
          'Developed data analysis and machine learning algorithms for clients',
          'Made optimizations and data cleaning on existing applications',
          'Created mobile applications by using Flutter',
        ];
    }
  }

  String get location {
    switch (this) {
      case Experiences.marginCoins:
        return 'Istanbul, Aug 2022-Nov 2022';

      case Experiences.icrypex:
        return 'Istanbul, Nov 2022-';

      case Experiences.freelance:
        return 'Istanbul, Nov 2020-Aug 2022';
    }
  }
}
