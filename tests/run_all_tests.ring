# ==============================================================================
# File: run_all_tests.ring
# Description: Comprehensive test suite runner for Morgen AI paradigm
# Author: Morgen AI Project
# ==============================================================================
load "stdLib.ring"

/*
Function: main
Description: Main function for the test suite runner
*/
if isMainSourceFile() {
    while true {
        nChoice = displayTestMenu()

        switch nChoice {
            case 1
                runTestSuite("Basic Functionality Tests", "test_basic_functionality.ring")
            case 2
                runTestSuite("Enhanced Dream Cycle Tests", "test_enhanced_dream_cycle.ring")
            case 3
                runTestSuite("Arabic Language Processing Tests", "test_arabic_language.ring")
            case 4
                runTestSuite("Geometric Structures Tests", "test_geometric_structures.ring")
            case 5
                runTestSuite("Advanced Features Tests (Phase 1)", "test_advanced_features.ring")
            case 6
                runTestSuite("Linguistic Engine Tests", "test_linguistic_engine.ring")
            case 7
                runTestSuite("Phase 2 Advanced Systems Tests", "test_phase2_systems.ring")
            case 8
                runAllTests()
            case 9
                runQuickDemo()
            case 0
                see nl + "Exiting test suite. Goodbye!" + nl
                return
            default
                see "Invalid choice. Please enter a number between 0 and 9." + nl
        }

        see nl + "Press Enter to continue..."
        give cDummy
    }
}

/*
Function: runTestSuite
Description: Runs a specific test suite and handles errors
*/
func runTestSuite cTestName, cTestFile {
    see nl + "========================================" + nl
    see "RUNNING: " + cTestName + nl
    see "========================================" + nl

    try {
        // load cTestFile
        cCode = read(cTestFile)
        eval(cCode)
        see "✓ " + cTestName + " completed successfully" + nl
    catch
        see "✗ " + cTestName + " failed with error: " + cCatchError + nl
    }

    see "========================================" + nl
}

/*
Function: displayTestMenu
Description: Displays the test menu and gets user choice
*/
func displayTestMenu {
    see nl + "==================================================" + nl
    see "MORGEN AI - COMPREHENSIVE TEST SUITE" + nl
    see "==================================================" + nl
    see "Available test suites:" + nl
    see "  1. Basic Functionality Tests" + nl
    see "  2. Enhanced Dream Cycle Tests" + nl
    see "  3. Arabic Language Processing Tests" + nl
    see "  4. Geometric Structures Tests" + nl
    see "  5. Advanced Features Tests (Phase 1)" + nl
    see "  6. Linguistic Engine Tests" + nl
    see "  7. Phase 2 Advanced Systems Tests" + nl
    see "  8. Run All Tests" + nl
    see "  9. Quick Demo" + nl
    see "  0. Exit" + nl
    see "==================================================" + nl
    see "Enter your choice (0-9): "

    give nChoice
    return 0 + nChoice  # Convert to number
}

/*
Function: runQuickDemo
Description: Runs a quick demonstration of Morgen AI capabilities
*/
func runQuickDemo {
    see nl + "=== MORGEN AI - QUICK DEMONSTRATION ===" + nl

    load "../morgen/space.ring"
    load "../morgen/language/char_definitions.ring"

    # Create a small demonstration space
    see "Creating demonstration space..." + nl
    oSpace = new MorgenSpace(3)

    # Add some Arabic characters
    aChars = createArabicCharacterSymbols()
    for i = 1 to min(5, len(aChars)) {
        oSpace.addSymbol(aChars[i])
    }

    # Create a simple root
    if len(aChars) >= 3 {
        oRoot = createTriconsontalRoot(aChars[1], aChars[2], aChars[3])
        if isObject(oRoot) {
            oSpace.addSymbol(oRoot)
            see "Created triconsonantal root: " + oRoot.cId + nl
        }
    }

    see "Initial space: " + len(oSpace.aSymbols) + " symbols" + nl

    # Run a few dream cycles
    see nl + "Running demonstration dream cycles..." + nl
    for i = 1 to 2 {
        see "Dream cycle " + i + "..." + nl
        oSpace.enhancedDreamCycle()
        oSpace.updateGlobalResonance()
    }

    # Show results
    see nl + "Demonstration results:" + nl
    see "  Final symbols: " + len(oSpace.aSymbols) + nl
    see "  Global resonance: " + oSpace.nGlobalResonance + nl
    see "  Epochs completed: " + oSpace.nEpoch + nl

    # Show some symbols
    see nl + "Sample symbols:" + nl
    nSampleCount = min(3, len(oSpace.aSymbols))
    for i = 1 to nSampleCount {
        oSymbol = oSpace.aSymbols[i]
        see "  " + oSymbol.cId + " (" + oSymbol.cType + ") - Energy: " +
            oSymbol.nEnergyLevel + ", Radius: " + oSymbol.nRadius + nl
    }

    see nl + "=== QUICK DEMONSTRATION COMPLETE ===" + nl
}

/*
Function: runAllTests
Description: Runs all available test suites
*/
func runAllTests {
    see nl + "=== RUNNING ALL TEST SUITES ===" + nl

    aTestSuites = [
        ["Basic Functionality Tests", "test_basic_functionality.ring"],
        ["Enhanced Dream Cycle Tests", "test_enhanced_dream_cycle.ring"],
        ["Arabic Language Processing Tests", "test_arabic_language.ring"],
        ["Geometric Structures Tests", "test_geometric_structures.ring"],
        ["Advanced Features Tests (Phase 1)", "test_advanced_features.ring"],
        ["Linguistic Engine Tests", "test_linguistic_engine.ring"],
        ["Phase 2 Advanced Systems Tests", "test_phase2_systems.ring"]
    ]

    nSuccessful = 0
    nFailed = 0

    for aTest in aTestSuites {
        cTestName = aTest[1]
        cTestFile = aTest[2]

        try {
            see nl + "Running " + cTestName + "..." + nl
            lcCode = read(cTestFile)
            eval(cCode)
            nSuccessful++
            see "✓ " + cTestName + " completed successfully" + nl
        catch
            nFailed++
            see "✗ " + cTestName + " failed: " + cCatchError + nl
        }
    }

    see nl + "=== ALL TESTS SUMMARY ===" + nl
    see "Successful: " + nSuccessful + nl
    see "Failed: " + nFailed + nl
    see "Total: " + (nSuccessful + nFailed) + nl

    if nFailed = 0 {
        see "🎉 All tests passed!" + nl
    else
        see "⚠️  Some tests failed. Please check the output above." + nl
    }
}
