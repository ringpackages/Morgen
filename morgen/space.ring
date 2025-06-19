# ==============================================================================
# File: space.ring
# Description: Implementation of the MorgenSpace class for the Morgen AI paradigm
# Author: Morgen AI Project
# ==============================================================================

load "symbol.ring"
load "relation.ring"
load "geometry_utils.ring"

# ==============================================================================
# Class: MorgenSpace (Cognitive Space)
# ==============================================================================
class MorgenSpace {
    ### --- Public Attributes & Methods ---
    aSymbols        # List of all symbols in the space
    aRelations      # List of all relations in the space
    nEpoch          # Current epoch (time step)
    nHornDepth      # Depth parameter for the Gabriel's Horn model
    aWaveFronts     # List of active wave fronts in the space
    aTriangulations # List of triangulations in the space
    aGalaxies       # List of galactic clusters in the space
    aComplexes      # List of higher-order complexes in the space
    nGlobalResonance # Global resonance of the entire space
    # Dream cycle buffers
    aDreamBuffer_Seeds      # Buffer for seeds during dream cycle
    aDreamBuffer_Candidates # Buffer for candidate symbols during dream cycle

    /*
    Function: init
    Description: Constructor for MorgenSpace object
    Inputs:
        nHornDepth_ : (number) Depth parameter for Gabriel's Horn model
    */
    func init nHornDepth_ {
        self.aSymbols = []
        self.aRelations = []
        self.nEpoch = 0
        self.nHornDepth = nHornDepth_
        self.aWaveFronts = []
        self.aTriangulations = []
        self.aGalaxies = []
        self.aComplexes = []
        self.nGlobalResonance = 1.0
        self.aDreamBuffer_Seeds = []
        self.aDreamBuffer_Candidates = []

        see "Morgen Cognitive Space initialized." + nl
        see "Morgen Cognitive Space initialized with Horn Depth: " + self.nHornDepth + nl + nl
    }

    /*
    Function: addSymbol
    Description: Adds a new living symbol to the Morgen space
    Inputs:
        oSymbol : (MorgenSymbol) The symbol to be added
    */
    func addSymbol oSymbol {
        if not isObject(oSymbol) {
            raise("MorgenSpace.addSymbol: Must add an MorgenSymbol object")
        }
        add(self.aSymbols, oSymbol)
        # Here we could add "triangulation" logic or connect the new symbol to nearby symbols
        # In a simplified way, we'll connect it to the last symbol if it exists
        if len(self.aSymbols) > 1 {
            oLastSymbol = self.aSymbols[len(self.aSymbols)-1]
            oSymbol.addRelation(oLastSymbol, "sequential_addition", 0.5, null)
            oLastSymbol.addRelation(oSymbol, "precedes", 0.5, null)
        }
    }

    /*
    Function: display
    Description: Displays the contents of the Morgen space
    */
    func display {
        see "=== Morgen Space Contents (Epoch: " + self.nEpoch + ") ===" + nl
        for oSymbol in self.aSymbols {
            oSymbol.display()
        }
    }

    /*
    Function: findNearbySymbols
    Description: Finds symbols near a given position in the space
    Inputs:
        nRadius    : (number) Target radius
        nAngle     : (number) Target angle
        nTolerance : (number) Distance tolerance
    Outputs: (list) List of nearby symbols
    */
    func findNearbySymbols nRadius, nAngle, nTolerance {
        aNearby = []
        for oSymbol in self.aSymbols {
            # Calculate Euclidean distance in polar coordinates
            # Convert to Cartesian first
            x1 = nRadius * cos(nAngle * PI / 180)
            y1 = nRadius * sin(nAngle * PI / 180)
            x2 = oSymbol.nRadius * cos(oSymbol.nAngle * PI / 180)
            y2 = oSymbol.nRadius * sin(oSymbol.nAngle * PI / 180)

            # Calculate distance
            nDistance = sqrt(pow(x2-x1, 2) + pow(y2-y1, 2))

            if nDistance <= nTolerance {
                add(aNearby, oSymbol)
            }
        }

        # Display results
        if len(aNearby) > 0 {
            for oFound in aNearby {
                see "Found: " + oFound.cId + " (radius: " + oFound.nRadius + ", angle: " + oFound.nAngle + ")" + nl
            }
        else
            see "No nearby symbols found." + nl
        }

        return aNearby
    }

    /*
    Function: getMostEssentialSymbol
    Description: Returns the symbol closest to Center 0 (most essential)
    Outputs: (MorgenSymbol) The most essential symbol
    */
    func getMostEssentialSymbol {
        if len(self.aSymbols) = 0 {
            return null
        }

        oMostEssential = self.aSymbols[1]
        for oSymbol in self.aSymbols {
            if oSymbol.nRadius < oMostEssential.nRadius {
                oMostEssential = oSymbol
            }
        }

        return oMostEssential
    }

    /*
    Function: createTriangulation
    Description: Creates a triangular relationship between three symbols
    Inputs:
        oSymbol1      : (MorgenSymbol) First symbol
        oSymbol2      : (MorgenSymbol) Second symbol
        oSymbol3      : (MorgenSymbol) Third symbol
        cTriangleType : (string) Type of triangulation
    */
    func createTriangulation oSymbol1, oSymbol2, oSymbol3, cTriangleType {
        # Validate inputs
        if not (isObject(oSymbol1) and isObject(oSymbol2) and isObject(oSymbol3)) {
            see "All elements must be MorgenSymbol objects." + nl
            return
        }

        # Create a triangle data structure
        oTriangleData = [
            "type"= cTriangleType,
            "symbols"= [oSymbol1.cId, oSymbol2.cId, oSymbol3.cId],
            "center_radius"= (oSymbol1.nRadius + oSymbol2.nRadius + oSymbol3.nRadius) / 3,
            "center_angle"= (oSymbol1.nAngle + oSymbol2.nAngle + oSymbol3.nAngle) / 3
        ]

        # Add to triangulations list
        add(self.aTriangulations, oTriangleData)

        # Base strength for triangle edges
        nBaseStrength = 0.8

        # Create the triangle edges (bidirectional relations between all symbols)
        # Edge 1-2
        oSymbol1.addRelation(oSymbol2, "triangle_" + cTriangleType + "_edge", nBaseStrength, null)
        oSymbol2.addRelation(oSymbol1, "triangle_" + cTriangleType + "_edge", nBaseStrength, null)

        # Edge 2-3
        oSymbol2.addRelation(oSymbol3, "triangle_" + cTriangleType + "_edge", nBaseStrength, null)
        oSymbol3.addRelation(oSymbol2, "triangle_" + cTriangleType + "_edge", nBaseStrength, null)

        # Edge 3-1
        oSymbol3.addRelation(oSymbol1, "triangle_" + cTriangleType + "_edge", nBaseStrength, null)
        oSymbol1.addRelation(oSymbol3, "triangle_" + cTriangleType + "_edge", nBaseStrength, null)

        # Add a special relation to each symbol pointing to the triangle center
        oSymbol1.addRelation(oSymbol2, "triangle_" + cTriangleType + "_member", 0.8, oTriangleData)
        oSymbol2.addRelation(oSymbol3, "triangle_" + cTriangleType + "_member", 0.8, oTriangleData)
        oSymbol3.addRelation(oSymbol1, "triangle_" + cTriangleType + "_member", 0.8, oTriangleData)

        see "Created triangulation '" + cTriangleType + "' between symbols: " +
            oSymbol1.cId + ", " + oSymbol2.cId + ", " + oSymbol3.cId + nl
    }

