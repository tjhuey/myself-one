
package org.tjhuey.wechat.pojo;



/**
 * 复杂按钮（父按钮）
 * 
 * @author liufeng
 * @date 2013-08-08
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