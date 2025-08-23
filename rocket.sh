#!/bin/bash

lake build rocket > /dev/null
echo -n 0; .lake/build/bin/rocket | pigz -zc | base64 -w0; echo
