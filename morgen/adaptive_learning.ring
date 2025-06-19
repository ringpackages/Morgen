# ==============================================================================
# File: adaptive_learning.ring
# Description: Adaptive learning system for Morgen AI
# Author: Morgen AI Project
# ==============================================================================

load "space.ring"
load "insight_engine.ring"

# ==============================================================================
# Adaptive Learning System Class
# ==============================================================================

class AdaptiveLearning {
    ### --- Public Attributes & Methods ---
    oMorgenSpace        # Reference to the cognitive space
    oInsightEngine      # Reference to the insight engine
    aLearningHistory    # History of learning experiences
    aPerformanceMetrics # Performance tracking
    nAdaptationRate     # Rate of adaptation (0-1)
    aLearningGoals      # Current learning objectives

    /*
    Function: init
    Description: Initializes the adaptive learning system
    */
    func init oSpace, oInsights {
        if not (isObject(oSpace) and isObject(oInsights)) {
            raise("AdaptiveLearning.init: Invalid input objects")
        }
        
        self.oMorgenSpace = oSpace
        self.oInsightEngine = oInsights
        self.aLearningHistory = []
        self.aPerformanceMetrics = []
        self.nAdaptationRate = 0.3
        self.aLearningGoals = []
        
        # Initialize default learning goals
        self.initializeDefaultGoals()
        
        see "Adaptive learning system initialized" + nl
    }

    /*
    Function: initializeDefaultGoals
    Description: Sets up default learning objectives
    */
    func initializeDefaultGoals {
        # Goal 1: Maximize global resonance
        oGoal1 = [
            "id" = "maximize_resonance",
            "description" = "Maximize global resonance of the cognitive space",
            "target_value" = 5.0,
            "current_value" = self.oMorgenSpace.nGlobalResonance,
            "priority" = 0.8,
            "strategy" = "resonance_optimization"
        ]
        add(self.aLearningGoals, oGoal1)
        
        # Goal 2: Increase symbol diversity
        oGoal2 = [
            "id" = "increase_diversity",
            "description" = "Increase diversity of symbol types",
            "target_value" = 10,
            "current_value" = self.countSymbolTypes(),
            "priority" = 0.6,
            "strategy" = "diversity_enhancement"
        ]
        add(self.aLearningGoals, oGoal2)
        
        # Goal 3: Optimize triangulation stability
        oGoal3 = [
            "id" = "optimize_triangulations",
            "description" = "Optimize triangulation stability",
            "target_value" = 0.8,
            "current_value" = self.calculateAverageTriangulationStability(),
            "priority" = 0.7,
            "strategy" = "structural_optimization"
        ]
        add(self.aLearningGoals, oGoal3)
        
        # Goal 4: Enhance linguistic coherence
        oGoal4 = [
            "id" = "linguistic_coherence",
            "description" = "Enhance linguistic symbol coherence",
            "target_value" = 0.9,
            "current_value" = self.calculateLinguisticCoherence(),
            "priority" = 0.9,
            "strategy" = "linguistic_optimization"
        ]
        add(self.aLearningGoals, oGoal4)
    }

    /*
    Function: adaptiveLearningCycle
    Description: Main adaptive learning cycle
    */
    func adaptiveLearningCycle {
        see "=== Adaptive Learning Cycle ===" + nl
        
        # 1. Assess current state
        self.assessCurrentState()
        
        # 2. Discover insights
        self.oInsightEngine.discoverInsights()
        
        # 3. Evaluate goal progress
        self.evaluateGoalProgress()
        
        # 4. Adapt strategies based on performance
        self.adaptStrategies()
        
        # 5. Execute adaptive dream cycle
        self.executeAdaptiveDreamCycle()
        
        # 6. Record learning experience
        self.recordLearningExperience()
        
        see "Adaptive learning cycle completed" + nl
    }

