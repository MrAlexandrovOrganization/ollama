#!/bin/sh
set -e

ollama serve &

echo "Waiting for Ollama to start..."
until ollama list > /dev/null 2>&1; do
    sleep 1
done

MODELS="${OLLAMA_PULL_MODELS:-qwen2.5:7b}"

for MODEL in $(echo "$MODELS" | tr ',' ' '); do
    if ! ollama show "$MODEL" > /dev/null 2>&1; then
        echo "Pulling model $MODEL..."
        ollama pull "$MODEL" 2>&1 | stdbuf -oL grep --line-buffered -vE '^pulling [0-9a-f]+:' || true
        echo "Model $MODEL pulled."
    else
        echo "Model $MODEL already present, skipping."
    fi
done

wait
