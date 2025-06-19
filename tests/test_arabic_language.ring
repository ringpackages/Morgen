# ==============================================================================
# File: test_arabic_language.ring
# Description: Tests for Arabic language processing in Morgen AI
# Author: Morgen AI Project
# ==============================================================================

load "../morgen/space.ring"
load "../morgen/language/char_definitions.ring"

/*
Function: testArabicCharacterCreation
Description: Tests creation of Arabic character symbols
*/
func testArabicCharacterCreation {
    see "=== Testing Arabic Character Creation ===" + nl
    
    # Create Arabic character symbols
    aCharSymbols = createArabicCharacterSymbols()
    
    see "Created " + len(aCharSymbols) + " Arabic character symbols" + nl
    
    # Display first few characters
    see nl + "Sample characters:" + nl
    nSampleCount = min(5, len(aCharSymbols))
    for i = 1 to nSampleCount {
        oChar = aCharSymbols[i]
        see "  " + oChar.cId + " (" + oChar.oData + ") - Genome: " + 
            listToString(oChar.aGenome) + ", Position: (r=" + oChar.nRadius + 
            ", θ=" + oChar.nAngle + "°), Energy: " + oChar.nEnergyLevel + nl
    }
    
    # Test character lookup
    see nl + "Testing character lookup:" + nl
    oFoundChar = getCharacterByArabicLetter("ا", aCharSymbols)
    if isObject(oFoundChar) {
        see "✓ Found character for 'ا': " + oFoundChar.cId + nl
    else 
        see "✗ Could not find character for 'ا'" + nl
    }
    
    return aCharSymbols
}

/*
Function: testTriconsonantalRoots
Description: Tests creation of triconsonantal roots
*/
func testTriconsonantalRoots aCharSymbols {
    see nl + "=== Testing Triconsonantal Roots ===" + nl
    
    if len(aCharSymbols) < 3 {
        see "Not enough characters for root testing" + nl
        return []
    }
    
    aRoots = []
    
    # Test root creation with different character combinations
    aTestCombinations = [
        [1, 2, 3],    # First three characters
        [4, 5, 6],    # Next three
        [1, 5, 9]     # Mixed combination
    ]
    
    for aCombination in aTestCombinations {
        if aCombination[3] <= len(aCharSymbols) {
            oChar1 = aCharSymbols[aCombination[1]]
            oChar2 = aCharSymbols[aCombination[2]]
            oChar3 = aCharSymbols[aCombination[3]]
            
            see "Creating root from: " + oChar1.cId + " + " + oChar2.cId + " + " + oChar3.cId + nl
            
            oRoot = createTriconsontalRoot(oChar1, oChar2, oChar3)
            if isObject(oRoot) {
                see "✓ Created root: " + oRoot.cId + nl
                see "  Root genome: " + listToString(oRoot.aGenome) + nl
                see "  Root position: (r=" + oRoot.nRadius + ", θ=" + oRoot.nAngle + "°)" + nl
                see "  Root energy: " + oRoot.nEnergyLevel + nl
                see "  Sub-symbols: " + len(oRoot.aSubSymbols) + nl
                
                add(aRoots, oRoot)
            else 
                see "✗ Failed to create root" + nl
            }
        }
    }
    
    return aRoots
}

/*
Function: testCharacterMating
Description: Tests mating between Arabic characters
*/
func testCharacterMating aCharSymbols {
    see nl + "=== Testing Character Mating ===" + nl
    
    if len(aCharSymbols) < 2 {
        see "Not enough characters for mating tests" + nl
        return
    }
    
    # Test mating between different character types
    aTestPairs = [
        [1, 2],   # First two characters
        [3, 4],   # Next pair
        [1, 5]    # Different combination
    ]
    
    for aPair in aTestPairs {
        if aPair[2] <= len(aCharSymbols) {
            oChar1 = aCharSymbols[aPair[1]]
            oChar2 = aCharSymbols[aPair[2]]
            
            see "Testing mating: " + oChar1.cId + " + " + oChar2.cId + nl
            
            # Check compatibility
            if oChar1.canMateWith(oChar2) {
                see "  ✓ Characters are compatible" + nl
                
                # Attempt mating
                oChild = oChar1.mate(oChar2)
                if isObject(oChild) {
                    see "  ✓ Mating successful: " + oChild.cId + nl
                    see "    Child genome: " + listToString(oChild.aGenome) + nl
                    see "    Child position: (r=" + oChild.nRadius + ", θ=" + oChild.nAngle + "°)" + nl
                else 
                    see "  ✗ Mating failed" + nl
                }
            else 
                see "  ✗ Characters are not compatible" + nl
            }
        }
    }
}

