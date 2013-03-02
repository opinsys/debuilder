#!/bin/sh

cat <<EOF > $1
#!/bin/sh

set -eu

DEBUILDER_SPOOLDIR="$2"
DEBUILDER_CONFIG_FILE="$3"
EOF

chmod +x $1
