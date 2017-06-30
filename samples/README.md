The sample application uses two Watson services:
- **Visual Recognition** : It detects the human faces in the image and determine their name, gender, maximum and minimum age.
- **Text to Speech**: It converts the given text into audio, you also have the option to download the audio file.

So we need to first create instances of these services so that the application can use it.The following are the steps to create instances of these services.
1. Login to your bluemix account <br/>`bx login`.
2. Create a instance of the **Visual Recognition** service<br/> `bx service create watson_vision_combined free <instance_name>`.
3. Create credential key for the **Visual Recognition** service <br/>`bx service key-create <instance_name> <credential_name>`.
4. Run the following command to view the credential for the **Visual Recognition** service <br/>` bx service key-show <instance_name> <credential_name>`
and look for “api_key” key in the returned json and note down its value (we will require it latter).
5. Similary follow the commands to create a instance of **Text to Speech** service <br/>
`bx service create text_to_speech standard <instance_name>`<br/>
`bx service key-create <instance_name> <credential_name>`.<br/>
`bx service key-show <instance_name> <credential_name>`<br/>
In the returned json look for “username” and “password” key and note down their corresponding value.
