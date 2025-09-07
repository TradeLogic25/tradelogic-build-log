# TradeLogic Build Log — 2025-08-30
_Created at: 2025-08-31 14:25 EDT (backfilled)_

## Highlights
- 

## Decisions / Risks
- 

## Next
- 

---
_Session logged at: 2025-08-31 14:34 EDT (backfilled)_

### Highlights
- 

### Decisions / Risks
- 

### Next
- 

---
_Session logged at: 2025-08-31 15:05 EDT (backfilled)_

### Highlights
-

### Decisions / Risks
-

### Next
-
## Highlights
- Inventoried the app tree; found **dcDealProjectType** and related controls.
- Confirmed the correct **Choices** syntax for Dataverse choice columns:
  - `Choices([@Deals].tdlogic_projecttype)` (no extra parens/brackets).
- Agreed to use a **ComboBox** for the single-select Project Type (better search + UX).
- Started standardizing control prefixes (e.g., `dc`, `cmb`, `lbl`, `txt`, etc.).

## Decisions / Risks
- **Decision:** Use ComboBox for `tdlogic_projecttype`.
- **Decision:** Avoid `RenameColumns("Value", "DisplayName")` on choice tables (breaks record shape).
- **Risk:** Scattered naming (“dd/ddl”) could cause confusion—will normalize.

## Next
- Wire a ComboBox:
  - **Items** = `Choices([@Deals].tdlogic_projecttype)`
  - **DataCard.Update** = `<combo>.Selected`
  - Verify New/Edit save paths.