    /*
    Function: assessCurrentState
    Description: Assesses the current state of the cognitive space
    */
    func assessCurrentState {
        see "  Assessing current cognitive state..." + nl
        
        oCurrentState = [
            "epoch" = self.oMorgenSpace.nEpoch,
            "total_symbols" = len(self.oMorgenSpace.aSymbols),
            "global_resonance" = self.oMorgenSpace.nGlobalResonance,
            "triangulations" = len(self.oMorgenSpace.aTriangulations),
            "galaxies" = len(self.oMorgenSpace.aGalaxies),
            "active_waves" = len(self.oMorgenSpace.aWaveFronts),
            "symbol_types" = self.countSymbolTypes(),
            "condensed_symbols" = self.countCondensedSymbols(),
            "linguistic_coherence" = self.calculateLinguisticCoherence(),
            "triangulation_stability" = self.calculateAverageTriangulationStability()
        ]
        
        # Update current values in goals
        for oGoal in self.aLearningGoals {
            if oGoal["id"] = "maximize_resonance" {
                oGoal["current_value"] = oCurrentState["global_resonance"]
            elseif oGoal["id"] = "increase_diversity" 
                oGoal["current_value"] = oCurrentState["symbol_types"]
            elseif oGoal["id"] = "optimize_triangulations" 
                oGoal["current_value"] = oCurrentState["triangulation_stability"]
            elseif oGoal["id"] = "linguistic_coherence" 
                oGoal["current_value"] = oCurrentState["linguistic_coherence"]
            }
        }
        
        see "    Current state assessed: " + oCurrentState["total_symbols"] + " symbols, " +
            oCurrentState["global_resonance"] + " resonance" + nl
    }

    /*
    Function: evaluateGoalProgress
    Description: Evaluates progress towards learning goals
    */
    func evaluateGoalProgress {
        see "  Evaluating goal progress..." + nl
        
        for oGoal in self.aLearningGoals {
            nProgress = 0
            
            if oGoal["target_value"] > 0 {
                nProgress = oGoal["current_value"] / oGoal["target_value"]
                if nProgress > 1 { nProgress = 1 }
            }
            
            oGoal["progress"] = nProgress
            oGoal["achievement_rate"] = nProgress * oGoal["priority"]
            
            see "    Goal '" + oGoal["id"] + "': " + (nProgress * 100) + "% complete" + nl
        }
    }

    /*
    Function: adaptStrategies
    Description: Adapts learning strategies based on goal progress
    */
    func adaptStrategies {
        see "  Adapting learning strategies..." + nl
        
        # Find underperforming goals
        aUnderperforming = []
        for oGoal in self.aLearningGoals {
            if oGoal["progress"] < 0.7 {  # Less than 70% progress
                add(aUnderperforming, oGoal)
            }
        }
        
        # Adapt strategies for underperforming goals
        for oGoal in aUnderperforming {
            cOldStrategy = oGoal["strategy"]
            
            if oGoal["id"] = "maximize_resonance" {
                if oGoal["progress"] < 0.5 {
                    oGoal["strategy"] = "aggressive_resonance_boost"
                    self.nAdaptationRate = min(0.8, self.nAdaptationRate + 0.1)
                }
            elseif oGoal["id"] = "increase_diversity" 
                if oGoal["progress"] < 0.6 {
                    oGoal["strategy"] = "forced_diversification"
                }
            elseif oGoal["id"] = "optimize_triangulations" 
                if oGoal["progress"] < 0.5 {
                    oGoal["strategy"] = "triangulation_reinforcement"
                }
            elseif oGoal["id"] = "linguistic_coherence" 
                if oGoal["progress"] < 0.7 {
                    oGoal["strategy"] = "linguistic_consolidation"
                }
            }
            
            if oGoal["strategy"] != cOldStrategy {
                see "    Adapted strategy for '" + oGoal["id"] + "': " + 
                    cOldStrategy + " → " + oGoal["strategy"] + nl
            }
        }
    }

