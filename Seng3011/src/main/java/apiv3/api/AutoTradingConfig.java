package apiv3.api;

import java.util.HashMap;
import java.util.Map;

import apiv3.Company.CompanyStock;

public enum AutoTradingConfig{
	instance;
	Map<String,CompanyStock>tradingParameter = new HashMap<String,CompanyStock>();


	 private AutoTradingConfig(){
	
		tradingParameter.put("BHP.AX", new CompanyStock(0.4,17,1.6,200));
		
		tradingParameter.put("RIO.AX",new CompanyStock(0.4,20,1.5,200));
		
		tradingParameter.put("AGO.AX",new CompanyStock(0.006,6000,2,1000000000));
		
		tradingParameter.put("BDR.AX",new CompanyStock(0.03,5000,1.6,10000000));
		
		tradingParameter.put("CTX.AX",new CompanyStock(0.7,20,1.6,300));
		
		tradingParameter.put("DMP.AX",new CompanyStock(2.5,30,1.5,300));
		
		tradingParameter.put("EVN.AX",new CompanyStock(0.6,4000,1.5,30000000));
		
		tradingParameter.put("FMG.AX",new CompanyStock(0.7,4000,1.6,30000000));
		
		tradingParameter.put("JBH.AX",new CompanyStock(0.4,20,1.5,5000));
		
		tradingParameter.put("MYR.AX",new CompanyStock(0.075,1000,1.5,50000));
		
		tradingParameter.put("NAB.AX",new CompanyStock(0.7,23,1.7,300));
		
		tradingParameter.put("NCM.AX",new CompanyStock(0.5,20,1.6,500));
		
		tradingParameter.put("NUF.AX",new CompanyStock(0.08,50,1.4,500));
		
		tradingParameter.put("OGC.AX",new CompanyStock(0.07,200,1.4,10000000));
		
		tradingParameter.put("OSH.AX",new CompanyStock(0.07,50,1.5,1000000));
		
		tradingParameter.put("OZL.AX",new CompanyStock(0.09,20,1.5,1000));
		
		tradingParameter.put("RRL.AX",new CompanyStock(0.5,1500,1.4,1000000));
		
		tradingParameter.put("SFG.AX",new CompanyStock(0.003,1000,2,10000000));
		
		tradingParameter.put("SFR.AX",new CompanyStock(0.05,30,1.6,1000));
		
		tradingParameter.put("SMR.AX",new CompanyStock(0.003,1000,1.6,1000000));
		
		tradingParameter.put("STO.AX",new CompanyStock(0.4,20,1.5,1000));
		
		tradingParameter.put("SWM.AX",new CompanyStock(0.01,100,1.5,100000));
		
		tradingParameter.put("SYD.AX",new CompanyStock(0.09,50,1.5,1000));
		
		tradingParameter.put("TPM.AX",new CompanyStock(0.2,20,1.5,1000));
		
		tradingParameter.put("WBC.AX",new CompanyStock(0.8,20,1.6,200));	
	}


	public Map<String, CompanyStock> getTradingParameter() {
		return tradingParameter;
	}


	public void setTradingParameter(Map<String, CompanyStock> tradingParameter) {
		this.tradingParameter = tradingParameter;
	}
	 
}
