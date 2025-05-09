# 📊 Azure Monitoring Setup

This folder provides templates and examples for configuring monitoring, dashboards, and alerts in **Azure Monitor** and **Log Analytics**.

---

## 🧭 Overview

Azure Monitor is a unified monitoring service that collects, analyzes, and acts on telemetry from Azure and on-prem resources.

We provide:

- **Workbooks** for dashboards
- **KQL queries** for log analytics
- **Alert rule templates**

---

## 📈 Azure Monitor Workbooks

Workbooks are customizable dashboards built on top of Log Analytics and metrics.

- File: `azure-monitor-workbook.json`
- Usage:

  1. Go to Azure Portal → Monitor → Workbooks
  2. Click **+ New** → **Edit** → **Advanced Editor**
  3. Paste the JSON content from this folder
  4. Save as a new workbook

---

## 🔍 Log Analytics (KQL Queries)

Use `.kusto` files to run advanced queries in Azure Log Analytics.

- File: `log-analytics-query.kusto`
- Usage:

  - Open Log Analytics workspace → Logs
  - Paste query to analyze logs or drive alerts

---

## 🚨 Alerts

Templates for configuring alert rules via Azure Resource Manager (ARM) templates.

- Folder: `alerts/`
- Example: `cpu-usage-alert.json`

**Steps to deploy using Azure CLI:**

1. Replace the placeholders in the alert template:

   - `<subscription-id>`
   - `<resource-group>`
   - `<vm-name>`

2. Run this command:

```bash
az deployment group create \
  --resource-group <your-resource-group> \
  --template-file monitoring/alerts/cpu-usage-alert.json
```

This creates an alert when average CPU usage exceeds 80%.

---

## 💡 Tips

- Centralize logs into a **Log Analytics Workspace**
- Enable diagnostic settings on VMs, containers, AKS, etc.
- Use **Activity Logs** + **Metrics** for full visibility

---

## 🔗 Resources

- [Azure Monitor Docs](https://learn.microsoft.com/en-us/azure/azure-monitor/)
- [Kusto Query Language (KQL)](https://learn.microsoft.com/en-us/azure/data-explorer/kusto/query/)
- [Workbooks Overview](https://learn.microsoft.com/en-us/azure/azure-monitor/workbooks-overview)
