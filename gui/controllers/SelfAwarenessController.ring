### Self-Awareness Controller for Morgen Advanced Features
### Author: Morgen Project Team
### Date: 2024-12-30

// Note: SelfAwarenessView is loaded in the main file

//================================================
// 🧠 1. Self-Awareness Engine Classes
//================================================

class SelfAwarenessController from WindowsControllerParent
    oView = new SelfAwarenessView
    oEngine = null

    func setEngine(pEngine)
        oEngine = pEngine
        oView.updateDisplay()

    func analyzeInternalPatterns()
        if oEngine != null
            aPatterns = oEngine.discoverInternalPatterns()
            oView.displayPatterns(aPatterns)
        ok

    func performSelfReflection()
        if oEngine != null
            cReflection = oEngine.performSelfReflection()
            oView.displayReflection(cReflection)
        ok
