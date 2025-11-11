## 1.0.3

* Added `stickWidth` parameter to `AnimatedLocationPin` for customizable stick width
* Added `stickWidth` parameter to `AnimatePinData` for easier customization
* Updated example app with comprehensive demo
* Added Google Maps API key setup instructions for all platforms (Web, Android, iOS)
* Improved documentation with platform-specific configuration guides

## 1.0.2

* Updated to use `withValues` for color opacity (Flutter 3.27+ compatibility)
* Updated `google_maps_flutter` dependency to ^2.14.0
* Improved shadow rendering with better opacity handling
* Minor performance improvements

## 1.0.1

* Added `AnimatePinData` class for easier pin customization
* Added `pinData` parameter to `LatLngLocationPicker` for simplified pin configuration
* Added `didUpdateWidget` lifecycle method to handle dynamic `enabled` property changes
* Improved pin customization with default values
* Fixed import statement to use correct package name

## 1.0.0

* Initial release
* `LatLngLocationPicker` - Wrapper widget for GoogleMap with location picking
* `AnimatedLocationPin` - Animated pin with physics-based bounce effects
* `LatLngLocationPickerController` - Controller for programmatic enable/disable
* Two animation modes: Simple (boolean) and Advanced (state-based)
* Haptic feedback support
* Fully customizable pin appearance (colors, sizes, shadows)
* Preserves all GoogleMap properties and callbacks
* Complete documentation with examples
* Widget tests with 100% pass rate

