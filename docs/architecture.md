System Architecture: Decentralized Validator Node
This document outlines the architectural design and system configuration for a high-availability Rocket Pool Smart Node deployment.

Physical Architecture
The node is deployed on dedicated hardware to ensure consistent performance and security isolation.

Host OS: Ubuntu 22.04 LTS (Headless)

Storage: NVMe SSD with LVM (Logical Volume Management) for seamless capacity expansion as blockchain state grows.

Network: Static IP with a secondary failover DNS configuration.

Software Stack & Client Diversity
To promote network health and decentralization, this node utilizes a non-majority client pair managed via Docker containers.

Execution Client: Geth

Consensus Client: Prysm

Management Layer: Rocket Pool Smart Node Stack (Containerized)

Network & Security Hardening
Security is prioritized to protect the validator's signing keys and prevent unauthorized access.

Firewall: UFW (Uncomplicated Firewall) configured with a "deny-by-default" policy, opening only necessary P2P ports (30303/9001).

Access: SSH-key authentication only; password authentication is disabled globally.

Intrusion Prevention: Fail2ban active to monitor and block malicious login attempts.

Monitoring & Observability
Uptime is maintained through a combination of local and remote telemetry.

Local Monitoring: Custom Bash scripts (found in /scripts) track disk health and peer synchronization.

External Monitoring: Integrated with Prometheus and Grafana for real-time visual telemetry of validator performance.
