class ProjectEnv {
  static var apiVersion = ""; //"/v1";
  static var projectColor = 0xFF233a4e;
  static var appBarColor = 0xFFEEEEEE;
  static var projectName = "Art Prizes";
  var fontsize = 3;
  static var img = "assets/ArtPrizes.png";
  static var httpURL = "https://api.art-prizes.com";

  static var apiUrl = httpURL + "/api";

// Adverts:
// Get one advert - GET /api/Advertising/GetAdvertisment/{id?}/{usertoken?}
// Get all adverts - GET /api/Advertising/{usertoken?}
  static var getAdvertUrl = apiUrl + "/Advertising/GetAdvertisment";
  static var getAllAdvertsUrl = apiUrl + "/Advertising";

// Art Prizes:
// Get one prize - GET /api/ArtPrize/GetPrize/{id}/{usertoken?}
// Get all prizes - GET /api/ArtPrize/{usertoken?} POST https://api.art-prizes.com/api/artprize//allprizes/<userToken>?searchDate=2018-03-01
// Get all prizes exhibiting - GET /api/ArtPrize/exhibiting/{usertoken?}
// Hide or Un-hide an art prize - PUT /api/HiddenUpdate/{prizeid?}/{usertoken?}/{hidden?}
// Intend to enter prize (or remove intent) - PUT api/IntentToEnter/SetIntent/{prizeid?}/{usertoken?}/{interested?}
// Record prize hit - PUT /api/PrizeHits/{prizeid?}/{usertoken?}
// Add/Remove prize from watch list: PUT api/WatchList/WatchUpdate/{prizeid?}/{usertoken?}/{interested?}
  static var getArtPrizeUrl = apiUrl + "/artprize/GetPrize";
  static var getAllVisiblePrizesUrl = apiUrl + "/ArtPrize";
  static var getAllHiddenPrizesUrl = apiUrl + "/artprize/allprizes";
  static var getAllPrizesExhibitingUrl = apiUrl + "/ArtPrize/exhibiting";
  static var hideUnhideArtPrizeUrl = apiUrl + "/HiddenUpdate";
  static var enterPrizeUrl = apiUrl + "/IntentToEnter/SetIntent";
  static var prizeHitUrl = apiUrl + "/PrizeHits";
  static var addRemovePrizeFromWatchListUrl = apiUrl + "/WatchList/WatchUpdate";

// Artists
//one call to get natsivad data, ie
  ///api/artists/natstivad?id=<optional id>&page=<optional page>&pagelength=<optonal page length>

//one call to get artists data, ie
  ///api/artists/artists?id=<optional id>&page=<optional page>&pagelength=<optonal pae length>

// Login
// Login - GET /api/login/{username?}/{password?}
// Register - GET /api/login/register/{username}/{password}/{email}
// Reset Password - GET /api/Login/ResetPassword/{username?}
  static var loginUrl = apiUrl + "/login";
  static var registerUrl = apiUrl + "/login/register";
  static var resetPasswordUrl = apiUrl + "/Login/ResetPassword";

// Logo
// (not exactly sure what this is, may not be relevant any longer)
// Get current logos - GET /api/Logo/{usertoken?}
  static var logoUrl = apiUrl + "/Logo";

// Settings:
// Get settings - GET /api/Settings/{usertoken?}
  static var settingsUrl = apiUrl + "/Settings";

// Privacy Policy
  static var privacyPolicyUrl = "https://www.art-prizes.com/PrivacyPolicy.html";
}
