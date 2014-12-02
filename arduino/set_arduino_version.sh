#!/bin/sh

DRY_RUN=false
for i in "$@"
do
case $i in
    --dry-run)
        DRY_RUN=true
        shift
    ;;
    --arduino_dir=*)
        ARDUINO_DIR="${i#*=}"
        shift
    ;;
    --project_name=*)
        PROJECT_NAME="${i#*=}"
        shift
    ;;
    *)
        # unknown option
    ;;
esac
done

if $DRY_RUN; then
    echo $PROJECT_NAME.config
    exit 0;
fi
ARDUINO_VERSION=$(cat $ARDUINO_DIR/lib/version.txt | sed -e 's/^[0-9]://g' -e 's/[.]//g' -e 's/$$/0000/' | head -c3)
cat > $PROJECT_NAME.config << EOF
// Tell QtCreator the arduino library version,
// so that it can expand headers correctly
#define ARDUINO $ARDUINO_VERSION

// You can add other defines here
EOF
