#Flutter Calculator App with Theme Switching, Shared Preferences, Isar Integration, and Provider State Management
Flutter Calculator App

This Flutter pet project is a simple calculator app that not only allows you to perform basic arithmetic calculations but also offers the functionality to switch between different themes, persist the chosen theme using the shared_preferences package, store previously calculated operations using the isar database, and manage app-wide state using the provider package.

##Features

Basic arithmetic operations: addition, subtraction, multiplication, division etc.
Theme switching: Choose between light and dark themes to customize the app's appearance.
Persistent theme settings: The selected theme is saved using the shared_preferences package and is applied on app launch.
Operation history: Previously calculated operations are saved using the isar database for future reference.
Provider state management: App-wide state is managed using the provider package for a streamlined and efficient approach to state management.

###Screens
####Calculator Screen
The main screen of the app displays a simple calculator interface where users can input numbers and perform calculations. It features buttons for digits 0-9, decimal point, and operation buttons (+, -, *, /). The result of the calculation is displayed at the top of the screen.

![Alt text](/posts/path/to/img.jpg "Home Page")

####History Screen
The history screen shows a list of previously calculated operations. Each entry displays the mathematical expression, result, and timestamp of the calculation. Users can refer to their past calculations and see the results at a glance.


##Dependencies
flutter: the Flutter SDK.
shared_preferences: used to persist and retrieve theme settings.
isar: a fast and simple database for Flutter, used to store operation history.
provider: a state management package for Flutter, used for managing app-wide state.


##Usage

Calculator Screen:
Input numbers and perform calculations using the provided buttons.
Use the operation buttons (+, -, *, /) to choose the desired arithmetic operation.

Theme Switching:
Tap the theme switch icon in the app bar to switch between light and dark themes.
The selected theme will be applied on app launch and saved using shared_preferences.

History Screen:
Access the history screen by tapping the history icon in the app bar.
View a list of previously calculated operations with their results.

Provider State Management:

App-wide state is efficiently managed using the provider package.
States related to theme, calculation, and history are effectively coordinated using providers.


##Design
Project design was inspired by: 
https://www.behance.net/gallery/169854567/Calculator-App-UI-Design-Concept?tracking_source=search_projects_recommended|Calculator+UI

##Credits
This project was developed by Leonid Koziavko.