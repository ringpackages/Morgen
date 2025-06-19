### Morgen Advanced Text Processing Simulation
### Interactive visualization of Arabic text processing in Advanced Morgen Space
### Using the complete integrated system with all 10 advanced AI features
### Author: Morgen Project Team
### Date: 2024-12-30

load "stdlibcore.ring"
load "guilib.ring"  # Using full GUI library for Objects Library support
load "morgen/space.ring"

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

decimals(3)
PI = 3.14159265
xPos    = 100        ### Canvas position on Screen
yPos    = 25
xWidth  = 1400       ### Canvas size on Screen
yHeight = 900

nProcessingStep = 0

// Advanced AI System Classes
oAdvancedAISystem = null
oSelfAwarenessEngine = null
oAdaptiveLearningSystem = null
oAdvancedMemorySystem = null
oCognitiveCycleManager = null
oArabicProcessingEngine = null
oMeaningCondensationEngine = null
oWaveDynamicsSystem = null
oEmergentStructuresEngine = null
oCreativeEmergenceSystem = null

// Display control variables
bShowDetailedInfo = true  // Show/hide detailed symbol information

// Dream cycle control variables
nMaxDreamCycles = 10     // Maximum number of dream cycles per processing
nCurrentDreamCycles = 0  // Current count of dream cycles
bLimitDreamCycles = true // Enable/disable dream cycle limiting

// Advanced Morgen system variables
oAdvancedMorgenSystem = null
oMorgenSpace = null
aMorgenSymbols = []
aSemanticConnections = []
aTriangulations1 = []
aWaves = []
aInsights = []

// Zoom control variables
nZoomLevel = 1.0
nMinZoom = 0.3
nMaxZoom = 4.0
nZoomStep = 0.1

// Double-click zoom variables
bDoubleClickZoom = false
nDoubleClickX = 0
nDoubleClickY = 0
nPanOffsetX = 0
nPanOffsetY = 0

// Double-click zoom variables (using built-in Qt events)
bDoubleClickActive = false

###-------------------------------
### Define Morgen Colours

colorMorgenBlue   = new qcolor() { setrgb(000,100,200,255) }
colorMorgenGold   = new qcolor() { setrgb(255,215,000,255) }
colorMorgenGreen  = new qcolor() { setrgb(000,150,100,255) }
colorMorgenRed    = new qcolor() { setrgb(200,000,050,255) }
colorMorgenPurple = new qcolor() { setrgb(128,000,128,255) }
colorMorgenWhite  = new qcolor() { setrgb(255,255,255,200) }
colorMorgenBlack  = new qcolor() { setrgb(000,000,000,255) }
colorMorgenCyan   = new qcolor() { setrgb(000,255,255,150) }
colorMorgenSilver = new qcolor() { setrgb(192,192,192,180) }
colorMorgenOrange = new qcolor() { setrgb(255,165,000,200) }

penMorgenBlue   = new qpen() { setcolor(colorMorgenBlue)   setwidth(2) }
penMorgenGold   = new qpen() { setcolor(colorMorgenGold)   setwidth(3) }
penMorgenGreen  = new qpen() { setcolor(colorMorgenGreen)  setwidth(2) }
penMorgenRed    = new qpen() { setcolor(colorMorgenRed)    setwidth(2) }
penMorgenPurple = new qpen() { setcolor(colorMorgenPurple) setwidth(1) }
penMorgenWhite  = new qpen() { setcolor(colorMorgenWhite)  setwidth(1) }
penMorgenCyan   = new qpen() { setcolor(colorMorgenCyan)   setwidth(2) }
penMorgenSilver = new qpen() { setcolor(colorMorgenSilver) setwidth(1) }
penMorgenOrange = new qpen() { setcolor(colorMorgenOrange) setwidth(2) }

//=========================================
// START the APP

