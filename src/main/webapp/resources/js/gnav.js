
		//모바일 메뉴
		//let menu_ico = document.getElementById('menu_ico');

		//let ico_menuM = new Image();
		//ico_menuM.src = "http://localhost:8080/00_Gather_Live/img/ico_menuM.svg";
		//ico_menuM.style.width = "100%";
		
		//menu_ico.appendChild(ico_menuM);

		let menu_hide = document.getElementById('menu_hide');

		$(()=> {
			$(menu_ico).click(function() {
				$(menu_hide).slideToggle("fast");
			});
		});


