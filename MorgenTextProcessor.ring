### Morgen Text Processing Simulation
### Interactive visualization of Arabic text processing in Morgen Space
### Author: Morgen Project Team
### Date: 2024-12-30

load "stdlibcore.ring"
load "lightguilib.ring"
load "morgen.ring"

//================================================

decimals(3)
PI = 3.14159265

xPos = 100
yPos = 25
xWidth = 1400
yHeight = 900

// Global variables
MonaLisa = null
daVinci = null
Canvas = null
myApp = null
myFilter = null
bProcessing = false
nProcessingStep = 0

// Text processing variables
cInputText = ""
aWords = []
oMorgenSpace = null
aMorgenSymbols = []
aSemanticConnections = []

// Zoom control variables
nZoomLevel = 1.0
nMinZoom = 0.3
nMaxZoom = 3.0
nZoomStep = 0.1

###-------------------------------
### Define Morgen Colours

colorMorgenBlue   = new qcolor() { setrgb(000,100,200,255) }
colorMorgenGold   = new qcolor() { setrgb(255,215,000,255) }
colorMorgenGreen  = new qcolor() { setrgb(000,150,100,255) }
colorMorgenRed    = new qcolor() { setrgb(200,000,050,255) }
colorMorgenPurple = new qcolor() { setrgb(128,000,128,255) }
colorMorgenWhite  = new qcolor() { setrgb(255,255,255,128) }
colorMorgenBlack  = new qcolor() { setrgb(000,000,000,255) }
colorMorgenCyan   = new qcolor() { setrgb(000,255,255,128) }

penMorgenBlue   = new qpen() { setcolor(colorMorgenBlue)   setwidth(2) }
penMorgenGold   = new qpen() { setcolor(colorMorgenGold)   setwidth(3) }
penMorgenGreen  = new qpen() { setcolor(colorMorgenGreen)  setwidth(2) }
penMorgenRed    = new qpen() { setcolor(colorMorgenRed)    setwidth(2) }
penMorgenPurple = new qpen() { setcolor(colorMorgenPurple) setwidth(1) }
penMorgenWhite  = new qpen() { setcolor(colorMorgenWhite)  setwidth(1) }
penMorgenCyan   = new qpen() { setcolor(colorMorgenCyan)   setwidth(2) }

//=========================================
// START the APP

