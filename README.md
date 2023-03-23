# hurl-ubuntu

Docker image, based on Ubuntu, with HURL installed for automated API testing.

This image also installed the dotnet SDK. My use case for this image required the use of some bespoke dotnet tooling to scaffold a database for testing scenarios.

## What is HURL?

> Hurl is a command line tool that runs HTTP requests defined in a simple plain text format.
> It can chain requests, capture values and evaluate queries on headers and body response. Hurl is very versatile: it can be used for both fetching data and testing HTTP sessions.
> Hurl makes it easy to work with HTML content, REST / SOAP / GraphQL APIs, or any other XML / JSON based APIs.

## Why do I need this image?

I created this image for use within a GitLab CI/CD workflow to run my automated tests. I also needed to add additional tools in order to setup the testing environment.
