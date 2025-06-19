# ==============================================================================
# File: insight_engine.ring
# Description: Self-insight and pattern discovery engine for Morgen AI
# Author: Morgen AI Project
# ==============================================================================

load "space.ring"
load "geometry_utils.ring"

# ==============================================================================
# Insight Engine Class
# ==============================================================================

class InsightEngine {
    ### --- Public Attributes & Methods ---
    oMorgenSpace        # Reference to the cognitive space
    aInsightPatterns    # Discovered insight patterns
    aMetaPatterns       # Meta-patterns (patterns of patterns)
    nInsightThreshold   # Threshold for insight recognition
    aInsightHistory     # History of insights discovered

    /*
    Function: init
    Description: Initializes the insight engine
    Inputs:
        oSpace : (oMorgenSpace) The cognitive space
    */
    func init oSpace {
        if not isObject(oSpace) {
            raise("InsightEngine.init: Invalid space object")
        }
        
        self.oMorgenSpace = oSpace
        self.aInsightPatterns = []
        self.aMetaPatterns = []
        self.nInsightThreshold = 0.7
        self.aInsightHistory = []
        
        see "Insight engine initialized" + nl
    }

    /*
    Function: discoverInsights
    Description: Main function to discover insights in the cognitive space
    */
    func discoverInsights {
        see "=== Discovering Insights ===" + nl
        
        # Clear previous insights
        self.aInsightPatterns = []
        
        # Discover different types of insights
        self.discoverResonancePatterns()
        self.discoverGeometricPatterns()
        self.discoverEvolutionaryPatterns()
        self.discoverLinguisticPatterns()
        self.discoverEmergentPatterns()
        
        # Analyze meta-patterns
        self.analyzeMetaPatterns()
        
        # Generate insight waves
        self.generateInsightWaves()
        
        see "Total insights discovered: " + len(self.aInsightPatterns) + nl
        see "Meta-patterns identified: " + len(self.aMetaPatterns) + nl
    }

    /*
    Function: discoverResonancePatterns
    Description: Discovers patterns in symbol resonance
    */
    func discoverResonancePatterns {
        see "  Discovering resonance patterns..." + nl
        
        # Analyze resonance distribution
        aResonanceGroups = []
        
        # Group symbols by resonance levels
        for oSymbol in self.oMorgenSpace.aSymbols {
            if isObject(oSymbol) {
                nResonanceLevel = floor(oSymbol.nResonance)
                bGroupFound = false
                
                for aGroup in aResonanceGroups {
                    if aGroup[1] = nResonanceLevel {
                        add(aGroup[2], oSymbol)
                        bGroupFound = true
                        break
                    }
                }
                
                if not bGroupFound {
                    add(aResonanceGroups, [nResonanceLevel, [oSymbol]])
                }
            }
        }
        
        # Analyze each resonance group for patterns
        for aGroup in aResonanceGroups {
            nLevel = aGroup[1]
            aSymbols = aGroup[2]
            
            if len(aSymbols) >= 3 {  # Need minimum symbols for pattern
                # Check for geometric clustering
                nAvgDistance = self.calculateAverageDistance(aSymbols)
                
                if nAvgDistance < 0.3 {  # Clustered pattern
                    oPattern = self.createInsightPattern("resonance_cluster", 
                                                        "Symbols with resonance " + nLevel + " form geometric cluster",
                                                        aSymbols, 0.8)
                    add(self.aInsightPatterns, oPattern)
                    
                    see "    Found resonance cluster pattern (level " + nLevel + ", " + len(aSymbols) + " symbols)" + nl
                }
            }
        }
    }

    /*
    Function: discoverGeometricPatterns
    Description: Discovers geometric patterns in symbol arrangements
    */
    func discoverGeometricPatterns {
        see "  Discovering geometric patterns..." + nl
        
        # Look for spiral patterns
        self.detectSpiralPatterns()
        
        # Look for radial patterns
        self.detectRadialPatterns()
        
        # Look for fractal patterns
        self.detectFractalPatterns()
    }