/*
Function: testLanguageInSpace
Description: Tests integration of language elements in Morgen space
*/
func testLanguageInSpace aCharSymbols, aRoots {
    see nl + "=== Testing Language Integration in Space ===" + nl
    
    # Create a Morgen space
    oSpace = new MorgenSpace(5)
    
    # Add character symbols to space
    nCharsToAdd = min(10, len(aCharSymbols))
    see "Adding " + nCharsToAdd + " characters to space..." + nl
    
    for i = 1 to nCharsToAdd {
        oSpace.addSymbol(aCharSymbols[i])
    }
    
    # Add roots to space
    see "Adding " + len(aRoots) + " roots to space..." + nl
    for oRoot in aRoots {
        if isObject(oRoot) {
            oSpace.addSymbol(oRoot)
        }
    }
    
    see "Space now contains " + len(oSpace.aSymbols) + " symbols" + nl
    
    # Test geometric relationships
    see nl + "Testing geometric relationships:" + nl
    if len(oSpace.aSymbols) >= 2 {
        oSym1 = oSpace.aSymbols[1]
        oSym2 = oSpace.aSymbols[2]
        
        nDistance = calculatePolarDistance(oSym1.nRadius, oSym1.nAngle, oSym2.nRadius, oSym2.nAngle)
        nSimilarity = calculateGenomeSimilarity(oSym1.aGenome, oSym2.aGenome)
        nBindingPotential = assessBindingPotential(oSym1, oSym2, oSpace)
        
        see "  Distance between " + oSym1.cId + " and " + oSym2.cId + ": " + nDistance + nl
        see "  Genome similarity: " + nSimilarity + nl
        see "  Binding potential: " + nBindingPotential + nl
    }
    
    # Test dream cycle with language elements
    see nl + "Testing dream cycle with language elements:" + nl
    oSpace.enhancedDreamCycle()
    
    see "After dream cycle:" + nl
    see "  Total symbols: " + len(oSpace.aSymbols) + nl
    see "  Global resonance: " + oSpace.nGlobalResonance + nl
    
    return oSpace
}

/*
Function: testCharacterEvolution
Description: Tests evolution of character symbols through multiple cycles
*/
func testCharacterEvolution oSpace {
    see nl + "=== Testing Character Evolution ===" + nl
    
    # Track character symbols through evolution
    aInitialChars = []
    for oSymbol in oSpace.aSymbols {
        if isObject(oSymbol) and oSymbol.cType = "arabic_letter" {
            add(aInitialChars, oSymbol)
        }
    }
    
    see "Initial Arabic characters in space: " + len(aInitialChars) + nl
    
    # Run multiple dream cycles
    for nCycle = 1 to 3 {
        see nl + "--- Evolution Cycle #" + nCycle + " ---" + nl
        
        nSymbolsBefore = len(oSpace.aSymbols)
        
        # Run enhanced dream cycle
        oSpace.enhancedDreamCycle()
        oSpace.updateGlobalResonance()
        
        # Count different symbol types
        nArabicLetters = 0
        nRoots = 0
        nOffspring = 0
        nSeeds = 0
        
        for oSymbol in oSpace.aSymbols {
            if isObject(oSymbol) {
                if oSymbol.cType = "arabic_letter" {
                    nArabicLetters++
                elseif oSymbol.cType = "triconsonantal_root" 
                    nRoots++
                elseif oSymbol.cType = "offspring" or oSymbol.cType = "seed_offspring" 
                    nOffspring++
                elseif oSymbol.bIsSeed 
                    nSeeds++
                }
            }
        }
        
        see "Symbol distribution after cycle " + nCycle + ":" + nl
        see "  Arabic letters: " + nArabicLetters + nl
        see "  Roots: " + nRoots + nl
        see "  Offspring: " + nOffspring + nl
        see "  Seeds: " + nSeeds + nl
        see "  Total: " + len(oSpace.aSymbols) + nl
        see "  Global resonance: " + oSpace.nGlobalResonance + nl
    }
}

/*
Function: main
Description: Main test function for Arabic language processing
*/
func main {
    see "==================================================" + nl
    see "MORGEN AI - ARABIC LANGUAGE PROCESSING TESTS" + nl
    see "==================================================" + nl
    
    # Test character creation
    aCharSymbols = testArabicCharacterCreation()
    
    # Test root creation
    aRoots = testTriconsonantalRoots(aCharSymbols)
    
    # Test character mating
    testCharacterMating(aCharSymbols)
    
    # Test language integration in space
    oSpace = testLanguageInSpace(aCharSymbols, aRoots)
    
    # Test character evolution
    testCharacterEvolution(oSpace)
    
    see nl + "=== Final Language Space State ===" + nl
    see "Total symbols in space: " + len(oSpace.aSymbols) + nl
    see "Current epoch: " + oSpace.nEpoch + nl
    see "Global resonance: " + oSpace.nGlobalResonance + nl
    
    # Display sample symbols
    see nl + "Sample symbols in final state:" + nl
    nSampleCount = min(5, len(oSpace.aSymbols))
    for i = 1 to nSampleCount {
        oSymbol = oSpace.aSymbols[i]
        see "  " + oSymbol.cId + " (" + oSymbol.cType + ") - Energy: " + 
            oSymbol.nEnergyLevel + ", Radius: " + oSymbol.nRadius + nl
    }
    
    see nl + "==================================================" + nl
    see "ARABIC LANGUAGE PROCESSING TESTS COMPLETE" + nl
    see "==================================================" + nl
}

