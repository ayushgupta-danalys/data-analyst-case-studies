# Case Study #1: NovaTech Inc. — Employee Salary & Performance Analysis

##  Business Problem
NovaTech Inc.'s HR team exports employee data from an old HRMS system, and the data
has quality issues — some fields appear manually typed with inconsistent formats.
HR wants to know: department-wise salary trends, whether performance rating correlates
with pay, and how reliable the underlying data is — since appraisal decisions depend on it.

##  Dataset
- **Source**: Public GitHub dataset ([eyowhite/Messy-dataset](https://github.com/eyowhite/Messy-dataset)), used for data-cleaning practice
- **Size**: 1,000 employee records, 10 columns
- **Columns**: Name, Age, Salary, Gender, Department, Position, Joining Date, Performance Score, Email, Phone Number

## Data Quality Issues Found
| Issue | Example | Rows Affected |
|---|---|---|
| Text values in numeric `Salary` field | `"SIXTY THOUSAND"`, `" NAN "` | 167 (16.7%) |
| Spelled-out numbers in `Age` field | `"thirty"` (176 occurrences — 2nd most common value!) | 159 (15.9%) |
| 5 mixed date formats in `Joining Date` | `April 5, 2018` / `2020/02/20` / `01/15/2020` / `03-25-2019` / `2019.12.01` | All rows |
| Inconsistent name casing/spacing | `" grace "` vs `"Grace"` | Most rows |
| Placeholder/generic emails | Repeated `email@example.com`, `user@domain.com` | Many rows |
| Missing/`"nan"` string in Phone Number | Literal text `"nan"` instead of blank | Several rows |

##  Cleaning Steps
1. Mapped text salary values to numbers (`"SIXTY THOUSAND"` → 60000), converted `" NAN "` to proper null
2. Mapped spelled-out ages (`"thirty"` → 30)
3. Parsed 5 different date formats into a single standard date column
4. Trimmed whitespace and standardized name casing
5. Flagged placeholder emails separately from unique/real-looking emails
6. Converted literal `"nan"` strings to proper missing values

##  Key Findings
| Question | Finding |
|---|---|
| Highest-paying department | **Sales** (₹61,012 avg) vs lowest **IT** (₹59,756 avg) |
| Average employee age | **~36 years** |
| Performance Score vs Salary | Weak correlation — **B-graded employees earn slightly more on average** (₹60,638) than even A-graded (₹60,220), suggesting performance rating isn't a strong salary driver |
| Gender pay comparison | Minimal gap — Female (₹60,673) > Other (₹60,072) > Male (₹59,949) |
| Position hierarchy check | Follows expected order — **Director highest** (₹60,920) → **Assistant lowest** (₹59,743) |
| Hiring trend by year | 2018: 186 → 2019: 385 → 2020: 429 — **steady YoY growth in hiring** |
| Data reliability | 16.7% of Salary and 15.9% of Age values needed correction before analysis was trustworthy |

*(Add PivotTable / chart screenshots here)*

##  Business Recommendation
- **Sales pays notably higher than IT** despite similar headcount — HR should confirm
  whether this reflects market benchmarking (e.g., commission structure) or an
  unexplained gap worth reviewing.
- **Gender pay differences are minor** (~₹700–900 spread) — a positive sign, but worth
  monitoring as the company scales.
- **2020 saw the highest hiring volume** (429 joins) — worth checking if onboarding/
  training capacity scaled proportionally.
- **Data quality gap**: ~17% of salary records and ~16% of age records required manual
  correction. Recommend adding input validation on numeric HRMS fields to prevent
  free-text entries, since appraisal and pay decisions rely on this data being accurate.

##  Tools Used
Excel (PivotTables, Charts, formulas for text-to-number cleaning)

