import '../models/skill-model.dart';

final List<SkillModel> skills = [
  SkillModel(
    title: "Flutter ❤️",
    descriptions: [
      "State management and dependency injection with Riverpod",
      "Responsive design for web and mobile",
      "Material Design and Cupertino widgets",
    ],
    imgPath: "assets/icon_flutter.png",
    size: 40,
  ),
  SkillModel(
    title: "React Native",
    descriptions: [
      "Navigation with React Navigation",
      "Redux state management (actions, reducers, middleware)",
    ],
    imgPath: "assets/icon_react.png",
    size: 40,
  ),
  SkillModel(
    title: "Native Android",
    descriptions: [
      "XML layouts (ConstraintLayout, RecyclerView, custom views)",
      "Jetpack Compose (state hoisting, slot APIs, previews, theming, material components)",
      "Dependency Injection (Hilt / Dagger)",
      "Room for local persistence",
      "WorkManager for background tasks",
    ],
    imgPath: "assets/icon_android.png",
    size: 40,
  ),
  SkillModel(
    title: "Native iOS",
    descriptions: [
      "UIKit (programmatic views, Auto Layout, collection/table views)",
      "SwiftUI (state management with @State, @ObservedObject, @EnvironmentObject)",
      "MVVM & Combine for reactive flows",
      "SwiftData",
    ],
    imgPath: "assets/icon_ios.png",
    size: 40,
  ),
];

final List<SkillModel> services = [
  SkillModel(
    title: "Firebase",
    descriptions: [
      "Authorization with email/password, Gmail, Facebook and more",
      "Firestore storage",
      "Integration for native iOS and Android and cross-platform frameworks.",
    ],
    imgPath: "assets/icon_firebase.png",
    size: 40,
  ),
];
