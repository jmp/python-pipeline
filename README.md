# python-pipeline

This is an experiment for building a continuous delivery (CD) pipeline
using GitHub Actions. This is nothing new nor ground-breaking. My goal
is just to follow the best practices introduced in the book
[Continuous Delivery Pipelines][cd-pipelines] by Dave Farley. At least
as far as they can be applied to GitHub Actions.

The application itself will be a very minimal Python web application
that doesn't do anything interesting. Maybe it will contain an endpoint
that prints "Hello, World!", or something like that. We will see.

## Building the pipeline

The pipeline needs four stages:

1. Commit Stage
2. Artifact Repository
3. Acceptange Stage
4. Deployment Stage

For each of these stages I will try to follow the recommended practices
such as writing business facing acceptance tests first, and so on.

[cd-pipelines]: https://leanpub.com/cd-pipelines