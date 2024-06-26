# -*- coding: utf-8 -*-
"""lvadsusr146_Chekuri_Pooja_Sree_Regression.ipynb

Automatically generated by Colab.

Original file is located at
    https://colab.research.google.com/drive/1LS1LK0jyQjg8WnTzHUUOG2M6WlcWi8Z8
"""

import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns

data=pd.read_csv('https://raw.githubusercontent.com/Deepsphere-AI/LVA-Batch5-Assessment/main/bengaluru_house_prices.csv')
df=pd.DataFrame(data)

df.head()

df.info()

df.describe()

df.isnull().sum()

df.nunique()

df.duplicated().sum()

df=df.drop_duplicates()

df.isnull().sum()

df['balcony']=df['balcony'].fillna(df['balcony'].mode()[0])

df['bath']=df['bath'].fillna(df['bath'].mean())

df['size']=df['size'].fillna(df['size'].mode()[0])

df['society']=df['society'].fillna(df['society'].mode()[0])

df=df.dropna()

df.isnull().sum()

df['size']=df['size'].str.split(" ")

for i in df.select_dtypes(include=['int64','float64']).columns:
  plt.figure(figsize=(10,5))
  plt.hist(df[i])
  plt.title(f'Histogram of {i}')
  plt.show()

for i in df.select_dtypes(include=['int64','float64']).columns:
  plt.figure(figsize=(10,5))
  plt.boxplot(df[i])
  plt.title(f'Boxplot of {i}')
  plt.show()

for i in df.select_dtypes(include=['int64','float64']).columns:
  q1=df[i].quantile(0.25)
  q3=df[i].quantile(0.75)
  iqr=q3-q1
  l=q1-1.5*iqr
  u=q3+1.5*iqr
  df[i]=df[i].clip(lower=l,upper=u)
  sns.boxplot(df[i])
  plt.show()

numerical=df.select_dtypes(include=['int64','float64']).columns
correlation=df[numerical].corr()

sns.heatmap(correlation,annot=True)

df.columns

df=df.drop('size',axis=1)
y=df['price']

x=df[['area_type', 'availability', 'location', 'society',
       'total_sqft', 'bath', 'balcony']]

from sklearn.preprocessing import LabelEncoder
for i in x.select_dtypes(include='object').columns:
  le=LabelEncoder()
  x[i]=le.fit_transform(x[i])

from sklearn.preprocessing import MinMaxScaler,StandardScaler
from sklearn.model_selection import train_test_split
from sklearn.linear_model import LinearRegression
from sklearn.ensemble import RandomForestRegressor

x_train,x_test,y_train,y_test=train_test_split(x,y,test_size=0.20,random_state=42)

lin=LinearRegression()
lin.fit(x_train,y_train)
y_predict=lin.predict(x_test)

from sklearn.metrics import mean_squared_error,r2_score
mse=mean_squared_error(y_predict,y_test)
r2=r2_score(y_predict,y_test)
print(mse)
print(r2)

rand=RandomForestRegressor(n_estimators=100)
rand.fit(x_train,y_train)
y_predict=rand.predict(x_test)

from sklearn.metrics import mean_squared_error,r2_score
mse=mean_squared_error(y_predict,y_test)
r2=r2_score(y_predict,y_test)
print(mse)
print(r2)