myApp = new qApp
{
    win = new qWidget()
    {
        setWindowTitle("مرجان المتقدم - النظام المتكامل لمعالجة النصوص العربية في فضاء مورجن")
        setGeometry(xPos, yPos, xWidth, yHeight)

        // Main canvas for visualization
        Canvas = new qlabel(win)
        {
            MonaLisa = new qPixMap2(800, 550)

            daVinci = new qpainter()
            {
               begin(MonaLisa)
               translate(400, 275)  // Center coordinate system
            }

            setGeometry(5, 80, 800, 550)
            setPixMap(MonaLisa)
            setStyleSheet("border: 2px solid darkblue")

            // Enable event filter for keyboard and mouse
            myFilter = new qallevents(Canvas)
            myFilter.setKeyPressEvent("handleKeyPress()")
            myFilter.setMouseButtonPressEvent("handleMousePress()")
            myFilter.setMouseButtonDblClickEvent("handleMouseDoubleClick()")

            installEventFilter(myFilter)
        }

        // Text input area
        oLabelInput = new qLabel(win) {
            setgeometry(805, 60, 530, 22)
            settext("أدخل النص العربي للمعالجة المتقدمة:")
            setStyleSheet("background-color: lightblue; font-size: 10px; font-weight: bold")
            setAlignment(2)  // Center
        }

        oTextInput = new qTextEdit(win) {
            setgeometry(805, 85, 530, 65)
            setStyleSheet("background-color: lightyellow; font-size: 11px")
            setPlainText("الذكاء الاصطناعي يفهم اللغة العربية بعمق")
        }

        // Control buttons
        oBtnProcess = new qPushButton(win) {
            setGeometry(805, 155, 115, 26)
            setText("معالجة متقدمة")
            setStyleSheet("background-color: lightgreen; font-weight: bold; font-size: 9px")
            setClickEvent("processAdvancedText()")
        }

        oBtnDreamCycle = new qPushButton(win) {
            setGeometry(925, 155, 95, 26)
            setText("دورة حلم")
            setStyleSheet("background-color: lightcoral; font-size: 9px")
            setClickEvent("runDreamCycle()")
        }

        oBtnInsights = new qPushButton(win) {
            setGeometry(1025, 155, 115, 26)
            setText("اكتشاف البصائر")
            setStyleSheet("background-color: lightsteelblue; font-size: 9px")
            setClickEvent("discoverInsights()")
        }

        oBtnClear = new qPushButton(win) {
            setGeometry(1145, 155, 75, 26)
            setText("مسح")
            setStyleSheet("background-color: lightgray; font-size: 9px")
            setClickEvent("clearVisualization()")
        }

        // Zoom control buttons
        oBtnZoomIn = new qPushButton(win) {
            setGeometry(805, 185, 65, 23)
            setText("تكبير +")
            setStyleSheet("background-color: lightgray; font-size: 9px")
            setClickEvent("zoomIn()")
        }

        oBtnZoomOut = new qPushButton(win) {
            setGeometry(875, 185, 65, 23)
            setText("تصغير -")
            setStyleSheet("background-color: lightgray; font-size: 9px")
            setClickEvent("zoomOut()")
        }

        oBtnZoomReset = new qPushButton(win) {
            setGeometry(945, 185, 85, 23)
            setText("إعادة تعيين")
            setStyleSheet("background-color: lightyellow; font-size: 9px")
            setClickEvent("resetZoom()")
        }

        // Dream cycle control
        oLabelDreamControl = new qLabel(win) {
            setgeometry(1035, 185, 110, 23)
            settext("عدد دورات الحلم:")
            setStyleSheet("background-color: lightpink; font-size: 9px; font-weight: bold; border: 1px solid gray; padding: 2px")
            setAlignment(2)  // Center
        }

        oSpinDreamCycles = new qSpinBox(win) {
            setgeometry(1145, 185, 55, 23)
            setMinimum(1)
            setMaximum(100)
            setValue(10)
            setStyleSheet("background-color: white; font-size: 10px")
            setValueChangedEvent("updateDreamCycleLimit()")
        }

        oCheckLimitDreams = new qCheckBox(win) {
            setgeometry(1210, 185, 55, 23)
            setText("تحديد")
            setChecked(true)
            setStyleSheet("font-size: 9px")
            setclickedEvent("toggleDreamLimit()")
        }

        // Toggle detailed info button
        oBtnToggleInfo = new qPushButton(win) {
            setGeometry(930, 590, 130, 25)
            setText("🔍 إخفاء التفاصيل")
            setStyleSheet("background-color: lightcyan; font-size: 10px; font-weight: bold; border: 2px solid darkblue")
            setClickEvent("toggleDetailedInfo()")
        }

        // Analysis output area
        oLabelAnalysis = new qLabel(win) {
            setgeometry(805, 215, 530, 20)
            settext("التحليل المتقدم لفضاء مورجن:")
            setStyleSheet("background-color: lightcyan; font-size: 9px; font-weight: bold")
            setAlignment(2)  // Center
        }

        oTextAnalysis = new qTextEdit(win) {
            setgeometry(805, 240, 530, 130)
            setStyleSheet("background-color: lightcyan; font-size: 8px")
            setReadOnly(true)
        }

        // Processing steps display
        oLabelSteps = new qLabel(win) {
            setgeometry(805, 375, 530, 20)
            settext("خطوات المعالجة المتقدمة:")
            setStyleSheet("background-color: lightyellow; font-size: 9px; font-weight: bold")
            setAlignment(2)  // Center
        }

        oTextSteps = new qTextEdit(win) {
            setgeometry(805, 400, 530, 90)
            setStyleSheet("background-color: lightyellow; font-size: 8px")
            setReadOnly(true)
        }

        // System status display
        oLabelStatus = new qLabel(win) {
            setgeometry(805, 495, 530, 20)
            settext("حالة النظام المتكامل:")
            setStyleSheet("background-color: lightgreen; font-size: 9px; font-weight: bold")
            setAlignment(2)  // Center
        }

        oTextStatus = new qTextEdit(win) {
            setgeometry(805, 520, 530, 65)
            setStyleSheet("background-color: lightgreen; font-size: 8px")
            setReadOnly(true)
        }

        // Zoom level display
        oLabelZoom = new qLabel(win) {
            setgeometry(5, 640, 180, 30)
            settext("🔍 مستوى التكبير: 100%")
            setStyleSheet("background-color: lightgray; font-size: 13px; font-weight: bold; border: 1px solid gray; padding: 3px")
            setAlignment(2)  // Center
        }

        // Controls info
        oLabelControls = new qLabel(win) {
            setgeometry(220, 640, 550, 30)
            settext("🎮 التحكم: [+] تكبير | [-] تصغير | [R] إعادة تعيين | [مسافة] دورة حلم | [T] تبديل التفاصيل | [دبل كليك] تكبير تدريجي (1.5x→2x→2.5x→3x→4x→إعادة تعيين)")
            setStyleSheet("background-color: lightblue; font-size: 11px; border: 1px solid gray; padding: 3px")
            setAlignment(2)  // Center
        }

        // Advanced Legend for Real Morgen System
        oLabelLegend = new qLabel(win) {
            setgeometry(5, 680, 1340, 60)
            settext("🔵 الدوائر المتحدة المركز = المسافة من المركز 0 (الجوهر)  |  📏 الخطوط الشعاعية = الزوايا في الفضاء القطبي" + nl +
                    " الذهبي = رنين فائق (>3.0)  |  🧡 البرتقالي = رنين عالي جداً (2.0-3.0)  |  🔴 الأحمر = رنين عالي (1.5-2.0)  |  🔵 الأزرق = رنين متوسط (1.0-1.5)  |  💚 الأخضر = رنين منخفض (<1.0)" + nl +
                    "💜 السماوي = تدفق المعنى من المركز 0  |  🥈 الفضي = التثليثات المتقدمة  |  'بذرة' = رموز البذور الأساسية  |  'تكثيف' = قيم التكثيف الرامانوجانية")
            setStyleSheet("background-color: white; font-size: 12px; border: 1px solid gray; padding: 4px")
            setWordWrap(true)
            setAlignment(2)  // Center
        }

        // Title
        oTitle = new qLabel(win) {
            setgeometry(5, 20, 1100, 35)
            settext("مرجان المتقدم - النظام المتكامل المحسن لمعالجة النصوص العربية في فضاء مورجن")
            setStyleSheet("background-color: gold; font-size: 12px; font-weight: bold; border: 2px solid darkgoldenrod")
            setAlignment(2)  // Center
        }

        // Subtitle
        oSubtitle = new qLabel(win) {
            setgeometry(5, 58, 1100, 20)
            settext("نظام ذكاء اصطناعي متقدم مع دورة الحلم الثلاثية (حَلّ + لَمّ + حُلْم) ومحرك البصائر الذاتية - محسن الأداء")
            setStyleSheet("background-color: lightgold; font-size: 9px; font-style: italic; border: 1px solid darkgoldenrod")
            setAlignment(2)  // Center
        }

        // Initialize
        initializeAdvancedSystem()
        clearVisualization()

        show()
    }
    exec()
}

return

###==============================================================

// Initialize the advanced Morgen system
Func initializeAdvancedSystem()
    // Create the advanced integrated system with Horn depth
    oMorgenSpace = new MorgenSpace(5)  // Gabriel's Horn depth parameter

    // Initialize data structures
    aMorgenSymbols = []
    aSemanticConnections = []
    aTriangulations = []
    aWaves = []
    aInsights = []

    // Reset dream cycle counter
    nCurrentDreamCycles = 0

    // Update status
    updateSystemStatus("النظام المتكامل المتقدم جاهز للمعالجة (عمق الهورن: 5.0)")
