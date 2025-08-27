#!/bin/bash

lake build fulgora-150 > /dev/null
echo -n 0; .lake/build/bin/fulgora-150 | pigz -zc | base64 -w0; echo