    /*
    Function: executeAdaptiveDreamCycle
    Description: Executes a dream cycle adapted to current learning goals
    */
    func executeAdaptiveDreamCycle {
        see "  Executing adaptive dream cycle..." + nl
        
        # Determine which type of dream cycle to use based on goals
        cDreamCycleType = self.selectOptimalDreamCycle()
        
        if cDreamCycleType = "aggressive" {
            self.executeAggressiveDreamCycle()
        elseif cDreamCycleType = "conservative" 
            self.oMorgenSpace.enhancedDreamCycle()
        elseif cDreamCycleType = "targeted" 
            self.executeTargetedDreamCycle()
        else 
            self.oMorgenSpace.advancedDreamCycle()
        }
        
        # Apply post-cycle adaptations
        self.applyPostCycleAdaptations()
    }

    /*
    Function: selectOptimalDreamCycle
    Description: Selects the optimal dream cycle type based on current goals
    */
    func selectOptimalDreamCycle {
        # Calculate overall goal achievement
        nTotalAchievement = 0
        for oGoal in self.aLearningGoals {
            nTotalAchievement += oGoal["achievement_rate"]
        }
        nAvgAchievement = nTotalAchievement / len(self.aLearningGoals)
        
        if nAvgAchievement < 0.4 {
            return "aggressive"
        elseif nAvgAchievement > 0.8 
            return "conservative"
        else 
            return "targeted"
        }
    }

    /*
    Function: executeAggressiveDreamCycle
    Description: Executes an aggressive dream cycle for rapid learning
    */
    func executeAggressiveDreamCycle {
        see "    Using aggressive dream cycle..." + nl
        
        # Increase decomposition rate
        nOriginalThreshold = 0.3
        
        # Temporarily modify selection criteria for more aggressive decomposition
        for oSymbol in self.oMorgenSpace.aSymbols {
            if isObject(oSymbol) and oSymbol.nEnergyLevel < 0.5 {
                oSymbol.nEnergyLevel *= 0.8  # Reduce energy to trigger decomposition
            }
        }
        
        # Run multiple cycles
        for i = 1 to 2 {
            self.oMorgenSpace.advancedDreamCycle()
        }
        
        # Force additional wave generation
        self.generateAdaptiveWaves()
    }

    /*
    Function: executeTargetedDreamCycle
    Description: Executes a targeted dream cycle focused on specific goals
    */
    func executeTargetedDreamCycle {
        see "    Using targeted dream cycle..." + nl
        
        # Identify priority goals
        aPriorityGoals = []
        for oGoal in self.aLearningGoals {
            if oGoal["priority"] > 0.7 and oGoal["progress"] < 0.6 {
                add(aPriorityGoals, oGoal)
            }
        }
        
        # Apply targeted interventions
        for oGoal in aPriorityGoals {
            if oGoal["id"] = "maximize_resonance" {
                self.boostGlobalResonance()
            elseif oGoal["id"] = "increase_diversity" 
                self.forceDiversification()
            elseif oGoal["id"] = "optimize_triangulations" 
                self.reinforceTriangulations()
            elseif oGoal["id"] = "linguistic_coherence" 
                self.consolidateLinguisticSymbols()
            }
        }
        
        # Run standard advanced cycle
        self.oMorgenSpace.advancedDreamCycle()
    }

    /*
    Function: boostGlobalResonance
    Description: Applies interventions to boost global resonance
    */
    func boostGlobalResonance {
        see "      Boosting global resonance..." + nl
        
        # Increase resonance of high-energy symbols
        for oSymbol in self.oMorgenSpace.aSymbols {
            if isObject(oSymbol) and oSymbol.nEnergyLevel > 0.7 {
                oSymbol.nResonance *= 1.2
            }
        }
        
        # Create resonance waves
        nWavesCreated = 0
        for oSymbol in self.oMorgenSpace.aSymbols {
            if isObject(oSymbol) and oSymbol.nResonance > 2.0 and nWavesCreated < 3 {
                self.oMorgenSpace.initiateWave(oSymbol, "resonance_wave", 0.9)
                nWavesCreated++
            }
        }
    }