return

// Update dream cycle limit from UI
Func updateDreamCycleLimit()
    nMaxDreamCycles = oSpinDreamCycles.value()
    updateSystemStatus("تم تحديث حد دورات الحلم إلى: " + nMaxDreamCycles)
return

// Toggle dream cycle limiting
Func toggleDreamLimit()
    bLimitDreamCycles = oCheckLimitDreams.isChecked()
    if bLimitDreamCycles
        updateSystemStatus("تم تفعيل تحديد دورات الحلم")
    else
        updateSystemStatus("تم إلغاء تحديد دورات الحلم")
    ok
return

// Toggle detailed information display
Func toggleDetailedInfo()
    bShowDetailedInfo = !bShowDetailedInfo

    if bShowDetailedInfo
        oBtnToggleInfo.setText("🔍 إخفاء التفاصيل")
        updateSystemStatus("✅ تم تفعيل عرض التفاصيل المتقدمة")
    else
        oBtnToggleInfo.setText("👁️ إظهار التفاصيل")
        updateSystemStatus("❌ تم إخفاء التفاصيل لتحسين الوضوح")
    ok

    // Redraw if symbols exist
    if len(aMorgenSymbols) > 0
        redrawWithZoom()
    ok
return

// Update system status display
Func updateSystemStatus(cMessage)
    cCurrentTime = date() + " " + time()
    cStatus = "الوقت: " + cCurrentTime + nl
    cStatus += "الحالة: " + cMessage + nl

    if oMorgenSpace != null
        cStatus += "عدد الرموز: " + len(oMorgenSpace.aSymbols) + nl
        cStatus += "دورات الحلم: " + oMorgenSpace.nEpoch + nl
        cStatus += "الرنين العام: " + oMorgenSpace.nGlobalResonance + nl
        cStatus += "الحد الأقصى للدورات: " + nMaxDreamCycles + " | مفعل: " + bLimitDreamCycles + nl
        cStatus += "دورات الحلم الحالية: " + nCurrentDreamCycles + nl
    ok

    oTextStatus.setPlainText(cStatus)
    myApp.ProcessEvents()
return

// Clear visualization
Func clearVisualization()
    MonaLisa.fill(colorMorgenBlack)
    drawCoordinateSystem()
    Canvas.setPixMap(MonaLisa)
    myApp.ProcessEvents()

    // Clear data
    aMorgenSymbols = []
    aSemanticConnections = []
    aTriangulations = []
    aWaves = []
    aInsights = []
    nProcessingStep = 0
    nCurrentDreamCycles = 0  // Reset dream cycle counter

    oTextAnalysis.setPlainText("")
    oTextSteps.setPlainText("")
    updateSystemStatus("تم مسح الفضاء - جاهز للمعالجة الجديدة")
return

// Draw coordinate system with advanced features (scales with zoom)
Func drawCoordinateSystem()
    // Draw Center 0 (the essence point)
    daVinci.setpen(penMorgenGold)
    daVinci.drawEllipse(-10*nZoomLevel, -10*nZoomLevel, 20*nZoomLevel, 20*nZoomLevel)
    daVinci.setpen(penMorgenWhite)
    daVinci.drawText(-20*nZoomLevel, -25*nZoomLevel, "المركز 0")
    daVinci.drawText(-25*nZoomLevel, -10*nZoomLevel, "(الجوهر)")

    // Draw concentric circles representing distance from Center 0
    for nR = 60*nZoomLevel to 360*nZoomLevel step 60*nZoomLevel
        daVinci.setpen(penMorgenWhite)
        daVinci.drawEllipse(-nR, -nR, nR*2, nR*2)

        // Add radius labels
        nRadiusValue = nR / (300.0 * nZoomLevel)  // Convert to 0-1 scale
        if nZoomLevel >= 1.2  // Show labels when zoomed
            daVinci.drawText(nR-15*nZoomLevel, 8*nZoomLevel, "r=" + nRadiusValue)
        ok
    next

    // Draw radial lines for angle reference
    for nAngle = 0 to 315 step 45
        nRadians = nAngle * PI / 180
        nX = 360*nZoomLevel * cos(nRadians)
        nY = 360*nZoomLevel * sin(nRadians)
        daVinci.drawLine(0, 0, nX, nY)

        // Add angle labels
        if nZoomLevel >= 1.2  // Show angle labels when zoomed
            nLabelX = 380*nZoomLevel * cos(nRadians)
            nLabelY = 380*nZoomLevel * sin(nRadians)
            daVinci.drawText(nLabelX-15*nZoomLevel, nLabelY, "" + nAngle + "°")
        ok
    next
return

// Advanced text processing using the complete Morgen system
Func processAdvancedText()
    cInputText = oTextInput.toPlainText()

    if len(cInputText) = 0
        oTextAnalysis.setPlainText("خطأ: لا يوجد نص للمعالجة")
        return
    ok

    bProcessing = true
    nProcessingStep = 0
    updateSystemStatus("بدء المعالجة المتقدمة...")

    oTextSteps.setPlainText("بدء المعالجة المتقدمة للنص في فضاء مورجن..."+nl+nl)

    // Step 1: Advanced text segmentation and symbol creation
    advancedTextSegmentation(cInputText)

    // Step 2: Create semantic relationships and triangulations
    createAdvancedSemanticStructures()

    // Step 3: Run enhanced dream cycle
    runEnhancedDreamCycle()

    // Step 4: Discover insights and patterns
    discoverAdvancedInsights()

    // Step 5: Visualize the complete advanced system
    visualizeAdvancedResults()

    bProcessing = false
    updateSystemStatus("اكتملت المعالجة المتقدمة بنجاح")
return

