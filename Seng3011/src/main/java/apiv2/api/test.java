package apiv2.api;

import java.io.IOException;

import org.json.JSONException;

import api.exception.DateInvalidException;
import api.exception.NewsResponseException;


public class test {

	public static void main(String[] args) throws IOException, JSONException, NewsResponseException, DateInvalidException {
		// TODO Auto-generated method stub
		String[] ins = new String[0];
		//ins[0] = "RIC_BHP.AX";
		//ins[1] = "RIC_BLT.L";
		String[] tp = new String[0];
		//tp[0] = "AMERS";
		//tp[1] = "COM";
		String st = "2015-10-01T00:00:00Z";
		String et = "2015-10-20T00:00:00Z";
		System.out.println(System.currentTimeMillis());
	}

}