myApp = new qApp
{
    win = new qWidget()
    {
        setWindowTitle("مرجان - معالج النصوص العربية في فضاء مورجن")
        setGeometry(xPos, yPos, xWidth, yHeight)

        // Main canvas for visualization
        Canvas = new qlabel(win)
        {
            MonaLisa = new qPixMap2(800, 600)

            daVinci = new qpainter()
            {
               begin(MonaLisa)
               translate(400, 300)  // Center coordinate system
            }

            setGeometry(50, 100, 800, 600)
            setPixMap(MonaLisa)
            setStyleSheet("border: 2px solid gray")

            // Enable event filter for keyboard and mouse
            myFilter = new qallevents(Canvas)
            myFilter.setKeyPressEvent("handleKeyPress()")
            myFilter.setMouseButtonPressEvent("handleMousePress()")

            installEventFilter(myFilter)
        }

        // Text input area
        oLabelInput = new qLabel(win) {
            setgeometry(900, 100, 400, 25)
            settext("أدخل النص العربي:")
            setStyleSheet("background-color: lightblue; font-size: 12px; font-weight: bold")
            setAlignment(2)  // Center
        }

        oTextInput = new qTextEdit(win) {
            setgeometry(900, 130, 400, 100)
            setStyleSheet("background-color: lightyellow; font-size: 14px")
            setPlainText("مرحبا بكم في عالم الذكاء الاصطناعي العربي")
        }

        // Control buttons
        oBtnProcess = new qPushButton(win) {
            setGeometry(900, 240, 120, 30)
            setText("معالجة النص")
            setStyleSheet("background-color: lightgreen; font-weight: bold")
            setClickEvent("processText()")
        }

        oBtnClear = new qPushButton(win) {
            setGeometry(1030, 240, 100, 30)
            setText("مسح")
            setStyleSheet("background-color: lightcoral")
            setClickEvent("clearVisualization()")
        }

        oBtnStep = new qPushButton(win) {
            setGeometry(1140, 240, 100, 30)
            setText("خطوة بخطوة")
            setStyleSheet("background-color: lightsteelblue")
            setClickEvent("stepByStep()")
        }

        // Zoom control buttons
        oBtnZoomIn = new qPushButton(win) {
            setGeometry(1250, 240, 50, 30)
            setText("تكبير +")
            setStyleSheet("background-color: lightgray")
            setClickEvent("zoomIn()")
        }

        oBtnZoomOut = new qPushButton(win) {
            setGeometry(1310, 240, 50, 30)
            setText("تصغير -")
            setStyleSheet("background-color: lightgray")
            setClickEvent("zoomOut()")
        }

        oBtnZoomReset = new qPushButton(win) {
            setGeometry(1250, 280, 110, 25)
            setText("إعادة تعيين التكبير")
            setStyleSheet("background-color: lightyellow")
            setClickEvent("resetZoom()")
        }

        // Analysis output area
        oLabelAnalysis = new qLabel(win) {
            setgeometry(900, 280, 400, 25)
            settext("تحليل مورجن:")
            setStyleSheet("background-color: lightcyan; font-size: 12px; font-weight: bold")
            setAlignment(2)  // Center
        }

        oTextAnalysis = new qTextEdit(win) {
            setgeometry(900, 310, 400, 200)
            setStyleSheet("background-color: lightcyan; font-size: 11px")
            setReadOnly(true)
        }

        // Processing steps display
        oLabelSteps = new qLabel(win) {
            setgeometry(900, 520, 400, 25)
            settext("خطوات المعالجة:")
            setStyleSheet("background-color: lightyellow; font-size: 12px; font-weight: bold")
            setAlignment(2)  // Center
        }

        oTextSteps = new qTextEdit(win) {
            setgeometry(900, 550, 400, 120)
            setStyleSheet("background-color: lightyellow; font-size: 10px")
            setReadOnly(true)
        }

        // Zoom level display
        oLabelZoom = new qLabel(win) {
            setgeometry(50, 720, 200, 30)
            settext("مستوى التكبير: 100%")
            setStyleSheet("background-color: lightgray; font-size: 12px; font-weight: bold; border: 1px solid gray; padding: 5px")
            setAlignment(2)  // Center
        }

        // Controls info
        oLabelControls = new qLabel(win) {
            setgeometry(860, 720, 200, 30)
            settext("التحكم: + تكبير | - تصغير | R إعادة تعيين")
            setStyleSheet("background-color: lightblue; font-size: 10px; border: 1px solid gray; padding: 5px")
            setAlignment(2)  // Center
        }

        // Legend
        oLabelLegend = new qLabel(win) {
            setgeometry(50, 750, 1200, 40)
            settext("🔵 الدوائر المتحدة المركز = المسافة من المركز 0 (الجوهر)  |  📏 الخطوط الشعاعية = الزوايا في الفضاء القطبي" + nl +
                    "🟡 الذهبي = رنين عالي (>1.5)  |  🔵 الأزرق = رنين متوسط (1.0-1.5)  |  🟢 الأخضر = رنين منخفض (<1.0)  |  🔴 الأحمر = روابط قوية  |  🟣 البنفسجي = روابط متوسطة  |  🔵 السماوي = تدفق المعنى من المركز 0")
            setStyleSheet("background-color: white; font-size: 8px; border: 1px solid gray; padding: 5px")
            setWordWrap(true)
            setAlignment(2)  // Center
        }

        // Title
        oTitle = new qLabel(win) {
            setgeometry(200, 20, 800, 40)
            settext("مرجان - محاكاة معالجة النصوص العربية في فضاء مورجن")
            setStyleSheet("background-color: gold; font-size: 16px; font-weight: bold; border: 2px solid darkgoldenrod")
            setAlignment(2)  // Center
        }

        // Initialize
        clearVisualization()

        show()
    }
    exec()
}