// Step 1: Advanced text segmentation with Arabic language processing
Func advancedTextSegmentation(cText)
    nProcessingStep += 1

    cSteps = oTextSteps.toPlainText()
    cSteps += "الخطوة " + nProcessingStep + ": التقسيم المتقدم وإنشاء الرموز" + nl
    oTextSteps.setPlainText(cSteps)

    // Split text into words
    aWords = split(cText, " ")
    aCleanWords = []
    for cWord in aWords
        cWord = trim(cWord)
        if len(cWord) > 0
            add(aCleanWords, cWord)
        ok
    next

    aMorgenSymbols = []

    for i = 1 to len(aCleanWords)
        cWord = aCleanWords[i]

        // Create advanced genome based on Arabic characteristics
        aGenome = createAdvancedGenome(cWord)

        // Calculate position using advanced algorithms
        nRadius = calculateAdvancedRadius(cWord, i, len(aCleanWords))
        nAngle = calculateAdvancedAngle(cWord, i, len(aCleanWords))

        // Create Morgen symbol with enhanced properties
        oSymbol = new MorgenSymbol(cWord, "arabic_word_advanced", aGenome, nRadius, nAngle, null)

        // Set advanced properties using the real system
        oSymbol.nEnergyLevel = calculateWordEnergy(cWord)
        oSymbol.bIsSeed = (len(cWord) <= 3)  // Short words are seeds
        oSymbol.nCondensationValue = len(cWord) * 0.1  // Ramanujan-inspired condensation
        oSymbol.nFractalDepth = len(aGenome) / 2  // Fractal depth based on genome

        // Add to Morgen space (this will automatically create sequential relations)
        oMorgenSpace.addSymbol(oSymbol)
        add(aMorgenSymbols, oSymbol)

        cSteps += "  " + cWord + ": رمز متقدم (طاقة: " + oSymbol.nEnergyLevel + ", نصف قطر: " + nRadius + ")" + nl

        oTextSteps.setPlainText(cSteps)
        myApp.ProcessEvents()
        sleep(0.05)
    next

    cSteps += "تم إنشاء " + len(aMorgenSymbols) + " رمز متقدم" + nl + nl
    oTextSteps.setPlainText(cSteps)

    updateSystemStatus("تم إنشاء " + len(aMorgenSymbols) + " رمز متقدم")
return

// Create advanced genome based on Arabic word characteristics
Func createAdvancedGenome(cWord)
    aGenome = []

    for i = 1 to len(cWord)
        cChar = substr(cWord, i, 1)
        nCharCode = ascii(cChar)

        // Use Arabic-specific encoding
        if nCharCode >= 1575 and nCharCode <= 1610  // Arabic range
            nValue = ((nCharCode - 1575) % 4) + 1
        else
            nValue = (nCharCode % 4) + 1
        ok

        add(aGenome, nValue)
    next

    // Add word-level characteristics
    add(aGenome, len(cWord) % 4 + 1)  // Length influence

    return aGenome
return

// Calculate advanced radius based on word importance
Func calculateAdvancedRadius(cWord, nIndex, nTotal)
    nBaseRadius = 0.3 + (len(cWord) * 0.08)

    // Adjust based on position (middle words are more central)
    nPositionFactor = 1 - fabs((nIndex - (nTotal/2)) / (nTotal/2)) * 0.3

    nRadius = nBaseRadius * nPositionFactor

    if nRadius > 0.9 { nRadius = 0.9 }
    if nRadius < 0.1 { nRadius = 0.1 }

    return nRadius
return

// Calculate advanced angle with semantic distribution
Func calculateAdvancedAngle(cWord, nIndex, nTotal)
    // Base angle distribution
    nBaseAngle = (nIndex-1) * (360.0 / nTotal)

    // Add semantic variation based on word characteristics
    nVariation = (len(cWord) * 15) % 60 - 30  // ±30 degrees variation

    nAngle = nBaseAngle + nVariation

    if nAngle < 0 { nAngle += 360 }
    if nAngle >= 360 { nAngle -= 360 }

    return nAngle
return

// Calculate word energy based on linguistic properties
Func calculateWordEnergy(cWord)
    nEnergy = 1.0

    // Length factor
    nEnergy += len(cWord) * 0.1

    // Arabic characteristics
    for i = 1 to len(cWord)
        nCharCode = ascii(substr(cWord, i, 1))
        if nCharCode >= 1575 and nCharCode <= 1610
            nEnergy += 0.2  // Arabic letters have higher energy
        ok
    next

    return nEnergy
return

// Step 2: Create advanced semantic structures
Func createAdvancedSemanticStructures()
    nProcessingStep++

    cSteps = oTextSteps.toPlainText()
    cSteps += "الخطوة " + nProcessingStep + ": إنشاء الهياكل الدلالية المتقدمة" + nl
    oTextSteps.setPlainText(cSteps)

    aSemanticConnections = []
    aTriangulations1 = []

    // Create triangulations between symbols
    if len(aMorgenSymbols) >= 3
        for i = 1 to len(aMorgenSymbols)-2
            for j = i+1 to len(aMorgenSymbols)-1
                for k = j+1 to len(aMorgenSymbols)
                    oSym1 = aMorgenSymbols[i]
                    oSym2 = aMorgenSymbols[j]
                    oSym3 = aMorgenSymbols[k]

                    // Check if triangulation is beneficial
                    if shouldCreateTriangulation(oSym1, oSym2, oSym3)
                        oMorgenSpace.createTriangulation(oSym1, oSym2, oSym3, "semantic_advanced")
                        add(aTriangulations1, [i, j, k])

                        cSteps += "  تثليث: " + oSym1.cId + " - " + oSym2.cId + " - " + oSym3.cId + nl
                        oTextSteps.setPlainText(cSteps)
                        myApp.ProcessEvents()
                    ok
                next
            next
        next
    ok

    // Create semantic connections
    for i = 1 to len(aMorgenSymbols)-1
        for j = i+1 to len(aMorgenSymbols)
            oSym1 = aMorgenSymbols[i]
            oSym2 = aMorgenSymbols[j]

            nSimilarity = calculateAdvancedSimilarity(oSym1, oSym2)

            if nSimilarity > 0.3  // Create connection if similarity is significant
                nStrength = nSimilarity * 0.9
                oSym1.addRelation(oSym2, "semantic_advanced", nStrength, null)

                aConnection = [i, j, nStrength, "semantic"]
                add(aSemanticConnections, aConnection)
            ok
        next
    next

    cSteps += "تم إنشاء " + len(aTriangulations1) + " تثليث و " + len(aSemanticConnections) + " رابط دلالي" + nl + nl
    oTextSteps.setPlainText(cSteps)

    updateSystemStatus("تم إنشاء الهياكل الدلالية المتقدمة")
return

// Check if triangulation should be created
Func shouldCreateTriangulation(oSym1, oSym2, oSym3)
    // Calculate average similarity
    nSim12 = calculateAdvancedSimilarity(oSym1, oSym2)
    nSim23 = calculateAdvancedSimilarity(oSym2, oSym3)
    nSim13 = calculateAdvancedSimilarity(oSym1, oSym3)

    nAvgSimilarity = (nSim12 + nSim23 + nSim13) / 3

    return nAvgSimilarity > 0.4  // Threshold for triangulation
return

// Calculate advanced similarity between symbols
Func calculateAdvancedSimilarity(oSym1, oSym2)
    // Genome similarity
    nGenomeSim = guicalculateGenomeSimilarity(oSym1.aGenome, oSym2.aGenome)

    // Position similarity (closer symbols are more similar)
    nRadDiff = fabs(oSym1.nRadius - oSym2.nRadius)
    nAngleDiff = fabs(oSym1.nAngle - oSym2.nAngle)
    if nAngleDiff > 180 { nAngleDiff = 360 - nAngleDiff }

    nPosSim = 1 - ((nRadDiff + nAngleDiff/180) / 2)

    // Energy similarity
    nEnergyDiff = fabs(oSym1.nEnergyLevel - oSym2.nEnergyLevel)
    nEnergySim = 1 - (nEnergyDiff / max(oSym1.nEnergyLevel, oSym2.nEnergyLevel))

    // Combined similarity
    nTotalSim = (nGenomeSim * 0.4) + (nPosSim * 0.3) + (nEnergySim * 0.3)

    return nTotalSim
