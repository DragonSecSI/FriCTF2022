#!/bin/sh

strings something_interesting.pdf  | grep "==" | base64 -d

