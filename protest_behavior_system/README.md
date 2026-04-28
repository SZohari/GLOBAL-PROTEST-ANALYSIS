# Machine Learning Models for Protest Analysis

This directory contains the core machine learning models developed for the protest analysis project. The models are designed to follow a logical narrative: from understanding the drivers of violence to building a predictive early warning system.

---

## Model Breakdown

### 1. Model 1: Predicting Protester Violence (`ViolenceModel.ipynb`)

*   **Objective:** To identify the key factors that lead to protesters engaging in violence. This is the first step in understanding the dynamics of a protest event.
*   **Target Variable:** `ViolenceModel` (Binary: 1 for violence, 0 for non-violence).
*   **Key Features:** This model uses features such as the country, protest subject, initial government response, and the number of participants. It also leverages a "Country/Topic Memory" feature, which captures the historical context of similar protests.
*   **Algorithm(s) Used:** Logistic Regression was used as a baseline, and Random Forest was selected for the final model due to its higher accuracy and ability to handle complex interactions between features.
*   **Key Insight:** The analysis revealed that a repressive initial state response is one of the strongest predictors of subsequent protester violence.

### 2. Model 2: Predicting State Violence (`RepressionModel.ipynb`)

*   **Objective:** To identify the circumstances under which state actors (e.g., police, military) are likely to use violence against protesters.
*   **Target Variable:** `RepressionModel` (Binary: 1 for violence, 0 for non-violence).
*   **Key Features:** In addition to base features, this model uses the output/prediction from Model 1 (`ViolenceModel`) as a critical input feature, testing the hypothesis of a reactive cycle.
*   **Algorithm(s) Used:** Gradient Boosting (XGBoost) was chosen for its high performance and robustness.
*   **Key Insight:** This model confirmed a strong correlation: state violence is significantly more probable when protesters are violent or perceived as a direct threat. It also identified certain "sensitive" protest topics that are more likely to trigger a violent state response regardless of protester actions.

### 3. Model 3: The Early Warning System (EWS) for Deadly Protests (`04_early_warning.ipynb`)

*   **Objective:** This is the final and most critical model. It acts as an Early Warning System (EWS) to predict whether a protest is likely to result in one or more fatalities.
*   **Target Variable:** `fatalities` (Binary: 1 if fatalities >= 1, 0 otherwise).
*   **Key Features:** This model uses only features that would be known at the *onset* of a protest (e.g., location, subject, initial size). It deliberately excludes features related to protester or state violence, as those happen *during* the event. The goal is prediction, not reaction.
*   **Algorithm(s) Used:** A fine-tuned Random Forest classifier was used, balanced to handle the class imbalance (deadly protests are rarer).
*   **Key Insight:** The EWS can predict potentially deadly protests with a reasonable degree of accuracy, making it a valuable proof-of-concept for organizations aiming to monitor and mitigate conflict.

---

## How to Run

1.  **Prerequisites:** Ensure you have the libraries listed in the main project's `requirements.txt` file installed.
2.  **Execution:** Each model is self-contained within its own Jupyter Notebook. You can run them in sequence (`1 -> 2 -> 3`) to follow the analytical story, or run any notebook individually.
3.  **Data:** The notebooks assume that the cleaned dataset is available in the parent directory's `data/` folder as specified in the main project `README`.

---

## File Structure in This Directory

*   `ViolenceModel.ipynb`: Jupyter Notebook for Model 1.
*   `RepressionModel.ipynb`: Jupyter Notebook for Model 2.
*   `04_early_warning.ipynb`: Jupyter Notebook for the final EWS model.
*   `README.md`: This file.