return

// Calculate genome similarity
Func guicalculateGenomeSimilarity(aGenome1, aGenome2)
    if len(aGenome1) = 0 or len(aGenome2) = 0
        return 0
    ok

    nMinLen = min(len(aGenome1), len(aGenome2))
    nMatches = 0

    for i = 1 to nMinLen
        if aGenome1[i] = aGenome2[i]
            nMatches++
        ok
    next

    return nMatches / nMinLen
return

// Step 3: Run enhanced dream cycle using the real system with control
Func runEnhancedDreamCycle()
    nProcessingStep++

    cSteps = oTextSteps.toPlainText()
    cSteps += "الخطوة " + nProcessingStep + ": تشغيل دورة الحلم المحسنة (حَلّ + لَمّ + حُلْم)" + nl

    if bLimitDreamCycles
        cSteps += "  الحد الأقصى لدورات الحلم: " + nMaxDreamCycles + nl
    else
        cSteps += "  دورات الحلم غير محدودة" + nl
    ok

    oTextSteps.setPlainText(cSteps)

    if len(aMorgenSymbols) >= 2
        nCurrentDreamCycles = 0

        // Run dream cycles between compatible symbols
        for i = 1 to len(aMorgenSymbols)-1
            for j = i+1 to len(aMorgenSymbols)
                // Check dream cycle limit
                if bLimitDreamCycles and nCurrentDreamCycles >= nMaxDreamCycles
                    cSteps += "  تم الوصول للحد الأقصى من دورات الحلم (" + nMaxDreamCycles + ")" + nl
                    oTextSteps.setPlainText(cSteps)
                    exit 2  // Exit both loops
                ok

                oSym1 = aMorgenSymbols[i]
                oSym2 = aMorgenSymbols[j]

                // Check if symbols can mate (compatibility check)
                if oSym1.canMateWith(oSym2)
                    nCurrentDreamCycles++

                    cSteps += "  دورة حلم #" + nCurrentDreamCycles + " بين: " + oSym1.cId + " و " + oSym2.cId + nl
                    oTextSteps.setPlainText(cSteps)
                    myApp.ProcessEvents()

                    // Run the real dream cycle
                    oMorgenSpace.dreamCycle(oSym1, oSym2)

                    cSteps += "    تم إنتاج رمز حلم جديد في العصر #" + oMorgenSpace.nEpoch + nl
                    oTextSteps.setPlainText(cSteps)

                    // Update our local symbols list
                    aMorgenSymbols = oMorgenSpace.aSymbols

                    sleep(0.1)
                ok
            next
        next

        cSteps += "  العصر الحالي: " + oMorgenSpace.nEpoch + nl
        cSteps += "  إجمالي الرموز: " + len(oMorgenSpace.aSymbols) + nl
        cSteps += "  دورات الحلم المنفذة: " + nCurrentDreamCycles + nl + nl
        oTextSteps.setPlainText(cSteps)
    ok

    updateSystemStatus("تمت دورة الحلم المحسنة - العصر: " + oMorgenSpace.nEpoch + " (دورات: " + nCurrentDreamCycles + ")")
return

// Step 4: Discover advanced insights
Func discoverAdvancedInsights()
    nProcessingStep++

    cSteps = oTextSteps.toPlainText()
    cSteps += "الخطوة " + nProcessingStep + ": اكتشاف البصائر والأنماط المتقدمة" + nl
    oTextSteps.setPlainText(cSteps)

    aInsights = []

    // Find the most essential symbol using the real system
    oEssential = oMorgenSpace.getMostEssentialSymbol()
    if oEssential != null
        add(aInsights, ["essential_symbol", oEssential.cId, oEssential.nRadius])
        cSteps += "  الرمز الأساسي: " + oEssential.cId + " (المسافة من المركز: " + oEssential.nRadius + ")" + nl

        // Initiate insight wave using the real system
        oMorgenSpace.initiateWave(oEssential, "insight_wave", 0.9)
        add(aWaves, ["insight", len(oMorgenSpace.aWaveFronts), oEssential.cId])

        cSteps += "  تم إطلاق موجة بصيرة من " + oEssential.cId + nl
    ok

    // Find high-resonance symbols
    for oSym in aMorgenSymbols
        if oSym.nResonance > 1.5
            add(aInsights, ["high_resonance", oSym.cId, oSym.nResonance])
            cSteps += "  رمز عالي الرنين: " + oSym.cId + " (رنين: " + oSym.nResonance + ")" + nl
        ok
    next

    // Propagate waves
    if len(aWaves) > 0
        oMorgenSpace.propagateWaves()
        cSteps += "  تم انتشار الأمواج في الفضاء" + nl
    ok

    cSteps += "تم اكتشاف " + len(aInsights) + " بصيرة متقدمة" + nl + nl
    oTextSteps.setPlainText(cSteps)

    updateSystemStatus("تم اكتشاف " + len(aInsights) + " بصيرة")
return

// Manual dream cycle function
Func runDreamCycle()
    if len(aMorgenSymbols) < 2
        updateSystemStatus("يحتاج دورة الحلم إلى رمزين على الأقل")
        return
    ok

    updateSystemStatus("تشغيل دورة حلم يدوية...")

    cSteps = oTextSteps.toPlainText()
    cSteps += "=== دورة حلم يدوية ===" + nl
    cSteps += "المرحلة 1: حَلّ (التحليل)" + nl
    oTextSteps.setPlainText(cSteps)
    myApp.ProcessEvents()
    sleep(0.2)

    cSteps += "المرحلة 2: لَمّ (إعادة التركيب)" + nl
    oTextSteps.setPlainText(cSteps)
    myApp.ProcessEvents()
    sleep(0.2)

    cSteps += "المرحلة 3: حُلْم (التكامل)" + nl
    oTextSteps.setPlainText(cSteps)
    myApp.ProcessEvents()
    sleep(0.2)

    // Run the dream cycle with first two compatible symbols
    if len(aMorgenSymbols) >= 2
        oSym1 = aMorgenSymbols[1]
        oSym2 = aMorgenSymbols[2]
        oMorgenSpace.dreamCycle(oSym1, oSym2)
    else
        // If not enough symbols, just increment epoch
        oMorgenSpace.nEpoch++
    ok

    cSteps += "تمت دورة الحلم #" + oMorgenSpace.nEpoch + nl + nl
    oTextSteps.setPlainText(cSteps)

    // Redraw if symbols exist
    if len(aMorgenSymbols) > 0
        redrawWithZoom()
    ok

    updateSystemStatus("تمت دورة الحلم #" + oMorgenSpace.nEpoch)
