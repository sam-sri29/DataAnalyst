import pandas as pd
import numpy as np

# 1. Dataset
data = {
    'ID ': [101, 102, 103, 104, 104, 105, 106, 107, 108, None],
    ' Name': ['Alice', 'Bob', 'Charlie', 'David', 'David', 'Eva', 'Frank', 'Grace', np.nan, 'Ivy'],
    'Gender': ['F', 'Male', 'M', 'male', 'male', 'Female', 'M', np.nan, 'FEMALE', 'f'],
    'Age ': ['25', 30, 35, 40, 40, 'Thirty', 50, 55, 60, 65],
    'Country ': ['USA', 'usa', 'India', 'UK', 'UK', 'India', 'UK', 'India', 'usa', 'INDIA'],
    'Date of Birth': ['01/01/1998', '1993-02-14', '03-04-1988', '1983/05/06', '1983/05/06', '07.07.1990', '12-12-1975', '15-03-1970', '02-02-1985', '29-02-1992']
}

df = pd.DataFrame(data)

# 2. Dropping missing values and duplicates
df.dropna(inplace=True)
df.drop_duplicates(inplace=True)

# 3. Clean categorical text
df['Gender'] = df['Gender'].str.strip().str.upper().replace({
    'MALE': 'M', 'FEMALE': 'F', 'F': 'F', 'M': 'M'
})
df['Country '] = df['Country '].str.strip().str.upper()

# 4. Format date
# Standardize common delimiters
df['Date of Birth'] = df['Date of Birth'].str.replace(r'[./]', '-', regex=True)

# Then parse the dates
df['Date of Birth'] = pd.to_datetime(df['Date of Birth'], errors='coerce', dayfirst=True)


# 5. Rename columns
df.columns = df.columns.str.strip().str.lower().str.replace(' ', '_')

# 6. Fix data types
df['age'] = pd.to_numeric(df['age'], errors='coerce')

# 7. Show final result
print(df)