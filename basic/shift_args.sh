#!/usr/bin/env bash
set -e
set -u

dryrun=false

function usage() {
    echo "Usage: `basename $0` -p [project_name] -v [npm_version] --preid [prerelease_id] --dry-run"
}

if [ $# == 0 ]; then
    usage
fi

while [[ $# -gt 0 ]]
do
    case $1 in
        -p | --project )
            shift
            project=$1
        ;;
        -v | --version )
            shift
            version=$1
        ;;
        --preid )
            shift
            preid=$1
        ;;
        --dry-run )
            dryrun=true
        ;;
        -h | --help )
            usage
            exit
        ;;
        * )
            usage
            exit 1
    esac
    shift
done

echo "Project: $project"
echo "Version: $version"
echo "Prerelease ID: $preid"
echo "dry run: $dryrun"

result=$(cd projects/storefrontstyles && npm publish .)
echo $result
