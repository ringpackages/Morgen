# ==============================================================================
# File: main.ring
# Description: Main entry point for the Morgen AI paradigm
# Author: Morgen AI Project
# ==============================================================================

load "morgen/space.ring"

/*
Function: main
Description: Main entry point for the Morgen AI simulation
*/
func main {
    see "Starting Morgen AI Simulation..." + nl
    see "==================================================" + nl
    see "MORGEN: A Novel AI Paradigm Based on Point-and-Circle Cognitive Space" + nl
    see "==================================================" + nl
    
    # Initialize the Morgen cognitive space
    oMorgenSpace = new MorgenSpace(5)  # Horn depth of 5
    
    # Create initial symbols
    see "Creating initial symbols with geomancy-inspired genomes..." + nl
    
    # Create symbols at different depths (radii)
    see "Creating deeper symbols (closer to Center 0)..." + nl
    
    # Create some initial symbols with different types and positions
    oAlpha = new MorgenSymbol("alpha", "concept", [1, 2, 1, 2], 0.9, 45, null)
    oBeta = new MorgenSymbol("beta", "experience", [2, 1, 2, 1], 0.8, 120, null)
    oGamma = new MorgenSymbol("gamma", "feeling", [1, 1, 2, 2], 0.85, 270, "Additional data for gamma")
    oDelta = new MorgenSymbol("delta", "pattern", [2, 2, 1, 1], 0.7, 15, null)
    
    # Create deeper symbols (closer to Center 0)
    oEpsilon = new MorgenSymbol("epsilon", "insight", [1, 2, 2, 1, 1, 2], 0.4, 200, null)
    oZeta = new MorgenSymbol("zeta", "principle", [2, 1, 1, 2, 2, 1], 0.3, 320, null)
    
    # Add symbols to the Morgen space
    see "Adding symbols to the Morgen cognitive space..." + nl
    oMorgenSpace.addSymbol(oAlpha)
    oMorgenSpace.addSymbol(oBeta)
    oMorgenSpace.addSymbol(oGamma)
    oMorgenSpace.addSymbol(oDelta)
    oMorgenSpace.addSymbol(oEpsilon)
    oMorgenSpace.addSymbol(oZeta)
    
    see nl
    
    # Create triangular relationships between symbols
    see "Creating triangular relationships between symbols..." + nl
    oMorgenSpace.createTriangulation(oAlpha, oBeta, oEpsilon, "conceptual_framework")
    oMorgenSpace.createTriangulation(oGamma, oDelta, oZeta, "emotional_pattern")
    
    see nl
    
    # Display the initial state of the Morgen space
    see "=== INITIAL STATE OF MORGEN COGNITIVE SPACE ===" + nl + nl
    oMorgenSpace.display()
    
    # ===== PART 1: BASIC MORGEN FEATURES =====
    see nl
    see "==================================================" + nl
    see "PART 1: BASIC MORGEN FEATURES" + nl
    see "==================================================" + nl
    
    # Run dream cycles
    see nl
    see "=== Running Dream Cycles (Ḥall + Lamm + Ḥulm) ===" + nl
    see "The Dream Cycle is the core cognitive process of Morgen:" + nl
    see "  - Ḥall: Decomposition/Analysis phase" + nl
    see "  - Lamm: Recombination/Association phase" + nl
    see "  - Ḥulm: Integration/Synthesis phase" + nl
    see nl
    
    # Run a few dream cycles
    oMorgenSpace.dreamCycle(oDelta, oBeta)
    oMorgenSpace.dreamCycle(oEpsilon, oZeta)
    oMorgenSpace.dreamCycle(oDelta, oGamma)
    
    # Display the evolved state
    see nl
    see "=== EVOLVED COGNITIVE SPACE AFTER DREAM CYCLES ===" + nl + nl
    oMorgenSpace.display()
    
    # Demonstrate geometric search
    see nl
    see "=== Geometric Search in Point-and-Circle Space ===" + nl
    see "Finding symbols near (radius: 0.5, angle: 90) with tolerance 0.2..." + nl
    see "This demonstrates how symbols are positioned in the cognitive space" + nl
    see "and how we can search for related concepts based on their geometric proximity." + nl
    oMorgenSpace.findNearbySymbols(0.5, 90, 0.2)
    
    # Demonstrate fractal complexity
    see nl
    see "=== Fractal Complexity Analysis ===" + nl
    see "Each symbol has a fractal complexity based on its genome pattern and position:" + nl
    for oSymbol in oMorgenSpace.aSymbols {
        nComplexity = oSymbol.getFractalComplexity()
        see "Symbol " + oSymbol.cId + " fractal complexity: " + nComplexity + nl
    }
    
    # Demonstrate Ramanujan symbolic condensation
    see nl
    see "=== Ramanujan Symbolic Condensation ===" + nl
    see "This demonstrates how Morgen can derive surprising insights from seemingly" + nl
    see "divergent symbols, inspired by Ramanujan's mathematical insights:" + nl
    oRamanujanSymbol = oMorgenSpace.calculateRamanujanSymbolicSum([oAlpha, oBeta, oGamma])
    
    # Find most essential symbol
    oMostEssential = oMorgenSpace.getMostEssentialSymbol()
    see nl
    see "Most essential symbol (closest to Center 0): " + oMostEssential.cId + nl
    see "Symbols closer to Center 0 represent more essential/abstract concepts." + nl
    
    # ===== PART 2: ENHANCED MORGEN FEATURES =====
    see nl
    see "==================================================" + nl
    see "PART 2: ENHANCED MORGEN FEATURES" + nl
    see "==================================================" + nl
    
    # Demonstrate wave dynamics
    see nl
    see "=== Wave Dynamics Demonstration ===" + nl
    see "Wave dynamics simulate how meaning propagates through the cognitive space:" + nl
    see "- Waves originate from symbols and affect other symbols they encounter" + nl
    see "- The effect diminishes with distance (inverse square law)" + nl
    see "- Waves can interfere with each other, creating resonance patterns" + nl
    
    # Initiate waves from different symbols
    oMorgenSpace.initiateWave(oMostEssential, "insight_wave", 0.8)
    oMorgenSpace.initiateWave(oAlpha, "question_wave", 0.6)
    
    # Propagate waves
    see "Propagating waves through the cognitive space..." + nl
    oMorgenSpace.propagateWaves()
    
    # Cleanup inactive waves
    oMorgenSpace.cleanupInactiveWaves()
    
    # Demonstrate galactic self-organization
    see nl
    see "=== Galactic Self-Organization ===" + nl
    see "Morgen's symbols self-organize into galaxy-like structures:" + nl
    see "- Symbols with high resonance become 'galactic cores'" + nl
    see "- Related symbols form 'spiral arms' around these cores" + nl
    see "- This creates emergent meaning structures beyond explicit relationships" + nl
    oMorgenSpace.organizeGalacticClusters()
    
    # Demonstrate higher-order complexes
    see nl
    see "=== Higher-Order Simplicial Complexes ===" + nl
    see "Beyond triangulation, Morgen can form higher-dimensional geometric structures:" + nl
    see "- Tetrahedron (3-simplex): 4 symbols forming a 3D structure" + nl
    see "- These complexes create richer semantic relationships" + nl
    see "- They enable more sophisticated reasoning and insight generation" + nl
    oMorgenSpace.createHigherOrderComplex([oAlpha, oBeta, oGamma, oDelta], "semantic")
    oMorgenSpace.createHigherOrderComplex([oEpsilon, oZeta, oAlpha, oBeta], "conceptual")
    
    # Demonstrate Gabriel's Horn model
    see nl
    see "=== Inverted Gabriel's Horn Model ===" + nl
    see "The cognitive space is modeled as an Inverted Gabriel's Horn:" + nl
    see "- As radius approaches Center 0, volume becomes finite" + nl
    see "- But surface area approaches infinity" + nl
    see "- This creates infinite potential for meaning interaction in a finite cognitive space" + nl
    
    see "Standard radius of " + oMostEssential.cId + ": " + oMostEssential.nRadius + nl
    see "Horn-adjusted radius: " + oMorgenSpace.adjustRadiusWithHorn(oMostEssential.nRadius) + nl
    
    see nl
    see "Horn effect at different distances from Center 0:" + nl
    for r = 0.2 to 1 step 0.2 {
        see "  Standard radius: " + r + " → Horn-adjusted: " + oMorgenSpace.adjustRadiusWithHorn(r) + nl
    }
    
    # Demonstrate global resonance
    see nl
    see "=== Global Cognitive Resonance ===" + nl
    see "The entire cognitive space has a global resonance that affects all symbols:" + nl
    see "- More symbols and relationships increase global resonance" + nl
    see "- Symbols closer to Center 0 are more affected by global resonance" + nl
    see "- This creates emergent system-wide properties beyond individual symbols" + nl
    oMorgenSpace.updateGlobalResonance()
    see "Current global resonance: " + oMorgenSpace.nGlobalResonance + nl
    
    # ===== PART 3: INTEGRATED SIMULATION =====
    see nl
    see "==================================================" + nl
    see "PART 3: INTEGRATED MORGEN SIMULATION" + nl
    see "==================================================" + nl
    see "Running enhanced dream cycles with all features active..." + nl
    see "This demonstrates how all Morgen features work together to create" + nl
    see "a rich, dynamic cognitive system with emergent properties." + nl
    
    # Run enhanced dream cycles that integrate all features
    for i = 1 to 3 {
        see nl
        see "--- Enhanced Dream Cycle #" + i + " ---" + nl
        
        # 1. Propagate waves
        see "1. Propagating meaning waves..." + nl
        oMorgenSpace.propagateWaves()
        
        # 2. Run dream cycle
        see "2. Running dream cycle (Ḥall + Lamm + Ḥulm)..." + nl
        
        # Select two symbols for the dream cycle
        # For demonstration, we'll use a simple selection strategy
        nIdx1 = (i * 2) % len(oMorgenSpace.aSymbols) + 1
        nIdx2 = (i * 3) % len(oMorgenSpace.aSymbols) + 1
        
        # Ensure we don't use the same symbol twice
        if nIdx1 = nIdx2 { nIdx2 = (nIdx2 + 1) % len(oMorgenSpace.aSymbols) + 1 }
        
        oMorgenSpace.dreamCycle(oMorgenSpace.aSymbols[nIdx1], oMorgenSpace.aSymbols[nIdx2])
        
        # 3. Update global resonance
        see "3. Updating global cognitive resonance..." + nl
        oMorgenSpace.updateGlobalResonance()
        
        # 4. Reorganize galactic clusters
        see "4. Reorganizing galactic clusters..." + nl
        oMorgenSpace.organizeGalacticClusters()
        
        # 5. Form new higher-order complexes
        see "5. Forming new higher-order complexes..." + nl
        
        # Select 4 symbols for a new complex
        aComplexSymbols = []
        for j = 1 to 4 {
            nIdx = ((i * j) % len(oMorgenSpace.aSymbols)) + 1
            add(aComplexSymbols, oMorgenSpace.aSymbols[nIdx])
        }
        
        oMorgenSpace.createHigherOrderComplex(aComplexSymbols, "emergent_" + i)
    }
    
    # Display final state
    see nl
    see "==================================================" + nl
    see "FINAL STATE OF MORGEN COGNITIVE SPACE" + nl
    see "==================================================" + nl
    see nl
    oMorgenSpace.display()
    
    # Summary
    see nl
    see "=== Morgen Simulation Summary ===" + nl
    see "Total symbols: " + len(oMorgenSpace.aSymbols) + nl
    see "Total dream cycles: " + oMorgenSpace.nEpoch + nl
    see "Global resonance: " + oMorgenSpace.nGlobalResonance + nl
    see "Galactic clusters: " + len(oMorgenSpace.aGalaxies) + nl
    see "Higher-order complexes: " + len(oMorgenSpace.aComplexes) + nl
    see "Most essential symbol: " + oMorgenSpace.getMostEssentialSymbol().cId + 
        " (radius: " + oMorgenSpace.getMostEssentialSymbol().nRadius + ")" + nl
    
    see nl
    see "Morgen AI Simulation completed." + nl
    see "==================================================" + nl
}



