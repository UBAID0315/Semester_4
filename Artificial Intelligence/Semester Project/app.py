import streamlit as st
import pickle 
import pandas as pd
import numpy as np
import sklearn 
st.title("Real Estate DataScience Application")

st.write(sklearn.__version__)

with st.form(key='my_form'):
    
 with open('model.pkl', 'rb') as file:
    pipe = pickle.load(file)

 with open('X.pkl', 'rb') as f:
    df = pickle.load(f)
    


 
 type = st.selectbox("Select Home Type", ['House', 'Flat'])
 location= st.selectbox("Select Location", sorted(df['location'].unique().tolist()))
 area= float(st.number_input("Enter Area in Marlas"))
 bedrooms = float(st.selectbox("Select Number of Bedrooms", sorted(df['bedrooms'].unique().tolist())))
 bathrooms =float(st.selectbox("Select Number of Bathrooms", sorted(df['bathrooms'].unique().tolist())))
 kitchens= float(st.radio("Select Number of Kitchens", sorted(df['kitchens'].unique().tolist())))
 parking_spaces= float(st.selectbox("Select Number of Parking Spaces", sorted(df['parking_spaces'].unique().tolist())))
 luxury_category= st.selectbox("Select Luxury Category", sorted(df['Luxury_catogory'].unique().tolist()))
 built_in_type= st.selectbox("Select Built In Type", sorted(df['built_in_type'].unique().tolist()))
 
 data = [[type, location, area, bedrooms, bathrooms, kitchens, parking_spaces, luxury_category, built_in_type]]
 columns = ['type', 'location', 'area', 'bedrooms', 'bathrooms', 'kitchens',
       'parking_spaces', 'Luxury_catogory',
       'built_in_type']
 new_df= pd.DataFrame(data, columns=columns)
 
 if st.form_submit_button("Predict"):
   st.write(f"The estimated price of the house is {np.expm1(pipe.predict(new_df))}")


