# TradeLogic Build Log

This repository tracks the ongoing build of the **TradeLogic CRM system**.  
It serves as a central hub for:

- 📌 Technical decisions  
- ⚙️ Scripts and automation  
- 📂 Documentation  
- 🚩 Risks and key design choices  

---

## 📘 Build Log Entries
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

---

## Build Log Workflow

We use an automated script (`log-today.sh`) to manage daily build logs.

### Daily Log (today)
```bash
./log-today.sh
./log-today.sh YYYY-MM-DD
# Example: ./log-today.sh 2025-08-30
### Summary
Wire `tdlogic_projecttype` on Deal form using a ComboBox and resolve Items error.

### Current state
- Control exists: `cmbDealProjectType`
- Card: `dcDealProjectType`
- DataField set to `"tdlogic_projecttype"`
- Items still erroring

### To-do
- [ ] Delete + reinsert ComboBox; rename `cmbDealProjectType`
- [ ] Items:
      AddColumns(Choices(Deals.tdlogic_projecttype), "DisplayName", Value)
- [ ] DisplayFields/SearchFields: ["DisplayName"]
- [ ] DefaultSelectedItems: Parent.Default
- [ ] Card.Update: cmbDealProjectType.Selected
- [ ] Ensure right-pane “Data source (Items)” is **blank**
- [ ] Test New/Edit save path
- [ ] If locale banner returns, ignore (base en-US) — UI uses DisplayName column

### Notes
Do **not** RenameColumns "Value" → it breaks the choice record shape.
./log-today.sh "Power Apps: Project Type ComboBox created; Items formula pending. Next: reinsert control, set Items with AddColumns(..., Value), wire Update, test New/Edit."
git add -A && git commit -m "docs(build-log): note Project Type ComboBox work and next steps" && git push






