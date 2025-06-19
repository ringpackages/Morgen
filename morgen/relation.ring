# ==============================================================================
# File: relation.ring
# Description: Implementation of the MorgenRelation class for the Morgen AI paradigm
# Author: Morgen AI Project
# ==============================================================================

# ==============================================================================
# Class: MorgenRelation (Relation between two symbols)
# ==============================================================================
class MorgenRelation {
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
    Description: Constructor for MorgenRelation object
    Inputs:
        oFromSymbol_ : (MorgenSymbol) Source symbol
        oToSymbol_   : (MorgenSymbol) Target symbol
        cType_       : (string) Relation type
        nStrength_   : (number) Relation strength
        oData_       : (object) Optional additional data
    */
    func init oFromSymbol_, oToSymbol_, cType_, nStrength_, oData_ {
        self.oFromSymbol = oFromSymbol_
        self.oToSymbol = oToSymbol_
        self.cType = cType_
        self.nStrength = 0 + nStrength_  # Ensure it's a number
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