return

// Manual insights discovery
Func discoverInsights()
    if len(aMorgenSymbols) = 0
        updateSystemStatus("لا توجد رموز لاكتشاف البصائر")
        return
    ok

    updateSystemStatus("اكتشاف البصائر...")

    cSteps = oTextSteps.toPlainText()
    cSteps += "=== اكتشاف البصائر ===" + nl

    // Find patterns
    nHighResonanceCount = 0
    for oSym in aMorgenSymbols
        if oSym.nResonance > 1.3
            nHighResonanceCount++
            cSteps += "بصيرة: " + oSym.cId + " له رنين عالي (" + oSym.nResonance + ")" + nl
        ok
    next

    if nHighResonanceCount > 0
        cSteps += "تم العثور على " + nHighResonanceCount + " رمز عالي الرنين" + nl
    else
        cSteps += "لا توجد رموز عالية الرنين حالياً" + nl
    ok

    cSteps += nl
    oTextSteps.setPlainText(cSteps)

    updateSystemStatus("تم اكتشاف البصائر")
return

// Step 5: Visualize advanced results
Func visualizeAdvancedResults()
    nProcessingStep++

    cSteps = oTextSteps.toPlainText()
    cSteps += "الخطوة " + nProcessingStep + ": عرض النتائج المتقدمة في فضاء مورجن" + nl
    oTextSteps.setPlainText(cSteps)

    // Clear and redraw
    MonaLisa.fill(colorMorgenBlack)
    drawCoordinateSystem()

    if len(aMorgenSymbols) = 0
        cSteps += "لا توجد رموز للعرض" + nl
        oTextSteps.setPlainText(cSteps)
        return
    ok

    // Draw triangulations first (background)
    drawTriangulations()

    // Draw symbols with advanced visualization
    drawAdvancedSymbols()

    // Draw semantic connections
    drawAdvancedConnections()

    // Draw waves if any
    drawWaves()

    Canvas.setPixMap(MonaLisa)
    myApp.ProcessEvents()

    // Generate comprehensive analysis
    generateAdvancedAnalysis()

    cSteps += "اكتملت المعالجة المتقدمة! النتائج معروضة في فضاء مورجن." + nl
    oTextSteps.setPlainText(cSteps)
return

// Draw triangulations
Func drawTriangulations()
    for aTriangle in aTriangulations1
        nIdx1 = aTriangle[1]
        nIdx2 = aTriangle[2]
        nIdx3 = aTriangle[3]

        oSym1 = aMorgenSymbols[nIdx1]
        oSym2 = aMorgenSymbols[nIdx2]
        oSym3 = aMorgenSymbols[nIdx3]

        // Convert to screen coordinates
        aPos1 = symbolToScreen(oSym1)
        aPos2 = symbolToScreen(oSym2)
        aPos3 = symbolToScreen(oSym3)

        // Draw triangle outline
        daVinci.setpen(penMorgenSilver)
        daVinci.drawLine(aPos1[1], aPos1[2], aPos2[1], aPos2[2])
        daVinci.drawLine(aPos2[1], aPos2[2], aPos3[1], aPos3[2])
        daVinci.drawLine(aPos3[1], aPos3[2], aPos1[1], aPos1[2])
    next
return

// Draw advanced symbols
Func drawAdvancedSymbols()
    for i = 1 to len(aMorgenSymbols)
        oSymbol = aMorgenSymbols[i]

        // Convert to screen coordinates
        aPos = symbolToScreen(oSymbol)
        nX = aPos[1]
        nY = aPos[2]

        // Draw meaning flow from center FIRST
        daVinci.setpen(penMorgenCyan)
        daVinci.drawLine(0, 0, nX, nY)

        // Calculate symbol size based on energy and fractal complexity
        nComplexity = oSymbol.getFractalComplexity()
        nSize = (8 + (oSymbol.nEnergyLevel * 3) + (nComplexity * 1.5)) * nZoomLevel

        // Color based on resonance with enhanced scheme
        if oSymbol.nResonance > 3.0
            daVinci.setpen(penMorgenGold)
            cResonanceLabel = "فائق"
        elseif oSymbol.nResonance > 2.0
            daVinci.setpen(penMorgenOrange)
            cResonanceLabel = "عالي جداً"
        elseif oSymbol.nResonance > 1.5
            daVinci.setpen(penMorgenRed)
            cResonanceLabel = "عالي"
        elseif oSymbol.nResonance > 1.0
            daVinci.setpen(penMorgenBlue)
            cResonanceLabel = "متوسط"
        else
            daVinci.setpen(penMorgenGreen)
            cResonanceLabel = "منخفض"
        ok

        // Draw the main symbol circle
        daVinci.drawEllipse(nX-nSize/2, nY-nSize/2, nSize, nSize)

        // Draw inner pattern based on genome
        drawGenomePattern(nX, nY, nSize*0.6, oSymbol.aGenome)

        // Draw labels based on detail level setting
        daVinci.setpen(penMorgenWhite)

        if bShowDetailedInfo
            // Show detailed information with zoom-adaptive detail level
            daVinci.drawText(nX-40*nZoomLevel, nY+35*nZoomLevel, oSymbol.cId)

            // Show more details as zoom increases
            if nZoomLevel >= 1.5
                cDetailInfo = "E:" + oSymbol.nEnergyLevel + " R:" + oSymbol.nResonance + " F:" + oSymbol.nFractalDepth
                daVinci.drawText(nX-50*nZoomLevel, nY+50*nZoomLevel, cDetailInfo)
            ok

            if nZoomLevel >= 2.0
                cPosInfo = "(" + oSymbol.nRadius + "," + oSymbol.nAngle + "°)"
                daVinci.drawText(nX-40*nZoomLevel, nY+65*nZoomLevel, cPosInfo)
            ok

            // Show special properties at higher zoom levels
            if nZoomLevel >= 2.5
                if oSymbol.bIsSeed
                    daVinci.setpen(penMorgenGold)
                    daVinci.drawText(nX-20*nZoomLevel, nY+80*nZoomLevel, "بذرة")
                ok

                if oSymbol.nCondensationValue > 0
                    daVinci.setpen(penMorgenCyan)
                    daVinci.drawText(nX-30*nZoomLevel, nY+95*nZoomLevel, "تكثيف:" + oSymbol.nCondensationValue)
                ok


            ok
        else
            // Show only the word (simplified view)
            daVinci.drawText(nX-30*nZoomLevel, nY+35*nZoomLevel, oSymbol.cId)
        ok

        myApp.ProcessEvents()
        sleep(0.05)
    next
