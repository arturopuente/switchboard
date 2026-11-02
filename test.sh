#!/usr/bin/env bash
# Run Switchboard's tests. They need nothing beyond Emacs itself.
set -euo pipefail
cd "$(dirname "$0")"

# Prefer the .el: Emacs compiles switchboard.elc here, and it can be stale.
# -q, not -Q: -Q also skips emacs-plus's site-start.el, which points native
# compilation at the current gcc; without it, linking fails (emutls_w).
exec emacs -q --batch --eval '(setq load-prefer-newer t)' -L . -l switchboard-test.el \
     -f ert-run-tests-batch-and-exit
