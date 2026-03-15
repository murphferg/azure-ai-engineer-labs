import os
import base64
from urllib.request import urlopen, Request
from dotenv import load_dotenv
from azure.identity import DefaultAzureCredential, get_bearer_token_provider
from azure.ai.projects import AIProjectClient

def main(): 
    os.system('cls' if os.name=='nt' else 'clear')
    load_dotenv()
    
    try: 
        # 1. Initialize the project client
        credential = DefaultAzureCredential()
        project_client = AIProjectClient(
            endpoint=os.getenv("PROJECT_CONNECTION"),
            credential=credential
        )

        # 2. MANUALLY get the token for the AI scope
        # This ensures we have the correct 'audience' for the Foundry Project
        token_provider = get_bearer_token_provider(
            credential, 
            "https://ai.azure.com/.default"
        )

        # 3. Use the standard OpenAI client but point it to the Project's V1 gateway
        # This bypasses the 'CheckAccess' logic in the AzureOpenAI class
        from openai import OpenAI
        client = OpenAI(
            base_url=f"{os.getenv('PROJECT_CONNECTION')}/openai/v1",
            api_key=token_provider() # Get the actual token string
        )

        while True:
            prompt = input("\nAsk a question about the image (or type 'quit' to exit)\n")
            if prompt.lower() == "quit": break
            if not prompt: continue

            print("Getting a response ...\n")

            # Image processing (Standard)
            image_url = "https://github.com/MicrosoftLearning/mslearn-ai-vision/raw/refs/heads/main/Labfiles/gen-ai-vision/orange.jpeg"
            request = Request(image_url, headers={"User-Agent": "Mozilla/5.0"})
            image_data = base64.b64encode(urlopen(request).read()).decode("utf-8")
            data_url = f"data:image/jpeg;base64,{image_data}"

            # 3. Use the standard OpenAI syntax
            response = client.chat.completions.create(
                model=os.getenv("MODEL_DEPLOYMENT"),
                messages=[ 
                    {"role": "system", "content": "You are a grocery store AI assistant."},
                    {"role": "user", "content": [  
                        {"type": "text", "text": prompt},
                        {"type": "image_url", "image_url": {"url": data_url}}
                    ]} 
                ]
            )
            print(response.choices[0].message.content)   

    except Exception as ex:
        print(f"Error: {ex}")

if __name__ == '__main__': 
    main()
