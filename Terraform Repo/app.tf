# This block creates the WebApp Service Plan for hosting 

resource "azurerm_app_service_plan" "asp" {
	name                = "${local.prefix}-asp"
	location            = "${azurerm_resource_group.rg.location}"
	resource_group_name = "${azurerm_resource_group.rg.name}"
	kind 				= "Linux"
	reserved 			= true

	sku {
		tier = "Standard"
		size = "S1"
	}

	tags {
		appname = "${var.app_name}",
		environment = "${var.env_name}"
	}
}


# This block creates the Azure WebApp Service . We define the linux_fx_version which takes care of the stack.
# During release pipeline we will define the Java and tomcat version to be used .

resource "azurerm_app_service" "java_app" {
	name                = "${local.prefix}-app"
	location            = "${azurerm_resource_group.rg.location}"
	resource_group_name = "${azurerm_resource_group.rg.name}"
	app_service_plan_id = "${azurerm_app_service_plan.asp.id}"
  
	site_config {  
		linux_fx_version = "${var.java_version}"
		scm_type    	= "LocalGit"
	}

	tags {
		appname = "${var.app_name}",
		environment = "${var.env_name}"
	}
}

