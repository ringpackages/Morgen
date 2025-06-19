# ==============================================================================
# File: geometry_utils.ring
# Description: Geometric utility functions for the Morgen AI paradigm
# Author: Morgen AI Project
# ==============================================================================

//load "utils.ring"

# ==============================================================================
# Geometric Utility Functions
# ==============================================================================

/*
Function: calculatePolarDistance
Description: Calculates the distance between two points in polar coordinates
Inputs:
    nRadius1 : (number) Radius of first point
    nAngle1  : (number) Angle of first point (in degrees)
    nRadius2 : (number) Radius of second point
    nAngle2  : (number) Angle of second point (in degrees)
Outputs: (number) Distance between the points
*/
func calculatePolarDistance nRadius1, nAngle1, nRadius2, nAngle2 {
    # Convert to Cartesian coordinates
    x1 = nRadius1 * cos(nAngle1 * PI / 180)
    y1 = nRadius1 * sin(nAngle1 * PI / 180)
    x2 = nRadius2 * cos(nAngle2 * PI / 180)
    y2 = nRadius2 * sin(nAngle2 * PI / 180)
    
    # Calculate Euclidean distance
    nDistance = sqrt(pow(x2-x1, 2) + pow(y2-y1, 2))
    
    return nDistance
}

/*
Function: calculateGeometricCenter
Description: Calculates the geometric center of a group of symbols
Inputs:
    aSymbols : (list) List of oMorgenSymbol objects
Outputs: (list) [nCenterRadius, nCenterAngle] or null if no symbols
*/
func calculateGeometricCenter aSymbols {
    if len(aSymbols) = 0 {
        return null
    }
    
    # Convert all symbols to Cartesian, find center, convert back
    nTotalX = 0
    nTotalY = 0
    
    for oSymbol in aSymbols {
        if isObject(oSymbol) {
            x = oSymbol.nRadius * cos(oSymbol.nAngle * PI / 180)
            y = oSymbol.nRadius * sin(oSymbol.nAngle * PI / 180)
            nTotalX += x
            nTotalY += y
        }
    }
    
    nCenterX = nTotalX / len(aSymbols)
    nCenterY = nTotalY / len(aSymbols)
    
    # Convert back to polar
    nCenterRadius = sqrt(pow(nCenterX, 2) + pow(nCenterY, 2))
    nCenterAngle = atan2(nCenterY, nCenterX) * 180 / PI
    
    # Normalize angle to 0-360 range
    if nCenterAngle < 0 { nCenterAngle += 360 }
    
    return [nCenterRadius, nCenterAngle]
}

/*
Function: calculateGenomeSimilarity
Description: Calculates similarity between two genomes
Inputs:
    aGenome1 : (list) First genome
    aGenome2 : (list) Second genome
Outputs: (number) Similarity score (0-1)
*/
func calculateGenomeSimilarity aGenome1, aGenome2 {
    if len(aGenome1) = 0 or len(aGenome2) = 0 {
        return 0
    }
    
    nMinLen = min(len(aGenome1), len(aGenome2))
    nMaxLen = max(len(aGenome1), len(aGenome2))
    nMatchCount = 0
    
    # Count matches in the overlapping portion
    for i = 1 to nMinLen {
        if aGenome1[i] = aGenome2[i] {
            nMatchCount++
        }
    }
    
    # Calculate similarity considering length difference
    nBaseSimilarity = nMatchCount / nMinLen
    nLengthPenalty = nMinLen / nMaxLen  # Penalty for length difference
    
    return nBaseSimilarity * nLengthPenalty
}

/*
Function: assessBindingPotential
Description: Assesses the potential for two symbols to bind/mate
Inputs:
    oSym1         : (oMorgenSymbol) First symbol
    oSym2         : (oMorgenSymbol) Second symbol
    oSpaceContext : (oMorgenSpace) The space context for global factors
Outputs: (number) Binding potential score (0-1)
*/
func assessBindingPotential oSym1, oSym2, oSpaceContext {
    if not (isObject(oSym1) and isObject(oSym2) and isObject(oSpaceContext)) {
        return 0
    }
    
    # 1. Distance factor (closer symbols have higher potential)
    nDistance = calculatePolarDistance(oSym1.nRadius, oSym1.nAngle, oSym2.nRadius, oSym2.nAngle)
    nDistanceFactor = 1 / (1 + nDistance)  # Inverse relationship
    
    # 2. Genome compatibility
    nGenomeSimilarity = calculateGenomeSimilarity(oSym1.aGenome, oSym2.aGenome)
    # For geomancy, complementary genomes (1+2=3) are also good
    nComplementarity = 0
    nMinLen = min(len(oSym1.aGenome), len(oSym2.aGenome))
    if nMinLen > 0 {
        nComplementaryCount = 0
        for i = 1 to nMinLen {
            if oSym1.aGenome[i] + oSym2.aGenome[i] = 3 {  # 1+2 or 2+1
                nComplementaryCount++
            }
        }
        nComplementarity = nComplementaryCount / nMinLen
    }
    nGenomeFactor = max(nGenomeSimilarity, nComplementarity)
    
    # 3. Energy compatibility
    nEnergyFactor = min(oSym1.nEnergyLevel, oSym2.nEnergyLevel) / max(oSym1.nEnergyLevel, oSym2.nEnergyLevel)
    
    # 4. Resonance harmony
    nResonanceHarmony = 1 - fabs(oSym1.nResonance - oSym2.nResonance) / max(oSym1.nResonance, oSym2.nResonance)
    
    # 5. Global resonance influence
    nGlobalFactor = oSpaceContext.nGlobalResonance / 10.0  # Normalize
    if nGlobalFactor > 1 { nGlobalFactor = 1 }
    
    # 6. Type compatibility
    nTypeFactor = 1.0
    if oSym1.cType = oSym2.cType {
        nTypeFactor = 0.8  # Same type is slightly less interesting
    elseif (oSym1.cType = "seed" and oSym2.cType = "seed") 
        nTypeFactor = 1.2  # Seeds mate well with seeds
    }
    
    # Calculate weighted final score
    nFinalScore = (nDistanceFactor * 0.25) + 
                  (nGenomeFactor * 0.30) + 
                  (nEnergyFactor * 0.15) + 
                  (nResonanceHarmony * 0.15) + 
                  (nGlobalFactor * 0.10) + 
                  (nTypeFactor * 0.05)
    
    # Ensure score is in 0-1 range
    if nFinalScore > 1 { nFinalScore = 1 }
    if nFinalScore < 0 { nFinalScore = 0 }
    
    return nFinalScore
}