return

###==============================================================

// Clear visualization
Func clearVisualization()
    MonaLisa.fill(colorMorgenBlack)

    // Draw coordinate system
    daVinci.setpen(penMorgenWhite)
    daVinci.drawLine(-350, 0, 350, 0)  // X-axis
    daVinci.drawLine(0, -250, 0, 250)  // Y-axis

    // Draw grid
    for i = -300 to 300 step 50
        daVinci.drawLine(i, -250, i, 250)   // Vertical
        daVinci.drawLine(-350, i, 350, i)   // Horizontal
    next

    Canvas.setPixMap(MonaLisa)
    myApp.ProcessEvents()

    // Clear data
    aWords = []
    oMorgenSpace = new oMorgenSpace()
    aMorgenSymbols = []
    aSemanticConnections = []
    nProcessingStep = 0

    oTextAnalysis.setPlainText("")
    oTextSteps.setPlainText("")
return

// Process input text
Func processText()
    cInputText = oTextInput.toPlainText()

    if len(cInputText) = 0
        oTextAnalysis.setPlainText("خطأ: لا يوجد نص للمعالجة")
        return
    ok

    bProcessing = true
    nProcessingStep = 0

    oTextSteps.setPlainText("بدء معالجة النص في فضاء مورجن..."+nl)

    // Step 1: Text segmentation
    segmentText()

    // Step 2: Create semantic triangles
    createSemanticTriangles()

    // Step 3: Analyze meaning density
    analyzeMeaningDensity()

    // Step 4: Create semantic connections
    createSemanticConnections()

    // Step 5: Visualize results
    visualizeResults()

    bProcessing = false
return

// Step 1: Segment text into words
Func segmentText()
    nProcessingStep++

    cSteps = oTextSteps.toPlainText()
    cSteps += "الخطوة " + nProcessingStep + ": تقسيم النص إلى كلمات"  + nl
    oTextSteps.setPlainText(cSteps)

    // Simple word segmentation (split by spaces)
    aWords = split(cInputText, " ")

    // Remove empty strings
    aCleanWords = []
    for cWord in aWords
        cWord = trim(cWord)
        if len(cWord) > 0
            add(aCleanWords, cWord)
        ok
    next
    aWords = aCleanWords

    cSteps += "  تم العثور على " + len(aWords) + " كلمة" + nl

    cWordsList = ""
    for cWord in aWords
        cWordsList += cWord + " "
    next
    cSteps += "  الكلمات: " + cWordsList + nl + nl
    oTextSteps.setPlainText(cSteps)

    myApp.ProcessEvents()
    sleep(0.5)
return

// Step 2: Create Morgen symbols for words
Func createSemanticTriangles()
    nProcessingStep++

    cSteps = oTextSteps.toPlainText()
    cSteps += "الخطوة " + nProcessingStep + ": إنشاء رموز مورجن للكلمات"  + nl
    oTextSteps.setPlainText(cSteps)

    aMorgenSymbols = []

    for i = 1 to len(aWords)
        cWord = aWords[i]

        // Create Morgen symbol for each word
        nWordLength = len(cWord)

        // Create genome based on word characteristics
        aGenome = []
        for j = 1 to nWordLength
            // Use ASCII values to create genome pattern
            nCharCode = ascii(substr(cWord, j, 1))
            if nCharCode % 2 = 0
                add(aGenome, 2)
            else
                add(aGenome, 1)
            ok
        next

        // Calculate position in Morgen space
        nRadius = 0.3 + (nWordLength * 0.1)  // Closer to center for shorter words
        if nRadius > 0.9 { nRadius = 0.9 }

        nAngle = (i-1) * (360.0 / len(aWords))  // Distribute evenly around circle

        // Create Morgen symbol
        oSymbol = new oMorgenSymbol(cWord, "arabic_word", aGenome, nRadius, nAngle, null)

        // Add to Morgen space
        oMorgenSpace.addSymbol(oSymbol)
        add(aMorgenSymbols, oSymbol)

        cSteps += "  " + cWord + ": رمز مورجن (نصف قطر: " + nRadius + ", زاوية: " + nAngle + "°)"  + nl

        oTextSteps.setPlainText(cSteps)
        myApp.ProcessEvents()
        sleep(0.2)
    next

    cSteps += nl
    oTextSteps.setPlainText(cSteps)