    /*
    Function: forceDiversification
    Description: Forces creation of diverse symbol types
    */
    func forceDiversification {
        see "      Forcing diversification..." + nl
        
        # Create diverse test symbols
        aNewTypes = ["experimental", "hybrid", "synthetic", "emergent"]
        
        for cType in aNewTypes {
            # Create a symbol with unique characteristics
            aUniqueGenome = []
            for i = 1 to 6 {
                add(aUniqueGenome, random(2) + 1)
            }
            
            nRadius = 0.3 + (random(50) / 100.0)
            nAngle = random(360)
            
            oNewSymbol = new MorgenSymbol("adaptive_" + cType + "_" + random(1000), 
                                          cType, aUniqueGenome, nRadius, nAngle, null)
            oNewSymbol.nEnergyLevel = 0.8
            oNewSymbol.nResonance = 1.5
            
            self.oMorgenSpace.addSymbol(oNewSymbol)
        }
    }

    /*
    Function: reinforceTriangulations
    Description: Reinforces existing triangulations and creates new ones
    */
    func reinforceTriangulations {
        see "      Reinforcing triangulations..." + nl
        
        # Boost resonance of triangulated symbols
        for oTriangulation in self.oMorgenSpace.aTriangulations {
            aSymbolIds = oTriangulation["symbols"]
            
            for cSymbolId in aSymbolIds {
                oSymbol = self.oMorgenSpace.getSymbolById(cSymbolId)
                if isObject(oSymbol) {
                    oSymbol.nResonance *= 1.15
                }
            }
        }
        
        # Force creation of new triangulations
        if len(self.oMorgenSpace.aSymbols) >= 6 {
            for i = 1 to min(3, len(self.oMorgenSpace.aSymbols) - 5) step 3 {
                if i + 2 <= len(self.oMorgenSpace.aSymbols) {
                    self.oMorgenSpace.createTriangulation(self.oMorgenSpace.aSymbols[i],
                                                         self.oMorgenSpace.aSymbols[i+1],
                                                         self.oMorgenSpace.aSymbols[i+2],
                                                         "adaptive_triangulation")
                }
            }
        }
    }

    /*
    Function: consolidateLinguisticSymbols
    Description: Consolidates and optimizes linguistic symbols
    */
    func consolidateLinguisticSymbols {
        see "      Consolidating linguistic symbols..." + nl
        
        # Find linguistic symbols
        aLinguisticSymbols = []
        for oSymbol in self.oMorgenSpace.aSymbols {
            if isObject(oSymbol) and (oSymbol.cType = "arabic_letter" or 
                                     oSymbol.cType = "arabic_word" or 
                                     oSymbol.cType = "triconsonantal_root" or 
                                     oSymbol.cType = "text_meaning") {
                add(aLinguisticSymbols, oSymbol)
            }
        }
        
        # Boost energy and resonance of linguistic symbols
        for oSymbol in aLinguisticSymbols {
            oSymbol.nEnergyLevel = min(1.0, oSymbol.nEnergyLevel * 1.1)
            oSymbol.nResonance = min(5.0, oSymbol.nResonance * 1.05)
        }
        
        # Create linguistic coherence waves
        if len(aLinguisticSymbols) > 0 {
            oSourceSymbol = aLinguisticSymbols[1]
            for oSymbol in aLinguisticSymbols {
                if oSymbol.nResonance > oSourceSymbol.nResonance {
                    oSourceSymbol = oSymbol
                }
            }
            
            self.oMorgenSpace.initiateWave(oSourceSymbol, "linguistic_coherence_wave", 0.8)
        }
    }

