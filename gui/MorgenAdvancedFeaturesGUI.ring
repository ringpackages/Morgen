### Morgen Advanced Features GUI System - Main Entry Point
### Interactive visualization of 10 Advanced AI Features using Objects Library
### Author: Morgen Project Team
### Date: 2024-12-30
AlignHCenter = 2

load "guilib.ring"
//load "../morgen/space.ring"
load "config.ring"

// Load all engines
load "engines/AdvancedAIEngines.ring"

// Load all views
load "views/MainWindowView.ring"
load "views/SelfAwarenessView.ring"
load "views/AllFeatureViews.ring"
load "views/RemainingFeatureViews.ring"

// Load all controllers
load "controllers/SelfAwarenessController.ring"
load "controllers/AllFeatureControllers.ring"
load "controllers/MainWindowController.ring"

//================================================
// 🌟 الميزات الفريدة العشر المتقدمة
// 1. 🧠 الوعي الذاتي (Self-Awareness)
// 2. 📚 التعلم التكيفي (Adaptive Learning)  
// 3. 💾 الذاكرة المتطورة (Advanced Memory)
// 4. 🔄 الدورة المعرفية الشاملة (Cognitive Cycles)
// 5. 🌀 دورة الحلم الثلاثية المتقدمة (Dream Cycles)
// 6. 🕌 معالجة اللغة العربية المتقدمة (Arabic Processing)
// 7. 💎 تكثيف المعنى (Meaning Condensation)
// 8. 🌊 ديناميكيات الأمواج (Wave Dynamics)
// 9. 🔺 الهياكل الناشئة (Emergent Structures)
// 10. 🎨 الإبداع الناشئ (Creative Emergence)
//================================================

new qApp {
    openWindow(:MainWindowController)
    exec()
}
