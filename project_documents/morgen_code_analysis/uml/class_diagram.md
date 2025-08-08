
# Morgen AI - Class Diagram

```mermaid
classDiagram
    class MorgenSpace {
        +List~MorgenSymbol~ aSymbols
        +List~MorgenRelation~ aRelations
        +addSymbol(MorgenSymbol)
        +dreamCycle(MorgenSymbol, MorgenSymbol)
        +enhancedDreamCycle()
        +advancedDreamCycle()
        +propagateWaves()
        +organizeGalacticClusters()
    }

    class MorgenSymbol {
        +String cId
        +String cType
        +List~Integer~ aGenome
        +Number nRadius
        +Number nAngle
        +List~MorgenRelation~ aRelations
        +addRelation(MorgenSymbol, String, Number)
        +deconstructToSeeds() List~MorgenSymbol~
        +mate(MorgenSymbol) MorgenSymbol
    }

    class MorgenRelation {
        +MorgenSymbol oFromSymbol
        +MorgenSymbol oToSymbol
        +String cType
        +Number nStrength
        +evolve()
    }

    class LinguisticEngine {
        +MorgenSpace oMorgenSpace
        +List~MorgenSymbol~ aCharacterSymbols
        +textToWordSymbols(String) List~MorgenSymbol~
        +generateTextFromSymbol(MorgenSymbol) String
        +analyzeTextMeaning(String) MorgenSymbol
    }

    MorgenSpace "1" *-- "0..*" MorgenSymbol : contains
    MorgenSpace "1" *-- "0..*" MorgenRelation : contains
    MorgenSymbol "1" *-- "0..*" MorgenRelation : has
    MorgenRelation --|> MorgenSymbol : relates to
    LinguisticEngine --|> MorgenSpace : uses
    LinguisticEngine --|> MorgenSymbol : creates/uses

```

## Description

- **`MorgenSpace`**: The central container for all symbols and relations. It orchestrates the main cognitive processes like the dream cycles.
- **`MorgenSymbol`**: The fundamental unit of knowledge. It has a unique position, a genetic code (`aGenome`), and can evolve through mating and deconstruction.
- **`MorgenRelation`**: Represents a directed, weighted link between two symbols, forming the knowledge graph.
- **`LinguisticEngine`**: The component responsible for translating between natural language and the symbolic representation within the `MorgenSpace`.

This diagram shows that the `MorgenSpace` is the core of the system, containing many `MorgenSymbol`s and `MorgenRelation`s. Each `MorgenSymbol` can have multiple `MorgenRelation`s connecting it to other symbols. The `LinguisticEngine` interacts with the `MorgenSpace` to analyze and generate language.
