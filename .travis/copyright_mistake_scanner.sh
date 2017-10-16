#!/bin/bash
# Copyright 2017 Amazon.com, Inc. or its affiliates. All Rights Reserved.
#
# Licensed under the Apache License, Version 2.0 (the "License").
# You may not use this file except in compliance with the License.
# A copy of the License is located at
#
#  http://aws.amazon.com/apache2.0
#
# or in the "license" file accompanying this file. This file is distributed
# on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
# express or implied. See the License for the specific language governing
# permissions and limitations under the License.
#

#header checker for either copyright info and/or proper year

YEAR=$(date +%Y)
while IFS= read -r -d $'\0' file; do
	grep -L "* Copyright $YEAR" $file | perl -ne 'print "File is missing copyright info: $_"'
done < <(find . -type f -name '*.c' -o -name '*.h' -print0)
