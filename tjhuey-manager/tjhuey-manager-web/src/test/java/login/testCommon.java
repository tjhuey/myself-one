package login;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.tjhuey.common.utils.AdvertisementUtil.Location;
import org.tjhuey.manager.common.service.AdvertisementsService;
import org.tjhuey.manager.mapper.t_advertisementsMapper;
import org.tjhuey.manager.pojo.t_advertisements;

/**
 * <p>
 * Description:
 * </p>
 * Path: login
 * <p>
 * Title: Snippet.java
 * </p>
 * Company: resource.huey.org>
 * 
 * @author huey
 * @date 2017年4月1日
 * @version 1.0
 */

public class testCommon {

	public static void main(String[] args) {
		ApplicationContext applicationContext = new ClassPathXmlApplicationContext("spring/spring-*.xml");
		t_advertisementsMapper t_advertisementsMapper = applicationContext.getBean(t_advertisementsMapper.class);
		Map<String, Object> map = new HashMap<>();
		map.put("location", 1);
		map.put("limit", 10);
		List<t_advertisements> queryAdvertisementFront = t_advertisementsMapper.queryAdvertisementFront(map);
		for (t_advertisements t_advertisements : queryAdvertisementFront) {
			System.out.println(t_advertisements.getName());
		}
	}

	@Test
	public void testService(){
		ApplicationContext applicationContext = new ClassPathXmlApplicationContext("spring/spring-*.xml");
		AdvertisementsService bean = applicationContext.getBean(AdvertisementsService.class);
		List<t_advertisements> advertisementsFront = bean.getAdvertisementsFront(Location.HOME_TURN_ADS, 10);
		for (t_advertisements t_advertisements : advertisementsFront) {
			System.out.println(t_advertisements.toString());
		}
	}
}
