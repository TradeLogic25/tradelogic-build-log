# TradeLogic Build Log — 2025-08-31

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

---
_Session logged at: 

### Highlights
- 

### Decisions / Risks
- 

### Next
- 

---
_Session logged at: 

### Highlights
- 

### Decisions / Risks
- 

### Next
- 

---
_Session logged at: 2025-08-31 14:18 EDT_

### Highlights
- 

### Decisions / Risks
- 

### Next
- 

---
_Session logged at: 2025-08-31 14:34 EDT_

### Highlights
- 

### Decisions / Risks
- 

### Next
- 

---
_Session logged at: 

### Highlights
-

### Decisions / Risks
-

### Next
-

---
_Session logged at: 

### Highlights
-

### Decisions / Risks
-

### Next
-
## Highlights
- Investigated **en-CA not supported** banner in Power Apps.
- Checked Admin Center language list; **en-CA** not exposed; base language is **en-US (1033)**.
- Confirmed `SetLanguage()` isn’t a canvas function; chose UI workaround instead.
- Landed on stable Items pattern to avoid locale lookup:
  - `AddColumns(Choices([@Deals].tdlogic_projecttype), "DisplayName", Value)`
- Renamed control to **cmbDealProjectType** and aligned prefixes.

## Decisions / Risks
- **Decision:** Standardize on **en-US** as environment base; don’t chase en-CA pack.
- **Decision:** Add display column via `AddColumns` (keep original `Value`).
- **Risk:** Old control/binding can linger; may need to delete/reinsert ComboBox.

## Next
- Reinsert ComboBox cleanly.
- **Items** = `AddColumns(Choices([@Deals].tdlogic_projecttype), "DisplayName", Value)`
- **DisplayFields/SearchFields** = `["DisplayName"]`; **DefaultSelectedItems** = `Parent.Default`.
- Card **Update** = `cmbDealProjectType.Selected`.
- Ensure right-pane **Data source (Items)** is **blank**; test New/Edit saves.