    /*
    Function: detectSpiralPatterns
    Description: Detects spiral arrangements of symbols
    */
    func detectSpiralPatterns {
        # Group symbols by radius ranges
        aRadiusGroups = []
        
        for nRadius = 0.1 to 1.0 step 0.2 {
            aGroupSymbols = []
            
            for oSymbol in self.oMorgenSpace.aSymbols {
                if isObject(oSymbol) and oSymbol.nRadius >= nRadius and oSymbol.nRadius < nRadius + 0.2 {
                    add(aGroupSymbols, oSymbol)
                }
            }
            
            if len(aGroupSymbols) >= 4 {
                add(aRadiusGroups, [nRadius, aGroupSymbols])
            }
        }
        
        # Check for spiral ordering within each radius group
        for aGroup in aRadiusGroups {
            nRadius = aGroup[1]
            aSymbols = aGroup[2]
            
            # Sort symbols by angle
            for i = 1 to len(aSymbols) - 1 {
                for j = 1 to len(aSymbols) - i {
                    if aSymbols[j].nAngle > aSymbols[j+1].nAngle {
                        temp = aSymbols[j]
                        aSymbols[j] = aSymbols[j+1]
                        aSymbols[j+1] = temp
                    }
                }
            }
            
            # Check for consistent angular spacing (spiral pattern)
            if len(aSymbols) >= 4 {
                nTotalAngleDiff = 0
                for i = 1 to len(aSymbols) - 1 {
                    nAngleDiff = aSymbols[i+1].nAngle - aSymbols[i].nAngle
                    nTotalAngleDiff += nAngleDiff
                }
                
                nAvgAngleDiff = nTotalAngleDiff / (len(aSymbols) - 1)
                
                # Check if spacing is relatively uniform (spiral-like)
                if nAvgAngleDiff > 30 and nAvgAngleDiff < 120 {
                    oPattern = self.createInsightPattern("spiral_arrangement",
                                                        "Symbols form spiral pattern at radius " + nRadius,
                                                        aSymbols, 0.75)
                    add(self.aInsightPatterns, oPattern)
                    
                    see "    Found spiral pattern (radius " + nRadius + ", " + len(aSymbols) + " symbols)" + nl
                }
            }
        }
    }

    /*
    Function: detectRadialPatterns
    Description: Detects radial patterns emanating from center
    */
    func detectRadialPatterns {
        # Group symbols by angle ranges
        for nAngle = 0 to 315 step 45 {
            aRadialSymbols = []
            
            for oSymbol in self.oMorgenSpace.aSymbols {
                if isObject(oSymbol) {
                    nSymbolAngle = oSymbol.nAngle
                    if nSymbolAngle >= nAngle and nSymbolAngle < nAngle + 45 {
                        add(aRadialSymbols, oSymbol)
                    }
                }
            }
            
            if len(aRadialSymbols) >= 3 {
                # Sort by radius
                for i = 1 to len(aRadialSymbols) - 1 {
                    for j = 1 to len(aRadialSymbols) - i {
                        if aRadialSymbols[j].nRadius > aRadialSymbols[j+1].nRadius {
                            temp = aRadialSymbols[j]
                            aRadialSymbols[j] = aRadialSymbols[j+1]
                            aRadialSymbols[j+1] = temp
                        }
                    }
                }
                
                # Check for consistent radial progression
                bConsistentProgression = true
                for i = 1 to len(aRadialSymbols) - 1 {
                    nRadiusDiff = aRadialSymbols[i+1].nRadius - aRadialSymbols[i].nRadius
                    if nRadiusDiff < 0.1 {  # Too close
                        bConsistentProgression = false
                        break
                    }
                }
                
                if bConsistentProgression {
                    oPattern = self.createInsightPattern("radial_progression",
                                                        "Symbols form radial progression at angle " + nAngle,
                                                        aRadialSymbols, 0.7)
                    add(self.aInsightPatterns, oPattern)
                    
                    see "    Found radial pattern (angle " + nAngle + "°, " + len(aRadialSymbols) + " symbols)" + nl
                }
            }
        }
    }

