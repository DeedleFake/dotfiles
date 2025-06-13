set -gx PNPM_HOME "/home/deedles/.local/share/pnpm"
if not string match -q -- $PNPM_HOME $PATH
  set -pgx --path PATH "$PNPM_HOME"
end
