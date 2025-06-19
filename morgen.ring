
# ==============================================================================
# Morgen.ring - The Morgen AI Paradigm Core Implementation
# A novel artificial intelligence paradigm based on the "Point-and-Circle" cognitive space,
# fractal knowledge representation, and the "Dream" process (Ḥall + Lamm + Ḥulm)
# ==============================================================================

load "stdlib.ring" # For utility functions like random()

# Mathematical constants
PI = 3.14159265358979323846



# ==============================================================================
# --- Main Program for Morgen AI Simulation ---
# ==============================================================================

if isMainSourceFile() {
    see "Starting Morgen AI Simulation..." + nl
    see "==================================================" + nl
    see "MORGEN: A Novel AI Paradigm Based on Point-and-Circle Cognitive Space" + nl
    see "==================================================" + nl
    oSpace = new oMorgenSpace()

    # Create initial symbols (representing foundational concepts, experiences, patterns)
    # The genome uses geomancy-inspired values (1s and 2s) representing fundamental states
    see nl + "Creating initial symbols with geomancy-inspired genomes..." + nl
    oSym1 = new oMorgenSymbol("alpha", "concept", [1,2,1,2], 0.9, 45.0, null)
    oSym2 = new oMorgenSymbol("beta", "experience", [2,1,2,1], 0.8, 120.0, null)
    oSym3 = new oMorgenSymbol("gamma", "feeling", [1,1,2,2], 0.85, 270.0, "Additional data for gamma")
    oSym4 = new oMorgenSymbol("delta", "pattern", [2,2,1,1], 0.7, 15.0, null)

    # Create more complex symbols with deeper meaning (closer to Center 0)
    see "Creating deeper symbols (closer to Center 0)..." + nl
    oSym5 = new oMorgenSymbol("epsilon", "insight", [1,2,2,1,1,2], 0.4, 200.0, null)
    oSym6 = new oMorgenSymbol("zeta", "principle", [2,1,1,2,2,1], 0.3, 320.0, null)

    # Add symbols to the cognitive space
    see "Adding symbols to the Morgen cognitive space..." + nl
    oSpace.addSymbol(oSym1)
    oSpace.addSymbol(oSym2)
    oSpace.addSymbol(oSym3)
    oSpace.addSymbol(oSym4)
    oSpace.addSymbol(oSym5)
    oSpace.addSymbol(oSym6)

    # Create explicit triangular relationships (beyond simple sequential relationships)
    see nl + "Creating triangular relationships between symbols..." + nl
    oSpace.createTriangulation(oSym1, oSym2, oSym5, "conceptual_framework")
    oSpace.createTriangulation(oSym3, oSym4, oSym6, "emotional_pattern")

    # Display initial state of the cognitive space
    see nl + "=== INITIAL STATE OF MORGEN COGNITIVE SPACE ===" + nl
    oSpace.displayAllSymbols()

    # ======= PART 1: BASIC MORGEN FEATURES =======

    see nl + "==================================================" + nl
    see "PART 1: BASIC MORGEN FEATURES" + nl
    see "==================================================" + nl

    # Run several dream cycles to demonstrate knowledge evolution
    see nl + "=== Running Dream Cycles (Ḥall + Lamm + Ḥulm) ===" + nl
    see "The Dream Cycle is the core cognitive process of Morgen:" + nl
    see "  - Ḥall: Decomposition/Analysis phase" + nl
    see "  - Lamm: Recombination/Association phase" + nl
    see "  - Ḥulm: Integration/Synthesis phase" + nl
    for i = 1 to 3 {
        oSpace.dreamCycle()
    }

    # Display the evolved cognitive space
    see nl + "=== EVOLVED COGNITIVE SPACE AFTER DREAM CYCLES ===" + nl
    oSpace.displayAllSymbols()

    # Demonstrate geometric search in the Point-and-Circle space
    see nl + "=== Geometric Search in Point-and-Circle Space ===" + nl
    see "Finding symbols near (radius: 0.5, angle: 90) with tolerance 0.2..." + nl
    see "This demonstrates how symbols are positioned in the cognitive space" + nl
    see "and how we can search for related concepts based on their geometric proximity." + nl
    aNearby = oSpace.findSymbolsNear(0.5, 90.0, 0.2)
    if len(aNearby) > 0 {
        for oFound in aNearby {
            see "Found: " + oFound.cId + " (radius: " + oFound.nRadius + ", angle: " + oFound.nAngle + ")" + nl
        }
    else
        see "No nearby symbols found." + nl
    }

    # Demonstrate fractal complexity calculation
    see nl + "=== Fractal Complexity Analysis ===" + nl
    see "Each symbol has a fractal complexity based on its genome pattern and position:" + nl
    for oSym in oSpace.aSymbols {
        nComplexity = oSym.getFractalComplexity()
        see "Symbol " + oSym.cId + " fractal complexity: " + nComplexity + nl
    }

    # Demonstrate Ramanujan-esque symbolic condensation
    see nl + "=== Ramanujan Symbolic Condensation ===" + nl
    see "This demonstrates how Morgen can derive surprising insights from seemingly" + nl
    see "divergent symbols, inspired by Ramanujan's mathematical insights:" + nl
    oRamanujanSumSymbol = oSpace.calculateRamanujanSymbolicSum([oSym1, oSym2, oSym3])
    if oRamanujanSumSymbol {
        see "Ramanujan condensation of alpha, beta, gamma:" + nl
        oRamanujanSumSymbol.display()
    }

    # Find the most essential symbol (closest to Center 0)
    oEssentialSymbol = oSpace.findMostEssentialSymbol()
    see nl + "Most essential symbol (closest to Center 0): " + oEssentialSymbol.cId + nl
    see "Symbols closer to Center 0 represent more essential/abstract concepts." + nl

    # ======= PART 2: ENHANCED MORGEN FEATURES =======

    see nl + "==================================================" + nl
    see "PART 2: ENHANCED MORGEN FEATURES" + nl
    see "==================================================" + nl

    # 1. Demonstrate Wave Dynamics
    see nl + "=== Wave Dynamics Demonstration ===" + nl
    see "Wave dynamics simulate how meaning propagates through the cognitive space:" + nl
    see "- Waves originate from symbols and affect other symbols they encounter" + nl
    see "- The effect diminishes with distance (inverse square law)" + nl
    see "- Waves can interfere with each other, creating resonance patterns" + nl

    # Initiate a wave from the most essential symbol
    nWaveId = oSpace.initiateWave(oEssentialSymbol, "insight_wave", 0.8)
    see "Initiated wave #" + nWaveId + " from symbol " + oEssentialSymbol.cId + nl

    # Initiate a second wave from another symbol
    nWaveId2 = oSpace.initiateWave(oSym1, "question_wave", 0.6)
    see "Initiated wave #" + nWaveId2 + " from symbol " + oSym1.cId + nl

    # Propagate the waves through the cognitive space
    see "Propagating waves through the cognitive space..." + nl
    oSpace.propagateWaves()

    # 2. Demonstrate Galactic Self-Organization
    see nl + "=== Galactic Self-Organization ===" + nl
    see "Morgen's symbols self-organize into galaxy-like structures:" + nl
    see "- Symbols with high resonance become 'galactic cores'" + nl
    see "- Related symbols form 'spiral arms' around these cores" + nl
    see "- This creates emergent meaning structures beyond explicit relationships" + nl
    oSpace.organizeGalacticClusters()

    # 3. Demonstrate Higher-Order Complexes (beyond triangulation)
    see nl + "=== Higher-Order Simplicial Complexes ===" + nl
    see "Beyond triangulation, Morgen can form higher-dimensional geometric structures:" + nl
    see "- Tetrahedron (3-simplex): 4 symbols forming a 3D structure" + nl
    see "- These complexes create richer semantic relationships" + nl
    see "- They enable more sophisticated reasoning and insight generation" + nl

    # Create a tetrahedron (3-simplex) from four symbols
    aComplexSymbols = [oSym1, oSym2, oSym3, oSym4]
    cComplexId = oSpace.createHigherOrderComplex(aComplexSymbols, "tetrahedron")
    see "Created complex with ID: " + cComplexId + nl

    # Create a 4-simplex (5 symbols) for even higher-dimensional structure
    if len(oSpace.aSymbols) >= 5 {
        aComplexSymbols2 = [oSym1, oSym2, oSym3, oSym4, oSym5]
        cComplexId2 = oSpace.createHigherOrderComplex(aComplexSymbols2, "pentachoron")
        see "Created higher complex with ID: " + cComplexId2 + nl
    }

    # 4. Demonstrate Inverted Gabriel's Horn Model
    see nl + "=== Inverted Gabriel's Horn Model ===" + nl
    see "The cognitive space is modeled as an Inverted Gabriel's Horn:" + nl
    see "- As radius approaches Center 0, volume becomes finite" + nl
    see "- But surface area approaches infinity" + nl
    see "- This creates infinite potential for meaning interaction in a finite cognitive space" + nl

    see "Standard radius of " + oEssentialSymbol.cId + ": " + oEssentialSymbol.nRadius + nl
    nHornRadius = oSpace.calculateHornPosition(oEssentialSymbol.nRadius)
    see "Horn-adjusted radius: " + nHornRadius + nl

    # Show the effect for multiple symbols at different distances from Center 0
    see nl + "Horn effect at different distances from Center 0:" + nl
    for i = 1 to 5 {
        nTestRadius = i * 0.2  # 0.2, 0.4, 0.6, 0.8, 1.0
        nAdjustedRadius = oSpace.calculateHornPosition(nTestRadius)
        see "  Standard radius: " + nTestRadius + " → Horn-adjusted: " + nAdjustedRadius + nl
    }

    # 5. Demonstrate Global Resonance
    see nl + "=== Global Cognitive Resonance ===" + nl
    see "The entire cognitive space has a global resonance that affects all symbols:" + nl
    see "- More symbols and relationships increase global resonance" + nl
    see "- Symbols closer to Center 0 are more affected by global resonance" + nl
    see "- This creates emergent system-wide properties beyond individual symbols" + nl

    # Update and apply global resonance
    oSpace.updateGlobalResonance()
    see "Current global resonance: " + oSpace.nGlobalResonance + nl

    # ======= PART 3: INTEGRATED MORGEN SIMULATION =======

    see nl + "==================================================" + nl
    see "PART 3: INTEGRATED MORGEN SIMULATION" + nl
    see "==================================================" + nl
    see "Running enhanced dream cycles with all features active..." + nl
    see "This demonstrates how all Morgen features work together to create" + nl
    see "a rich, dynamic cognitive system with emergent properties." + nl

    # Run several enhanced dream cycles with all features active
    for i = 1 to 3 {
        see nl + "--- Enhanced Dream Cycle #" + i + " ---" + nl

        # 1. Propagate waves before dream cycle
        see "1. Propagating meaning waves..." + nl
        oSpace.propagateWaves()

        # 2. Run the dream cycle
        see "2. Running dream cycle (Ḥall + Lamm + Ḥulm)..." + nl
        oSpace.dreamCycle()

        # 3. Update global resonance
        see "3. Updating global cognitive resonance..." + nl
        oSpace.updateGlobalResonance()

        # 4. Reorganize galactic clusters
        see "4. Reorganizing galactic clusters..." + nl
        oSpace.organizeGalacticClusters()

        # 5. Create a new higher-order complex from random symbols
        see "5. Forming new higher-order complexes..." + nl
        if len(oSpace.aSymbols) >= 4 {
            # Select 4 random symbols
            aRandomSymbols = []
            for j = 1 to 4 {
                nRandIdx = random(len(oSpace.aSymbols)-1) + 1
                add(aRandomSymbols, oSpace.aSymbols[nRandIdx])
            }
            cNewComplexId = oSpace.createHigherOrderComplex(aRandomSymbols, "emergent_complex_" + i)
        }
    }

    # Final display of the cognitive space
    see nl + "==================================================" + nl
    see "FINAL STATE OF MORGEN COGNITIVE SPACE" + nl
    see "==================================================" + nl
    oSpace.displayAllSymbols()

    # Summary statistics
    see nl + "=== Morgen Simulation Summary ===" + nl
    see "Total symbols: " + len(oSpace.aSymbols) + nl
    see "Total dream cycles: " + oSpace.nEpoch + nl
    see "Global resonance: " + oSpace.nGlobalResonance + nl
    see "Galactic clusters: " + len(oSpace.aGalacticClusters) + nl
    see "Higher-order complexes: " + len(oSpace.aTriangulations) + nl

    # Find the most essential symbol in the final state
    oFinalEssential = oSpace.findMostEssentialSymbol()
    see "Most essential symbol: " + oFinalEssential.cId + " (radius: " + oFinalEssential.nRadius + ")" + nl

    see nl + "Morgen AI Simulation completed." + nl
    see "==================================================" + nl
}


