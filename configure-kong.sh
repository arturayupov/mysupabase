#!/bin/sh

echo "⏳ Waiting for Kong to be ready..."
sleep 10

echo "🔧 Creating PostgREST service..."
curl -s -X POST http://localhost:8001/services \
  --data name=postgrest \
  --data url=http://postgrest:3000

echo "🔧 Creating /rest/v1 route..."
curl -s -X POST http://localhost:8001/routes \
  --data paths[]=/rest/v1 \
  --data strip_path=false \
  --data service.name=postgrest

echo "✅ Kong is configured"
