# ==============================================================================
# File: test_geometric_structures.ring
# Description: Tests for geometric structures and triangulation in Morgen AI
# Author: Morgen AI Project
# ==============================================================================

load "../morgen/space.ring"

/*
Function: createGeometricTestSpace
Description: Creates a test space with symbols arranged in geometric patterns
*/
func createGeometricTestSpace {
    see "Creating geometric test space..." + nl
    
    oSpace = new MorgenSpace(5)
    
    # Create symbols in a triangular pattern
    oVertex1 = new MorgenSymbol("vertex_1", "geometric", [1, 1, 2, 2], 0.5, 0, null)
    oVertex1.nEnergyLevel = 0.9
    oSpace.addSymbol(oVertex1)
    
    oVertex2 = new MorgenSymbol("vertex_2", "geometric", [2, 2, 1, 1], 0.5, 120, null)
    oVertex2.nEnergyLevel = 0.8
    oSpace.addSymbol(oVertex2)
    
    oVertex3 = new MorgenSymbol("vertex_3", "geometric", [1, 2, 1, 2], 0.5, 240, null)
    oVertex3.nEnergyLevel = 0.85
    oSpace.addSymbol(oVertex3)
    
    # Create symbols in a square pattern
    oSquare1 = new MorgenSymbol("square_1", "geometric", [1, 1, 1, 1], 0.7, 45, null)
    oSquare1.nEnergyLevel = 0.7
    oSpace.addSymbol(oSquare1)
    
    oSquare2 = new MorgenSymbol("square_2", "geometric", [2, 2, 2, 2], 0.7, 135, null)
    oSquare2.nEnergyLevel = 0.75
    oSpace.addSymbol(oSquare2)
    
    oSquare3 = new MorgenSymbol("square_3", "geometric", [1, 2, 2, 1], 0.7, 225, null)
    oSquare3.nEnergyLevel = 0.8
    oSpace.addSymbol(oSquare3)
    
    oSquare4 = new MorgenSymbol("square_4", "geometric", [2, 1, 1, 2], 0.7, 315, null)
    oSquare4.nEnergyLevel = 0.72
    oSpace.addSymbol(oSquare4)
    
    # Create a central symbol
    oCenter = new MorgenSymbol("center", "core", [1, 2, 1, 2, 1, 2], 0.2, 0, null)
    oCenter.nEnergyLevel = 1.0
    oSpace.addSymbol(oCenter)
    
    see "Created space with " + len(oSpace.aSymbols) + " geometrically arranged symbols" + nl
    return oSpace
}

/*
Function: testBasicGeometryUtils
Description: Tests basic geometry utility functions
*/
func testBasicGeometryUtils {
    see "=== Testing Basic Geometry Utilities ===" + nl
    
    # Test polar distance calculation
    see "Testing polar distance calculation:" + nl
    nDist1 = calculatePolarDistance(0.5, 0, 0.5, 90)
    see "  Distance (0.5, 0°) to (0.5, 90°): " + nDist1 + nl
    
    nDist2 = calculatePolarDistance(0.3, 45, 0.7, 225)
    see "  Distance (0.3, 45°) to (0.7, 225°): " + nDist2 + nl
    
    # Test genome similarity
    see nl + "Testing genome similarity:" + nl
    aGenome1 = [1, 2, 1, 2]
    aGenome2 = [1, 2, 1, 2]  # Identical
    nSim1 = calculateGenomeSimilarity(aGenome1, aGenome2)
    see "  Identical genomes similarity: " + nSim1 + nl
    
    aGenome3 = [2, 1, 2, 1]  # Opposite
    nSim2 = calculateGenomeSimilarity(aGenome1, aGenome3)
    see "  Opposite genomes similarity: " + nSim2 + nl
    
    aGenome4 = [1, 2, 2, 1]  # Partially similar
    nSim3 = calculateGenomeSimilarity(aGenome1, aGenome4)
    see "  Partially similar genomes similarity: " + nSim3 + nl
    
    # Test geometric center calculation
    see nl + "Testing geometric center calculation:" + nl
    aTestSymbols = []
    add(aTestSymbols, new MorgenSymbol("test1", "test", [1, 1], 1.0, 0, null))
    add(aTestSymbols, new MorgenSymbol("test2", "test", [2, 2], 1.0, 90, null))
    add(aTestSymbols, new MorgenSymbol("test3", "test", [1, 2], 1.0, 180, null))
    add(aTestSymbols, new MorgenSymbol("test4", "test", [2, 1], 1.0, 270, null))
    
    aCenter = calculateGeometricCenter(aTestSymbols)
    if aCenter != null {
        see "  Geometric center of square: (r=" + aCenter[1] + ", θ=" + aCenter[2] + "°)" + nl
    }
}

