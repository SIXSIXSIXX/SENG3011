package api.cache;

import java.io.IOException;
import java.text.ParseException;
import java.util.List;
import java.util.Map;

import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Component;

import api.exception.DateInvalidException;
import api.exception.NewsResponseException;
import apiv2.api.FootballAPI;
import apiv2.bean.News;
import apiv3.Company.CompanyStock;
import apiv3.api.AutoTradingConfig;
import apiv3.api.StockAPI;
import apiv3.bean.StockCSV;
import apiv3.bean.StockPrice;
import apiv3.strategy.MacdMaStrategy3;


@Component
public class CacheService {

	
//	@Cacheable(value = "ad")
//	public News getb(long id) {
//		System.out.println("Service processing...");
//		try {
//			Thread.sleep(3000);
//		} catch (Exception e) {
//		}
//		//News cust = store.get(id);
//		return null;
//	}
//	
	
	@Cacheable(value = "insNews")
	public List<News> cachegetNews(String startD, String endD, String[] instrumentId, String[] tpCodes) throws IOException, NewsResponseException, DateInvalidException {
		System.out.println("Service processing...");
		List<News> news = FootballAPI.dataFilterCache(instrumentId, tpCodes, startD, endD);
		return news ;
	}

	@Cacheable(value = "insNewsAndStock")
	public Map<String, StockPrice> cachegetNewsAndStock(String startD, String endD, String instrumentId, String[] tpCodes) throws IOException, NewsResponseException, DateInvalidException, ParseException {
		System.out.println("Service processing...");
		Map<String, StockPrice> newsAndStock = StockAPI.getNewsAndStockPriceCache(instrumentId,tpCodes,startD,endD ,1);
		return newsAndStock ;
	}
	@Cacheable(value = "strategySimulate")
	public Map<String,StockCSV> stockStrategySimulate(String startD, String endD, String instrumentId) throws IOException, NewsResponseException, DateInvalidException {
		Map<String, StockCSV> newsAndStock = StockAPI.getNewsAndStockCache(instrumentId,new String[0],startD,endD,0);
		CompanyStock  cS= AutoTradingConfig.instance.getTradingParameter().get(instrumentId);
		MacdMaStrategy3 s = new MacdMaStrategy3(newsAndStock,cS.getIncRate(),cS.getIniLot(),cS.getMaxTrade(),cS.getPipstemp());
		s.startSimulate();
		return newsAndStock;
	}



}