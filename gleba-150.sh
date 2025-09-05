#!/bin/bash

lake build gleba-150 > /dev/null
echo -n 0; .lake/build/bin/gleba-150 | pigz -zc | base64 -w0; echo