    /*
    Function: generateAdaptiveWaves
    Description: Generates waves adapted to current learning needs
    */
    func generateAdaptiveWaves {
        see "      Generating adaptive waves..." + nl
        
        nWavesGenerated = 0
        
        for oGoal in self.aLearningGoals {
            if oGoal["progress"] < 0.5 and nWavesGenerated < 3 {
                # Find suitable symbol for wave generation
                oSourceSymbol = self.findOptimalWaveSource(oGoal)
                
                if isObject(oSourceSymbol) {
                    cWaveType = "adaptive_" + oGoal["id"] + "_wave"
                    nWaveEnergy = (1.0 - oGoal["progress"]) * 0.8
                    
                    self.oMorgenSpace.initiateWave(oSourceSymbol, cWaveType, nWaveEnergy)
                    nWavesGenerated++
                }
            }
        }
        
        see "        Generated " + nWavesGenerated + " adaptive waves" + nl
    }

    /*
    Function: findOptimalWaveSource
    Description: Finds the optimal symbol to generate waves for a specific goal
    */
    func findOptimalWaveSource oGoal {
        oOptimalSymbol = null
        nBestScore = 0
        
        for oSymbol in self.oMorgenSpace.aSymbols {
            if isObject(oSymbol) {
                nScore = 0
                
                # Score based on goal type
                if oGoal["id"] = "maximize_resonance" {
                    nScore = oSymbol.nResonance * oSymbol.nEnergyLevel
                elseif oGoal["id"] = "increase_diversity" 
                    if oSymbol.cType != "arabic_letter" {  # Prefer non-basic types
                        nScore = oSymbol.nEnergyLevel * 2
                    }
                elseif oGoal["id"] = "optimize_triangulations" 
                    # Check if symbol is part of triangulations
                    for oTriangulation in self.oMorgenSpace.aTriangulations {
                        if find(oTriangulation["symbols"], oSymbol.cId) > 0 {
                            nScore += 1
                        }
                    }
                    nScore *= oSymbol.nResonance
                elseif oGoal["id"] = "linguistic_coherence" 
                    if oSymbol.cType = "arabic_word" or oSymbol.cType = "text_meaning" {
                        nScore = oSymbol.nResonance * 2
                    }
                }
                
                if nScore > nBestScore {
                    nBestScore = nScore
                    oOptimalSymbol = oSymbol
                }
            }
        }
        
        return oOptimalSymbol
    }

    /*
    Function: applyPostCycleAdaptations
    Description: Applies adaptations after the dream cycle
    */
    func applyPostCycleAdaptations {
        see "    Applying post-cycle adaptations..." + nl
        
        # Update global resonance
        self.oMorgenSpace.updateGlobalResonance()
        
        # Apply adaptive modifications based on results
        for oGoal in self.aLearningGoals {
            if oGoal["strategy"] = "aggressive_resonance_boost" {
                # Normalize any excessive resonance values
                for oSymbol in self.oMorgenSpace.aSymbols {
                    if isObject(oSymbol) and oSymbol.nResonance > 10.0 {
                        oSymbol.nResonance = 10.0
                    }
                }
            }
        }
    }

    /*
    Function: recordLearningExperience
    Description: Records the learning experience for future adaptation
    */
    func recordLearningExperience {
        oExperience = [
            "epoch" = self.oMorgenSpace.nEpoch,
            "goals_before" = [],
            "goals_after" = [],
            "strategies_used" = [],
            "adaptation_rate" = self.nAdaptationRate,
            "insights_discovered" = len(self.oInsightEngine.aInsightPatterns)
        ]
        
        # Record goal states
        for oGoal in self.aLearningGoals {
            add(oExperience["goals_after"], [oGoal["id"], oGoal["progress"], oGoal["strategy"]])
        }
        
        add(self.aLearningHistory, oExperience)
        
        # Keep only recent history (last 10 experiences)
        if len(self.aLearningHistory) > 10 {
            del(self.aLearningHistory, 1)
        }
    }

    /*
    Function: countSymbolTypes
    Description: Counts the number of different symbol types
    */
    func countSymbolTypes {
        aTypes = []
        
        for oSymbol in self.oMorgenSpace.aSymbols {
            if isObject(oSymbol) and find(aTypes, oSymbol.cType) = 0 {
                add(aTypes, oSymbol.cType)
            }
        }
        
        return len(aTypes)
    }