/*
Function: testBindingPotential
Description: Tests binding potential assessment
*/
func testBindingPotential oSpace {
    see nl + "=== Testing Binding Potential Assessment ===" + nl
    
    if len(oSpace.aSymbols) < 2 {
        see "Not enough symbols for binding potential tests" + nl
        return
    }
    
    # Test binding potential between different symbol pairs
    see "Testing binding potential between symbol pairs:" + nl
    
    for i = 1 to min(3, len(oSpace.aSymbols) - 1) {
        for j = i + 1 to min(i + 2, len(oSpace.aSymbols)) {
            oSym1 = oSpace.aSymbols[i]
            oSym2 = oSpace.aSymbols[j]
            
            nPotential = assessBindingPotential(oSym1, oSym2, oSpace)
            nDistance = calculatePolarDistance(oSym1.nRadius, oSym1.nAngle, oSym2.nRadius, oSym2.nAngle)
            nGenomeSim = calculateGenomeSimilarity(oSym1.aGenome, oSym2.aGenome)
            
            see "  " + oSym1.cId + " + " + oSym2.cId + ":" + nl
            see "    Binding potential: " + nPotential + nl
            see "    Distance: " + nDistance + nl
            see "    Genome similarity: " + nGenomeSim + nl
        }
    }
}

/*
Function: testBestMatingPairs
Description: Tests finding best mating pairs
*/
func testBestMatingPairs oSpace {
    see nl + "=== Testing Best Mating Pairs Selection ===" + nl
    
    # Create a list of candidate symbols
    aCandidates = []
    for oSymbol in oSpace.aSymbols {
        if isObject(oSymbol) and oSymbol.nEnergyLevel > 0.5 {
            add(aCandidates, oSymbol)
        }
    }
    
    see "Candidates for mating: " + len(aCandidates) + nl
    
    if len(aCandidates) < 2 {
        see "Not enough candidates for mating pair tests" + nl
        return
    }
    
    # Find best mating pairs
    nPairsToFind = min(3, len(aCandidates) / 2)
    aBestPairs = findBestMatingPairs(aCandidates, oSpace, nPairsToFind)
    
    see "Found " + len(aBestPairs) + " best mating pairs:" + nl
    for aPair in aBestPairs {
        oSym1 = aPair[1]
        oSym2 = aPair[2]
        nScore = aPair[3]
        
        see "  " + oSym1.cId + " + " + oSym2.cId + " (score: " + nScore + ")" + nl
    }
    
    return aBestPairs
}

/*
Function: testTriangulation
Description: Tests triangulation creation and stability
*/
func testTriangulation oSpace {
    see nl + "=== Testing Triangulation ===" + nl
    
    if len(oSpace.aSymbols) < 3 {
        see "Not enough symbols for triangulation tests" + nl
        return
    }
    
    # Test triangulation with first three symbols
    oSym1 = oSpace.aSymbols[1]
    oSym2 = oSpace.aSymbols[2]
    oSym3 = oSpace.aSymbols[3]
    
    see "Creating triangulation with: " + oSym1.cId + ", " + oSym2.cId + ", " + oSym3.cId + nl
    
    # Calculate triangulation stability before creation
    nStability = calculateTriangulationStability(oSym1, oSym2, oSym3)
    see "Triangulation stability: " + nStability + nl
    
    # Create the triangulation
    oSpace.createTriangulation(oSym1, oSym2, oSym3, "test_triangle")
    
    see "Triangulation created. Total triangulations: " + len(oSpace.aTriangulations) + nl
    
    # Test with another set if available
    if len(oSpace.aSymbols) >= 6 {
        oSym4 = oSpace.aSymbols[4]
        oSym5 = oSpace.aSymbols[5]
        oSym6 = oSpace.aSymbols[6]
        
        see nl + "Creating second triangulation with: " + oSym4.cId + ", " + oSym5.cId + ", " + oSym6.cId + nl
        
        nStability2 = calculateTriangulationStability(oSym4, oSym5, oSym6)
        see "Second triangulation stability: " + nStability2 + nl
        
        oSpace.createTriangulation(oSym4, oSym5, oSym6, "geometric_triangle")
        
        see "Second triangulation created. Total triangulations: " + len(oSpace.aTriangulations) + nl
    }
}

