#!/bin/sh
set -e

ollama serve &

echo "Waiting for Ollama to start..."
until ollama list > /dev/null 2>&1; do
    sleep 1
done

MODEL="${OLLAMA_MODEL:-qwen2.5:1.5b}"
if ! ollama show "$MODEL" > /dev/null 2>&1; then
    echo "Pulling model $MODEL..."
    ollama pull "$MODEL"
fi

wait
