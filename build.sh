#!/usr/bin/env bash

# Make build folder
if [ -d "build" ]; then rm -rf build; fi
mkdir -p build

MISSIONS=(A3-AATemplate.Altis A3-AA-BLUFORTemplate.Altis A3-WotPTemplate.Tanoa A3-ArmiaKrajowaTemplate.chernarus_summer)

for MISSION in ${MISSIONS[@]}; do
    echo "Building ${MISSION}..."
    mkdir -p build/${MISSION}
    cp -r A3-Antistasi/* build/${MISSION}
    cp -rf A3-Antistasi/Templates/${MISSION}/* build/${MISSION}/
    rm -rf build/${MISSION}/Templates/*/

    OUTPUT=$(makepbo -PN build/${MISSION} build/${MISSION}.pbo 2>&1)
    RET=$?
    
    if [[ $RET -ne 0 ]]; then
        echo "Error: makepbo returned $RET"
        echo "$OUTPUT"
        exit 1
    fi

    rm -rf build/${MISSION}
done