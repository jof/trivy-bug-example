# Trivy Config Scanning Bugs
## Bug 1
An alert is generated for each terraform file which imports a module from another file

## Bug 2
If there is a file ending in .tf, all '*.tf' files one folder down are not picked up by the scanner.

## PoC
The PoC files can be found in this repository
