# ==============================================================================
# File: morgen_demo.ring
# Description: Simple demonstration of Morgen AI paradigm capabilities
# Author: Morgen AI Project
# ==============================================================================

load "morgen/space.ring"
load "morgen/language/char_definitions.ring"

/*
Function: runBasicDemo
Description: Runs a basic demonstration of Morgen AI
*/
func runBasicDemo {
    see "==================================================" + nl
    see "MORGEN AI - BASIC DEMONSTRATION" + nl
    see "==================================================" + nl
    
    # Create Morgen cognitive space
    see "1. Creating Morgen cognitive space..." + nl
    oSpace = new MorgenSpace(5)
    
    # Create Arabic character symbols
    see "2. Creating Arabic character symbols..." + nl
    aChars = createArabicCharacterSymbols()
    see "   Created " + len(aChars) + " Arabic characters" + nl
    
    # Add some characters to the space
    see "3. Adding characters to the space..." + nl
    for i = 1 to min(8, len(aChars)) {
        oSpace.addSymbol(aChars[i])
    }
    see "   Added " + min(8, len(aChars)) + " characters to space" + nl
    
    # Create triconsonantal roots
    see "4. Creating triconsonantal roots..." + nl
    if len(aChars) >= 6 {
        oRoot1 = createTriconsontalRoot(aChars[1], aChars[2], aChars[3])
        oRoot2 = createTriconsontalRoot(aChars[4], aChars[5], aChars[6])
        
        if isObject(oRoot1) {
            oSpace.addSymbol(oRoot1)
            see "   Created root: " + oRoot1.cId + nl
        }
        if isObject(oRoot2) {
            oSpace.addSymbol(oRoot2)
            see "   Created root: " + oRoot2.cId + nl
        }
    }
    
    # Show initial state
    see "5. Initial space state:" + nl
    see "   Total symbols: " + len(oSpace.aSymbols) + nl
    see "   Global resonance: " + oSpace.nGlobalResonance + nl
    
    # Run enhanced dream cycles
    see "6. Running enhanced dream cycles..." + nl
    for i = 1 to 3 {
        see "   Dream cycle " + i + "..." + nl
        oSpace.enhancedDreamCycle()
        oSpace.updateGlobalResonance()
        
        see "     Symbols: " + len(oSpace.aSymbols) + 
            ", Resonance: " + oSpace.nGlobalResonance + nl
    }
    
    # Test wave propagation
    see "7. Testing wave propagation..." + nl
    oMostEssential = oSpace.getMostEssentialSymbol()
    if isObject(oMostEssential) {
        oSpace.initiateWave(oMostEssential, "insight_wave", 0.8)
        oSpace.propagateWaves()
        see "   Wave initiated from " + oMostEssential.cId + nl
    }
    
    # Test galactic organization
    see "8. Testing galactic organization..." + nl
    oSpace.organizeGalacticClusters()
    see "   Created " + len(oSpace.aGalaxies) + " galactic clusters" + nl
    
    # Final state
    see "9. Final space state:" + nl
    see "   Total symbols: " + len(oSpace.aSymbols) + nl
    see "   Total galaxies: " + len(oSpace.aGalaxies) + nl
    see "   Global resonance: " + oSpace.nGlobalResonance + nl
    see "   Epochs completed: " + oSpace.nEpoch + nl
    
    # Display sample symbols
    see "10. Sample symbols in final state:" + nl
    nSampleCount = min(5, len(oSpace.aSymbols))
    for i = 1 to nSampleCount {
        oSymbol = oSpace.aSymbols[i]
        see "    " + oSymbol.cId + " (" + oSymbol.cType + ")" + nl
        see "      Energy: " + oSymbol.nEnergyLevel + 
            ", Radius: " + oSymbol.nRadius + 
            ", Seed: " + oSymbol.bIsSeed + nl
    }
    
    see nl + "==================================================" + nl
    see "MORGEN AI DEMONSTRATION COMPLETE" + nl
    see "==================================================" + nl
    
    return oSpace
}

