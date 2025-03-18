# Mini-interpréteur d’instructions en assembleur (x86/ARM)

## Description

Ce projet implémente un mini-interpréteur d’instructions en assembleur qui permet à l'utilisateur de réaliser des opérations arithmétiques de base (addition, soustraction, multiplication, et division) à partir de l'entrée de l'utilisateur. L'utilisateur peut entrer une opération et deux nombres, et le programme effectuera l'opération choisie, puis affichera le résultat.

## Fonctionnalités

- Lire une entrée utilisateur pour sélectionner une opération parmi `add`, `sub`, `mul`, ou `div`.
- Demander deux nombres à l'utilisateur pour effectuer l'opération choisie.
- Afficher le résultat de l'opération.
- Gérer l'erreur de division par zéro.
- Afficher un message d'erreur si l'opération ou l'entrée est invalide.

## Installation

### Prérequis

Assurez-vous d'avoir un environnement pour exécuter des programmes assembleur, tel que **MARS** (MIPS Assembler and Runtime Simulator) ou un autre assembleur compatible avec la plateforme x86/ARM. Ce programme est destiné à être exécuté sur un simulateur ou un environnement capable de gérer des appels système et d'afficher des résultats en mode console.

### Compilation et exécution

1. **Compiler le programme** :
   - Utilisez un assembleur comme MARS pour assembler le fichier `.s`.
   - Ouvrez le fichier `mini_interpreteur.s` dans MARS ou un autre simulateur d'assembleur compatible.

2. **Exécuter le programme** :
   - Lancez le programme après l'assemblage.
   - L'utilisateur sera invité à entrer l'opération souhaitée (`1` pour `add`, `2` pour `sub`, `3` pour `mul`, `4` pour `div`) et les deux nombres sur lesquels l'opération doit être effectuée.
   - Le programme affichera ensuite le résultat de l'opération choisie.

## Exemple d'exécution

### Exemple 1 : Addition
Entrez une opération (1: add, 2: sub, 3: mul, 4: div): 1
Entrez le premier nombre: 4 
Entrez le deuxième nombre: 2 
Le résultat est: 6


### Exemple 2 : Division par zéro
Entrez une opération (1: add, 2: sub, 3: mul, 4: div): 
Entrez le premier nombre: 4 
Entrez le deuxième nombre: 0 
Erreur : Division par zéro.


### Exemple 3 : Entrée invalide
Entrez une opération (1: add, 2: sub, 3: mul, 4: div): 
Entrée invalide. 
Veuillez entrer une opération valide.



## Structure du code

### Sections principales

1. **.data** : Contient les chaînes de caractères utilisées pour afficher des messages à l'utilisateur, telles que les invites et les résultats.
2. **.text** : Contient le code principal du programme, qui gère l'entrée utilisateur, effectue les calculs, et affiche les résultats.

### Fonctionnement du programme

- **Entrée utilisateur** : Le programme demande à l'utilisateur de sélectionner une opération arithmétique et de fournir deux nombres.
- **Opération** : En fonction de l'opération choisie, le programme effectue l'addition, la soustraction, la multiplication ou la division.
- **Gestion des erreurs** : Si l'utilisateur choisit une opération invalide, ou tente une division par zéro, le programme affiche un message d'erreur.

## Limitations

- Ce programme ne prend en charge que les opérations de base : addition, soustraction, multiplication et division.
- La gestion des erreurs se limite à la division par zéro et aux entrées invalides.