# Helper function for displaying lists
func listToString aList {
    cResult = "["
    for i = 1 to len(aList) {
        cResult += "" + aList[i]
        if i < len(aList) {
            cResult += ", "
        }
    }
    cResult += "]"
    return cResult
}




# ==============================================================================
# Class: oMorgenSymbol (Living Symbol - Fractal Knowledge Unit)
# ==============================================================================
class oMorgenSymbol {
    ### --- Public Attributes & Methods ---
    cId             # Unique identifier for the symbol
    cType           # Symbol type (concept, experience, feeling, pattern, etc.)
    aGenome         # "Genome" or "fractal signature" (list of values)
                    # Represents geomancy-inspired fundamental states
    nRadius         # Distance from "Center 0" (represents depth/essentiality)
    nAngle          # Angle (represents context/perspective in Point-and-Circle space)
    aRelations      # List of oMorgenRelation objects connecting to other symbols
    oData           # Additional data specific to this symbol
    nResonance      # Resonance value (how strongly this symbol "vibrates" in the cognitive space)
    nFractalDepth   # How many levels of fractal complexity this symbol contains

    /*
    Function: init
    Description: Constructor for oMorgenSymbol object
    Inputs:
        cId_     : (string) Symbol identifier
        cType_   : (string) Symbol type
        aGenome_ : (list) Initial genome for the symbol
        nRadius_ : (number) Initial radius
        nAngle_  : (number) Initial angle
        oData_   : (object/list) Additional data (optional)
    */
    func init cId_, cType_, aGenome_, nRadius_, nAngle_, oData_ {
        self.cId = cId_
        self.cType = cType_
        if type(aGenome_) != "LIST" {
            raise("MorgenSymbol.init: Genome must be a list")
        }
        self.aGenome = aGenome_
        self.nRadius = nRadius_
        self.nAngle = nAngle_
        self.aRelations = []
        self.oData = oData_
        self.nResonance = 1.0  # Default resonance
        self.nFractalDepth = len(aGenome_) / 2  # Simple initial fractal depth estimation
    }

