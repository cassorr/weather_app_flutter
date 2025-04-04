# 🌤️ Weather App

Flutter Weather App — a web-based weather app using [Weatherstack API](https://weatherstack.com/), Flutter, and Firebase.

**Deployed URL: 
[https://weather-app-12988.web.app](https://weather-app-12988.web.app)

---

## Project Structure

Here’s a breakdown of the key files and directories inside the `lib/` folder:

### `lib/main.dart`
- Entry point of the Flutter app.
- Loads environment variables, initializes Firebase, and launches the `MenuView`.

### `lib/test.dart`
- Used for manually testing the weather API and saving the data to Firebase Firestore.
- Initializes Firebase and fetches real-time data for a hardcoded city (`Missoula`).

---

### `lib/views/`

| File                  | Purpose                                                   |
|-----------------------|-----------------------------------------------------------|
| `menu_view.dart`      | The main screen that lists all saved cities.              |
| `add_city_view.dart`  | A page with a search bar to add a new city (UI only).     |
| `city_view.dart`      | Detailed weather view for a specific city.                |

---

### `lib/models/`

| File             | Purpose                                                      |
|------------------|--------------------------------------------------------------|
| `city.dart`      | The `City` model with attributes like name, coordinates, and a nested `Weather` object. |
| `weather.dart`   | The `Weather` model includes temperature, humidity, wind, UV index, etc.               |

---

### `lib/services/`

| File                      | Purpose                                                 |
|---------------------------|---------------------------------------------------------|
| `weather_service.dart`    | Fetches live weather data from Weatherstack API.        |
| `firestore_service.dart`  | Handles saving and retrieving city data from Firestore. |

---

## Environment Configuration

### `.env.example`
This file is included as a **template** for your environment variables.

**Why?**  
My actual `.env` file contains sensitive info like API key and Firebase credentials.

Copy `.env.example` and rename it to `.env`, then fill in your actual secrets:
FIREBASE_MEASUREMENT_ID=your-measurement-id
