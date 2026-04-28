 How to run

1. Create a virtual environment
2. pip install -r requirements.txt
3. jupyter notebook
4. Run notebooks in order
______________________________________________________________________________________________________________________________________
Multi-Level Early Warning System for Lethal State Repression
PROJECT OVERVIEW

This project builds an event-level early warning system to assess the risk of lethal state repression during political protest events.

The system combines historical regime behavior, protest characteristics, and event-level indicators to produce risk probabilities and convert them into actionable alert levels.

The goal is not only prediction, but operational risk monitoring.

DATA AND PREPROCESSING

Data sources include protest event datasets, country-level repression history, and violence indicators.

Main steps:

Focus on protests with political demands
Define lethal_event = 1 when RSI >= 5
Engineer protest size categories from textual participation reports
Compute protest duration and log-duration
Include country fixed effects
LATENT REGIME MODEL

A latent regime clustering model with K = 4 was constructed to capture long-run patterns of state repression in response to political protests.

Outputs:

latent_regime
regime_label
For non-political demands, these values are intentionally missing (NaN).

The latent regime serves as a structural memory of state behavior.

PREDICTIVE MODEL

The final model is a logistic regression with class balancing.

Target:

lethal_event
Key predictors:

latent_regime
protest size category
protester violence
protest duration
country indicators
Performance:

ROC-AUC: 0.87
Recall (lethal events): 0.78
The model separates high-risk from low-risk events effectively.

MULTI-LEVEL ALERT SYSTEM

Instead of using a single probability threshold, a four-level alert system was designed.

Alert levels:

HIGH : probability >= 0.70
MEDIUM : 0.40 <= probability < 0.70
LOW : 0.20 <= probability < 0.40
NONE : probability < 0.20
Test set results:

HIGH - 431 events, 32.9% lethal

MEDIUM - 447 events, 10.7% lethal

LOW - 543 events, 4.8% lethal

NONE - 1207 events, 0.4% lethal

HIGH and MEDIUM alerts capture the majority of lethal events, while NONE alerts are almost always safe.

MODEL LIMITATIONS

Over-warning in MEDIUM and LOW levels
No access to real-time political decisions or shocks
Lethal repression is a rare and unpredictable outcome
Structural models cannot fully capture sudden elite choices
FUTURE IMPROVEMENTS

Temporal and sequence-based models
Online updating with recent protest trajectories
Actor-level security force data
Integration of real-time media and policy signals
CONCLUSION

This project delivers a decision-ready early warning system for monitoring the risk of lethal repression during political protests.

While uncertainty remains unavoidable, the alert framework provides clear and interpretable risk signals for practical use.
______________________________________________________________________________________________________________________________________
