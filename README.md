# Buildkite Agent Stack

[![License](https://img.shields.io/badge/License-MIT-blue.svg)](https://opensource.org/licenses/MIT)

An unofficial and opinionated [Buildkite](https://buildkite.com/docs/agent) [Helm](https://helm.sh) chart. Use this at your own risk etc. Support is best-effort.

## Goals

* Turn-key deployment for docker-compose pipelines
* Fast and efficient builds
  * Minimise unnecessary overhead from duplicate work (builds, fetching, booting dependencies)
  * Maximising use of compute
    * Spread work across nodes

## See also

* Buildkite's official [agent-stack-k8s](https://github.com/buildkite/agent-stack-k8s)
  * Current implementation does not appear to work with [docker-compose-buildkite-plugin](https://github.com/buildkite-plugins/docker-compose-buildkite-plugin)
* Buildkite's official but deprecated [Helm charts](https://github.com/buildkite/charts), which this is forked from.

## Features

* Deploy multiple sets of agents with a single chart, with per-set:
  * queues
  * nodeSelectors
  * resources
  * volumeMounts
  * tags
* Ability to deploy Docker in Docker as a `DaemonSet` to minimise overhead on building and moving images between agents
* Spread agents evenly across nodes using pod anti-affinity
* Spread jobs evenly across nodes by using agent priority
* Usability improvements:
  * Agents have node=<node> tags
  * Agent default name format: `[prefix]<node>-<queue>-<pod suffix>`  

## Roadmap / Ideas

* Built-in registry pull-through cache
* Docker image cleanup

## Getting Started

More detailed instructions coming later.

1. Use Helm to deploy to your cluster. See `values.yaml` and tweak accordingly

## Thanks :heart:

* A massive thanks to [Rimas Mocevicius](https://github.com/rimusz) for authoring Buildkite Agent chart.

## Copyright

Copyright (c) 2020-2023 Buildkite Pty Ltd, chendo. See [LICENSE](LICENSE) for details.
