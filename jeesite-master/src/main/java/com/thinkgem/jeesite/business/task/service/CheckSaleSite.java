package com.thinkgem.jeesite.business.task.service;

import java.io.IOException;
import java.util.List;

import javax.annotation.PostConstruct;

import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.methods.GetMethod;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.business.sale.entity.SalesSite;
import com.thinkgem.jeesite.business.sale.service.SalesSiteService;

@Component
@Transactional(readOnly = false)
public class CheckSaleSite {

	private final static int STATUS_CODE_OK = 200;

	private final static String WEBSITE_PREFIX = "http://";

	private final static String WEBSITE_SUBFIX = "/products_new.html";
	@Autowired
	private SalesSiteService salesSiteService;

	public static void main(String[] args) {
		// new CheckSaleSite().runCheck();
	}

	@Scheduled(cron = "0 0 10 2/1 * ?")
	public void runCheck() throws IOException {
		System.out.println(" ===========>  check begin   ============");

		List<SalesSite> list = salesSiteService.findList(new SalesSite());
		for (SalesSite salesSite : list) {
			String website = WEBSITE_PREFIX + salesSite.getDomainName() + WEBSITE_SUBFIX;
			System.out.println(website);
			HttpClient httpClient = new HttpClient();
			// 得到 post 方法
			GetMethod getMethod = new GetMethod(website);

			// 执行，返回状态码
			int statusCode = httpClient.executeMethod(getMethod);
			System.out.println("【statusCode】 == " + statusCode);
			if (statusCode == STATUS_CODE_OK) {
				Document document = Jsoup.connect(website).get();
				Element element = document.body();
				Elements bElement = element.select("#newProductsDefaultListingTopNumber b");
				String total = bElement.get(2).text().trim();
				System.out.println("website:" + website + ",total:" + total);
				// System.out.println(document.toString());
			}
		}

		System.out.println(" ===========> check end   ============");
	}
}
