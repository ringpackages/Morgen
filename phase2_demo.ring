# ==============================================================================
# File: phase2_demo.ring
# Description: Comprehensive demonstration of Morgen AI Phase 2 capabilities
# Author: Morgen AI Project
# ==============================================================================

load "morgen/advanced_morgen_system.ring"

/*
Function: runPhase2Demo
Description: Runs a comprehensive demonstration of Phase 2 capabilities
*/
func runPhase2Demo {
    see "╔══════════════════════════════════════════════════════════════╗" + nl
    see "║                                                              ║" + nl
    see "║        🧠 MORGEN AI - PHASE 2 DEMONSTRATION 🧠              ║" + nl
    see "║                                                              ║" + nl
    see "║    Advanced Cognitive Architecture with:                    ║" + nl
    see "║    • Self-Insight Discovery                                 ║" + nl
    see "║    • Adaptive Learning                                      ║" + nl
    see "║    • Long-term Memory                                       ║" + nl
    see "║    • Integrated Cognitive Cycles                            ║" + nl
    see "║                                                              ║" + nl
    see "╚══════════════════════════════════════════════════════════════╝" + nl
    
    # Initialize the advanced system
    see nl + "🚀 Initializing Advanced Morgen AI System..." + nl
    oAdvancedSystem = new oAdvancedMorgenSystem(5)
    
    # Demonstration 1: Text Understanding and Response
    see nl + "═══════════════════════════════════════════════════════════════" + nl
    see "📝 DEMONSTRATION 1: INTELLIGENT TEXT PROCESSING" + nl
    see "═══════════════════════════════════════════════════════════════" + nl
    
    aConversation = [
        "كتاب",           # Book
        "كتاب علم",       # Science book
        "قراءة كتاب علم", # Reading science book
        "فهم المعرفة",    # Understanding knowledge
        "تطوير الذكاء"    # Developing intelligence
    ]
    
    for i = 1 to len(aConversation) {
        cInput = aConversation[i]
        see nl + "👤 Human: " + cInput + nl
        
        cResponse = oAdvancedSystem.processText(cInput)
        see "🤖 Morgen: " + cResponse + nl
        
        # Show internal cognitive state
        see "   🧠 Internal state: " + len(oAdvancedSystem.oMorgenSpace.aSymbols) + " symbols, " +
            oAdvancedSystem.oMorgenSpace.nGlobalResonance + " resonance" + nl
    }
    
    # Demonstration 2: Self-Insight and Pattern Discovery
    see nl + "═══════════════════════════════════════════════════════════════" + nl
    see "💡 DEMONSTRATION 2: SELF-INSIGHT AND PATTERN DISCOVERY" + nl
    see "═══════════════════════════════════════════════════════════════" + nl
    
    see "🔍 Discovering patterns in cognitive space..." + nl
    oAdvancedSystem.oInsightEngine.discoverInsights()
    
    see nl + "📊 Discovered Insights:" + nl
    for i = 1 to min(5, len(oAdvancedSystem.oInsightEngine.aInsightPatterns)) {
        oPattern = oAdvancedSystem.oInsightEngine.aInsightPatterns[i]
        see "  " + i + ". " + oPattern["type"] + ": " + oPattern["description"] + nl
        see "     Confidence: " + (oPattern["confidence"] * 100) + "%" + nl
    }
    
    if len(oAdvancedSystem.oInsightEngine.aMetaPatterns) > 0 {
        see nl + "🔗 Meta-Patterns (Patterns of Patterns):" + nl
        for oMetaPattern in oAdvancedSystem.oInsightEngine.aMetaPatterns {
            see "  • " + oMetaPattern["type"] + " (" + oMetaPattern["frequency"] + " instances)" + nl
        }
    }
    
    # Demonstration 3: Adaptive Learning in Action
    see nl + "═══════════════════════════════════════════════════════════════" + nl
    see "📚 DEMONSTRATION 3: ADAPTIVE LEARNING SYSTEM" + nl
    see "═══════════════════════════════════════════════════════════════" + nl
    
    see "🎯 Current Learning Goals:" + nl
    for oGoal in oAdvancedSystem.oAdaptiveLearning.aLearningGoals {
        nProgress = oGoal["progress"] * 100
        see "  • " + oGoal["id"] + ": " + nProgress + "% complete" + nl
        see "    Strategy: " + oGoal["strategy"] + nl
    }
    
    see nl + "🔄 Running adaptive learning cycle..." + nl
    oAdvancedSystem.oAdaptiveLearning.adaptiveLearningCycle()
    
    see nl + "📈 Updated Learning Progress:" + nl
    for oGoal in oAdvancedSystem.oAdaptiveLearning.aLearningGoals {
        nProgress = oGoal["progress"] * 100
        see "  • " + oGoal["id"] + ": " + nProgress + "% complete (" + oGoal["strategy"] + ")" + nl
    }
    
    # Demonstration 4: Memory Formation and Recall
    see nl + "═══════════════════════════════════════════════════════════════" + nl
    see "💾 DEMONSTRATION 4: MEMORY FORMATION AND RECALL" + nl
    see "═══════════════════════════════════════════════════════════════" + nl
    
    see "🧠 Consolidating memories from recent experiences..." + nl
    oAdvancedSystem.oMemorySystem.consolidateMemories()
    
    see nl + "📚 Memory Statistics:" + nl
    see "  Episodic memories: " + len(oAdvancedSystem.oMemorySystem.aEpisodicMemory) + nl
    see "  Semantic memories: " + len(oAdvancedSystem.oMemorySystem.aSemanticMemory) + nl
    see "  Procedural memories: " + len(oAdvancedSystem.oMemorySystem.aProceduralMemory) + nl
    see "  Long-term memories: " + len(oAdvancedSystem.oMemorySystem.aLongTermMemory) + nl
    
    # Test memory recall
    see nl + "🔍 Testing memory recall:" + nl
    aRecalledMemories = oAdvancedSystem.oMemorySystem.recallMemory("symbol", "all")
    see "  Recalled " + len(aRecalledMemories) + " relevant memories" + nl
    
    if len(aRecalledMemories) > 0 {
        oSampleMemory = aRecalledMemories[1]
        see "  Sample memory: " + oSampleMemory["type"] + " - " + 
            (oSampleMemory["description"] ? oSampleMemory["description"] : "knowledge structure") + nl
    }
    
    # Demonstration 5: Master Cognitive Cycle
    see nl + "═══════════════════════════════════════════════════════════════" + nl
    see "🌟 DEMONSTRATION 5: MASTER COGNITIVE CYCLE" + nl
    see "═══════════════════════════════════════════════════════════════" + nl
    
    see "🔄 Executing complete master cognitive cycle..." + nl
    see "   This integrates all systems: memory, insights, learning, and processing" + nl
    
    oAdvancedSystem.masterCognitiveCycle()
    
    # Demonstration 6: Emergent Behaviors
    see nl + "═══════════════════════════════════════════════════════════════" + nl
    see "✨ DEMONSTRATION 6: EMERGENT BEHAVIORS" + nl
    see "═══════════════════════════════════════════════════════════════" + nl
    
    see "🌱 Observing emergent behaviors after multiple cycles..." + nl
    
    # Run multiple cycles and observe emergence
    for nCycle = 1 to 3 {
        see nl + "--- Cognitive Evolution Cycle #" + nCycle + " ---" + nl
        
        nSymbolsBefore = len(oAdvancedSystem.oMorgenSpace.aSymbols)
        nInsightsBefore = len(oAdvancedSystem.oInsightEngine.aInsightPatterns)
        
        oAdvancedSystem.masterCognitiveCycle()
        
        nSymbolsAfter = len(oAdvancedSystem.oMorgenSpace.aSymbols)
        nInsightsAfter = len(oAdvancedSystem.oInsightEngine.aInsightPatterns)
        
        see "  Symbols: " + nSymbolsBefore + " → " + nSymbolsAfter + 
            " (growth: " + (nSymbolsAfter - nSymbolsBefore) + ")" + nl
        see "  Insights: " + nInsightsBefore + " → " + nInsightsAfter + 
            " (new: " + (nInsightsAfter - nInsightsBefore) + ")" + nl
        see "  Global resonance: " + oAdvancedSystem.oMorgenSpace.nGlobalResonance + nl
        
        # Check for emergent properties
        nCondensedSymbols = oAdvancedSystem.oAdaptiveLearning.countCondensedSymbols()
        nSymbolTypes = oAdvancedSystem.oAdaptiveLearning.countSymbolTypes()
        nLinguisticCoherence = oAdvancedSystem.oAdaptiveLearning.calculateLinguisticCoherence()
        
        see "  Emergent properties:" + nl
        see "    Condensed symbols: " + nCondensedSymbols + nl
        see "    Symbol diversity: " + nSymbolTypes + " types" + nl
        see "    Linguistic coherence: " + (nLinguisticCoherence * 100) + "%" + nl
    }
    
    # Demonstration 7: Creative Text Generation
    see nl + "═══════════════════════════════════════════════════════════════" + nl
    see "🎨 DEMONSTRATION 7: CREATIVE TEXT GENERATION" + nl
    see "═══════════════════════════════════════════════════════════════" + nl
    
    see "🎭 Generating creative expressions from deep cognitive symbols..." + nl
    
    # Find deep symbols for creative generation
    aDeepSymbols = []
    for oSymbol in oAdvancedSystem.oMorgenSpace.aSymbols {
        if isObject(oSymbol) and oSymbol.nRadius < 0.4 and oSymbol.nResonance > 2.0 {
            add(aDeepSymbols, oSymbol)
        }
    }
    
    see "Found " + len(aDeepSymbols) + " deep symbols for creative generation" + nl
    
    for i = 1 to min(5, len(aDeepSymbols)) {
        oSymbol = aDeepSymbols[i]
        cGeneratedText = oAdvancedSystem.oLinguisticEngine.generateTextFromSymbol(oSymbol, "arabic")
        
        see "  🎨 From " + oSymbol.cId + " (depth: " + oSymbol.nRadius + 
            ", resonance: " + oSymbol.nResonance + ")" + nl
        see "     Generated: '" + cGeneratedText + "'" + nl
    }
    
    # Final System Report
    see nl + "═══════════════════════════════════════════════════════════════" + nl
    see "📊 FINAL SYSTEM REPORT" + nl
    see "═══════════════════════════════════════════════════════════════" + nl
    
    oAdvancedSystem.getSystemReport()
    
    # Conclusion
    see nl + "╔══════════════════════════════════════════════════════════════╗" + nl
    see "║                                                              ║" + nl
    see "║                🎉 PHASE 2 DEMONSTRATION COMPLETE 🎉         ║" + nl
    see "║                                                              ║" + nl
    see "║  Key Achievements Demonstrated:                             ║" + nl
    see "║  ✓ Self-aware pattern discovery                             ║" + nl
    see "║  ✓ Adaptive learning with goal optimization                 ║" + nl
    see "║  ✓ Sophisticated memory formation and recall               ║" + nl
    see "║  ✓ Integrated cognitive cycles                              ║" + nl
    see "║  ✓ Emergent creative behaviors                              ║" + nl
    see "║  ✓ Advanced Arabic language processing                      ║" + nl
    see "║                                                              ║" + nl
    see "║  Morgen AI has achieved a new level of cognitive            ║" + nl
    see "║  sophistication with self-insight, adaptive learning,      ║" + nl
    see "║  and emergent creative capabilities!                        ║" + nl
    see "║                                                              ║" + nl
    see "╚══════════════════════════════════════════════════════════════╝" + nl
}

