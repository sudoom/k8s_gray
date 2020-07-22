
az acr create \
--name mossadrg \
--resource-group test \
--sku Standard \
&& \
az aks create \
--name mossadcluster \
--resource-group test \
--enable-addons monitoring \
--kubernetes-version 1.15.11 \
--generate-ssh-keys \
--node-count 2 \
&& \
clientId1=$(az aks show \
--name webbapp_stage_mmhddofogbaic \
--resource-group test \
--query "servicePrincipalProfile.clientId" \
--output tsv) \  
# $clientId
# bash: 487e997c-6dd3-451f-9afe-8840af7a3b48: command not found
&& \
acrId=$(az acr show \
--name acrmmhddofogbaic \
--resource-group test \
--query "id" \    
--output tsv)
&& \
# $acrId
# bash: /subscriptions/b986656e-c238-4d08-bc76-efbfc9a46470/resourceGroups/test/providers/Microsoft.ContainerRegistry/registries/acrmmhddofogbaic: No such file or directory
az role assignment create --assignee $clientId1 --role acrpull --scope $acrId 