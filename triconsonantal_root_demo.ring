# ==============================================================================
# File: triconsonantal_root_demo.ring
# Description: Demonstration of Arabic triconsonantal roots in Morgen AI
# Author: Morgen AI Project
# ==============================================================================

load "morgen/space_optimized.ring"
load "morgen/linguistic_engine_optimized.ring"

/*
Function: createTriconsontalRoot
Description: Creates a triconsonantal root from three letters
*/
func createTriconsontalRoot oLetter1, oLetter2, oLetter3 {
    if not isObject(oLetter1) or not isObject(oLetter2) or not isObject(oLetter3) {
        return null
    }
    
    # Create a new root symbol
    oRoot = new MorgenSymbol(
        "root_" + random(1000),
        "triconsonantal_root",
        [oLetter1.aGenome[1], oLetter2.aGenome[1], oLetter3.aGenome[1]],
        0.4,  # Roots are more essential (closer to center)
        (oLetter1.nAngle + oLetter2.nAngle + oLetter3.nAngle) / 3,
        [oLetter1, oLetter2, oLetter3]
    )
    
    # Set properties
    oRoot.bIsSeed = false
    oRoot.nEnergyLevel = (oLetter1.nEnergyLevel + oLetter2.nEnergyLevel + oLetter3.nEnergyLevel) / 2
    
    return oRoot
}

/*
Function: runTriconsonantalRootDemo
Description: Demonstrates Arabic triconsonantal roots
*/
func runTriconsonantalRootDemo {
    see "==================================================" + nl
    see "MORGEN AI - ARABIC TRICONSONANTAL ROOTS DEMO" + nl
    see "==================================================" + nl
    see "Optimized for systems with limited resources (i3, 6GB RAM)" + nl
    see "==================================================" + nl
    
    # Create a Morgen cognitive space
    see "1. Creating Morgen cognitive space..." + nl
    oSpace = new MorgenSpace(2)
    
    # Create Arabic letters
    see "2. Creating Arabic letters..." + nl
    
    # ك (Kaf)
    oKaf = new MorgenSymbol("kaf", "arabic_letter", [1, 2, 1, 2], 0.7, 120, "ك")
    oKaf.bIsSeed = true
    oKaf.nEnergyLevel = 0.85
    
    # ت (Ta)
    oTa = new MorgenSymbol("ta", "arabic_letter", [2, 1, 1, 2], 0.82, 30, "ت")
    oTa.bIsSeed = true
    oTa.nEnergyLevel = 0.9
    
    # ب (Ba)
    oBa = new MorgenSymbol("ba", "arabic_letter", [2, 1, 2, 1], 0.85, 15, "ب")
    oBa.bIsSeed = true
    oBa.nEnergyLevel = 0.95
    
    # Add letters to space
    oSpace.addSymbol(oKaf)
    oSpace.addSymbol(oTa)
    oSpace.addSymbol(oBa)
    
    see "   Added letters: ك (Kaf), ت (Ta), ب (Ba)" + nl
    
    # Create linguistic engine
    see "3. Creating linguistic engine..." + nl
    oEngine = new LinguisticEngine(oSpace)
    
    # Create root ك-ت-ب (K-T-B, related to writing)
    see "4. Creating triconsonantal root ك-ت-ب (K-T-B)..." + nl
    oRoot = createTriconsontalRoot(oKaf, oTa, oBa)
    
    if isObject(oRoot) {
        see "   Root created successfully" + nl
        oSpace.addSymbol(oRoot)
        
        # Display root properties
        see "   Root properties:" + nl
        see "   - ID: " + oRoot.cId + nl
        see "   - Type: " + oRoot.cType + nl
        see "   - Energy: " + oRoot.nEnergyLevel + nl
        see "   - Position: (r=" + oRoot.nRadius + ", θ=" + oRoot.nAngle + "°)" + nl
        
        # Generate text from root
        cRootText = oEngine.generateTextFromSymbol(oRoot, "arabic")
        see "   - Generated text: '" + cRootText + "'" + nl
    }
    
    # Create derived words
    see nl + "5. Creating derived words from root..." + nl
    
    # Create word "كتاب" (kitab - book)
    oKitab = new MorgenSymbol(
        "kitab",
        "meaning",
        [1, 2, 1, 2, 2, 1, 1, 2],
        0.6,
        90,
        "كتاب"
    )
    oKitab.nEnergyLevel = 0.9
    oKitab.bIsSeed = false
    
    # Add relation to root
    if isObject(oRoot) {
        oKitab.aSubSymbols = [oRoot]
    }
    
    oSpace.addSymbol(oKitab)
    see "   Added word: كتاب (kitab - book)" + nl
    
    # Create word "كاتب" (katib - writer)
    oKatib = new MorgenSymbol(
        "katib",
        "meaning",
        [1, 2, 1, 1, 2, 1, 2],
        0.65,
        100,
        "كاتب"
    )
    oKatib.nEnergyLevel = 0.85
    oKatib.bIsSeed = false
    
    # Add relation to root
    if isObject(oRoot) {
        oKatib.aSubSymbols = [oRoot]
    }
    
    oSpace.addSymbol(oKatib)
    see "   Added word: كاتب (katib - writer)" + nl
    
    # Run dream cycle
    see nl + "6. Running dream cycle to evolve the space..." + nl
    oSpace.enhancedDreamCycle()
    
    # Display final state
    see nl + "7. Final state of the cognitive space:" + nl
    see "   - Total symbols: " + len(oSpace.aSymbols) + nl
    see "   - Global resonance: " + oSpace.nGlobalResonance + nl
    
    # Interactive exploration
    see nl + "==================================================" + nl
    see "INTERACTIVE EXPLORATION" + nl
    see "==================================================" + nl
    see "Enter an Arabic word to analyze (or 'exit' to quit):" + nl
    
    while true {
        see nl + "> "
        give cInput
        
        if lower(cInput) = "exit" {
            exit
        }
        
        if len(cInput) > 0 {
            see "Analyzing '" + cInput + "'..." + nl
            
            # Process the word
            oMeaning = oEngine.analyzeTextMeaning(cInput)
            
            if isObject(oMeaning) {
                see "✓ Word analyzed into symbol: " + oMeaning.cId + nl
                see "  Position: (r=" + oMeaning.nRadius + ", θ=" + oMeaning.nAngle + "°)" + nl
                see "  Energy: " + oMeaning.nEnergyLevel + nl
                
                # Run a focused dream cycle
                see "Running focused dream cycle..." + nl
                oSpace.enhancedDreamCycle()
                
                # Generate related text
                cRelated = oEngine.generateTextFromSymbol(oMeaning, "arabic")
                see "Related text: '" + cRelated + "'" + nl
            }
        }
    }
}

/*
Function: main
Description: Main function
*/
func main {
    runTriconsonantalRootDemo()
}
