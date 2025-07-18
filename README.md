# Trackizer | تريكرايزر

A modern Flutter application for expense tracking and financial management, built with Clean Architecture principles and MVC pattern.

تطبيق Flutter حديث لتتبع المصاريف وإدارة الشؤون المالية، مبني بمبادئ الهندسة المعمارية النظيفة ونمط MVC.

## Features | الميزات

- **Welcome Screen**: Beautiful onboarding experience | **شاشة الترحيب**: تجربة ترحيب جميلة
- **Social Authentication**: Apple, Google, and Facebook sign-in | **المصادقة الاجتماعية**: تسجيل الدخول عبر Apple و Google و Facebook
- **Responsive Design**: Works on all screen sizes | **تصميم متجاوب**: يعمل على جميع أحجام الشاشات
- **Clean Architecture**: Well-structured and maintainable code | **هندسة معمارية نظيفة**: كود منظم وقابل للصيانة

## Getting Started | البدء

This project is a starting point for a Flutter application.

هذا المشروع هو نقطة بداية لتطبيق Flutter.

### Prerequisites | المتطلبات المسبقة

- Flutter SDK (latest version) | Flutter SDK (أحدث إصدار)
- Dart SDK | Dart SDK
- Android Studio / VS Code | Android Studio / VS Code

### Installation | التثبيت

1. Clone the repository | استنسخ المستودع
```bash
git clone https://github.com/your-username/trackizer.git
```

2. Navigate to the project directory | انتقل إلى مجلد المشروع
```bash
cd trackizer
```

3. Install dependencies | ثبت التبعيات
```bash
flutter pub get
```

4. Run the application | شغل التطبيق
```bash
flutter run
```

## Project Structure | هيكل المشروع

```
trackizer/
├── lib/
│   ├── core/                    # Core components and utilities | المكونات والمرافق الأساسية
│   │   ├── colors.dart          # App color definitions | تعريفات ألوان التطبيق
│   │   ├── fonts.dart           # App typography | خطوط التطبيق
│   │   ├── utils/               # Utility classes | فئات مساعدة
│   │   └── widgets/             # Reusable widgets | عناصر واجهة قابلة لإعادة الاستخدام
│   └── features/                # Feature-based modules | وحدات قائمة على الميزات
│       └── welcome/             # Welcome feature | ميزة الترحيب
│           ├── controller/      # Business logic controllers | متحكمات منطق الأعمال
│           ├── model/           # Data models | نماذج البيانات
│           └── view/            # UI screens | شاشات واجهة المستخدم
├── assets/                      # App assets (images, fonts) | أصول التطبيق (صور، خطوط)
├── android/                     # Android-specific files | ملفات خاصة بـ Android
├── ios/                         # iOS-specific files | ملفات خاصة بـ iOS
└── README.md                    # This file | هذا الملف
```

## Architecture | الهندسة المعمارية

This project follows the **Model-View-Controller (MVC)** pattern with Clean Architecture principles:

يتبع هذا المشروع نمط **Model-View-Controller (MVC)** مع مبادئ الهندسة المعمارية النظيفة:

### MVC Pattern | نمط MVC
- **Models**: Handle data and business logic | **النماذج**: تتعامل مع البيانات ومنطق الأعمال
- **Views**: Handle UI rendering and user interaction | **العروض**: تتعامل مع عرض واجهة المستخدم وتفاعل المستخدم
- **Controllers**: Coordinate between models and views | **المتحكمات**: تنسق بين النماذج والعروض

### Clean Architecture | الهندسة المعمارية النظيفة
- **Separation of Concerns**: Each layer has a specific responsibility | **فصل المسؤوليات**: كل طبقة لها مسؤولية محددة
- **Dependency Inversion**: High-level modules don't depend on low-level modules | **عكس التبعية**: الوحدات عالية المستوى لا تعتمد على الوحدات منخفضة المستوى
- **Testability**: Each component can be tested independently | **القابلية للاختبار**: كل مكون يمكن اختباره بشكل مستقل

#