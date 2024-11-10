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
    WidgetsBinding.instance.addPostFrameCallback((_) {
      checkForUpdate(context);
    });
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

  // Set the Remote Config fetch settings
  await remoteConfig.setConfigSettings(RemoteConfigSettings(
    fetchTimeout: const Duration(seconds: 10),
    minimumFetchInterval: const Duration(hours: 1),
  ));

  try {
    // Fetch and activate the remote config
    await remoteConfig.fetchAndActivate();

    // Get the remote version from Remote Config
    final latestVersion = remoteConfig.getString('latest_version');

    // Log the latest version to check if it's fetched correctly
    print('Latest version fetched: $latestVersion');

    // Get the current app version
    final packageInfo = await PackageInfo.fromPlatform();
    final currentVersion = packageInfo.version;

    // Log the current version
    print('Current app version: $currentVersion');

    // Check if the app needs to be updated
    if (_isVersionOlder(currentVersion, latestVersion)) {
      await showUpdateDialog(context);
    }
  } catch (e) {
    print('Error fetching remote config: $e');
  }
}

bool _isVersionOlder(String remoteVersion, String currentVersion) {
  // Split the versions and parse each part as an integer
  List<int> remoteParts =
      remoteVersion.split('.').map((part) => int.tryParse(part) ?? 0).toList();
  List<int> currentParts =
      currentVersion.split('.').map((part) => int.tryParse(part) ?? 0).toList();

  for (int i = 0; i < remoteParts.length; i++) {
    if (remoteParts[i] > currentParts[i]) {
      return true; // Remote version is newer
    } else if (remoteParts[i] < currentParts[i]) {
      return false; // Current version is up-to-date
    }
  }
  return false; // Versions are the same
}

Future<void> showUpdateDialog(BuildContext context) async {
  // Ensure the dialog is shown after the frame is rendered
  WidgetsBinding.instance.addPostFrameCallback((_) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'تحديث جديد متاح',
            style: buildTextStyle(
              context: context,
              fontSize: 15,
              fontWeight: FontWeight.w700,
              color: ColorsManager.kBlackColor,
            ),
          ),
          content: const Text(
              'يوجد إصدار جديد من التطبيق. يُفضل تحديث التطبيق للحصول على أحدث الميزات.'),
          actions: <Widget>[
            TextButton(
              child: Text(
                'لاحقًا',
                style: buildTextStyle(
                  context: context,
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  color: ColorsManager.kBlackColor,
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text(
                'تحديث الآن',
                style: buildTextStyle(
                  context: context,
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  color: ColorsManager.kBlueColor,
                ),
              ),
              onPressed: () {
                _launchURL(
                    'https://play.google.com/store/apps/details?id=com.example.your_app_id');
              },
            ),
          ],
        );
      },
    );
  });
}

Future<void> _launchURL(String url) async {
  !await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
  {
    throw Exception('لا يمكن فتح الرابط $url');
  }
}
