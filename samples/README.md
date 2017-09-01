The sample application uses two Watson services:
- **Visual Recognition** : It detects the human faces in the image and determines their name, gender, maximum and minimum age.
- **Text to Speech**: It converts the given text to audio. You also have the option to download the audio file.

We need to first create instances of these services so that the application can use it. Following are the steps to create instances of these services.

1. Login to your bluemix account <br/>`bx login`.
2. Create a instance of the **Visual Recognition** service<br/> `bx service create watson_vision_combined free <instance_name>`.
3. Create credential key for the **Visual Recognition** service <br/>`bx service key-create <instance_name> <credential_name>`.
4. Run the following command to view the credential for the **Visual Recognition** service <br/>` bx service key-show <instance_name> <credential_name>`
and look for an "api_key" in the returned JSON and note down its value (we will require it later).
5. Similary follow the commands to create a instance of **Text to Speech** service <br/>
`bx service create text_to_speech standard <instance_name>`<br/>
`bx service key-create <instance_name> <credential_name>`.<br/>
`bx service key-show <instance_name> <credential_name>`<br/>
In the returned json look for the "username" and "password" values and note them down as well.

Alternatively, services can also be created by logging into your bluemix account using your browser.

1. Log in to https://console.bluemix.net/ with your credentials.
2. Click on the List icon at the top left corner and select "Watson".
3. Click on "Create Watson Service" on the right side of your screen.
4. Select **Visual Recognition** from the list of various services provided.
5. Check the details that are auto filled in, you may or may not want to make any changes to these. Click on "Create".
6. The service should now show up on your Dashboard. Go to the list icon again and select "Dashboard" for the view.
7. Click on the newly created service on your Dashboard. On the left side, you should see a tab named "Service Credentials". Click on it.
8. You should now have a view which gives you the key name of your service, the date of creation as well as Actions. Under Actions theres a
"View Credentials" option with a downward arrow. Click on it.
9. A view opens up with the json containing the credentials for your service.
10. Look for "api_key" and note down the value.
11. Follow the same steps to create a **Text to Speech** service. Select **Text to Speech** in Step 4 instead of "Visual Recognition".
 Also note down the "username" and "password" in the json you get in Step 9 instead of the "api_key"

