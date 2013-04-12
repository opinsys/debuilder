#!/bin/sh

cat <<EOF > $1
#!/bin/sh

set -eu

DEBUILDER_CONFDIR="$2"
DEBUILDER_UTILDIR="$3"
EOF

chmod +x $1
