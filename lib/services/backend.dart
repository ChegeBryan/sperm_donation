class BackendUrl {
  // change this to be from environment/constant id
  static const String baseUrl = 'https://spermend.loca.lt';

  // auth URLs
  static const String login = baseUrl + '/auth/login.php';
  static const String register = baseUrl + '/auth/register.php';

  // manage sperm banks
  static const String addSpermBank = baseUrl + '/addSpermBank.php';
  static const String getSpermBanks = baseUrl + '/getSpermBanks.php';
}
