#!/bin/bash
# LitGUI plugin install hook.
# The UI bundle in ./ui/ is self-contained, but the plugin's Node
# controller now runs a small Express server (see index.js) to serve
# that bundle on a dedicated port. Express must be installed into the
# plugin's own node_modules. Volumio requires the "plugininstallend"
# marker on stdout to consider the install successful.
echo "Installing LitGUI"

# Run npm install from the plugin directory (the dir this script lives in).
PLUGIN_DIR="$(cd "$(dirname "$0")" && pwd)"
cd "$PLUGIN_DIR" || exit 1
echo "Installing Node dependencies (express)..."
npm install --production --no-audit --no-fund 2>&1

echo "plugininstallend"
