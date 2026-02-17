# ☸️ SC104: Helm Chart Developer Journey

This repository documents my 14-day "Zero to Hero" journey preparing for the **Linux Foundation SC104 (Helm Chart Developer)** certification.

## 📅 Daily Progress Log

| Day | Topic | Status | Key Learning |
| :--- | :--- | :--- | :--- |
| **01** | **Chart Anatomy (Manual Build)** | ✅ Done | Built a chart without `helm create` to understand the minimal required structure (`Chart.yaml` + `templates/`). |
| **02** | **Values & Injection** | ✅ Done | Extracted hardcoded values into `values.yaml` and injected them using `{{ .Values.key }}` syntax. |
| **03** | **Functions & Pipelines** | ✅ Done | mastered `quote`, `default`, and `upper` pipelines. Added CHANGELOG and semantic versioning. |
| **04** | **Flow Control (If/Else)** | ✅ Done | Created an optional ConfigMap using `{{- if }}` logic. Learned about whitespace control (`-`). |
| **05** | **Ranges (Loops)** | ✅ Done | Used `range` to iterate over lists and generate repeated configuration data. |
| **06** | **Named Templates (_helpers)** | ✅ Done | Moved reusable logic to `_helpers.tpl` and used `include` with `nindent` to keep manifests clean. |
| **07** | **Dependencies (Subcharts)** | ✅ Done | Integrated `bitnami/redis` into the chart and learned how to override child values from the parent. |
| **08** | **Chart Hooks** | ✅ Done | Created a `pre-install` Job to simulate database backups. Mastered `hook-weight` and `hook-delete-policy`. |
| **09** | **Chart Testing** | ✅ Done | Added a test Pod (`helm.sh/hook: test`) to verify application connectivity automatically. |
| **10** | **Packaging** | ✅ Done | Created versioned `.tgz` artifacts via `helm package`. |
... (You can add the rest of the 14 days here )

## 🚀 How to Run (Current Version v0.1.1)

Since this chart creates a Pod, you can run it in any cluster (Minikube, Kind, etc.).

### 1. Basic Install (Uses Defaults)
This uses the values defined in `values.yaml`.
```bash
helm install my-release ./day-01-anatomy
### 🔀 Day 4: Conditional Logic
*Goal: Create a resource ONLY if a flag is set to true.*

```bash
# 1. Default (No ConfigMap created)
helm template check-default ./day-01-anatomy

# 2. Enabled (ConfigMap is created)
helm template check-enabled ./day-01-anatomy --set enableConfigMap=true
### 🔄 Day 5: Loops
*Goal: Generate multiple lines of config from a single list.*

```bash
# Verify the loop output
helm template check-loops ./day-01-anatomy

### 🏷️ Day 6: Named Templates
*Goal: Verify that labels are generated consistently across all files.*

```bash
# Check the labels section of the Pod
helm template check-labels ./day-01-anatomy | grep -A 4 "labels:"

### 📦 Day 7: Subcharts (Redis)
*Goal: Deploy a database alongside our app.*

```bash
# 1. Download the dependency (Required before installing)
helm dependency update ./day-01-anatomy

# 2. Check the output
helm template check-redis ./day-01-anatomy | grep "Source:"

### ⚓ Day 8: Hooks
*Goal: Run a specific task before the application installs.*

```bash
# Verify the hook configuration
helm template check-hooks ./day-01-anatomy | grep "helm.sh/hook"

### 🧪 Day 9: Testing
*Goal: Verify the application is actually serving traffic.*

```bash
# 1. Install the chart first (Tests need a running app)
helm install day9-release ./day-01-anatomy

# 2. Run the test
helm test day9-release

## 🚀 How to Run (Cumulative)

### 📦 Day 10: Packaging & Verification
*Goal: Validate the chart code and package it into a distributable artifact.*

**1. Lint the Chart**
We use `--strict` to fail on any warnings (best practice for CI/CD).
```bash
helm lint ./day-01-anatomy --strict
# Expected Output: 
# [INFO] Chart.yaml: icon is recommended
# 1 chart(s) linted, 0 chart(s) failed
helm package ./day-01-anatomy
# Result: Creates 'day-01-anatomy-0.1.8.tgz' in the current directory.
helm install production-release day-01-anatomy-0.1.8.tgz
kubectl get all -l app.kubernetes.io/instance=production-release 
