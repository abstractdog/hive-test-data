if [ -z ${BEELINE+x} ]; then { echo "BEELINE is unset"; exit 1;}; else echo "BEELINE is set to '$BEELINE'"; fi

cp sample_10000.csv /tmp/sample.csv

$BEELINE -f load.sql
