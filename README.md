# Python + SQL Analysis Pipeline

An end-to-end data analysis project combining **Python, Pandas, Matplotlib, and SQL** to clean, explore, transform, and analyze a CSV dataset.

## 🔄 Workflow

**CSV → Python Cleaning → EDA → Outlier Analysis → Clean CSV → SQL Database → SQL Analysis → Insights**

### Python

* Loads the dataset using portable paths with `os.path.abspath()` and `os.path.join()`
* Cleans the data and removes duplicate records
* Performs Exploratory Data Analysis (EDA)
* Identifies and investigates outliers
* Uses Matplotlib scatter plots for visual analysis
* Removes relevant outliers to reduce distortion in subsequent analysis
* Exports the cleaned dataset for SQL processing

### SQL

* Creates separate relational tables for structured analysis
* Loads the cleaned CSV into a temporary/staging table
* Inserts the data into the appropriate SQL tables
* Performs analytical queries to investigate patterns, relationships, trends, and other meaningful questions
* Uses the results to derive practical, data-driven insights

## 🛠️ Technologies

* **Python**
* **Pandas**
* **Matplotlib**
* **SQL**
* **Git/GitHub**

## 📦 Dependencies

```txt
pandas
matplotlib
```

Install with:

```bash
pip install pandas matplotlib
```

> `os` is part of Python's standard library and requires no installation.

## 🎯 Skills Demonstrated

**Data Cleaning • EDA • Data Visualization • Outlier Analysis • CSV Processing • SQL Database Design • Data Loading • SQL Analysis • Analytical Problem Solving • Data-Driven Insights**
