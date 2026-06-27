#!/bin/sh
set -e

ollama serve &

echo "Waiting for Ollama to start..."
until ollama list > /dev/null 2>&1; do
    sleep 1
done

MODELS="${OLLAMA_MODELS:-qwen3.5:2b}"

for MODEL in $(echo "$MODELS" | tr ',' ' '); do
    if ! ollama show "$MODEL" > /dev/null 2>&1; then
        echo "Pulling model $MODEL..."
        ollama pull "$MODEL"
    else
        echo "Model $MODEL already present, skipping."
    fi
done

wait