return

// Draw genome pattern inside symbol
Func drawGenomePattern(nCenterX, nCenterY, nSize, aGenome)
    if len(aGenome) = 0 { return }

    nPatternRadius = nSize / 3
    nAngleStep = 360.0 / len(aGenome)

    for i = 1 to len(aGenome)
        nAngle = (i-1) * nAngleStep * PI / 180
        nX = nCenterX + (nPatternRadius * cos(nAngle))
        nY = nCenterY + (nPatternRadius * sin(nAngle))

        // Different patterns for different genome values
        if aGenome[i] = 1
            daVinci.setpen(penMorgenWhite)
            daVinci.drawEllipse(nX-2, nY-2, 4, 4)
        elseif aGenome[i] = 2
            daVinci.setpen(penMorgenCyan)
            daVinci.drawEllipse(nX-3, nY-3, 6, 6)
        elseif aGenome[i] = 3
            daVinci.setpen(penMorgenGold)
            daVinci.drawEllipse(nX-2, nY-2, 4, 4)
        else
            daVinci.setpen(penMorgenRed)
            daVinci.drawEllipse(nX-1, nY-1, 2, 2)
        ok
    next
return

// Draw advanced connections
Func drawAdvancedConnections()
    for aConnection in aSemanticConnections
        nIdx1 = aConnection[1]
        nIdx2 = aConnection[2]
        nStrength = aConnection[3]

        oSym1 = aMorgenSymbols[nIdx1]
        oSym2 = aMorgenSymbols[nIdx2]

        aPos1 = symbolToScreen(oSym1)
        aPos2 = symbolToScreen(oSym2)

        // Color and style based on strength
        if nStrength > 0.7
            daVinci.setpen(penMorgenRed)
            cStrengthLabel = "قوي جداً"
        elseif nStrength > 0.5
            daVinci.setpen(penMorgenPurple)
            cStrengthLabel = "قوي"
        elseif nStrength > 0.3
            daVinci.setpen(penMorgenBlue)
            cStrengthLabel = "متوسط"
        else
            daVinci.setpen(penMorgenGreen)
            cStrengthLabel = "ضعيف"
        ok

        daVinci.drawLine(aPos1[1], aPos1[2], aPos2[1], aPos2[2])

        // Draw strength label at midpoint only if detailed info is enabled
        if bShowDetailedInfo
            nMidX = (aPos1[1] + aPos2[1]) / 2
            nMidY = (aPos1[2] + aPos2[2]) / 2

            daVinci.setpen(penMorgenWhite)
            daVinci.drawText(nMidX-15*nZoomLevel, nMidY-5*nZoomLevel, "" + nStrength)
        ok
    next
return

// Draw waves
Func drawWaves()
    for aWave in aWaves
        cWaveType = aWave[1]
        nWaveId = aWave[2]
        cSourceId = aWave[3]

        // Find source symbol
        for oSym in aMorgenSymbols
            if oSym.cId = cSourceId
                aPos = symbolToScreen(oSym)

                // Draw wave effect
                daVinci.setpen(penMorgenOrange)
                for nRadius = 20 to 100 step 20
                    nWaveRadius = nRadius * nZoomLevel
                    daVinci.drawEllipse(aPos[1]-nWaveRadius, aPos[2]-nWaveRadius,
                                       nWaveRadius*2, nWaveRadius*2)
                next

                exit
            ok
        next
    next
return

// Convert symbol position to screen coordinates (normal scaling)
Func symbolToScreen(oSymbol)
    nRadians = oSymbol.nAngle * PI / 180
    nX = (oSymbol.nRadius * 300 * nZoomLevel) * cos(nRadians)
    nY = (oSymbol.nRadius * 300 * nZoomLevel) * sin(nRadians)

    // Apply double-click zoom offset
    if bDoubleClickZoom
        nX += nPanOffsetX * nZoomLevel
        nY += nPanOffsetY * nZoomLevel
    ok

    return [nX, nY]
return

// Generate comprehensive analysis
Func generateAdvancedAnalysis()
    cAnalysis = "=== التحليل المتقدم لفضاء مورجن ===" + nl + nl

    cAnalysis += "النص المدخل: " + oTextInput.toPlainText() + nl
    cAnalysis += "عدد الكلمات: " + len(aMorgenSymbols) + nl + nl

    // Symbol analysis
    cAnalysis += "تحليل الرموز:" + nl
    nTotalEnergy = 0
    nTotalResonance = 0
    nHighEnergyCount = 0

    for oSym in aMorgenSymbols
        nTotalEnergy += oSym.nEnergyLevel
        nTotalResonance += oSym.nResonance

        if oSym.nEnergyLevel > 2.0
            nHighEnergyCount++
        ok

        cAnalysis += "  " + oSym.cId + ": طاقة=" + oSym.nEnergyLevel +
                     ", رنين=" + oSym.nResonance +
                     ", مسافة=" + oSym.nRadius + nl
    next

    if len(aMorgenSymbols) > 0
        nAvgEnergy = nTotalEnergy / len(aMorgenSymbols)
        nAvgResonance = nTotalResonance / len(aMorgenSymbols)

        cAnalysis += nl + "المتوسطات:" + nl
        cAnalysis += "  متوسط الطاقة: " + nAvgEnergy + nl
        cAnalysis += "  متوسط الرنين: " + nAvgResonance + nl
        cAnalysis += "  رموز عالية الطاقة: " + nHighEnergyCount + nl
    ok

    // System analysis using real system data
    cAnalysis += nl + "تحليل النظام المتقدم:" + nl
    cAnalysis += "  العصر الحالي (دورات الحلم): " + oMorgenSpace.nEpoch + nl
    cAnalysis += "  عمق هورن جابرييل: " + oMorgenSpace.nHornDepth + nl
    cAnalysis += "  الرنين العام للفضاء: " + oMorgenSpace.nGlobalResonance + nl
    cAnalysis += "  التثليثات المتقدمة: " + len(oMorgenSpace.aTriangulations) + nl
    cAnalysis += "  العناقيد المجرية: " + len(oMorgenSpace.aGalaxies) + nl
    cAnalysis += "  المعقدات عالية الرتبة: " + len(oMorgenSpace.aComplexes) + nl
    cAnalysis += "  الأمواج النشطة: " + len(oMorgenSpace.aWaveFronts) + nl
    cAnalysis += "  البصائر المكتشفة: " + len(aInsights) + nl

    // Count active waves
    nActiveWaves = 0
    for oWave in oMorgenSpace.aWaveFronts
        if oWave["active"] = true
            nActiveWaves++
        ok
    next
    cAnalysis += "  الأمواج النشطة حالياً: " + nActiveWaves + nl

    // Find most essential symbol using real system
    oEssential = oMorgenSpace.getMostEssentialSymbol()
    if oEssential != null
        cAnalysis += nl + "الرمز الأساسي: " + oEssential.cId +
                     " (المسافة من المركز: " + oEssential.nRadius + ")" + nl
        cAnalysis += "  التعقد الكسري: " + oEssential.getFractalComplexity() + nl
        cAnalysis += "  قيمة التكثيف: " + oEssential.nCondensationValue + nl
        cAnalysis += "  العمق الكسري: " + oEssential.nFractalDepth + nl
    ok

    oTextAnalysis.setPlainText(cAnalysis)
