#!/bin/bash

lake build spaceship > /dev/null
echo -n 0; .lake/build/bin/spaceship | pigz -zc | base64 -w0; echo