return

// Step 3: Analyze meaning density using Morgen space
Func analyzeMeaningDensity()
    nProcessingStep++

    cSteps = oTextSteps.toPlainText()
    cSteps += "الخطوة " + nProcessingStep + ": تحليل كثافة المعنى في فضاء مورجن"  + nl
    oTextSteps.setPlainText(cSteps)

    cAnalysis = "تحليل مورجن للنص:" + nl + nl
    cAnalysis += "النص المدخل: " + cInputText  + nl
    cAnalysis += "عدد الكلمات: " + len(aWords)  + nl + nl

    nTotalComplexity = 0
    nTotalResonance = 0

    for i = 1 to len(aMorgenSymbols)
        oSymbol = aMorgenSymbols[i]
        nComplexity = oSymbol.getFractalComplexity()
        nResonance = oSymbol.nResonance

        nTotalComplexity += nComplexity
        nTotalResonance += nResonance

        cAnalysis += "كلمة: " + oSymbol.cId  + nl
        cAnalysis += "  التعقد الكسري: " + nComplexity  + nl
        cAnalysis += "  الرنين: " + nResonance  + nl
        cAnalysis += "  المسافة من المركز: " + oSymbol.nRadius  + nl
        cAnalysis += "  الزاوية: " + oSymbol.nAngle + "°"  + nl + nl

        cSteps += "  " + oSymbol.cId + ": تعقد = " + nComplexity + ", رنين = " + nResonance  + nl
        oTextSteps.setPlainText(cSteps)
        myApp.ProcessEvents()
        sleep(0.3)
    next

    if len(aMorgenSymbols) > 0
        nAvgComplexity = nTotalComplexity / len(aMorgenSymbols)
        nAvgResonance = nTotalResonance / len(aMorgenSymbols)

        cAnalysis += "المتوسطات:"+ nl
        cAnalysis += "  متوسط التعقد الكسري: " + nAvgComplexity  + nl
        cAnalysis += "  متوسط الرنين: " + nAvgResonance  + nl

        // Update global resonance
        oMorgenSpace.updateGlobalResonance()
        cAnalysis += "  الرنين العام للفضاء: " + oMorgenSpace.nGlobalResonance  + nl
    ok

    oTextAnalysis.setPlainText(cAnalysis)

    cSteps +=  nl
    oTextSteps.setPlainText(cSteps)
return

