#!/bin/bash
sed -i "s/PORT/$PORT/g" /trojan/config.json
/trojan/trojan /trojan/config.json
