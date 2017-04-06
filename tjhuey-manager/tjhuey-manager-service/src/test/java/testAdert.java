import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.web.servlet.view.velocity.VelocityConfig;
import org.tjhuey.manager.mapper.t_advertisementsMapper;
import org.tjhuey.manager.pojo.t_advertisements;

/**
 * <p>
 * Description:
 * </p>
 * Path:
 * <p>
 * Title: testAdert.java
 * </p>
 * Company: resource.huey.org>
 * 
 * @author huey
 * @date 2017年4月1日
 * @version 1.0
 */
public class testAdert {

	public static ApplicationContext applicationContext = new ClassPathXmlApplicationContext("spring-*.xml");

	@Test
	public void test1() {

		t_advertisementsMapper t_advertisementsMapper = applicationContext.getBean(t_advertisementsMapper.class);
		Map<String, Object> map = new HashMap<>();
		map.put("location", 1);
		map.put("limit", 10);
		List<t_advertisements> queryAdvertisementFront = t_advertisementsMapper.queryAdvertisementFront(map);
		for (t_advertisements t_advertisements : queryAdvertisementFront) {
			System.out.println(t_advertisements);
		}
	}
}
