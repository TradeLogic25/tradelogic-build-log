# TradeLogic Build Log

This repository tracks the ongoing build of the **TradeLogic CRM system**.  
It serves as a central hub for:

- 📌 Technical decisions  
- ⚙️ Scripts and automation  
- 🗂️ Documentation  
- 🚩 Risks and key design choices  

---

## 📖 Build Log Entries
Each entry should capture **date, highlights, risks/decisions, and next steps**.  
Format example:

### 2025-08-26
- **Highlights**: Connected GitHub via SSH, created initial repo + .gitignore.  
- **Risks/Decisions**: Protect `main` branch via PRs only.  
- **Next Steps**: Begin logging PowerApps Dataverse schema decisions.  

---

## 📂 Repo Structure
## Build Log Index
- [2025-08-26](logs/2025-08-26.md): Repo setup, SSH keys, .gitignore, README, first daily log
## Roadmap

- Add daily log workflow
- Test branch protections
- Expand schema documentation
- Integrate PowerApps schema logs
## Build Log Workflow

We use an automated script (`log-today.sh`) to manage daily build logs.

### Daily Log (today)
```bash
./log-today.sh
### Backfill a Missed Day
```bash
./log-today.sh YYYY-MM-DD
- Example: `./log-today.sh 2025-08-30`
- Creates or updates the log for that date.
- Marks it as **backfilled** with current timestamp.
- Commits and pushes to `main`.

### Notes
- All logs live in `build-logs/`.
- Git auto-commits + pushes after each run.
- Backfilled logs clearly show `_Session logged at: … (backfilled)_`.
- ✅ success message confirms sync completed.

