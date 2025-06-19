# ==============================================================================
# File: utils.ring
# Description: Utility functions for the Morgen AI paradigm
# Author: Morgen AI Project
# ==============================================================================

# Mathematical constants
PI = 3.14159265358979323846

# Helper function for displaying lists
func listToString aList {
    cResult = "["
    for i = 1 to len(aList) {
        cResult += "" + aList[i]
        if i < len(aList) {
            cResult += ", "
        }
    }
    cResult += "]"
    return cResult
}
