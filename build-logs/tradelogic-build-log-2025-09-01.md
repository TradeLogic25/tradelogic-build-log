# TradeLogic Build Log — 2025-09-01

## Highlights
-

## Decisions / Risks
-

## Next
-

---
_Session logged at: 

### Highlights
-

### Decisions / Risks
-

### Next
-
# TradeLogic Build Log — 2025-09-01

## Summary
Wired up groundwork for **Project Type** (Dataverse choice `tdlogic_projecttype`) on the Deal form. Hit Items errors due to a dirty control/binding. Documented env reality (Dev = en-US base) and codified the display pattern that bypasses locale issues.

## Highlights
- Confirmed app + tables live in **Mark Smith’s Environment (Dev)**; **TradeLogic (default)** has **no Dataverse**.
- Language banner explained: env base is **en-US (1033)**; **en-CA** not available. Functionally harmless.
- Settled on ComboBox pattern that keeps the Dataverse **choice record** shape:
  - `AddColumns(Choices(Deals.tdlogic_projecttype), "DisplayName", Value)`
- Standardized naming: **cmbDealProjectType** (ComboBox), **dcDealProjectType** (DataCard).
- Git: added README notes, daily log workflow, and backfilled logs.

## Decisions
- **Use en-US base**; do not chase en-CA pack. UI uses DisplayName to avoid localization lookups.
- **Never** `RenameColumns("Value","DisplayName")` on choice tables (breaks record shape).
- Card **Update** must pass the **record**: `cmbDealProjectType.Selected` (not `.Selected.Value`).

## Issues / Risks
- Current control likely corrupted by previous bindings/right-pane auto “Data source (Items)”. Items shows red X.
- Default environment has no Dataverse—don’t build core there.

## Next (first 5 moves)
- [ ] Delete current control; insert **Combo box** → rename **cmbDealProjectType**.
- [ ] **Items** = `AddColumns(Choices(Deals.tdlogic_projecttype), "DisplayName", Value)`
- [ ] **DisplayFields/SearchFields** = `["DisplayName"]`; **SelectMultiple** = false; **DefaultSelectedItems** = `Parent.Default`
- [ ] Card **DataField** = `"tdlogic_projecttype"`; **Update** = `cmbDealProjectType.Selected`
- [ ] Ensure right-pane **Data source (Items)** is **blank**; test **New/Edit** save

## Links / docs
- README.md → Build Log Workflow + env/locale notes
- (Planned) `/docs/environments.md` and `/docs/powerapps/powerfx-patterns.md` to formalize env map + patterns
