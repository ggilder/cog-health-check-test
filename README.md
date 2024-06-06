# Testing cog health check endpoint

Run `./test.sh` to test the health check endpoint. This demonstrates an issue with cog - while a prediction is running, the health check endpoint is not available. Ideally we would be able to probe the health check endpoint to determine if the service is busy for purposes of load balancing.
