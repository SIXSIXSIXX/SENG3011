//package apiv3.strategy;
//
//import java.util.Map;
//import java.util.TreeMap;
//
//import apiv3.bean.StockCSV;
//
//public class MacdMaStrategy {
//	//TODO dynamic change 
//	private  double PIPSTEMP;
//	private  double INILOT;
//	private  double INCRATE;
//	private double BP;
//	//TODO dynamic change
//	//private  double TAKEPROFIT = 100000;
//	private  double MACDMAX = 0;
//	private  double MAXTRADE;
//	private double profit = 0;
//	private double MaxLot= 0;
//	private boolean preOperation = false;
//	private double prePrice = 0;
//	private double preLot = 0;
//	private boolean atFirst = true;
//	private Map<String, StockCSV> sample;
//	private Map<Integer, String> keyMap = new TreeMap<Integer,String>();
//	private Map<Integer, StockCSV> valueMap = new TreeMap<Integer,StockCSV>();
//	public MacdMaStrategy(Map<String,StockCSV> newsAndStock){
//		this.sample = newsAndStock;
//		setKeyMap();
//		setValueMap();
//		
//	}
//	
//	public MacdMaStrategy(Map<String,StockCSV> newsAndStock, double iNCRATE,double iNILOT,  double mAXTRADE,double pIPSTEMP) {
//		PIPSTEMP = pIPSTEMP;
//		INILOT = iNILOT;
//		INCRATE = iNCRATE;
//		MAXTRADE = mAXTRADE;
//		this.sample = newsAndStock;
//		setKeyMap();
//		setValueMap();
//	}
//
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
//		for(int i=26;i<valueMap.size();i++){
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
//			if(setSell(i)) {
//				if(valueMap.get(i).getCurrState().getRemainLots()==0)init();
//				continue;
//			}
//			// sell all = false && first=false
//			if(!setBuy(i)) {
//				System.out.println("afafasfsa"+this.keyMap.get(i));
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
//		String date = "";
//		for(int i=26;i<this.valueMap.size();i++){
//				
//			if(valueMap.get(i).getCurrState().getProfit()!=0){
//				this.profit+=valueMap.get(i).getCurrState().getProfit();
//			}
//			if(valueMap.get(i).getCurrState().getRemainLots()>MaxLot){
//				this.MaxLot = valueMap.get(i).getCurrState().getRemainLots();
//				this.BP = valueMap.get(i).getCurrState().getBreakEvenPoint();
//				date = keyMap.get(i);
//			}
//			
//		}
//		System.out.println("adsfsadfafafafafd");
//		System.out.println("total profit is "+profit);
//		System.out.println("max lot is "+MaxLot*BP);
//		System.out.println(date);
//		return null;
//	}
//	
//	private boolean isInc(int i){
//		return this.valueMap.get(i).getClose()- this.valueMap.get(i).getOpen()>0;
//	}
//
//	
//	//pre: first = false && sellPoint > high 
//	private boolean setBuy(int i) {
//		
//		if(Indicator.macd(this.valueMap,i)>0) return false;
//		System.out.println();
//		System.out.println(this.keyMap.get(i));
//		System.out.println("buy checkMACD");
//		System.out.println(Indicator.macd(this.valueMap,i));
//		if(valueMap.get(i-1).getCurrState().getRemainLots()>=this.MAXTRADE+50) return false;
//		System.out.println();
//		if(!isInc(i) && this.preOperation == true){
//			System.out.println("buy c1");
//			double buyPoint = this.prePrice - this.PIPSTEMP;
//			if(buyPoint<this.valueMap.get(i).getLow()) return false;	
//			 	buy(i,this.preLot*this.INCRATE,Math.abs((this.valueMap.get(i).getOpen()+this.valueMap.get(i).getClose())/2));
//		}
//		else if(!isInc(i) && this.preOperation == false){
//			double buyPoint = this.prePrice - this.PIPSTEMP;
//			if(buyPoint<this.valueMap.get(i).getLow()) return false;
//			buy(i,this.INILOT,Math.abs((this.valueMap.get(i).getOpen()+this.valueMap.get(i).getClose())/2));
//				
//			
//		}
//		else{
//			System.out.println("buy c2");
//			double buyPoint = this.prePrice + this.PIPSTEMP;
//			if(buyPoint>this.valueMap.get(i).getHigh()) return false;
//			buy(i,this.INILOT,Math.abs((this.valueMap.get(i).getOpen()+this.valueMap.get(i).getClose())/2));
//			
//			
//		}
//		//increase buy 1 
////		else{
////			double buyPoint = this.prePrice + this.PIPSTEMP;
////			System.out.println("buy c3");
////			if(buyPoint>this.valueMap.get(i).getHigh() || buyPoint<this.valueMap.get(i).getLow())	return false;	
////			buy(i,this.INILOT,buyPoint);
////		}
//		return true;
//	}
//
//
//
//
//	//c1:(first = true && macd<0) || c2: (sell all = false && buyPoint <= high)
//	private void buy(int i, double lot , double currPrice) {
//		System.out.println("buy lot "+ lot+ " price "+currPrice);
//		State currS = this.valueMap.get(i).getCurrState();
//		State preS = this.valueMap.get(i-1).getCurrState();
//		currS.setChangeLot(lot);
//		currS.setRemainLots(preS.getRemainLots()+lot);
//		currS.setChangePoint(currPrice);
//		
//		currS.setBreakEvenPoint(calculateBEP(preS.getBreakEvenPoint(),preS.getRemainLots(),currPrice,lot,1));
//		currS.setRemainCaptail(preS.getRemainCaptail()+lot*currPrice);
//		this.prePrice = currPrice;
//		this.preLot = lot;
//		this.preOperation = true;
//	}
//	
//	
//	
//	
//	
//	//pre: first = false
//	private boolean setSell(int i){
//		System.out.println();
//		State currS = this.valueMap.get(i).getCurrState();
//		State preS = this.valueMap.get(i-1).getCurrState();
//		double currHigh = this.valueMap.get(i).getHigh();
//		double finialPrice = Math.abs((this.valueMap.get(i).getOpen()+this.valueMap.get(i).getClose())/2);
//		if(i == (this.valueMap.size()-1)){
//		//if((preS.getBreakEvenPoint()+this.TAKEPROFIT<= currHigh)|| i == (this.valueMap.size()-1)){
//			System.out.println("sale all");
//			sell(i,preS.getRemainLots(),finialPrice);
//			return true;
//		}
//		if(Indicator.macd(this.valueMap,i)<0) return false;
//		System.out.println(this.keyMap.get(i));
//		System.out.println("sell checkMACD");
//		System.out.println(Indicator.macd(this.valueMap,i));
//		System.out.println();
//
//		
//		if(isInc(i) && this.preOperation==false){
//			double sellPoint = this.prePrice + this.PIPSTEMP;
//			System.out.println("sell c1");
//			System.out.println(sellPoint+" "+this.valueMap.get(i).getLow()+" "+this.valueMap.get(i).getHigh());
//			if(sellPoint>currHigh) return false;
//			sell(i,this.preLot*this.INCRATE,finialPrice);
//				
//			}
//		else if(isInc(i)&&this.preOperation==true){
//			double sellPoint = this.prePrice + this.PIPSTEMP;
//			System.out.println("sell c2");
//			System.out.println(sellPoint+" "+this.valueMap.get(i).getLow()+" "+this.valueMap.get(i).getHigh());
//			if(sellPoint>currHigh) return false;
//			sell(i,this.INILOT,finialPrice);
//			
//		}
//		else{
//			double sellPoint = this.prePrice - this.PIPSTEMP;
//			System.out.println("sell c3");
//
//			if(sellPoint>currHigh) return false;
//			
//			sell(i,this.INILOT,finialPrice);
//		
//		}
//		this.preOperation = false;
//		return true;
//	}
//	
//	//first = false && sellPoint<=high
//	private void sell(int i,double lot, double price){
//	
//		System.out.println("sell lot "+ lot+ " price "+price);
//		State currS = this.valueMap.get(i).getCurrState();
//		State preS = this.valueMap.get(i-1).getCurrState();
//		double prelot = preS.getRemainLots();
//		if(prelot<lot) lot = prelot;
//		currS.setChangeLot(lot);
//		currS.setRemainLots(prelot-lot);
//		currS.setChangePoint(price);
//		currS.setRemainCaptail(preS.getRemainCaptail()-price*lot);
//		if(prelot != lot)
//			currS.setBreakEvenPoint(this.calculateBEP(preS.getBreakEvenPoint(), prelot, price, lot, 0));
//		currS.setProfit(lot*(price-preS.getBreakEvenPoint()));
//		this.preLot = lot;
//	}
//
//	//pre: first = true
//	private void firstIntoMarket(int i){
//
//		if(Indicator.macd(this.valueMap,i) < this.MACDMAX){
//			//first = true && macd<0
//			buy(i, this.INILOT ,Math.abs((this.valueMap.get(i).getClose()+this.valueMap.get(i).getOpen())/2));
//			atFirst = false;
//			this.preOperation = true;
//		}
//
//		
//	}
//	//pre: currParameters != 0
//	private double calculateBEP(double preEven, double preLot,double CurrPrice,double currLot, int i){
//		if(preLot == 0) return CurrPrice;
//		if(i == 1) return (preEven*preLot+CurrPrice*currLot)/(preLot+currLot);
//		else return (preEven*preLot-CurrPrice*currLot)/(preLot-currLot);
//	}
//	public double getProfit() {
//		return profit;
//	}
//	public void setProfit(double profit) {
//		this.profit = profit;
//	}
//	public double getMaxLot() {
//		return MaxLot;
//	}
//	public void setMaxLot(double maxLot) {
//		MaxLot = maxLot;
//	}
//	public double getPIPSTEMP() {
//		return PIPSTEMP;
//	}
//	public void setPIPSTEMP(double pIPSTEMP) {
//		PIPSTEMP = pIPSTEMP;
//	}
//	public double getINILOT() {
//		return INILOT;
//	}
//	public void setINILOT(double iNILOT) {
//		INILOT = iNILOT;
//	}
//	public double getINCRATE() {
//		return INCRATE;
//	}
//	public void setINCRATE(double iNCRATE) {
//		INCRATE = iNCRATE;
//	}
//	public double getMAXTRADE() {
//		return MAXTRADE;
//	}
//	public void setMAXTRADE(double mAXTRADE) {
//		MAXTRADE = mAXTRADE;
//	}
//
//	public double getBP() {
//		return BP;
//	}
//
//	public void setBP(double bP) {
//		BP = bP;
//	}
//	
//}
//
