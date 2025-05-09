#!/bin/bash
# Deploy Azure Key Vault access policy using ARM template and assign RBAC role

RESOURCE_GROUP="my-resource-group"
KEYVAULT_NAME="my-keyvault"
OBJECT_ID="00000000-0000-0000-0000-000000000000"
TENANT_ID="11111111-1111-1111-1111-111111111111"
SUBSCRIPTION_ID="22222222-2222-2222-2222-222222222222"

# Deploy access policy via ARM template
az deployment group create \
    --name set-kv-access-policy \
    --resource-group "$RESOURCE_GROUP" \
    --template-file azure-keyvault-access-policy.json \
    --parameters keyVaultName="$KEYVAULT_NAME" objectId="$OBJECT_ID" tenantId="$TENANT_ID"

# Assign Key Vault Secrets User role
az role assignment create \
    --assignee "$OBJECT_ID" \
    --role "Key Vault Secrets User" \
    --scope "/subscriptions/$SUBSCRIPTION_ID/resourceGroups/$RESOURCE_GROUP/providers/Microsoft.KeyVault/vaults/$KEYVAULT_NAME"
