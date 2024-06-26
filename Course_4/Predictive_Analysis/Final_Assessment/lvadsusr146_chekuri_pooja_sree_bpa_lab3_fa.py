# -*- coding: utf-8 -*-
"""lvadsusr146_Chekuri_Pooja_Sree_BPA_Lab3_FA.ipynb

Automatically generated by Colab.

Original file is located at
    https://colab.research.google.com/drive/1G6kj0u_AttrGYqeSWS-aK7jM3bFdl337

Lab 3 Clusterring
"""

import numpy as np
import pandas as pd
import seaborn as sns
import matplotlib.pyplot as plt

data=pd.read_csv('/content/customer_segmentation.csv')
df=pd.DataFrame(data)

df.head()

df.info()

df.describe()

df.isnull().sum()

df['Income']=df['Income'].fillna(df['Income'].mean())

df.isnull().sum()

df.duplicated().sum()

df.shape

"""Univariate Analysis"""

for i in df.select_dtypes(include=['int64','float64']).columns:
  plt.figure(figsize=(10,5))
  sns.histplot(df[i])
  plt.title(f'Hisogram of {i}')
  plt.xlabel(i)
  plt.show()

for i in df.select_dtypes(include='object').columns:
  plt.figure(figsize=(10,5))
  df[i].value_counts().nlargest(5).plot(kind='bar')
  plt.title(f'Bar chart of {i}')
  plt.xlabel(i)
  plt.ylabel('Count')
  plt.show()

"""Handling outliers"""

for i in df.select_dtypes(include=['int64','float64']).columns:
  plt.figure(figsize=(10,5))
  sns.boxplot(df[i])
  plt.title(f'boxplot of {i}')
  plt.xlabel(i)
  plt.show()

for i in df.select_dtypes(include=['int64','float64']).columns:
  q1=df[i].quantile(0.25)
  q3=df[i].quantile(0.75)
  iqr=q1-q3
  l=q1-1.5*iqr
  u=q3+1.5*iqr
  df[i]=df[i].clip(lower=l,upper=u)
  sns.boxplot(df[i])
  plt.show()

"""Bivariate Analysis"""

numerical=df.select_dtypes(include=['int64']).columns
num=['Year_Birth','Recency','MntFruits','MntMeatProducts','MntSweetProducts','NumDealsPurchases','NumWebPurchases','NumCatalogPurchases','NumWebVisitsMonth']
correlation_matrix=df[num].corr()
print(correlation_matrix)

sns.heatmap(correlation_matrix,annot=True,fmt='.2f',cmap='coolwarm')

x=df[num]
x.head()

from sklearn.preprocessing import StandardScaler, MinMaxScaler
scaler=StandardScaler()
x_scaled=pd.DataFrame(scaler.fit_transform(x),columns=x.columns)

#elbow method
import warnings
warnings.filterwarnings('ignore')
from sklearn.cluster import KMeans
from sklearn.metrics import silhouette_score
sse=[]
sil_score=[]
k_rng=range(1,10)
for i in k_rng:
  km=KMeans(n_clusters=i,init='k-means++')
  km.fit(x_scaled)
  sse.append(km.inertia_)
plt.figure(figsize=(10,5))
plt.plot(k_rng,sse)
plt.title('Elbow Method')

#optimal number of cluster is 3
km=KMeans(n_clusters=3,random_state=42)
y_predict=km.fit_predict(x_scaled)
x_scaled['cluster']=y_predict
plt.figure(figsize=(10,10))
sns.scatterplot(x='Recency',y='NumWebVisitsMonth',hue='cluster',data=x_scaled)
sns.scatterplot(x=km.cluster_centers_[:,0],y=km.cluster_centers_[:,1],marker='*',color='purple')
plt.show()

