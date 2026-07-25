# Case Study: FitZone — Membership Decline Investigation
### Distinguishing a Real Problem from a False Alarm

##  Business Problem
FitZone is a gym chain operating across 5 Indian cities (Mumbai, Delhi, Bangalore,
Pune, Hyderabad) with 3 membership tiers (Basic, Premium, Elite) and 2 signup channels
(Online, Walk-in).

Two concerns were raised:
1. The **CFO** noticed a recurring dip in new signups every January and wanted to know
   if it needed action.
2. The **Bangalore regional manager** reported something felt wrong with the Elite
   tier specifically, even though city-wide numbers didn't look alarming.

**The ask**: Investigate both signals and determine which one (if either) represents
a real problem worth acting on — and if real, find the root cause and recommend a fix.

##  Dataset
- 720 monthly records, January 2023 – December 2024
- **Dimensions**: City, Plan (Basic/Premium/Elite), Channel (Online Signup/Walk-in)
- **Metrics**: New_Signups, Churn_Rate, Avg_Satisfaction_Score, Avg_Classes_Attended,
  Active_Trainer_Count

##  Investigation #1: The January Dip (CFO's Concern)

### Process
1. Built a company-wide monthly trend of New_Signups (no filters) — confirmed a visible
   dip every January.
2. Compared the size of the drop in January 2023 vs January 2024 relative to the
   preceding December.
3. Broke the January 2024 drop down by City to check whether it was concentrated in
   one place or spread evenly.
4. Checked whether the metric recovered the following month (February) in both years.

### Findings
| Check | Result |
|---|---|
| Dec 2023 → Jan 2024 drop | **-30.0%** |
| Consistent across cities? | **Yes** — Mumbai -31.8%, Bangalore -31.6%, Delhi -31.0%, Pune -27.7%, Hyderabad -26.2% (all in a tight 26–32% band, no outlier) |
| Consistent across Plans? | Yes — Basic, Premium, and Elite all showed the same pattern |
| Recovered next month? | Yes — February both years returned close to pre-January levels |

### Conclusion: **False Alarm**
This is a genuine seasonal pattern — a well-known "New Year resolution drop-off"
common across the gym industry — not a business problem. It recurs annually at a
consistent magnitude, affects essentially every segment uniformly, and self-corrects
the following month. **No action needed.** Recommended informing the CFO this is
normal and does not require intervention — treating it as a crisis would waste
resources on a non-issue.

##  Investigation #2: Bangalore Elite (Regional Manager's Concern)

### Process
1. City-wide Bangalore numbers looked acceptable at first glance — consistent with
   the manager's difficulty pinpointing the issue.
2. Broke Bangalore's New_Signups down by Plan (Basic/Premium/Elite) — **Elite stood
   out** with a decline that wasn't visible in the city aggregate.
3. Broke Elite down further by Channel (Online Signup vs Walk-in) — isolated the
   issue specifically to **Walk-in**.
4. Examined all supporting metrics for this exact segment (Bangalore + Elite +
   Walk-in) over time.

### Findings — Bangalore + Elite + Walk-in, March 2024 vs. April 2024 onward

| Metric | March 2024 | April 2024 onward (avg) | Change |
|---|---|---|---|
| New_Signups | 77 | ~48 | **-38%** |
| Active_Trainer_Count | 8 | ~4 | **-50%** |
| Avg_Classes_Attended | 6.1 | ~3.9 | **-36%** |
| Avg_Satisfaction_Score | 4.16 | ~3.5 | **-16%** |
| Churn_Rate | 4.0% | ~16% | **~4x** |

All five metrics shifted in the same month — April 2024 — pointing to a single
triggering event rather than gradual drift.

### Root Cause — Causal Chain
```
Active Trainer Count dropped (8 → ~4, ~50% reduction)
        ↓
Fewer classes could be offered (fewer trainers = fewer available class slots)
        ↓
Avg Classes Attended fell (6.1 → ~3.9 per member) — members couldn't attend as much
as before, regardless of their intent to
        ↓
Members felt they weren't getting the value they paid a premium for (Elite tier)
        ↓
Avg Satisfaction Score dropped (4.16 → ~3.5)
        ↓
Two parallel downstream effects:
  (a) Existing members grew frustrated and cancelled → Churn Rate rose 4x
  (b) Word-of-mouth/in-person referrals weakened → New Signups fell ~38%
```

The root cause is a **trainer staffing shortage**, which cascaded into both a
retention problem (churn) and an acquisition problem (fewer new signups) through two
separate downstream paths.

### Conclusion: **Real Problem**
Confirmed, segment-specific, traceable to a clear root cause with a consistent
starting month across five independent metrics.

##  Recommendation

**Escalate to**: HR/Talent Acquisition team + Bangalore Regional Operations Manager
(not Marketing — this is a supply/staffing issue, not a demand-generation issue)

1. **Investigate**: Confirm how many trainers left the Bangalore Elite Walk-in
   segment starting April 2024 and why (resignation, competitor poaching, internal
   transfer, etc.)
2. **Immediate fix**: Hire or reallocate at least 3–4 trainers to restore
   Active_Trainer_Count to 8+, rebuilding class capacity
3. **Retention recovery**: Send a win-back offer (discount or free session) to members
   who churned between April–December 2024, particularly those with high historical
   satisfaction scores prior to the drop
4. **Monitor**: Track Avg_Classes_Attended and Avg_Satisfaction_Score weekly after
   trainer hiring — consider the issue resolved only once both return to pre-April
   2024 levels (6+ classes, 4.2+ satisfaction)

##  Key Takeaway
This case required distinguishing a **real, actionable problem** from a **recurring
seasonal pattern that looked concerning on the surface**. The verification process for
ruling out the January dip (checking consistency across years and segments, and
confirming recovery) is just as important a skill as the drill-down process that found
the real issue in Bangalore. Treating normal seasonality as a crisis — or missing a
real problem hidden inside a healthy-looking aggregate — are both common, costly
mistakes in real analytics work.

##  Tools Used
Excel (PivotTables, Charts, multi-metric trend analysis)

##  Folder Structure
```
case-0X-fitzone-membership-investigation/
├── README.md
├── data/
│   └── fitzone_membership_case.csv
├── fitzone_analysis.xlsx        ← pivot tables + charts for both investigations
└── screenshots/
    ├── jan_dip_yearly_comparison.png
    ├── jan_dip_by_city.png
    ├── bangalore_elite_drilldown.png
    └── isolated_segment_metrics.png
```

---

