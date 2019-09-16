#!/bin/bash
set -ex

output=$(slather coverage -s --scheme DrugStars --workspace "$workspace_path" "$project_path")
output=${output##*Coverage: }
output=${output%%Slathered*}

envman add --key TEST_COVERAGE --value "$output"
