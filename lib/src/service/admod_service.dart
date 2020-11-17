import 'dart:io' ;
class AdmodService{

String getAppId() {
  if (Platform.isAndroid) {
    return 'ca-app-pub-2021590241215652~9624567444';
}
}

String getBannerAdUnitId() {
  if (Platform.isAndroid) {
    //return 'ca-app-pub-2021590241215652/8973846662';
    return 'ca-app-pub-3940256099942544/6300978111';
  } 
}

}