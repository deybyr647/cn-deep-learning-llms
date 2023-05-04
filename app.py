# Bring in deps
import os

import streamlit as st
from langchain.llms import OpenAI
from langchain.prompts import PromptTemplate
from langchain.chains import LLMChain, SequentialChain
from langchain.memory import ConversationBufferMemory

apikey = "your-api-key-here"
os.environ['OPENAI_API_KEY'] = apikey

# App framework
st.title("🐍 🔗 Python Assistant")
prompt = st.text_input("Enter a Python topic here...")

# Prompt templates
explanation_template = PromptTemplate(
    input_variables = ["topic"],
    template = "Explain {topic} in Python in simple terms"
)

# Memory
explanation_memory = ConversationBufferMemory(input_key="topic", memory_key="explanation_history")

# Llms
llm = OpenAI(temperature=0.9)

# Chains
explanation_chain = LLMChain(llm=llm, prompt=explanation_template, verbose=True, output_key="topic", memory=explanation_memory)

# Show stuff to the screen if there's a prompt
if prompt:
    explanation = explanation_chain.run(prompt)

    st.write(explanation)
    
    with st.expander('Explanation History'):
        st.info(explanation_memory.buffer)
        
