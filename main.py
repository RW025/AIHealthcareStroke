# Riley Whalen
# Self Learning Project
# AI in Healthcare


import pandas as pd


demographic = pd.read_csv('SelfLearningData/patientDem&Adm.csv')
medHistory = pd.read_csv('SelfLearningData/medicalhistory.csv')
vitals = pd.read_csv('SelfLearningData/vitals.csv')
labs = pd.read_csv('SelfLearningData/labs.csv')


df = demographic.merge(medHistory, on="SUBJECT_ID", how="left")
df = df.merge(vitals, on="SUBJECT_ID", how="left")
df = df.merge(labs, on="SUBJECT_ID", how="left")


df.to_csv("strokePredictionData3.csv", index=False)


