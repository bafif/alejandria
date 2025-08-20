#!/usr/bin/env bash

for file in ./{matematica,computacion/lenguajes}/*.typ ; do
	field=$(echo "${file##*/}" | cut -d '.' -f 1)
	typst compile --root . $file "./pdfs/$field.pdf"
	echo $field
done
