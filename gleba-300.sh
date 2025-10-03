#!/bin/bash

lake build gleba-300 > /dev/null
echo -n 0; .lake/build/bin/gleba-300 | pigz -zc | base64 -w0; echo