// Step 4: Create semantic connections using Morgen relations
Func createSemanticConnections()
    nProcessingStep++

    cSteps = oTextSteps.toPlainText()
    cSteps += "الخطوة " + nProcessingStep + ": إنشاء الروابط الدلالية في فضاء مورجن"  + nl
    oTextSteps.setPlainText(cSteps)

    aSemanticConnections = []

    // Create triangulations between symbols
    if len(aMorgenSymbols) >= 3
        // Create triangulation between first three symbols
        oMorgenSpace.createTriangulation(aMorgenSymbols[1], aMorgenSymbols[2], aMorgenSymbols[3], "semantic_triangle")
        cSteps += "  تم إنشاء مثلث دلالي بين: " + aMorgenSymbols[1].cId + ", " + aMorgenSymbols[2].cId + ", " + aMorgenSymbols[3].cId + nl
    ok

    // Create relations between adjacent symbols
    for i = 1 to len(aMorgenSymbols)-1
        oSym1 = aMorgenSymbols[i]
        oSym2 = aMorgenSymbols[i+1]

        // Calculate semantic strength based on genome similarity
        nSimilarity = calculateGenomeSimilarity(oSym1.aGenome, oSym2.aGenome)
        nStrength = 0.3 + (nSimilarity * 0.7)  // Base strength + similarity bonus

        // Create bidirectional relation
        oSym1.addRelation(oSym2, "semantic_adjacent", nStrength, null)
        oSym2.addRelation(oSym1, "semantic_adjacent", nStrength, null)

        aConnection = [i, i+1, nStrength]
        add(aSemanticConnections, aConnection)

        cSteps += "  " + oSym1.cId + " ↔ " + oSym2.cId + ": قوة = " + nStrength + nl
        oTextSteps.setPlainText(cSteps)
        myApp.ProcessEvents()
        sleep(0.1)
    next

    // Create connections between similar symbols
    for i = 1 to len(aMorgenSymbols)-1
        for j = i+2 to len(aMorgenSymbols)  // Skip adjacent symbols
            oSym1 = aMorgenSymbols[i]
            oSym2 = aMorgenSymbols[j]

            nSimilarity = calculateGenomeSimilarity(oSym1.aGenome, oSym2.aGenome)

            if nSimilarity > 0.5  // Only create strong connections
                nStrength = nSimilarity * 0.8
                oSym1.addRelation(oSym2, "semantic_similar", nStrength, null)

                aConnection = [i, j, nStrength]
                add(aSemanticConnections, aConnection)

                cSteps += "  " + oSym1.cId + " ≈ " + oSym2.cId + ": تشابه = " + nSimilarity + nl
                oTextSteps.setPlainText(cSteps)
                myApp.ProcessEvents()
                sleep(0.1)
            ok
        next
    next

    cSteps += nl
    oTextSteps.setPlainText(cSteps)
return

// Helper function to calculate genome similarity
Func calculateGenomeSimilarity(aGenome1, aGenome2)
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

