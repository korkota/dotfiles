if [ -z "$VISUAL" ]; then
  type vim >/dev/null 2>&1 && VISUAL=vim || VISUAL=vi
fi
EDITOR=$VISUAL
export VISUAL EDITOR

