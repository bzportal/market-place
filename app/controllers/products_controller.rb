class ProductsController < ApplicationController
	before_filter :validate_admin

	def create
		@product = Product.new(params[:product])
		
    if @product.save
    	redirect_to "/admin/pricing_management", notice: "New product is successfully created."
    else
    	redirect_to "/admin/pricing_management", alert: "Unable to create new product."
    end
	end

	def update
		@product = Product.find(params[:id])
		if @product.update_attributes(params[:product])
    	redirect_to "/admin/pricing_management", notice: "New product is successfully updated."
    else
    	redirect_to "/admin/pricing_management", notice: "Unable to update the product"
    end
	end

	def destroy
		@product = Product.find(params[:id])
		@product.destroy

		redirect_to "/admin/pricing_management", notice: "New product is successfully updated."
	end

	private

	def validate_admin
		if current_user.roles.first.name != "admin"
			redirect_to "/422.html"
		end
	end
end