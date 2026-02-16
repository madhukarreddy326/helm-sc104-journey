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
