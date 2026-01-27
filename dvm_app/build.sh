#!/bin/bash

# Make the script executable
chmod +x build.sh

# Example usage
# ./build.sh -f prod -t apk -s

# Function to show usage
show_help() {
    echo "Usage: ./build.sh -f <flavor> -t <type> [-s]"
    echo ""
    echo "Options:"
    echo "  -f    Flavor (dev, stage, prod)"
    echo "  -t    Build type (apk, aab)"
    echo "  -s    Split per ABI (only for apk)"
    echo "  -h    Show this help message"
    echo ""
    echo "Example:"
    echo "  ./build.sh -f dev -t apk -s"
    echo "  ./build.sh -f prod -t aab"
}

# Initialize variables
FLAVOR=""
TYPE=""
SPLIT=false

# Parse arguments
while getopts "f:t:sh" opt; do
    case ${opt} in
        f)
            FLAVOR=$OPTARG
            ;;
        t)
            TYPE=$OPTARG
            ;;
        s)
            SPLIT=true
            ;;
        h)
            show_help
            exit 0
            ;;
        \?)
            echo "Invalid option: -$OPTARG" 1>&2
            show_help
            exit 1
            ;;
        :)
            echo "Option -$OPTARG requires an argument." 1>&2
            show_help
            exit 1
            ;;

    esac
done

# Validate Flavor
if [[ -z "$FLAVOR" ]]; then
    echo "Error: Flavor is required."
    show_help
    exit 1
fi

if [[ "$FLAVOR" != "dev" && "$FLAVOR" != "stage" && "$FLAVOR" != "prod" ]]; then
    echo "Error: Invalid flavor '$FLAVOR'. Must be dev, stage, or prod."
    exit 1
fi

# Validate Type
if [[ -z "$TYPE" ]]; then
    echo "Error: Build type is required."
    show_help
    exit 1
fi

if [[ "$TYPE" != "apk" && "$TYPE" != "aab" ]]; then
    echo "Error: Invalid build type '$TYPE'. Must be apk or aab."
    exit 1
fi

# Construct command
CMD="flutter build"

if [[ "$TYPE" == "apk" ]]; then
    CMD="$CMD apk"
elif [[ "$TYPE" == "aab" ]]; then
    CMD="$CMD appbundle"
fi

CMD="$CMD --flavor $FLAVOR -t lib/main_$FLAVOR.dart"

if [[ "$TYPE" == "apk" && "$SPLIT" == true ]]; then
    CMD="$CMD --split-per-abi"
fi

if [[ "$TYPE" == "aab" && "$SPLIT" == true ]]; then
    echo "Warning: Split per ABI is ignored for AAB builds."
fi

# Print and Execute
echo "=========================================="
echo "Building $FLAVOR $TYPE..."
echo "Command: $CMD"
echo "=========================================="

eval $CMD
