#!/bin/sh

cat <<EOF > $1
#!/bin/sh

set -eu

DEBUILDER_CONFIG_FILE="$2"
DEBUILDER_LIBEXECDIR="$3"
EOF

chmod +x $1