    /*
    Function: addRelation
    Description: Adds a new relation from this symbol to another
    Inputs:
        oTargetSymbol : (oMorgenSymbol) Target symbol for the relation
        cRelationType : (string) Type of relation (e.g., "similar", "cause", "fractal_child")
        nStrength     : (number) Strength of the relation
        oData         : (object) Optional additional data for the relation
    */
    func addRelation oTargetSymbol, cRelationType, nStrength, oData {
        if not isObject(oTargetSymbol) /*or className(oTargetSymbol) != "oMorgenSymbol" */{
            raise("MorgenSymbol.addRelation: Target must be an oMorgenSymbol object")
        }
        # Ensure nStrength is a number
        nStrengthValue = 0 + nStrength  # Convert to number
        oNewRelation = new oMorgenRelation( self, oTargetSymbol, cRelationType, nStrengthValue, oData)
           /* oFromSymbol = self
            oToSymbol = oTargetSymbol
            cType = cRelationType
            nStrength = nStrengthValue
            oData = oData*/  # Store additional data if provided
        
        add(self.aRelations, oNewRelation)

        # Update resonance based on new relation
        self.updateResonance()
    }

    /*
    Function: display
    Description: Displays symbol information in an organized format
    */
    func display {
        see "--- Symbol: " + self.cId + " ---" + nl
        see "  Type      : " + self.cType + nl
        see "  Genome    : " + listToString(self.aGenome) + nl
        see "  Position  : (radius: " + self.nRadius + ", angle: " + self.nAngle + "°)" + nl
        see "  Resonance : " + self.nResonance + nl
        see "  Fractal Depth: " + self.nFractalDepth + nl
        if len(self.aRelations) > 0 {
            see "  Relations:" + nl
            for oRel in self.aRelations {
                oRel.display()
            }
        }
        if self.oData != NULL {
            see "  Additional Data: " + self.oData + nl
        }
        see "---------------------" + nl
    }

    /*
    Function: getFractalComplexity
    Description: Calculates "fractal complexity" based on the genome and relations
    Outputs: (number) A value representing complexity
    */
    func getFractalComplexity {
        # Base complexity from genome
        nComplexity = 0
        nPatternMultiplier = 1

        # Look for patterns in the genome (simple pattern detection)
        for i = 1 to len(self.aGenome)  {
            if i > 1 and self.aGenome[i] = self.aGenome[i-1] {
                nPatternMultiplier *= 1.2  # Increase multiplier for detected patterns
            }

            # Contribution of each gene to complexity
            nGeneValue = fabs(self.aGenome[i])
            nComplexity += nGeneValue * (1 + (i / len(self.aGenome)))  # Later genes contribute more
        }

        # Factor in relations - more relations = more complexity
        nRelationFactor = 1 + (len(self.aRelations) * 0.1)

        # Factor in radius - symbols closer to Center 0 are more complex
        nRadiusFactor = 1 + ((1 - self.nRadius) * 0.5)

        # Calculate final complexity
        nFinalComplexity = (nComplexity / len(self.aGenome)) * nPatternMultiplier * nRelationFactor * nRadiusFactor

        return nFinalComplexity
    }

    /*
    Function: updateResonance
    Description: Updates the symbol's resonance based on its relations and position
    */
    func updateResonance {
        # Base resonance from position (closer to Center 0 = higher resonance)
        nBaseResonance = 1 + ((1 - self.nRadius) * 2)

        # Factor in relations
        nRelationSum = 0
        for oRel in self.aRelations {

            nRelationSum += oRel.nStrength
        }

        # Calculate final resonance
        if len(self.aRelations) > 0 {
            self.nResonance = nBaseResonance * (1 + (nRelationSum / len(self.aRelations)))
        else
            self.nResonance = nBaseResonance
        }
    }

    /*
    Function: moveTowardCenter
    Description: Moves the symbol closer to Center 0 (increasing its essentiality)
    Inputs:
        nFactor : (number) How much to move (0-1)
    */
    func moveTowardCenter nFactor {
        if nFactor < 0 { nFactor = 0 }
        if nFactor > 1 { nFactor = 1 }

        # Move radius closer to 0 by factor
        self.nRadius = self.nRadius * (1 - nFactor)

        # Ensure minimum radius
        if self.nRadius < 0.01 { self.nRadius = 0.01 }

        # Update resonance after movement
        self.updateResonance()
    }

