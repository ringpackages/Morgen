# ==============================================================================
# File: quick_start.ring
# Description: Quick start guide for Morgen AI paradigm
# Author: Morgen AI Project
# ==============================================================================

see "==================================================" + nl
see "مرحباً بك في مشروع مرجان (Morgen AI)" + nl
see "==================================================" + nl
see "نموذج ذكاء اصطناعي مبتكر قائم على:" + nl
see "• فضاء النقطة والدائرة المعرفي" + nl
see "• دورة الحلم (حَلّ + لَمّ + حُلْم)" + nl
see "• نموذج بوق جبريل المقلوب" + nl
see "• معالجة اللغة العربية" + nl
see "==================================================" + nl
see nl

see "الخيارات المتاحة:" + nl
see "1. تشغيل العرض التوضيحي الأساسي" + nl
see "2. تشغيل العرض التوضيحي المتقدم (المرحلة 2)" + nl
see "3. تشغيل الاختبارات" + nl
see "4. عرض معلومات المشروع" + nl
see "5. الخروج" + nl
see nl
see "اختر رقماً (1-5): "

give nChoice
nChoice = 0 + nChoice

switch nChoice {
    case 1
        see nl + "تشغيل العرض التوضيحي الأساسي..." + nl
        load "morgen_demo.ring"

    case 2
        see nl + "تشغيل العرض التوضيحي المتقدم (المرحلة 2)..." + nl
        load "phase2_demo.ring"

    case 3
        see nl + "تشغيل الاختبارات..." + nl
        load "tests/run_all_tests.ring"

    case 4
        see nl + "=== معلومات مشروع مرجان ===" + nl
        see "الإصدار: 1.0 (المرحلة صفر مكتملة)" + nl
        see "اللغة: Ring Programming Language" + nl
        see "المطور: فريق مشروع مرجان" + nl
        see nl
        see "المكونات الأساسية:" + nl
        see "• MorgenSymbol: الرموز الحية" + nl
        see "• MorgenSpace: الفضاء المعرفي" + nl
        see "• MorgenRelation: العلاقات بين الرموز" + nl
        see "• geometry_utils: الأدوات الهندسية" + nl
        see "• char_definitions: تعريفات الحروف العربية" + nl
        see nl
        see "الاختبارات المتاحة:" + nl
        see "• test_basic_functionality: الوظائف الأساسية" + nl
        see "• test_enhanced_dream_cycle: دورة الحلم المحسنة" + nl
        see "• test_arabic_language: اللغة العربية" + nl
        see "• test_geometric_structures: الهياكل الهندسية" + nl
        see nl
        see "للمزيد من المعلومات، راجع README.md" + nl

    case 5
        see nl + "شكراً لاستخدام مشروع مرجان!" + nl
        see "وداعاً!" + nl

    default
        see nl + "خيار غير صحيح. تشغيل العرض التوضيحي الأساسي..." + nl
        load "morgen_demo.ring"
}
