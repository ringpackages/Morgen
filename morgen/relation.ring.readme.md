
# Documentation for `relation.ring`

## Overview

This file defines the `MorgenRelation` class, which represents a directed, weighted connection between two `MorgenSymbol` objects. Relations are fundamental to the Morgen AI paradigm as they form the network of knowledge, defining how symbols are interconnected and influence each other.

## Key Responsibilities

- **Defining Connections:** Establishes a typed and weighted link from a source symbol to a target symbol.
- **Quantifying Relationship Strength:** Uses an `nStrength` attribute to represent the strength of the association.
- **Dynamic Properties:** Calculates and maintains dynamic properties:
    - **`nResonance`:** Represents the influence of the relation, calculated based on its strength and the resonance of the connected symbols.
    - **`nHarmonic`:** Represents the compatibility or harmony between the two symbols, based on their angular separation and genome similarity.
- **Evolution:** Includes an `evolve()` method that allows the relation's strength to change over time, simulating learning and forgetting.

## Core Attributes

- **`oFromSymbol`:** The source `MorgenSymbol`.
- **`oToSymbol`:** The target `MorgenSymbol`.
- **`cType`:** The nature of the relationship (e.g., `similar`, `cause`, `triangle_edge`).
- **`nStrength`:** The strength of the connection, from 0 to 1.
