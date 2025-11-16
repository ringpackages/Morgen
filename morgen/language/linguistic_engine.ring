# ==============================================================================
# File: linguistic_engine.ring
# Description: Linguistic engine for Morgen AI paradigm
# Author: Morgen AI Project
# ==============================================================================
load "stdlib.ring"
load "../space.ring"
load "char_definitions.ring"

# ==============================================================================
# Linguistic Engine Class
# ==============================================================================

class LinguisticEngine {
    ### --- Public Attributes & Methods ---
    oMorgenSpace        # Reference to the Morgen cognitive space
    aCharacterSymbols   # Cache of character symbols
    aWordSymbols        # Cache of word symbols
    aRootSymbols        # Cache of root symbols
    cCurrentLanguage    # Current language being processed

    /*
    Function: init
    Description: Initializes the linguistic engine
    Inputs:
        oSpace : (oMorgenSpace) The cognitive space to work with
    */
    func init oSpace {
        if not isObject(oSpace) {
            raise("LinguisticEngine.init: Invalid space object")
        }
        
        self.oMorgenSpace = oSpace
        self.aCharacterSymbols = createArabicCharacterSymbols()
        self.aWordSymbols = []
        self.aRootSymbols = []
        self.cCurrentLanguage = "arabic"
        
        # Add character symbols to space if not already present
        for oChar in self.aCharacterSymbols {
            if isObject(oChar) {
                # Check if character already exists in space
                oExisting = self.oMorgenSpace.getSymbolById(oChar.cId)
                if not isObject(oExisting) {
                    self.oMorgenSpace.addSymbol(oChar)
                }
            }
        }
        
        see "Linguistic engine initialized with " + len(self.aCharacterSymbols) + " character symbols" + nl
    }

    /*
    Function: textToWordSymbols
    Description: Converts text to word symbols in the cognitive space
    Inputs:
        cText : (string) Input text
        cLanguage : (string) Language of the text
    Outputs: (list) List of word symbols
    */
    func textToWordSymbols cText, cLanguage {
        if cLanguage = null { cLanguage = self.cCurrentLanguage }
        
        see "Converting text to word symbols: '" + cText + "' (" + cLanguage + ")" + nl
        
        aWordSymbols = []
        
        if cLanguage = "arabic" {
            aWordSymbols = self.processArabicText(cText)
        else 
            see "Language not supported: " + cLanguage + nl
            return []
        }
        
        return aWordSymbols
    }

    /*
    Function: processArabicText
    Description: Processes Arabic text into word symbols
    Inputs:
        cText : (string) Arabic text
    Outputs: (list) List of word symbols
    */
    func processArabicText cText {
        aWordSymbols = []
        
        # Simple word splitting (by spaces)
        aWords = split(cText, " ")
        
        for cWord in aWords {
            if len(cWord) > 0 {
                oWordSymbol = self.createArabicWordSymbol(cWord)
                if isObject(oWordSymbol) {
                    add(aWordSymbols, oWordSymbol)
                    add(self.aWordSymbols, oWordSymbol)
                    self.oMorgenSpace.addSymbol(oWordSymbol)
                }
            }
        }
        
        return aWordSymbols
    }

    /*
    Function: createArabicWordSymbol
    Description: Creates a word symbol from Arabic word
    Inputs:
        cWord : (string) Arabic word
    Outputs: (oMorgenSymbol) Word symbol
    */
    func createArabicWordSymbol cWord {
        see "  Creating word symbol for: " + cWord + nl
        
        # Extract characters from word
        aCharacters = []
        aCharSymbols = []
        
        # Simple character extraction (this could be enhanced for Arabic morphology)
        for cChar in cWord {
            add(aCharacters, cChar)
            
            # Find corresponding character symbol
            oCharSymbol = getCharacterByArabicLetter(cChar, self.aCharacterSymbols)
            if isObject(oCharSymbol) {
                add(aCharSymbols, oCharSymbol)
            }
        }
        
        if len(aCharSymbols) = 0 {
            see "    No character symbols found for word: " + cWord + nl
            return null
        }
        
        # Create word genome by combining character genomes
        aWordGenome = []
        for oCharSymbol in aCharSymbols {
            for nGene in oCharSymbol.aGenome {
                add(aWordGenome, nGene)
            }
        }
        
        # Calculate word position (average of character positions, moved toward center)
        aCenter = calculateGeometricCenter(aCharSymbols)
        if aCenter = null {
            # Default position if center calculation fails
            nWordRadius = 0.6
            nWordAngle = random(360)
        else 
            nWordRadius = aCenter[1] * 0.8  # Move toward center
            nWordAngle = aCenter[2]
        }
        
        # Create word symbol
        cWordId = "word_" + cWord + "_" + random(1000)
        oWordSymbol = new MorgenSymbol(cWordId, "arabic_word", aWordGenome, nWordRadius, nWordAngle, cWord)
        
        # Set word properties
        nTotalEnergy = 0
        for oCharSymbol in aCharSymbols {
            nTotalEnergy += oCharSymbol.nEnergyLevel
        }
        oWordSymbol.nEnergyLevel = nTotalEnergy / len(aCharSymbols)  # Average energy
        
        # Add character references as sub-symbols
        oWordSymbol.aSubSymbols = aCharSymbols
        
        # Create relations to constituent characters
        for oCharSymbol in aCharSymbols {
            oWordSymbol.addRelation(oCharSymbol, "word_component", 0.8, null)
        }
        
        # Check if this could be a triconsonantal root
        if len(aCharSymbols) = 3 {
            oRootSymbol = createTriconsontalRoot(aCharSymbols[1], aCharSymbols[2], aCharSymbols[3])
            if isObject(oRootSymbol) {
                add(self.aRootSymbols, oRootSymbol)
                self.oMorgenSpace.addSymbol(oRootSymbol)
                
                # Create relation between word and root
                oWordSymbol.addRelation(oRootSymbol, "derived_from_root", 0.9, null)
                
                see "    Created triconsonantal root: " + oRootSymbol.cId + nl
            }
        }
        
        see "    Created word symbol: " + oWordSymbol.cId + nl
        return oWordSymbol
    }

