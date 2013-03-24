/**
 * 
 */
(function() {
	jQuery(document).ready(function() {
		header.headerStyle();
	});
})();

function Header() {
	var me = this;

	function headerActive(el) {
		jQuery(el).addClass('active');
		jQuery(el).find("img").eq(0).hide();
		jQuery(el).find("img").eq(1).show();
		jQuery(el).prev("li").attr('style', 'background-image:none');
	}
	function headerInactive(el) {
		jQuery(el).removeClass('active');
		jQuery(el).find("img").eq(0).show();
		jQuery(el).find("img").eq(1).hide();
		jQuery(el).prev("li").attr('style', '');
	}

	this.headerStyle = function() {
		jQuery("#navigation ul li.enabled").each(function() {
			jQuery(this).attr('style', '');
			var isActive = false;
			var headerMenu = null;
			var menuLink = this;
			// check if the menu and header active, if not, hide the dropdown
			// menu.
			function checkActive() {
				setTimeout(function() {
					if (!headerMenu.isMenuActive() && !isActive) {
						headerMenu.hideHeaderMenu();
						if (!jQuery(menuLink).hasClass("selected")) {
							headerInactive(menuLink);
						}
					}
				}, 50);
			}
			jQuery("#navigation ul li.selected").each(function() {
				jQuery(this).find(".headerText").removeClass("hide");
				jQuery(this).addClass("selectedTabBackground");

				jQuery(this).prev().addClass("borderRightTransparent");
				jQuery(this).prev().attr("style", "background-image:none");
				jQuery(this).next().addClass("borderLeftTransparent");
			});

			// check if user click the link in drop down
			function setClick() {
				header.setActive(menuLink);
			}

			function renderMenu() {
				// render header menu
				var menuConent = jQuery(menuLink).children(".headerTopMenuDropdown").clone();
				headerMenu = new HeaderMenu(menuConent, checkActive, setClick);
			}

			renderMenu();

			jQuery(menuLink).bind({
				mouseenter : function() {
					if (!isActive) {
						isActive = true;
						headerActive(this);
						headerMenu.showHeaderMenu(jQuery(menuLink).offset().left);
					}
				},
				mouseleave : function() {
					isActive = false;
					checkActive();
				},
				click : function() {
					//if (jQuery(menuLink).children(".headerTopMenuDropdown").length <= 0 && jQuery(menuLink).find(".comingSoon").length <= 0) {
						setClick();
					//}
				}
			});
		});

	};

	// set the header active
	this.setActive = function(el) {
		jQuery("#navigation ul li.selected").each(function() {
			jQuery(this).removeClass("selected");
			jQuery(this).find(".headerText").addClass("hide");
			jQuery(this).removeClass("selectedTabBackground");
			jQuery(this).prev().removeClass("activePre");
			jQuery(this).prev().removeClass("borderRightTransparent");
			jQuery(this).next().removeClass("borderLeftTransparent");
			jQuery(this).find("img").eq(0).show();
			jQuery(this).find("img").eq(1).hide();
			headerInactive(this);
		});
		jQuery(el).addClass("selected selectedTabBackground");
		jQuery(el).prev().addClass("activePre borderRightTransparent");
		jQuery(el).next().addClass("borderLeftTransparent");
		headerActive(el);
	};
	this.showLogOutOrClose = function() {
		var indenpentLoginFlagAjax = jQuery.ajax({
			url : "/FundTrader/app/pageData/getSessionTimeoutParameters",
			type : "GET",
			cache : false
		});
		indenpentLoginFlagAjax.done(function(responseText) {
			var parameters = responseText.split(":");
			var indenpentLoginFlag = parameters[2];
			jQuery("#indenpentLoginFlag").val(indenpentLoginFlag);
			if ("false" == indenpentLoginFlag) {
				jQuery("#logOut").addClass("logOutClose");
				jQuery("#logOut").removeClass("logOut");
			} else {
				jQuery("#logOut").addClass("logOutCloslogOut");
				jQuery("#logOut").removeClass("logOutClose");
			}
		});

	};
}
function HeaderMenu(menuContent, checkActive, setClick) {
	// var me = this;
	var isActive = false;
	// render menu
	var menu = jQuery(menuContent);
	jQuery(document.body).append(menu);
	// bing menu
	jQuery(menu).bind({
		mouseenter : function() {
			isActive = true;
		},
		mouseleave : function() {
			isActive = false;
			checkActive();
		},
		click : function() {
			setClick();
		}
	});
	// jQuery(menu).find("a").bind({
	// click : function() {
	// setClick();
	// }
	// });
	// hide menu
	this.hideHeaderMenu = function() {
		menu.stop(true, true).slideUp(250);
	};
	// show menu
	this.showHeaderMenu = function(left) {
		menu.css("left", left);
		menu.stop(true, true).slideDown(250);
	};
	// is menu active
	this.isMenuActive = function() {
		return isActive;
	};
}

var header = new Header();