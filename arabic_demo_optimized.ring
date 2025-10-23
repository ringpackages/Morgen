# ==============================================================================
# File: arabic_demo_optimized.ring
# Description: Optimized Arabic language demo for Morgen AI (low memory usage)
# Author: Morgen AI Project
# ==============================================================================

load "morgen/space_optimized.ring"
//load "morgen/language/char_definitions.ring"
load "morgen/language/linguistic_engine.ring"

/*
Function: runOptimizedArabicDemo
Description: Runs an optimized demo of Arabic language processing
*/
func runOptimizedArabicDemo {
    see "==================================================" + nl
    see "MORGEN AI - OPTIMIZED ARABIC LANGUAGE DEMO" + nl
    see "==================================================" + nl
    see "Optimized for systems with limited resources (i3, 6GB RAM)" + nl
    see "==================================================" + nl
    
    # Create a smaller Morgen cognitive space
    see "1. Creating optimized Morgen cognitive space..." + nl
    oSpace = new MorgenSpace(2)  # Reduced horn depth
    
    # Limit maximum symbols
    oSpace.nMaxSymbols = 100
    
    # Create Arabic character symbols (limited set)
    see "2. Creating essential Arabic character symbols..." + nl
    aChars = createEssentialArabicCharacters()
    see "   Created " + len(aChars) + " essential Arabic characters" + nl
    
    # Add only essential characters to the space
    see "3. Adding characters to the space..." + nl
    for i = 1 to len(aChars) {
        oSpace.addSymbol(aChars[i])
    }
    
    # Create a lightweight linguistic engine
    see "4. Initializing lightweight linguistic engine..." + nl
    oEngine = new LinguisticEngine(oSpace)
    
    # Process simple Arabic words
    see nl + "5. Processing Arabic words..." + nl
    aTestWords = [
        "كتاب",    # Book
        "ماء",     # Water
        "بيت"      # House
    ]
    
    for cWord in aTestWords {
        see nl + "   Processing word: '" + cWord + "'" + nl
        
        # Process the word
        oMeaning = oEngine.analyzeTextMeaning(cWord)
        
        if isObject(oMeaning) {
            see "   ✓ Word analyzed into symbol: " + oMeaning.cId + nl
            see "     Position: (r=" + oMeaning.nRadius + ", θ=" + oMeaning.nAngle + "°)" + nl
            see "     Energy: " + oMeaning.nEnergyLevel + nl
        }
    }
    
    # Run a single optimized dream cycle
    see nl + "6. Running optimized dream cycle..." + nl
    oSpace.enhancedDreamCycle()
    
    # Generate text from evolved symbols
    see nl + "7. Generating text from evolved symbols..." + nl
    
    # Find a suitable symbol to generate text from
    for oSymbol in oSpace.aSymbols {
        if isObject(oSymbol) and oSymbol.cType = "meaning" {
            cGeneratedText = oEngine.generateTextFromSymbol(oSymbol, "arabic")
            see "   Generated text from " + oSymbol.cId + ": '" + cGeneratedText + "'" + nl
            break
        }
    }
    
    # Demonstrate root creation
    see nl + "8. Demonstrating triconsonantal root creation..." + nl
    
    if len(aChars) >= 3 {
        oRoot = createTriconsontalRoot(aChars[1], aChars[2], aChars[3])
        
        if isObject(oRoot) {
            see "   Created root: " + oRoot.cId + " from letters: " + 
                aChars[1].oData + " + " + aChars[2].oData + " + " + aChars[3].oData + nl
            
            # Add root to space
            oSpace.addSymbol(oRoot)
            
            # Generate text from root
            cRootText = oEngine.generateTextFromSymbol(oRoot, "arabic")
            see "   Generated text from root: '" + cRootText + "'" + nl
        }
    }
    
    # Display statistics
    see nl + "==================================================" + nl
    see "DEMO STATISTICS:" + nl
    see "- Total symbols in space: " + len(oSpace.aSymbols) + nl
    see "- Global resonance: " + oSpace.nGlobalResonance + nl
    see "- Memory usage: Optimized for 6GB RAM systems" + nl
    see "==================================================" + nl
}

/*
Function: createEssentialArabicCharacters
Description: Creates a minimal set of Arabic characters to save memory
*/
func createEssentialArabicCharacters {
    aEssentialChars = []
    
    # Create only the most essential Arabic characters
    
    # Alif (ا)
    oAlif = new MorgenSymbol("alif", "arabic_letter", [1, 1, 1, 1], 0.9, 0, "ا")
    oAlif.bIsSeed = true
    oAlif.nEnergyLevel = 1.0
    add(aEssentialChars, oAlif)
    
    # Ba (ب)
    oBa = new MorgenSymbol("ba", "arabic_letter", [2, 1, 2, 1], 0.85, 15, "ب")
    oBa.bIsSeed = true
    oBa.nEnergyLevel = 0.95
    add(aEssentialChars, oBa)
    
    # Ta (ت)
    oTa = new MorgenSymbol("ta", "arabic_letter", [2, 1, 1, 2], 0.82, 30, "ت")
    oTa.bIsSeed = true
    oTa.nEnergyLevel = 0.9
    add(aEssentialChars, oTa)
    
    # Kaf (ك)
    oKaf = new MorgenSymbol("kaf", "arabic_letter", [1, 2, 1, 2], 0.7, 120, "ك")
    oKaf.bIsSeed = true
    oKaf.nEnergyLevel = 0.85
    add(aEssentialChars, oKaf)
    
    # Mim (م)
    oMim = new MorgenSymbol("mim", "arabic_letter", [1, 2, 2, 1], 0.65, 150, "م")
    oMim.bIsSeed = true
    oMim.nEnergyLevel = 0.9
    add(aEssentialChars, oMim)
    
    return aEssentialChars
}

/*
Function: main
Description: Main function
*/
func main {
    see "Welcome to Morgen AI Optimized Arabic Demo!" + nl
    see "This demo is optimized for systems with i3 CPU and 6GB RAM." + nl
    see nl
    
    # Run the optimized demo
    runOptimizedArabicDemo()
    
    see nl + "Demo completed successfully!" + nl
}