    /*
    Function: dreamCycle
    Description: Runs a dream cycle (Ḥall + Lamm + Ḥulm) between two symbols
    Inputs:
        oSymbol1 : (MorgenSymbol) First symbol
        oSymbol2 : (MorgenSymbol) Second symbol
    */
    func dreamCycle oSymbol1, oSymbol2 {
        # Increment epoch
        self.nEpoch++

        # Add memory management - limit total symbols
        if len(self.aSymbols) > 50 {  # Set a reasonable limit
            # Remove oldest or least essential symbols
            self.pruneSymbols(10)  # Remove 10 least essential symbols
        }

        # --- "Ḥall" Phase (Decomposition/Analysis) ---
        see "--- Starting Dream Cycle #" + self.nEpoch + " ---" + nl
        see "  [Ḥall]: Analyzing symbols " + oSymbol1.cId + " and " + oSymbol2.cId + nl

        # --- "Lamm" Phase (Recombination/Association) ---
        see "  [Lamm]: Attempting to mate " + oSymbol1.cId + " and " + oSymbol2.cId + nl

        # Create a new genome by combining the parent genomes
        aChildGenome = []
        nMinLen = min(len(oSymbol1.aGenome), len(oSymbol2.aGenome))

        # For each gene position, combine the genes from both parents
        for i = 1 to nMinLen {
            nGeneSum = oSymbol1.aGenome[i] + oSymbol2.aGenome[i]

            # Apply a simple genetic algorithm with some randomness
            if nGeneSum % 2 = 1 { # Odd
                add(aChildGenome, floor(nGeneSum / 2) + (random(2)-1) ) # Value close to average with simple randomness
            else  # Even
                if ceil(nGeneSum / 2) * random(2) = 1 {
                    add(aChildGenome, 1)
                else
                    add(aChildGenome, -1)
                }  # Value close to average with possible sign change
            }
        }

        # Add remaining genes from the longer genome (if lengths differ) with a simple mutation
        if len(oSymbol1.aGenome) > nMinLen {
            for i = nMinLen + 1 to len(oSymbol1.aGenome) { add(aChildGenome, oSymbol1.aGenome[i] + (random(3)-2)) } # Mutation
        elseif len(oSymbol2.aGenome) > nMinLen
            for i = nMinLen + 1 to len(oSymbol2.aGenome) { add(aChildGenome, oSymbol2.aGenome[i] + (random(3)-2)) } # Mutation
        }

        if len(aChildGenome) = 0 { # If unable to form a genome
             see "  [Lamm]: Mating failed (no genome formed)." + nl
        else
             # --- "Ḥulm" Phase (Integration/Synthesis) ---
             # Create the new symbol (dream/initial idea)
             cChildId = "dream_" + oSymbol1.cId + "_" + oSymbol2.cId + "_" + self.nEpoch
             # The new position of the "dream" symbol will be the average between parents with a bias toward the center (greater depth)
             nChildRadius = ((oSymbol1.nRadius + oSymbol2.nRadius) / 2) * 0.8 # Closer to center
             if nChildRadius < 0.01 { nChildRadius = 0.01 }
             nChildAngle = (oSymbol1.nAngle + oSymbol2.nAngle) / 2 # Average angle

             oChildSymbol = new MorgenSymbol(cChildId, "dream_artifact", aChildGenome, nChildRadius, nChildAngle, null)
             see "  [Ḥulm]: Generated new dream symbol: " + oChildSymbol.cId + nl
             oChildSymbol.addRelation(oSymbol1, "parent_A", 0.9, null)
             oChildSymbol.addRelation(oSymbol2, "parent_B", 0.9, null)
             self.addSymbol(oChildSymbol) # Add the new symbol to the space (it becomes part of the memory)
        }

        see "--- End of Dream Cycle #" + self.nEpoch + " ---" + nl
    }

    /*
    Function: calculateRamanujanSymbolicSum
    Description: Creates a new symbol that represents a "Ramanujan-like" insight from multiple symbols
    Inputs:
        aSymbols : (list) List of symbols to combine
    */
    func calculateRamanujanSymbolicSum aSymbols {
        # Validate inputs
        for oSym in aSymbols {
            if not isObject(oSym) {
                see "Ramanujan symbolic sum requires all elements to be MorgenSymbol objects." + nl
                return null
            }
        }

        # We need at least 2 symbols
        if len(aSymbols) < 2 {
            see "Need at least 2 symbols for Ramanujan symbolic sum." + nl
            return null
        }

        # Find the maximum genome length
        nMaxGenomeLen = 0
        for oSym in aSymbols {
            if len(oSym.aGenome) > nMaxGenomeLen {
                nMaxGenomeLen = len(oSym.aGenome)
            }
        }

        # Create pattern counts for each position
        aPatternCounts = []
        for i = 1 to nMaxGenomeLen {
            add(aPatternCounts, [0, 0, 0])  # Counts for values 0, 1, 2
        }

        # Count patterns at each position
        for oSym in aSymbols {
            for i = 1 to len(oSym.aGenome) {
                nVal = oSym.aGenome[i]
                if nVal = 1 {
                    aPatternCounts[i][1]++
                elseif nVal = 2
                    aPatternCounts[i][2]++
                }
            }
        }

        # Create a new genome based on pattern analysis
        aNewGenome = []
        for i = 1 to nMaxGenomeLen {
            nCount1 = aPatternCounts[i][1]
            nCount2 = aPatternCounts[i][2]

            if nCount1 > nCount2 {
                # Value 1 is dominant
                add(aNewGenome, 1)
            elseif nCount2 > nCount1
                # Value 2 is dominant
                add(aNewGenome, 2)
            else
                # Equal counts - apply a "Ramanujan insight" by looking at position
                # Ramanujan often found patterns related to position/sequence
                if i % 3 = 0 {  # Every third position gets a special treatment
                    add(aNewGenome, 2)  # Arbitrary choice for demonstration
                else
                    add(aNewGenome, 1)
                }
            }
        }

        # Create the new symbol
        cNewId = "ramanujan_insight_" + self.nEpoch
        # Position it closer to Center 0 than any of the input symbols
        nMinRadius = 1.0
        nAvgAngle = 0

        for oSym in aSymbols {
            if oSym.nRadius < nMinRadius {
                nMinRadius = oSym.nRadius
            }
            nAvgAngle += oSym.nAngle
        }

        nAvgAngle = nAvgAngle / len(aSymbols)
        nNewRadius = nMinRadius * 0.7  # Closer to center than any input symbol

        # Create the new symbol
        oNewSymbol = new MorgenSymbol(cNewId, "ramanujan_insight", aNewGenome, nNewRadius, nAvgAngle, null)

        # Create relations to all input symbols
        for oSym in aSymbols {
            oNewSymbol.addRelation(oSym, "ramanujan_source", 0.9, null)
            oSym.addRelation(oNewSymbol, "ramanujan_essence", 0.9, null)
        }

        # Add to space
        self.addSymbol(oNewSymbol)

        return oNewSymbol
    }

