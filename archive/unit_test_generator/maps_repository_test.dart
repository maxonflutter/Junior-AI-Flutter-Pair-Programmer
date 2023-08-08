import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:your_package/maps_repository.dart';
import 'package:your_package/places_api_client.dart';
import 'package:your_package/routes_api_client.dart';

import 'maps_repository_test.mocks.dart';

@GenerateMocks([PlacesApiClient, RoutesApiClient])
void main() {
  late MapsRepository mapsRepository;
  late MockPlacesApiClient mockPlacesApiClient;
  late MockRoutesApiClient mockRoutesApiClient;

  setUp(() {
    mockPlacesApiClient = MockPlacesApiClient();
    mockRoutesApiClient = MockRoutesApiClient();
    mapsRepository = MapsRepository(
      placesApiClient: mockPlacesApiClient,
      routesApiClient: mockRoutesApiClient,
    );
  });

  group('getDetailedPlaceFromAddress', () {
    final testAddress = 'test address';
    final testLatLng = LatLng(0, 0);
    final testPlace = Place(placeId: 'testPlaceId');
    final testPhoto = PhotoImage();

    test('returns a tuple of Place and PhotoImage', () async {
      when(mockPlacesApiClient.findPlaceFromText(any, any)).thenAnswer((_) async => testPlace);
      when(mockPlacesApiClient.getDetailedPlace(any)).thenAnswer((_) async => testPlace);
      when(mockPlacesApiClient.getPlacePhoto(any, any, any)).thenAnswer((_) async => testPhoto);

      final result = await mapsRepository.getDetailedPlaceFromAddress(testAddress, testLatLng);

      expect(result.item1, testPlace);
      expect(result.item2, testPhoto);
    });

    test('calls the findPlaceFromText method with the correct parameters', () async {
      await mapsRepository.getDetailedPlaceFromAddress(testAddress, testLatLng);

      verify(mockPlacesApiClient.findPlaceFromText(testAddress, 'circle:10000@0.0,0.0')).called(1);
    });

    test('calls the getDetailedPlace method with the correct placeId', () async {
      when(mockPlacesApiClient.findPlaceFromText(any, any)).thenAnswer((_) async => testPlace);

      await mapsRepository.getDetailedPlaceFromAddress(testAddress, testLatLng);

      verify(mockPlacesApiClient.getDetailedPlace(testPlace.placeId)).called(1);
    });

    test('calls the getPlacePhoto method with the correct parameters', () async {
      when(mockPlacesApiClient.findPlaceFromText(any, any)).thenAnswer((_) async => testPlace);
      when(mockPlacesApiClient.getDetailedPlace(any)).thenAnswer((_) async => testPlace);

      await mapsRepository.getDetailedPlaceFromAddress(testAddress, testLatLng);

      verify(mockPlacesApiClient.getPlacePhoto(testPlace.photos[0].photoReference, testPlace.photos[0].height, testPlace.photos[0].width)).called(1);
    });
  });

  group('getPlaceAutocompletePredictions', () {
    final testInput = 'test input';
    final testPredictions = [PlaceAutocompletePrediction()];

    test('returns a list of PlaceAutocompletePrediction', () async {
      when(mockPlacesApiClient.getAutocompletePredictions(any)).thenAnswer((_) async => testPredictions);

      final result = await mapsRepository.getPlaceAutocompletePredictions(testInput);

      expect(result, testPredictions);
    });
  });
}
```

Please replace `'package:your_package/maps_repository.dart'`, `'package:your_package/places_api_client.dart'`, and `'package:your_package/routes_api_client.dart'` with the actual paths to your classes.