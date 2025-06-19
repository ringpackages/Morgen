# ==============================================================================
# File: char_definitions.ring
# Description: Character definitions for the Morgen AI paradigm
# Author: Morgen AI Project
# ==============================================================================

//load "../symbol.ring"

# ==============================================================================
# Arabic Character Definitions
# ==============================================================================

/*
Function: createArabicCharacterSymbols
Description: Creates MorgenSymbol objects for basic Arabic characters
Outputs: (list) List of character symbols
*/
func createArabicCharacterSymbols {
    aCharSymbols = []
    
    # Basic Arabic letters with geomancy-inspired genomes
    # Each letter gets a unique genome based on its characteristics
    
    # Alif (ا) - The first letter, represents unity and beginning
    oAlif = new MorgenSymbol("alif", "arabic_letter", [1, 1, 1, 1], 0.9, 0, "ا")
    oAlif.bIsSeed = true
    oAlif.nEnergyLevel = 1.0
    add(aCharSymbols, oAlif)
    
    # Ba (ب) - Represents duality and creation
    oBa = new MorgenSymbol("ba", "arabic_letter", [2, 1, 2, 1], 0.85, 15, "ب")
    oBa.bIsSeed = true
    oBa.nEnergyLevel = 0.95
    add(aCharSymbols, oBa)
    
    # Ta (ت) - Represents completion and perfection
    oTa = new MorgenSymbol("ta", "arabic_letter", [1, 2, 1, 2], 0.88, 30, "ت")
    oTa.bIsSeed = true
    oTa.nEnergyLevel = 0.9
    add(aCharSymbols, oTa)
    
    # Tha (ث) - Represents growth and expansion
    oTha = new MorgenSymbol("tha", "arabic_letter", [2, 2, 1, 1], 0.82, 45, "ث")
    oTha.bIsSeed = true
    oTha.nEnergyLevel = 0.88
    add(aCharSymbols, oTha)
    
    # Jim (ج) - Represents gathering and collection
    oJim = new MorgenSymbol("jim", "arabic_letter", [1, 1, 2, 2], 0.8, 60, "ج")
    oJim.bIsSeed = true
    oJim.nEnergyLevel = 0.92
    add(aCharSymbols, oJim)
    
    # Ha (ح) - Represents life and breath
    oHa = new MorgenSymbol("ha", "arabic_letter", [2, 1, 1, 2], 0.75, 75, "ح")
    oHa.bIsSeed = true
    oHa.nEnergyLevel = 0.85
    add(aCharSymbols, oHa)
    
    # Kha (خ) - Represents choice and selection
    oKha = new MorgenSymbol("kha", "arabic_letter", [1, 2, 2, 1], 0.78, 90, "خ")
    oKha.bIsSeed = true
    oKha.nEnergyLevel = 0.87
    add(aCharSymbols, oKha)
    
    # Dal (د) - Represents guidance and direction
    oDal = new MorgenSymbol("dal", "arabic_letter", [2, 2, 2, 1], 0.83, 105, "د")
    oDal.bIsSeed = true
    oDal.nEnergyLevel = 0.9
    add(aCharSymbols, oDal)
    
    # Dhal (ذ) - Represents memory and remembrance
    oDhal = new MorgenSymbol("dhal", "arabic_letter", [1, 1, 1, 2], 0.81, 120, "ذ")
    oDhal.bIsSeed = true
    oDhal.nEnergyLevel = 0.86
    add(aCharSymbols, oDhal)
    
    # Ra (ر) - Represents movement and flow
    oRa = new MorgenSymbol("ra", "arabic_letter", [2, 1, 2, 2], 0.77, 135, "ر")
    oRa.bIsSeed = true
    oRa.nEnergyLevel = 0.93
    add(aCharSymbols, oRa)
    
    # Zay (ز) - Represents beauty and adornment
    oZay = new MorgenSymbol("zay", "arabic_letter", [1, 2, 1, 1], 0.79, 150, "ز")
    oZay.bIsSeed = true
    oZay.nEnergyLevel = 0.84
    add(aCharSymbols, oZay)
    
    # Sin (س) - Represents questioning and seeking
    oSin = new MorgenSymbol("sin", "arabic_letter", [2, 2, 1, 2], 0.76, 165, "س")
    oSin.bIsSeed = true
    oSin.nEnergyLevel = 0.89
    add(aCharSymbols, oSin)
    
    # Shin (ش) - Represents spreading and expansion
    oShin = new MorgenSymbol("shin", "arabic_letter", [1, 1, 2, 1], 0.74, 180, "ش")
    oShin.bIsSeed = true
    oShin.nEnergyLevel = 0.91
    add(aCharSymbols, oShin)
    
    # Sad (ص) - Represents truth and sincerity
    oSad = new MorgenSymbol("sad", "arabic_letter", [2, 1, 1, 1], 0.72, 195, "ص")
    oSad.bIsSeed = true
    oSad.nEnergyLevel = 0.88
    add(aCharSymbols, oSad)
    
    # Dad (ض) - Represents opposition and contrast
    oDad = new MorgenSymbol("dad", "arabic_letter", [1, 2, 2, 2], 0.73, 210, "ض")
    oDad.bIsSeed = true
    oDad.nEnergyLevel = 0.87
    add(aCharSymbols, oDad)
    
    # Ta (ط) - Represents purity and cleanliness
    oTa2 = new MorgenSymbol("ta_heavy", "arabic_letter", [2, 2, 2, 2], 0.7, 225, "ط")
    oTa2.bIsSeed = true
    oTa2.nEnergyLevel = 0.85
    add(aCharSymbols, oTa2)
    
    # Za (ظ) - Represents appearance and manifestation
    oZa = new MorgenSymbol("za", "arabic_letter", [1, 1, 1, 1], 0.71, 240, "ظ")
    oZa.bIsSeed = true
    oZa.nEnergyLevel = 0.83
    add(aCharSymbols, oZa)
    
    # Ain (ع) - Represents knowledge and seeing
    oAin = new MorgenSymbol("ain", "arabic_letter", [2, 1, 2, 1], 0.68, 255, "ع")
    oAin.bIsSeed = true
    oAin.nEnergyLevel = 0.94
    add(aCharSymbols, oAin)
    
    # Ghain (غ) - Represents the hidden and unseen
    oGhain = new MorgenSymbol("ghain", "arabic_letter", [1, 2, 1, 2], 0.69, 270, "غ")
    oGhain.bIsSeed = true
    oGhain.nEnergyLevel = 0.82
    add(aCharSymbols, oGhain)
    
    # Fa (ف) - Represents opening and beginning
    oFa = new MorgenSymbol("fa", "arabic_letter", [2, 2, 1, 1], 0.75, 285, "ف")
    oFa.bIsSeed = true
    oFa.nEnergyLevel = 0.9
    add(aCharSymbols, oFa)
    
    # Qaf (ق) - Represents power and strength
    oQaf = new MorgenSymbol("qaf", "arabic_letter", [1, 1, 2, 2], 0.66, 300, "ق")
    oQaf.bIsSeed = true
    oQaf.nEnergyLevel = 0.96
    add(aCharSymbols, oQaf)
    
    # Kaf (ك) - Represents sufficiency and completeness
    oKaf = new MorgenSymbol("kaf", "arabic_letter", [2, 1, 1, 2], 0.67, 315, "ك")
    oKaf.bIsSeed = true
    oKaf.nEnergyLevel = 0.89
    add(aCharSymbols, oKaf)
    
    # Lam (ل) - Represents connection and linking
    oLam = new MorgenSymbol("lam", "arabic_letter", [1, 2, 2, 1], 0.65, 330, "ل")
    oLam.bIsSeed = true
    oLam.nEnergyLevel = 0.92
    add(aCharSymbols, oLam)
    
    # Mim (م) - Represents water and fluidity
    oMim = new MorgenSymbol("mim", "arabic_letter", [2, 2, 2, 1], 0.64, 345, "م")
    oMim.bIsSeed = true
    oMim.nEnergyLevel = 0.88
    add(aCharSymbols, oMim)
    
    # Nun (ن) - Represents fish and depth
    oNun = new MorgenSymbol("nun", "arabic_letter", [1, 1, 1, 2], 0.63, 0, "ن")
    oNun.bIsSeed = true
    oNun.nEnergyLevel = 0.87
    add(aCharSymbols, oNun)
    
    # Ha (ه) - Represents breath and spirit
    oHa2 = new MorgenSymbol("ha_end", "arabic_letter", [2, 1, 2, 2], 0.62, 15, "ه")
    oHa2.bIsSeed = true
    oHa2.nEnergyLevel = 0.85
    add(aCharSymbols, oHa2)
    
    # Waw (و) - Represents connection and conjunction
    oWaw = new MorgenSymbol("waw", "arabic_letter", [1, 2, 1, 1], 0.61, 30, "و")
    oWaw.bIsSeed = true
    oWaw.nEnergyLevel = 0.91
    add(aCharSymbols, oWaw)
    
    # Ya (ي) - Represents calling and addressing
    oYa = new MorgenSymbol("ya", "arabic_letter", [2, 2, 1, 2], 0.6, 45, "ي")
    oYa.bIsSeed = true
    oYa.nEnergyLevel = 0.93
    add(aCharSymbols, oYa)
    
    return aCharSymbols
}

