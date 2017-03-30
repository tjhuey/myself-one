
package org.tjhuey.wechat.init.pojo;



/**
 * 
 * <p>Description: </p>
 * Path: org.tjhuey.wechat.init.pojo
 * <p>Title: ComplexButton.java</p>
 * Company: resource.huey.org>
 * @author huey
 * @date 2017年3月30日
 * @version 1.0
 */
public class ComplexButton extends Button {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Button[] sub_button;

	public Button[] getSub_button() {
		return sub_button;
	}

	public void setSub_button(Button[] buttons) {
		this.sub_button = buttons;
	}
}