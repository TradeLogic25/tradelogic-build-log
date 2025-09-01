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
/docs
  /environments.md
  /alm-pipeline.md
  /runbooks/deploy.md
  /dataverse/schema.md
  /powerapps/naming-conventions.md
  /powerapps/powerfx-patterns.md
  /decisions/ADR-0001-base-language-en-us.md
  /decisions/ADR-0002-env-topology.md
# Environments

| Name                                      | Type      | Region   | Dataverse | Base Language | URL    |
| ----------------------------------------- | --------- | -------- | --------- | ------------- | ------ |
| TradeLogic (default)                      | Default   | <region> | No        | —             | <link> |
| Mark Smith’s Environment (TradeLogic-Dev) | Developer | <region> | Yes       | en-US (1033)  | <link> |

Notes:
- App + tables currently live in **Mark Smith’s Environment**.
- en-CA not available; standardize on **en-US**. UI uses `AddColumns(..., "DisplayName", Value)` to avoid locale warnings.
# Power Fx Patterns

## Dataverse Choice (single) in ComboBox
- Items:
  AddColumns(Choices(Deals.tdlogic_projecttype), "DisplayName", Value)
- DisplayFields/SearchFields: ["DisplayName"]
- DefaultSelectedItems: Parent.Default
- Card.Update: cmbDealProjectType.Selected
- Never RenameColumns "Value" -> breaks choice record shape.
# ADR-0001: Base language is en-US
Status: Accepted
Decision: Use en-US as environment base language; do not chase en-CA pack. UI patterns bypass localization issues.
# Deploy Runbook (Dev -> Prod)
1. Build in Dev inside a Solution (TradeLogic Core).
2. Export as Managed.
3. Import to Prod.
4. Rebind connection references & env variables.
5. Smoke test: forms (Deals), choice columns, save paths.
## Summary
- Wire `tdlogic_projecttype` in Deal form using a ComboBox; current Items error due to stale control/binding.

## What we did today
- Created ComboBox control inside `dcDealProjectType`.
- Settled on Items pattern:
  `AddColumns(Choices(Deals.tdlogic_projecttype), "DisplayName", Value)`
- Noted DO NOT: `RenameColumns("Value", "DisplayName")` (breaks choice record shape).
- Investigated en-CA warning; base env language is en-US (1033). UI pattern avoids localization.

## Next session tasks
- Delete/reinsert ComboBox → rename `cmbDealProjectType`.
- Items = `AddColumns(Choices(Deals.tdlogic_projecttype), "DisplayName", Value)`
- DisplayFields/SearchFields = ["DisplayName"]; SelectMultiple = false.
- DefaultSelectedItems = Parent.Default.
- Card.Update = `cmbDealProjectType.Selected`.
- Ensure right-pane “Data source (Items)” is **blank**.
- Test New/Edit save paths.

## Links
- docs/environments.md
- docs/powerapps/powerfx-patterns.md (Choice pattern)
- README.md (build workflow)