    /*
    Function: generateTextFromSymbol
    Description: Generates text from a meaning symbol
    Inputs:
        oMeaningSymbol : (oMorgenSymbol) Symbol representing meaning
        cLanguage : (string) Target language
    Outputs: (string) Generated text
    */
    func generateTextFromSymbol oMeaningSymbol, cLanguage {
        if not isObject(oMeaningSymbol) {
            return ""
        }
        
        if cLanguage = null { cLanguage = self.cCurrentLanguage }
        
        see "Generating text from symbol: " + oMeaningSymbol.cId + " (" + cLanguage + ")" + nl
        
        if cLanguage = "arabic" {
            return self.generateArabicText(oMeaningSymbol)
        else 
            see "Language not supported for generation: " + cLanguage + nl
            return ""
        }
    }

    /*
    Function: generateArabicText
    Description: Generates Arabic text from a symbol
    Inputs:
        oMeaningSymbol : (oMorgenSymbol) Symbol to generate from
    Outputs: (string) Generated Arabic text
    */
    func generateArabicText oMeaningSymbol {
        cGeneratedText = ""
        
        # Direct word symbol
        if oMeaningSymbol.cType = "arabic_word" {
            if oMeaningSymbol.oData != null {
                return oMeaningSymbol.oData
            }
        }
        
        # Root symbol
        if oMeaningSymbol.cType = "triconsonantal_root" {
            # Generate basic form from root characters
            if len(oMeaningSymbol.aSubSymbols) = 3 {
                for oCharSymbol in oMeaningSymbol.aSubSymbols {
                    if isObject(oCharSymbol) and oCharSymbol.oData != null {
                        cGeneratedText += oCharSymbol.oData
                    }
                }
                return cGeneratedText
            }
        }
        
        # Complex symbol - fractal deconstruction
        if oMeaningSymbol.nRadius < 0.5 {  # Deep/essential symbol
            return self.fractalTextGeneration(oMeaningSymbol)
        }
        
        # Condensed symbol
        if oMeaningSymbol.nCondensationValue > 0 {
            return self.generateFromCondensedSymbol(oMeaningSymbol)
        }
        
        # Default: try to find related word symbols
        aRelatedWords = self.findRelatedWordSymbols(oMeaningSymbol)
        if len(aRelatedWords) > 0 {
            # Return the most resonant related word
            oMostResonant = aRelatedWords[1]
            for oWord in aRelatedWords {
                if isObject(oWord) and oWord.nResonance > oMostResonant.nResonance {
                    oMostResonant = oWord
                }
            }
            
            if oMostResonant.oData != null {
                return oMostResonant.oData
            }
        }
        
        return "[meaning: " + oMeaningSymbol.cId + "]"
    }

    /*
    Function: fractalTextGeneration
    Description: Generates text through fractal deconstruction
    Inputs:
        oSymbol : (oMorgenSymbol) Deep symbol to deconstruct
    Outputs: (string) Generated text
    */
    func fractalTextGeneration oSymbol {
        see "    Fractal text generation from: " + oSymbol.cId + nl
        
        # Deconstruct symbol into components
        aComponents = []
        
        if len(oSymbol.aSubSymbols) > 0 {
            aComponents = oSymbol.aSubSymbols
        else 
            # Use genome-based deconstruction
            aSeeds = oSymbol.deconstructToSeeds()
            aComponents = aSeeds
        }
        
        cGeneratedText = ""
        
        for oComponent in aComponents {
            if isObject(oComponent) {
                cComponentText = self.generateArabicText(oComponent)
                if len(cComponentText) > 0 and cComponentText != "[meaning: " + oComponent.cId + "]" {
                    if len(cGeneratedText) > 0 {
                        cGeneratedText += " "
                    }
                    cGeneratedText += cComponentText
                }
            }
        }
        
        if len(cGeneratedText) = 0 {
            cGeneratedText = "[deep_meaning: " + oSymbol.cId + "]"
        }
        
        return cGeneratedText
    }