    /*
    Function: countCondensedSymbols
    Description: Counts the number of condensed symbols
    */
    func countCondensedSymbols {
        nCount = 0
        
        for oSymbol in self.oMorgenSpace.aSymbols {
            if isObject(oSymbol) and oSymbol.nCondensationValue > 0 {
                nCount++
            }
        }
        
        return nCount
    }

    /*
    Function: calculateLinguisticCoherence
    Description: Calculates the coherence of linguistic symbols
    */
    func calculateLinguisticCoherence {
        aLinguisticSymbols = []
        
        for oSymbol in self.oMorgenSpace.aSymbols {
            if isObject(oSymbol) and (oSymbol.cType = "arabic_letter" or 
                                     oSymbol.cType = "arabic_word" or 
                                     oSymbol.cType = "triconsonantal_root" or 
                                     oSymbol.cType = "text_meaning") {
                add(aLinguisticSymbols, oSymbol)
            }
        }
        
        if len(aLinguisticSymbols) < 2 {
            return 0
        }
        
        # Calculate average resonance of linguistic symbols
        nTotalResonance = 0
        for oSymbol in aLinguisticSymbols {
            nTotalResonance += oSymbol.nResonance
        }
        
        nAvgResonance = nTotalResonance / len(aLinguisticSymbols)
        
        # Normalize to 0-1 range
        return min(1.0, nAvgResonance / 5.0)
    }

    /*
    Function: calculateAverageTriangulationStability
    Description: Calculates the average stability of all triangulations
    */
    func calculateAverageTriangulationStability {
        if len(self.oMorgenSpace.aTriangulations) = 0 {
            return 0
        }
        
        nTotalStability = 0
        nValidTriangulations = 0
        
        for oTriangulation in self.oMorgenSpace.aTriangulations {
            aSymbolIds = oTriangulation["symbols"]
            
            if len(aSymbolIds) = 3 {
                oSym1 = self.oMorgenSpace.getSymbolById(aSymbolIds[1])
                oSym2 = self.oMorgenSpace.getSymbolById(aSymbolIds[2])
                oSym3 = self.oMorgenSpace.getSymbolById(aSymbolIds[3])
                
                if isObject(oSym1) and isObject(oSym2) and isObject(oSym3) {
                    nStability = calculateTriangulationStability(oSym1, oSym2, oSym3)
                    nTotalStability += nStability
                    nValidTriangulations++
                }
            }
        }
        
        if nValidTriangulations > 0 {
            return nTotalStability / nValidTriangulations
        }
        
        return 0
    }

    /*
    Function: getLearningReport
    Description: Generates a comprehensive learning report
    */
    func getLearningReport {
        see nl + "=== Adaptive Learning Report ===" + nl
        
        see "Learning Goals Status:" + nl
        for oGoal in self.aLearningGoals {
            nProgressPercent = oGoal["progress"] * 100
            see "  " + oGoal["id"] + ": " + nProgressPercent + "% (" + oGoal["strategy"] + ")" + nl
        }
        
        see nl + "Learning History: " + len(self.aLearningHistory) + " experiences recorded" + nl
        see "Current Adaptation Rate: " + self.nAdaptationRate + nl
        
        # Calculate learning velocity
        if len(self.aLearningHistory) >= 2 {
            oRecent = self.aLearningHistory[len(self.aLearningHistory)]
            oOlder = self.aLearningHistory[len(self.aLearningHistory) - 1]
            
            nProgressImprovement = 0
            for aGoalAfter in oRecent["goals_after"] {
                for aGoalBefore in oOlder["goals_after"] {
                    if aGoalAfter[1] = aGoalBefore[1] {  # Same goal ID
                        nProgressImprovement += (aGoalAfter[2] - aGoalBefore[2])
                        break
                    }
                }
            }
            
            see "Learning Velocity: " + nProgressImprovement + " (progress change per cycle)" + nl
        }
        
        see "=== End Learning Report ===" + nl
    }

}
