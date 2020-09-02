package com.project.aircnc.scraping;

import java.io.IOException;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;

public class Scraping {
	
	public static void scraping() {
		String url = "Request URL: https://www.airbnb.co.kr/api/v3/ExploreSearch?locale=ko&operationName=ExploreSearch&currency=KRW&variables=%7B%22request%22%3A%7B%22metadataOnly%22%3Afalse%2C%22version%22%3A%221.7.8%22%2C%22itemsPerGrid%22%3A20%2C%22tabId%22%3A%22home_tab%22%2C%22refinementPaths%22%3A%5B%22%2Fhomes%22%5D%2C%22placeId%22%3A%22ChIJOwg_06VPwokRYv534QaPC8g%22%2C%22source%22%3A%22search_blocks_selector_p1_flow%22%2C%22searchType%22%3A%22search_query%22%2C%22gpsLat%22%3A%2235.896584499999996%22%2C%22gpsLng%22%3A%22128.5795302%22%2C%22query%22%3A%22New%20York%2C%20NY%2C%20United%20States%22%2C%22cdnCacheSafe%22%3Afalse%2C%22simpleSearchTreatment%22%3A%22simple_search_only%22%2C%22treatmentFlags%22%3A%5B%22monthly_stays_flexible_dates%22%2C%22stays_flexible_dates%22%2C%22simple_search_1_1%22%5D%2C%22screenSize%22%3A%22large%22%7D%7D&extensions=%7B%22persistedQuery%22%3A%7B%22version%22%3A1%2C%22sha256Hash%22%3A%226f1aee89fb4ab426e48cdf24b16697670a154a1bba52d69a9714da501c670154%22%7D%7D";
		Document doc = null;
		Elements imgs = null;
		String text = null;
		try {
			doc = Jsoup.connect(url).get();
			imgs = doc.select("._9ofhsl");
			text = imgs.text();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		System.out.println("text : " + text);
		
	}
}