/*
Function: runInteractiveDemo
Description: Runs an interactive demonstration
*/
func runInteractiveDemo {
    see "=== MORGEN AI - INTERACTIVE DEMONSTRATION ===" + nl
    see "This demo will show you step-by-step how Morgen AI works." + nl
    see "Press Enter after each step to continue..." + nl
    
    give cDummy
    
    # Step 1: Create space
    see nl + "STEP 1: Creating the cognitive space" + nl
    see "The Morgen space uses an inverted Gabriel's Horn model" + nl
    see "where symbols closer to the center have greater depth." + nl
    oSpace = new MorgenSpace(5)
    give cDummy
    
    # Step 2: Add symbols
    see nl + "STEP 2: Adding Arabic character symbols" + nl
    see "Each Arabic letter becomes a 'living symbol' with:" + nl
    see "- A unique genome (inspired by geomancy)" + nl
    see "- Position in polar coordinates" + nl
    see "- Energy level and resonance" + nl
    
    aChars = createArabicCharacterSymbols()
    for i = 1 to min(6, len(aChars)) {
        oSpace.addSymbol(aChars[i])
        see "Added: " + aChars[i].cId + " (" + aChars[i].oData + ")" + nl
    }
    give cDummy
    
    # Step 3: Show mating
    see nl + "STEP 3: Symbol mating demonstration" + nl
    see "Symbols can 'mate' to produce offspring with combined genomes." + nl
    
    if len(oSpace.aSymbols) >= 2 {
        oSym1 = oSpace.aSymbols[1]
        oSym2 = oSpace.aSymbols[2]
        
        see "Testing mating between " + oSym1.cId + " and " + oSym2.cId + nl
        if oSym1.canMateWith(oSym2) {
            oChild = oSym1.mate(oSym2)
            if isObject(oChild) {
                oSpace.addSymbol(oChild)
                see "✓ Mating successful! Created: " + oChild.cId + nl
            }
        }
    }
    give cDummy
    
    # Step 4: Dream cycle
    see nl + "STEP 4: The Dream Cycle (حَلّ + لَمّ + حُلْم)" + nl
    see "This is the core of Morgen AI:" + nl
    see "- حَلّ (Hall): Decompose symbols into seeds" + nl
    see "- لَمّ (Lamm): Recombine seeds into new forms" + nl
    see "- حُلْم (Hulm): Integrate new symbols into the space" + nl
    
    oSpace.enhancedDreamCycle()
    give cDummy
    
    # Step 5: Final state
    see nl + "STEP 5: Final state and insights" + nl
    see "After the dream cycle, the space has evolved:" + nl
    see "- New symbols have emerged" + nl
    see "- Global resonance has changed" + nl
    see "- The cognitive structure has grown" + nl
    
    see "Final statistics:" + nl
    see "  Symbols: " + len(oSpace.aSymbols) + nl
    see "  Global resonance: " + oSpace.nGlobalResonance + nl
    see "  Epochs: " + oSpace.nEpoch + nl
    
    see nl + "This demonstrates how Morgen AI creates emergent meaning" + nl
    see "through the interaction of symbolic elements!" + nl
}

/*
Function: main
Description: Main demonstration function
*/
func main {
    see "Welcome to Morgen AI Paradigm!" + nl
    see "Choose demonstration type:" + nl
    see "1. Basic Demo (automatic)" + nl
    see "2. Interactive Demo (step-by-step)" + nl
    see "3. Exit" + nl
    see "Enter choice (1-3): "
    
    give nChoice
    nChoice = 0 + nChoice
    
    switch nChoice {
        case 1
            runBasicDemo()
        case 2
            runInteractiveDemo()
        case 3
            see "Goodbye!" + nl
            return
        default
            see "Invalid choice. Running basic demo..." + nl
            runBasicDemo()
    }
}