    /*
    Function: initiateWave
    Description: Initiates a wave from a source symbol
    Inputs:
        oSourceSymbol : (oMorgenSymbol) Source symbol
        cWaveType     : (string) Type of wave
        nInitialEnergy: (number) Initial energy of the wave
    */
    func initiateWave oSourceSymbol, cWaveType, nInitialEnergy {
        if not isObject(oSourceSymbol) {
            see "Wave source must be an oMorgenSymbol object." + nl
            return
        }

        see "Wave " + (len(self.aWaveFronts) + 1) + " of type '" + cWaveType +
            "' initiated from symbol " + oSourceSymbol.cId + " with energy " + nInitialEnergy + nl

        # Create a new wave front
        nWaveId = len(self.aWaveFronts) + 1
        oWave = [
            "id"= nWaveId,
            "type"= cWaveType,
            "source"= oSourceSymbol.cId,
            "energy"= nInitialEnergy,
            "radius"= 0.1,  # Initial radius of the wave (small)
            "affected_symbols"= [oSourceSymbol.cId],
            "epoch_started"= self.nEpoch,
            "active"= true
        ]

        add(self.aWaveFronts, oWave)
        see "Initiated wave #" + nWaveId + " from symbol " + oSourceSymbol.cId + nl
    }

    /*
    Function: propagateWaves
    Description: Propagates all active waves through the cognitive space
    */
    func propagateWaves {
        nActiveWaves = 0
        for oWave in self.aWaveFronts {
            if oWave["active"] = true {
                nActiveWaves++
            }
        }

        see "Propagating " + nActiveWaves + " wave fronts through the cognitive space..." + nl

        # For each active wave
        for i = 1 to len(self.aWaveFronts) {
            oWave = self.aWaveFronts[i]

            if oWave["active"] = true {
                # Expand the wave radius
                oWave["radius"] += 0.1

                # Reduce energy with distance (inverse square law)
                oWave["energy"] *= 0.9

                # If energy is too low, deactivate the wave
                if oWave["energy"] < 0.1 {
                    oWave["active"] = false
                    continue
                }

                # Find symbols affected by the wave
                for oSymbol in self.aSymbols {
                    # Skip symbols already affected by this wave
                    if find(oWave["affected_symbols"], oSymbol.cId) > 0 {
                        continue
                    }

                    # Check if symbol is within the wave radius
                    nDistance = abs(oSymbol.nRadius - oWave["radius"])
                    if nDistance < 0.1 {
                        # Symbol is affected by the wave
                        add(oWave["affected_symbols"], oSymbol.cId)

                        # Apply wave effect to the symbol
                        # Different wave types have different effects
                        if oWave["type"] = "insight_wave" {
                            # Insight waves move symbols slightly toward Center 0
                            oSymbol.moveTowardCenter(oWave["energy"] * 0.1)
                        elseif oWave["type"] = "question_wave"
                            # Question waves slightly evolve the symbol's genome
                            oSymbol.evolveGenome(oWave["energy"] * 0.2)
                        }
                    }
                }

                # Update the wave in the list
                self.aWaveFronts[i] = oWave
            }
        }
    }

    /*
    Function: organizeGalacticClusters
    Description: Organizes symbols into galaxy-like clusters
    */
    func organizeGalacticClusters {
        see "Organizing symbols into galactic clusters..." + nl

        # Reset galaxies
        self.aGalaxies = []

        # Find potential galactic cores (symbols with high resonance)
        aPotentialCores = []
        for oSymbol in self.aSymbols {
            if oSymbol.nResonance > 3.0 {
                add(aPotentialCores, oSymbol)
            }
        }

        # Sort potential cores by resonance (highest first)
        # Simple bubble sort
        for i = 1 to len(aPotentialCores) - 1 {
            for j = 1 to len(aPotentialCores) - i {
                if aPotentialCores[j].nResonance < aPotentialCores[j+1].nResonance {
                    temp = aPotentialCores[j]
                    aPotentialCores[j] = aPotentialCores[j+1]
                    aPotentialCores[j+1] = temp
                }
            }
        }

        # Create galaxies around cores
        for oCore in aPotentialCores {
            # Create a new galaxy cluster
            oCluster = [
                "core"= oCore.cId,
                "members"= [oCore.cId],
                "radius"= oCore.nRadius * 2,  # Cluster radius
                "center_angle"= oCore.nAngle,
                "total_resonance"= oCore.nResonance
            ]

            # Find members for this galaxy
            for oMember in self.aSymbols {
                # Skip the core itself
                if oMember.cId = oCore.cId {
                    continue
                }

                # Check if this symbol is within the galaxy's influence
                # Convert to Cartesian for distance calculation
                x1 = oCore.nRadius * cos(oCore.nAngle * PI / 180)
                y1 = oCore.nRadius * sin(oCore.nAngle * PI / 180)
                x2 = oMember.nRadius * cos(oMember.nAngle * PI / 180)
                y2 = oMember.nRadius * sin(oMember.nAngle * PI / 180)

                nDistance = sqrt(pow(x2-x1, 2) + pow(y2-y1, 2))

                if nDistance <= oCluster["radius"] {
                    # Add to galaxy
                    oCluster[:members] + oMember.cId
                    oCluster["total_resonance"] += oMember.nResonance

                    # Create bidirectional "galactic" relationships
                    oCore.addRelation(oMember, "galactic_arm", 0.7, null)
                    oMember.addRelation(oCore, "galactic_core", 0.8, null)
                }
            }

            # Only add galaxies with at least 3 members
            if len(oCluster["members"]) >= 3 {
                add(self.aGalaxies, oCluster)
            }
        }

        see "Galactic organization complete. Created " + len(self.aGalaxies) + " cognitive galaxies." + nl
    }