// Step 5: Visualize results in Morgen space
Func visualizeResults()
    nProcessingStep++

    cSteps = oTextSteps.toPlainText()
    cSteps += "الخطوة " + nProcessingStep + ": عرض النتائج في فضاء مورجن" + nl
    oTextSteps.setPlainText(cSteps)

    // Clear only the canvas, keep the text analysis
    MonaLisa.fill(colorMorgenBlack)

    // Draw coordinate system
    daVinci.setpen(penMorgenWhite)
    daVinci.drawLine(-350, 0, 350, 0)  // X-axis
    daVinci.drawLine(0, -250, 0, 250)  // Y-axis

    // Draw concentric circles representing distance from Center 0
    for nR = 50 to 300 step 50
        daVinci.setpen(penMorgenWhite)
        daVinci.drawEllipse(-nR, -nR, nR*2, nR*2)
    next

    // Draw radial lines for angle reference
    for nAngle = 0 to 315 step 45
        nRadians = nAngle * PI / 180
        nX = 300 * cos(nRadians)
        nY = 300 * sin(nRadians)
        daVinci.drawLine(0, 0, nX, nY)
    next

    if len(aMorgenSymbols) = 0
        cSteps += "لا توجد رموز مورجن للعرض" + nl
        oTextSteps.setPlainText(cSteps)
        return
    ok

    // Draw Morgen symbols in their calculated positions
    for i = 1 to len(aMorgenSymbols)
        oSymbol = aMorgenSymbols[i]

        // Convert polar coordinates to Cartesian
        nRadians = oSymbol.nAngle * PI / 180
        nX = (oSymbol.nRadius * 250 * nZoomLevel) * cos(nRadians)
        nY = (oSymbol.nRadius * 250 * nZoomLevel) * sin(nRadians)

        // Draw symbol as a circle with size based on complexity
        nComplexity = oSymbol.getFractalComplexity()
        nSize = 10 + (nComplexity * 5) * nZoomLevel

        // Color based on resonance
        if oSymbol.nResonance > 1.5
            daVinci.setpen(penMorgenGold)  // High resonance = gold
        elseif oSymbol.nResonance > 1.0
            daVinci.setpen(penMorgenBlue)  // Medium resonance = blue
        else
            daVinci.setpen(penMorgenGreen) // Low resonance = green
        ok

        daVinci.drawEllipse(nX-nSize/2, nY-nSize/2, nSize, nSize)

        // Draw word label
        daVinci.setpen(penMorgenWhite)
        daVinci.drawText(nX-25*nZoomLevel, nY+25*nZoomLevel, oSymbol.cId)

        // Draw meaning flow from center (representing essence)
        daVinci.setpen(penMorgenCyan)
        daVinci.drawLine(0, 0, nX, nY)

        myApp.ProcessEvents()
        sleep(0.3)
    next

    // Draw semantic connections
    for aConnection in aSemanticConnections
        nIdx1 = aConnection[1]
        nIdx2 = aConnection[2]
        nStrength = aConnection[3]

        oSym1 = aMorgenSymbols[nIdx1]
        oSym2 = aMorgenSymbols[nIdx2]

        // Convert to Cartesian coordinates
        nRadians1 = oSym1.nAngle * PI / 180
        nX1 = (oSym1.nRadius * 250 * nZoomLevel) * cos(nRadians1)
        nY1 = (oSym1.nRadius * 250 * nZoomLevel) * sin(nRadians1)

        nRadians2 = oSym2.nAngle * PI / 180
        nX2 = (oSym2.nRadius * 250 * nZoomLevel) * cos(nRadians2)
        nY2 = (oSym2.nRadius * 250 * nZoomLevel) * sin(nRadians2)

        // Draw connection line with thickness based on strength
        if nStrength > 0.7
            daVinci.setpen(penMorgenRed)    // Strong connection = red
        elseif nStrength > 0.5
            daVinci.setpen(penMorgenPurple) // Medium connection = purple
        else
            daVinci.setpen(penMorgenCyan)   // Weak connection = cyan
        ok

        daVinci.drawLine(nX1, nY1, nX2, nY2)

        myApp.ProcessEvents()
        sleep(0.1)
    next

    // Run a dream cycle to show evolution
    if len(aMorgenSymbols) >= 2
        cSteps += "تشغيل دورة حلم مورجن..." + nl
        oTextSteps.setPlainText(cSteps)
        oMorgenSpace.dreamCycle()

        // Initiate a wave from the most essential symbol
        oEssential = oMorgenSpace.findMostEssentialSymbol()
        if oEssential != null
            oMorgenSpace.initiateWave(oEssential, "meaning_wave", 0.8)
            oMorgenSpace.propagateWaves()
        ok
    ok

    Canvas.setPixMap(MonaLisa)
    myApp.ProcessEvents()

    cSteps += "اكتملت المعالجة! النتائج معروضة في فضاء مورجن." + nl
    oTextSteps.setPlainText(cSteps)

    // Update analysis with final results
    cCurrentAnalysis = oTextAnalysis.toPlainText()
    if len(cCurrentAnalysis) > 0
        cCurrentAnalysis += nl + nl + "=== النتائج النهائية ===" + nl
        cCurrentAnalysis += "تم إنشاء " + len(aMorgenSymbols) + " رمز مورجن" + nl
        cCurrentAnalysis += "تم إنشاء " + len(aSemanticConnections) + " رابط دلالي" + nl
        cCurrentAnalysis += "عدد دورات الحلم: " + oMorgenSpace.nEpoch + nl
        cCurrentAnalysis += "الرنين العام النهائي: " + oMorgenSpace.nGlobalResonance + nl
        oTextAnalysis.setPlainText(cCurrentAnalysis)
    ok
