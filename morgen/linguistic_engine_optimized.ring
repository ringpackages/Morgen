# ==============================================================================
# File: linguistic_engine_optimized.ring
# Description: Optimized linguistic engine for Morgen AI (low memory usage)
# Author: Morgen AI Project
# ==============================================================================

//load "./symbol.ring"

/*
Class: LinguisticEngine
Description: Optimized linguistic engine for Arabic text processing
*/
class LinguisticEngine {
    oMorgenSpace
    nMaxCacheSize
    aTextCache
    
    func init oSpace {
        self.oMorgenSpace = oSpace
        self.nMaxCacheSize = 10  # Reduced cache size
        self.aTextCache = []
    }
    
    /*
    Function: analyzeTextMeaning
    Description: Analyzes Arabic text and creates meaning symbols
    */
    func analyzeTextMeaning cText {
        # Check cache first
        for aItem in self.aTextCache {
            if aItem[1] = cText {
                return aItem[2]
            }
        }
        
        # Create a new meaning symbol
        oMeaning = new MorgenSymbol("meaning_" + len(self.aTextCache) + 1, 
                                    "meaning", 
                                    self.generateGenomeFromText(cText),
                                    0.5, 
                                    45, 
                                    cText)
        
        # Set properties
        oMeaning.nEnergyLevel = 0.8
        oMeaning.bIsSeed = false
        
        # Add to space
        self.oMorgenSpace.addSymbol(oMeaning)
        
        # Add to cache
        add(self.aTextCache, [cText, oMeaning])
        
        # Trim cache if needed
        if len(self.aTextCache) > self.nMaxCacheSize {
            for i = 2 to len(self.aTextCache) {
                self.aTextCache = self.aTextCache[i]
            }
           
        }
        
        return oMeaning
    }
    
    /*
    Function: generateTextFromSymbol
    Description: Generates Arabic text from a symbol
    */
    func generateTextFromSymbol oSymbol, cLanguage {
        if not isObject(oSymbol) {
            return ""
        }
        
        # If the symbol already has text data, return it
        if isString(oSymbol.oData) {
            return oSymbol.oData
        }
        
        # Generate simple text based on symbol type
        if oSymbol.cType = "arabic_letter" {
            return oSymbol.oData
        
        elseif oSymbol.cType = "triconsonantal_root" 
            # For roots, combine the letters
            cText = ""
            if isObject(oSymbol.oData) and isList(oSymbol.oData) {
                for oChar in oSymbol.oData {
                    if isObject(oChar) {
                        cText += oChar.oData
                    }
                }
            }
            return cText
        
        elseif oSymbol.cType = "meaning" 
            # For meaning symbols, generate based on genome
            return self.generateTextFromGenome(oSymbol.aGenome)
        }
        
        return "نص_" + oSymbol.cId
    }
    
    /*
    Function: generateGenomeFromText
    Description: Generates a genome from Arabic text
    */
    func generateGenomeFromText cText {
        aGenome = []
        
        # Simple algorithm: convert each character to 1 or 2
        for i = 1 to len(cText) {
            nChar = ascii(substr(cText, i, 1))
            if nChar % 2 = 0 {
                add(aGenome, 2)
            else
                add(aGenome, 1)
            }
        }
        
        # Ensure minimum length
        while len(aGenome) < 4 {
            add(aGenome, 1)
        }
        
        return aGenome
    }
    
    /*
    Function: generateTextFromGenome
    Description: Generates Arabic text from a genome
    */
    func generateTextFromGenome aGenome {
        # Get all Arabic characters from space
        aArabicChars = []
        for oSymbol in self.oMorgenSpace.aSymbols {
            if isObject(oSymbol) and oSymbol.cType = "arabic_letter" {
                add(aArabicChars, oSymbol)
            }
        }
        
        if len(aArabicChars) = 0 {
            return "نص"
        }
        
        # Generate text by selecting characters based on genome
        cText = ""
        for nGene in aGenome {
            nIndex = (nGene % len(aArabicChars)) + 1
            if nIndex <= len(aArabicChars) {
                oChar = aArabicChars[nIndex]
                if isObject(oChar) {
                    cText += oChar.oData
                }
            }
        }
        
        return cText
    }
}