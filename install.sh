
# az acr create \
# --name mossadrg \
# --resource-group testpipe \
# --sku Standard \
# && \
az aks create \
--name mossadcluster \
--resource-group testpipe \
--enable-addons monitoring \
--kubernetes-version 1.15.11 \
--generate-ssh-keys \
--node-count 2 \
&& \
clientId=$(az aks show \
--name mossadcluster \
--resource-group testpipe \
--query "servicePrincipalProfile.clientId" \
--output tsv) \
&& \
acrId=$(az acr show \
--name mossadrg \
--resource-group testpipe \
--query "id" \
--output tsv)\
&& \
az role assignment create --assignee $clientId --role acrpull --scope $acrId 