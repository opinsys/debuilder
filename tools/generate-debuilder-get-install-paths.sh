#!/bin/sh

cat <<EOF > $1
#!/bin/sh

set -eu

DEBUILDER_CONFDIR="$2"
DEBUILDER_LIBDIR="$3"
EOF

chmod +x $1
