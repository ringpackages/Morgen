# ==============================================================================
# File: symbol.ring
# Description: Implementation of the MorgenSymbol class for the Morgen AI paradigm
# Author: Morgen AI Project
# ==============================================================================
load "utils.ring"

# ==============================================================================
# Class: MorgenSymbol (Living Symbol - Fractal Knowledge Unit)
# ==============================================================================
class MorgenSymbol {
    ### --- Public Attributes & Methods ---
    cId             # Unique identifier for the symbol
    cType           # Symbol type (concept, experience, feeling, pattern, etc.)
    aGenome         # "Genome" or "fractal signature" (list of values)
                    # Represents geomancy-inspired fundamental states
    nRadius         # Distance from "Center 0" (represents depth/essentiality)
    nAngle          # Angle (represents context/perspective in Point-and-Circle space)
    aRelations      # List of MorgenRelation objects connecting to other symbols
    oData           # Additional data specific to this symbol
    nResonance      # Resonance value (how strongly this symbol "vibrates" in the cognitive space)
    nEnergyLevel    # Energy level of the symbol (affects dream cycle participation)
    aSubSymbols     # List of sub-symbols (for fractal decomposition)
    bIsSeed         # Boolean indicating if this is a seed symbol (basic building block)
    nCondensationValue # Value representing how "condensed" this symbol is (Ramanujan-inspired)
    nFractalDepth   # How many levels of fractal complexity this symbol contains
    cCodeType       # نوع الكود
    cTargetLanguage # لغة البرمجة المستهدفة
    nComplexityLevel # مستوى التعقيد
    /*
    Function: init
    Description: Constructor for MorgenSymbol object
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
        self.nEnergyLevel = 1.0  # Default energy level
        self.aSubSymbols = []  # Empty initially
        self.bIsSeed = false  # Default to false, can be set explicitly for seed symbols
        self.nCondensationValue = 0.0  # Default to no condensation
        self.nFractalDepth = len(aGenome_) / 2  # Simple initial fractal depth estimation

        # خصائص إضافية للكود
        self.cCodeType = ""  # نوع الكود
        self.cTargetLanguage = ""  # لغة البرمجة المستهدفة
        self.nComplexityLevel = 0.0  # مستوى التعقيد
    }

    /*
    Function: addRelation
    Description: Adds a new relation from this symbol to another
    Inputs:
        oTargetSymbol : (MorgenSymbol) Target symbol for the relation
        cRelationType : (string) Type of relation (e.g., "similar", "cause", "fractal_child")
        nStrength     : (number) Strength of the relation
        oData         : (object) Optional additional data for the relation
    */
    func addRelation oTargetSymbol, cRelationType, nStrength, oData {
        if not isObject(oTargetSymbol) {
            raise("MorgenSymbol.addRelation: Target must be an MorgenSymbol object")
        }
        # Ensure nStrength is a number
        nStrengthValue = 0 + nStrength  # Convert to number
         oNewRelation = new MorgenRelation( self, oTargetSymbol, cRelationType, nStrengthValue, oData)
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
        see "  Energy    : " + self.nEnergyLevel + nl
        see "  Is Seed   : " + self.bIsSeed + nl
        see "  Condensation: " + self.nCondensationValue + nl
        see "  Fractal Depth: " + self.nFractalDepth + nl
        if len(self.aSubSymbols) > 0 {
            see "  Sub-symbols: " + len(self.aSubSymbols) + " elements" + nl
        }
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
        for i = 1 to len(self.aGenome) {
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

    /*
    Function: deconstructToSeeds
    Description: Deconstructs this symbol into its constituent seed symbols
    Outputs: (list) List of seed symbols
    */
    func deconstructToSeeds {
        aSeeds = []

        # If this symbol is already a seed, return itself
        if self.bIsSeed {
            add(aSeeds, self)
            return aSeeds
        }

        # If it has sub-symbols, deconstruct those
        if len(self.aSubSymbols) > 0 {
            for oSubSymbol in self.aSubSymbols {
                if isObject(oSubSymbol) {
                    aSeedParts = oSubSymbol.deconstructToSeeds()
                    for oSeed in aSeedParts {
                        add(aSeeds, oSeed)
                    }
                }
            }
        else
            # Create seed symbols from genome components
            # Each pair of genome values creates a seed
            for i = 1 to len(self.aGenome) step 2 {
                if i + 1 <= len(self.aGenome) {
                    # Create a seed from two genome values
                    aSeedGenome = [self.aGenome[i], self.aGenome[i+1]]
                    cSeedId = self.cId + "_seed_" + i

                    # Position seeds around the original symbol
                    nSeedRadius = self.nRadius * 1.2  # Slightly further from center
                    nSeedAngle = self.nAngle + (i * 30)  # Spread around
                    if nSeedAngle >= 360 { nSeedAngle -= 360 }

                    oSeed = new MorgenSymbol(cSeedId, "seed", aSeedGenome, nSeedRadius, nSeedAngle, null)
                    oSeed.bIsSeed = true
                    oSeed.nEnergyLevel = self.nEnergyLevel * 0.7  # Seeds have lower energy

                    add(aSeeds, oSeed)
                }
            }
        }

        return aSeeds
    }

    /*
    Function: canMateWith
    Description: Determines if this symbol can mate with another symbol
    Inputs:
        oOtherSymbol : (MorgenSymbol) The other symbol to check compatibility with
    Outputs: (boolean) True if mating is possible
    */
    func canMateWith oOtherSymbol {
        if not isObject(oOtherSymbol) {
            return false
        }

        # Basic compatibility checks
        # 1. Both symbols must have energy
        if self.nEnergyLevel <= 0 or oOtherSymbol.nEnergyLevel <= 0 {
            return false
        }

        # 2. Symbols cannot mate with themselves
        if self.cId = oOtherSymbol.cId {
            return false
        }

        # 3. Check genome compatibility (geomancy-inspired rules)
        # Symbols with complementary genomes (1s and 2s) can mate better
        nCompatibilityScore = 0
        nMinLen = min(len(self.aGenome), len(oOtherSymbol.aGenome))

        if nMinLen > 0 {
            for i = 1 to nMinLen {
                # Complementary values (1+2=3) increase compatibility
                if self.aGenome[i] + oOtherSymbol.aGenome[i] = 3 {
                    nCompatibilityScore += 2
                # Same values also provide some compatibility
                elseif self.aGenome[i] = oOtherSymbol.aGenome[i]
                    nCompatibilityScore += 1
                }
            }
        }

        # 4. Distance factor - symbols too far apart cannot mate
        nDistance = sqrt(pow(self.nRadius - oOtherSymbol.nRadius, 2) +
                        pow((self.nAngle - oOtherSymbol.nAngle) * PI / 180, 2))

        if nDistance > 2.0 {  # Maximum mating distance
            return false
        }

        # 5. Minimum compatibility threshold
        nCompatibilityThreshold = nMinLen * 0.5  # At least 50% compatibility

        return nCompatibilityScore >= nCompatibilityThreshold
    }

    /*
    Function: mate
    Description: Mates this symbol with another to produce a child symbol
    Inputs:
        oOtherSymbol : (MorgenSymbol) The other parent symbol
    Outputs: (MorgenSymbol) The child symbol, or null if mating fails
    */
    func mate oOtherSymbol {
        if not self.canMateWith(oOtherSymbol) {
            return null
        }

        # Create child genome using geomancy-inspired rules
        aChildGenome = []
        nMaxLen = max(len(self.aGenome), len(oOtherSymbol.aGenome))

        for i = 1 to nMaxLen {
            nGene1 = 0
            nGene2 = 0

            # Get genes from parents (use 0 if genome is shorter)
            if i <= len(self.aGenome) { nGene1 = self.aGenome[i] }
            if i <= len(oOtherSymbol.aGenome) { nGene2 = oOtherSymbol.aGenome[i] }

            # Apply geomancy-inspired mating rules
            if nGene1 = 0 and nGene2 = 0 {
                # Both missing - random choice
                add(aChildGenome, random(2) + 1)
            elseif nGene1 = 0
                # One parent missing - inherit from other with mutation chance
                if random(10) = 1 {  # 10% mutation chance
                    add(aChildGenome, 3 - nGene2)  # Flip 1<->2
                else
                    add(aChildGenome, nGene2)
                }
            elseif nGene2 = 0
                # Other parent missing
                if random(10) = 1 {  # 10% mutation chance
                    add(aChildGenome, 3 - nGene1)  # Flip 1<->2
                else
                    add(aChildGenome, nGene1)
                }
            else
                # Both parents have genes
                if nGene1 = nGene2 {
                    # Same gene - inherit with small mutation chance
                    if random(20) = 1 {  # 5% mutation chance
                        add(aChildGenome, 3 - nGene1)  # Flip
                    else
                        add(aChildGenome, nGene1)
                    }
                else
                    # Different genes - choose randomly or create new pattern
                    nChoice = random(3)
                    if nChoice = 1 {
                        add(aChildGenome, nGene1)
                    elseif nChoice = 2
                        add(aChildGenome, nGene2)
                    else
                        # Create new pattern based on sum
                        if (nGene1 + nGene2) % 2 = 1 {
                            add(aChildGenome, 1)
                        else
                            add(aChildGenome, 2)
                        }
                    }
                }
            }
        }

        # Create child symbol
        cChildId = "child_" + self.cId + "_" + oOtherSymbol.cId + "_" + random(1000)

        # Child position - average of parents, slightly closer to center
        nChildRadius = ((self.nRadius + oOtherSymbol.nRadius) / 2) * 0.9
        if nChildRadius < 0.01 { nChildRadius = 0.01 }

        nChildAngle = (self.nAngle + oOtherSymbol.nAngle) / 2

        # Child type
        cChildType = "offspring"
        if self.bIsSeed and oOtherSymbol.bIsSeed {
            cChildType = "seed_offspring"
        }

        # Create the child
        oChild = new MorgenSymbol(cChildId, cChildType, aChildGenome, nChildRadius, nChildAngle, null)

        # Set child properties
        oChild.nEnergyLevel = (self.nEnergyLevel + oOtherSymbol.nEnergyLevel) / 2
        oChild.bIsSeed = false  # Offspring are not seeds unless both parents are seeds
        if self.bIsSeed and oOtherSymbol.bIsSeed {
            oChild.bIsSeed = true
        }

        # Add parent references as sub-symbols
        add(oChild.aSubSymbols, self)
        add(oChild.aSubSymbols, oOtherSymbol)

        # Reduce parent energy (mating costs energy)
        self.nEnergyLevel *= 0.8
        oOtherSymbol.nEnergyLevel *= 0.8

        return oChild
    }


}
