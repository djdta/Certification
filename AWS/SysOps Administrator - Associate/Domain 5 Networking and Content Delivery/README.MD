## Template

Network traffice flow through to the instance

- [ ] Internet to Gateway
- [ ] Router
- [ ] Route Table
- [ ] Network access control list
- [ ] Secuirty Group 
- [ ] Instance

secuirty group
* instance level
* Alow rules only
* Evaluate all rules before allowing traffic
* Stateful: return traffic automanically allowed regardless of any rule
* Applies to the instance only if availble with the secuirty group

You can assigne multiple secuirty gorup to one instance
chnage secuirty groups assigned to any instance.
Modify secuirty group rules.
Changes to the secuirty group are applied immeduately


Network Access Control List
* Subnet Level
* Allow and Deny rules
* Rules processed in numeric order
* Stateless: return traffice must be explicitly allowed by rules.
* Automatically applies to all instances in the subnets associated with the NACL

Troubleshooting

Ensure the application is running
- Localhost check

Create an inbound rule to allow proper access to application
- Protocol / Port

Source from desired IP Address
- Okay for any ip depending on your app.