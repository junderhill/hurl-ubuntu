# hurl-ubuntu

Docker image, based on Ubuntu, with Hurl installed for automated API testing.

This image also installed the dotnet SDK. My use case for this image required the use of some bespoke dotnet tooling to scaffold a database for testing scenarios.

## What is Hurl?

> Hurl is a command line tool that runs HTTP requests defined in a simple plain text format.
> It can chain requests, capture values and evaluate queries on headers and body response. Hurl is very versatile: it can be used for both fetching data and testing HTTP sessions.
> Hurl makes it easy to work with HTML content, REST / SOAP / GraphQL APIs, or any other XML / JSON based APIs.

Find out more about Hurl [here](https://hurl.dev/).

## Why do I need this image?

I created this image for use within a GitLab CI/CD workflow to run my automated tests. I also needed to add additional tools in order to setup the testing environment.

## Using the image

You can either use a set version (recommended) or the `latest` tag:

```
docker pull ghcr.io/junderhill/hurl-ubuntu:latest
```

```
docker pull ghcr.io/junderhill/hurl-ubuntu:1.0.0
```

Using this image within a GitLab CI/CD workflow, as I do, may look something like this:

```yaml
end2end_tests:
  stage: test
  variables:
    FF_NETWORK_PER_BUILD: 1
  needs:
    - job: build_api_docker
      artifacts: true
    - job: 'dotenv'
      artifacts: true
  image: 'ghcr.io/junderhill/hurl-ubuntu:1.0.0'
  services:
    - name: 'some-container-repo.com/myorg/myapp'
      alias: api
      entrypoint:
        - "/bin/bash"
        - "-c"
        - "./bin/main"

  script:
    - hurl --test --variable host=http://api:8888 --glob "./hurltests/*.hurl"
```
