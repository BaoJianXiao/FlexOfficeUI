package com.magazine.ui.menu.sub
{
	import com.magazine.action.BaseAction;
	import com.magazine.data.ApplicationData;
	import com.magazine.ui.button.LargeIconButton;
	import com.magazine.ui.menu._interface.IMenuGroup;
	
	import spark.components.HGroup;
	/**
	 * 
	 * @author 鲍建宵
	 * @site: http://www.cloudmessager.com/blog
	 */
	public class FileGroup extends HGroup  implements IMenuGroup
	{
		[Embed (source="assets/icon/document-50.png")]
		[Bindable]
		public var newIcon:Class;
		
		[Embed (source="assets/icon/opened_folder-50.png")]
		[Bindable]
		public var openIcon:Class;
		public function FileGroup()
		{
			super();
			height = 140;
			percentWidth = 100;
			var newBtn:LargeIconButton = new LargeIconButton(newIcon,"新建");
			newBtn.action = new BaseAction();
			addElement(newBtn);
			var openBtn:LargeIconButton = new LargeIconButton(openIcon,"打开");
			addElement(openBtn);
		}
		
		private var _applicationData:ApplicationData;
		public function set applicationData(value:ApplicationData):void
		{
			_applicationData = value;
		}
		
		public function get applicationData():ApplicationData
		{
			return _applicationData;
		}
		
	}
}