# GateKeeper Policies
This project aims at enforcing best practices in kubernetes via gatekeeper profiles. Different of profiles ensure appropriate restrictions based on project maturity.

# Policies
There are various aspects in kubernetes which should be taken care of, following are policies which have a higher priority and should be enforced on a cluster

## Container Security
- [x] Trusted Repositories
- [ ] Run as Non-Root
- [x] Diasllow Privilege Escalation
- [ ] Container Limits and Requests must be defined

## Configuration Override
- [ ] Enforce ingress uniqueness
- [ ] Enforce service selector uniqueness
