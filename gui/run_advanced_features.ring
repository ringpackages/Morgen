### Quick Launcher for Morgen Advanced Features GUI
### تشغيل سريع لواجهة الميزات المتقدمة لمرجان
### Author: Morgen Project Team
### Date: 2024-12-30

# Display welcome message
see "=================================================" + nl
see "🌟 مرجان المتقدم - النظام المتكامل للميزات العشر" + nl
see "🌟 Morgen Advanced - Integrated 10 Features System" + nl
see "=================================================" + nl
see nl

see "تحميل النظام المتقدم..." + nl
see "Loading Advanced System..." + nl
see nl

# Load the advanced features GUI
try {
    load "MorgenAdvancedFeaturesGUI.ring"
    see "✅ تم تحميل النظام بنجاح!" + nl
    see "✅ System loaded successfully!" + nl
catch
    see "❌ خطأ في تحميل النظام: " + cCatchError + nl
    see "❌ Error loading system: " + cCatchError + nl
    see nl
    see "تأكد من وجود الملفات التالية:" + nl
    see "Make sure the following files exist:" + nl
    see "- MorgenAdvancedFeaturesGUI.ring" + nl
    see "- config.ring" + nl
    see "- engines/AdvancedAIEngines.ring" + nl
    see "- views/MainWindowView.ring" + nl
    see "- views/SelfAwarenessView.ring" + nl
    see "- views/AllFeatureViews.ring" + nl
    see "- views/RemainingFeatureViews.ring" + nl
    see "- controllers/MainWindowController.ring" + nl
    see "- controllers/SelfAwarenessController.ring" + nl
    see "- controllers/AllFeatureControllers.ring" + nl
    see "- ../morgen/space.ring" + nl
    see "- guilib.ring" + nl
}

see nl
see "=================================================" + nl
see "🎉 مرحباً بك في عالم الذكاء الاصطناعي المتقدم!" + nl
see "🎉 Welcome to the Advanced AI World!" + nl
see "=================================================" + nl
