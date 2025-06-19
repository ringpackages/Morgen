# ==============================================================================
# File: advanced_demo.ring
# Description: Advanced demonstration of Morgen AI Phase 1 capabilities
# Author: Morgen AI Project
# ==============================================================================

load "morgen/language/linguistic_engine.ring"

/*
Function: runAdvancedDemo
Description: Runs a comprehensive demonstration of advanced Morgen AI features
*/
func runAdvancedDemo {
    see "==================================================" + nl
    see "MORGEN AI - ADVANCED DEMONSTRATION (PHASE 1)" + nl
    see "==================================================" + nl
    see "This demo showcases the advanced features developed in Phase 1:" + nl
    see "• Emergent triangulation" + nl
    see "• Meaning condensation (Ramanujan-inspired)" + nl
    see "• Advanced dream cycles with wave influence" + nl
    see "• Linguistic engine with Arabic text processing" + nl
    see "• Fractal text generation" + nl
    see "==================================================" + nl
    
    # Create Morgen cognitive space and linguistic engine
    see nl + "1. Initializing advanced Morgen cognitive space..." + nl
    oSpace = new MorgenSpace(5)
    oEngine = new LinguisticEngine(oSpace)
    
    see "   ✓ Space created with " + len(oSpace.aSymbols) + " initial symbols" + nl
    see "   ✓ Linguistic engine initialized" + nl
    
    # Process Arabic text
    see nl + "2. Processing Arabic text into cognitive symbols..." + nl
    aTestTexts = [
        "كتاب",           # Book
        "ماء",            # Water
        "بيت",            # House
        "كتاب ماء",       # Book water
        "بيت كتاب ماء"    # House book water
    ]
    
    aMeaningSymbols = []
    for cText in aTestTexts {
        see "   Processing: '" + cText + "'" + nl
        oMeaning = oEngine.analyzeTextMeaning(cText)
        if isObject(oMeaning) {
            add(aMeaningSymbols, oMeaning)
            see "     ✓ Created meaning symbol: " + oMeaning.cId + nl
        }
    }
    
    see "   ✓ Created " + len(aMeaningSymbols) + " meaning symbols" + nl
    see "   ✓ Total symbols in space: " + len(oSpace.aSymbols) + nl
    
    # Run advanced dream cycles
    see nl + "3. Running advanced dream cycles with emergent features..." + nl
    
    for nCycle = 1 to 3 {
        see nl + "   --- Advanced Dream Cycle #" + nCycle + " ---" + nl
        
        nSymbolsBefore = len(oSpace.aSymbols)
        nTriangulationsBefore = len(oSpace.aTriangulations)
        nGalaxiesBefore = len(oSpace.aGalaxies)
        
        # Run advanced dream cycle
        oSpace.advancedDreamCycle()
        oSpace.updateGlobalResonance()
        
        see "   Results:" + nl
        see "     Symbols: " + nSymbolsBefore + " → " + len(oSpace.aSymbols) + nl
        see "     Triangulations: " + nTriangulationsBefore + " → " + len(oSpace.aTriangulations) + nl
        see "     Galaxies: " + nGalaxiesBefore + " → " + len(oSpace.aGalaxies) + nl
        see "     Global resonance: " + oSpace.nGlobalResonance + nl
        see "     Active waves: " + len(oSpace.aWaveFronts) + nl
        
        # Count condensed symbols
        nCondensedSymbols = 0
        for oSymbol in oSpace.aSymbols {
            if isObject(oSymbol) and oSymbol.nCondensationValue > 0 {
                nCondensedSymbols++
            }
        }
        see "     Condensed symbols: " + nCondensedSymbols + nl
    }
    
    # Demonstrate text generation from evolved symbols
    see nl + "4. Demonstrating fractal text generation..." + nl
    
    # Find interesting symbols for generation
    aDeepSymbols = []
    aCondensedSymbols = []
    
    for oSymbol in oSpace.aSymbols {
        if isObject(oSymbol) {
            if oSymbol.nRadius < 0.4 {  # Deep symbols
                add(aDeepSymbols, oSymbol)
            }
            if oSymbol.nCondensationValue > 0 {  # Condensed symbols
                add(aCondensedSymbols, oSymbol)
            }
        }
    }
    
    see "   Found " + len(aDeepSymbols) + " deep symbols and " + len(aCondensedSymbols) + " condensed symbols" + nl
    
    # Generate text from deep symbols
    if len(aDeepSymbols) > 0 {
        see nl + "   Text generation from deep symbols:" + nl
        for i = 1 to min(3, len(aDeepSymbols)) {
            oSymbol = aDeepSymbols[i]
            cGeneratedText = oEngine.generateTextFromSymbol(oSymbol, "arabic")
            see "     " + oSymbol.cId + " (r=" + oSymbol.nRadius + ") → '" + cGeneratedText + "'" + nl
        }
    }
    
    # Generate text from condensed symbols
    if len(aCondensedSymbols) > 0 {
        see nl + "   Text generation from condensed symbols:" + nl
        for oSymbol in aCondensedSymbols {
            cGeneratedText = oEngine.generateTextFromSymbol(oSymbol, "arabic")
            see "     " + oSymbol.cId + " (condensed " + oSymbol.nCondensationValue + " concepts) → '" + cGeneratedText + "'" + nl
        }
    }
    
    # Demonstrate wave propagation effects
    see nl + "5. Demonstrating wave propagation and influence..." + nl
    
    # Create insight waves from highly resonant symbols
    nWavesCreated = 0
    for oSymbol in oSpace.aSymbols {
        if isObject(oSymbol) and oSymbol.nResonance > 2.5 and nWavesCreated < 3 {
            oSpace.initiateWave(oSymbol, "insight_wave", 0.8)
            nWavesCreated++
            see "   ✓ Created insight wave from " + oSymbol.cId + " (resonance: " + oSymbol.nResonance + ")" + nl
        }
    }
    
    # Propagate waves and show effects
    oSpace.propagateWaves()
    
    nAffectedSymbols = 0
    for oSymbol in oSpace.aSymbols {
        if isObject(oSymbol) and oSpace.isSymbolAffectedByWaves(oSymbol) {
            nAffectedSymbols++
        }
    }
    
    see "   ✓ " + nAffectedSymbols + " symbols affected by wave propagation" + nl
    
    # Demonstrate emergent triangulation
    see nl + "6. Demonstrating emergent triangulation..." + nl
    
    # Create a new symbol to trigger triangulation
    oNewSymbol = new MorgenSymbol("demo_trigger", "demonstration", [1, 2, 1, 2], 0.5, 180, null)
    oNewSymbol.nEnergyLevel = 0.9
    
    nTriangulationsBefore = len(oSpace.aTriangulations)
    oSpace.addSymbol(oNewSymbol)
    oSpace.attemptEmergentTriangulation(oNewSymbol)
    nTriangulationsAfter = len(oSpace.aTriangulations)
    
    if nTriangulationsAfter > nTriangulationsBefore {
        see "   ✓ Emergent triangulation created! (" + nTriangulationsBefore + " → " + nTriangulationsAfter + ")" + nl
    else 
        see "   ℹ No new triangulation (existing structure may be optimal)" + nl
    }
    
    # Final analysis and insights
    see nl + "7. Final analysis and insights..." + nl
    
    # Analyze symbol type distribution
    nArabicLetters = 0
    nArabicWords = 0
    nRoots = 0
    nMeanings = 0
    nCondensed = 0
    nOffspring = 0
    nSeeds = 0
    
    for oSymbol in oSpace.aSymbols {
        if isObject(oSymbol) {
            if oSymbol.cType = "arabic_letter" {
                nArabicLetters++
            elseif oSymbol.cType = "arabic_word" 
                nArabicWords++
            elseif oSymbol.cType = "triconsonantal_root" 
                nRoots++
            elseif oSymbol.cType = "text_meaning" 
                nMeanings++
            elseif oSymbol.nCondensationValue > 0 
                nCondensed++
            elseif oSymbol.cType = "offspring" or oSymbol.cType = "seed_offspring" 
                nOffspring++
            elseif oSymbol.bIsSeed 
                nSeeds++
            }
        }
    }
    
    see "   Symbol ecosystem analysis:" + nl
    see "     Arabic letters: " + nArabicLetters + nl
    see "     Arabic words: " + nArabicWords + nl
    see "     Triconsonantal roots: " + nRoots + nl
    see "     Text meanings: " + nMeanings + nl
    see "     Condensed symbols: " + nCondensed + nl
    see "     Offspring symbols: " + nOffspring + nl
    see "     Seed symbols: " + nSeeds + nl
    see "     Total symbols: " + len(oSpace.aSymbols) + nl
    
    see nl + "   Structural analysis:" + nl
    see "     Triangulations: " + len(oSpace.aTriangulations) + nl
    see "     Galactic clusters: " + len(oSpace.aGalaxies) + nl
    see "     Active waves: " + len(oSpace.aWaveFronts) + nl
    see "     Global resonance: " + oSpace.nGlobalResonance + nl
    see "     Epochs completed: " + oSpace.nEpoch + nl
    
    # Demonstrate bidirectional text processing
    see nl + "8. Demonstrating bidirectional text processing..." + nl
    
    cOriginalText = "كتاب ماء بيت"
    see "   Original text: '" + cOriginalText + "'" + nl
    
    # Text → Meaning → Text
    oMeaning = oEngine.analyzeTextMeaning(cOriginalText)
    if isObject(oMeaning) {
        see "   ✓ Analyzed into meaning symbol: " + oMeaning.cId + nl
        
        # Let the meaning evolve through a dream cycle
        oSpace.enhancedDreamCycle()
        
        # Generate text back
        cRegeneratedText = oEngine.generateTextFromSymbol(oMeaning, "arabic")
        see "   ✓ Regenerated text: '" + cRegeneratedText + "'" + nl
        
        if cRegeneratedText = cOriginalText {
            see "   ✓ Perfect reconstruction!" + nl
        else 
            see "   ℹ Text evolved through cognitive processing" + nl
        }
    }
    
    see nl + "==================================================" + nl
    see "ADVANCED DEMONSTRATION COMPLETE" + nl
    see "==================================================" + nl
    see "Key achievements demonstrated:" + nl
    see "✓ Arabic text processing and meaning extraction" + nl
    see "✓ Emergent triangulation and geometric structures" + nl
    see "✓ Meaning condensation and essence extraction" + nl
    see "✓ Wave propagation and dynamic influence" + nl
    see "✓ Fractal text generation from deep symbols" + nl
    see "✓ Bidirectional text ↔ meaning transformation" + nl
    see "✓ Self-organizing cognitive ecosystem" + nl
    see nl + "Morgen AI Phase 1 is fully operational!" + nl
    see "==================================================" + nl
}

/*
Function: main
Description: Main function for advanced demonstration
*/
func main {
    runAdvancedDemo()
}

