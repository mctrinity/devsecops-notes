# Secure base image using distroless
FROM gcr.io/distroless/static:nonroot

# Set working directory
WORKDIR /app

# Copy statically compiled binary
COPY myapp /app/myapp

# Use non-root user for security
USER nonroot:nonroot

# Define entrypoint
ENTRYPOINT ["/app/myapp"]
