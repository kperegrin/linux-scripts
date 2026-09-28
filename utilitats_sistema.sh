#! /bin/bash

#Funció benvinguda
#Guardem el digit $1 i saludem al usuari
benvinguda(){
	local nom="$1"
	echo "Hola $nom, anem a comprovar el sistema."
}
#Funció comprovacio usuari a /etc/passwd
#Amb un condicional comproben si es troba i si no es troba responem de manera diferent
comprova_usuari(){
	local usuari="$1"
	if grep -q "${usuari}:" /etc/passwd; then
		echo "El nom d'usuari $usuari se ha trobal al /etc/passwd"
	else
		echo "El nom d'usuari $usuari no existeix al sistema."
	fi
}
#Funció calculadora espai
#Guardem la particio a una variable local i mostrem per pantalla el  espai del disc
calculadora_espai(){
	local particio="/"

	echo "Espai disponible a la partició principal:"
	df -h "$particio"
}


menu() {

	local opcio
	while true; do
		echo ""
        	echo "===== MENÚ D'UTILITATS ====="
        	echo "1. Mostrar benvinguda"
        	echo "2. Comprovar usuari"
        	echo "3. Consultar espai del disc"
        	echo "4. Sortir"
        	echo "============================"
		read -p "Selecciona una opció: " opcio

		case "$opcio" in
			1)
				read -p "Introdueix el teu nom: " nom
				benvinguda "$nom"
				;;
			2)
				read -p "Introdueix un nom d'usuari: " usuari
				comprova_usuari "$usuari"
				;;
			3)
				calculadora_espai
				;;
			4)
				echo "Sortint del programa..."
				break
				;;
			*)
				echo "Opcio incorrecta. Tria una opcio de l'1 al 4."
				;;
		esac
	done
}
#llamem al menu
menu