    /*
    Function: createHigherOrderComplex
    Description: Creates a higher-order simplicial complex from a set of symbols
    Inputs:
        aSymbols     : (list) List of symbols to form the complex
        cComplexType : (string) Type of complex
    */
    func createHigherOrderComplex aSymbols, cComplexType {
        # Validate inputs
        for oSym in aSymbols {
            if not isObject(oSym) {
                see "All elements must be oMorgenSymbol objects." + nl
                return null
            }
        }

        # We need at least 4 symbols for a 3-simplex (tetrahedron)
        if len(aSymbols) < 4 {
            see "Need at least 4 symbols for a higher-order complex." + nl
            return null
        }

        # Create a unique ID for this complex
        cComplexId = cComplexType + "_complex_" + self.nEpoch

        # Create the complex structure
        oComplex = [
            "id"= cComplexId,
            "type"= cComplexType,
            "dimension"= len(aSymbols) - 1,  # n-simplex has dimension n
            "symbols"= [],
            "center_radius"= 0,
            "center_angle"= 0
        ]

        # Calculate the center of the complex
        nTotalRadius = 0
        nTotalAngle = 0

        for oSym in aSymbols {
            oComplex[:symbols] + oSym.cId
            nTotalRadius += oSym.nRadius
            nTotalAngle += oSym.nAngle
        }

        oComplex["center_radius"] = nTotalRadius / len(aSymbols)
        oComplex["center_angle"] = nTotalAngle / len(aSymbols)

        # Add to complexes list
        add(self.aComplexes, oComplex)

        # Create relationships between all symbols in the complex
        for i = 1 to len(aSymbols) {
            for j = i + 1 to len(aSymbols) {
                aSymbols[i].addRelation(aSymbols[j], "complex_" + cComplexType, 0.75, oComplex)
                aSymbols[j].addRelation(aSymbols[i], "complex_" + cComplexType, 0.75, oComplex)
            }
        }

        see "Created higher complex with ID: " + cComplexId + nl
        return oComplex
    }

    /*
    Function: adjustRadiusWithHorn
    Description: Adjusts a radius value according to Gabriel's Horn model
    Inputs:
        nStandardRadius : (number) Standard radius value
    Outputs: (number) Horn-adjusted radius
    */
    func adjustRadiusWithHorn nStandardRadius {
        # Gabriel's Horn model: as x approaches infinity, volume is finite but surface area is infinite
        # We invert this: as radius approaches 0, we get a finite volume but infinite surface area
        # This creates a cognitive space where symbols near Center 0 have more "room" for meaning

        # Formula: adjusted_r = 1 - (1 / (1 + (r * horn_depth)))
        nAdjustedRadius = 1 - (1 / (1 + (nStandardRadius * self.nHornDepth)))

        return nAdjustedRadius
    }

    /*
    Function: updateGlobalResonance
    Description: Updates the global resonance of the entire cognitive space
    */
    func updateGlobalResonance {
        # Global resonance is influenced by:
        # 1. Number of symbols
        # 2. Average resonance of all symbols
        # 3. Number of relations
        # 4. Number of higher-order structures (triangulations, galaxies, complexes)

        nTotalResonance = 0
        nTotalRelations = 0

        for oSymbol in self.aSymbols {
            nTotalResonance += oSymbol.nResonance
            nTotalRelations += len(oSymbol.aRelations)
        }

        nAvgResonance = nTotalResonance / max(1, len(self.aSymbols))
        nRelationFactor = 1 + (nTotalRelations / max(1, len(self.aSymbols)) * 0.1)
        nStructureFactor = 1 + ((len(self.aTriangulations) + len(self.aGalaxies) + len(self.aComplexes)) * 0.05)

        self.nGlobalResonance = nAvgResonance * nRelationFactor * nStructureFactor

        see "Global cognitive resonance updated to: " + self.nGlobalResonance + nl
    }

    /*
    Function: pruneSymbols
    Description: Removes the least essential symbols to manage memory
    Inputs:
        nCount : (number) Number of symbols to remove
    */
    func pruneSymbols nCount {
        # Sort symbols by radius (descending - higher radius = less essential)
        # Then remove the nCount least essential symbols
        aSymbolsToRemove = []

        # Simple selection of symbols with highest radius
        for i = 1 to min(nCount, len(self.aSymbols)) {
            nMaxRadius = 0
            nMaxIndex = 0
            for j = 1 to len(self.aSymbols) {
                if self.aSymbols[j].nRadius > nMaxRadius {
                    # Skip if already marked for removal
                    if not find(aSymbolsToRemove, j) {
                        nMaxRadius = self.aSymbols[j].nRadius
                        nMaxIndex = j
                    }
                }
            }
            if nMaxIndex > 0 {
                add(aSymbolsToRemove, nMaxIndex)
            }
        }

        # Remove symbols (in reverse order to maintain indices)
        for i = len(aSymbolsToRemove) to 1 step -1 {
            del(self.aSymbols, aSymbolsToRemove[i])
        }

        see "Pruned " + len(aSymbolsToRemove) + " symbols to manage memory." + nl
    }
    /*
    Function: cleanupInactiveWaves
    Description: Removes inactive wave fronts from the wave list to free memory
    */
    func cleanupInactiveWaves {
        aActiveWaves = []
        for oWave in self.aWaveFronts {
            if oWave["active"] = true {
                add(aActiveWaves, oWave)
            }
        }
        self.aWaveFronts = aActiveWaves
        see "Cleaned up inactive waves. Remaining active waves: " + len(self.aWaveFronts) + nl
    }

