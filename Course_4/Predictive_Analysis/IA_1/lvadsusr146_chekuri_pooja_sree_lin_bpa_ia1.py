# -*- coding: utf-8 -*-
"""lvadsusr146_Chekuri_Pooja_Sree_lin_BPA_IA1.ipynb

Automatically generated by Colab.

Original file is located at
    https://colab.research.google.com/drive/1AG-_6TwTAZDQ9SVfBmfMilhU6k9WIe5w

1. Linear Regression
"""

import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns

from sklearn.model_selection import train_test_split
from sklearn.preprocessing import MinMaxScaler, LabelEncoder
from sklearn.linear_model import LinearRegression
from sklearn.linear_model import LogisticRegression
from sklearn.metrics import classification_report, confusion_matrix,r2_score,mean_squared_error,accuracy_score,f1_score,precision_score,recall_score
from sklearn.feature_selection import RFE

"""Loading Data"""

data=pd.read_csv('/content/expenses.csv')
df=pd.DataFrame(data)

df.head()

df.info()

df.describe()

"""Missing values"""

df.isnull().sum()

"""handling Missing values"""

bmi_mode=df['bmi'].mode()[0]
df['bmi']=df['bmi'].fillna(bmi_mode)

df.isnull().sum()

"""checking for duplicates"""

df.duplicated().sum()

"""removing duplicates"""

df.drop_duplicates(inplace=True)

df.duplicated().sum()

"""Univariate Analysis"""

for i in df.select_dtypes(include=['int64','float64']).columns:
  plt.figure(figsize=(10,8))
  sns.histplot(df[i])
  plt.title(f'Histogram of {i}')
  plt.xlabel(i)
  plt.show()

for i in df.select_dtypes(include='object').columns:
  plt.figure(figsize=(10,8))
  df[i].value_counts().plot(kind='bar')
  plt.title(f'Bargraph of {i}')
  plt.xlabel(i)
  plt.ylabel('Count')
  plt.show()

"""Finding Outliers"""

for i in df.select_dtypes(include=['int64','float64']).columns:
  plt.figure(figsize=(10,8))
  sns.boxplot(df[i])
  plt.title(f'boxplot of {i}')
  plt.xlabel(i)
  plt.show()

"""Outliers can be resolved using lasso regularization

Bivariate Analysis
"""

numerical_columns=df.select_dtypes(include=['int64','float64']).columns
correlation_matrix=df[numerical_columns].corr()
print("Correlation:")
print(correlation_matrix.to_string())

plt.figure(figsize=(10,5))
sns.heatmap(correlation_matrix,annot=True,fmt='.2f',cmap='coolwarm')
plt.show()

"""there are no numerical columns that are either highly positively correlated or negatively correlated with charges. But childern column doesn't have correlation with charges so we can drop children column

Label Encoding
"""

label_mapping={}
for i in df.select_dtypes(include='object').columns:
  le=LabelEncoder()
  df[i]=le.fit_transform(df[i])
  label_mapping=dict(zip(le.classes_,le.transform(le.classes_)))
for classes,mapping in label_mapping.items():
  print(classes,mapping)

df.head()

X=df.drop('charges',axis=1)
y=df['charges']
X_train,X_test,y_train,y_test=train_test_split(X,y,test_size=0.3,random_state=42)
scaler=MinMaxScaler()
X_train_scaled=scaler.fit_transform(X_train)
X_test_scaled=scaler.transform(X_test)
lin_reg=LinearRegression()
#training
lin_reg.fit(X_train_scaled,y_train)
#predicting
y_predict=lin_reg.predict(X_test_scaled)

#evaluation metrics
mse=mean_squared_error(y_test,y_predict)
print('Mean Squared Error:',mse)
rmse=mean_squared_error(y_test,y_predict,squared=False)
print('Root Mean Squared Error:',rmse)
r2=r2_score(y_test,y_predict)
print("R^2:",r2)