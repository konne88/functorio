#!/bin/bash

lake build red-science-150 > /dev/null
echo -n 0; .lake/build/bin/red-science-150 | pigz -zc | base64 -w0; echo