return

###==============================================================
// Event Handlers and Control Functions

// Handle mouse press events
Func handleMousePress()
    nX = myFilter.getX()
    nY = myFilter.getY()
    nButton = myFilter.getButton()

    // Only handle left mouse button
    if nButton != 1
        return
    ok

    // Simple click handling (if needed for other features)
    updateSystemStatus("نقرة في الموضع: (" + nX + ", " + nY + ")")
return

// Handle mouse double-click events for progressive zoom
Func handleMouseDoubleClick()
    nX = myFilter.getX()
    nY = myFilter.getY()

    updateSystemStatus("🎯 تم اكتشاف دبل كليك - تطبيق التكبير التدريجي...")

    // Get precise canvas coordinates
    aCanvasCoords = getCanvasMouseCoords(nX, nY)
    nDoubleClickX = aCanvasCoords[1]  // X relative to canvas center
    nDoubleClickY = aCanvasCoords[2]  // Y relative to canvas center

    // Progressive zoom levels (smaller increments)
    if nZoomLevel < 1.3
        nNewZoomLevel = 1.5
    elseif nZoomLevel < 1.8
        nNewZoomLevel = 2.0
    elseif nZoomLevel < 2.3
        nNewZoomLevel = 2.5
    elseif nZoomLevel < 2.8
        nNewZoomLevel = 3.0
    elseif nZoomLevel < 3.5
        nNewZoomLevel = 4.0
    else
        // Reset to normal view after maximum zoom
        bDoubleClickZoom = false
        nPanOffsetX = 0
        nPanOffsetY = 0
        nZoomLevel = 1.0
        updateSystemStatus("🔄 تم إعادة تعيين التكبير - العودة للعرض الطبيعي")
        updateZoomDisplay()
        if len(aMorgenSymbols) > 0
            redrawWithZoom()
        ok
        return
    ok

    // Calculate new pan offset to focus on mouse position
    if bDoubleClickZoom
        // Adjust pan offset based on current zoom and new zoom
        nZoomRatio = nNewZoomLevel / nZoomLevel
        nPanOffsetX = (nPanOffsetX * nZoomRatio) - (nDoubleClickX * (nZoomRatio - 1))
        nPanOffsetY = (nPanOffsetY * nZoomRatio) - (nDoubleClickY * (nZoomRatio - 1))
    else
        // First zoom - center on clicked point
        bDoubleClickZoom = true
        nPanOffsetX = -nDoubleClickX * (nNewZoomLevel - 1)
        nPanOffsetY = -nDoubleClickY * (nNewZoomLevel - 1)
    ok

    nZoomLevel = nNewZoomLevel

    updateSystemStatus("✅ تكبير تدريجي: " + nZoomLevel + "x - دبل كليك مرة أخرى للمزيد")
    updateZoomDisplay()

    if len(aMorgenSymbols) > 0
        redrawWithZoom()
    ok
return

// Handle keyboard events
Func handleKeyPress()
    nKey = myFilter.getKeyCode()

    // Plus key or Up arrow = zoom in
    if nKey = 43 or nKey = 16777235  // '+' or Up arrow
        zoomIn()
    // Minus key or Down arrow = zoom out
    elseif nKey = 45 or nKey = 16777237  // '-' or Down arrow
        zoomOut()
    // R key = reset zoom
    elseif nKey = 82  // 'R' key
        resetZoom()
    // Space key = run dream cycle
    elseif nKey = 32  // Space key
        runDreamCycle()
    // I key = discover insights
    elseif nKey = 73  // 'I' key
        discoverInsights()
    // T key = toggle detailed info
    elseif nKey = 84  // 'T' key
        toggleDetailedInfo()
    ok
return

// Update zoom level display
Func updateZoomDisplay()
    cZoomText = "🔍 مستوى التكبير: " + (nZoomLevel * 100) + "%"
    oLabelZoom.setText(cZoomText)
    win.setWindowTitle("مرجان المتقدم - النظام المتكامل - " + cZoomText)
return

// Redraw visualization with current zoom level
Func redrawWithZoom()
    MonaLisa.fill(colorMorgenBlack)
    drawCoordinateSystem()

    if len(aMorgenSymbols) = 0
        Canvas.setPixMap(MonaLisa)
        return
    ok

    // Redraw all elements with zoom
    drawTriangulations()
    drawAdvancedSymbols()
    drawAdvancedConnections()
    drawWaves()

    Canvas.setPixMap(MonaLisa)
    myApp.ProcessEvents()
return

// Zoom in function
Func zoomIn()
    nZoomLevel += nZoomStep
    if nZoomLevel > nMaxZoom
        nZoomLevel = nMaxZoom
        updateSystemStatus("تم الوصول للحد الأقصى للتكبير (4x)")
    ok

    updateZoomDisplay()

    if len(aMorgenSymbols) > 0
        redrawWithZoom()
    ok
return

// Zoom out function
Func zoomOut()
    nZoomLevel -= nZoomStep
    if nZoomLevel < nMinZoom
        nZoomLevel = nMinZoom
    ok

    updateZoomDisplay()

    if len(aMorgenSymbols) > 0
        redrawWithZoom()
    ok
return

// Reset zoom to default
Func resetZoom()
    nZoomLevel = 1.0
    bDoubleClickZoom = false
    nPanOffsetX = 0
    nPanOffsetY = 0
    updateZoomDisplay()

    if len(aMorgenSymbols) > 0
        redrawWithZoom()
    ok

    updateSystemStatus("تم إعادة تعيين التكبير والعرض")
return

// Helper function to get precise mouse coordinates relative to canvas
Func getCanvasMouseCoords(nMouseX, nMouseY)
    // Canvas is at position (30, 80) with size (800, 550)
    // Canvas center is at (400, 275) relative to canvas
    nCanvasX = nMouseX - 30  // Relative to canvas left edge
    nCanvasY = nMouseY - 80  // Relative to canvas top edge

    // Convert to center-based coordinates
    nCenterX = nCanvasX - 400  // Relative to canvas center
    nCenterY = nCanvasY - 275  // Relative to canvas center

    return [nCenterX, nCenterY]
return
