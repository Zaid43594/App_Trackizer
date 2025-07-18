# Trackizer 

A modern Flutter application for expense tracking and financial management, built with Clean Architecture principles and MVC pattern.

تطبيق Flutter حديث لتتبع المصاريف وإدارة الشؤون المالية، مبني بمبادئ الهندسة المعمارية النظيفة ونمط MVC.

## Features | الميزات

- **Welcome Screen**: Beautiful onboarding experience | **شاشة الترحيب**: تجربة ترحيب جميلة
- **Social Authentication**: Apple, Google, and Facebook sign-in | **المصادقة الاجتماعية**: تسجيل الدخول عبر Apple و Google و Facebook
- **Responsive Design**: Works on all screen sizes | **تصميم متجاوب**: يعمل على جميع أحجام الشاشات
- **Clean Architecture**: Well-structured and maintainable code | **هندسة معمارية نظيفة**: كود منظم وقابل للصيانة

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