return

// This function is no longer needed as we use Morgen symbols directly

// Step by step processing
Func stepByStep()
    cInputText = oTextInput.toPlainText()

    if len(cInputText) = 0
        oTextAnalysis.setPlainText("خطأ: لا يوجد نص للمعالجة")
        return
    ok

    bProcessing = true
    nProcessingStep = 0

    // Clear previous results
    aWords = []
    aMorgenTriangles = []
    aSemanticConnections = []

    oTextSteps.setPlainText("بدء المعالجة خطوة بخطوة..." + nl + nl)
    oTextAnalysis.setPlainText("انتظار...")

    // Step 1: Text segmentation
    oTextSteps.setPlainText(oTextSteps.toPlainText() + "الخطوة 1: تقسيم النص" + nl)
    myApp.ProcessEvents()
    sleep(1)
    segmentText()

    oTextSteps.setPlainText(oTextSteps.toPlainText() + "اضغط أي مفتاح للمتابعة..." + nl)
    myApp.ProcessEvents()
    sleep(2)

    // Step 2: Create semantic triangles
    oTextSteps.setPlainText(oTextSteps.toPlainText() + nl + "الخطوة 2: إنشاء المثلثات الدلالية" + nl)
    myApp.ProcessEvents()
    sleep(1)
    createSemanticTriangles()

    oTextSteps.setPlainText(oTextSteps.toPlainText() + "اضغط أي مفتاح للمتابعة..." + nl)
    myApp.ProcessEvents()
    sleep(2)

    // Step 3: Analyze meaning density
    oTextSteps.setPlainText(oTextSteps.toPlainText() + nl + "الخطوة 3: تحليل كثافة المعنى" + nl)
    myApp.ProcessEvents()
    sleep(1)
    analyzeMeaningDensity()

    oTextSteps.setPlainText(oTextSteps.toPlainText() + "اضغط أي مفتاح للمتابعة..." + nl)
    myApp.ProcessEvents()
    sleep(2)

    // Step 4: Create semantic connections
    oTextSteps.setPlainText(oTextSteps.toPlainText() + nl + "الخطوة 4: إنشاء الروابط الدلالية" + nl)
    myApp.ProcessEvents()
    sleep(1)
    createSemanticConnections()

    oTextSteps.setPlainText(oTextSteps.toPlainText() + "اضغط أي مفتاح للمتابعة..." + nl)
    myApp.ProcessEvents()
    sleep(2)

    // Step 5: Visualize results
    oTextSteps.setPlainText(oTextSteps.toPlainText() + nl + "الخطوة 5: عرض النتائج" + nl)
    myApp.ProcessEvents()
    sleep(1)
    visualizeResults()

    oTextSteps.setPlainText(oTextSteps.toPlainText() + nl + "اكتملت جميع الخطوات!" + nl)

    bProcessing = false
return

###==============================================================
// Handle mouse press events
Func handleMousePress()
    // Mouse click events can be handled here
    nX = myFilter.getX()
    nY = myFilter.getY()
    nButton = myFilter.getButton()

    // You can add click handling here if needed
return

// Note: Mouse wheel events are not directly supported in Ring
// Use keyboard shortcuts instead: + for zoom in, - for zoom out

// Handle keyboard events for zooming
Func handleKeyPress()
    // Get the pressed key
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
    ok
return

// Update zoom level display
Func updateZoomDisplay()
    cZoomText = "مستوى التكبير: " + (nZoomLevel * 100) + "%"

    // Update zoom label
    oLabelZoom.setText(cZoomText)

    // Update title to show zoom level
    win.setWindowTitle("مرجان - معالج النصوص العربية في فضاء مورجن - " + cZoomText)
return

