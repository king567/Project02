[V]add efmodels
===
會員系統
[v] add 註冊會員功能
 add Models/Infra/HashUtility.cs
 add AppSettings,<add key = "salt" value="ar!Zu@#$D691RR"/>
 add Models/VewModels/RegisterVm.css
 add RegisterExts class,擴充方法ToEFModel(RegisterVm)
 add Controllers/MembersController
  add Register action(Get,Post)
  add Views/Members/Register.cshtml,RegisterConfirm.cshtml
  modify _Layout.cshtml,add Register link

[v]實作新會員email確認功能
	會員啟用的url:/Members/ActiveRegister?memberId=99&confirmCode=tttttttttt
	modify MembersController
		add ActiveRegister(memberId,confirmCode)
	add Views/Members/ActiveRegister.cshtml

[V]實作 登入/登出網站
	只有帳密正確而且已正式開通的會員才允許登入，實作之前，請先個別建立一個已/未開通的會員紀錄，方便測試
	modify web.config, add Authenthcation node
	add Models/ViewModels/LoginVm.cs
	modify MembersController, 
		add Login action(Get,Post)
		add Logout action(get only)
	modify _layout，加入login/logout link
	驗證:目前在沒登入時，會自動判斷權限，無法檢視About page; 登入/登出功能已實現

[working on]實作 修改個人基本資料-建立會員中心頁
	add Models/ViewModels/EditProfileVm.cs
	add Models/ViewModels/MemberExts class ,擴充方法

	modify MembersController
		add Index action 會員中心頁,在登入成功之後會導向此頁
			add Index view page
		add EditProfile
[]發confirm email給新註冊會員
