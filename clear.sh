if [ -z ${BEELINE+x} ]; then { echo "BEELINE is unset"; exit 1;}; else echo "BEELINE is set to '$BEELINE'"; fi

$BEELINE -f clear.sql
