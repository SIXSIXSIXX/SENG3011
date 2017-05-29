package apiv3.bean;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
public class NewsAndStock {
	private Map<String, List<StockPrice>> stockAndPrice = new HashMap<String,List<StockPrice>>();
	public NewsAndStock(String id){
		stockAndPrice.put(id, new ArrayList<StockPrice>());
	}
	public Map<String, List<StockPrice>> getStockAndPrice() {
		return stockAndPrice;
	}


	
	
	
}
