# ==============================================================================
# File: test_linguistic_engine.ring
# Description: Tests for the linguistic engine in Morgen AI
# Author: Morgen AI Project
# ==============================================================================

load "../morgen/language/linguistic_engine.ring"




    see "==================================================" + nl
    see "MORGEN AI - LINGUISTIC ENGINE TESTS" + nl
    see "==================================================" + nl
    
    # Create linguistic test environment
    aTestEnv = createLinguisticTestSpace()
    oSpace = aTestEnv[1]
    oEngine = aTestEnv[2]
    
    # Test basic text processing
    testBasicTextProcessing(oEngine)
    
    # Test text generation
    testTextGeneration(oEngine)
    
    # Test meaning analysis
    testMeaningAnalysis(oEngine)
    
    # Test linguistic evolution
    testLinguisticEvolution(oEngine)
    
    # Test fractal text generation
    testFractalTextGeneration(oEngine)
    
    # Test condensed symbol generation
    testCondensedSymbolGeneration(oEngine)
    
    see nl + "=== Final Linguistic Engine State ===" + nl
    see "Total symbols in space: " + len(oSpace.aSymbols) + nl
    see "Word symbols created: " + len(oEngine.aWordSymbols) + nl
    see "Root symbols created: " + len(oEngine.aRootSymbols) + nl
    see "Character symbols: " + len(oEngine.aCharacterSymbols) + nl
    see "Global resonance: " + oSpace.nGlobalResonance + nl
    see "Epochs completed: " + oSpace.nEpoch + nl
    
    see nl + "==================================================" + nl
    see "LINGUISTIC ENGINE TESTS COMPLETE" + nl
    see "==================================================" + nl

/*
Function: createLinguisticTestSpace
Description: Creates a test space for linguistic engine testing
*/
func createLinguisticTestSpace {
    see "Creating linguistic test space..." + nl
    
    oSpace = new MorgenSpace(5)
    oEngine = new LinguisticEngine(oSpace)
    
    see "Linguistic test space created with " + len(oSpace.aSymbols) + " symbols" + nl
    
    return [oSpace, oEngine]
}

/*
Function: testBasicTextProcessing
Description: Tests basic text to symbol conversion
*/
func testBasicTextProcessing oEngine {
    see nl + "=== Testing Basic Text Processing ===" + nl
    
    # Test simple Arabic words
    aTestTexts = [
        "\u0643\u062a\u0627\u0628",      # كتاب
        "\u0628\u064a\u062a",       # بيت  
        "\u0645\u0627\u0621",       # ماء
        "\u0643\u062a\u0627\u0628 \u0628\u064a\u062a",  # كتاب بيت
        "\u0645\u0627\u0621 \u0643\u062a\u0627\u0628 \u0628\u064a\u062a"  # ماء كتاب بيت
    ]
    
    for cText in aTestTexts {
        see nl + "Processing text: '" + cText + "'" + nl
        
        aWordSymbols = oEngine.textToWordSymbols(cText, "arabic")
        
        see "  Generated " + len(aWordSymbols) + " word symbols:" + nl
        for oWordSymbol in aWordSymbols {
            if isObject(oWordSymbol) {
                see "    " + oWordSymbol.cId + " - Data: " + oWordSymbol.oData + nl
                see "      Position: (r=" + oWordSymbol.nRadius + ", θ=" + oWordSymbol.nAngle + "°)" + nl
                see "      Energy: " + oWordSymbol.nEnergyLevel + nl
                see "      Sub-symbols: " + len(oWordSymbol.aSubSymbols) + nl
            }
        }
    }
}

