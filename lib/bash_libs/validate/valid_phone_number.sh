#!/usr/bin/env bash

validAlphaNum()
{
  # Validate arg: returns 0 if all upper+lower+digits; 1 otherwise

  # Remove all unacceptable chars.
  validchars="$(echo $1 | sed 's/[^- [:digit:]\(\)]//g')"

  if [ "$validchars" = "$1" ] ; then
    return 0
  else
    return 1
  fi
}