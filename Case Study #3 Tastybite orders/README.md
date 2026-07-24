# Case Study: TastyBite — Diagnosing an Order Decline in Pune's Chinese Cuisine Segment

##  Business Problem
TastyBite is a food delivery platform operating across 6 Indian cities (Mumbai, Delhi,
Bangalore, Pune, Hyderabad, Chennai) and 5 cuisine categories. The Operations team
noticed total order volume was slightly below projections in late 2024 — not alarming
at a glance, but worth investigating before dismissing it as normal variation.

**The ask**: Determine if there's a real, specific problem hiding in the data, and if
so, find exactly where it is, why it's happening, and what to do about it.

##  Dataset
- 570 monthly records, June 2023 – December 2024
- **Dimensions**: City, Cuisine
- **Metrics**: Orders, Revenue, Avg Order Value, Avg Delivery Time (min), Cancellation
  Rate, Avg Rider Rating

##  Process — Step-by-Step Drill-Down

### Step 1: Total company-wide orders
Looked at total monthly Orders across all cities/cuisines. Trend showed steady growth
with an expected seasonal bump in Oct–Nov. **No obvious problem visible at this level.**

### Step 2: City-level breakdown
Broke Orders down by City. All 6 cities showed a broadly similar growth pattern —
**no single city stood out as a clear outlier.**

### Step 3: Cuisine-level breakdown within each city
Since nothing was visible at the city level, drilled one level deeper — checked each
city's cuisine mix individually rather than stopping at "looks fine." This mattered
because a small, localized problem inside one city can get averaged out and hidden
when only looking at that city's total.

**Found it here**: Within **Pune**, the **Chinese** cuisine segment showed a sharp,
sustained drop starting **September 2024** — orders fell from a stable ~1,700–2,200/month
range down to ~1,030–1,240/month, and stayed there through December 2024. This was
distinct from normal month-to-month fluctuation seen everywhere else in the dataset.

### Step 4: Supporting metrics for the isolated segment (Pune + Chinese)
Examined Avg Delivery Time, Cancellation Rate, and Avg Rider Rating for this specific
segment over time. All three shifted sharply in the same month as the order drop:

| Metric | Aug 2024 | Sep 2024 onward | Change |
|---|---|---|---|
| Orders | 1,936 | ~1,150 | **-41% avg** |
| Avg Delivery Time | 31.9 min | ~53 min | **+66%** |
| Cancellation Rate | 3.1% | ~13–15% | **~4–5x** |
| Avg Rider Rating | 4.67 | ~3.9 | **Notable drop** |

## Root Cause Analysis
The key reasoning question: **is this a city-wide problem, an operations problem, or
a restaurant-supply problem?**

- If it were a city-wide issue (traffic, general rider shortage in Pune), **all
  cuisines in Pune** would be affected — they weren't. Only Chinese cuisine showed
  the pattern.
- Because the problem is isolated to one cuisine within one city, it points to a
  **restaurant-supply issue specific to Chinese restaurants in Pune** — most likely
  one or more key restaurant partners left the platform starting September 2024.

**Causal chain**:
1. Chinese restaurant availability in Pune dropped → customers had fewer nearby
   options → **orders declined**
2. Remaining restaurants likely serve from farther locations → riders had to travel
   longer distances → **delivery time nearly doubled**
3. Slower delivery led to customer frustration → **cancellation rate rose 4–5x** and
   **rider ratings dropped**

This is a supply-side/restaurant-partnerships problem, not a marketing or demand
problem — marketing spend and demand patterns elsewhere in the dataset were unaffected,
and the metrics all point toward fulfillment capacity, not customer interest.

##  Recommendation
Escalate to the **Restaurant Partnerships / Business Development team**, not Marketing
(this isn't a demand-generation problem):

1. **Investigate**: Confirm how many Chinese restaurant partners were active in Pune
   before vs. after September 2024, and why any that left the platform did so
   (payout disputes, exclusivity with a competitor, restaurant closures, poor performance
   ratings on their side, etc.)
2. **Immediate action**: Set a target to onboard 3–5 new Chinese restaurant partners
   in Pune to restore available options and reduce average delivery distance
3. **Monitor**: Track delivery time and cancellation rate for this segment weekly
   after onboarding new partners, to confirm the fix is working before declaring
   it resolved

##  Key Takeaway
The most important lesson from this case: **a segment-level problem can be completely
invisible at higher levels of aggregation.** Total orders looked fine. City-level orders
looked fine. The real issue only became visible after drilling one level further than
"looks okay" — into cuisine within each city. This is the core discipline in diagnostic
analysis: don't stop drilling just because the current level of aggregation looks clean.

##  Tools Used
Excel (PivotTables, Charts, drill-down analysis)

##  Folder Structure
```
Case Study #2 Tastybite orders/
├── README.md
├── data/
│   └── tastybite_orders_case.csv
├── tastybite_analysis.xlsx        ← pivot tables + charts at each drill-down step
└── screenshots/
    ├── city_breakdown.png
    ├── pune_cuisine_breakdown.png
    └── isolated_segment_metrics.png
```
