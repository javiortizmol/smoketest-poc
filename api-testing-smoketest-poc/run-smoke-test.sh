#!/bin/bash
environment="$1"
format="$2"
build_id="$3"

if [ "$format" == "" ]; then
    format="html"
fi
if [ "$environment" == "" ]; then
    environment="local"
fi
if [ "$build_id" == "" ]; then
    build_id="0"
fi

run_test(){
    smoketest_command="$1"
    echo "This is the enviroment: $environment"
    npm run $smoketest_command --environment=$environment --build=$build_id
    retVal=$?
    if [ $retVal -ne 0 ]; then
        echo "ERROR: Smoke test failed"
    else
        echo "INFO: Smoke test success"
    fi
    exit $retVal
}

html_report(){
    run_test smoke-test
}

xml_report(){
    run_test smoke-test-xml
}

# Main Program
npm install

if [ "$format" == "html" ]; then
    html_report
fi

if [ "$format" == "xml" ]; then
    xml_report
fi