/*
Function: findBestMatingPairs
Description: Finds the best mating pairs from a list of candidate seeds
Inputs:
    aCandidateSeeds : (list) List of candidate symbols
    oSpaceContext   : (oMorgenSpace) Space context
    nPairsToFind    : (number) Number of pairs to find
Outputs: (list) List of [oSymbol1, oSymbol2, nScore] pairs
*/
func findBestMatingPairs aCandidateSeeds, oSpaceContext, nPairsToFind {
    aPairs = []
    
    if len(aCandidateSeeds) < 2 {
        return aPairs
    }
    
    # Generate all possible pairs and their scores
    aCandidatePairs = []
    for i = 1 to len(aCandidateSeeds) - 1 {
        for j = i + 1 to len(aCandidateSeeds) {
            oSym1 = aCandidateSeeds[i]
            oSym2 = aCandidateSeeds[j]
            
            if isObject(oSym1) and isObject(oSym2) {
                nScore = assessBindingPotential(oSym1, oSym2, oSpaceContext)
                if nScore > 0.1 {  # Minimum threshold
                    add(aCandidatePairs, [oSym1, oSym2, nScore])
                }
            }
        }
    }
    
    # Sort pairs by score (highest first) - simple bubble sort
    for i = 1 to len(aCandidatePairs) - 1 {
        for j = 1 to len(aCandidatePairs) - i {
            if aCandidatePairs[j][3] < aCandidatePairs[j+1][3] {
                temp = aCandidatePairs[j]
                aCandidatePairs[j] = aCandidatePairs[j+1]
                aCandidatePairs[j+1] = temp
            }
        }
    }
    
    # Return the top pairs, avoiding reuse of symbols
    aUsedSymbols = []
    nPairsFound = 0
    
    for aPair in aCandidatePairs {
        if nPairsFound >= nPairsToFind {
            break
        }
        
        oSym1 = aPair[1]
        oSym2 = aPair[2]
        
        # Check if either symbol is already used
        bSym1Used = false
        bSym2Used = false
        
        for cUsedId in aUsedSymbols {
            if oSym1.cId = cUsedId { bSym1Used = true }
            if oSym2.cId = cUsedId { bSym2Used = true }
        }
        
        if not (bSym1Used or bSym2Used) {
            add(aPairs, aPair)
            add(aUsedSymbols, oSym1.cId)
            add(aUsedSymbols, oSym2.cId)
            nPairsFound++
        }
    }
    
    return aPairs
}

/*
Function: calculateTriangulationStability
Description: Calculates the stability of a triangulation
Inputs:
    oSym1 : (oMorgenSymbol) First symbol
    oSym2 : (oMorgenSymbol) Second symbol
    oSym3 : (oMorgenSymbol) Third symbol
Outputs: (number) Stability score (0-1)
*/
func calculateTriangulationStability oSym1, oSym2, oSym3 {
    if not (isObject(oSym1) and isObject(oSym2) and isObject(oSym3)) {
        return 0
    }
    
    # Calculate distances between all pairs
    nDist12 = calculatePolarDistance(oSym1.nRadius, oSym1.nAngle, oSym2.nRadius, oSym2.nAngle)
    nDist23 = calculatePolarDistance(oSym2.nRadius, oSym2.nAngle, oSym3.nRadius, oSym3.nAngle)
    nDist31 = calculatePolarDistance(oSym3.nRadius, oSym3.nAngle, oSym1.nRadius, oSym1.nAngle)
    
    # Check if triangle is too degenerate (very unequal sides)
    nMaxDist = max(nDist12, max(nDist23, nDist31))
    nMinDist = min(nDist12, min(nDist23, nDist31))
    
    if nMinDist = 0 or nMaxDist / nMinDist > 10 {
        return 0  # Too degenerate
    }
    
    # Calculate resonance harmony
    nAvgResonance = (oSym1.nResonance + oSym2.nResonance + oSym3.nResonance) / 3
    nResonanceVariance = (pow(oSym1.nResonance - nAvgResonance, 2) + 
                         pow(oSym2.nResonance - nAvgResonance, 2) + 
                         pow(oSym3.nResonance - nAvgResonance, 2)) / 3
    nResonanceStability = 1 / (1 + nResonanceVariance)
    
    # Calculate geometric stability (how close to equilateral)
    nAvgDist = (nDist12 + nDist23 + nDist31) / 3
    nDistVariance = (pow(nDist12 - nAvgDist, 2) + 
                    pow(nDist23 - nAvgDist, 2) + 
                    pow(nDist31 - nAvgDist, 2)) / 3
    nGeometricStability = 1 / (1 + nDistVariance)
    
    # Combine factors
    nStability = (nResonanceStability * 0.6) + (nGeometricStability * 0.4)
    
    return nStability
}