    /*
    Function: enhancedDreamCycle
    Description: Enhanced dream cycle with proper Ḥall + Lamm + Ḥulm phases
    */
    func enhancedDreamCycle {
        # Increment epoch
        self.nEpoch++

        see "=== Enhanced Dream Cycle #" + self.nEpoch + " ===" + nl

        # Clear dream buffers
        self.aDreamBuffer_Seeds = []
        self.aDreamBuffer_Candidates = []

        # --- Ḥall Phase (Decomposition/Analysis) ---
        see "  [Ḥall]: Decomposing symbols into seeds..." + nl
        self.hallPhase()

        # --- Lamm Phase (Recombination/Association) ---
        see "  [Lamm]: Recombining seeds with triangulation awareness..." + nl
        self.enhancedLammPhaseWithTriangulation()

        # --- Meaning Condensation Phase ---
        self.createMeaningCondensationCandidates()

        # --- Ḥulm Phase (Integration/Synthesis) ---
        see "  [Ḥulm]: Integrating new symbols into the space..." + nl
        self.hulmPhase()

        # --- Post-cycle dynamics ---
        see "  [Dynamics]: Updating triangulation dynamics..." + nl
        self.updateTriangulationDynamics()

        see "=== End of Enhanced Dream Cycle #" + self.nEpoch + " ===" + nl
    }

    /*
    Function: advancedDreamCycle
    Description: Most advanced dream cycle with all features
    */
    func advancedDreamCycle {
        # Increment epoch
        self.nEpoch++

        see "=== Advanced Dream Cycle #" + self.nEpoch + " ===" + nl

        # Pre-cycle wave propagation
        see "  [Pre-cycle]: Propagating existing waves..." + nl
        self.propagateWaves()

        # Clear dream buffers
        self.aDreamBuffer_Seeds = []
        self.aDreamBuffer_Candidates = []

        # --- Enhanced Ḥall Phase ---
        see "  [Ḥall]: Advanced decomposition with wave influence..." + nl
        self.advancedHallPhase()

        # --- Enhanced Lamm Phase ---
        see "  [Lamm]: Advanced recombination with geometric guidance..." + nl
        self.enhancedLammPhaseWithTriangulation()

        # --- Meaning Condensation ---
        self.createMeaningCondensationCandidates()

        # --- Enhanced Ḥulm Phase ---
        see "  [Ḥulm]: Advanced integration with emergent structures..." + nl
        self.advancedHulmPhase()

        # --- Post-cycle dynamics ---
        see "  [Dynamics]: Updating all dynamic structures..." + nl
        self.updateTriangulationDynamics()
        self.organizeGalacticClusters()

        # --- Wave generation from new symbols ---
        see "  [Waves]: Generating waves from highly resonant symbols..." + nl
        self.generateResonanceWaves()

        see "=== End of Advanced Dream Cycle #" + self.nEpoch + " ===" + nl
    }

    /*
    Function: advancedHallPhase
    Description: Advanced Ḥall phase with wave influence
    */
    func advancedHallPhase {
        # Select symbols for decomposition with wave influence
        aSymbolsToDecompose = self.selectSymbolsForAdvancedDecomposition()

        see "    Selected " + len(aSymbolsToDecompose) + " symbols for advanced decomposition" + nl

        # Decompose selected symbols
        for oSymbol in aSymbolsToDecompose {
            if isObject(oSymbol) {
                aSeeds = oSymbol.deconstructToSeeds()
                for oSeed in aSeeds {
                    # Apply wave influence to seeds
                    self.applyWaveInfluenceToSeed(oSeed)
                    add(self.aDreamBuffer_Seeds, oSeed)
                }

                # Reduce energy of decomposed symbol
                oSymbol.nEnergyLevel *= 0.7
            }
        }

        see "    Generated " + len(self.aDreamBuffer_Seeds) + " wave-influenced seeds" + nl
    }

    /*
    Function: advancedHulmPhase
    Description: Advanced Ḥulm phase with emergent structure creation
    */
    func advancedHulmPhase {
        if len(self.aDreamBuffer_Candidates) = 0 {
            see "    No candidates to integrate" + nl
            return
        }

        # Sort candidates by score (highest first)
        for i = 1 to len(self.aDreamBuffer_Candidates) - 1 {
            for j = 1 to len(self.aDreamBuffer_Candidates) - i {
                if self.aDreamBuffer_Candidates[j][2] < self.aDreamBuffer_Candidates[j+1][2] {
                    temp = self.aDreamBuffer_Candidates[j]
                    self.aDreamBuffer_Candidates[j] = self.aDreamBuffer_Candidates[j+1]
                    self.aDreamBuffer_Candidates[j+1] = temp
                }
            }
        }

        # Integrate top candidates with emergent structure creation
        nIntegratedCount = 0
        nMaxToIntegrate = min(5, len(self.aDreamBuffer_Candidates))  # Allow more integration

        for i = 1 to nMaxToIntegrate {
            oCandidate = self.aDreamBuffer_Candidates[i][1]
            nScore = self.aDreamBuffer_Candidates[i][2]

            if isObject(oCandidate) and nScore > 0.2 {  # Lower threshold for more diversity
                # Move candidate closer to center based on score
                nCenteringFactor = nScore * 0.3
                oCandidate.moveTowardCenter(nCenteringFactor)

                # Add to space
                self.addSymbol(oCandidate)

                # Attempt emergent triangulation
                self.attemptEmergentTriangulation(oCandidate)

                # Generate insight wave from high-quality symbols
                if nScore > 0.7 {
                    self.initiateWave(oCandidate, "insight_wave", nScore * 0.5)
                }

                nIntegratedCount++

                see "      Integrated " + oCandidate.cId + " (score: " + nScore + ")" + nl
            }
        }

        see "    Integrated " + nIntegratedCount + " new symbols with emergent structures" + nl
    }

    /*
    Function: selectSymbolsForAdvancedDecomposition
    Description: Advanced symbol selection considering wave effects
    */
    func selectSymbolsForAdvancedDecomposition {
        aSelected = []

        for oSymbol in self.aSymbols {
            if isObject(oSymbol) {
                bShouldDecompose = false
                nDecompositionScore = 0

                # Low energy symbols
                if oSymbol.nEnergyLevel < 0.3 {
                    nDecompositionScore += 2
                }

                # Symbols far from center
                if oSymbol.nRadius > 0.8 {
                    nDecompositionScore += 1
                }

                # Symbols affected by waves (they become more volatile)
                if self.isSymbolAffectedByWaves(oSymbol) {
                    nDecompositionScore += 1
                }

                # Symbols with low resonance
                if oSymbol.nResonance < 1.5 {
                    nDecompositionScore += 1
                }

                # Random factor for diversity
                if random(10) = 1 {
                    nDecompositionScore += 1
                }

                # Don't decompose seed symbols, condensed symbols, or very recent symbols
                if oSymbol.bIsSeed or oSymbol.nCondensationValue > 0 or oSymbol.cType = "offspring" {
                    nDecompositionScore = 0
                }

                if nDecompositionScore >= 2 {  # Threshold for decomposition
                    add(aSelected, oSymbol)
                }
            }
        }

        # Limit selection
        nMaxToSelect = min(len(aSelected), max(3, len(self.aSymbols) / 4))
        aFinalSelected = []

        for i = 1 to nMaxToSelect {
            add(aFinalSelected, aSelected[i])
        }

        return aFinalSelected
    }

