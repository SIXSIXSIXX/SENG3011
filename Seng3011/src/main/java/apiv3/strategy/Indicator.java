package apiv3.strategy;

import java.util.Map;

import apiv3.bean.StockCSV;

public class Indicator {

	
	
	
//	public static double ema(Map<Integer, String> valueMap,double length,int lastBar){
//		//2/13
//		double multiplier = 2. / (length + 1.); 
//		//26 -2*12+1
//		//26 -2*26
//		List<PriceBar> priceBars = qh.getAll(); 
//		int firstBar = lastBar - 2 * length + 1; 
//		double ema = valueMap.get(key).getClose(); 
//	 
//		for (int bar = firstBar; bar <= lastBar; bar++) { 
//			double barClose = priceBars.get(bar).getClose(); 
//			ema += (barClose - ema) * multiplier; 
//		} 
//	 
//		return value; 
// 
//	}
	
	private static double emaHelper(double todaysPrice, double k, double EMAYesterday){
		return todaysPrice*k + EMAYesterday*(1-k);
		
	}
	
	private static double calculateEMA(Map<Integer, StockCSV> valueMap, int numberOfDays, int lastBar){
		double multiplier = 2.0 / ((double)numberOfDays + 1.0);
		int firstBar = lastBar-numberOfDays;
		double yesterdayEMA = Double.NaN;
		while(true){
			if(!Double.isNaN(valueMap.get(firstBar).getClose())){
				yesterdayEMA = valueMap.get(firstBar).getClose();
				break;
			}
			firstBar++;
		
		}
		//System.out.println("afaf"+yesterdayEMA);
		firstBar++;
		double ema = 0;
		for(;firstBar<lastBar;firstBar++){
			double close = valueMap.get(firstBar).getClose();
			if(Double.isNaN(close)) continue;
			ema = emaHelper(valueMap.get(firstBar).getClose(), multiplier, yesterdayEMA);
			yesterdayEMA = ema;
		}
		return ema;
	}
	
	
	public static double macd(Map<Integer, StockCSV> valueMap, int i){
		double fastEMA = calculateEMA(valueMap, 12,i); 
		double slowEMA = calculateEMA(valueMap, 26,i); 
//		System.out.println("fast"+fastEMA);
//		System.out.println("slowEMA"+slowEMA);
		return(fastEMA - slowEMA); 	
	}
}
