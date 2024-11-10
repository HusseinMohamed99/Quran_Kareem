part of './../../core/helpers/export_manager/export_manager.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  @override
  void initState() {
    super.initState();
    checkForUpdate(context);
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
      child: Container(
        decoration: backgroundImage(),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          extendBody: true,
          body: UpgradeWrapper(
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const OnBoardingImage(),
                  const CustomOnBoardingButton(),
                  SizedBox(height: context.screenHeight * 0.03),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

Future<void> checkForUpdate(BuildContext context) async {
  final remoteConfig = FirebaseRemoteConfig.instance;

  await remoteConfig.setConfigSettings(RemoteConfigSettings(
    fetchTimeout: const Duration(seconds: 10),
    minimumFetchInterval: const Duration(hours: 1),
  ));

  await remoteConfig.fetchAndActivate();

  final latestVersion = remoteConfig.getString('latest_version');
  final packageInfo = await PackageInfo.fromPlatform();
  final currentVersion = packageInfo.version;

  if (_isVersionOlder(currentVersion, latestVersion)) {
    showUpdateDialog(context);
  }
}

bool _isVersionOlder(String current, String latest) {
  final currentParts = current.split('.').map(int.parse).toList();
  final latestParts = latest.split('.').map(int.parse).toList();

  for (int i = 0; i < latestParts.length; i++) {
    if (currentParts[i] < latestParts[i]) return true;
    if (currentParts[i] > latestParts[i]) return false;
  }
  return false;
}

void showUpdateDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('تحديث جديد متاح'),
        content: const Text(
            'يوجد إصدار جديد من التطبيق. يُفضل تحديث التطبيق للحصول على أحدث الميزات.'),
        actions: <Widget>[
          TextButton(
            child: const Text('لاحقًا'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          TextButton(
            child: const Text('تحديث الآن'),
            onPressed: () {
              // افتح رابط التطبيق على Google Play
              _launchURL(
                  'https://play.google.com/store/apps/details?id=com.example.your_app_id');
            },
          ),
        ],
      );
    },
  );
}

Future<void> _launchURL(String url) async {
  !await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
  {
    throw Exception('لا يمكن فتح الرابط $url');
  }
}
