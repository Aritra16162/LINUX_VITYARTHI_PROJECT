# oss-audit-24BHI10017-Aritra-Dasgupta
The Open Source Audit
#  Open Source Software Audit: LibreOffice Suite Analysis
**University:** VIT Bhopal University  
**Student:** Aritra Dasgupta | **Registration:** 24BHI10017  
**Course:** Open Source Software

---

##  Project Overview
This repository contains a comprehensive system audit conducted within a Linux-emulated environment (Git Bash/Ubuntu). The goal is to demonstrate shell scripting proficiency by automating system identification, package management checks, directory security auditing, and log analysis.

###  Software Choice: LibreOffice
For this audit, **LibreOffice** was selected as the target FOSS application. 
* **License:** Mozilla Public License (MPL) 2.0.
* **Significance:** As a powerful alternative to proprietary office suites, LibreOffice embodies the FOSS spirit of community-driven development and open standards (ODF).

---

##  Repository Structure
The project is divided into five modular Bash scripts, each handling a specific layer of the audit:

| File Name | Module Name | Technical Function |
| :--- | :--- | :--- |
| `01_system_identity.sh` | **System Identity** | Captures kernel, architecture, and host metadata using `uname` and `hostname`. |
| `02_package_inspector.sh` | **Package Audit** | Validates the presence of `soffice` binary and extracts version metadata. |
| `03_disk_auditor.sh` | **Storage Auditor** | Inspects permissions (Octal/Symbolic) and disk space usage of install paths. |
| `04_log_analyzer.sh` | **Log Analytics** | Searches system logs for specific keywords with a 3-attempt retry loop. |
| `05_manifesto_generator.sh`| **Manifesto Gen** | Interactive script that generates a signed `.txt` philosophy file. |

---

##  Technical Implementation

### Logic & Features:
* **Conditional Logic:** Uses `if/else` and `case` statements to handle different system states (e.g., checking if LibreOffice is installed vs. not found).
* **Looping Mechanisms:** Script 4 features a `while` loop with a `sleep` timer to retry file reading, ensuring data integrity.
* **Stream Editing:** Utilizes `awk`, `grep`, `cut`, and `tail` to parse system output into human-readable reports.
* **Dynamic IO:** Uses `read -p` for user interaction and `>>` redirection for persistent file generation.

---

##  Installation & Usage

### 1. Prerequisites
- A Unix-like terminal (Linux, macOS, or Git Bash on Windows).
- Git installed and configured.