// Redraw visualization with current zoom level
Func redrawWithZoom()
    // Clear only the canvas, keep the text analysis
    MonaLisa.fill(colorMorgenBlack)

    // Draw coordinate system with zoom
    daVinci.setpen(penMorgenWhite)
    daVinci.drawLine(-350, 0, 350, 0)  // X-axis
    daVinci.drawLine(0, -250, 0, 250)  // Y-axis

    // Draw concentric circles representing distance from Center 0
    for nR = 50 to 300 step 50
        nZoomedR = nR * nZoomLevel
        daVinci.setpen(penMorgenWhite)
        daVinci.drawEllipse(-nZoomedR, -nZoomedR, nZoomedR*2, nZoomedR*2)
    next

    // Draw radial lines for angle reference
    for nAngle = 0 to 315 step 45
        nRadians = nAngle * PI / 180
        nX = 300 * nZoomLevel * cos(nRadians)
        nY = 300 * nZoomLevel * sin(nRadians)
        daVinci.drawLine(0, 0, nX, nY)
    next

    if len(aMorgenSymbols) = 0
        Canvas.setPixMap(MonaLisa)
        return
    ok

    // Draw Morgen symbols with zoom
    for i = 1 to len(aMorgenSymbols)
        oSymbol = aMorgenSymbols[i]

        // Convert polar coordinates to Cartesian with zoom
        nRadians = oSymbol.nAngle * PI / 180
        nX = (oSymbol.nRadius * 250 * nZoomLevel) * cos(nRadians)
        nY = (oSymbol.nRadius * 250 * nZoomLevel) * sin(nRadians)

        // Draw symbol with zoom
        nComplexity = oSymbol.getFractalComplexity()
        nSize = (10 + (nComplexity * 5)) * nZoomLevel

        // Color based on resonance
        if oSymbol.nResonance > 1.5
            daVinci.setpen(penMorgenGold)
        elseif oSymbol.nResonance > 1.0
            daVinci.setpen(penMorgenBlue)
        else
            daVinci.setpen(penMorgenGreen)
        ok

        daVinci.drawEllipse(nX-nSize/2, nY-nSize/2, nSize, nSize)

        // Draw word label with zoom
        daVinci.setpen(penMorgenWhite)
        daVinci.drawText(nX-25*nZoomLevel, nY+25*nZoomLevel, oSymbol.cId)

        // Draw meaning flow from center with zoom
        daVinci.setpen(penMorgenCyan)
        daVinci.drawLine(0, 0, nX, nY)
    next

    // Draw semantic connections with zoom
    for aConnection in aSemanticConnections
        nIdx1 = aConnection[1]
        nIdx2 = aConnection[2]
        nStrength = aConnection[3]

        oSym1 = aMorgenSymbols[nIdx1]
        oSym2 = aMorgenSymbols[nIdx2]

        // Convert to Cartesian coordinates with zoom
        nRadians1 = oSym1.nAngle * PI / 180
        nX1 = (oSym1.nRadius * 250 * nZoomLevel) * cos(nRadians1)
        nY1 = (oSym1.nRadius * 250 * nZoomLevel) * sin(nRadians1)

        nRadians2 = oSym2.nAngle * PI / 180
        nX2 = (oSym2.nRadius * 250 * nZoomLevel) * cos(nRadians2)
        nY2 = (oSym2.nRadius * 250 * nZoomLevel) * sin(nRadians2)

        // Draw connection line with color based on strength
        if nStrength > 0.7
            daVinci.setpen(penMorgenRed)
        elseif nStrength > 0.5
            daVinci.setpen(penMorgenPurple)
        else
            daVinci.setpen(penMorgenCyan)
        ok

        daVinci.drawLine(nX1, nY1, nX2, nY2)
    next

    Canvas.setPixMap(MonaLisa)
    myApp.ProcessEvents()
return

// Zoom in function
Func zoomIn()
    nZoomLevel += nZoomStep
    if nZoomLevel > nMaxZoom
        nZoomLevel = nMaxZoom
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
    updateZoomDisplay()

    if len(aMorgenSymbols) > 0
        redrawWithZoom()
    ok
return