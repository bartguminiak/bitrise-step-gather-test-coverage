#!/bin/bash
set -ex

gem install slather -v 2.4.7

slather coverage -s --ignore "Pods/*" --scheme DrugStars --workspace "$workspace_path" "$project_path"

output=$(slather coverage -s --ignore "Pods/*" --scheme DrugStars --workspace "$workspace_path" "$project_path")
output=${output##*Coverage: }
output=${output%%Slathered*}

envman add --key TEST_COVERAGE --value "$output"