    /*
    Function: detectFractalPatterns
    Description: Detects fractal-like patterns in symbol arrangements
    */
    func detectFractalPatterns {
        # Look for self-similar patterns at different scales
        aScales = [0.2, 0.4, 0.6, 0.8]
        
        for nScale in aScales {
            aScaleSymbols = []
            
            for oSymbol in self.oMorgenSpace.aSymbols {
                if isObject(oSymbol) and oSymbol.nRadius <= nScale {
                    add(aScaleSymbols, oSymbol)
                }
            }
            
            if len(aScaleSymbols) >= 5 {
                # Check for fractal complexity in genomes
                nTotalComplexity = 0
                for oSymbol in aScaleSymbols {
                    nTotalComplexity += oSymbol.getFractalComplexity()
                }
                
                nAvgComplexity = nTotalComplexity / len(aScaleSymbols)
                
                if nAvgComplexity > 3.0 {  # High fractal complexity
                    oPattern = self.createInsightPattern("fractal_complexity",
                                                        "High fractal complexity at scale " + nScale,
                                                        aScaleSymbols, 0.85)
                    add(self.aInsightPatterns, oPattern)
                    
                    see "    Found fractal pattern (scale " + nScale + ", complexity " + nAvgComplexity + ")" + nl
                }
            }
        }
    }

    /*
    Function: discoverEvolutionaryPatterns
    Description: Discovers patterns in symbol evolution
    */
    func discoverEvolutionaryPatterns {
        see "  Discovering evolutionary patterns..." + nl
        
        # Analyze offspring relationships
        aOffspringChains = []
        
        for oSymbol in self.oMorgenSpace.aSymbols {
            if isObject(oSymbol) and (oSymbol.cType = "offspring" or oSymbol.cType = "seed_offspring") {
                # Trace back to parents
                aChain = [oSymbol]
                
                for oSubSymbol in oSymbol.aSubSymbols {
                    if isObject(oSubSymbol) {
                        add(aChain, oSubSymbol)
                    }
                }
                
                if len(aChain) >= 3 {  # Symbol + 2 parents minimum
                    add(aOffspringChains, aChain)
                }
            }
        }
        
        if len(aOffspringChains) >= 2 {
            oPattern = self.createInsightPattern("evolutionary_chains",
                                                "Multiple evolutionary chains detected",
                                                aOffspringChains, 0.8)
            add(self.aInsightPatterns, oPattern)
            
            see "    Found evolutionary pattern (" + len(aOffspringChains) + " chains)" + nl
        }
    }

    /*
    Function: discoverLinguisticPatterns
    Description: Discovers patterns in linguistic symbols
    */
    func discoverLinguisticPatterns {
        see "  Discovering linguistic patterns..." + nl
        
        # Count different linguistic symbol types
        nArabicLetters = 0
        nArabicWords = 0
        nRoots = 0
        nMeanings = 0
        
        for oSymbol in self.oMorgenSpace.aSymbols {
            if isObject(oSymbol) {
                if oSymbol.cType = "arabic_letter" {
                    nArabicLetters++
                elseif oSymbol.cType = "arabic_word" 
                    nArabicWords++
                elseif oSymbol.cType = "triconsonantal_root" 
                    nRoots++
                elseif oSymbol.cType = "text_meaning" 
                    nMeanings++
                }
            }
        }
        
        # Analyze linguistic ecosystem balance
        nTotalLinguistic = nArabicLetters + nArabicWords + nRoots + nMeanings
        
        if nTotalLinguistic > 0 {
            nLetterRatio = nArabicLetters / nTotalLinguistic
            nWordRatio = nArabicWords / nTotalLinguistic
            nRootRatio = nRoots / nTotalLinguistic
            nMeaningRatio = nMeanings / nTotalLinguistic
            
            # Check for balanced linguistic ecosystem
            if nLetterRatio > 0.2 and nWordRatio > 0.1 and nRootRatio > 0.05 {
                aLinguisticSymbols = []
                for oSymbol in self.oMorgenSpace.aSymbols {
                    if isObject(oSymbol) and (oSymbol.cType = "arabic_letter" or 
                                             oSymbol.cType = "arabic_word" or 
                                             oSymbol.cType = "triconsonantal_root" or 
                                             oSymbol.cType = "text_meaning") {
                        add(aLinguisticSymbols, oSymbol)
                    }
                }
                
                oPattern = self.createInsightPattern("linguistic_ecosystem",
                                                    "Balanced linguistic ecosystem detected",
                                                    aLinguisticSymbols, 0.9)
                add(self.aInsightPatterns, oPattern)
                
                see "    Found linguistic ecosystem pattern (" + nTotalLinguistic + " symbols)" + nl
            }
        }
    }

