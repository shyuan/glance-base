# glance-base

Builds [glanceapp/glance](https://github.com/glanceapp/glance) from source and publishes a minimal Docker image to GitHub Container Registry (GHCR) using `gcr.io/distroless/static-debian12` as the runtime base.

## Triggering a build

1. Go to **Actions** > **Build and Push glance-base**
2. Click **Run workflow**
3. Enter the desired Glance version tag (e.g. `v0.7.0`)

## Using the image

```dockerfile
FROM ghcr.io/shyuan/glance-base:v0.7.0

COPY glance.yml /glance.yml
```

## Image URL format

```
ghcr.io/shyuan/glance-base:VERSION
ghcr.io/shyuan/glance-base:latest
```