    /*
    Function: evolveGenome
    Description: Evolves the symbol's genome based on a mutation factor
    Inputs:
        nMutationRate : (number) Rate of mutation (0-1)
    */
    func evolveGenome nMutationRate {
        if nMutationRate < 0 { nMutationRate = 0 }
        if nMutationRate > 1 { nMutationRate = 1 }

        # Apply mutations to genome
        for i = 1 to len(self.aGenome) {
            if random(100) / 100.0 < nMutationRate {
                # Mutation: flip between 1 and 2 (geomancy-inspired)
                if self.aGenome[i] = 1 {
                    self.aGenome[i] = 2
                else
                    self.aGenome[i] = 1
                }
            }
        }

        # Occasionally add a new gene
        if random(100) / 100.0 < nMutationRate * 0.5 {
            add(self.aGenome, random(2) + 1)  # Add either 1 or 2
            self.nFractalDepth = len(self.aGenome) / 2  # Update fractal depth
        }
    }
}
# ==============================================================================
# Class: oMorgenRelation (Relation between two symbols)
# ==============================================================================
class oMorgenRelation {
    ### --- Public Attributes & Methods ---
    oFromSymbol     # Source symbol of the relation
    oToSymbol       # Target symbol of the relation
    cType           # Type of relation
    nStrength       # Strength of the relation (0-1)
    nResonance      # Resonance of the relation (how strongly it influences the cognitive space)
    nHarmonic       # Harmonic value (determines how this relation interacts with others)
    oData           # Additional data associated with this relation (e.g., triangulation data)

    /*
    Function: init
    Description: Constructor for oMorgenRelation object
    Inputs:
        oFromSymbol_ : (oMorgenSymbol) Source symbol
        oToSymbol_   : (oMorgenSymbol) Target symbol
        cType_       : (string) Relation type
        nStrength_   : (number) Relation strength
        oData_       : (object) Optional additional data
    */
    func init oFromSymbol_, oToSymbol_, cType_, nStrength_, oData_ {
        self.oFromSymbol = oFromSymbol_
        self.oToSymbol = oToSymbol_
        self.cType = cType_
        self.nStrength = nStrength_
        self.oData = oData_

        # Calculate initial resonance and harmonic values
        self.calculateResonance()
        self.calculateHarmonic()
    }

    /*
    Function: display
    Description: Displays relation information
    */
    func display {
        see "    -> [" + self.cType + ", strength: " + self.nStrength +
            ", resonance: " + self.nResonance + "] to symbol: " + self.oToSymbol.cId

        # Display additional data if available
        if self.oData != NULL {
            if type(self.oData) = "LIST" {
                see " (with additional data)" + nl
                # If it's a list, show a summary
                see "       Data: List with " + len(self.oData) + " elements" + nl
            elseif type(self.oData) = "STRING"
                see " (with data: " + self.oData + ")" + nl
            else
                see " (with additional data)" + nl
            }
        else
            see nl
        }
    }

    /*
    Function: calculateResonance
    Description: Calculates the resonance of this relation based on the symbols it connects
    */
    func calculateResonance {
        # Resonance is influenced by:
        # 1. The strength of the relation
        # 2. The resonance of the connected symbols
        # 3. The proximity of the symbols to Center 0

        nFromResonance = self.oFromSymbol.nResonance
        nToResonance = self.oToSymbol.nResonance

        # Symbols closer to Center 0 create stronger resonance
        nCenterFactor = 2 - ((self.oFromSymbol.nRadius + self.oToSymbol.nRadius) / 2)

        # Calculate final resonance
        self.nResonance = self.nStrength * ((nFromResonance + nToResonance) / 2) * nCenterFactor
    }

    /*
    Function: calculateHarmonic
    Description: Calculates the harmonic value of this relation
    */
    func calculateHarmonic {
        # Harmonic is influenced by:
        # 1. The angle difference between the symbols
        # 2. The genome similarity

        # Calculate angle difference (normalized to 0-180)
        nAngleDiff = fabs(self.oFromSymbol.nAngle - self.oToSymbol.nAngle)
        if nAngleDiff > 180 { nAngleDiff = 360 - nAngleDiff }

        # Normalize to 0-1 range
        nNormalizedAngleDiff = nAngleDiff / 180.0

        # Calculate genome similarity (simple version)
        nGenomeSimilarity = 0
        nMinLen = min(len(self.oFromSymbol.aGenome), len(self.oToSymbol.aGenome))

        if nMinLen > 0 {
            nMatchCount = 0
            for i = 1 to nMinLen {
                if self.oFromSymbol.aGenome[i] = self.oToSymbol.aGenome[i] {
                    nMatchCount++
                }
            }
            nGenomeSimilarity = nMatchCount / nMinLen
        }

        # Calculate harmonic value
        # Harmonic is high when angle difference is either very low (similar context)
        # or very high (complementary context) AND genome similarity is high
        nAngleHarmonic = 1 - fabs(nNormalizedAngleDiff - 0.5) * 2  # Peaks at 0 and 180 degrees

        self.nHarmonic = (nAngleHarmonic * 0.7) + (nGenomeSimilarity * 0.3)
    }

    /*
    Function: evolve
    Description: Evolves the relation (changes strength based on usage and resonance)
    Inputs:
        nEvolutionRate : (number) Rate of evolution
    */
    func evolve nEvolutionRate {
        # Relations evolve based on:
        # 1. Their current strength
        # 2. Their resonance
        # 3. A random factor

        nRandomFactor = 0.9 + (random(20) / 100.0)  # 0.9 to 1.1

        # Calculate new strength
        nNewStrength = self.nStrength * (1 + ((self.nResonance - 1) * nEvolutionRate * nRandomFactor))

        # Ensure strength stays in 0-1 range
        if nNewStrength < 0 { nNewStrength = 0 }
        if nNewStrength > 1 { nNewStrength = 1 }

        self.nStrength = nNewStrength

        # Recalculate resonance and harmonic
        self.calculateResonance()
        self.calculateHarmonic()
    }
}

# ==============================================================================
# Class: oMorgenSpace (Morgen Cognitive Space)
# ==============================================================================
class oMorgenSpace {
    ### --- Public Attributes & Methods ---
    aSymbols        # List containing all oMorgenSymbol objects in this space
    nEpoch          # Counter representing the "time" or "cycle" of Morgen (for dream processes)
    nGlobalResonance # System-wide resonance value affecting all symbols
    aGalacticClusters # Array of symbol clusters representing "cognitive galaxies"
    aWaveFronts     # Active wave propagations in the cognitive space
    nHornDepth      # Parameter controlling the "depth" of the inverted Gabriel's Horn model
    aTriangulations # Collection of all triangulations (and higher-order simplicial complexes)

