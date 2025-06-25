# Class Diagram - Morgen AI Paradigm

## Overview

This document presents the class diagram for the Morgen AI Paradigm system, showing the core classes, their attributes, methods, and relationships.

## Core Classes

### MorgenSymbol Class

```mermaid
classDiagram
    class MorgenSymbol {
        -string cId
        -string cGenome
        -float nRadius
        -float nAngle
        -float nEnergyLevel
        -array aSubSymbols
        -boolean bIsSeed
        -float nCondensationValue
        -float nResonance
        -array aConnections
        
        +init(cId, cGenome, nRadius, nAngle)
        +display()
        +calculateResonanceWith(oOtherSymbol)
        +moveTowardCenter(nFactor)
        +deconstructToSeeds()
        +canMateWith(oOtherSymbol)
        +mate(oOtherSymbol)
        +addConnection(oSymbol, nStrength)
        +getDistanceTo(oOtherSymbol)
        +updateEnergyLevel()
        +isInResonanceWith(oOtherSymbol)
    }
```

### MorgenSpace Class

```mermaid
classDiagram
    class MorgenSpace {
        -array aSymbols
        -array aRelations
        -array aTriangulations
        -array aGalaxies
        -array aWaveFronts
        -array aDreamBuffer_Seeds
        -array aDreamBuffer_Candidates
        -float nGlobalResonance
        -int nEpoch
        -int nHornDepth
        -float nCenterX
        -float nCenterY
        
        +init(nHornDepth)
        +addSymbol(oSymbol)
        +removeSymbol(cSymbolId)
        +findSymbol(cSymbolId)
        +dreamCycle(oSymbol1, oSymbol2)
        +enhancedDreamCycle()
        +hallPhase()
        +lammPhase()
        +hulmPhase()
        +propagateWaves()
        +initiateWave(oSymbol, cType, nIntensity)
        +organizeGalacticClusters()
        +attemptEmergentTriangulation(oSymbol)
        +calculateGlobalResonance()
        +display()
        +getMostEssentialSymbol()
    }
```

### MorgenRelation Class

```mermaid
classDiagram
    class MorgenRelation {
        -MorgenSymbol oSymbol1
        -MorgenSymbol oSymbol2
        -float nStrength
        -string cType
        -float nResonance
        -float nHarmony
        -boolean bIsActive
        
        +init(oSymbol1, oSymbol2, nStrength, cType)
        +calculateResonance()
        +calculateHarmony()
        +updateStrength()
        +isStable()
        +display()
        +getOtherSymbol(oSymbol)
    }
```

## Advanced AI Classes

### SelfAwarenessEngine Class

```mermaid
classDiagram
    class SelfAwarenessEngine {
        -MorgenSpace oMorgenSpace
        -array aSelfPatterns
        -array aMetaCognitions
        -float nSelfAwarenessLevel
        -array aInternalStates
        
        +init(oMorgenSpace)
        +analyzeSelfPatterns()
        +generateMetaCognition()
        +updateSelfAwareness()
        +introspect()
        +recognizeSelfState()
        +adaptBehavior()
        +generateSelfReport()
    }
```

### AdaptiveLearningEngine Class

```mermaid
classDiagram
    class AdaptiveLearningEngine {
        -MorgenSpace oMorgenSpace
        -array aLearningGoals
        -array aStrategies
        -array aPerformanceMetrics
        -float nLearningRate
        
        +init(oMorgenSpace)
        +setLearningGoals(aGoals)
        +adaptStrategy()
        +evaluatePerformance()
        +updateLearningRate()
        +executeTargetedDreamCycle()
        +optimizeParameters()
        +generateLearningReport()
    }
```

### MemorySystem Class

```mermaid
classDiagram
    class MemorySystem {
        -array aEpisodicMemories
        -array aSemanticMemories
        -array aProceduralMemories
        -array aWorkingMemory
        -float nMemoryCapacity
        
        +init()
        +storeEpisodicMemory(oEvent)
        +storeSemanticMemory(oConcept)
        +storeProceduralMemory(oProcedure)
        +retrieveMemory(cQuery)
        +consolidateMemories()
        +forgetOldMemories()
        +getMemoryStatistics()
        +extractEpisodicMemories()
    }
```

