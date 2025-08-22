#!/bin/bash

lake build nauvis-150 > /dev/null
echo -n 0; .lake/build/bin/nauvis-150 | pigz -zc | base64 -w0; echo
