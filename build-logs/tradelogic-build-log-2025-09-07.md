# 📌 TradeLogic Build Log — 2025-09-07  

## Breakthroughs  
- ✅ Fixed blank/grey form issue by resetting form context properly.  
- ✅ Added correct `NewForm(frmProject)` call in `OnVisible` for ProjectFormScreen.  
- ✅ Project form now opens in New mode, allows text input, and saves without errors.  
- ✅ Deal form tested successfully — also creates new records cleanly.  

## Decisions / Fixes  
- Removed old GUID-based “Project Name” field → replaced with proper text column.  
- Adjusted **Default** on Project Name input to `Parent.Default`.  
- Set DataCard Default to `Blank()` to avoid record conflicts.  
- Ensured `New Project` button resets form:  

## Next Steps  
- Add confirmation/success notification after Submit.  
- Wire navigation back to Home after record creation.  
- Begin testing lookups (Accounts, Contacts) to confirm save behavior.  
# TradeLogic Build Log – 2025-09-07

## Breakthroughs
- Filter/Search bar structure created (Contacts screen).
- Communication Method dropdown wired up to Dataverse Choice field.
- “All” default option added and tested successfully.
- Validated that search + filter formulas compile cleanly in modern UI.

## Issues / Roadblocks
- TextInput control (txtContactSearch) label overlapping/jumbled.
- Gallery temporarily blanked out when invalid formula applied.
- Inconsistent behavior when mixing `Choices()` + custom “All” records.
- Need to re-verify Contacts reappear after clearing filters.

## Fixes Attempted
- Adjusted `Items` property of dropdown to project out `Value → Label`.
- Set `DefaultSelectedItems` to `{ Label: "All" }`.
- Reorganized formula snippets into docs for Git.

## Next Steps
- Confirm gallery Items formula:
  ```powerfx
  With(
      { q: Trim(Coalesce(txtContactSearch.Text, "")), sel: ddCommMethod.Selected },
      Sort(
          Filter(
              Contacts,
              IsBlank(q) || StartsWith('Contact Name', q) || StartsWith(Email, q),
              IsBlank(sel) || sel.Label = "All" || 'Preferred Communication Method'.Value = sel.Value
          ),
          'Contact Name',
          SortOrder.Ascending
      )
  )
