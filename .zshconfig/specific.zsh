if [ $(date +%u) -eq 5 ]; then
   echo "======= Friday ========"
   echo "=== Water the plant ==="
fi

DAY=$(date +%e)
if [[ ( ! -e ${HOME}/.tempo_done && ${DAY} -ge 27 ) ]]; then
   echo "==== End of month ===="
   echo "===== Fill Tempo ====="
elif [[ ( -e ${HOME}/.tempo_done && ${DAY} -le 10 ) ]]; then
     rm ${HOME}/.tempo_done
fi

MYRED="\x1b[3;31m"
MYBLUE="\x1b[23;1;34m"
MYRESET="\x1b[;m"
TODO_FILE=${HOME}/TODO.org
if [[ -e "${TODO_FILE}" ]]; then
    cat "${TODO_FILE}" | \
	sed -nre "s/^\* TODO(.+)/${MYBLUE}* ${MYRED}TODO${MYBLUE}\1${MYRESET}/p"
fi
