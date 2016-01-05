The simple life for polyglot developers.

`allup` is a tool to make working with software projects easy.  It is meant to
be used with any programming environment.  A `.allup` file in your project
specifies the configuration.

## Goals

 - Running `allup` should validate your development environment and make sure
   you are set up to work on the project
 - Some basic `allup <task>`s should work for all projects using `allup`

## Configuration

Put a `.allup` file in your project's folder and check it in.

Here is an example showing all possible configuration options, but everything
is optional if your project doesn't require it.

```json
{
  "couchdb": true,
  "commands": {
    "test": "rake spec"
  }
}
```

## Development commands

Requires ruby-2.2.3, the bundler gem, and go-1.5.1.

 - Bootstrap: `bundle`
 - Run acceptance tests: `cucumber`
 - Run tests: ``GOPATH=`pwd` go test allup``
 - Build: ``GOPATH=`pwd` go build -o allup main``
