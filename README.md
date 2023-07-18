# Buildkite Agent Stack

[![License](https://img.shields.io/badge/License-MIT-blue.svg)](https://opensource.org/licenses/MIT)

An unofficial and opinionated [Buildkite](https://buildkite.com/docs/agent) [Helm](https://helm.sh) chart. Use this at your own risk etc. Support is best-effort.

The goal is to easily deploy and maintain an efficient set of Buildkite agents on Kubernetes.

I'm aware [agent-stack-k8s](https://github.com/buildkite/agent-stack-k8s) exists, however the existing implementation does not appear to work with [docker-compose-buildkite-plugin](https://github.com/buildkite-plugins/docker-compose-buildkite-plugin), and making it efficient seems hard.

## Features

* Deploy multiple queues with a single chart
  * Supports Clusters
* Ability to deploy Docker in Docker as a `DaemonSet` to minimise overhead on building and moving images between agents
* Spread agents evenly across nodes using pod anti-affinity
* WIP: Spread Buildkite jobs evenly across nodes by using agent priority

## Roadmap / Ideas

* Built-in registry pull-through cache
* Docker image cleanup


## Getting Started

### Install Helm

Get the latest [Helm release](https://github.com/kubernetes/helm#install).

### Add Buildkite Helm chart repository:

 ```console
 helm repo add buildkite-agent-stack https://github.com/chendo/buildkite-agent-stack.git
 helm repo update
 ```

### Install chart

To install the Agent chart with the release name `bk-agent`:

```console
helm install --name bk-agent --namespace buildkite buildkite/agent --set agent.token="BUILDKITE_AGENT_TOKEN"
```

Check Agent chart [readme](stable/agent/README.md) for more customisation options.

** You’ve now got Buildkite Agents running on your Kubernetes cluster! :tada: **

## Contributing to Buildkite Charts

Fork the `repo`, make changes and test it by installing the chart to see it is working. :)

On success make a [pull request](https://help.github.com/articles/using-pull-requests) (PR).

Upon successful review, someone will give the PR a __LGTM__ in the review thread.

## Thanks :heart:

* A massive thanks to [Rimas Mocevicius](https://github.com/rimusz) for authoring Buildkite Agent chart.

## Copyright

Copyright (c) 2020-2023 Buildkite Pty Ltd, chendo. See [LICENSE](LICENSE) for details.