    /*
    Function: isSymbolAffectedByWaves
    Description: Checks if a symbol is currently affected by active waves
    */
    func isSymbolAffectedByWaves oSymbol {
        for oWave in self.aWaveFronts {
            if oWave["active"] = true {
                if find(oWave["affected_symbols"], oSymbol.cId) > 0 {
                    return true
                }
            }
        }
        return false
    }

    /*
    Function: applyWaveInfluenceToSeed
    Description: Applies wave influence to a newly created seed
    */
    func applyWaveInfluenceToSeed oSeed {
        if not isObject(oSeed) {
            return
        }

        # Check for nearby active waves
        for oWave in self.aWaveFronts {
            if oWave["active"] = true {
                nWaveDistance = abs(oSeed.nRadius - oWave["radius"])

                if nWaveDistance < 0.2 {  # Seed is near wave
                    # Apply wave effects based on wave type
                    if oWave["type"] = "insight_wave" {
                        oSeed.nEnergyLevel *= 1.2  # Boost energy
                        oSeed.moveTowardCenter(0.1)  # Move toward center
                    elseif oWave["type"] = "question_wave"
                        oSeed.evolveGenome(0.3)  # Increase mutation
                    }
                }
            }
        }
    }

    /*
    Function: generateResonanceWaves
    Description: Generates waves from highly resonant symbols
    */
    func generateResonanceWaves {
        nWavesGenerated = 0

        for oSymbol in self.aSymbols {
            if isObject(oSymbol) and oSymbol.nResonance > 3.0 and oSymbol.nEnergyLevel > 0.7 {
                # Generate wave with probability based on resonance
                nWaveProbability = (oSymbol.nResonance - 3.0) * 0.2

                if random(100) / 100.0 < nWaveProbability {
                    cWaveType = "resonance_wave"
                    if oSymbol.nCondensationValue > 0 {
                        cWaveType = "condensation_wave"
                    }

                    nWaveEnergy = oSymbol.nResonance * 0.2
                    self.initiateWave(oSymbol, cWaveType, nWaveEnergy)
                    nWavesGenerated++
                }
            }
        }

        see "    Generated " + nWavesGenerated + " resonance waves" + nl
    }

    /*
    Function: hallPhase
    Description: Ḥall phase - decomposition of symbols into seeds
    */
    func hallPhase {
        # Select symbols for decomposition
        aSymbolsToDecompose = self.selectSymbolsForDecomposition()

        see "    Selected " + len(aSymbolsToDecompose) + " symbols for decomposition" + nl

        # Decompose selected symbols
        for oSymbol in aSymbolsToDecompose {
            if isObject(oSymbol) {
                aSeeds = oSymbol.deconstructToSeeds()
                for oSeed in aSeeds {
                    add(self.aDreamBuffer_Seeds, oSeed)
                }

                # Reduce energy of decomposed symbol
                oSymbol.nEnergyLevel *= 0.7
            }
        }

        see "    Generated " + len(self.aDreamBuffer_Seeds) + " seeds" + nl
    }

    /*
    Function: lammPhase
    Description: Lamm phase - recombination of seeds
    */
    func lammPhase {
        if len(self.aDreamBuffer_Seeds) < 2 {
            see "    Not enough seeds for recombination" + nl
            return
        }

        # Find best mating pairs using geometry utils
        nPairsToFind = min(5, len(self.aDreamBuffer_Seeds) / 2)  # Limit pairs
        aBestPairs = findBestMatingPairs(self.aDreamBuffer_Seeds, self, nPairsToFind)

        see "    Found " + len(aBestPairs) + " promising mating pairs" + nl

        # Attempt mating for each pair
        for aPair in aBestPairs {
            oParent1 = aPair[1]
            oParent2 = aPair[2]
            nScore = aPair[3]

            if isObject(oParent1) and isObject(oParent2) {
                oChild = oParent1.mate(oParent2)
                if isObject(oChild) {
                    # Store candidate with its binding score
                    add(self.aDreamBuffer_Candidates, [oChild, nScore])
                    see "      Mated " + oParent1.cId + " + " + oParent2.cId +
                        " → " + oChild.cId + " (score: " + nScore + ")" + nl
                }
            }
        }

        see "    Generated " + len(self.aDreamBuffer_Candidates) + " candidate symbols" + nl
    }

    /*
    Function: hulmPhase
    Description: Ḥulm phase - integration of new symbols
    */
    func hulmPhase {
        if len(self.aDreamBuffer_Candidates) = 0 {
            see "    No candidates to integrate" + nl
            return
        }

        # Sort candidates by score (highest first)
        for i = 1 to len(self.aDreamBuffer_Candidates) - 1 {
            for j = 1 to len(self.aDreamBuffer_Candidates) - i {
                if self.aDreamBuffer_Candidates[j][2] < self.aDreamBuffer_Candidates[j+1][2] {
                    temp = self.aDreamBuffer_Candidates[j]
                    self.aDreamBuffer_Candidates[j] = self.aDreamBuffer_Candidates[j+1]
                    self.aDreamBuffer_Candidates[j+1] = temp
                }
            }
        }

        # Integrate top candidates
        nIntegratedCount = 0
        nMaxToIntegrate = min(3, len(self.aDreamBuffer_Candidates))  # Limit integration

        for i = 1 to nMaxToIntegrate {
            oCandidate = self.aDreamBuffer_Candidates[i][1]
            nScore = self.aDreamBuffer_Candidates[i][2]

            if isObject(oCandidate) and nScore > 0.3 {  # Minimum quality threshold
                # Move candidate closer to center (dreams are more essential)
                oCandidate.moveTowardCenter(0.2)

                # Add to space
                self.addSymbol(oCandidate)
                nIntegratedCount++

                see "      Integrated " + oCandidate.cId + " (score: " + nScore + ")" + nl
            }
        }

        see "    Integrated " + nIntegratedCount + " new symbols into the space" + nl
    }