    /*
    Function: discoverEmergentPatterns
    Description: Discovers emergent patterns from triangulations and condensations
    */
    func discoverEmergentPatterns {
        see "  Discovering emergent patterns..." + nl
        
        # Analyze triangulation networks
        if len(self.oMorgenSpace.aTriangulations) >= 2 {
            # Check for triangulation clusters
            aTriangulationClusters = self.findTriangulationClusters()
            
            for aCluster in aTriangulationClusters {
                if len(aCluster) >= 3 {
                    oPattern = self.createInsightPattern("triangulation_network",
                                                        "Triangulation network cluster detected",
                                                        aCluster, 0.85)
                    add(self.aInsightPatterns, oPattern)
                    
                    see "    Found triangulation network (" + len(aCluster) + " triangulations)" + nl
                }
            }
        }
        
        # Analyze condensed symbol patterns
        aCondensedSymbols = []
        for oSymbol in self.oMorgenSpace.aSymbols {
            if isObject(oSymbol) and oSymbol.nCondensationValue > 0 {
                add(aCondensedSymbols, oSymbol)
            }
        }
        
        if len(aCondensedSymbols) >= 2 {
            oPattern = self.createInsightPattern("condensation_emergence",
                                                "Multiple condensed symbols indicate meaning emergence",
                                                aCondensedSymbols, 0.9)
            add(self.aInsightPatterns, oPattern)
            
            see "    Found condensation emergence pattern (" + len(aCondensedSymbols) + " condensed symbols)" + nl
        }
    }

    /*
    Function: createInsightPattern
    Description: Creates an insight pattern object
    */
    func createInsightPattern cType, cDescription, aRelatedSymbols, nConfidence {
        oPattern = [
            "type" = cType,
            "description" = cDescription,
            "symbols" = aRelatedSymbols,
            "confidence" = nConfidence,
            "timestamp" = self.oMorgenSpace.nEpoch,
            "id" = "insight_" + cType + "_" + random(1000)
        ]
        
        return oPattern
    }

    /*
    Function: calculateAverageDistance
    Description: Calculates average distance between symbols
    */
    func calculateAverageDistance aSymbols {
        if len(aSymbols) < 2 {
            return 0
        }
        
        nTotalDistance = 0
        nComparisons = 0
        
        for i = 1 to len(aSymbols) - 1 {
            for j = i + 1 to len(aSymbols) {
                nDistance = calculatePolarDistance(aSymbols[i].nRadius, aSymbols[i].nAngle,
                                                 aSymbols[j].nRadius, aSymbols[j].nAngle)
                nTotalDistance += nDistance
                nComparisons++
            }
        }
        
        return nTotalDistance / nComparisons
    }

    /*
    Function: findTriangulationClusters
    Description: Finds clusters of connected triangulations
    */
    func findTriangulationClusters {
        aClusters = []
        aProcessed = []
        
        for oTriangulation in self.oMorgenSpace.aTriangulations {
            if find(aProcessed, oTriangulation["id"]) = 0 {
                aCluster = [oTriangulation]
                add(aProcessed, oTriangulation["id"])
                
                # Find connected triangulations (sharing symbols)
                self.expandTriangulationCluster(aCluster, aProcessed, oTriangulation)
                
                add(aClusters, aCluster)
            }
        }
        
        return aClusters
    }

    /*
    Function: expandTriangulationCluster
    Description: Recursively expands a triangulation cluster
    */
    func expandTriangulationCluster aCluster, aProcessed, oCurrentTriangulation {
        for oOtherTriangulation in self.oMorgenSpace.aTriangulations {
            if find(aProcessed, oOtherTriangulation["id"]) = 0 {
                # Check if triangulations share symbols
                if self.triangulationsShareSymbols(oCurrentTriangulation, oOtherTriangulation) {
                    add(aCluster, oOtherTriangulation)
                    add(aProcessed, oOtherTriangulation["id"])
                    
                    # Recursively expand
                    self.expandTriangulationCluster(aCluster, aProcessed, oOtherTriangulation)
                }
            }
        }
    }

    /*
    Function: triangulationsShareSymbols
    Description: Checks if two triangulations share any symbols
    */
    func triangulationsShareSymbols oTri1, oTri2 {
        for cSymbolId1 in oTri1["symbols"] {
            for cSymbolId2 in oTri2["symbols"] {
                if cSymbolId1 = cSymbolId2 {
                    return true
                }
            }
        }
        return false
    }

