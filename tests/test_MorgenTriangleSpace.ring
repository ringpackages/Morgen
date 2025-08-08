// Test file for Morgen Triangle Space Class
// Testing geometric calculations for Morgen paradigm
// Author: Morgen Project Team
// Date: 2024-12-30

load "stdlibcore.ring"
load "MorgenTriangleSpace.ring"

// Run the demonstration
demonstrateMorgenConcepts()
// Run the tests
testMorgenTriangleSpace()


// Test function for Morgen Triangle Space
func testMorgenTriangleSpace() {
    
    see nl + "=== Testing Morgen Triangle Space Class ===" + nl + nl
    
    // Test 1: Create instance and basic functionality
    see "Test 1: Creating Morgen Triangle Space instance..." + nl
    oTriSpace = new MorgenTriangleSpace()
    oTriSpace.setMorgenSymbol("مرجان_مثلث")
    oTriSpace.setMorgenScale(2.5)
    
    if oTriSpace.isValid() {
        see "✓ Instance created successfully" + nl
    } else {
        see "✗ Failed to create instance" + nl
    }
    
    // Test 2: SSS Triangle calculation (Equilateral)
    see nl + "Test 2: SSS Calculation - Equilateral Triangle..." + nl
    bResult = oTriSpace.calculateFromSides(60, 60, 60)
    
    if bResult {
        see "✓ SSS calculation successful" + nl
        oTriSpace.printMorgenInfo()
    } else {
        see "✗ SSS calculation failed: " + oTriSpace.getLastOperation() + nl
    }
    
    // Test 3: AAS Triangle calculation
    see nl + "Test 3: AAS Calculation - Right Triangle..." + nl
    oTriSpace2 = new MorgenTriangleSpace()
    oTriSpace2.setMorgenSymbol("مرجان_قائم")
    bResult = oTriSpace2.calculateFromAnglesAndSide(45, 45, 100)
    
    if bResult {
        see "✓ AAS calculation successful" + nl
        oTriSpace2.printMorgenInfo()
    } else {
        see "✗ AAS calculation failed: " + oTriSpace2.getLastOperation() + nl
    }
    
    // Test 4: Symbolic distance calculation
    see nl + "Test 4: Symbolic Distance Calculation..." + nl
    nDistance = oTriSpace.calculateSymbolicDistance("مرجان", "حلم")
    see "Symbolic distance between 'مرجان' and 'حلم': " + nDistance + nl
    
    // Test 5: Meaning density analysis
    see nl + "Test 5: Meaning Density Analysis..." + nl
    nDensity1 = oTriSpace.calculateMeaningDensity()
    nDensity2 = oTriSpace2.calculateMeaningDensity()
    
    see "Equilateral triangle meaning density: " + nDensity1 + nl
    see "Right triangle meaning density: " + nDensity2 + nl
    
    if nDensity1 > nDensity2 {
        see "✓ Equilateral triangle has higher meaning density" + nl
    } else {
        see "✓ Right triangle has higher meaning density" + nl
    }
    
    // Test 6: Morgen vertices mapping
    see nl + "Test 6: Morgen Vertices Mapping..." + nl
    aVertices1 = oTriSpace.getMorgenVertices()
    aVertices2 = oTriSpace2.getMorgenVertices()
    
    see "Equilateral vertices count: " + len(aVertices1) + nl
    see "Right triangle vertices count: " + len(aVertices2) + nl
    
    // Test 7: Concept and meaning radii
    see nl + "Test 7: Concept and Meaning Radii..." + nl
    nMeaningR1 = oTriSpace.getMeaningRadius()
    nConceptR1 = oTriSpace.getConceptRadius()
    nMeaningR2 = oTriSpace2.getMeaningRadius()
    nConceptR2 = oTriSpace2.getConceptRadius()
    
    see "Equilateral - Meaning Radius: " + nMeaningR1 + ", Concept Radius: " + nConceptR1 + nl
    see "Right Triangle - Meaning Radius: " + nMeaningR2 + ", Concept Radius: " + nConceptR2 + nl
    
    // Test 8: Error handling
    see nl + "Test 8: Error Handling..." + nl
    oTriSpace3 = new MorgenTriangleSpace()
    bResult = oTriSpace3.calculateFromSides(0, 10, 20)  // Invalid triangle
    
    if !bResult {
        see "✓ Error handling works: " + oTriSpace3.getLastOperation() + nl
    } else {
        see "✗ Error handling failed" + nl
    }
    
    // Test 9: Isosceles triangle for comparison
    see nl + "Test 9: Isosceles Triangle Analysis..." + nl
    oTriSpace4 = new MorgenTriangleSpace()
    oTriSpace4.setMorgenSymbol("مرجان_متساوي")
    bResult = oTriSpace4.calculateFromSides(100, 100, 50)
    
    if bResult {
        see "✓ Isosceles calculation successful" + nl
        nDensity4 = oTriSpace4.calculateMeaningDensity()
        see "Isosceles meaning density: " + nDensity4 + nl
        oTriSpace4.printMorgenInfo()
    }
    
    // Test 10: Scalene triangle
    see nl + "Test 10: Scalene Triangle Analysis..." + nl
    oTriSpace5 = new MorgenTriangleSpace()
    oTriSpace5.setMorgenSymbol("مرجان_مختلف")
    bResult = oTriSpace5.calculateFromSides(80, 60, 100)
    
    if bResult {
        see "✓ Scalene calculation successful" + nl
        nDensity5 = oTriSpace5.calculateMeaningDensity()
        see "Scalene meaning density: " + nDensity5 + nl
        
        // Compare all meaning densities
        see nl + "=== Meaning Density Comparison ===" + nl
        see "Equilateral: " + nDensity1 + nl
        see "Right: " + nDensity2 + nl
        see "Isosceles: " + nDensity4 + nl
        see "Scalene: " + nDensity5 + nl
    }
    
    see nl + "=== All Tests Completed ===" + nl + nl
}



// Additional demonstration of Morgen concepts
func demonstrateMorgenConcepts() {
    
    see "=== Morgen Paradigm Geometric Concepts ===" + nl + nl
    
    // Create a triangle representing a dream cycle
    oDreamTriangle = new MorgenTriangleSpace()
    oDreamTriangle.setMorgenSymbol("دورة_الحلم")
    oDreamTriangle.setMorgenScale(3.0)
    
    // Use golden ratio proportions for dream geometry
    nGoldenRatio = 1.618
    nSide1 = 100
    nSide2 = nSide1 * nGoldenRatio
    nSide3 = nSide1 * nGoldenRatio * 0.8
    
    if oDreamTriangle.calculateFromSides(nSide1, nSide2, nSide3) {
        see "Dream Cycle Triangle created with golden ratio proportions" + nl
        oDreamTriangle.printMorgenInfo()
        
        // Analyze the dream space properties
        nDreamDensity = oDreamTriangle.calculateMeaningDensity()
        nDreamRadius = oDreamTriangle.getMeaningRadius()
        
        see "Dream meaning concentration: " + nDreamRadius + nl
        see "Dream semantic density: " + nDreamDensity + nl
        
        // Calculate symbolic relationships
        nSymbolicDist = oDreamTriangle.calculateSymbolicDistance("حلم", "واقع")
        see "Symbolic distance between dream and reality: " + nSymbolicDist + nl
    }
    
    see nl + "=== End of Morgen Demonstration ===" + nl
}


