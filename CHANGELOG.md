# Changelog

All notable changes to the "day-01-anatomy" chart will be documented in this file.

## [0.1.1] - Day 3: Functions & Pipelines
### Added
- Implemented `quote` function for safe string handling.
- Added `default` function for optional values.
- Added `upper` pipeline to transform environment variables.

## [0.1.0] - Day 2: Dynamic Values
### Changed
- Refactored hardcoded Pod spec to use `values.yaml`.
- Added `replicaCount` and `image` configuration.

## [0.0.1] - Day 1: Initial Commit
### Added
- Initial chart structure created manually.
- Basic Pod template.


## [0.1.3] - Day 5: Ranges & Loops
### Added
- Implemented `range` loops to iterate over lists in `values.yaml`.
- Added example of looping through strings and objects.

## [0.1.4] - Day 6: Named Templates
### Changed
- Refactored `pod.yaml` and `configmap.yaml` to use `_helpers.tpl`.
- Centralized label logic using `define` and `include`.

## [0.1.5] - Day 7: Dependencies
### Added
- Added `bitnami/redis` as a subchart dependency.
- Configured Redis to run in standalone mode via `values.yaml`.

## [0.1.6] - Day 8: Chart Hooks
### Added
- Implemented a `pre-install` and `pre-upgrade` hook using a Kubernetes Job.
- Configured hook weights and auto-deletion policies (`hook-succeeded`).

## [0.1.7] - Day 9: Chart Testing
### Added
- Implemented `helm test` capability using a connection test Pod.
- Created `templates/tests/` directory for test definitions.

## [0.1.8] - Day 10: Packaging
### Added
- Validated chart with `helm lint --strict`.
- Packaged chart into versioned `.tgz` artifact.
- Added `.gitignore` to exclude binary artifacts.

## [Day 11] - Repository Indexing
### Added
- Created `repo/` directory to serve as a local chart repository.
- Generated `index.yaml` using `helm repo index`.
- Updated `.gitignore` to allow tracking artifacts in `repo/`.

## [0.1.9] - Day 12: OCI Registry
### Added
- Bumped version to 0.1.9.
- Authenticated with GitHub Container Registry (GHCR).
- Pushed chart using `helm push` (OCI mode).
## [0.1.10] - Day 13: Chart Signing
### Added
- Bumped version to 0.1.10.
- Generated GPG keys for artifact signing.
- Packaged chart with `--sign` flag to generate `.prov` provenance file.
- Verified chart integrity using `helm verify`.
