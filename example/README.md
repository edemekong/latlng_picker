# LatLng Picker Example

A Flutter demo application showing how to use the `map_latlng_picker` package.

## Getting Started

This example demonstrates:
- Basic usage of `LatLngLocationPicker`
- Using `LatLngLocationPickerController` to enable/disable picker mode
- Customizing pin appearance with `AnimatePinData`
- Handling location selection callbacks

## Setup Google Maps API Key

To run this example, you need to configure Google Maps API keys for each platform:

### 🌐 Web

1. Get your API key from [Google Cloud Console](https://console.cloud.google.com/)
2. Open `web/index.html`
3. Add your API key to the Google Maps script tag:

```html
<script src="https://maps.googleapis.com/maps/api/js?key=YOUR_API_KEY_HERE"></script>
```

### 🤖 Android

1. Get your API key from [Google Cloud Console](https://console.cloud.google.com/)
2. Open `android/app/src/main/AndroidManifest.xml`
3. Add your API key inside the `<application>` tag:

```xml
<application>
    ...
    <meta-data
        android:name="com.google.android.geo.API_KEY"
        android:value="YOUR_API_KEY_HERE"/>
</application>
```

### 🍎 iOS

1. Get your API key from [Google Cloud Console](https://console.cloud.google.com/)
2. Open `ios/Runner/AppDelegate.swift`
3. Add the following import at the top:

```swift
import GoogleMaps
```

4. Add your API key in the `application` method:

```swift
override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
) -> Bool {
    GMSServices.provideAPIKey("YOUR_API_KEY_HERE")
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
}
```

### Getting a Google Maps API Key

1. Go to [Google Cloud Console](https://console.cloud.google.com/)
2. Create a new project or select an existing one
3. Enable the following APIs:
   - Maps SDK for Android
   - Maps SDK for iOS
   - Maps JavaScript API
4. Go to **Credentials** and create an API key
5. (Recommended) Restrict your API key to prevent unauthorized use

## Running the Example

```bash
# Get dependencies
flutter pub get

# Run on your device/emulator
flutter run
```

## Features Demonstrated

- ✅ Enable/disable location picker with controller
- ✅ Custom pin styling
- ✅ Location selection callback
- ✅ Display selected coordinates
- ✅ Haptic feedback
- ✅ Smooth animations

## Learn More

For more information about the package, see the [main README](../README.md).
