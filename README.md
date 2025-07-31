# Agent TARS

## Building the Docker Image

To build the Docker image for Linux/AMD64 platform, run:

```bash
docker build --platform=linux/amd64 -t agent-tars-linux .
```

## Configuration

Make sure to set your API key (for LLM calling) in the Dockerfile or pass it as an environment variable when running the container.

## Usage

After building, you can run the container with:

```bash
docker run -it agent-tars-linux
```