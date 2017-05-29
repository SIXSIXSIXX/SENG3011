//package apiv3.strategy;
//
//import java.util.Map;
//import java.util.TreeMap;
//
//import apiv3.bean.StockCSV;
//
//public class MacdMaStrategy2 {
//	//TODO dynamic change 
//	private  double PIPSTEMP = 0.6;
//	private  double INILOT = 17;
//	private  double INCRATE = 1.7;
//	//TODO dynamic change
//	private  double TAKEPROFIT = 0.6;
//	private  double MACDMAX = 0;
//	private  double MAXTRADE = 200;
//
//	private double prePrice = 0;
//	private double preLot = 0;
//	private boolean atFirst = true;
//	private Map<String, StockCSV> sample;
//	private Map<Integer, String> keyMap = new TreeMap<Integer,String>();
//	private Map<Integer, StockCSV> valueMap = new TreeMap<Integer,StockCSV>();
//	public MacdMaStrategy2(Map<String,StockCSV> newsAndStock){
//		this.sample = newsAndStock;
//		setKeyMap();
//		setValueMap();
//		
//	}
//	//pre: sell all
//	public void init(){
//		this.prePrice = 0;
//		this.preLot = 0;
//		this.atFirst = true;
//		
//	}
//	private void setKeyMap() {
//		int i = 0;
//		for(Map.Entry<String, StockCSV> e:this.sample.entrySet()) keyMap.put(i++,e.getKey());	
//	}
//	
//	private void setValueMap() {
//		int i = 0;
//		for(Map.Entry<String, StockCSV> e:this.sample.entrySet()) valueMap.put(i++,e.getValue());	
//	}
//
//
//
//	public Map<String, StockCSV> startSimulate() {
//		
//		
//		for(int i=26;i<this.valueMap.size();i++){
//			if(Double.isNaN(valueMap.get(i).getClose())){
//				State preS = this.valueMap.get(i-1).getCurrState();
//				State currS = this.valueMap.get(i).getCurrState();
//				currS.setBreakEvenPoint(preS.getBreakEvenPoint());
//				currS.setRemainCaptail(preS.getRemainCaptail());
//				currS.setRemainLots(preS.getRemainLots());
//				continue;
//			}
//			if(this.atFirst==true){
//				//first=true
//				firstIntoMarket(i);
//				continue;
//			}
//			//first = false
//			if(sellAll(i)) {
//				init();
//				continue;
//			}
//			// sell all = false && first=false
//			if(!setBuy(i)) {
//				
//				State preS = this.valueMap.get(i-1).getCurrState();
//				State currS = this.valueMap.get(i).getCurrState();
//				currS.setBreakEvenPoint(preS.getBreakEvenPoint());
//				currS.setRemainCaptail(preS.getRemainCaptail());
//				currS.setRemainLots(preS.getRemainLots());
//			}
//			
//			
//		
//		}
//		double profit = 0;
//		double MaxLot = 0;
//		double BP = 0;
//		String date = "";
//		for(int i=26;i<this.valueMap.size();i++){
//				
//			if(valueMap.get(i).getCurrState().getProfit()!=0){
//				profit+=valueMap.get(i).getCurrState().getProfit();
//			}
//			if(valueMap.get(i).getCurrState().getRemainLots()>MaxLot && valueMap.get(i-1).getCurrState().getRemainLots()<this.MAXTRADE+50){
//				MaxLot = valueMap.get(i).getCurrState().getRemainLots();
//				BP = valueMap.get(i).getCurrState().getBreakEvenPoint();
//				date = keyMap.get(i);
//			}
//			
//		}
//		
//		System.out.println("total profit is "+profit);
//		System.out.println("max lot is "+MaxLot*BP);
//		System.out.println(date);
//		return null;
//	}
//	
//	//pre: first = false
//	private boolean sellAll(int i){
//		State preS = this.valueMap.get(i-1).getCurrState();
//		double sellPoint = preS.getBreakEvenPoint()+this.TAKEPROFIT;
//		if(sellPoint<=this.valueMap.get(i).getHigh()){
//			//first = false && sellPoint <= high
//			sell(i,sellPoint);
//			return true;
//		}
//		return false;
//		
//	}
//	
//	//pre: first = false && sellPoint > high 
//	private boolean setBuy(int i) {
//		double buyPoint = this.prePrice-this.PIPSTEMP;
//		if(buyPoint<=this.valueMap.get(i).getHigh() && buyPoint>= this.valueMap.get(i).getLow()){
//			//sell all = false && buyPoint <= high
//			buy(i,buyPoint);
//			return true;
//		}
//		return false;
//	}
//
//	private boolean isInc(int i){
//		
//		return this.valueMap.get(i).getHigh() - this.valueMap.get(i-1).getHigh()>0;
//	}
//	private boolean inRange(int i,int inc){
//		if(inc == 1){
//			double targetPrice = prePrice+this.PIPSTEMP;
//			return (this.valueMap.get(i).getHigh()>targetPrice && this.valueMap.get(i).getLow()<targetPrice);
//		}
//		else{
//			double targetPrice = prePrice-this.PIPSTEMP;
//			return (this.valueMap.get(i).getHigh()>targetPrice && this.valueMap.get(i).getLow()<targetPrice);
//		}
//			
//	}
//
//	//c1:(first = true && macd<0) || c2: (sell all = false && buyPoint <= high)
//	private void buy(int i, double currPrice) {
//		//System.out.println("__________");
//		//System.out.println("buydate "+this.keyMap.get(i));
//		//System.out.println("prelot "+this.preLot);
//		//System.out.println("_____________");
//		State currS = this.valueMap.get(i).getCurrState();
//		State preS = this.valueMap.get(i-1).getCurrState();
//		double currlot;
//		//c1
//		if(this.preLot == 0)  currlot = this.INILOT;
//		//c2
//		else  currlot = this.preLot*this.INCRATE;
//		currS.setChangeLot(currlot);
//		currS.setRemainLots(preS.getRemainLots()+currlot);
//		currS.setChangePoint(currPrice);
//		
//		currS.setBreakEvenPoint(calculateBEP(preS.getBreakEvenPoint(),preS.getRemainLots(),currPrice,currlot));
//		this.prePrice = currPrice;
//		this.preLot = currlot;
//	}
//	
//	//first = false && sellPoint<=high
//	private void sell(int i,double price){
//		//System.out.println("sell date"+ this.keyMap.get(i));
//		State currS = this.valueMap.get(i).getCurrState();
//		double prelot = this.valueMap.get(i-1).getCurrState().getRemainLots();
//		currS.setChangeLot(prelot);
//		currS.setRemainLots(0);
//		currS.setChangePoint(price);
//		currS.setProfit(this.TAKEPROFIT*prelot);
//	}
//
//	//pre: first = true
//	private void firstIntoMarket(int i){
//
//		if(Indicator.macd(this.valueMap,i) < this.MACDMAX){
//			//first = true && macd<0
//			buy(i, Math.abs((this.valueMap.get(i).getClose()+this.valueMap.get(i).getOpen())/2));
//			atFirst = false;
//		}
//
//			
//	
//		
//	}
//	//pre: currParameters != 0
//	private double calculateBEP(double preEven, double preLot,double CurrPrice,double currLot){
//		if(preLot == 0) return CurrPrice;
//		return (preEven*preLot+CurrPrice*currLot)/(preLot+currLot);
//	}
//	
//
//}
