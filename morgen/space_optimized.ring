# ==============================================================================
# File: space_optimized.ring
# Description: Optimized space implementation for Morgen AI (low memory usage)
# Author: Morgen AI Project
# ==============================================================================

load "symbol.ring"

/*
Class: MorgenSpace
Description: Optimized cognitive space for Morgen AI
*/
class MorgenSpace {
    aSymbols
    nHornDepth
    nEpoch
    nGlobalResonance
    nMaxSymbols
    
    func init nHornDepth_ {
        self.aSymbols = []
        self.nEpoch = 0
        self.nHornDepth = nHornDepth_
        self.nGlobalResonance = 1.0
        self.nMaxSymbols = 100  # Reduced maximum symbols
        
        see "Morgen Cognitive Space initialized with Horn Depth: " + self.nHornDepth + nl
    }
    
    /*
    Function: addSymbol
    Description: Adds a symbol to the space, with memory management
    */
    func addSymbol oSymbol {
        if not isObject(oSymbol) {
            return
        }
        
        # Check if we need to prune symbols first
        if len(self.aSymbols) >= self.nMaxSymbols {
            self.pruneSymbols(1)
        }
        
        add(self.aSymbols, oSymbol)
    }
    
    /*
    Function: pruneSymbols
    Description: Removes least important symbols to save memory
    */
    func pruneSymbols nCount {
        if len(self.aSymbols) <= nCount { return }
        
        # Sort by energy level (descending)
        aTemp = []
        for i = 1 to len(self.aSymbols) {
            if isObject(self.aSymbols[i]) {
                add(aTemp, [i, self.aSymbols[i].nEnergyLevel])
            }
        }
        
        # Sort by energy (descending)
        for i = 1 to len(aTemp) - 1 {
            for j = i + 1 to len(aTemp) {
                if aTemp[i][2] < aTemp[j][2] {
                    temp = aTemp[i]
                    aTemp[i] = aTemp[j]
                    aTemp[j] = temp
                }
            }
        }
        
        # Keep only the most energetic symbols
        aNewSymbols = []
        for i = 1 to len(aTemp) - nCount {
            if i <= len(self.aSymbols) {
                add(aNewSymbols, self.aSymbols[aTemp[i][1]])
            }
        }
        
        self.aSymbols = aNewSymbols
    }
    
    /*
    Function: enhancedDreamCycle
    Description: Simplified dream cycle for memory efficiency
    */
    func enhancedDreamCycle {
        # Increment epoch
        self.nEpoch++
        
        see "=== Enhanced Dream Cycle #" + self.nEpoch + " ===" + nl
        
        # Simplified dream cycle
        
        # 1. Decomposition (Hall)
        see "  [Hall]: Decomposing symbols..." + nl
        aSeeds = []
        
        # Extract seeds from a subset of symbols
        nMaxToProcess = min(10, len(self.aSymbols))
        for i = 1 to nMaxToProcess {
            oSymbol = self.aSymbols[i]
            if isObject(oSymbol) and not oSymbol.bIsSeed {
                # Create a seed from this symbol
                oSeed = new MorgenSymbol(
                    "seed_" + oSymbol.cId,
                    "seed",
                    oSymbol.aGenome,
                    oSymbol.nRadius * 0.9,
                    oSymbol.nAngle,
                    "seed"
                )
                oSeed.bIsSeed = true
                oSeed.nEnergyLevel = oSymbol.nEnergyLevel * 0.8
                
                add(aSeeds, oSeed)
            }
        }
        
        see "    Created " + len(aSeeds) + " seeds" + nl
        
        # 2. Recombination (Lamm)
        see "  [Lamm]: Recombining seeds..." + nl
        aOffspring = []
        
        # Create offspring from pairs of seeds
        if len(aSeeds) >= 2 {
            for i = 1 to len(aSeeds) - 1 {
                oSeed1 = aSeeds[i]
                oSeed2 = aSeeds[i+1]
                
                if isObject(oSeed1) and isObject(oSeed2) {
                    # Create offspring
                    oOffspring = self.mateSymbols(oSeed1, oSeed2)
                    
                    if isObject(oOffspring) {
                        add(aOffspring, oOffspring)
                    }
                }
                
                # Limit offspring count
                if len(aOffspring) >= 5 { break }
            }
        }
        
        see "    Created " + len(aOffspring) + " offspring" + nl
        
        # 3. Integration (Hulm)
        see "  [Hulm]: Integrating new symbols..." + nl
        
        # Add new symbols to space
        for oSymbol in aSeeds {
            if isObject(oSymbol) {
                self.addSymbol(oSymbol)
            }
        }
        
        for oSymbol in aOffspring {
            if isObject(oSymbol) {
                self.addSymbol(oSymbol)
            }
        }
        
        # Update global resonance
        self.updateGlobalResonance()
        
        see "  Dream cycle complete. Space now contains " + len(self.aSymbols) + 
            " symbols with resonance " + self.nGlobalResonance + nl
    }
    
    /*
    Function: mateSymbols
    Description: Creates offspring from two parent symbols
    */
    func mateSymbols oParent1, oParent2 {
        if not isObject(oParent1) or not isObject(oParent2) {
            return null
        }
        
        # Create genome for offspring
        aGenome = []
        nGenomeLength = max(len(oParent1.aGenome), len(oParent2.aGenome))
        
        for i = 1 to nGenomeLength {
            # Get genes from parents
            nGene1 = 1
            nGene2 = 1
            
            if i <= len(oParent1.aGenome) {
                nGene1 = oParent1.aGenome[i]
            }
            
            if i <= len(oParent2.aGenome) {
                nGene2 = oParent2.aGenome[i]
            }
            
            # Simple crossover
            if random(2) = 1 {
                add(aGenome, nGene1)
            else
                add(aGenome, nGene2)
            }
        }
        
        # Create offspring symbol
        oOffspring = new MorgenSymbol(
            "offspring_" + oParent1.cId + "_" + oParent2.cId,
            "offspring",
            aGenome,
            0.5,
            random(360),
            "offspring"
        )
        
        # Set properties
        oOffspring.nEnergyLevel = (oParent1.nEnergyLevel + oParent2.nEnergyLevel) / 2
        oOffspring.bIsSeed = false
        
        return oOffspring
    }
    
    /*
    Function: updateGlobalResonance
    Description: Updates the global resonance of the cognitive space
    */
    func updateGlobalResonance {
        if len(self.aSymbols) = 0 {
            self.nGlobalResonance = 1.0
            return
        }
        
        # Calculate average resonance
        nTotalResonance = 0
        for oSymbol in self.aSymbols {
            nTotalResonance += oSymbol.nResonance
        }
        
        self.nGlobalResonance = nTotalResonance / len(self.aSymbols)
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
}   