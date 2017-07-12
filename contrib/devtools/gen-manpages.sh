#!/bin/sh

TOPDIR=${TOPDIR:-$(git rev-parse --show-toplevel)}
SRCDIR=${SRCDIR:-$TOPDIR/src}
MANDIR=${MANDIR:-$TOPDIR/doc/man}

BITCOIND=${BITCOIND:-$SRCDIR/planbcoind}
BITCOINCLI=${BITCOINCLI:-$SRCDIR/planbcoin-cli}
BITCOINTX=${BITCOINTX:-$SRCDIR/planbcoin-tx}
BITCOINQT=${BITCOINQT:-$SRCDIR/qt/planbcoin-qt}

[ ! -x $BITCOIND ] && echo "$BITCOIND not found or not executable." && exit 1

# The autodetected version git tag can screw up manpage output a little bit
PBCVER=($($BITCOINCLI --version | head -n1 | awk -F'[ -]' '{ print $6, $7 }'))

# Create a footer file with copyright content.
# This gets autodetected fine for planbcoind if --version-string is not set,
# but has different outcomes for planbcoin-qt and planbcoin-cli.
echo "[COPYRIGHT]" > footer.h2m
$BITCOIND --version | sed -n '1!p' >> footer.h2m

for cmd in $BITCOIND $BITCOINCLI $BITCOINTX $BITCOINQT; do
  cmdname="${cmd##*/}"
  help2man -N --version-string=${PBCVER[0]} --include=footer.h2m -o ${MANDIR}/${cmdname}.1 ${cmd}
  sed -i "s/\\\-${PBCVER[1]}//g" ${MANDIR}/${cmdname}.1
done

rm -f footer.h2m