    /*
    Function: selectSymbolsForDecomposition
    Description: Selects symbols for decomposition in the Ḥall phase
    Outputs: (list) List of symbols to decompose
    */
    func selectSymbolsForDecomposition {
        aSelected = []

        # Selection criteria:
        # 1. Symbols with low energy
        # 2. Symbols far from center (high radius)
        # 3. Symbols that haven't been active recently

        for oSymbol in self.aSymbols {
            if isObject(oSymbol) {
                bShouldDecompose = false

                # Low energy symbols
                if oSymbol.nEnergyLevel < 0.3 {
                    bShouldDecompose = true
                }

                # Symbols far from center
                if oSymbol.nRadius > 0.8 {
                    bShouldDecompose = true
                }

                # Random selection for diversity (10% chance)
                if random(10) = 1 {
                    bShouldDecompose = true
                }

                # Don't decompose seed symbols or very recent symbols
                if oSymbol.bIsSeed or oSymbol.cType = "offspring" {
                    bShouldDecompose = false
                }

                if bShouldDecompose {
                    add(aSelected, oSymbol)
                }
            }
        }

        # Limit selection to avoid over-decomposition
        nMaxToSelect = min(len(aSelected), max(2, len(self.aSymbols) / 5))
        aFinalSelected = []

        for i = 1 to nMaxToSelect {
            add(aFinalSelected, aSelected[i])
        }

        return aFinalSelected
    }

    /*
    Function: getSymbolById
    Description: Gets a symbol by its ID
    Inputs:
        cId : (string) Symbol ID
    Outputs: (oMorgenSymbol) The symbol or null if not found
    */
    func getSymbolById cId {
        for oSymbol in self.aSymbols {
            if isObject(oSymbol) and oSymbol.cId = cId {
                return oSymbol
            }
        }
        return null
    }

    /*
    Function: attemptEmergentTriangulation
    Description: Attempts to create emergent triangulations after symbol creation
    Inputs:
        oNewSymbol : (MorgenSymbol) The newly created symbol
    */
    func attemptEmergentTriangulation oNewSymbol {
        if not isObject(oNewSymbol) {
            return
        }

        # Find potential triangulation partners
        aPotentialPartners = []

        # Look for symbols within triangulation range
        nTriangulationRange = 0.5  # Maximum distance for triangulation

        for oSymbol in self.aSymbols {
            if isObject(oSymbol) and oSymbol.cId != oNewSymbol.cId {
                nDistance = calculatePolarDistance(oNewSymbol.nRadius, oNewSymbol.nAngle,
                                                 oSymbol.nRadius, oSymbol.nAngle)

                if nDistance <= nTriangulationRange {
                    add(aPotentialPartners, oSymbol)
                }
            }
        }

        # Need at least 2 partners for triangulation
        if len(aPotentialPartners) < 2 {
            return
        }

        # Find the best triangulation combinations
        aBestTriangulations = []

        for i = 1 to len(aPotentialPartners) - 1 {
            for j = i + 1 to len(aPotentialPartners) {
                oPartner1 = aPotentialPartners[i]
                oPartner2 = aPotentialPartners[j]

                # Calculate triangulation stability
                nStability = calculateTriangulationStability(oNewSymbol, oPartner1, oPartner2)

                if nStability > 0.6 {  # Minimum stability threshold
                    add(aBestTriangulations, [oNewSymbol, oPartner1, oPartner2, nStability])
                }
            }
        }

        # Sort by stability (highest first)
        for i = 1 to len(aBestTriangulations) - 1 {
            for j = 1 to len(aBestTriangulations) - i {
                if aBestTriangulations[j][4] < aBestTriangulations[j+1][4] {
                    temp = aBestTriangulations[j]
                    aBestTriangulations[j] = aBestTriangulations[j+1]
                    aBestTriangulations[j+1] = temp
                }
            }
        }

        # Create the best triangulation (if any)
        if len(aBestTriangulations) > 0 {
            aBest = aBestTriangulations[1]
            cTriangulationType = "emergent_" + oNewSymbol.cType

            self.createTriangulation(aBest[1], aBest[2], aBest[3], cTriangulationType)

            see "    Created emergent triangulation with stability: " + aBest[4] + nl
        }
    }

    /*
    Function: updateTriangulationDynamics
    Description: Updates the dynamics of existing triangulations
    */
    func updateTriangulationDynamics {
        if len(self.aTriangulations) = 0 {
            return
        }

        see "Updating triangulation dynamics..." + nl

        aActiveTriangulations = []

        for oTriangulation in self.aTriangulations {
            # Get the symbols in this triangulation
            aSymbolIds = oTriangulation["symbols"]
            aTriangleSymbols = []
            bAllSymbolsExist = true

            for cSymbolId in aSymbolIds {
                oSymbol = self.getSymbolById(cSymbolId)
                if isObject(oSymbol) {
                    add(aTriangleSymbols, oSymbol)
                else
                    bAllSymbolsExist = false
                    break
                }
            }

            if bAllSymbolsExist and len(aTriangleSymbols) = 3 {
                # Recalculate stability
                nCurrentStability = calculateTriangulationStability(aTriangleSymbols[1],
                                                                   aTriangleSymbols[2],
                                                                   aTriangleSymbols[3])

                if nCurrentStability > 0.3 {  # Minimum survival threshold
                    # Update triangulation center
                    aCenter = calculateGeometricCenter(aTriangleSymbols)
                    if aCenter != null {
                        oTriangulation["center_radius"] = aCenter[1]
                        oTriangulation["center_angle"] = aCenter[2]
                    }

                    # Boost resonance of triangulated symbols
                    for oSymbol in aTriangleSymbols {
                        oSymbol.nResonance *= (1 + nCurrentStability * 0.1)
                    }

                    add(aActiveTriangulations, oTriangulation)
                }
            }
        }

        # Update triangulations list
        self.aTriangulations = aActiveTriangulations

        see "Active triangulations: " + len(self.aTriangulations) + nl
    }

