# frozen_string_literal: true

require "rails_helper"

RSpec.describe PaymentsController, type: :controller do
  let(:valid_attributes) { attributes_for :payment }

  let(:invalid_attributes) { { item: "", purchase_price: nil } }

  describe "GET #index" do
    it "assigns all payments as @payments" do
      payment = create :payment
      get :index, params: {}
      expect(assigns(:payments)).to include(payment)
    end
  end

  describe "GET #show" do
    it "assigns the requested payment as @payment" do
      payment = Payment.create! valid_attributes
      get :show, params: {id: payment.to_param}
      expect(assigns(:payment)).to eq(payment)
    end
  end

  describe "GET #new" do
    it "assigns a new payment as @payment" do
      get :new, params: {}
      expect(assigns(:payment)).to be_a_new(Payment)
    end
  end

  describe "GET #edit" do
    it "assigns the requested payment as @payment" do
      payment = Payment.create! valid_attributes
      get :edit, params: {id: payment.to_param}
      expect(assigns(:payment)).to eq(payment)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Payment" do
        expect do
          post :create, params: {payment: valid_attributes}
        end.to change(Payment, :count).by(1)
      end

      it "assigns a newly created payment as @payment" do
        post :create, params: {payment: valid_attributes}
        expect(assigns(:payment)).to be_a(Payment)
        expect(assigns(:payment)).to be_persisted
      end

      it "redirects to the created payment" do
        post :create, params: {payment: valid_attributes}
        expect(response).to redirect_to(Payment.last)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved payment as @payment" do
        post :create, params: {payment: invalid_attributes}
        expect(assigns(:payment)).to be_a_new(Payment)
      end

      it "re-renders the 'new' template" do
        post :create, params: {payment: invalid_attributes}
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_item) { "some_garbage_item" }
      let(:new_attributes) { valid_attributes.merge(item: new_item) }

      it "updates the requested payment" do
        payment = Payment.create! valid_attributes
        put :update, params: {id: payment.to_param, payment: new_attributes}
        payment.reload

        expect(payment.item).to eq(new_item)
      end

      it "assigns the requested payment as @payment" do
        payment = Payment.create! valid_attributes
        put :update, params: {id: payment.to_param, payment: valid_attributes}
        expect(assigns(:payment)).to eq(payment)
      end

      it "redirects to the payment" do
        payment = Payment.create! valid_attributes
        put :update, params: {id: payment.to_param, payment: valid_attributes}
        expect(response).to redirect_to(payment)
      end
    end

    context "with invalid params" do
      it "assigns the payment as @payment" do
        payment = Payment.create! valid_attributes
        put :update, params: {id: payment.to_param, payment: invalid_attributes}
        expect(assigns(:payment)).to eq(payment)
      end

      it "re-renders the 'edit' template" do
        payment = Payment.create! valid_attributes
        put :update, params: {id: payment.to_param, payment: invalid_attributes}
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested payment" do
      payment = Payment.create! valid_attributes
      expect do
        delete :destroy, params: {id: payment.to_param}
      end.to change(Payment, :count).by(-1)
    end

    it "redirects to the payments list" do
      payment = Payment.create! valid_attributes
      delete :destroy, params: {id: payment.to_param}
      expect(response).to redirect_to(payments_url)
    end
  end
end
