package apiv3.api;

import java.io.IOException;

import org.json.JSONException;

import com.ibm.watson.developer_cloud.natural_language_understanding.v1.NaturalLanguageUnderstanding;
import com.ibm.watson.developer_cloud.natural_language_understanding.v1.model.AnalysisResults;
import com.ibm.watson.developer_cloud.natural_language_understanding.v1.model.AnalyzeOptions;
import com.ibm.watson.developer_cloud.natural_language_understanding.v1.model.Features;
import com.ibm.watson.developer_cloud.natural_language_understanding.v1.model.SentimentOptions;

import api.exception.DateInvalidException;
import api.exception.NewsResponseException;


public class test {

	public static void main(String[] args) throws IOException, JSONException, NewsResponseException, DateInvalidException {
		// TODO Auto-generated method stub
//		String[] ins = new String[0];
//		//ins[0] = "RIC_BHP.AX";
//		//ins[1] = "RIC_BLT.L";
//		String[] tp = new String[0];
//		//tp[0] = "AMERS";
//		//tp[1] = "COM";
//		String st = "2015-10-01T00:00:00Z";
//		String et = "2015-10-20T00:00:00Z";
//		System.out.println(System.currentTimeMillis());
		NaturalLanguageUnderstanding service = new NaturalLanguageUnderstanding(
				  NaturalLanguageUnderstanding.VERSION_DATE_2017_02_27,
				  "7de96747-ddf7-4ade-a24d-a082d7d3b810",
				  "XN3OAoAR37wn"
				);
		
		String text = "";
				SentimentOptions sentiment = new SentimentOptions.Builder()
						  .build();

						Features features = new Features.Builder()
						  .sentiment(sentiment)
						  .build();

						AnalyzeOptions parameters = new AnalyzeOptions.Builder()
						  .text(text)
						  .features(features)
						  .build();

						AnalysisResults response = service
						  .analyze(parameters)
						  .execute();
						System.out.println(response.getSentiment());
				
				
			

	
		
	}

}
