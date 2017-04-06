package login;

import java.util.UUID;

import org.junit.Test;

/**
 * <p>Description: </p>
 * Path: login
 * <p>Title: TestUUId.java</p>
 * Company: resource.huey.org>
 * @author huey
 * @date 2017年3月31日
 * @version 1.0
 */
public class TestUUId {
  
	@Test
	public void testuuID(){
		UUID uuid = UUID.randomUUID();
		System.out.println(uuid.toString());
	}
}
