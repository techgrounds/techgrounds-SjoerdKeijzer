
How to get vnet peering to work in a seperate module - I went with resource reference with `= existing` condition as the parent in the peering resource needs a direct input. 
- https://github.com/Azure/bicep/discussions/3606