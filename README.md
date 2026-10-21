# Signal Ledger — A Tiny Trust Layer for Product Analytics

**A small, portfolio-ready dbt project that makes product metrics explainable, testable, and safer to use in AI-assisted analysis.**

Signal Ledger is a fictional product-analytics project built on synthetic data. It demonstrates how an analytics engineer can turn raw app events into documented metrics with explicit definitions, data tests, and a simple metric contract.

> This is an original portfolio exercise, not a claim that no similar project exists. The sample data is synthetic and does not represent any real company or users.

## The problem

Teams often use the same words—*active user*, *activation*, *engagement*—while calculating them differently. That creates a trust problem for dashboards and for AI assistants answering business questions.

Signal Ledger makes the definitions visible in the project itself:
- **Daily active users (DAU):** distinct users with at least one qualifying `app_open` or `content_view` event on a calendar date.
- **Activation rate:** percentage of newly registered users who perform at least one `profile_complete` event within 7 days of registration.
- **Meaningful actions per active user:** qualifying `message_sent`, `content_view`, and `reaction_added` events divided by DAU.

These are example definitions for this fictional product—not universal industry standards.

## What it demonstrates

- Source → staging → intermediate → mart modeling
- dbt schema tests (`not_null`, `unique`, `accepted_values`, relationships)
- A singular SQL test for metric invariants
- Column and model documentation
- A human-readable metric contract with grain, definition, filters, owner, and caveats
- A final mart designed to answer questions consistently

## Project structure

```text
models/
  staging/       Clean and standardize raw inputs
  intermediate/  Apply business rules at a reusable grain
  marts/         Publish trusted analytics tables
  schema.yml     Model/column docs and generic tests
  metric_contracts.yml
seeds/           Small, synthetic source datasets
tests/           Custom SQL assertions
```

## Run it locally

Requires Python 3.10+.

```bash
python -m venv .venv
source .venv/bin/activate        # Windows: .venv\Scripts\activate
pip install -r requirements.txt
dbt deps
dbt seed
dbt build
```

The project uses DuckDB, so no cloud warehouse is required. If your dbt version asks for a profile, the included `profiles.yml` is intended for local development; copy it to `~/.dbt/profiles.yml` if needed.

Useful commands:

```bash
dbt docs generate
dbt docs serve
dbt test --select tag:metric_quality
```

## Example questions the mart can answer

- How many daily active users did we have?
- Did activation improve by signup cohort?
- How many meaningful actions did each active user perform?
- Are we comparing the same metric definition across dates?

## Metric contract: why it matters

`models/metric_contracts.yml` is deliberately plain-language and reviewable. It documents the metric's purpose, grain, calculation, exclusions, owner, and caveats. It is not a claim that a full dbt Semantic Layer has been configured. It is a lightweight contract that can later be translated into a formal semantic layer or consumed by an internal analytics assistant.

## Design choices and limitations

- Synthetic data is intentionally small enough to inspect.
- Dates are UTC timestamps; daily metrics use the UTC date.
- The activation model uses a 7-day window after registration.
- The project is a learning/demo artifact, not a production-ready analytics platform.
- No personal data, external APIs, AI model, or real company data is used.

## Suggested next iteration

1. Add a second activation definition and show how the answer changes.
2. Add a `metric_definition_version` field to track definition changes over time.
3. Add CI with `dbt build` on pull requests.
4. Add a small Streamlit page that displays the metrics and links each number to its definition and tests.
