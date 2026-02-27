# Cybersecurity Network Sweep Lab

---

## :padlock: Lab Title
**Network Device Sweep & Intrusion Detection** - SecureNet Corp

---

## :dart: Objective
Develop a secure network sweep lab to detect unauthorized devices following a BYOD (Bring Your Own Device) Policy breach. The solution includes:
- Restricted access control via Linux security groups
- Automated ping sweep functionality
- Secure logging of network inventory

## :hammer_and_wrench: Tools Used
- **Operating System:** Kali Linux
- **Shell:** Bash scripting
- **Networking:** ICMP/ping utilities
- **Access Control:** Linux Groups & File Permissions (chmod/chown)

---

## :clipboard: Step-by-Step Process

### Phase 1: Security Group Configuration
1. Create a dedicated group for authorized personnel: `security`.
2. Add three users to the group: `alice_sec`, `bob_sec`, `carol_sec`.
3. Verify group and user membership using `getent group security`

[!Group Verification](screenshots/group_verification.png)

### Phase 2: Script Development
1. Create the network sweep script `testsweep.sh` under `/home/shared/security`.
2. Implement a subnet-based ping sweep (e.g., hosts  1-254).
3. Include error handling and usage instructions within the script.
4. Configure logging with timestamps to `sweep_results.txt`.

[!Script Execution](screenshots/execution.png)

### Phase 3: Access Control
1. Set group ownership of the script to `security`.
2. Apply secure permissions (750) to restrict execution to group members.
3. Verify that non-members cannot execute the script

[!Permissions creation](screenshots/permissions.png)

### Phase $: Testing & Validation
1. Execute the sweep on a test subnet: `./testsweep.sh 10.0.2`.
2. Confirm detection of active hosts.
3. Ensure log file `sweep_results.txt` is generated and populated correctly.

[!Script Testing](screenshots/results.png)


