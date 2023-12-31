#!/bin/bash

echo "Process: Clean/Detail.sh"

# Context: CodeEditorLand/Application

pwd

\jq -S "del(.eslintConfig,.prettier,.peerDependencies,.engines,.tags,.categories,.keywords,.scripts.lint,.scripts.[\"lint-fix\"])" package.json >| package.json.tmp
\mv package.json.tmp package.json

Omit=(
	"@typescript-eslint/eslint-plugin"
	"@typescript-eslint/parser"
	"eslint-cli"
	"eslint-config-airbnb"
	"eslint-config-prettier"
	"eslint-config-standard"
	"eslint-import-resolver-node"
	"eslint-import-resolver-typescript"
	"eslint-plugin-filenames"
	"eslint-plugin-header"
	"eslint-plugin-html"
	"eslint-plugin-import"
	"eslint-plugin-jsdoc"
	"eslint-plugin-jsx-a11y"
	"eslint-plugin-license-header"
	"eslint-plugin-local"
	"eslint-plugin-no-null"
	"eslint-plugin-no-only-tests"
	"eslint-plugin-node"
	"eslint-plugin-notice"
	"eslint-plugin-prefer-arrow"
	"eslint-plugin-prettier"
	"eslint-plugin-promise"
	"eslint-plugin-react-hooks"
	"eslint-plugin-react"
	"eslint-plugin-require-path-exists"
	"eslint-plugin-security"
	"eslint-plugin-standard"
	"eslint-plugin-tslint"
	"eslint-plugin-unicorn"
	"eslint-plugin-vue"
	"eslint-utils"
	"eslint-visitor-keys"
	"eslint"
	"gulp-eslint"
	"prettier"
	"tslint"
)

Key() {
	local Type="$1"

	for Dependency in "${Omit[@]}"; do
		\jq -S "del(.[\"${Type}\"].[\"${Dependency}\"])" package.json >| package.json.tmp
		\mv package.json.tmp package.json
	done
}

Key "dependencies"
Key "devDependencies"