    /*
    Function: generateFromCondensedSymbol
    Description: Generates text from a condensed symbol
    Inputs:
        oCondensedSymbol : (oMorgenSymbol) Condensed symbol
    Outputs: (string) Generated text
    */
    func generateFromCondensedSymbol oCondensedSymbol {
        see "    Generating from condensed symbol: " + oCondensedSymbol.cId + nl
        
        # Extract essence from condensed components
        aEssentialWords = []
        
        for oComponent in oCondensedSymbol.aSubSymbols {
            if isObject(oComponent) and oComponent.cType = "arabic_word" {
                add(aEssentialWords, oComponent.oData)
            }
        }
        
        if len(aEssentialWords) > 0 {
            # Return a combination of essential words
            cCombined = ""
            for i = 1 to min(3, len(aEssentialWords)) {  # Limit to 3 words
                if i > 1 { cCombined += " " }
                cCombined += aEssentialWords[i]
            }
            return cCombined
        }
        
        return "[condensed_meaning: " + oCondensedSymbol.nCondensationValue + "_concepts]"
    }

    /*
    Function: findRelatedWordSymbols
    Description: Finds word symbols related to a given symbol
    Inputs:
        oSymbol : (oMorgenSymbol) Symbol to find relations for
    Outputs: (list) List of related word symbols
    */
    func findRelatedWordSymbols oSymbol {
        aRelatedWords = []
        
        # Check direct relations
        for oRelation in oSymbol.aRelations {
            if isObject(oRelation) {
                oRelatedSymbol = self.oMorgenSpace.getSymbolById(oRelation.cToSymbolId)
                if isObject(oRelatedSymbol) and oRelatedSymbol.cType = "arabic_word" {
                    add(aRelatedWords, oRelatedSymbol)
                }
            }
        }
        
        # Check geometric proximity
        for oWordSymbol in self.aWordSymbols {
            if isObject(oWordSymbol) and oWordSymbol.cId != oSymbol.cId {
                nDistance = calculatePolarDistance(oSymbol.nRadius, oSymbol.nAngle,
                                                 oWordSymbol.nRadius, oWordSymbol.nAngle)
                
                if nDistance < 0.3 {  # Close proximity
                    add(aRelatedWords, oWordSymbol)
                }
            }
        }
        
        return aRelatedWords
    }

    /*
    Function: analyzeTextMeaning
    Description: Analyzes the meaning of text in the cognitive space
    Inputs:
        cText : (string) Text to analyze
    Outputs: (oMorgenSymbol) Symbol representing the text's meaning
    */
    func analyzeTextMeaning cText {
        see "Analyzing meaning of text: '" + cText + "'" + nl
        
        # Convert text to word symbols
        aWordSymbols = self.textToWordSymbols(cText, self.cCurrentLanguage)
        
        if len(aWordSymbols) = 0 {
            see "No word symbols created from text" + nl
            return null
        }
        
        # Create meaning symbol from word combination
        aCenter = calculateGeometricCenter(aWordSymbols)
        if aCenter = null {
            return null
        }
        
        # Create combined genome
        aCombinedGenome = []
        for oWordSymbol in aWordSymbols {
            for i = 1 to min(2, len(oWordSymbol.aGenome)) {  # Take first 2 genes from each word
                add(aCombinedGenome, oWordSymbol.aGenome[i])
            }
        }
        
        # Create meaning symbol
        cMeaningId = "meaning_" + len(aWordSymbols) + "words_" + random(1000)
        nMeaningRadius = aCenter[1] * 0.7  # Move toward center (more essential)
        nMeaningAngle = aCenter[2]
        
        oMeaningSymbol = new MorgenSymbol(cMeaningId, "text_meaning", aCombinedGenome, 
                                          nMeaningRadius, nMeaningAngle, cText)
        
        # Set properties
        nTotalEnergy = 0
        for oWordSymbol in aWordSymbols {
            nTotalEnergy += oWordSymbol.nEnergyLevel
        }
        oMeaningSymbol.nEnergyLevel = nTotalEnergy / len(aWordSymbols)
        oMeaningSymbol.aSubSymbols = aWordSymbols
        
        # Add to space
        self.oMorgenSpace.addSymbol(oMeaningSymbol)
        
        see "Created meaning symbol: " + oMeaningSymbol.cId + nl
        return oMeaningSymbol
    }

}