    /*
    Function: enhancedLammPhaseWithTriangulation
    Description: Enhanced Lamm phase that considers triangulation opportunities
    */
    func enhancedLammPhaseWithTriangulation {
        if len(self.aDreamBuffer_Seeds) < 2 {
            see "    Not enough seeds for enhanced recombination" + nl
            return
        }

        # Find best mating pairs using geometry utils
        nPairsToFind = min(5, len(self.aDreamBuffer_Seeds) / 2)
        aBestPairs = findBestMatingPairs(self.aDreamBuffer_Seeds, self, nPairsToFind)

        see "    Found " + len(aBestPairs) + " promising mating pairs" + nl

        # Attempt mating for each pair
        for aPair in aBestPairs {
            oParent1 = aPair[1]
            oParent2 = aPair[2]
            nScore = aPair[3]

            if isObject(oParent1) and isObject(oParent2) {
                oChild = oParent1.mate(oParent2)
                if isObject(oChild) {
                    # Store candidate with its binding score
                    add(self.aDreamBuffer_Candidates, [oChild, nScore])

                    # Check for immediate triangulation opportunities
                    self.attemptEmergentTriangulation(oChild)

                    see "      Mated " + oParent1.cId + " + " + oParent2.cId +
                        " → " + oChild.cId + " (score: " + nScore + ")" + nl
                }
            }
        }

        see "    Generated " + len(self.aDreamBuffer_Candidates) + " candidate symbols" + nl
    }

    /*
    Function: createMeaningCondensationCandidates
    Description: Creates candidates for meaning condensation (Ramanujan-inspired)
    */
    func createMeaningCondensationCandidates {
        see "  [Condensation]: Searching for meaning condensation opportunities..." + nl

        # Find groups of related symbols for condensation
        aCondensationGroups = []

        # Group symbols by type and proximity
        aSymbolGroups = []

        for oSymbol in self.aSymbols {
            if isObject(oSymbol) and oSymbol.nRadius > 0.3 {  # Don't condense core symbols
                bAddedToGroup = false

                # Try to add to existing group
                for aGroup in aSymbolGroups {
                    if len(aGroup) > 0 {
                        oGroupSymbol = aGroup[1]

                        # Check type similarity and proximity
                        if oSymbol.cType = oGroupSymbol.cType {
                            nDistance = calculatePolarDistance(oSymbol.nRadius, oSymbol.nAngle,
                                                             oGroupSymbol.nRadius, oGroupSymbol.nAngle)
                            nGenomeSim = calculateGenomeSimilarity(oSymbol.aGenome, oGroupSymbol.aGenome)

                            if nDistance < 0.4 and nGenomeSim > 0.5 {
                                add(aGroup, oSymbol)
                                bAddedToGroup = true
                                break
                            }
                        }
                    }
                }

                # Create new group if not added
                if not bAddedToGroup {
                    add(aSymbolGroups, [oSymbol])
                }
            }
        }

        # Find groups suitable for condensation
        for aGroup in aSymbolGroups {
            if len(aGroup) >= 3 {  # Need at least 3 symbols for condensation
                # Calculate group coherence
                nTotalSimilarity = 0
                nComparisons = 0

                for i = 1 to len(aGroup) - 1 {
                    for j = i + 1 to len(aGroup) {
                        nSim = calculateGenomeSimilarity(aGroup[i].aGenome, aGroup[j].aGenome)
                        nTotalSimilarity += nSim
                        nComparisons++
                    }
                }

                nAvgSimilarity = nTotalSimilarity / nComparisons

                if nAvgSimilarity > 0.6 {  # High coherence threshold
                    add(aCondensationGroups, aGroup)
                }
            }
        }

        see "    Found " + len(aCondensationGroups) + " groups suitable for condensation" + nl

        # Create condensed symbols
        for aGroup in aCondensationGroups {
            oCondensedSymbol = self.createCondensedSymbol(aGroup)
            if isObject(oCondensedSymbol) {
                add(self.aDreamBuffer_Candidates, [oCondensedSymbol, 0.9])  # High score for condensed symbols
                see "    Created condensed symbol: " + oCondensedSymbol.cId + nl
            }
        }
    }

    /*
    Function: createCondensedSymbol
    Description: Creates a condensed symbol from a group of related symbols
    Inputs:
        aSymbolGroup : (list) Group of symbols to condense
    Outputs: (MorgenSymbol) The condensed symbol
    */
    func createCondensedSymbol aSymbolGroup {
        if len(aSymbolGroup) < 2 {
            return null
        }

        # Create condensed genome using pattern analysis
        aCondensedGenome = []
        nMaxGenomeLen = 0

        # Find maximum genome length
        for oSymbol in aSymbolGroup {
            if len(oSymbol.aGenome) > nMaxGenomeLen {
                nMaxGenomeLen = len(oSymbol.aGenome)
            }
        }

        # Create pattern-based condensed genome
        for i = 1 to nMaxGenomeLen {
            aValues = []

            # Collect values at position i from all symbols
            for oSymbol in aSymbolGroup {
                if i <= len(oSymbol.aGenome) {
                    add(aValues, oSymbol.aGenome[i])
                }
            }

            if len(aValues) > 0 {
                # Find most common value (simple mode)
                nCount1 = 0
                nCount2 = 0

                for nValue in aValues {
                    if nValue = 1 { nCount1++ }
                    if nValue = 2 { nCount2++ }
                }

                if nCount1 > nCount2 {
                    add(aCondensedGenome, 1)
                elseif nCount2 > nCount1
                    add(aCondensedGenome, 2)
                else
                    # Equal counts - use Ramanujan-inspired pattern
                    if i % 3 = 1 {
                        add(aCondensedGenome, 1)
                    else
                        add(aCondensedGenome, 2)
                    }
                }
            }
        }

        # Calculate condensed position (geometric center, moved toward center)
        aCenter = calculateGeometricCenter(aSymbolGroup)
        if aCenter = null {
            return null
        }

        nCondensedRadius = aCenter[1] * 0.6  # Move significantly toward center
        nCondensedAngle = aCenter[2]

        # Create condensed symbol
        cCondensedId = "condensed_" + aSymbolGroup[1].cType + "_" + self.nEpoch + "_" + random(1000)
        oCondensed = new MorgenSymbol(cCondensedId, "condensed_" + aSymbolGroup[1].cType,
                                      aCondensedGenome, nCondensedRadius, nCondensedAngle, null)

        # Set condensed properties
        nTotalEnergy = 0
        for oSymbol in aSymbolGroup {
            nTotalEnergy += oSymbol.nEnergyLevel
        }

        oCondensed.nEnergyLevel = nTotalEnergy * 1.2  # Condensation amplifies energy
        oCondensed.nCondensationValue = len(aSymbolGroup)  # Number of symbols condensed
        oCondensed.aSubSymbols = aSymbolGroup  # Store original symbols

        # Reduce energy of original symbols (they've been partially absorbed)
        for oSymbol in aSymbolGroup {
            oSymbol.nEnergyLevel *= 0.3
        }

        return oCondensed
    }

}



