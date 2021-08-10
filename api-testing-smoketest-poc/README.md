#

# Pactum
This tool was selected regarding to the comparative dashboard presents on this link https://dev.to/asaianudeep/api-testing-tools-in-javascript-22d8

# Content of the project

- .env files - Contains the env variables referenced on the test cases per environment.
- [test](test) - This folder contains the test cases automated using [pactum](https://pactumjs.github.io/#/) and [mocha](https://mochajs.org/)

# How to run it?

### For local environment
```
./run-smoke-test.sh
```
### For environments
The shell script support these variables:
1. environment; Could be develop, qa, prod, staging or the name that you want to send there.
2. format; Only support xml or html format, by default is html format.
3. build_id; This variable could be usage to send the pipeline build id.
```
./run-smoke-test.sh develop xml 10
```