    /*
    Function: analyzeMetaPatterns
    Description: Analyzes patterns of patterns (meta-patterns)
    */
    func analyzeMetaPatterns {
        see "  Analyzing meta-patterns..." + nl
        
        self.aMetaPatterns = []
        
        if len(self.aInsightPatterns) >= 3 {
            # Group patterns by type
            aPatternTypes = []
            
            for oPattern in self.aInsightPatterns {
                cType = oPattern["type"]
                bTypeFound = false
                
                for aTypeGroup in aPatternTypes {
                    if aTypeGroup[1] = cType {
                        add(aTypeGroup[2], oPattern)
                        bTypeFound = true
                        break
                    }
                }
                
                if not bTypeFound {
                    add(aPatternTypes, [cType, [oPattern]])
                }
            }
            
            # Analyze each type group
            for aTypeGroup in aPatternTypes {
                cType = aTypeGroup[1]
                aPatterns = aTypeGroup[2]
                
                if len(aPatterns) >= 2 {
                    oMetaPattern = [
                        "type" = "meta_" + cType,
                        "description" = "Multiple instances of " + cType + " patterns",
                        "patterns" = aPatterns,
                        "frequency" = len(aPatterns),
                        "confidence" = min(0.95, len(aPatterns) * 0.2)
                    ]
                    
                    add(self.aMetaPatterns, oMetaPattern)
                    
                    see "    Found meta-pattern: " + cType + " (" + len(aPatterns) + " instances)" + nl
                }
            }
        }
    }

    /*
    Function: generateInsightWaves
    Description: Generates insight waves based on discovered patterns
    */
    func generateInsightWaves {
        see "  Generating insight waves..." + nl
        
        nWavesGenerated = 0
        
        for oPattern in self.aInsightPatterns {
            if oPattern["confidence"] > 0.8 {
                # Find a representative symbol for wave generation
                aSymbols = oPattern["symbols"]
                
                if len(aSymbols) > 0 {
                    oSourceSymbol = aSymbols[1]
                    
                    # Find highest resonance symbol in pattern
                    for oSymbol in aSymbols {
                        if isObject(oSymbol) and oSymbol.nResonance > oSourceSymbol.nResonance {
                            oSourceSymbol = oSymbol
                        }
                    }
                    
                    if isObject(oSourceSymbol) {
                        nWaveEnergy = oPattern["confidence"] * 0.8
                        self.oMorgenSpace.initiateWave(oSourceSymbol, "insight_wave", nWaveEnergy)
                        nWavesGenerated++
                    }
                }
            }
        }
        
        see "    Generated " + nWavesGenerated + " insight waves" + nl
    }

    /*
    Function: getInsightSummary
    Description: Returns a summary of discovered insights
    */
    func getInsightSummary {
        see nl + "=== Insight Summary ===" + nl
        see "Total patterns discovered: " + len(self.aInsightPatterns) + nl
        see "Meta-patterns identified: " + len(self.aMetaPatterns) + nl
        
        if len(self.aInsightPatterns) > 0 {
            see nl + "Pattern types:" + nl
            
            aTypeCounts = []
            for oPattern in self.aInsightPatterns {
                cType = oPattern["type"]
                bFound = false
                
                for aTypeCount in aTypeCounts {
                    if aTypeCount[1] = cType {
                        aTypeCount[2]++
                        bFound = true
                        break
                    }
                }
                
                if not bFound {
                    add(aTypeCounts, [cType, 1])
                }
            }
            
            for aTypeCount in aTypeCounts {
                see "  " + aTypeCount[1] + ": " + aTypeCount[2] + " instances" + nl
            }
        }
        
        # Calculate overall insight score
        nTotalConfidence = 0
        for oPattern in self.aInsightPatterns {
            nTotalConfidence += oPattern["confidence"]
        }
        
        nInsightScore = 0
        if len(self.aInsightPatterns) > 0 {
            nInsightScore = nTotalConfidence / len(self.aInsightPatterns)
        }
        
        see nl + "Overall insight score: " + nInsightScore + nl
        
        return nInsightScore
    }

}