## Utility Classes

### GeometryUtils Class

```mermaid
classDiagram
    class GeometryUtils {
        +calculatePolarDistance(oSymbol1, oSymbol2)
        +calculateGeometricCenter(aSymbols)
        +calculateGenomeSimilarity(cGenome1, cGenome2)
        +assessBindingPotential(oSymbol1, oSymbol2)
        +findBestMatingPairs(aSymbols)
        +calculateTriangulationStability(aTriangle)
        +isWithinRadius(oSymbol, nRadius)
        +convertToCartesian(nRadius, nAngle)
        +convertToPolar(nX, nY)
    }
```

### ArabicCharDefinitions Class

```mermaid
classDiagram
    class ArabicCharDefinitions {
        -array aCharacterMappings
        -array aTriliateralRoots
        -array aPhoneticMappings
        
        +init()
        +getCharacterGenome(cChar)
        +analyzeTriliateralRoot(cRoot)
        +getPhoneticValue(cChar)
        +isValidArabicChar(cChar)
        +extractRootFromWord(cWord)
        +generateSemanticMapping(cWord)
    }
```

## GUI Classes

### MainWindowController Class

```mermaid
classDiagram
    class MainWindowController {
        -MorgenSpace oMorgenSpace
        -array aEngines
        -object oMainWindow
        
        +init()
        +initializeAllSystems()
        +runMainCognitiveCycle()
        +showAllFeatures()
        +openFeatureWindow(cFeature)
        +updateDisplay()
        +handleUserInput()
    }
```

## Class Relationships

```mermaid
classDiagram
    MorgenSpace ||--o{ MorgenSymbol : contains
    MorgenSpace ||--o{ MorgenRelation : manages
    MorgenRelation ||--|| MorgenSymbol : connects
    MorgenSpace ||--|| SelfAwarenessEngine : uses
    MorgenSpace ||--|| AdaptiveLearningEngine : uses
    MorgenSpace ||--|| MemorySystem : uses
    MorgenSymbol ||--|| GeometryUtils : uses
    MorgenSpace ||--|| GeometryUtils : uses
    ArabicCharDefinitions ||--|| MorgenSymbol : creates
    MainWindowController ||--|| MorgenSpace : controls
    MainWindowController ||--o{ SelfAwarenessEngine : manages
    MainWindowController ||--o{ AdaptiveLearningEngine : manages
    MainWindowController ||--o{ MemorySystem : manages
```

## Key Design Patterns

### Observer Pattern
- **MorgenSpace** notifies observers when symbols are added/removed
- **GUI Controllers** observe space changes for display updates

### Strategy Pattern
- **AdaptiveLearningEngine** uses different learning strategies
- **Wave propagation** uses different propagation strategies

### Factory Pattern
- **MorgenSymbol** creation through factory methods
- **Relation** creation based on symbol types

### Composite Pattern
- **MorgenSymbol** can contain sub-symbols
- **Triangulations** compose multiple symbols

## Inheritance Hierarchy

```mermaid
classDiagram
    class BaseEngine {
        <<abstract>>
        -MorgenSpace oMorgenSpace
        +init(oMorgenSpace)
        +process()
        +getStatus()
    }
    
    BaseEngine <|-- SelfAwarenessEngine
    BaseEngine <|-- AdaptiveLearningEngine
    BaseEngine <|-- InsightEngine
    BaseEngine <|-- LinguisticEngine
```

## Interface Definitions

```mermaid
classDiagram
    class IDisplayable {
        <<interface>>
        +display()
        +toString()
    }
    
    class IProcessable {
        <<interface>>
        +process()
        +getResult()
    }
    
    IDisplayable <|.. MorgenSymbol
    IDisplayable <|.. MorgenSpace
    IDisplayable <|.. MorgenRelation
    IProcessable <|.. SelfAwarenessEngine
    IProcessable <|.. AdaptiveLearningEngine
```

---

**Document Version**: 1.0  
**Last Updated**: 2025-01-25  
**Related Documents**: 
- `use_case_diagram.md` - System use cases
- `sequence_diagram.md` - Operation sequences
- `../documentation/api_reference.md` - Detailed API documentation
