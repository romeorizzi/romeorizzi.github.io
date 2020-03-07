#!/bin/bash
: ${XWININFO:=$(type -P xwininfo)}
[[ -z ${XWININFO} ]] && { echo "You need to install xwininfo"; exit 1; }
: ${XPROP:=$(type -P xprop)}
[[ -z ${XPROP} ]] && { echo "You need to install xprop"; exit 1; }

TRANSPARENCY_PERCENT=$1
[[ -z ${TRANSPARENCY_PERCENT} ]] && { echo "Usage: $0 <transparency in percentage>"; echo " -where 0 = back to solid"; echo "      100 = invisible"; exit 1; }

echo "Click on a terminal window to set its transparency as specified (${TRANSPARENCY_PERCENT}%)"
TERMINAL_WINDOW_XID=$("$XWININFO" | sed -n 's/.*Window id: \([0-9a-fx]\+\).*/\1/p')

if [[ ${TRANSPARENCY_PERCENT} = 0 ]]; then
    TRANSPARENCY_HEX="0xffffffff"
elif [[ ${TRANSPARENCY_PERCENT} = 100 ]]; then
    TRANSPARENCY_HEX="0x00000000"
else
    TRANSPARENCY_HEX=$(printf "0x%x" $((4294967295 - 4294967295 * $TRANSPARENCY_PERCENT / 100)))
fi

for each in $TERMINAL_WINDOW_XID; do
    "$XPROP" -id $each -f _NET_WM_WINDOW_OPACITY 32c -set _NET_WM_WINDOW_OPACITY $TRANSPARENCY_HEX
done

#UN'ALTERNATIVA:
#oppure introduci direttamente dalla shell:
#sh -c 'xprop -f _NET_WM_WINDOW_OPACITY 32c -set _NET_WM_WINDOW_OPACITY $(printf 0x%x $((0xffffffff * 80 / 100)))'
#Your mouse cursor will become cross-shaped, simply click on any window and it become 80% opacity.
#To reset the window opacity, run command:
#sh -c 'xprop -f _NET_WM_WINDOW_OPACITY 32c -set _NET_WM_WINDOW_OPACITY $(printf 0x%x $((0xffffffff * 100 / 100)))'
