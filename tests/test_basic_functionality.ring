# ==============================================================================
# File: test_basic_functionality.ring
# Description: Basic functionality tests for the Morgen AI paradigm
# Author: Morgen AI Project
# ==============================================================================

load "../morgen/space.ring"




    see "==================================================" + nl
    see "MORGEN AI - BASIC FUNCTIONALITY TESTS" + nl
    see "==================================================" + nl
    
    # Run all tests
    oTestSymbol = testBasicSymbolCreation()
    oChildSymbol = testSymbolMating()
    aSeeds = testSymbolDeconstruction()
    testGeometryUtils()
    
    see nl + "==================================================" + nl
    see "BASIC FUNCTIONALITY TESTS COMPLETE" + nl
    see "==================================================" + nl


/*
Function: testBasicSymbolCreation
Description: Tests basic symbol creation and properties
*/
func testBasicSymbolCreation {
    see "=== Testing Basic Symbol Creation ===" + nl
    
    # Test symbol creation with all new attributes
    oSymbol = new MorgenSymbol("test_symbol", "test_type", [1, 2, 1, 2], 0.5, 45, "test data")
    
    see "Created symbol: " + oSymbol.cId + nl
    see "Type: " + oSymbol.cType + nl
    see "Genome: " + listToString(oSymbol.aGenome) + nl
    see "Position: (r=" + oSymbol.nRadius + ", θ=" + oSymbol.nAngle + "°)" + nl
    see "Energy Level: " + oSymbol.nEnergyLevel + nl
    see "Is Seed: " + oSymbol.bIsSeed + nl
    see "Condensation Value: " + oSymbol.nCondensationValue + nl
    
    # Test display function
    oSymbol.display()
    
    return oSymbol
}

/*
Function: testSymbolMating
Description: Tests symbol mating functionality
*/
func testSymbolMating {
    see nl + "=== Testing Symbol Mating ===" + nl
    
    # Create two compatible symbols
    oParent1 = new MorgenSymbol("parent1", "seed", [1, 2, 1, 1], 0.6, 30, null)
    oParent1.bIsSeed = true
    oParent1.nEnergyLevel = 0.8
    
    oParent2 = new MorgenSymbol("parent2", "seed", [2, 1, 2, 2], 0.7, 60, null)
    oParent2.bIsSeed = true
    oParent2.nEnergyLevel = 0.9
    
    see "Parent 1: " + oParent1.cId + " - Genome: " + listToString(oParent1.aGenome) + nl
    see "Parent 2: " + oParent2.cId + " - Genome: " + listToString(oParent2.aGenome) + nl
    
    # Test compatibility
    if oParent1.canMateWith(oParent2) {
        see "✓ Parents are compatible for mating" + nl
        
        # Attempt mating
        oChild = oParent1.mate(oParent2)
        if isObject(oChild) {
            see "✓ Mating successful!" + nl
            see "Child: " + oChild.cId + nl
            see "Child Genome: " + listToString(oChild.aGenome) + nl
            see "Child Position: (r=" + oChild.nRadius + ", θ=" + oChild.nAngle + "°)" + nl
            see "Child Energy: " + oChild.nEnergyLevel + nl
            see "Parent 1 Energy After: " + oParent1.nEnergyLevel + nl
            see "Parent 2 Energy After: " + oParent2.nEnergyLevel + nl
            return oChild
        else 
            see "✗ Mating failed" + nl
        }
    else 
        see "✗ Parents are not compatible" + nl
    }
    
    return null
}

/*
Function: testSymbolDeconstruction
Description: Tests symbol deconstruction into seeds
*/
func testSymbolDeconstruction {
    see nl + "=== Testing Symbol Deconstruction ===" + nl
    
    # Create a complex symbol
    oComplexSymbol = new MorgenSymbol("complex", "concept", [1, 2, 1, 2, 2, 1], 0.8, 90, null)
    oComplexSymbol.nEnergyLevel = 0.6
    
    see "Original symbol: " + oComplexSymbol.cId + nl
    see "Original genome: " + listToString(oComplexSymbol.aGenome) + nl
    
    # Deconstruct to seeds
    aSeeds = oComplexSymbol.deconstructToSeeds()
    
    see "Generated " + len(aSeeds) + " seeds:" + nl
    for oSeed in aSeeds {
        if isObject(oSeed) {
            see "  - " + oSeed.cId + ": " + listToString(oSeed.aGenome) + 
                " (seed: " + oSeed.bIsSeed + ", energy: " + oSeed.nEnergyLevel + ")" + nl
        }
    }
    
    return aSeeds
}

/*
Function: testGeometryUtils
Description: Tests geometric utility functions
*/
func testGeometryUtils {
    see nl + "=== Testing Geometry Utilities ===" + nl
    
    # Test polar distance calculation
    nDist = calculatePolarDistance(0.5, 0, 0.7, 90)
    see "Distance between (0.5, 0°) and (0.7, 90°): " + nDist + nl
    
    # Test genome similarity
    aGenome1 = [1, 2, 1, 2]
    aGenome2 = [1, 2, 2, 1]
    nSimilarity = calculateGenomeSimilarity(aGenome1, aGenome2)
    see "Genome similarity between " + listToString(aGenome1) + 
        " and " + listToString(aGenome2) + ": " + nSimilarity + nl
    
    # Test geometric center calculation
    aTestSymbols = []
    add(aTestSymbols, new MorgenSymbol("s1", "test", [1, 1], 0.5, 0, null))
    add(aTestSymbols, new MorgenSymbol("s2", "test", [2, 2], 0.7, 90, null))
    add(aTestSymbols, new MorgenSymbol("s3", "test", [1, 2], 0.6, 180, null))
    
    aCenter = calculateGeometricCenter(aTestSymbols)
    if aCenter != null {
        see "Geometric center: (r=" + aCenter[1] + ", θ=" + aCenter[2] + "°)" + nl
    }
}