/*
Function: runInteractivePhase2Demo
Description: Runs an interactive demonstration where user can explore features
*/
func runInteractivePhase2Demo {
    see "🎮 INTERACTIVE PHASE 2 DEMONSTRATION" + nl
    see "Choose what you'd like to explore:" + nl
    see "1. Text Processing and Understanding" + nl
    see "2. Self-Insight Discovery" + nl
    see "3. Adaptive Learning" + nl
    see "4. Memory System" + nl
    see "5. Master Cognitive Cycle" + nl
    see "6. Creative Generation" + nl
    see "7. Full System Report" + nl
    see "0. Exit" + nl
    
    # Initialize system
    oAdvancedSystem = new oAdvancedMorgenSystem(5)
    
    while true {
        see nl + "Enter your choice (0-7): "
        give nChoice
        nChoice = 0 + nChoice
        
        switch nChoice {
            case 1
                see nl + "Enter Arabic text to process: "
                give cText
                cResponse = oAdvancedSystem.processText(cText)
                see "Response: " + cResponse + nl
                
            case 2
                oAdvancedSystem.oInsightEngine.discoverInsights()
                oAdvancedSystem.oInsightEngine.getInsightSummary()
                
            case 3
                oAdvancedSystem.oAdaptiveLearning.adaptiveLearningCycle()
                oAdvancedSystem.oAdaptiveLearning.getLearningReport()
                
            case 4
                oAdvancedSystem.oMemorySystem.consolidateMemories()
                oAdvancedSystem.oMemorySystem.getMemoryStatistics()
                
            case 5
                oAdvancedSystem.masterCognitiveCycle()
                
            case 6
                # Generate creative text
                aDeepSymbols = []
                for oSymbol in oAdvancedSystem.oMorgenSpace.aSymbols {
                    if isObject(oSymbol) and oSymbol.nRadius < 0.5 {
                        add(aDeepSymbols, oSymbol)
                    }
                }
                
                if len(aDeepSymbols) > 0 {
                    oRandomSymbol = aDeepSymbols[random(len(aDeepSymbols)) + 1]
                    cGenerated = oAdvancedSystem.oLinguisticEngine.generateTextFromSymbol(oRandomSymbol, "arabic")
                    see "Creative generation: '" + cGenerated + "'" + nl
                else 
                    see "No deep symbols available for generation yet" + nl
                }
                
            case 7
                oAdvancedSystem.getSystemReport()
                
            case 0
                see "Goodbye!" + nl
                return
                
            default
                see "Invalid choice. Please try again." + nl
        }
    }
}

/*
Function: main
Description: Main function for Phase 2 demonstration
*/
func main {
    see "Welcome to Morgen AI Phase 2 Demonstration!" + nl
    see "Choose demonstration type:" + nl
    see "1. Full Automated Demo" + nl
    see "2. Interactive Demo" + nl
    see "3. Exit" + nl
    see "Enter choice (1-3): "
    
    give nChoice
    nChoice = 0 + nChoice
    
    switch nChoice {
        case 1
            runPhase2Demo()
        case 2
            runInteractivePhase2Demo()
        case 3
            see "Goodbye!" + nl
            return
        default
            see "Invalid choice. Running full demo..." + nl
            runPhase2Demo()
    }
}