/*
Function: testTextGeneration
Description: Tests text generation from symbols
*/
func testTextGeneration oEngine {
    see nl + "=== Testing Text Generation ===" + nl
    
    # First create some word symbols
    aWordSymbols = oEngine.textToWordSymbols("كتاب ماء بيت", "arabic")
    
    if len(aWordSymbols) > 0 {
        see "Testing generation from word symbols:" + nl
        
        for oWordSymbol in aWordSymbols {
            if isObject(oWordSymbol) {
                cGeneratedText = oEngine.generateTextFromSymbol(oWordSymbol, "arabic")
                see "  " + oWordSymbol.cId + " → '" + cGeneratedText + "'" + nl
            }
        }
    }
    
    # Test generation from root symbols
    if len(oEngine.aRootSymbols) > 0 {
        see nl + "Testing generation from root symbols:" + nl
        
        for i = 1 to min(3, len(oEngine.aRootSymbols)) {
            oRootSymbol = oEngine.aRootSymbols[i]
            if isObject(oRootSymbol) {
                cGeneratedText = oEngine.generateTextFromSymbol(oRootSymbol, "arabic")
                see "  " + oRootSymbol.cId + " → '" + cGeneratedText + "'" + nl
            }
        }
    }
    
    # Test generation from complex symbols in space
    see nl + "Testing generation from space symbols:" + nl
    
    nTestCount = min(5, len(oEngine.oMorgenSpace.aSymbols))
    for i = 1 to nTestCount {
        oSymbol = oEngine.oMorgenSpace.aSymbols[i]
        if isObject(oSymbol) {
            cGeneratedText = oEngine.generateTextFromSymbol(oSymbol, "arabic")
            see "  " + oSymbol.cId + " (" + oSymbol.cType + ") → '" + cGeneratedText + "'" + nl
        }
    }
}

/*
Function: testMeaningAnalysis
Description: Tests meaning analysis of text
*/
func testMeaningAnalysis oEngine {
    see nl + "=== Testing Meaning Analysis ===" + nl
    
    aTestTexts = [
        "\u0643\u062a\u0627\u0628",
        "\u0643\u062a\u0627\u0628 \u0645\u0627\u0621",
        "\u0628\u064a\u062a \u0643\u062a\u0627\u0628 \u0645\u0627\u0621"
    ]
    
    for cText in aTestTexts {
        see nl + "Analyzing meaning of: '" + cText + "'" + nl
        
        oMeaningSymbol = oEngine.analyzeTextMeaning(cText)
        
        if isObject(oMeaningSymbol) {
            see "  Created meaning symbol: " + oMeaningSymbol.cId + nl
            see "    Type: " + oMeaningSymbol.cType + nl
            see "    Position: (r=" + oMeaningSymbol.nRadius + ", θ=" + oMeaningSymbol.nAngle + "°)" + nl
            see "    Energy: " + oMeaningSymbol.nEnergyLevel + nl
            see "    Genome length: " + len(oMeaningSymbol.aGenome) + nl
            see "    Sub-symbols: " + len(oMeaningSymbol.aSubSymbols) + nl
            
            # Test reverse generation
            cRegenerated = oEngine.generateTextFromSymbol(oMeaningSymbol, "arabic")
            see "    Regenerated text: '" + cRegenerated + "'" + nl
        else 
            see "  Failed to create meaning symbol" + nl
        }
    }
}

/*
Function: testLinguisticEvolution
Description: Tests how linguistic symbols evolve through dream cycles
*/
func testLinguisticEvolution oEngine {
    see nl + "=== Testing Linguistic Evolution ===" + nl
    
    # Create initial text meanings
    aInitialTexts = [
        "\u0643\u062a\u0627\u0628",
        "\u0645\u0627\u0621", 
        "\u0628\u064a\u062a",
        "\u0643\u062a\u0627\u0628 \u0645\u0627\u0621",
        "\u0628\u064a\u062a \u0643\u062a\u0627\u0628"
    ]
    
    aMeaningSymbols = []
    for cText in aInitialTexts {
        oMeaning = oEngine.analyzeTextMeaning(cText)
        if isObject(oMeaning) {
            add(aMeaningSymbols, oMeaning)
        }
    }
    
    see "Created " + len(aMeaningSymbols) + " initial meaning symbols" + nl
    
    # Show initial state
    see nl + "Initial linguistic space state:" + nl
    see "  Total symbols: " + len(oEngine.oMorgenSpace.aSymbols) + nl
    see "  Word symbols: " + len(oEngine.aWordSymbols) + nl
    see "  Root symbols: " + len(oEngine.aRootSymbols) + nl
    see "  Character symbols: " + len(oEngine.aCharacterSymbols) + nl
    
    # Run dream cycles and observe evolution
    for nCycle = 1 to 3 {
        see nl + "--- Linguistic Evolution Cycle #" + nCycle + " ---" + nl
        
        nSymbolsBefore = len(oEngine.oMorgenSpace.aSymbols)
        
        # Run enhanced dream cycle
        oEngine.oMorgenSpace.enhancedDreamCycle()
        oEngine.oMorgenSpace.updateGlobalResonance()
        
        nSymbolsAfter = len(oEngine.oMorgenSpace.aSymbols)
        
        see "Symbols: " + nSymbolsBefore + " → " + nSymbolsAfter + nl
        see "Global resonance: " + oEngine.oMorgenSpace.nGlobalResonance + nl
        
        # Count different symbol types
        nArabicLetters = 0
        nArabicWords = 0
        nRoots = 0
        nMeanings = 0
        nOffspring = 0
        
        for oSymbol in oEngine.oMorgenSpace.aSymbols {
            if isObject(oSymbol) {
                if oSymbol.cType = "arabic_letter" {
                    nArabicLetters++
                elseif oSymbol.cType = "arabic_word" 
                    nArabicWords++
                elseif oSymbol.cType = "triconsonantal_root" 
                    nRoots++
                elseif oSymbol.cType = "text_meaning" 
                    nMeanings++
                elseif oSymbol.cType = "offspring" or oSymbol.cType = "seed_offspring" 
                    nOffspring++
                }
            }
        }
        
        see "Symbol distribution:" + nl
        see "  Arabic letters: " + nArabicLetters + nl
        see "  Arabic words: " + nArabicWords + nl
        see "  Roots: " + nRoots + nl
        see "  Meanings: " + nMeanings + nl
        see "  Offspring: " + nOffspring + nl
    }
}

