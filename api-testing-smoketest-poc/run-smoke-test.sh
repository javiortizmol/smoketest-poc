#!/bin/bash
environment="$1"


npm run smoke-test --environment=$environment
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "ERROR: Smoke test failed"
else
    echo "INFO: Smoke test success"
fi
exit $retVal