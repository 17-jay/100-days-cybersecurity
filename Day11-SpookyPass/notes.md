# Day 11 – Binary Analysis

## Summary / Objective
This note documents the analysis of a supplied binary named `pass`. The goal was to determine the file type, observe its runtime behaviour, extract any embedded readable artifacts (passwords, hashes, or hints), and use those artifacts to complete the challenge.


## High-level Findings
- The file `pass` was identified as executable .  
- When executed, the binary prompted for a password.  
- Static analysis (text extraction) revealed a readable artifact (a candidate password or hash) embedded within the binary.  
- Supplying the discovered value to the program/website produced the expected challenge result.



## Key takeaways (concise)
- Start with file identification and perform safe static checks before dynamic execution.  
- `strings` is a fast method to retrieve clues from binaries.  
- Always analyze unknown binaries in a VM/sandbox.  