/*
Function: testFractalTextGeneration
Description: Tests fractal text generation from deep symbols
*/
func testFractalTextGeneration oEngine {
    see nl + "=== Testing Fractal Text Generation ===" + nl
    
    # Create some deep meaning symbols first
    oEngine.analyzeTextMeaning("\u0643\u062a\u0627\u0628 \u0645\u0627\u0621 \u0628\u064a\u062a")
    
    # Run a dream cycle to create deeper symbols
    oEngine.oMorgenSpace.enhancedDreamCycle()
    
    # Find deep symbols (close to center)
    aDeepSymbols = []
    for oSymbol in oEngine.oMorgenSpace.aSymbols {
        if isObject(oSymbol) and oSymbol.nRadius < 0.5 {
            add(aDeepSymbols, oSymbol)
        }
    }
    
    see "Found " + len(aDeepSymbols) + " deep symbols for fractal generation" + nl
    
    for i = 1 to min(3, len(aDeepSymbols)) {
        oDeepSymbol = aDeepSymbols[i]
        see nl + "Fractal generation from: " + oDeepSymbol.cId + nl
        see "  Position: (r=" + oDeepSymbol.nRadius + ", θ=" + oDeepSymbol.nAngle + "°)" + nl
        see "  Type: " + oDeepSymbol.cType + nl
        
        cFractalText = oEngine.generateTextFromSymbol(oDeepSymbol, "arabic")
        see "  Generated: '" + cFractalText + "'" + nl
    }
}

/*
Function: testCondensedSymbolGeneration
Description: Tests text generation from condensed symbols
*/
func testCondensedSymbolGeneration oEngine {
    see nl + "=== Testing Condensed Symbol Generation ===" + nl
    
    # Create multiple similar meanings to trigger condensation
    aSimilarTexts = [
        "\u0643\u062a\u0627\u0628",
        "\u0643\u062a\u0627\u0628 \u0645\u0627\u0621", 
        "\u0643\u062a\u0627\u0628 \u0628\u064a\u062a",
        "\u0645\u0627\u0621 \u0643\u062a\u0627\u0628"
    ]
    
    for cText in aSimilarTexts {
        oEngine.analyzeTextMeaning(cText)
    }
    
    # Run advanced dream cycle to trigger condensation
    oEngine.oMorgenSpace.advancedDreamCycle()
    
    # Find condensed symbols
    aCondensedSymbols = []
    for oSymbol in oEngine.oMorgenSpace.aSymbols {
        if isObject(oSymbol) and oSymbol.nCondensationValue > 0 {
            add(aCondensedSymbols, oSymbol)
        }
    }
    
    see "Found " + len(aCondensedSymbols) + " condensed symbols" + nl
    
    for oCondensedSymbol in aCondensedSymbols {
        see nl + "Condensed symbol: " + oCondensedSymbol.cId + nl
        see "  Condensation value: " + oCondensedSymbol.nCondensationValue + nl
        see "  Sub-symbols: " + len(oCondensedSymbol.aSubSymbols) + nl
        
        cCondensedText = oEngine.generateTextFromSymbol(oCondensedSymbol, "arabic")
        see "  Generated: '" + cCondensedText + "'" + nl
    }
}