/*
Function: getCharacterByArabicLetter
Description: Gets a character symbol by its Arabic letter
Inputs:
    cLetter : (string) Arabic letter
    aCharSymbols : (list) List of character symbols
Outputs: (MorgenSymbol) The matching symbol or null
*/
func getCharacterByArabicLetter cLetter, aCharSymbols {
    for oChar in aCharSymbols {
        if isObject(oChar) and oChar.oData = cLetter {
            return oChar
        }
    }
    return null
}

/*
Function: createTriconsontalRoot
Description: Creates a triconsonantal root symbol from three Arabic letters
Inputs:
    oChar1 : (MorgenSymbol) First character
    oChar2 : (MorgenSymbol) Second character  
    oChar3 : (MorgenSymbol) Third character
Outputs: (MorgenSymbol) Root symbol
*/
func createTriconsontalRoot oChar1, oChar2, oChar3 {
    if not (isObject(oChar1) and isObject(oChar2) and isObject(oChar3)) {
        return null
    }
    
    # Create root genome by combining character genomes
    aRootGenome = []
    
    # Take first two elements from each character genome
    for i = 1 to 2 {
        if i <= len(oChar1.aGenome) { add(aRootGenome, oChar1.aGenome[i]) }
        if i <= len(oChar2.aGenome) { add(aRootGenome, oChar2.aGenome[i]) }
        if i <= len(oChar3.aGenome) { add(aRootGenome, oChar3.aGenome[i]) }
    }
    
    # Create root ID and position
    cRootId = "root_" + oChar1.cId + "_" + oChar2.cId + "_" + oChar3.cId
    
    # Position at the geometric center of the three characters, closer to center
    nRootRadius = ((oChar1.nRadius + oChar2.nRadius + oChar3.nRadius) / 3) * 0.7
    nRootAngle = (oChar1.nAngle + oChar2.nAngle + oChar3.nAngle) / 3
    
    # Create the root symbol
    oRoot = new MorgenSymbol(cRootId, "triconsonantal_root", aRootGenome, nRootRadius, nRootAngle, null)
    
    # Set properties
    oRoot.nEnergyLevel = (oChar1.nEnergyLevel + oChar2.nEnergyLevel + oChar3.nEnergyLevel) / 3
    oRoot.bIsSeed = false  # Roots are not seeds, they are composed
    
    # Add character references as sub-symbols
    add(oRoot.aSubSymbols, oChar1)
    add(oRoot.aSubSymbols, oChar2)
    add(oRoot.aSubSymbols, oChar3)
    
    # Create relations to constituent characters
    oRoot.addRelation(oChar1, "root_component", 0.9, null)
    oRoot.addRelation(oChar2, "root_component", 0.9, null)
    oRoot.addRelation(oChar3, "root_component", 0.9, null)
    
    return oRoot
}