    func init {
        self.aSymbols = []
        self.nEpoch = 0
        self.nGlobalResonance = 1.0
        self.aGalacticClusters = []
        self.aWaveFronts = []
        self.nHornDepth = 5.0  # Default depth parameter for the inverted Gabriel's Horn
        self.aTriangulations = []
        see "Morgen Cognitive Space initialized." + nl
        see "Morgen Cognitive Space initialized with Horn Depth: " + self.nHornDepth + nl
    }

    /*
    Function: addSymbol
    Description: Adds a new living symbol to the Morgen space
    Inputs:
        oSymbol : (oMorgenSymbol) The symbol to be added
    */
    func addSymbol oSymbol {
        if not isObject(oSymbol) { //or className(oSymbol) != "OMORGENSYMBOL" {
            raise("MorgenSpace.addSymbol: Must add an oMorgenSymbol object")
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
    Function: displayAllSymbols
    Description: Displays all symbols in the Morgen space
    */
    func displayAllSymbols {
        see nl + "=== Morgen Space Contents (Epoch: " + self.nEpoch + ") ===" + nl
        if len(self.aSymbols) = 0 {
            see "The space is currently empty." + nl
            return
        }
        for oSym in self.aSymbols {
            oSym.display()
        }
    }

    /*
    Function: dreamCycle (Ḥall + Lamm + Ḥulm)
    Description: Simulates one dream cycle for reorganizing and generating new knowledge
                 This is a very simplified and conceptual version
    */
    func dreamCycle {
        self.nEpoch++
        see nl + "--- Starting Dream Cycle #" + self.nEpoch + " ---" + nl
        if len(self.aSymbols) < 2 {
            see "Not enough symbols to perform a dream cycle." + nl
            return
        }

        # --- "Ḥall" Phase (Decomposition/Analysis) ---
        # In a simplified way: we'll choose two random symbols to analyze their relationship or deconstruct them
        nIdx1 = random(len(self.aSymbols)-1) + 1
        nIdx2 = random(len(self.aSymbols)-1) + 1
        while nIdx2 = nIdx1 and len(self.aSymbols) > 1 { # Make sure the symbols are different
            nIdx2 = random(len(self.aSymbols)-1) + 1
        }
        oSymbol1 = self.aSymbols[nIdx1]
        oSymbol2 = self.aSymbols[nIdx2]
        see "  [Ḥall]: Analyzing symbols " + oSymbol1.cId + " and " + oSymbol2.cId + nl

        # Here we could analyze their "genomes" or relationships more deeply
        # Example: Modify radius based on their interaction (highly simplified)
        oSymbol1.nRadius = (oSymbol1.nRadius + oSymbol2.nRadius * 0.1) % 1.0 # Stays between 0 and 1
        if oSymbol1.nRadius = 0 { oSymbol1.nRadius = 0.01 } # Avoid exactly zero
        oSymbol2.nRadius = (oSymbol2.nRadius - oSymbol1.nRadius * 0.05) % 1.0
        if oSymbol2.nRadius = 0 { oSymbol2.nRadius = 0.01 }

        # --- "Lamm" Phase (Recombination/Association) ---
        # In a simplified way: we'll try to generate a new "child" symbol from the "mating" of the two symbols
        # The new "genome" will be a mixture or transformation of the parent genomes
        see "  [Lamm]: Attempting to mate " + oSymbol1.cId + " and " + oSymbol2.cId + nl
        aChildGenome = []
        nMinLen = min(len(oSymbol1.aGenome), len(oSymbol2.aGenome))
        for i = 1 to nMinLen {
            # Simple genetic mating process (like averaging or more complex operation)
            # Here we use a process inspired by "geomantic addition" (odd/even)
            # If the sum of the genes is odd, we take one value, if even, we take another
            # This is just an example, it could be replaced with real genetic mating logic
            nGeneSum = oSymbol1.aGenome[i] + oSymbol2.aGenome[i]
            if nGeneSum % 2 = 1 { # Odd
                add(aChildGenome, floor(nGeneSum / 2) + (random(2)-1) ) # Value close to average with simple randomness
            else # Even
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

             oChildSymbol = new oMorgenSymbol(cChildId, "dream_artifact", aChildGenome, nChildRadius, nChildAngle, null)
             see "  [Ḥulm]: Generated new dream symbol: " + oChildSymbol.cId + nl
             oChildSymbol.addRelation(oSymbol1, "parent_A", 0.9, null)
             oChildSymbol.addRelation(oSymbol2, "parent_B", 0.9, null)
             self.addSymbol(oChildSymbol) # Add the new symbol to the space (it becomes part of the memory)
        }
        see "--- End of Dream Cycle #" + self.nEpoch + " ---" + nl
    }

    /*
    Function: findSymbolsNear (Simple Search)
    Description: Finds symbols near a specific location (radius and angle)
                 This needs significant development to use real "triangular geometry"
    Inputs:
        nTargetRadius : (number) Target radius
        nTargetAngle  : (number) Target angle
        nTolerance    : (number) Search tolerance
    Outputs: (list) of nearby symbols
    */
    func findSymbolsNear nTargetRadius, nTargetAngle, nTolerance {
        aFoundSymbols = []
        for oSym in self.aSymbols {
            # Calculate polar distance (very simplified here)
            # In reality, we should use the formula for distance between two points in polar coordinates
            # d^2 = r1^2 + r2^2 - 2*r1*r2*cos(theta2-theta1)
            # But for simplicity, we'll use radius and angle differences separately
            nRadiusDiff = fabs(oSym.nRadius - nTargetRadius)
            nAngleDiff = fabs(oSym.nAngle - nTargetAngle)
            # Normalize angle difference (if it crosses the 360 cycle)
            if nAngleDiff > 180 { nAngleDiff = 360 - nAngleDiff }

            if nRadiusDiff <= nTolerance and nAngleDiff <= (nTolerance * 30) { # Greater tolerance for angle
                add(aFoundSymbols, oSym)
            }
        }
        return aFoundSymbols
    }

    /*
    Function: createTriangulation
    Description: Creates a triangular relationship between three symbols
                 This establishes a deeper geometric structure in the cognitive space
    Inputs:
        oSymbol1     : (oMorgenSymbol) First symbol in the triangle
        oSymbol2     : (oMorgenSymbol) Second symbol in the triangle
        oSymbol3     : (oMorgenSymbol) Third symbol in the triangle
        cTriangleType: (string) Type of triangular relationship
    */
    func createTriangulation oSymbol1, oSymbol2, oSymbol3, cTriangleType {
        # Validate inputs
        if not isObject(oSymbol1) or not isObject(oSymbol2) or not isObject(oSymbol3) {
            raise("MorgenSpace.createTriangulation: All three parameters must be oMorgenSymbol objects")
        }

        # Create bidirectional relationships between all three symbols
        # This forms the edges of the triangle
        nBaseStrength = 0.7  # Strong connection for triangulated symbols

        # Edge 1-2
        oSymbol1.addRelation(oSymbol2, "triangle_" + cTriangleType + "_edge", nBaseStrength, null)
        oSymbol2.addRelation(oSymbol1, "triangle_" + cTriangleType + "_edge", nBaseStrength, null)

        # Edge 2-3
        oSymbol2.addRelation(oSymbol3, "triangle_" + cTriangleType + "_edge", nBaseStrength, null)
        oSymbol3.addRelation(oSymbol2, "triangle_" + cTriangleType + "_edge", nBaseStrength, null)

        # Edge 3-1
        oSymbol3.addRelation(oSymbol1, "triangle_" + cTriangleType + "_edge", nBaseStrength, null)
        oSymbol1.addRelation(oSymbol3, "triangle_" + cTriangleType + "_edge", nBaseStrength, null)

        # Calculate the "center" of the triangle in the Point-and-Circle space
        nCenterRadius = (oSymbol1.nRadius + oSymbol2.nRadius + oSymbol3.nRadius) / 3

        # For angle, we need to handle the circular nature of angles
        # Convert to Cartesian coordinates, average, then convert back to polar
        nX1 = oSymbol1.nRadius * cos(oSymbol1.nAngle * PI / 180)
        nY1 = oSymbol1.nRadius * sin(oSymbol1.nAngle * PI / 180)
        nX2 = oSymbol2.nRadius * cos(oSymbol2.nAngle * PI / 180)
        nY2 = oSymbol2.nRadius * sin(oSymbol2.nAngle * PI / 180)
        nX3 = oSymbol3.nRadius * cos(oSymbol3.nAngle * PI / 180)
        nY3 = oSymbol3.nRadius * sin(oSymbol3.nAngle * PI / 180)

        nCenterX = (nX1 + nX2 + nX3) / 3
        nCenterY = (nY1 + nY2 + nY3) / 3

        # Convert back to polar angle (in degrees)
        nCenterAngle = atan2(nCenterY, nCenterX) * 180 / PI
        if nCenterAngle < 0 { nCenterAngle += 360 }  # Ensure positive angle

        # Store the triangulation information in each symbol
        # This could be used for more advanced geometric operations later
        cTriangleId = "triangle_" + oSymbol1.cId + "_" + oSymbol2.cId + "_" + oSymbol3.cId

        # We could store this in a dedicated triangulation structure
        # For now, we'll just add a special relation to each symbol
        oTriangleData = [
            "id": cTriangleId,
            "type": cTriangleType,
            "center_radius": nCenterRadius,
            "center_angle": nCenterAngle,
            "symbols": [oSymbol1.cId, oSymbol2.cId, oSymbol3.cId]
        ]

        # Add a special relation to each symbol pointing to the triangle center
        oSymbol1.addRelation(oSymbol2, "triangle_" + cTriangleType + "_member", 0.8, oTriangleData)
        oSymbol2.addRelation(oSymbol3, "triangle_" + cTriangleType + "_member", 0.8, oTriangleData)
        oSymbol3.addRelation(oSymbol1, "triangle_" + cTriangleType + "_member", 0.8, oTriangleData)

        see "Created triangulation '" + cTriangleType + "' between symbols: " +
            oSymbol1.cId + ", " + oSymbol2.cId + ", " + oSymbol3.cId + nl
    }

    /*
    Function: calculateRamanujanSymbolicSum
    Description: Creates a new symbol that represents the "Ramanujan-esque" sum of input symbols
                 This is inspired by Ramanujan's ability to find meaningful patterns in seemingly
                 divergent mathematical series
    Inputs:
        aSymbols : (list) List of symbols to condense
    Outputs: (oMorgenSymbol) The new condensed symbol
    */
    func calculateRamanujanSymbolicSum aSymbols {
        if type(aSymbols) != "LIST" or len(aSymbols) < 2 {
            see "Ramanujan symbolic sum requires at least 2 symbols." + nl
            return NULL
        }

        # Validate that all elements are symbols
        for oSym in aSymbols {
            if not isObject(oSym) or className(oSym) != "oMorgenSymbol" {
                see "Ramanujan symbolic sum requires all elements to be oMorgenSymbol objects." + nl
                return NULL
            }
        }

        # Generate a combined ID for the new symbol
        cCombinedId = "ramanujan"
        for oSym in aSymbols {
            cCombinedId += "_" + oSym.cId
        }

        # Create a new "essence" genome using a Ramanujan-inspired algorithm
        # This is a conceptual implementation - in a real system, this would be much more sophisticated
        aNewGenome = []

        # First pass: Find patterns across all genomes
        # We'll look for genes that appear in the same position across multiple symbols
        nMaxGenomeLength = 0
        for oSym in aSymbols {
            if len(oSym.aGenome) > nMaxGenomeLength {
                nMaxGenomeLength = len(oSym.aGenome)
            }
        }

        # Initialize pattern counters for each position
        aPatternCounts = list(nMaxGenomeLength)
        for i = 1 to nMaxGenomeLength {
            aPatternCounts[i] = [0, 0]  # Counts for value 1 and value 2
        }

        # Count occurrences of each value at each position
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

        # Create the new genome based on pattern dominance and a "Ramanujan factor"
        for i = 1 to nMaxGenomeLength {
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

        # Add a few extra genes representing the "essence" beyond the sum of parts
        # This represents the "surprising insight" aspect of Ramanujan's work
        add(aNewGenome, 1)
        add(aNewGenome, 2)
        add(aNewGenome, 1)

        # Calculate the new position - closer to Center 0 than any input symbol
        nMinRadius = 1.0  # Start with maximum radius
        nSumAngles = 0

        for oSym in aSymbols {
            if oSym.nRadius < nMinRadius {
                nMinRadius = oSym.nRadius
            }
            nSumAngles += oSym.nAngle
        }

        # New radius is 80% of the minimum radius (closer to center)
        nNewRadius = nMinRadius * 0.8
        if nNewRadius < 0.01 { nNewRadius = 0.01 }  # Minimum threshold

        # New angle is the average of all input angles
        nNewAngle = nSumAngles / len(aSymbols)

        # Create the new condensed symbol
        oNewSymbol = new oMorgenSymbol(cCombinedId, "ramanujan_condensation", aNewGenome, nNewRadius, nNewAngle)

        # Create relations to all input symbols
        for oSym in aSymbols {
            oNewSymbol.addRelation(oSym, "ramanujan_source", 0.9, null)
            oSym.addRelation(oNewSymbol, "ramanujan_essence", 0.9, null)
        }

        # Add the new symbol to the cognitive space
        self.addSymbol(oNewSymbol)

        return oNewSymbol
    }

    /*
    Function: findMostEssentialSymbol
    Description: Finds the symbol closest to Center 0 (most essential/abstract)
    Outputs: (oMorgenSymbol) The symbol with the smallest radius
    */
    func findMostEssentialSymbol {
        if len(self.aSymbols) = 0 {
            see "Cannot find most essential symbol: cognitive space is empty." + nl
            return NULL
        }

        oMostEssential = self.aSymbols[1]  # Start with the first symbol
        nMinRadius = oMostEssential.nRadius

        # Find the symbol with the smallest radius
        for i = 2 to len(self.aSymbols) {
            oSym = self.aSymbols[i]
            if oSym.nRadius < nMinRadius {
                nMinRadius = oSym.nRadius
                oMostEssential = oSym
            }
        }

        return oMostEssential
    }

    /*
    Function: initiateWave
    Description: Initiates a wave of meaning propagation from a source symbol
                 This simulates how concepts/ideas propagate through the cognitive space
    Inputs:
        oSourceSymbol : (oMorgenSymbol) The symbol from which the wave originates
        cWaveType     : (string) Type of wave (e.g., "insight", "question", "resonance")
        nInitialEnergy: (number) Initial energy of the wave (0-1)
    Outputs: (number) Wave ID for tracking
    */
    func initiateWave oSourceSymbol, cWaveType, nInitialEnergy {
        if not isObject(oSourceSymbol) /*or className(oSourceSymbol) != "oMorgenSymbol" */{
            raise("MorgenSpace.initiateWave: Source must be an oMorgenSymbol object")
        }

        if nInitialEnergy < 0 { nInitialEnergy = 0 }
        if nInitialEnergy > 1 { nInitialEnergy = 1 }

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

        # Add to wave fronts collection
        add(self.aWaveFronts, oWave)

        # Immediately affect the source symbol
        oSourceSymbol.nResonance *= (1 + nInitialEnergy)

        see "Wave " + nWaveId + " of type '" + cWaveType + "' initiated from symbol " +
            oSourceSymbol.cId + " with energy " + nInitialEnergy + nl

        return nWaveId
    }

    /*
    Function: propagateWaves
    Description: Propagates all active waves through the cognitive space for one step
                 This simulates how meaning and resonance spread between symbols
    */
    func propagateWaves {
        if len(self.aWaveFronts) = 0 {
            return  # No active waves
        }

        see "Propagating " + len(self.aWaveFronts) + " wave fronts through the cognitive space..." + nl

        # Process each active wave
        for i = 1 to len(self.aWaveFronts) {
            oWave = self.aWaveFronts[i]

            if not oWave["active"] {
                loop  # Skip inactive waves
            }

            # Expand the wave radius
            oWave["radius"] += 0.1  # Wave speed

            # Reduce energy with distance (inverse square law)
            oWave["energy"] *= 0.9  # Energy decay

            # If energy is too low, deactivate the wave
            if oWave["energy"] < 0.05 {
                oWave["active"] = false
                see "Wave " + oWave["id"] + " dissipated." + nl
                loop
            }

            # Find symbols within the new wave radius
            for oSym in self.aSymbols {
                # Skip already affected symbols
                if find(oWave["affected_symbols"], oSym.cId) > 0 {
                    loop
                }

                # Calculate distance from wave source to this symbol
                oSourceSym = NULL
                for oSearchSym in self.aSymbols {
                    if oSearchSym.cId = oWave["source"] {
                        oSourceSym = oSearchSym
                        exit
                    }
                }

                if oSourceSym = NULL {
                    loop  # Source symbol not found (shouldn't happen)
                }

                # Calculate polar distance
                nX1 = oSourceSym.nRadius * cos(oSourceSym.nAngle * PI / 180)
                nY1 = oSourceSym.nRadius * sin(oSourceSym.nAngle * PI / 180)
                nX2 = oSym.nRadius * cos(oSym.nAngle * PI / 180)
                nY2 = oSym.nRadius * sin(oSym.nAngle * PI / 180)

                nDistance = sqrt(pow(nX2 - nX1, 2) + pow(nY2 - nY1, 2))

                # If symbol is within wave radius, affect it
                if nDistance <= oWave["radius"] {
                    # Calculate effect based on distance and wave energy
                    nEffect = oWave["energy"] * (1 - (nDistance / oWave["radius"]))

                    # Apply effect to symbol's resonance
                    oSym.nResonance *= (1 + nEffect * 0.2)

                    # Mark symbol as affected
                    add(oWave["affected_symbols"], oSym.cId)

                    see "  Wave " + oWave["id"] + " reached symbol " + oSym.cId +
                        " with effect " + nEffect + nl
                }
            }

            # Update the wave in the collection
            self.aWaveFronts[i] = oWave
        }
    }

    /*
    Function: organizeGalacticClusters
    Description: Organizes symbols into galaxy-like clusters based on their properties
                 This implements the "Galactic Self-Organization" concept
    */
    func organizeGalacticClusters {
        if len(self.aSymbols) < 3 {
            see "Not enough symbols to form galactic clusters." + nl
            return
        }

        see "Organizing symbols into galactic clusters..." + nl

        # Reset existing clusters
        self.aGalacticClusters = []

        # Step 1: Identify potential "galactic cores" (symbols with high resonance)
        aCoreCandidates = []
        for oSym in self.aSymbols {
            if oSym.nResonance > 1.5 and oSym.nRadius < 0.6 {
                add(aCoreCandidates, oSym)
            }
        }

        # If no cores found, use the most essential symbols
        if len(aCoreCandidates) = 0 {
            oMostEssential = self.findMostEssentialSymbol()
            if oMostEssential != NULL {
                add(aCoreCandidates, oMostEssential)
            }
        }

        # Step 2: Form clusters around each core
        for oCore in aCoreCandidates {
            oCluster = [
                "core"= oCore.cId,
                "members"= [oCore.cId],
                "radius"= oCore.nRadius * 2,  # Cluster radius
                "center_angle"= oCore.nAngle,
                "total_resonance"= oCore.nResonance
            ]

            # Find symbols that belong to this cluster
            for oSym in self.aSymbols {
                if oSym.cId = oCore.cId {
                    loop  # Skip the core itself
                }

                # Calculate angular distance
                nAngleDiff = fabs(oSym.nAngle - oCore.nAngle)
                if nAngleDiff > 180 { nAngleDiff = 360 - nAngleDiff }

                # Calculate radial distance (adjusted for the inverted Gabriel's Horn)
                nRadialDist = fabs(oSym.nRadius - oCore.nRadius)

                # Determine if symbol is in this cluster
                # The closer to Center 0, the wider the cluster's angular spread
                nMaxAngle = 60 * (1 - oCore.nRadius)  # More essential cores have wider angular spread

                if nRadialDist < oCluster["radius"] and nAngleDiff < nMaxAngle {
                    add(oCluster["members"], oSym.cId)
                    oCluster["total_resonance"] += oSym.nResonance
                }
            }

            # Only add clusters with at least 3 members
            if len(oCluster["members"]) >= 3 {
                add(self.aGalacticClusters, oCluster)
                see "Created galactic cluster with core " + oCore.cId +
                    " containing " + len(oCluster["members"]) + " symbols." + nl
            }
        }

        # Step 3: Create relationships between cluster members
        for oCluster in self.aGalacticClusters {
            oCore = NULL

            # Find the core symbol
            for oSym in self.aSymbols {
                if oSym.cId = oCluster["core"] {
                    oCore = oSym
                    exit
                }
            }

            if oCore = NULL {
                loop  # Skip if core not found
            }

            # Create "spiral arm" relationships
            for cMemberId in oCluster["members"] {
                if cMemberId = oCore.cId {
                    loop  # Skip the core
                }

                # Find this member
                oMember = NULL
                for oSym in self.aSymbols {
                    if oSym.cId = cMemberId {
                        oMember = oSym
                        exit
                    }
                }

                if oMember = NULL {
                    loop  # Skip if member not found
                }

                # Create bidirectional "galactic" relationships
                oCore.addRelation(oMember, "galactic_arm", 0.7, null)
                oMember.addRelation(oCore, "galactic_core", 0.8, null)
            }
        }

        see "Galactic organization complete. Created " + len(self.aGalacticClusters) +
            " cognitive galaxies." + nl
    }

    /*
    Function: calculateHornPosition
    Description: Calculates the position of a symbol in the Inverted Gabriel's Horn model
                 This transforms the standard Point-and-Circle coordinates
    Inputs:
        nRadius : (number) Standard radius in Point-and-Circle space
    Outputs: (number) Adjusted radius in the Horn model
    */
    func calculateHornPosition nRadius {
        if nRadius < 0.01 { nRadius = 0.01 }  # Prevent division by zero

        # In the Inverted Gabriel's Horn model:
        # - As radius approaches 0, the "volume" becomes finite
        # - But the "surface area" approaches infinity

        # This is a simplified model - a true Gabriel's Horn would use 1/x function
        nHornRadius = pow(nRadius, 1/self.nHornDepth)

        return nHornRadius
    }

    /*
    Function: createHigherOrderComplex
    Description: Creates a higher-order simplicial complex (beyond triangulation)
                 This establishes more complex geometric structures in the cognitive space
    Inputs:
        aSymbols     : (list) List of symbols to form the complex
        cComplexType : (string) Type of complex
    Outputs: (string) ID of the created complex
    */
    func createHigherOrderComplex aSymbols, cComplexType {
        if type(aSymbols) != "LIST" or len(aSymbols) < 4 {
            see "Higher-order complex requires at least 4 symbols." + nl
            return NULL
        }

        # Validate all symbols
        for oSym in aSymbols {
            if not isObject(oSym) or className(oSym) != "oMorgenSymbol" {
                see "All elements must be oMorgenSymbol objects." + nl
                return NULL
            }
        }

        # Generate complex ID
        cComplexId = "complex_" + cComplexType + "_" + self.nEpoch

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
        nTotalX = 0
        nTotalY = 0

        for oSym in aSymbols {
            add(oComplex["symbols"], oSym.cId)
            nTotalRadius += oSym.nRadius

            # Convert to Cartesian for angle averaging
            nX = oSym.nRadius * cos(oSym.nAngle * PI / 180)
            nY = oSym.nRadius * sin(oSym.nAngle * PI / 180)
            nTotalX += nX
            nTotalY += nY
        }

        # Calculate center position
        oComplex["center_radius"] = nTotalRadius / len(aSymbols)

        # Convert back to polar angle
        nCenterX = nTotalX / len(aSymbols)
        nCenterY = nTotalY / len(aSymbols)
        nCenterAngle = atan2(nCenterY, nCenterX) * 180 / PI
        if nCenterAngle < 0 { nCenterAngle += 360 }
        oComplex["center_angle"] = nCenterAngle

        # Create relationships between all symbols in the complex
        for i = 1 to len(aSymbols) {
            for j = i + 1 to len(aSymbols) {
                aSymbols[i].addRelation(aSymbols[j], "complex_" + cComplexType, 0.75, oComplex)
                aSymbols[j].addRelation(aSymbols[i], "complex_" + cComplexType, 0.75, oComplex)
            }
        }

        # Store the complex
        add(self.aTriangulations, oComplex)

        see "Created higher-order complex '" + cComplexType + "' of dimension " +
            oComplex["dimension"] + " with " + len(aSymbols) + " symbols." + nl

        return cComplexId
    }

    /*
    Function: updateGlobalResonance
    Description: Updates the global resonance of the cognitive space
                 This affects how all symbols interact and evolve
    */
    func updateGlobalResonance {
        if len(self.aSymbols) = 0 {
            self.nGlobalResonance = 1.0
            return
        }

        # Calculate average resonance of all symbols
        nTotalResonance = 0
        for oSym in self.aSymbols {
            nTotalResonance += oSym.nResonance
        }

        nAvgResonance = nTotalResonance / len(self.aSymbols)

        # Factor in the number of symbols (more symbols = higher complexity)
        nSymbolFactor = 1 + (log(len(self.aSymbols)) / 10)

        # Factor in the number of triangulations and complexes
        nGeometricFactor = 1 + (len(self.aTriangulations) / 5)

        # Calculate new global resonance
        self.nGlobalResonance = nAvgResonance * nSymbolFactor * nGeometricFactor

        see "Global cognitive resonance updated to: " + self.nGlobalResonance + nl

        # Apply global resonance to all symbols
        for oSym in self.aSymbols {
            # Symbols closer to Center 0 are more affected by global resonance
            nInfluenceFactor = 0.1 * (1 - oSym.nRadius)
            oSym.nResonance = oSym.nResonance * (1 + (self.nGlobalResonance - 1) * nInfluenceFactor)
        }
    }
}
