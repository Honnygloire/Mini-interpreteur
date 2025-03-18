.data
prompt: .asciiz "Entrez une opération (1: add, 2: sub, 3: mul, 4: div): "
num1_prompt: .asciiz "Entrez le premier nombre: "
num2_prompt: .asciiz "Entrez le deuxième nombre: "
result_msg: .asciiz "Le résultat est: "
div_by_zero_msg: .asciiz "Erreur : Division par zéro.\n"
error_msg: .asciiz "Entrée invalide. Veuillez entrer une opération valide.\n"
newline: .asciiz "\n"

.text
.globl main

main:
    # Affichage du message de demande d'opération
    li $v0, 4                  # Code de service pour afficher une chaîne
    la $a0, prompt             # Charger l'adresse de la chaîne
    syscall

    # Lire l'opération (1: add, 2: sub, 3: mul, 4: div)
    li $v0, 5                  # Code de service pour lire un entier
    syscall
    move $t0, $v0              # Stocker l'opération (dans $t0)

    # Vérifier que l'opération est valide (1-4)
    blt $t0, 1, invalid_input
    bgt $t0, 4, invalid_input

    # Afficher un message pour demander le premier nombre
    li $v0, 4                  # Afficher une chaîne
    la $a0, num1_prompt        # Charger l'adresse de la chaîne
    syscall

    # Lire le premier nombre
    li $v0, 5                  # Code de service pour lire un entier
    syscall
    move $t1, $v0              # Stocker le premier nombre dans $t1

    # Afficher un message pour demander le deuxième nombre
    li $v0, 4                  # Afficher une chaîne
    la $a0, num2_prompt        # Charger l'adresse de la chaîne
    syscall

    # Lire le deuxième nombre
    li $v0, 5                  # Code de service pour lire un entier
    syscall
    move $t2, $v0              # Stocker le deuxième nombre dans $t2

    # Exécuter l'opération
    beq $t0, 1, add_op
    beq $t0, 2, sub_op
    beq $t0, 3, mul_op
    beq $t0, 4, div_op

add_op:
    add $t3, $t1, $t2         # additionner t1 et t2
    b print_result

sub_op:
    sub $t3, $t1, $t2         # soustraire t1 et t2
    b print_result

mul_op:
    mul $t3, $t1, $t2         # multiplier t1 et t2
    b print_result

div_op:
    # Vérifier si le diviseur est zéro
    beq $t2, $zero, div_by_zero_error  # Si t2 == 0, gérer l'erreur

    div $t1, $t2              # diviser t1 par t2
    mflo $t3                   # récupérer le quotient
    b print_result

div_by_zero_error:
    # Afficher un message d'erreur pour la division par zéro
    li $v0, 4                  # Code de service pour afficher une chaîne
    la $a0, div_by_zero_msg    # Charger l'adresse du message d'erreur
    syscall

    # Quitter le programme
    li $v0, 10                 # Code de service pour quitter le programme
    syscall

invalid_input:
    # Afficher le message d'entrée invalide
    li $v0, 4                  # Code de service pour afficher une chaîne
    la $a0, error_msg          # Charger l'adresse du message d'erreur
    syscall

    # Quitter le programme
    li $v0, 10                 # Code de service pour quitter le programme
    syscall

print_result:
    # Afficher le message de résultat
    li $v0, 4                  # Code de service pour afficher une chaîne
    la $a0, result_msg         # Charger l'adresse du message
    syscall

    # Afficher le résultat
    li $v0, 1                  # Code de service pour afficher un entier
    move $a0, $t3              # Résultat dans $a0
    syscall

    # Afficher une nouvelle ligne
    li $v0, 4                  # Code de service pour afficher une chaîne
    la $a0, newline            # Charger l'adresse de la chaîne de nouvelle ligne
    syscall

    # Terminer le programme
    li $v0, 10                 # Code de service pour quitter le programme
    syscall
