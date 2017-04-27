
 // (C) Copyright IBM Corporation 2017, 2017

 // Licensed under the Apache License, Version 2.0 (the "License");
 // you may not use this file except in compliance with the License.
 // You may obtain a copy of the License at

 //      http://www.apache.org/licenses/LICENSE-2.0

 // Unless required by applicable law or agreed to in writing, software
 // distributed under the License is distributed on an "AS IS" BASIS,
 // WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 // See the License for the specific language governing permissions and
 // limitations under the License.

package com.ibm.actions;

import java.io.InputStream;

import com.ibm.watson.developer_cloud.text_to_speech.v1.TextToSpeech;
import com.ibm.watson.developer_cloud.text_to_speech.v1.model.AudioFormat;
import com.ibm.watson.developer_cloud.text_to_speech.v1.model.Voice;
import com.ibm.watson.developer_cloud.text_to_speech.v1.util.WaveUtils;

public class TextAction {
	private String text;
	private String TEXTUSERNAME;
	private String TEXTPASSWORD;
	private InputStream audiostream;
	
	public TextAction(){
		TEXTUSERNAME= System.getenv("TEXTUSERNAME");
		TEXTPASSWORD= System.getenv("TEXTPASSWORD");
		
	}

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}
	
	public String execute(){
		TextToSpeech service = new TextToSpeech();
//		service.setUsernameAndPassword("7759c1e2-4ca9-4e1b-9fad-7544188fc645", "8b5qJv6ubIAf");
		System.out.println("text");
		System.out.println(text);
		service.setUsernameAndPassword(TEXTUSERNAME,TEXTPASSWORD);
		try {
			InputStream stream = service.synthesize(text, Voice.EN_ALLISON, AudioFormat.WAV).execute();
			audiostream = WaveUtils.reWriteWaveHeader(stream);
			System.out.println("done");
		} catch (Exception e) {
			e.printStackTrace();
		}

		return "success";
	}

	public InputStream getAudiostream() {
		return audiostream;
	}


}
