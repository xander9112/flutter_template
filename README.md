dart pub global activate melos

iOS Integration #
Note that this plugin works with both Touch ID and Face ID. However, to use the latter, you need to also add:

<key>NSFaceIDUsageDescription</key>
<string>Why is my app authenticating using face id?</string>

Android Integration #
Activity Changes
local_auth requires the use of a FragmentActivity instead of an Activity. To update your application:

If you are using FlutterActivity directly, change it to FlutterFragmentActivity in your AndroidManifest.xml.

If you are using a custom activity, update your MainActivity.java:

import io.flutter.embedding.android.FlutterFragmentActivity;

public class MainActivity extends FlutterFragmentActivity {
// ...
}
or MainActivity.kt:

import io.flutter.embedding.android.FlutterFragmentActivity

class MainActivity: FlutterFragmentActivity() {
// ...
}
to inherit from FlutterFragmentActivity.

Permissions
Update your project's AndroidManifest.xml file to include the USE_BIOMETRIC permissions:

<manifest xmlns:android="http://schemas.android.com/apk/res/android"
          package="com.example.app">
<uses-permission android:name="android.permission.USE_BIOMETRIC"/>
<manifest>
