
How to get vnet peering to work in a seperate module - I went with resource reference with `= existing` condition as the parent in the peering resource needs a direct input. 
- https://github.com/Azure/bicep/discussions/3606
- https://stackoverflow.com/questions/69245544/how-to-reference-a-parent-resource-name-to-a-resource-inside-a-module-using-bice?rq=3


Keyvault errors
- https://github.com/Azure/azure-rest-api-specs/issues/1739
