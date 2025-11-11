import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:map_latlng_picker/map_latlng_picker.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LatLng Picker Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const LocationPickerExample(),
    );
  }
}

class LocationPickerExample extends StatefulWidget {
  const LocationPickerExample({super.key});

  @override
  State<LocationPickerExample> createState() => _LocationPickerExampleState();
}

class _LocationPickerExampleState extends State<LocationPickerExample> {
  final LatLngLocationPickerController _controller = LatLngLocationPickerController();
  LatLng? _selectedLocation;
  GoogleMapController? _mapController;

  // Default location (San Francisco)
  static const LatLng _defaultLocation = LatLng(37.7749, -122.4194);

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onLocationPicked(LatLng location) {
    setState(() {
      _selectedLocation = location;
    });
    
    // Show snackbar with picked location
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Location: ${location.latitude.toStringAsFixed(6)}, ${location.longitude.toStringAsFixed(6)}',
        ),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  void _togglePicker() {
    if (_controller.isEnabled) {
      _controller.disable?.call();
    } else {
      _controller.enable?.call();
    }
    setState(() {});
  }

  void _goToMyLocation() {
    // In a real app, you would get the actual user location here
    // For this example, we'll just move to the default location
    _mapController?.animateCamera(
      CameraUpdate.newCameraPosition(
        const CameraPosition(
          target: _defaultLocation,
          zoom: 14,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LatLng Picker Demo'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        actions: [
          IconButton(
            icon: const Icon(Icons.info_outline),
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text('How to Use'),
                  content: const Text(
                    '1. Tap the location pin button to enable picker mode\n'
                    '2. Pan the map to select a location\n'
                    '3. The pin will bounce when you stop moving\n'
                    '4. Tap the check button to confirm and disable picker mode',
                  ),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text('Got it'),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
      body: Stack(
        children: [
          // Google Map with LatLng Picker
          LatLngLocationPicker(
            controller: _controller,
            enabled: _controller.isEnabled,
            onLocationPicked: _onLocationPicked,
            pinData: const AnimatePinData(
              color: Colors.blue,
              innerColor: Colors.white,
              stickColor: Colors.blueAccent,
              size: 50,
              stickHeight: 25,
              stickBorderRadius: 4.0,
              shadowColor: Colors.black54,
              shadowDistance: 12.0,
            ),
            child: GoogleMap(
              initialCameraPosition: const CameraPosition(
                target: _defaultLocation,
                zoom: 14,
              ),
              onMapCreated: (controller) {
                _mapController = controller;
              },
              myLocationEnabled: true,
              myLocationButtonEnabled: false,
              zoomControlsEnabled: false,
              mapType: MapType.normal,
            ),
          ),

          // Selected location info card
          if (_selectedLocation != null)
            Positioned(
              top: 16,
              left: 16,
              right: 16,
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text(
                        'Selected Location',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text('Lat: ${_selectedLocation!.latitude.toStringAsFixed(6)}'),
                      Text('Lng: ${_selectedLocation!.longitude.toStringAsFixed(6)}'),
                    ],
                  ),
                ),
              ),
            ),
        ],
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          // My Location Button
          FloatingActionButton(
            heroTag: 'my_location',
            onPressed: _goToMyLocation,
            child: const Icon(Icons.my_location),
          ),
          const SizedBox(height: 16),
          // Toggle Picker Button
          FloatingActionButton(
            heroTag: 'toggle_picker',
            onPressed: _togglePicker,
            backgroundColor: _controller.isEnabled ? Colors.green : Colors.blue,
            child: Icon(_controller.isEnabled ? Icons.check : Icons.location_on),
          ),
        ],
      ),
    );
  }
}
