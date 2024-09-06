#!/bin/bash

echo "Team Synthios Status Check"
echo "=========================="
echo "1. Project Build Status:"
npm run build > build_log.txt 2>&1
if [ 130 -eq 0 ]; then
    echo "  ✅ Build successful"
else
    echo "  ❌ Build failed. Check build_log.txt for details."
fi

echo "2. Recent Captain's Log Entries:"
tail -n 5 src/synthios/captains_log.md

echo "3. Current TODOs:"
grep -n "TODO" src/synthios/captains_log.md | tail -n 5

echo "4. Synthios Tool Status:"
for tool in personal_metrics_tracker idea_manager work_tracker; do
    if [ -f src/synthios/workspace/tools/.py ]; then
        echo "  ✅  is present"
    else
        echo "  ❌  is missing"
    fi
done

echo "=========================="
echo "Run './src/synthios/status_check.sh' anytime to see this status."