/*
Function: testGalacticOrganization
Description: Tests galactic cluster organization
*/
func testGalacticOrganization oSpace {
    see nl + "=== Testing Galactic Organization ===" + nl
    
    # Update resonance to create potential galactic cores
    oSpace.updateGlobalResonance()
    
    # Boost resonance of some symbols to make them galactic cores
    if len(oSpace.aSymbols) > 0 {
        oSpace.aSymbols[1].nResonance = 3.5  # Make it a potential core
    }
    if len(oSpace.aSymbols) > 3 {
        oSpace.aSymbols[4].nResonance = 3.2  # Another potential core
    }
    
    see "Before galactic organization:" + nl
    see "  Total symbols: " + len(oSpace.aSymbols) + nl
    see "  Existing galaxies: " + len(oSpace.aGalaxies) + nl
    
    # Organize galactic clusters
    oSpace.organizeGalacticClusters()
    
    see nl + "After galactic organization:" + nl
    see "  Total galaxies: " + len(oSpace.aGalaxies) + nl
    
    # Display galaxy information
    for i = 1 to len(oSpace.aGalaxies) {
        oGalaxy = oSpace.aGalaxies[i]
        see "  Galaxy " + i + ":" + nl
        see "    Core: " + oGalaxy["core"] + nl
        see "    Members: " + len(oGalaxy["members"]) + nl
        see "    Total resonance: " + oGalaxy["total_resonance"] + nl
    }
}

/*
Function: testHigherOrderComplexes
Description: Tests creation of higher-order simplicial complexes
*/
func testHigherOrderComplexes oSpace {
    see nl + "=== Testing Higher-Order Complexes ===" + nl
    
    if len(oSpace.aSymbols) < 4 {
        see "Not enough symbols for higher-order complex tests" + nl
        return
    }
    
    # Create a 3-simplex (tetrahedron) from first four symbols
    aComplexSymbols = []
    for i = 1 to 4 {
        add(aComplexSymbols, oSpace.aSymbols[i])
    }
    
    see "Creating 3-simplex from 4 symbols..." + nl
    oComplex = oSpace.createHigherOrderComplex(aComplexSymbols, "tetrahedron")
    
    if oComplex != null {
        see "✓ Complex created successfully" + nl
        see "  Complex ID: " + oComplex["id"] + nl
        see "  Dimension: " + oComplex["dimension"] + nl
        see "  Center: (r=" + oComplex["center_radius"] + ", θ=" + oComplex["center_angle"] + "°)" + nl
    else 
        see "✗ Complex creation failed" + nl
    }
    
    see "Total complexes in space: " + len(oSpace.aComplexes) + nl
}

/*
Function: main
Description: Main test function for geometric structures
*/
func main {
    see "==================================================" + nl
    see "MORGEN AI - GEOMETRIC STRUCTURES TESTS" + nl
    see "==================================================" + nl
    
    # Test basic geometry utilities
    testBasicGeometryUtils()
    
    # Create geometric test space
    oSpace = createGeometricTestSpace()
    
    # Test binding potential
    testBindingPotential(oSpace)
    
    # Test best mating pairs
    aBestPairs = testBestMatingPairs(oSpace)
    
    # Test triangulation
    testTriangulation(oSpace)
    
    # Test galactic organization
    testGalacticOrganization(oSpace)
    
    # Test higher-order complexes
    testHigherOrderComplexes(oSpace)
    
    # Final state summary
    see nl + "=== Final Geometric Space State ===" + nl
    see "Total symbols: " + len(oSpace.aSymbols) + nl
    see "Total triangulations: " + len(oSpace.aTriangulations) + nl
    see "Total galaxies: " + len(oSpace.aGalaxies) + nl
    see "Total complexes: " + len(oSpace.aComplexes) + nl
    see "Global resonance: " + oSpace.nGlobalResonance + nl
    
    see nl + "==================================================" + nl
    see "GEOMETRIC STRUCTURES TESTS COMPLETE" + nl
    see "==================================================" + nl
}

