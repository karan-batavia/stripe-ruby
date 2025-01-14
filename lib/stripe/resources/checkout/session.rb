# File generated from our OpenAPI spec
# frozen_string_literal: true

module Stripe
  module Checkout
    # A Checkout Session represents your customer's session as they pay for
    # one-time purchases or subscriptions through [Checkout](https://stripe.com/docs/payments/checkout)
    # or [Payment Links](https://stripe.com/docs/payments/payment-links). We recommend creating a
    # new Session each time your customer attempts to pay.
    #
    # Once payment is successful, the Checkout Session will contain a reference
    # to the [Customer](https://stripe.com/docs/api/customers), and either the successful
    # [PaymentIntent](https://stripe.com/docs/api/payment_intents) or an active
    # [Subscription](https://stripe.com/docs/api/subscriptions).
    #
    # You can create a Checkout Session on your server and redirect to its URL
    # to begin Checkout.
    #
    # Related guide: [Checkout quickstart](https://stripe.com/docs/checkout/quickstart)
    class Session < APIResource
      extend Stripe::APIOperations::Create
      extend Stripe::APIOperations::List
      include Stripe::APIOperations::Save

      OBJECT_NAME = "checkout.session"
      def self.object_name
        "checkout.session"
      end

      class AdaptivePricing < Stripe::StripeObject
        # Whether Adaptive Pricing is enabled.
        attr_reader :enabled
      end

      class AfterExpiration < Stripe::StripeObject
        class Recovery < Stripe::StripeObject
          # Enables user redeemable promotion codes on the recovered Checkout Sessions. Defaults to `false`
          attr_reader :allow_promotion_codes
          # If `true`, a recovery url will be generated to recover this Checkout Session if it
          # expires before a transaction is completed. It will be attached to the
          # Checkout Session object upon expiration.
          attr_reader :enabled
          # The timestamp at which the recovery URL will expire.
          attr_reader :expires_at
          # URL that creates a new Checkout Session when clicked that is a copy of this expired Checkout Session
          attr_reader :url
        end
        # When set, configuration used to recover the Checkout Session on expiry.
        attr_reader :recovery
      end

      class AutomaticTax < Stripe::StripeObject
        class Liability < Stripe::StripeObject
          # The connected account being referenced when `type` is `account`.
          attr_reader :account
          # Type of the account referenced.
          attr_reader :type
        end
        # Indicates whether automatic tax is enabled for the session
        attr_reader :enabled
        # The account that's liable for tax. If set, the business address and tax registrations required to perform the tax calculation are loaded from this account. The tax transaction is returned in the report of the connected account.
        attr_reader :liability
        # The status of the most recent automated tax calculation for this session.
        attr_reader :status
      end

      class CollectedInformation < Stripe::StripeObject
        class ShippingDetails < Stripe::StripeObject
          class Address < Stripe::StripeObject
            # City, district, suburb, town, or village.
            attr_reader :city
            # Two-letter country code ([ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2)).
            attr_reader :country
            # Address line 1 (e.g., street, PO Box, or company name).
            attr_reader :line1
            # Address line 2 (e.g., apartment, suite, unit, or building).
            attr_reader :line2
            # ZIP or postal code.
            attr_reader :postal_code
            # State, county, province, or region.
            attr_reader :state
          end
          # Attribute for field address
          attr_reader :address
          # The delivery service that shipped a physical product, such as Fedex, UPS, USPS, etc.
          attr_reader :carrier
          # Recipient name.
          attr_reader :name
          # Recipient phone (including extension).
          attr_reader :phone
          # The tracking number for a physical product, obtained from the delivery service. If multiple tracking numbers were generated for this purchase, please separate them with commas.
          attr_reader :tracking_number
        end

        class TaxId < Stripe::StripeObject
          # The type of the tax ID, one of `ad_nrt`, `ar_cuit`, `eu_vat`, `bo_tin`, `br_cnpj`, `br_cpf`, `cn_tin`, `co_nit`, `cr_tin`, `do_rcn`, `ec_ruc`, `eu_oss_vat`, `hr_oib`, `pe_ruc`, `ro_tin`, `rs_pib`, `sv_nit`, `uy_ruc`, `ve_rif`, `vn_tin`, `gb_vat`, `nz_gst`, `au_abn`, `au_arn`, `in_gst`, `no_vat`, `no_voec`, `za_vat`, `ch_vat`, `mx_rfc`, `sg_uen`, `ru_inn`, `ru_kpp`, `ca_bn`, `hk_br`, `es_cif`, `tw_vat`, `th_vat`, `jp_cn`, `jp_rn`, `jp_trn`, `li_uid`, `li_vat`, `my_itn`, `us_ein`, `kr_brn`, `ca_qst`, `ca_gst_hst`, `ca_pst_bc`, `ca_pst_mb`, `ca_pst_sk`, `my_sst`, `sg_gst`, `ae_trn`, `cl_tin`, `sa_vat`, `id_npwp`, `my_frp`, `il_vat`, `ge_vat`, `ua_vat`, `is_vat`, `bg_uic`, `hu_tin`, `si_tin`, `ke_pin`, `tr_tin`, `eg_tin`, `ph_tin`, `al_tin`, `bh_vat`, `kz_bin`, `ng_tin`, `om_vat`, `de_stn`, `ch_uid`, `tz_vat`, `uz_vat`, `uz_tin`, `md_vat`, `ma_vat`, `by_tin`, `ao_tin`, `bs_tin`, `bb_tin`, `cd_nif`, `mr_nif`, `me_pib`, `zw_tin`, `ba_tin`, `gn_nif`, `mk_vat`, `sr_fin`, `sn_ninea`, `am_tin`, `np_pan`, `tj_tin`, `ug_tin`, `zm_tin`, `kh_tin`, or `unknown`
          attr_reader :type
          # The value of the tax ID.
          attr_reader :value
        end
        # Customer’s business name for this Checkout Session
        attr_reader :business_name
        # Customer’s email for this Checkout Session
        attr_reader :email
        # Customer’s phone number for this Checkout Session
        attr_reader :phone
        # Shipping information for this Checkout Session.
        attr_reader :shipping_details
        # Customer’s tax ids for this Checkout Session.
        attr_reader :tax_ids
      end

      class Consent < Stripe::StripeObject
        # If `opt_in`, the customer consents to receiving promotional communications
        # from the merchant about this Checkout Session.
        attr_reader :promotions
        # If `accepted`, the customer in this Checkout Session has agreed to the merchant's terms of service.
        attr_reader :terms_of_service
      end

      class ConsentCollection < Stripe::StripeObject
        class PaymentMethodReuseAgreement < Stripe::StripeObject
          # Determines the position and visibility of the payment method reuse agreement in the UI. When set to `auto`, Stripe's defaults will be used.
          #
          # When set to `hidden`, the payment method reuse agreement text will always be hidden in the UI.
          attr_reader :position
        end
        # If set to `hidden`, it will hide legal text related to the reuse of a payment method.
        attr_reader :payment_method_reuse_agreement
        # If set to `auto`, enables the collection of customer consent for promotional communications. The Checkout
        # Session will determine whether to display an option to opt into promotional communication
        # from the merchant depending on the customer's locale. Only available to US merchants.
        attr_reader :promotions
        # If set to `required`, it requires customers to accept the terms of service before being able to pay.
        attr_reader :terms_of_service
      end

      class CurrencyConversion < Stripe::StripeObject
        # Total of all items in source currency before discounts or taxes are applied.
        attr_reader :amount_subtotal
        # Total of all items in source currency after discounts and taxes are applied.
        attr_reader :amount_total
        # Exchange rate used to convert source currency amounts to customer currency amounts
        attr_reader :fx_rate
        # Creation currency of the CheckoutSession before localization
        attr_reader :source_currency
      end

      class CustomField < Stripe::StripeObject
        class Dropdown < Stripe::StripeObject
          class Option < Stripe::StripeObject
            # The label for the option, displayed to the customer. Up to 100 characters.
            attr_reader :label
            # The value for this option, not displayed to the customer, used by your integration to reconcile the option selected by the customer. Must be unique to this option, alphanumeric, and up to 100 characters.
            attr_reader :value
          end
          # The value that will pre-fill on the payment page.
          attr_reader :default_value
          # The options available for the customer to select. Up to 200 options allowed.
          attr_reader :options
          # The option selected by the customer. This will be the `value` for the option.
          attr_reader :value
        end

        class Label < Stripe::StripeObject
          # Custom text for the label, displayed to the customer. Up to 50 characters.
          attr_reader :custom
          # The type of the label.
          attr_reader :type
        end

        class Numeric < Stripe::StripeObject
          # The value that will pre-fill the field on the payment page.
          attr_reader :default_value
          # The maximum character length constraint for the customer's input.
          attr_reader :maximum_length
          # The minimum character length requirement for the customer's input.
          attr_reader :minimum_length
          # The value entered by the customer, containing only digits.
          attr_reader :value
        end

        class Text < Stripe::StripeObject
          # The value that will pre-fill the field on the payment page.
          attr_reader :default_value
          # The maximum character length constraint for the customer's input.
          attr_reader :maximum_length
          # The minimum character length requirement for the customer's input.
          attr_reader :minimum_length
          # The value entered by the customer.
          attr_reader :value
        end
        # Attribute for field dropdown
        attr_reader :dropdown
        # String of your choice that your integration can use to reconcile this field. Must be unique to this field, alphanumeric, and up to 200 characters.
        attr_reader :key
        # Attribute for field label
        attr_reader :label
        # Attribute for field numeric
        attr_reader :numeric
        # Whether the customer is required to complete the field before completing the Checkout Session. Defaults to `false`.
        attr_reader :optional
        # Attribute for field text
        attr_reader :text
        # The type of the field.
        attr_reader :type
      end

      class CustomText < Stripe::StripeObject
        class AfterSubmit < Stripe::StripeObject
          # Text may be up to 1200 characters in length.
          attr_reader :message
        end

        class ShippingAddress < Stripe::StripeObject
          # Text may be up to 1200 characters in length.
          attr_reader :message
        end

        class Submit < Stripe::StripeObject
          # Text may be up to 1200 characters in length.
          attr_reader :message
        end

        class TermsOfServiceAcceptance < Stripe::StripeObject
          # Text may be up to 1200 characters in length.
          attr_reader :message
        end
        # Custom text that should be displayed after the payment confirmation button.
        attr_reader :after_submit
        # Custom text that should be displayed alongside shipping address collection.
        attr_reader :shipping_address
        # Custom text that should be displayed alongside the payment confirmation button.
        attr_reader :submit
        # Custom text that should be displayed in place of the default terms of service agreement text.
        attr_reader :terms_of_service_acceptance
      end

      class CustomerDetails < Stripe::StripeObject
        class Address < Stripe::StripeObject
          # City, district, suburb, town, or village.
          attr_reader :city
          # Two-letter country code ([ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2)).
          attr_reader :country
          # Address line 1 (e.g., street, PO Box, or company name).
          attr_reader :line1
          # Address line 2 (e.g., apartment, suite, unit, or building).
          attr_reader :line2
          # ZIP or postal code.
          attr_reader :postal_code
          # State, county, province, or region.
          attr_reader :state
        end

        class TaxId < Stripe::StripeObject
          # The type of the tax ID, one of `ad_nrt`, `ar_cuit`, `eu_vat`, `bo_tin`, `br_cnpj`, `br_cpf`, `cn_tin`, `co_nit`, `cr_tin`, `do_rcn`, `ec_ruc`, `eu_oss_vat`, `hr_oib`, `pe_ruc`, `ro_tin`, `rs_pib`, `sv_nit`, `uy_ruc`, `ve_rif`, `vn_tin`, `gb_vat`, `nz_gst`, `au_abn`, `au_arn`, `in_gst`, `no_vat`, `no_voec`, `za_vat`, `ch_vat`, `mx_rfc`, `sg_uen`, `ru_inn`, `ru_kpp`, `ca_bn`, `hk_br`, `es_cif`, `tw_vat`, `th_vat`, `jp_cn`, `jp_rn`, `jp_trn`, `li_uid`, `li_vat`, `my_itn`, `us_ein`, `kr_brn`, `ca_qst`, `ca_gst_hst`, `ca_pst_bc`, `ca_pst_mb`, `ca_pst_sk`, `my_sst`, `sg_gst`, `ae_trn`, `cl_tin`, `sa_vat`, `id_npwp`, `my_frp`, `il_vat`, `ge_vat`, `ua_vat`, `is_vat`, `bg_uic`, `hu_tin`, `si_tin`, `ke_pin`, `tr_tin`, `eg_tin`, `ph_tin`, `al_tin`, `bh_vat`, `kz_bin`, `ng_tin`, `om_vat`, `de_stn`, `ch_uid`, `tz_vat`, `uz_vat`, `uz_tin`, `md_vat`, `ma_vat`, `by_tin`, `ao_tin`, `bs_tin`, `bb_tin`, `cd_nif`, `mr_nif`, `me_pib`, `zw_tin`, `ba_tin`, `gn_nif`, `mk_vat`, `sr_fin`, `sn_ninea`, `am_tin`, `np_pan`, `tj_tin`, `ug_tin`, `zm_tin`, `kh_tin`, or `unknown`
          attr_reader :type
          # The value of the tax ID.
          attr_reader :value
        end
        # The customer's address after a completed Checkout Session. Note: This property is populated only for sessions on or after March 30, 2022.
        attr_reader :address
        # The email associated with the Customer, if one exists, on the Checkout Session after a completed Checkout Session or at time of session expiry.
        # Otherwise, if the customer has consented to promotional content, this value is the most recent valid email provided by the customer on the Checkout form.
        attr_reader :email
        # The customer's name after a completed Checkout Session. Note: This property is populated only for sessions on or after March 30, 2022.
        attr_reader :name
        # The customer's phone number after a completed Checkout Session.
        attr_reader :phone
        # The customer’s tax exempt status after a completed Checkout Session.
        attr_reader :tax_exempt
        # The customer’s tax IDs after a completed Checkout Session.
        attr_reader :tax_ids
      end

      class InvoiceCreation < Stripe::StripeObject
        class InvoiceData < Stripe::StripeObject
          class CustomField < Stripe::StripeObject
            # The name of the custom field.
            attr_reader :name
            # The value of the custom field.
            attr_reader :value
          end

          class Issuer < Stripe::StripeObject
            # The connected account being referenced when `type` is `account`.
            attr_reader :account
            # Type of the account referenced.
            attr_reader :type
          end

          class RenderingOptions < Stripe::StripeObject
            # How line-item prices and amounts will be displayed with respect to tax on invoice PDFs.
            attr_reader :amount_tax_display
          end
          # The account tax IDs associated with the invoice.
          attr_reader :account_tax_ids
          # Custom fields displayed on the invoice.
          attr_reader :custom_fields
          # An arbitrary string attached to the object. Often useful for displaying to users.
          attr_reader :description
          # Footer displayed on the invoice.
          attr_reader :footer
          # The connected account that issues the invoice. The invoice is presented with the branding and support information of the specified account.
          attr_reader :issuer
          # Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format.
          attr_reader :metadata
          # Options for invoice PDF rendering.
          attr_reader :rendering_options
        end
        # Indicates whether invoice creation is enabled for the Checkout Session.
        attr_reader :enabled
        # Attribute for field invoice_data
        attr_reader :invoice_data
      end

      class PaymentMethodConfigurationDetails < Stripe::StripeObject
        # ID of the payment method configuration used.
        attr_reader :id
        # ID of the parent payment method configuration used.
        attr_reader :parent
      end

      class PaymentMethodOptions < Stripe::StripeObject
        class AcssDebit < Stripe::StripeObject
          class MandateOptions < Stripe::StripeObject
            # A URL for custom mandate text
            attr_reader :custom_mandate_url
            # List of Stripe products where this mandate can be selected automatically. Returned when the Session is in `setup` mode.
            attr_reader :default_for
            # Description of the interval. Only required if the 'payment_schedule' parameter is 'interval' or 'combined'.
            attr_reader :interval_description
            # Payment schedule for the mandate.
            attr_reader :payment_schedule
            # Transaction type of the mandate.
            attr_reader :transaction_type
          end
          # Currency supported by the bank account. Returned when the Session is in `setup` mode.
          attr_reader :currency
          # Attribute for field mandate_options
          attr_reader :mandate_options
          # Indicates that you intend to make future payments with this PaymentIntent's payment method.
          #
          # If you provide a Customer with the PaymentIntent, you can use this parameter to [attach the payment method](/payments/save-during-payment) to the Customer after the PaymentIntent is confirmed and the customer completes any required actions. If you don't provide a Customer, you can still [attach](/api/payment_methods/attach) the payment method to a Customer after the transaction completes.
          #
          # If the payment method is `card_present` and isn't a digital wallet, Stripe creates and attaches a [generated_card](/api/charges/object#charge_object-payment_method_details-card_present-generated_card) payment method representing the card to the Customer instead.
          #
          # When processing card payments, Stripe uses `setup_future_usage` to help you comply with regional legislation and network rules, such as [SCA](/strong-customer-authentication).
          attr_reader :setup_future_usage
          # Bank account verification method.
          attr_reader :verification_method
        end

        class Affirm < Stripe::StripeObject
          # Indicates that you intend to make future payments with this PaymentIntent's payment method.
          #
          # If you provide a Customer with the PaymentIntent, you can use this parameter to [attach the payment method](/payments/save-during-payment) to the Customer after the PaymentIntent is confirmed and the customer completes any required actions. If you don't provide a Customer, you can still [attach](/api/payment_methods/attach) the payment method to a Customer after the transaction completes.
          #
          # If the payment method is `card_present` and isn't a digital wallet, Stripe creates and attaches a [generated_card](/api/charges/object#charge_object-payment_method_details-card_present-generated_card) payment method representing the card to the Customer instead.
          #
          # When processing card payments, Stripe uses `setup_future_usage` to help you comply with regional legislation and network rules, such as [SCA](/strong-customer-authentication).
          attr_reader :setup_future_usage
        end

        class AfterpayClearpay < Stripe::StripeObject
          # Indicates that you intend to make future payments with this PaymentIntent's payment method.
          #
          # If you provide a Customer with the PaymentIntent, you can use this parameter to [attach the payment method](/payments/save-during-payment) to the Customer after the PaymentIntent is confirmed and the customer completes any required actions. If you don't provide a Customer, you can still [attach](/api/payment_methods/attach) the payment method to a Customer after the transaction completes.
          #
          # If the payment method is `card_present` and isn't a digital wallet, Stripe creates and attaches a [generated_card](/api/charges/object#charge_object-payment_method_details-card_present-generated_card) payment method representing the card to the Customer instead.
          #
          # When processing card payments, Stripe uses `setup_future_usage` to help you comply with regional legislation and network rules, such as [SCA](/strong-customer-authentication).
          attr_reader :setup_future_usage
        end

        class Alipay < Stripe::StripeObject
          # Indicates that you intend to make future payments with this PaymentIntent's payment method.
          #
          # If you provide a Customer with the PaymentIntent, you can use this parameter to [attach the payment method](/payments/save-during-payment) to the Customer after the PaymentIntent is confirmed and the customer completes any required actions. If you don't provide a Customer, you can still [attach](/api/payment_methods/attach) the payment method to a Customer after the transaction completes.
          #
          # If the payment method is `card_present` and isn't a digital wallet, Stripe creates and attaches a [generated_card](/api/charges/object#charge_object-payment_method_details-card_present-generated_card) payment method representing the card to the Customer instead.
          #
          # When processing card payments, Stripe uses `setup_future_usage` to help you comply with regional legislation and network rules, such as [SCA](/strong-customer-authentication).
          attr_reader :setup_future_usage
        end

        class AmazonPay < Stripe::StripeObject
          # Indicates that you intend to make future payments with this PaymentIntent's payment method.
          #
          # If you provide a Customer with the PaymentIntent, you can use this parameter to [attach the payment method](/payments/save-during-payment) to the Customer after the PaymentIntent is confirmed and the customer completes any required actions. If you don't provide a Customer, you can still [attach](/api/payment_methods/attach) the payment method to a Customer after the transaction completes.
          #
          # If the payment method is `card_present` and isn't a digital wallet, Stripe creates and attaches a [generated_card](/api/charges/object#charge_object-payment_method_details-card_present-generated_card) payment method representing the card to the Customer instead.
          #
          # When processing card payments, Stripe uses `setup_future_usage` to help you comply with regional legislation and network rules, such as [SCA](/strong-customer-authentication).
          attr_reader :setup_future_usage
        end

        class AuBecsDebit < Stripe::StripeObject
          # Indicates that you intend to make future payments with this PaymentIntent's payment method.
          #
          # If you provide a Customer with the PaymentIntent, you can use this parameter to [attach the payment method](/payments/save-during-payment) to the Customer after the PaymentIntent is confirmed and the customer completes any required actions. If you don't provide a Customer, you can still [attach](/api/payment_methods/attach) the payment method to a Customer after the transaction completes.
          #
          # If the payment method is `card_present` and isn't a digital wallet, Stripe creates and attaches a [generated_card](/api/charges/object#charge_object-payment_method_details-card_present-generated_card) payment method representing the card to the Customer instead.
          #
          # When processing card payments, Stripe uses `setup_future_usage` to help you comply with regional legislation and network rules, such as [SCA](/strong-customer-authentication).
          attr_reader :setup_future_usage
        end

        class BacsDebit < Stripe::StripeObject
          class MandateOptions < Stripe::StripeObject
            # Prefix used to generate the Mandate reference. Must be at most 12 characters long. Must consist of only uppercase letters, numbers, spaces, or the following special characters: '/', '_', '-', '&', '.'. Cannot begin with 'DDIC' or 'STRIPE'.
            attr_reader :reference_prefix
          end
          # Attribute for field mandate_options
          attr_reader :mandate_options
          # Indicates that you intend to make future payments with this PaymentIntent's payment method.
          #
          # If you provide a Customer with the PaymentIntent, you can use this parameter to [attach the payment method](/payments/save-during-payment) to the Customer after the PaymentIntent is confirmed and the customer completes any required actions. If you don't provide a Customer, you can still [attach](/api/payment_methods/attach) the payment method to a Customer after the transaction completes.
          #
          # If the payment method is `card_present` and isn't a digital wallet, Stripe creates and attaches a [generated_card](/api/charges/object#charge_object-payment_method_details-card_present-generated_card) payment method representing the card to the Customer instead.
          #
          # When processing card payments, Stripe uses `setup_future_usage` to help you comply with regional legislation and network rules, such as [SCA](/strong-customer-authentication).
          attr_reader :setup_future_usage
        end

        class Bancontact < Stripe::StripeObject
          # Indicates that you intend to make future payments with this PaymentIntent's payment method.
          #
          # If you provide a Customer with the PaymentIntent, you can use this parameter to [attach the payment method](/payments/save-during-payment) to the Customer after the PaymentIntent is confirmed and the customer completes any required actions. If you don't provide a Customer, you can still [attach](/api/payment_methods/attach) the payment method to a Customer after the transaction completes.
          #
          # If the payment method is `card_present` and isn't a digital wallet, Stripe creates and attaches a [generated_card](/api/charges/object#charge_object-payment_method_details-card_present-generated_card) payment method representing the card to the Customer instead.
          #
          # When processing card payments, Stripe uses `setup_future_usage` to help you comply with regional legislation and network rules, such as [SCA](/strong-customer-authentication).
          attr_reader :setup_future_usage
        end

        class Boleto < Stripe::StripeObject
          # The number of calendar days before a Boleto voucher expires. For example, if you create a Boleto voucher on Monday and you set expires_after_days to 2, the Boleto voucher will expire on Wednesday at 23:59 America/Sao_Paulo time.
          attr_reader :expires_after_days
          # Indicates that you intend to make future payments with this PaymentIntent's payment method.
          #
          # If you provide a Customer with the PaymentIntent, you can use this parameter to [attach the payment method](/payments/save-during-payment) to the Customer after the PaymentIntent is confirmed and the customer completes any required actions. If you don't provide a Customer, you can still [attach](/api/payment_methods/attach) the payment method to a Customer after the transaction completes.
          #
          # If the payment method is `card_present` and isn't a digital wallet, Stripe creates and attaches a [generated_card](/api/charges/object#charge_object-payment_method_details-card_present-generated_card) payment method representing the card to the Customer instead.
          #
          # When processing card payments, Stripe uses `setup_future_usage` to help you comply with regional legislation and network rules, such as [SCA](/strong-customer-authentication).
          attr_reader :setup_future_usage
        end

        class Card < Stripe::StripeObject
          class Installments < Stripe::StripeObject
            # Indicates if installments are enabled
            attr_reader :enabled
          end
          # Attribute for field installments
          attr_reader :installments
          # Request ability to [capture beyond the standard authorization validity window](/payments/extended-authorization) for this CheckoutSession.
          attr_reader :request_decremental_authorization
          # Request ability to [capture beyond the standard authorization validity window](/payments/extended-authorization) for this CheckoutSession.
          attr_reader :request_extended_authorization
          # Request ability to [increment the authorization](/payments/incremental-authorization) for this CheckoutSession.
          attr_reader :request_incremental_authorization
          # Request ability to make [multiple captures](/payments/multicapture) for this CheckoutSession.
          attr_reader :request_multicapture
          # Request ability to [overcapture](/payments/overcapture) for this CheckoutSession.
          attr_reader :request_overcapture
          # We strongly recommend that you rely on our SCA Engine to automatically prompt your customers for authentication based on risk level and [other requirements](https://stripe.com/docs/strong-customer-authentication). However, if you wish to request 3D Secure based on logic from your own fraud engine, provide this option. If not provided, this value defaults to `automatic`. Read our guide on [manually requesting 3D Secure](https://stripe.com/docs/payments/3d-secure/authentication-flow#manual-three-ds) for more information on how this configuration interacts with Radar and our SCA Engine.
          attr_reader :request_three_d_secure
          # Indicates that you intend to make future payments with this PaymentIntent's payment method.
          #
          # If you provide a Customer with the PaymentIntent, you can use this parameter to [attach the payment method](/payments/save-during-payment) to the Customer after the PaymentIntent is confirmed and the customer completes any required actions. If you don't provide a Customer, you can still [attach](/api/payment_methods/attach) the payment method to a Customer after the transaction completes.
          #
          # If the payment method is `card_present` and isn't a digital wallet, Stripe creates and attaches a [generated_card](/api/charges/object#charge_object-payment_method_details-card_present-generated_card) payment method representing the card to the Customer instead.
          #
          # When processing card payments, Stripe uses `setup_future_usage` to help you comply with regional legislation and network rules, such as [SCA](/strong-customer-authentication).
          attr_reader :setup_future_usage
          # Provides information about a card payment that customers see on their statements. Concatenated with the Kana prefix (shortened Kana descriptor) or Kana statement descriptor that’s set on the account to form the complete statement descriptor. Maximum 22 characters. On card statements, the *concatenation* of both prefix and suffix (including separators) will appear truncated to 22 characters.
          attr_reader :statement_descriptor_suffix_kana
          # Provides information about a card payment that customers see on their statements. Concatenated with the Kanji prefix (shortened Kanji descriptor) or Kanji statement descriptor that’s set on the account to form the complete statement descriptor. Maximum 17 characters. On card statements, the *concatenation* of both prefix and suffix (including separators) will appear truncated to 17 characters.
          attr_reader :statement_descriptor_suffix_kanji
        end

        class Cashapp < Stripe::StripeObject
          # Indicates that you intend to make future payments with this PaymentIntent's payment method.
          #
          # If you provide a Customer with the PaymentIntent, you can use this parameter to [attach the payment method](/payments/save-during-payment) to the Customer after the PaymentIntent is confirmed and the customer completes any required actions. If you don't provide a Customer, you can still [attach](/api/payment_methods/attach) the payment method to a Customer after the transaction completes.
          #
          # If the payment method is `card_present` and isn't a digital wallet, Stripe creates and attaches a [generated_card](/api/charges/object#charge_object-payment_method_details-card_present-generated_card) payment method representing the card to the Customer instead.
          #
          # When processing card payments, Stripe uses `setup_future_usage` to help you comply with regional legislation and network rules, such as [SCA](/strong-customer-authentication).
          attr_reader :setup_future_usage
        end

        class CustomerBalance < Stripe::StripeObject
          class BankTransfer < Stripe::StripeObject
            class EuBankTransfer < Stripe::StripeObject
              # The desired country code of the bank account information. Permitted values include: `BE`, `DE`, `ES`, `FR`, `IE`, or `NL`.
              attr_reader :country
            end
            # Attribute for field eu_bank_transfer
            attr_reader :eu_bank_transfer
            # List of address types that should be returned in the financial_addresses response. If not specified, all valid types will be returned.
            #
            # Permitted values include: `sort_code`, `zengin`, `iban`, or `spei`.
            attr_reader :requested_address_types
            # The bank transfer type that this PaymentIntent is allowed to use for funding Permitted values include: `eu_bank_transfer`, `gb_bank_transfer`, `jp_bank_transfer`, `mx_bank_transfer`, or `us_bank_transfer`.
            attr_reader :type
          end
          # Attribute for field bank_transfer
          attr_reader :bank_transfer
          # The funding method type to be used when there are not enough funds in the customer balance. Permitted values include: `bank_transfer`.
          attr_reader :funding_type
          # Indicates that you intend to make future payments with this PaymentIntent's payment method.
          #
          # If you provide a Customer with the PaymentIntent, you can use this parameter to [attach the payment method](/payments/save-during-payment) to the Customer after the PaymentIntent is confirmed and the customer completes any required actions. If you don't provide a Customer, you can still [attach](/api/payment_methods/attach) the payment method to a Customer after the transaction completes.
          #
          # If the payment method is `card_present` and isn't a digital wallet, Stripe creates and attaches a [generated_card](/api/charges/object#charge_object-payment_method_details-card_present-generated_card) payment method representing the card to the Customer instead.
          #
          # When processing card payments, Stripe uses `setup_future_usage` to help you comply with regional legislation and network rules, such as [SCA](/strong-customer-authentication).
          attr_reader :setup_future_usage
        end

        class Eps < Stripe::StripeObject
          # Indicates that you intend to make future payments with this PaymentIntent's payment method.
          #
          # If you provide a Customer with the PaymentIntent, you can use this parameter to [attach the payment method](/payments/save-during-payment) to the Customer after the PaymentIntent is confirmed and the customer completes any required actions. If you don't provide a Customer, you can still [attach](/api/payment_methods/attach) the payment method to a Customer after the transaction completes.
          #
          # If the payment method is `card_present` and isn't a digital wallet, Stripe creates and attaches a [generated_card](/api/charges/object#charge_object-payment_method_details-card_present-generated_card) payment method representing the card to the Customer instead.
          #
          # When processing card payments, Stripe uses `setup_future_usage` to help you comply with regional legislation and network rules, such as [SCA](/strong-customer-authentication).
          attr_reader :setup_future_usage
        end

        class Fpx < Stripe::StripeObject
          # Indicates that you intend to make future payments with this PaymentIntent's payment method.
          #
          # If you provide a Customer with the PaymentIntent, you can use this parameter to [attach the payment method](/payments/save-during-payment) to the Customer after the PaymentIntent is confirmed and the customer completes any required actions. If you don't provide a Customer, you can still [attach](/api/payment_methods/attach) the payment method to a Customer after the transaction completes.
          #
          # If the payment method is `card_present` and isn't a digital wallet, Stripe creates and attaches a [generated_card](/api/charges/object#charge_object-payment_method_details-card_present-generated_card) payment method representing the card to the Customer instead.
          #
          # When processing card payments, Stripe uses `setup_future_usage` to help you comply with regional legislation and network rules, such as [SCA](/strong-customer-authentication).
          attr_reader :setup_future_usage
        end

        class Giropay < Stripe::StripeObject
          # Indicates that you intend to make future payments with this PaymentIntent's payment method.
          #
          # If you provide a Customer with the PaymentIntent, you can use this parameter to [attach the payment method](/payments/save-during-payment) to the Customer after the PaymentIntent is confirmed and the customer completes any required actions. If you don't provide a Customer, you can still [attach](/api/payment_methods/attach) the payment method to a Customer after the transaction completes.
          #
          # If the payment method is `card_present` and isn't a digital wallet, Stripe creates and attaches a [generated_card](/api/charges/object#charge_object-payment_method_details-card_present-generated_card) payment method representing the card to the Customer instead.
          #
          # When processing card payments, Stripe uses `setup_future_usage` to help you comply with regional legislation and network rules, such as [SCA](/strong-customer-authentication).
          attr_reader :setup_future_usage
        end

        class Grabpay < Stripe::StripeObject
          # Indicates that you intend to make future payments with this PaymentIntent's payment method.
          #
          # If you provide a Customer with the PaymentIntent, you can use this parameter to [attach the payment method](/payments/save-during-payment) to the Customer after the PaymentIntent is confirmed and the customer completes any required actions. If you don't provide a Customer, you can still [attach](/api/payment_methods/attach) the payment method to a Customer after the transaction completes.
          #
          # If the payment method is `card_present` and isn't a digital wallet, Stripe creates and attaches a [generated_card](/api/charges/object#charge_object-payment_method_details-card_present-generated_card) payment method representing the card to the Customer instead.
          #
          # When processing card payments, Stripe uses `setup_future_usage` to help you comply with regional legislation and network rules, such as [SCA](/strong-customer-authentication).
          attr_reader :setup_future_usage
        end

        class Ideal < Stripe::StripeObject
          # Indicates that you intend to make future payments with this PaymentIntent's payment method.
          #
          # If you provide a Customer with the PaymentIntent, you can use this parameter to [attach the payment method](/payments/save-during-payment) to the Customer after the PaymentIntent is confirmed and the customer completes any required actions. If you don't provide a Customer, you can still [attach](/api/payment_methods/attach) the payment method to a Customer after the transaction completes.
          #
          # If the payment method is `card_present` and isn't a digital wallet, Stripe creates and attaches a [generated_card](/api/charges/object#charge_object-payment_method_details-card_present-generated_card) payment method representing the card to the Customer instead.
          #
          # When processing card payments, Stripe uses `setup_future_usage` to help you comply with regional legislation and network rules, such as [SCA](/strong-customer-authentication).
          attr_reader :setup_future_usage
        end

        class KakaoPay < Stripe::StripeObject
          # Controls when the funds will be captured from the customer's account.
          attr_reader :capture_method
          # Indicates that you intend to make future payments with this PaymentIntent's payment method.
          #
          # If you provide a Customer with the PaymentIntent, you can use this parameter to [attach the payment method](/payments/save-during-payment) to the Customer after the PaymentIntent is confirmed and the customer completes any required actions. If you don't provide a Customer, you can still [attach](/api/payment_methods/attach) the payment method to a Customer after the transaction completes.
          #
          # If the payment method is `card_present` and isn't a digital wallet, Stripe creates and attaches a [generated_card](/api/charges/object#charge_object-payment_method_details-card_present-generated_card) payment method representing the card to the Customer instead.
          #
          # When processing card payments, Stripe uses `setup_future_usage` to help you comply with regional legislation and network rules, such as [SCA](/strong-customer-authentication).
          attr_reader :setup_future_usage
        end

        class Klarna < Stripe::StripeObject
          # Indicates that you intend to make future payments with this PaymentIntent's payment method.
          #
          # If you provide a Customer with the PaymentIntent, you can use this parameter to [attach the payment method](/payments/save-during-payment) to the Customer after the PaymentIntent is confirmed and the customer completes any required actions. If you don't provide a Customer, you can still [attach](/api/payment_methods/attach) the payment method to a Customer after the transaction completes.
          #
          # If the payment method is `card_present` and isn't a digital wallet, Stripe creates and attaches a [generated_card](/api/charges/object#charge_object-payment_method_details-card_present-generated_card) payment method representing the card to the Customer instead.
          #
          # When processing card payments, Stripe uses `setup_future_usage` to help you comply with regional legislation and network rules, such as [SCA](/strong-customer-authentication).
          attr_reader :setup_future_usage
        end

        class Konbini < Stripe::StripeObject
          # The number of calendar days (between 1 and 60) after which Konbini payment instructions will expire. For example, if a PaymentIntent is confirmed with Konbini and `expires_after_days` set to 2 on Monday JST, the instructions will expire on Wednesday 23:59:59 JST.
          attr_reader :expires_after_days
          # Indicates that you intend to make future payments with this PaymentIntent's payment method.
          #
          # If you provide a Customer with the PaymentIntent, you can use this parameter to [attach the payment method](/payments/save-during-payment) to the Customer after the PaymentIntent is confirmed and the customer completes any required actions. If you don't provide a Customer, you can still [attach](/api/payment_methods/attach) the payment method to a Customer after the transaction completes.
          #
          # If the payment method is `card_present` and isn't a digital wallet, Stripe creates and attaches a [generated_card](/api/charges/object#charge_object-payment_method_details-card_present-generated_card) payment method representing the card to the Customer instead.
          #
          # When processing card payments, Stripe uses `setup_future_usage` to help you comply with regional legislation and network rules, such as [SCA](/strong-customer-authentication).
          attr_reader :setup_future_usage
        end

        class KrCard < Stripe::StripeObject
          # Controls when the funds will be captured from the customer's account.
          attr_reader :capture_method
          # Indicates that you intend to make future payments with this PaymentIntent's payment method.
          #
          # If you provide a Customer with the PaymentIntent, you can use this parameter to [attach the payment method](/payments/save-during-payment) to the Customer after the PaymentIntent is confirmed and the customer completes any required actions. If you don't provide a Customer, you can still [attach](/api/payment_methods/attach) the payment method to a Customer after the transaction completes.
          #
          # If the payment method is `card_present` and isn't a digital wallet, Stripe creates and attaches a [generated_card](/api/charges/object#charge_object-payment_method_details-card_present-generated_card) payment method representing the card to the Customer instead.
          #
          # When processing card payments, Stripe uses `setup_future_usage` to help you comply with regional legislation and network rules, such as [SCA](/strong-customer-authentication).
          attr_reader :setup_future_usage
        end

        class Link < Stripe::StripeObject
          # Indicates that you intend to make future payments with this PaymentIntent's payment method.
          #
          # If you provide a Customer with the PaymentIntent, you can use this parameter to [attach the payment method](/payments/save-during-payment) to the Customer after the PaymentIntent is confirmed and the customer completes any required actions. If you don't provide a Customer, you can still [attach](/api/payment_methods/attach) the payment method to a Customer after the transaction completes.
          #
          # If the payment method is `card_present` and isn't a digital wallet, Stripe creates and attaches a [generated_card](/api/charges/object#charge_object-payment_method_details-card_present-generated_card) payment method representing the card to the Customer instead.
          #
          # When processing card payments, Stripe uses `setup_future_usage` to help you comply with regional legislation and network rules, such as [SCA](/strong-customer-authentication).
          attr_reader :setup_future_usage
        end

        class Mobilepay < Stripe::StripeObject
          # Indicates that you intend to make future payments with this PaymentIntent's payment method.
          #
          # If you provide a Customer with the PaymentIntent, you can use this parameter to [attach the payment method](/payments/save-during-payment) to the Customer after the PaymentIntent is confirmed and the customer completes any required actions. If you don't provide a Customer, you can still [attach](/api/payment_methods/attach) the payment method to a Customer after the transaction completes.
          #
          # If the payment method is `card_present` and isn't a digital wallet, Stripe creates and attaches a [generated_card](/api/charges/object#charge_object-payment_method_details-card_present-generated_card) payment method representing the card to the Customer instead.
          #
          # When processing card payments, Stripe uses `setup_future_usage` to help you comply with regional legislation and network rules, such as [SCA](/strong-customer-authentication).
          attr_reader :setup_future_usage
        end

        class Multibanco < Stripe::StripeObject
          # Indicates that you intend to make future payments with this PaymentIntent's payment method.
          #
          # If you provide a Customer with the PaymentIntent, you can use this parameter to [attach the payment method](/payments/save-during-payment) to the Customer after the PaymentIntent is confirmed and the customer completes any required actions. If you don't provide a Customer, you can still [attach](/api/payment_methods/attach) the payment method to a Customer after the transaction completes.
          #
          # If the payment method is `card_present` and isn't a digital wallet, Stripe creates and attaches a [generated_card](/api/charges/object#charge_object-payment_method_details-card_present-generated_card) payment method representing the card to the Customer instead.
          #
          # When processing card payments, Stripe uses `setup_future_usage` to help you comply with regional legislation and network rules, such as [SCA](/strong-customer-authentication).
          attr_reader :setup_future_usage
        end

        class NaverPay < Stripe::StripeObject
          # Controls when the funds will be captured from the customer's account.
          attr_reader :capture_method
        end

        class Oxxo < Stripe::StripeObject
          # The number of calendar days before an OXXO invoice expires. For example, if you create an OXXO invoice on Monday and you set expires_after_days to 2, the OXXO invoice will expire on Wednesday at 23:59 America/Mexico_City time.
          attr_reader :expires_after_days
          # Indicates that you intend to make future payments with this PaymentIntent's payment method.
          #
          # If you provide a Customer with the PaymentIntent, you can use this parameter to [attach the payment method](/payments/save-during-payment) to the Customer after the PaymentIntent is confirmed and the customer completes any required actions. If you don't provide a Customer, you can still [attach](/api/payment_methods/attach) the payment method to a Customer after the transaction completes.
          #
          # If the payment method is `card_present` and isn't a digital wallet, Stripe creates and attaches a [generated_card](/api/charges/object#charge_object-payment_method_details-card_present-generated_card) payment method representing the card to the Customer instead.
          #
          # When processing card payments, Stripe uses `setup_future_usage` to help you comply with regional legislation and network rules, such as [SCA](/strong-customer-authentication).
          attr_reader :setup_future_usage
        end

        class P24 < Stripe::StripeObject
          # Indicates that you intend to make future payments with this PaymentIntent's payment method.
          #
          # If you provide a Customer with the PaymentIntent, you can use this parameter to [attach the payment method](/payments/save-during-payment) to the Customer after the PaymentIntent is confirmed and the customer completes any required actions. If you don't provide a Customer, you can still [attach](/api/payment_methods/attach) the payment method to a Customer after the transaction completes.
          #
          # If the payment method is `card_present` and isn't a digital wallet, Stripe creates and attaches a [generated_card](/api/charges/object#charge_object-payment_method_details-card_present-generated_card) payment method representing the card to the Customer instead.
          #
          # When processing card payments, Stripe uses `setup_future_usage` to help you comply with regional legislation and network rules, such as [SCA](/strong-customer-authentication).
          attr_reader :setup_future_usage
        end

        class Payco < Stripe::StripeObject
          # Controls when the funds will be captured from the customer's account.
          attr_reader :capture_method
        end

        class Paynow < Stripe::StripeObject
          # Indicates that you intend to make future payments with this PaymentIntent's payment method.
          #
          # If you provide a Customer with the PaymentIntent, you can use this parameter to [attach the payment method](/payments/save-during-payment) to the Customer after the PaymentIntent is confirmed and the customer completes any required actions. If you don't provide a Customer, you can still [attach](/api/payment_methods/attach) the payment method to a Customer after the transaction completes.
          #
          # If the payment method is `card_present` and isn't a digital wallet, Stripe creates and attaches a [generated_card](/api/charges/object#charge_object-payment_method_details-card_present-generated_card) payment method representing the card to the Customer instead.
          #
          # When processing card payments, Stripe uses `setup_future_usage` to help you comply with regional legislation and network rules, such as [SCA](/strong-customer-authentication).
          attr_reader :setup_future_usage
        end

        class Paypal < Stripe::StripeObject
          # Controls when the funds will be captured from the customer's account.
          attr_reader :capture_method
          # Preferred locale of the PayPal checkout page that the customer is redirected to.
          attr_reader :preferred_locale
          # A reference of the PayPal transaction visible to customer which is mapped to PayPal's invoice ID. This must be a globally unique ID if you have configured in your PayPal settings to block multiple payments per invoice ID.
          attr_reader :reference
          # Indicates that you intend to make future payments with this PaymentIntent's payment method.
          #
          # If you provide a Customer with the PaymentIntent, you can use this parameter to [attach the payment method](/payments/save-during-payment) to the Customer after the PaymentIntent is confirmed and the customer completes any required actions. If you don't provide a Customer, you can still [attach](/api/payment_methods/attach) the payment method to a Customer after the transaction completes.
          #
          # If the payment method is `card_present` and isn't a digital wallet, Stripe creates and attaches a [generated_card](/api/charges/object#charge_object-payment_method_details-card_present-generated_card) payment method representing the card to the Customer instead.
          #
          # When processing card payments, Stripe uses `setup_future_usage` to help you comply with regional legislation and network rules, such as [SCA](/strong-customer-authentication).
          attr_reader :setup_future_usage
          # The Stripe connected account IDs of the sellers on the platform for this transaction (optional). Only allowed when [separate charges and transfers](https://stripe.com/docs/connect/separate-charges-and-transfers) are used.
          attr_reader :subsellers
        end

        class Payto < Stripe::StripeObject
          class MandateOptions < Stripe::StripeObject
            # Amount that will be collected. It is required when `amount_type` is `fixed`.
            attr_reader :amount
            # The type of amount that will be collected. The amount charged must be exact or up to the value of `amount` param for `fixed` or `maximum` type respectively.
            attr_reader :amount_type
            # Date, in YYYY-MM-DD format, after which payments will not be collected. Defaults to no end date.
            attr_reader :end_date
            # The periodicity at which payments will be collected.
            attr_reader :payment_schedule
            # The number of payments that will be made during a payment period. Defaults to 1 except for when `payment_schedule` is `adhoc`. In that case, it defaults to no limit.
            attr_reader :payments_per_period
            # The purpose for which payments are made. Defaults to retail.
            attr_reader :purpose
            # Date, in YYYY-MM-DD format, from which payments will be collected. Defaults to confirmation time.
            attr_reader :start_date
          end
          # Attribute for field mandate_options
          attr_reader :mandate_options
          # Indicates that you intend to make future payments with this PaymentIntent's payment method.
          #
          # If you provide a Customer with the PaymentIntent, you can use this parameter to [attach the payment method](/payments/save-during-payment) to the Customer after the PaymentIntent is confirmed and the customer completes any required actions. If you don't provide a Customer, you can still [attach](/api/payment_methods/attach) the payment method to a Customer after the transaction completes.
          #
          # If the payment method is `card_present` and isn't a digital wallet, Stripe creates and attaches a [generated_card](/api/charges/object#charge_object-payment_method_details-card_present-generated_card) payment method representing the card to the Customer instead.
          #
          # When processing card payments, Stripe uses `setup_future_usage` to help you comply with regional legislation and network rules, such as [SCA](/strong-customer-authentication).
          attr_reader :setup_future_usage
        end

        class Pix < Stripe::StripeObject
          # The number of seconds after which Pix payment will expire.
          attr_reader :expires_after_seconds
        end

        class RevolutPay < Stripe::StripeObject
          # Indicates that you intend to make future payments with this PaymentIntent's payment method.
          #
          # If you provide a Customer with the PaymentIntent, you can use this parameter to [attach the payment method](/payments/save-during-payment) to the Customer after the PaymentIntent is confirmed and the customer completes any required actions. If you don't provide a Customer, you can still [attach](/api/payment_methods/attach) the payment method to a Customer after the transaction completes.
          #
          # If the payment method is `card_present` and isn't a digital wallet, Stripe creates and attaches a [generated_card](/api/charges/object#charge_object-payment_method_details-card_present-generated_card) payment method representing the card to the Customer instead.
          #
          # When processing card payments, Stripe uses `setup_future_usage` to help you comply with regional legislation and network rules, such as [SCA](/strong-customer-authentication).
          attr_reader :setup_future_usage
        end

        class SamsungPay < Stripe::StripeObject
          # Controls when the funds will be captured from the customer's account.
          attr_reader :capture_method
        end

        class SepaDebit < Stripe::StripeObject
          class MandateOptions < Stripe::StripeObject
            # Prefix used to generate the Mandate reference. Must be at most 12 characters long. Must consist of only uppercase letters, numbers, spaces, or the following special characters: '/', '_', '-', '&', '.'. Cannot begin with 'STRIPE'.
            attr_reader :reference_prefix
          end
          # Attribute for field mandate_options
          attr_reader :mandate_options
          # Indicates that you intend to make future payments with this PaymentIntent's payment method.
          #
          # If you provide a Customer with the PaymentIntent, you can use this parameter to [attach the payment method](/payments/save-during-payment) to the Customer after the PaymentIntent is confirmed and the customer completes any required actions. If you don't provide a Customer, you can still [attach](/api/payment_methods/attach) the payment method to a Customer after the transaction completes.
          #
          # If the payment method is `card_present` and isn't a digital wallet, Stripe creates and attaches a [generated_card](/api/charges/object#charge_object-payment_method_details-card_present-generated_card) payment method representing the card to the Customer instead.
          #
          # When processing card payments, Stripe uses `setup_future_usage` to help you comply with regional legislation and network rules, such as [SCA](/strong-customer-authentication).
          attr_reader :setup_future_usage
        end

        class Sofort < Stripe::StripeObject
          # Indicates that you intend to make future payments with this PaymentIntent's payment method.
          #
          # If you provide a Customer with the PaymentIntent, you can use this parameter to [attach the payment method](/payments/save-during-payment) to the Customer after the PaymentIntent is confirmed and the customer completes any required actions. If you don't provide a Customer, you can still [attach](/api/payment_methods/attach) the payment method to a Customer after the transaction completes.
          #
          # If the payment method is `card_present` and isn't a digital wallet, Stripe creates and attaches a [generated_card](/api/charges/object#charge_object-payment_method_details-card_present-generated_card) payment method representing the card to the Customer instead.
          #
          # When processing card payments, Stripe uses `setup_future_usage` to help you comply with regional legislation and network rules, such as [SCA](/strong-customer-authentication).
          attr_reader :setup_future_usage
        end

        class Swish < Stripe::StripeObject
          # The order reference that will be displayed to customers in the Swish application. Defaults to the `id` of the Payment Intent.
          attr_reader :reference
        end

        class UsBankAccount < Stripe::StripeObject
          class FinancialConnections < Stripe::StripeObject
            class Filters < Stripe::StripeObject
              # The account subcategories to use to filter for possible accounts to link. Valid subcategories are `checking` and `savings`.
              attr_reader :account_subcategories
              # The institution to use to filter for possible accounts to link.
              attr_reader :institution
            end

            class ManualEntry < Stripe::StripeObject
              # Settings for configuring manual entry of account details.
              attr_reader :mode
            end
            # Attribute for field filters
            attr_reader :filters
            # Attribute for field manual_entry
            attr_reader :manual_entry
            # The list of permissions to request. The `payment_method` permission must be included.
            attr_reader :permissions
            # Data features requested to be retrieved upon account creation.
            attr_reader :prefetch
            # For webview integrations only. Upon completing OAuth login in the native browser, the user will be redirected to this URL to return to your app.
            attr_reader :return_url
          end
          # Attribute for field financial_connections
          attr_reader :financial_connections
          # Indicates that you intend to make future payments with this PaymentIntent's payment method.
          #
          # If you provide a Customer with the PaymentIntent, you can use this parameter to [attach the payment method](/payments/save-during-payment) to the Customer after the PaymentIntent is confirmed and the customer completes any required actions. If you don't provide a Customer, you can still [attach](/api/payment_methods/attach) the payment method to a Customer after the transaction completes.
          #
          # If the payment method is `card_present` and isn't a digital wallet, Stripe creates and attaches a [generated_card](/api/charges/object#charge_object-payment_method_details-card_present-generated_card) payment method representing the card to the Customer instead.
          #
          # When processing card payments, Stripe uses `setup_future_usage` to help you comply with regional legislation and network rules, such as [SCA](/strong-customer-authentication).
          attr_reader :setup_future_usage
          # Bank account verification method.
          attr_reader :verification_method
        end
        # Attribute for field acss_debit
        attr_reader :acss_debit
        # Attribute for field affirm
        attr_reader :affirm
        # Attribute for field afterpay_clearpay
        attr_reader :afterpay_clearpay
        # Attribute for field alipay
        attr_reader :alipay
        # Attribute for field amazon_pay
        attr_reader :amazon_pay
        # Attribute for field au_becs_debit
        attr_reader :au_becs_debit
        # Attribute for field bacs_debit
        attr_reader :bacs_debit
        # Attribute for field bancontact
        attr_reader :bancontact
        # Attribute for field boleto
        attr_reader :boleto
        # Attribute for field card
        attr_reader :card
        # Attribute for field cashapp
        attr_reader :cashapp
        # Attribute for field customer_balance
        attr_reader :customer_balance
        # Attribute for field eps
        attr_reader :eps
        # Attribute for field fpx
        attr_reader :fpx
        # Attribute for field giropay
        attr_reader :giropay
        # Attribute for field grabpay
        attr_reader :grabpay
        # Attribute for field ideal
        attr_reader :ideal
        # Attribute for field kakao_pay
        attr_reader :kakao_pay
        # Attribute for field klarna
        attr_reader :klarna
        # Attribute for field konbini
        attr_reader :konbini
        # Attribute for field kr_card
        attr_reader :kr_card
        # Attribute for field link
        attr_reader :link
        # Attribute for field mobilepay
        attr_reader :mobilepay
        # Attribute for field multibanco
        attr_reader :multibanco
        # Attribute for field naver_pay
        attr_reader :naver_pay
        # Attribute for field oxxo
        attr_reader :oxxo
        # Attribute for field p24
        attr_reader :p24
        # Attribute for field payco
        attr_reader :payco
        # Attribute for field paynow
        attr_reader :paynow
        # Attribute for field paypal
        attr_reader :paypal
        # Attribute for field payto
        attr_reader :payto
        # Attribute for field pix
        attr_reader :pix
        # Attribute for field revolut_pay
        attr_reader :revolut_pay
        # Attribute for field samsung_pay
        attr_reader :samsung_pay
        # Attribute for field sepa_debit
        attr_reader :sepa_debit
        # Attribute for field sofort
        attr_reader :sofort
        # Attribute for field swish
        attr_reader :swish
        # Attribute for field us_bank_account
        attr_reader :us_bank_account
      end

      class Permissions < Stripe::StripeObject
        class Update < Stripe::StripeObject
          # Determines which entity is allowed to update the line items.
          #
          # Default is `client_only`. Stripe Checkout client will automatically update the line items. If set to `server_only`, only your server is allowed to update the line items.
          #
          # When set to `server_only`, you must add the onLineItemsChange event handler when initializing the Stripe Checkout client and manually update the line items from your server using the Stripe API.
          attr_reader :line_items
          # Determines which entity is allowed to update the shipping details.
          #
          # Default is `client_only`. Stripe Checkout client will automatically update the shipping details. If set to `server_only`, only your server is allowed to update the shipping details.
          #
          # When set to `server_only`, you must add the onShippingDetailsChange event handler when initializing the Stripe Checkout client and manually update the shipping details from your server using the Stripe API.
          attr_reader :shipping_details
        end
        # Permissions for updating the Checkout Session.
        attr_reader :update
      end

      class PhoneNumberCollection < Stripe::StripeObject
        # Indicates whether phone number collection is enabled for the session
        attr_reader :enabled
      end

      class SavedPaymentMethodOptions < Stripe::StripeObject
        # Uses the `allow_redisplay` value of each saved payment method to filter the set presented to a returning customer. By default, only saved payment methods with ’allow_redisplay: ‘always’ are shown in Checkout.
        attr_reader :allow_redisplay_filters
        # Enable customers to choose if they wish to remove their saved payment methods. Disabled by default.
        attr_reader :payment_method_remove
        # Enable customers to choose if they wish to save their payment method for future use. Disabled by default.
        attr_reader :payment_method_save
      end

      class ShippingAddressCollection < Stripe::StripeObject
        # An array of two-letter ISO country codes representing which countries Checkout should provide as options for
        # shipping locations. Unsupported country codes: `AS, CX, CC, CU, HM, IR, KP, MH, FM, NF, MP, PW, SY, UM, VI`.
        attr_reader :allowed_countries
      end

      class ShippingCost < Stripe::StripeObject
        class Tax < Stripe::StripeObject
          # Amount of tax applied for this rate.
          attr_reader :amount
          # Tax rates can be applied to [invoices](https://stripe.com/docs/billing/invoices/tax-rates), [subscriptions](https://stripe.com/docs/billing/subscriptions/taxes) and [Checkout Sessions](https://stripe.com/docs/payments/checkout/set-up-a-subscription#tax-rates) to collect tax.
          #
          # Related guide: [Tax rates](https://stripe.com/docs/billing/taxes/tax-rates)
          attr_reader :rate
          # The reasoning behind this tax, for example, if the product is tax exempt. The possible values for this field may be extended as new tax rules are supported.
          attr_reader :taxability_reason
          # The amount on which tax is calculated, in cents (or local equivalent).
          attr_reader :taxable_amount
        end
        # Total shipping cost before any discounts or taxes are applied.
        attr_reader :amount_subtotal
        # Total tax amount applied due to shipping costs. If no tax was applied, defaults to 0.
        attr_reader :amount_tax
        # Total shipping cost after discounts and taxes are applied.
        attr_reader :amount_total
        # The ID of the ShippingRate for this order.
        attr_reader :shipping_rate
        # The taxes applied to the shipping rate.
        attr_reader :taxes
      end

      class ShippingDetails < Stripe::StripeObject
        class Address < Stripe::StripeObject
          # City, district, suburb, town, or village.
          attr_reader :city
          # Two-letter country code ([ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2)).
          attr_reader :country
          # Address line 1 (e.g., street, PO Box, or company name).
          attr_reader :line1
          # Address line 2 (e.g., apartment, suite, unit, or building).
          attr_reader :line2
          # ZIP or postal code.
          attr_reader :postal_code
          # State, county, province, or region.
          attr_reader :state
        end
        # Attribute for field address
        attr_reader :address
        # The delivery service that shipped a physical product, such as Fedex, UPS, USPS, etc.
        attr_reader :carrier
        # Recipient name.
        attr_reader :name
        # Recipient phone (including extension).
        attr_reader :phone
        # The tracking number for a physical product, obtained from the delivery service. If multiple tracking numbers were generated for this purchase, please separate them with commas.
        attr_reader :tracking_number
      end

      class ShippingOption < Stripe::StripeObject
        # A non-negative integer in cents representing how much to charge.
        attr_reader :shipping_amount
        # The shipping rate.
        attr_reader :shipping_rate
      end

      class TaxIdCollection < Stripe::StripeObject
        # Indicates whether tax ID collection is enabled for the session
        attr_reader :enabled
        # Indicates whether a tax ID is required on the payment page
        attr_reader :required
      end

      class TotalDetails < Stripe::StripeObject
        class Breakdown < Stripe::StripeObject
          class Discount < Stripe::StripeObject
            # The amount discounted.
            attr_reader :amount
            # A discount represents the actual application of a [coupon](https://stripe.com/docs/api#coupons) or [promotion code](https://stripe.com/docs/api#promotion_codes).
            # It contains information about when the discount began, when it will end, and what it is applied to.
            #
            # Related guide: [Applying discounts to subscriptions](https://stripe.com/docs/billing/subscriptions/discounts)
            attr_reader :discount
          end

          class Tax < Stripe::StripeObject
            # Amount of tax applied for this rate.
            attr_reader :amount
            # Tax rates can be applied to [invoices](https://stripe.com/docs/billing/invoices/tax-rates), [subscriptions](https://stripe.com/docs/billing/subscriptions/taxes) and [Checkout Sessions](https://stripe.com/docs/payments/checkout/set-up-a-subscription#tax-rates) to collect tax.
            #
            # Related guide: [Tax rates](https://stripe.com/docs/billing/taxes/tax-rates)
            attr_reader :rate
            # The reasoning behind this tax, for example, if the product is tax exempt. The possible values for this field may be extended as new tax rules are supported.
            attr_reader :taxability_reason
            # The amount on which tax is calculated, in cents (or local equivalent).
            attr_reader :taxable_amount
          end
          # The aggregated discounts.
          attr_reader :discounts
          # The aggregated tax amounts by rate.
          attr_reader :taxes
        end
        # This is the sum of all the discounts.
        attr_reader :amount_discount
        # This is the sum of all the shipping amounts.
        attr_reader :amount_shipping
        # This is the sum of all the tax amounts.
        attr_reader :amount_tax
        # Attribute for field breakdown
        attr_reader :breakdown
      end

      class ListParams < Stripe::RequestParams
        class Created < Stripe::RequestParams
          # Minimum value to filter by (exclusive)
          attr_accessor :gt
          # Minimum value to filter by (inclusive)
          attr_accessor :gte
          # Maximum value to filter by (exclusive)
          attr_accessor :lt
          # Maximum value to filter by (inclusive)
          attr_accessor :lte

          def initialize(gt: nil, gte: nil, lt: nil, lte: nil)
            @gt = gt
            @gte = gte
            @lt = lt
            @lte = lte
          end
        end

        class CustomerDetails < Stripe::RequestParams
          # Customer's email address.
          attr_accessor :email

          def initialize(email: nil)
            @email = email
          end
        end
        # Only return Checkout Sessions that were created during the given date interval.
        attr_accessor :created
        # Only return the Checkout Sessions for the Customer specified.
        attr_accessor :customer
        # Only return the Checkout Sessions for the Customer details specified.
        attr_accessor :customer_details
        # A cursor for use in pagination. `ending_before` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, starting with `obj_bar`, your subsequent call can include `ending_before=obj_bar` in order to fetch the previous page of the list.
        attr_accessor :ending_before
        # Specifies which fields in the response should be expanded.
        attr_accessor :expand
        # A limit on the number of objects to be returned. Limit can range between 1 and 100, and the default is 10.
        attr_accessor :limit
        # Only return the Checkout Session for the PaymentIntent specified.
        attr_accessor :payment_intent
        # Only return the Checkout Sessions for the Payment Link specified.
        attr_accessor :payment_link
        # A cursor for use in pagination. `starting_after` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, ending with `obj_foo`, your subsequent call can include `starting_after=obj_foo` in order to fetch the next page of the list.
        attr_accessor :starting_after
        # Only return the Checkout Sessions matching the given status.
        attr_accessor :status
        # Only return the Checkout Session for the subscription specified.
        attr_accessor :subscription

        def initialize(
          created: nil,
          customer: nil,
          customer_details: nil,
          ending_before: nil,
          expand: nil,
          limit: nil,
          payment_intent: nil,
          payment_link: nil,
          starting_after: nil,
          status: nil,
          subscription: nil
        )
          @created = created
          @customer = customer
          @customer_details = customer_details
          @ending_before = ending_before
          @expand = expand
          @limit = limit
          @payment_intent = payment_intent
          @payment_link = payment_link
          @starting_after = starting_after
          @status = status
          @subscription = subscription
        end
      end

      class CreateParams < Stripe::RequestParams
        class AdaptivePricing < Stripe::RequestParams
          # Set to `true` to enable [Adaptive Pricing](https://docs.stripe.com/payments/checkout/adaptive-pricing). Defaults to your [dashboard setting](https://dashboard.stripe.com/settings/adaptive-pricing).
          attr_accessor :enabled

          def initialize(enabled: nil)
            @enabled = enabled
          end
        end

        class AfterExpiration < Stripe::RequestParams
          class Recovery < Stripe::RequestParams
            # Enables user redeemable promotion codes on the recovered Checkout Sessions. Defaults to `false`
            attr_accessor :allow_promotion_codes
            # If `true`, a recovery URL will be generated to recover this Checkout Session if it
            # expires before a successful transaction is completed. It will be attached to the
            # Checkout Session object upon expiration.
            attr_accessor :enabled

            def initialize(allow_promotion_codes: nil, enabled: nil)
              @allow_promotion_codes = allow_promotion_codes
              @enabled = enabled
            end
          end
          # Configure a Checkout Session that can be used to recover an expired session.
          attr_accessor :recovery

          def initialize(recovery: nil)
            @recovery = recovery
          end
        end

        class AutomaticTax < Stripe::RequestParams
          class Liability < Stripe::RequestParams
            # The connected account being referenced when `type` is `account`.
            attr_accessor :account
            # Type of the account referenced in the request.
            attr_accessor :type

            def initialize(account: nil, type: nil)
              @account = account
              @type = type
            end
          end
          # Set to `true` to [calculate tax automatically](https://docs.stripe.com/tax) using the customer's location.
          #
          # Enabling this parameter causes Checkout to collect any billing address information necessary for tax calculation.
          attr_accessor :enabled
          # The account that's liable for tax. If set, the business address and tax registrations required to perform the tax calculation are loaded from this account. The tax transaction is returned in the report of the connected account.
          attr_accessor :liability

          def initialize(enabled: nil, liability: nil)
            @enabled = enabled
            @liability = liability
          end
        end

        class ConsentCollection < Stripe::RequestParams
          class PaymentMethodReuseAgreement < Stripe::RequestParams
            # Determines the position and visibility of the payment method reuse agreement in the UI. When set to `auto`, Stripe's
            # defaults will be used. When set to `hidden`, the payment method reuse agreement text will always be hidden in the UI.
            attr_accessor :position

            def initialize(position: nil)
              @position = position
            end
          end
          # Determines the display of payment method reuse agreement text in the UI. If set to `hidden`, it will hide legal text related to the reuse of a payment method.
          attr_accessor :payment_method_reuse_agreement
          # If set to `auto`, enables the collection of customer consent for promotional communications. The Checkout
          # Session will determine whether to display an option to opt into promotional communication
          # from the merchant depending on the customer's locale. Only available to US merchants.
          attr_accessor :promotions
          # If set to `required`, it requires customers to check a terms of service checkbox before being able to pay.
          # There must be a valid terms of service URL set in your [Dashboard settings](https://dashboard.stripe.com/settings/public).
          attr_accessor :terms_of_service

          def initialize(
            payment_method_reuse_agreement: nil,
            promotions: nil,
            terms_of_service: nil
          )
            @payment_method_reuse_agreement = payment_method_reuse_agreement
            @promotions = promotions
            @terms_of_service = terms_of_service
          end
        end

        class CustomField < Stripe::RequestParams
          class Dropdown < Stripe::RequestParams
            class Option < Stripe::RequestParams
              # The label for the option, displayed to the customer. Up to 100 characters.
              attr_accessor :label
              # The value for this option, not displayed to the customer, used by your integration to reconcile the option selected by the customer. Must be unique to this option, alphanumeric, and up to 100 characters.
              attr_accessor :value

              def initialize(label: nil, value: nil)
                @label = label
                @value = value
              end
            end
            # The value that will pre-fill the field on the payment page.Must match a `value` in the `options` array.
            attr_accessor :default_value
            # The options available for the customer to select. Up to 200 options allowed.
            attr_accessor :options

            def initialize(default_value: nil, options: nil)
              @default_value = default_value
              @options = options
            end
          end

          class Label < Stripe::RequestParams
            # Custom text for the label, displayed to the customer. Up to 50 characters.
            attr_accessor :custom
            # The type of the label.
            attr_accessor :type

            def initialize(custom: nil, type: nil)
              @custom = custom
              @type = type
            end
          end

          class Numeric < Stripe::RequestParams
            # The value that will pre-fill the field on the payment page.
            attr_accessor :default_value
            # The maximum character length constraint for the customer's input.
            attr_accessor :maximum_length
            # The minimum character length requirement for the customer's input.
            attr_accessor :minimum_length

            def initialize(default_value: nil, maximum_length: nil, minimum_length: nil)
              @default_value = default_value
              @maximum_length = maximum_length
              @minimum_length = minimum_length
            end
          end

          class Text < Stripe::RequestParams
            # The value that will pre-fill the field on the payment page.
            attr_accessor :default_value
            # The maximum character length constraint for the customer's input.
            attr_accessor :maximum_length
            # The minimum character length requirement for the customer's input.
            attr_accessor :minimum_length

            def initialize(default_value: nil, maximum_length: nil, minimum_length: nil)
              @default_value = default_value
              @maximum_length = maximum_length
              @minimum_length = minimum_length
            end
          end
          # Configuration for `type=dropdown` fields.
          attr_accessor :dropdown
          # String of your choice that your integration can use to reconcile this field. Must be unique to this field, alphanumeric, and up to 200 characters.
          attr_accessor :key
          # The label for the field, displayed to the customer.
          attr_accessor :label
          # Configuration for `type=numeric` fields.
          attr_accessor :numeric
          # Whether the customer is required to complete the field before completing the Checkout Session. Defaults to `false`.
          attr_accessor :optional
          # Configuration for `type=text` fields.
          attr_accessor :text
          # The type of the field.
          attr_accessor :type

          def initialize(
            dropdown: nil,
            key: nil,
            label: nil,
            numeric: nil,
            optional: nil,
            text: nil,
            type: nil
          )
            @dropdown = dropdown
            @key = key
            @label = label
            @numeric = numeric
            @optional = optional
            @text = text
            @type = type
          end
        end

        class CustomText < Stripe::RequestParams
          class AfterSubmit < Stripe::RequestParams
            # Text may be up to 1200 characters in length.
            attr_accessor :message

            def initialize(message: nil)
              @message = message
            end
          end

          class ShippingAddress < Stripe::RequestParams
            # Text may be up to 1200 characters in length.
            attr_accessor :message

            def initialize(message: nil)
              @message = message
            end
          end

          class Submit < Stripe::RequestParams
            # Text may be up to 1200 characters in length.
            attr_accessor :message

            def initialize(message: nil)
              @message = message
            end
          end

          class TermsOfServiceAcceptance < Stripe::RequestParams
            # Text may be up to 1200 characters in length.
            attr_accessor :message

            def initialize(message: nil)
              @message = message
            end
          end
          # Custom text that should be displayed after the payment confirmation button.
          attr_accessor :after_submit
          # Custom text that should be displayed alongside shipping address collection.
          attr_accessor :shipping_address
          # Custom text that should be displayed alongside the payment confirmation button.
          attr_accessor :submit
          # Custom text that should be displayed in place of the default terms of service agreement text.
          attr_accessor :terms_of_service_acceptance

          def initialize(
            after_submit: nil,
            shipping_address: nil,
            submit: nil,
            terms_of_service_acceptance: nil
          )
            @after_submit = after_submit
            @shipping_address = shipping_address
            @submit = submit
            @terms_of_service_acceptance = terms_of_service_acceptance
          end
        end

        class CustomerUpdate < Stripe::RequestParams
          # Describes whether Checkout saves the billing address onto `customer.address`.
          # To always collect a full billing address, use `billing_address_collection`. Defaults to `never`.
          attr_accessor :address
          # Describes whether Checkout saves the name onto `customer.name`. Defaults to `never`.
          attr_accessor :name
          # Describes whether Checkout saves shipping information onto `customer.shipping`.
          # To collect shipping information, use `shipping_address_collection`. Defaults to `never`.
          attr_accessor :shipping

          def initialize(address: nil, name: nil, shipping: nil)
            @address = address
            @name = name
            @shipping = shipping
          end
        end

        class Discount < Stripe::RequestParams
          # The ID of the coupon to apply to this Session.
          attr_accessor :coupon
          # The ID of a promotion code to apply to this Session.
          attr_accessor :promotion_code

          def initialize(coupon: nil, promotion_code: nil)
            @coupon = coupon
            @promotion_code = promotion_code
          end
        end

        class InvoiceCreation < Stripe::RequestParams
          class InvoiceData < Stripe::RequestParams
            class CustomField < Stripe::RequestParams
              # The name of the custom field. This may be up to 40 characters.
              attr_accessor :name
              # The value of the custom field. This may be up to 140 characters.
              attr_accessor :value

              def initialize(name: nil, value: nil)
                @name = name
                @value = value
              end
            end

            class Issuer < Stripe::RequestParams
              # The connected account being referenced when `type` is `account`.
              attr_accessor :account
              # Type of the account referenced in the request.
              attr_accessor :type

              def initialize(account: nil, type: nil)
                @account = account
                @type = type
              end
            end

            class RenderingOptions < Stripe::RequestParams
              # How line-item prices and amounts will be displayed with respect to tax on invoice PDFs. One of `exclude_tax` or `include_inclusive_tax`. `include_inclusive_tax` will include inclusive tax (and exclude exclusive tax) in invoice PDF amounts. `exclude_tax` will exclude all tax (inclusive and exclusive alike) from invoice PDF amounts.
              attr_accessor :amount_tax_display

              def initialize(amount_tax_display: nil)
                @amount_tax_display = amount_tax_display
              end
            end
            # The account tax IDs associated with the invoice.
            attr_accessor :account_tax_ids
            # Default custom fields to be displayed on invoices for this customer.
            attr_accessor :custom_fields
            # An arbitrary string attached to the object. Often useful for displaying to users.
            attr_accessor :description
            # Default footer to be displayed on invoices for this customer.
            attr_accessor :footer
            # The connected account that issues the invoice. The invoice is presented with the branding and support information of the specified account.
            attr_accessor :issuer
            # Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format. Individual keys can be unset by posting an empty value to them. All keys can be unset by posting an empty value to `metadata`.
            attr_accessor :metadata
            # Default options for invoice PDF rendering for this customer.
            attr_accessor :rendering_options

            def initialize(
              account_tax_ids: nil,
              custom_fields: nil,
              description: nil,
              footer: nil,
              issuer: nil,
              metadata: nil,
              rendering_options: nil
            )
              @account_tax_ids = account_tax_ids
              @custom_fields = custom_fields
              @description = description
              @footer = footer
              @issuer = issuer
              @metadata = metadata
              @rendering_options = rendering_options
            end
          end
          # Set to `true` to enable invoice creation.
          attr_accessor :enabled
          # Parameters passed when creating invoices for payment-mode Checkout Sessions.
          attr_accessor :invoice_data

          def initialize(enabled: nil, invoice_data: nil)
            @enabled = enabled
            @invoice_data = invoice_data
          end
        end

        class LineItem < Stripe::RequestParams
          class AdjustableQuantity < Stripe::RequestParams
            # Set to true if the quantity can be adjusted to any non-negative integer.
            attr_accessor :enabled
            # The maximum quantity the customer can purchase for the Checkout Session. By default this value is 99. You can specify a value up to 999999.
            attr_accessor :maximum
            # The minimum quantity the customer must purchase for the Checkout Session. By default this value is 0.
            attr_accessor :minimum

            def initialize(enabled: nil, maximum: nil, minimum: nil)
              @enabled = enabled
              @maximum = maximum
              @minimum = minimum
            end
          end

          class PriceData < Stripe::RequestParams
            class ProductData < Stripe::RequestParams
              # The product's description, meant to be displayable to the customer. Use this field to optionally store a long form explanation of the product being sold for your own rendering purposes.
              attr_accessor :description
              # A list of up to 8 URLs of images for this product, meant to be displayable to the customer.
              attr_accessor :images
              # Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format. Individual keys can be unset by posting an empty value to them. All keys can be unset by posting an empty value to `metadata`.
              attr_accessor :metadata
              # The product's name, meant to be displayable to the customer.
              attr_accessor :name
              # A [tax code](https://stripe.com/docs/tax/tax-categories) ID.
              attr_accessor :tax_code

              def initialize(description: nil, images: nil, metadata: nil, name: nil, tax_code: nil)
                @description = description
                @images = images
                @metadata = metadata
                @name = name
                @tax_code = tax_code
              end
            end

            class Recurring < Stripe::RequestParams
              # Specifies billing frequency. Either `day`, `week`, `month` or `year`.
              attr_accessor :interval
              # The number of intervals between subscription billings. For example, `interval=month` and `interval_count=3` bills every 3 months. Maximum of three years interval allowed (3 years, 36 months, or 156 weeks).
              attr_accessor :interval_count

              def initialize(interval: nil, interval_count: nil)
                @interval = interval
                @interval_count = interval_count
              end
            end
            # Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies).
            attr_accessor :currency
            # The ID of the product that this price will belong to. One of `product` or `product_data` is required.
            attr_accessor :product
            # Data used to generate a new product object inline. One of `product` or `product_data` is required.
            attr_accessor :product_data
            # The recurring components of a price such as `interval` and `interval_count`.
            attr_accessor :recurring
            # Only required if a [default tax behavior](https://stripe.com/docs/tax/products-prices-tax-categories-tax-behavior#setting-a-default-tax-behavior-(recommended)) was not provided in the Stripe Tax settings. Specifies whether the price is considered inclusive of taxes or exclusive of taxes. One of `inclusive`, `exclusive`, or `unspecified`. Once specified as either `inclusive` or `exclusive`, it cannot be changed.
            attr_accessor :tax_behavior
            # A non-negative integer in cents (or local equivalent) representing how much to charge. One of `unit_amount` or `unit_amount_decimal` is required.
            attr_accessor :unit_amount
            # Same as `unit_amount`, but accepts a decimal value in cents (or local equivalent) with at most 12 decimal places. Only one of `unit_amount` and `unit_amount_decimal` can be set.
            attr_accessor :unit_amount_decimal

            def initialize(
              currency: nil,
              product: nil,
              product_data: nil,
              recurring: nil,
              tax_behavior: nil,
              unit_amount: nil,
              unit_amount_decimal: nil
            )
              @currency = currency
              @product = product
              @product_data = product_data
              @recurring = recurring
              @tax_behavior = tax_behavior
              @unit_amount = unit_amount
              @unit_amount_decimal = unit_amount_decimal
            end
          end
          # When set, provides configuration for this item’s quantity to be adjusted by the customer during Checkout.
          attr_accessor :adjustable_quantity
          # The [tax rates](https://stripe.com/docs/api/tax_rates) that will be applied to this line item depending on the customer's billing/shipping address. We currently support the following countries: US, GB, AU, and all countries in the EU.
          attr_accessor :dynamic_tax_rates
          # Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format. Individual keys can be unset by posting an empty value to them. All keys can be unset by posting an empty value to `metadata`.
          attr_accessor :metadata
          # The ID of the [Price](https://stripe.com/docs/api/prices) or [Plan](https://stripe.com/docs/api/plans) object. One of `price` or `price_data` is required.
          attr_accessor :price
          # Data used to generate a new [Price](https://stripe.com/docs/api/prices) object inline. One of `price` or `price_data` is required.
          attr_accessor :price_data
          # The quantity of the line item being purchased. Quantity should not be defined when `recurring.usage_type=metered`.
          attr_accessor :quantity
          # The [tax rates](https://stripe.com/docs/api/tax_rates) which apply to this line item.
          attr_accessor :tax_rates

          def initialize(
            adjustable_quantity: nil,
            dynamic_tax_rates: nil,
            metadata: nil,
            price: nil,
            price_data: nil,
            quantity: nil,
            tax_rates: nil
          )
            @adjustable_quantity = adjustable_quantity
            @dynamic_tax_rates = dynamic_tax_rates
            @metadata = metadata
            @price = price
            @price_data = price_data
            @quantity = quantity
            @tax_rates = tax_rates
          end
        end

        class PaymentIntentData < Stripe::RequestParams
          class Shipping < Stripe::RequestParams
            class Address < Stripe::RequestParams
              # City, district, suburb, town, or village.
              attr_accessor :city
              # Two-letter country code ([ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2)).
              attr_accessor :country
              # Address line 1 (e.g., street, PO Box, or company name).
              attr_accessor :line1
              # Address line 2 (e.g., apartment, suite, unit, or building).
              attr_accessor :line2
              # ZIP or postal code.
              attr_accessor :postal_code
              # State, county, province, or region.
              attr_accessor :state

              def initialize(
                city: nil,
                country: nil,
                line1: nil,
                line2: nil,
                postal_code: nil,
                state: nil
              )
                @city = city
                @country = country
                @line1 = line1
                @line2 = line2
                @postal_code = postal_code
                @state = state
              end
            end
            # Shipping address.
            attr_accessor :address
            # The delivery service that shipped a physical product, such as Fedex, UPS, USPS, etc.
            attr_accessor :carrier
            # Recipient name.
            attr_accessor :name
            # Recipient phone (including extension).
            attr_accessor :phone
            # The tracking number for a physical product, obtained from the delivery service. If multiple tracking numbers were generated for this purchase, please separate them with commas.
            attr_accessor :tracking_number

            def initialize(address: nil, carrier: nil, name: nil, phone: nil, tracking_number: nil)
              @address = address
              @carrier = carrier
              @name = name
              @phone = phone
              @tracking_number = tracking_number
            end
          end

          class TransferData < Stripe::RequestParams
            # The amount that will be transferred automatically when a charge succeeds.
            attr_accessor :amount
            # If specified, successful charges will be attributed to the destination
            # account for tax reporting, and the funds from charges will be transferred
            # to the destination account. The ID of the resulting transfer will be
            # returned on the successful charge's `transfer` field.
            attr_accessor :destination

            def initialize(amount: nil, destination: nil)
              @amount = amount
              @destination = destination
            end
          end
          # The amount of the application fee (if any) that will be requested to be applied to the payment and transferred to the application owner's Stripe account. The amount of the application fee collected will be capped at the total payment amount. For more information, see the PaymentIntents [use case for connected accounts](https://stripe.com/docs/payments/connected-accounts).
          attr_accessor :application_fee_amount
          # Controls when the funds will be captured from the customer's account.
          attr_accessor :capture_method
          # An arbitrary string attached to the object. Often useful for displaying to users.
          attr_accessor :description
          # Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format. Individual keys can be unset by posting an empty value to them. All keys can be unset by posting an empty value to `metadata`.
          attr_accessor :metadata
          # The Stripe account ID for which these funds are intended. For details,
          # see the PaymentIntents [use case for connected
          # accounts](/docs/payments/connected-accounts).
          attr_accessor :on_behalf_of
          # Email address that the receipt for the resulting payment will be sent to. If `receipt_email` is specified for a payment in live mode, a receipt will be sent regardless of your [email settings](https://dashboard.stripe.com/account/emails).
          attr_accessor :receipt_email
          # Indicates that you intend to [make future payments](https://stripe.com/docs/payments/payment-intents#future-usage) with the payment
          # method collected by this Checkout Session.
          #
          # When setting this to `on_session`, Checkout will show a notice to the
          # customer that their payment details will be saved.
          #
          # When setting this to `off_session`, Checkout will show a notice to the
          # customer that their payment details will be saved and used for future
          # payments.
          #
          # If a Customer has been provided or Checkout creates a new Customer,
          # Checkout will attach the payment method to the Customer.
          #
          # If Checkout does not create a Customer, the payment method is not attached
          # to a Customer. To reuse the payment method, you can retrieve it from the
          # Checkout Session's PaymentIntent.
          #
          # When processing card payments, Checkout also uses `setup_future_usage`
          # to dynamically optimize your payment flow and comply with regional
          # legislation and network rules, such as SCA.
          attr_accessor :setup_future_usage
          # Shipping information for this payment.
          attr_accessor :shipping
          # Text that appears on the customer's statement as the statement descriptor for a non-card charge. This value overrides the account's default statement descriptor. For information about requirements, including the 22-character limit, see [the Statement Descriptor docs](https://docs.stripe.com/get-started/account/statement-descriptors).
          #
          # Setting this value for a card charge returns an error. For card charges, set the [statement_descriptor_suffix](https://docs.stripe.com/get-started/account/statement-descriptors#dynamic) instead.
          attr_accessor :statement_descriptor
          # Provides information about a card charge. Concatenated to the account's [statement descriptor prefix](https://docs.stripe.com/get-started/account/statement-descriptors#static) to form the complete statement descriptor that appears on the customer's statement.
          attr_accessor :statement_descriptor_suffix
          # The parameters used to automatically create a Transfer when the payment succeeds.
          # For more information, see the PaymentIntents [use case for connected accounts](https://stripe.com/docs/payments/connected-accounts).
          attr_accessor :transfer_data
          # A string that identifies the resulting payment as part of a group. See the PaymentIntents [use case for connected accounts](https://stripe.com/docs/connect/separate-charges-and-transfers) for details.
          attr_accessor :transfer_group

          def initialize(
            application_fee_amount: nil,
            capture_method: nil,
            description: nil,
            metadata: nil,
            on_behalf_of: nil,
            receipt_email: nil,
            setup_future_usage: nil,
            shipping: nil,
            statement_descriptor: nil,
            statement_descriptor_suffix: nil,
            transfer_data: nil,
            transfer_group: nil
          )
            @application_fee_amount = application_fee_amount
            @capture_method = capture_method
            @description = description
            @metadata = metadata
            @on_behalf_of = on_behalf_of
            @receipt_email = receipt_email
            @setup_future_usage = setup_future_usage
            @shipping = shipping
            @statement_descriptor = statement_descriptor
            @statement_descriptor_suffix = statement_descriptor_suffix
            @transfer_data = transfer_data
            @transfer_group = transfer_group
          end
        end

        class PaymentMethodData < Stripe::RequestParams
          # Allow redisplay will be set on the payment method on confirmation and indicates whether this payment method can be shown again to the customer in a checkout flow. Only set this field if you wish to override the allow_redisplay value determined by Checkout.
          attr_accessor :allow_redisplay

          def initialize(allow_redisplay: nil)
            @allow_redisplay = allow_redisplay
          end
        end

        class PaymentMethodOptions < Stripe::RequestParams
          class AcssDebit < Stripe::RequestParams
            class MandateOptions < Stripe::RequestParams
              # A URL for custom mandate text to render during confirmation step.
              # The URL will be rendered with additional GET parameters `payment_intent` and `payment_intent_client_secret` when confirming a Payment Intent,
              # or `setup_intent` and `setup_intent_client_secret` when confirming a Setup Intent.
              attr_accessor :custom_mandate_url
              # List of Stripe products where this mandate can be selected automatically. Only usable in `setup` mode.
              attr_accessor :default_for
              # Description of the mandate interval. Only required if 'payment_schedule' parameter is 'interval' or 'combined'.
              attr_accessor :interval_description
              # Payment schedule for the mandate.
              attr_accessor :payment_schedule
              # Transaction type of the mandate.
              attr_accessor :transaction_type

              def initialize(
                custom_mandate_url: nil,
                default_for: nil,
                interval_description: nil,
                payment_schedule: nil,
                transaction_type: nil
              )
                @custom_mandate_url = custom_mandate_url
                @default_for = default_for
                @interval_description = interval_description
                @payment_schedule = payment_schedule
                @transaction_type = transaction_type
              end
            end
            # Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies). This is only accepted for Checkout Sessions in `setup` mode.
            attr_accessor :currency
            # Additional fields for Mandate creation
            attr_accessor :mandate_options
            # Indicates that you intend to make future payments with this PaymentIntent's payment method.
            #
            # If you provide a Customer with the PaymentIntent, you can use this parameter to [attach the payment method](/payments/save-during-payment) to the Customer after the PaymentIntent is confirmed and the customer completes any required actions. If you don't provide a Customer, you can still [attach](/api/payment_methods/attach) the payment method to a Customer after the transaction completes.
            #
            # If the payment method is `card_present` and isn't a digital wallet, Stripe creates and attaches a [generated_card](/api/charges/object#charge_object-payment_method_details-card_present-generated_card) payment method representing the card to the Customer instead.
            #
            # When processing card payments, Stripe uses `setup_future_usage` to help you comply with regional legislation and network rules, such as [SCA](/strong-customer-authentication).
            attr_accessor :setup_future_usage
            # Verification method for the intent
            attr_accessor :verification_method

            def initialize(
              currency: nil,
              mandate_options: nil,
              setup_future_usage: nil,
              verification_method: nil
            )
              @currency = currency
              @mandate_options = mandate_options
              @setup_future_usage = setup_future_usage
              @verification_method = verification_method
            end
          end

          class Affirm < Stripe::RequestParams
            # Indicates that you intend to make future payments with this PaymentIntent's payment method.
            #
            # If you provide a Customer with the PaymentIntent, you can use this parameter to [attach the payment method](/payments/save-during-payment) to the Customer after the PaymentIntent is confirmed and the customer completes any required actions. If you don't provide a Customer, you can still [attach](/api/payment_methods/attach) the payment method to a Customer after the transaction completes.
            #
            # If the payment method is `card_present` and isn't a digital wallet, Stripe creates and attaches a [generated_card](/api/charges/object#charge_object-payment_method_details-card_present-generated_card) payment method representing the card to the Customer instead.
            #
            # When processing card payments, Stripe uses `setup_future_usage` to help you comply with regional legislation and network rules, such as [SCA](/strong-customer-authentication).
            attr_accessor :setup_future_usage

            def initialize(setup_future_usage: nil)
              @setup_future_usage = setup_future_usage
            end
          end

          class AfterpayClearpay < Stripe::RequestParams
            # Indicates that you intend to make future payments with this PaymentIntent's payment method.
            #
            # If you provide a Customer with the PaymentIntent, you can use this parameter to [attach the payment method](/payments/save-during-payment) to the Customer after the PaymentIntent is confirmed and the customer completes any required actions. If you don't provide a Customer, you can still [attach](/api/payment_methods/attach) the payment method to a Customer after the transaction completes.
            #
            # If the payment method is `card_present` and isn't a digital wallet, Stripe creates and attaches a [generated_card](/api/charges/object#charge_object-payment_method_details-card_present-generated_card) payment method representing the card to the Customer instead.
            #
            # When processing card payments, Stripe uses `setup_future_usage` to help you comply with regional legislation and network rules, such as [SCA](/strong-customer-authentication).
            attr_accessor :setup_future_usage

            def initialize(setup_future_usage: nil)
              @setup_future_usage = setup_future_usage
            end
          end

          class Alipay < Stripe::RequestParams
            # Indicates that you intend to make future payments with this PaymentIntent's payment method.
            #
            # If you provide a Customer with the PaymentIntent, you can use this parameter to [attach the payment method](/payments/save-during-payment) to the Customer after the PaymentIntent is confirmed and the customer completes any required actions. If you don't provide a Customer, you can still [attach](/api/payment_methods/attach) the payment method to a Customer after the transaction completes.
            #
            # If the payment method is `card_present` and isn't a digital wallet, Stripe creates and attaches a [generated_card](/api/charges/object#charge_object-payment_method_details-card_present-generated_card) payment method representing the card to the Customer instead.
            #
            # When processing card payments, Stripe uses `setup_future_usage` to help you comply with regional legislation and network rules, such as [SCA](/strong-customer-authentication).
            attr_accessor :setup_future_usage

            def initialize(setup_future_usage: nil)
              @setup_future_usage = setup_future_usage
            end
          end

          class AmazonPay < Stripe::RequestParams
            # Indicates that you intend to make future payments with this PaymentIntent's payment method.
            #
            # If you provide a Customer with the PaymentIntent, you can use this parameter to [attach the payment method](/payments/save-during-payment) to the Customer after the PaymentIntent is confirmed and the customer completes any required actions. If you don't provide a Customer, you can still [attach](/api/payment_methods/attach) the payment method to a Customer after the transaction completes.
            #
            # If the payment method is `card_present` and isn't a digital wallet, Stripe creates and attaches a [generated_card](/api/charges/object#charge_object-payment_method_details-card_present-generated_card) payment method representing the card to the Customer instead.
            #
            # When processing card payments, Stripe uses `setup_future_usage` to help you comply with regional legislation and network rules, such as [SCA](/strong-customer-authentication).
            attr_accessor :setup_future_usage

            def initialize(setup_future_usage: nil)
              @setup_future_usage = setup_future_usage
            end
          end

          class AuBecsDebit < Stripe::RequestParams
            # Indicates that you intend to make future payments with this PaymentIntent's payment method.
            #
            # If you provide a Customer with the PaymentIntent, you can use this parameter to [attach the payment method](/payments/save-during-payment) to the Customer after the PaymentIntent is confirmed and the customer completes any required actions. If you don't provide a Customer, you can still [attach](/api/payment_methods/attach) the payment method to a Customer after the transaction completes.
            #
            # If the payment method is `card_present` and isn't a digital wallet, Stripe creates and attaches a [generated_card](/api/charges/object#charge_object-payment_method_details-card_present-generated_card) payment method representing the card to the Customer instead.
            #
            # When processing card payments, Stripe uses `setup_future_usage` to help you comply with regional legislation and network rules, such as [SCA](/strong-customer-authentication).
            attr_accessor :setup_future_usage

            def initialize(setup_future_usage: nil)
              @setup_future_usage = setup_future_usage
            end
          end

          class BacsDebit < Stripe::RequestParams
            class MandateOptions < Stripe::RequestParams
              # Prefix used to generate the Mandate reference. Must be at most 12 characters long. Must consist of only uppercase letters, numbers, spaces, or the following special characters: '/', '_', '-', '&', '.'. Cannot begin with 'DDIC' or 'STRIPE'.
              attr_accessor :reference_prefix

              def initialize(reference_prefix: nil)
                @reference_prefix = reference_prefix
              end
            end
            # Additional fields for Mandate creation
            attr_accessor :mandate_options
            # Indicates that you intend to make future payments with this PaymentIntent's payment method.
            #
            # If you provide a Customer with the PaymentIntent, you can use this parameter to [attach the payment method](/payments/save-during-payment) to the Customer after the PaymentIntent is confirmed and the customer completes any required actions. If you don't provide a Customer, you can still [attach](/api/payment_methods/attach) the payment method to a Customer after the transaction completes.
            #
            # If the payment method is `card_present` and isn't a digital wallet, Stripe creates and attaches a [generated_card](/api/charges/object#charge_object-payment_method_details-card_present-generated_card) payment method representing the card to the Customer instead.
            #
            # When processing card payments, Stripe uses `setup_future_usage` to help you comply with regional legislation and network rules, such as [SCA](/strong-customer-authentication).
            attr_accessor :setup_future_usage

            def initialize(mandate_options: nil, setup_future_usage: nil)
              @mandate_options = mandate_options
              @setup_future_usage = setup_future_usage
            end
          end

          class Bancontact < Stripe::RequestParams
            # Indicates that you intend to make future payments with this PaymentIntent's payment method.
            #
            # If you provide a Customer with the PaymentIntent, you can use this parameter to [attach the payment method](/payments/save-during-payment) to the Customer after the PaymentIntent is confirmed and the customer completes any required actions. If you don't provide a Customer, you can still [attach](/api/payment_methods/attach) the payment method to a Customer after the transaction completes.
            #
            # If the payment method is `card_present` and isn't a digital wallet, Stripe creates and attaches a [generated_card](/api/charges/object#charge_object-payment_method_details-card_present-generated_card) payment method representing the card to the Customer instead.
            #
            # When processing card payments, Stripe uses `setup_future_usage` to help you comply with regional legislation and network rules, such as [SCA](/strong-customer-authentication).
            attr_accessor :setup_future_usage

            def initialize(setup_future_usage: nil)
              @setup_future_usage = setup_future_usage
            end
          end

          class Boleto < Stripe::RequestParams
            # The number of calendar days before a Boleto voucher expires. For example, if you create a Boleto voucher on Monday and you set expires_after_days to 2, the Boleto invoice will expire on Wednesday at 23:59 America/Sao_Paulo time.
            attr_accessor :expires_after_days
            # Indicates that you intend to make future payments with this PaymentIntent's payment method.
            #
            # If you provide a Customer with the PaymentIntent, you can use this parameter to [attach the payment method](/payments/save-during-payment) to the Customer after the PaymentIntent is confirmed and the customer completes any required actions. If you don't provide a Customer, you can still [attach](/api/payment_methods/attach) the payment method to a Customer after the transaction completes.
            #
            # If the payment method is `card_present` and isn't a digital wallet, Stripe creates and attaches a [generated_card](/api/charges/object#charge_object-payment_method_details-card_present-generated_card) payment method representing the card to the Customer instead.
            #
            # When processing card payments, Stripe uses `setup_future_usage` to help you comply with regional legislation and network rules, such as [SCA](/strong-customer-authentication).
            attr_accessor :setup_future_usage

            def initialize(expires_after_days: nil, setup_future_usage: nil)
              @expires_after_days = expires_after_days
              @setup_future_usage = setup_future_usage
            end
          end

          class Card < Stripe::RequestParams
            class Installments < Stripe::RequestParams
              # Setting to true enables installments for this Checkout Session.
              # Setting to false will prevent any installment plan from applying to a payment.
              attr_accessor :enabled

              def initialize(enabled: nil)
                @enabled = enabled
              end
            end
            # Installment options for card payments
            attr_accessor :installments
            # Request ability to [capture beyond the standard authorization validity window](/payments/extended-authorization) for this CheckoutSession.
            attr_accessor :request_decremental_authorization
            # Request ability to [capture beyond the standard authorization validity window](/payments/extended-authorization) for this CheckoutSession.
            attr_accessor :request_extended_authorization
            # Request ability to [increment the authorization](/payments/incremental-authorization) for this CheckoutSession.
            attr_accessor :request_incremental_authorization
            # Request ability to make [multiple captures](/payments/multicapture) for this CheckoutSession.
            attr_accessor :request_multicapture
            # Request ability to [overcapture](/payments/overcapture) for this CheckoutSession.
            attr_accessor :request_overcapture
            # We strongly recommend that you rely on our SCA Engine to automatically prompt your customers for authentication based on risk level and [other requirements](https://stripe.com/docs/strong-customer-authentication). However, if you wish to request 3D Secure based on logic from your own fraud engine, provide this option. If not provided, this value defaults to `automatic`. Read our guide on [manually requesting 3D Secure](https://stripe.com/docs/payments/3d-secure/authentication-flow#manual-three-ds) for more information on how this configuration interacts with Radar and our SCA Engine.
            attr_accessor :request_three_d_secure
            # Indicates that you intend to make future payments with this PaymentIntent's payment method.
            #
            # If you provide a Customer with the PaymentIntent, you can use this parameter to [attach the payment method](/payments/save-during-payment) to the Customer after the PaymentIntent is confirmed and the customer completes any required actions. If you don't provide a Customer, you can still [attach](/api/payment_methods/attach) the payment method to a Customer after the transaction completes.
            #
            # If the payment method is `card_present` and isn't a digital wallet, Stripe creates and attaches a [generated_card](/api/charges/object#charge_object-payment_method_details-card_present-generated_card) payment method representing the card to the Customer instead.
            #
            # When processing card payments, Stripe uses `setup_future_usage` to help you comply with regional legislation and network rules, such as [SCA](/strong-customer-authentication).
            attr_accessor :setup_future_usage
            # Provides information about a card payment that customers see on their statements. Concatenated with the Kana prefix (shortened Kana descriptor) or Kana statement descriptor that’s set on the account to form the complete statement descriptor. Maximum 22 characters. On card statements, the *concatenation* of both prefix and suffix (including separators) will appear truncated to 22 characters.
            attr_accessor :statement_descriptor_suffix_kana
            # Provides information about a card payment that customers see on their statements. Concatenated with the Kanji prefix (shortened Kanji descriptor) or Kanji statement descriptor that’s set on the account to form the complete statement descriptor. Maximum 17 characters. On card statements, the *concatenation* of both prefix and suffix (including separators) will appear truncated to 17 characters.
            attr_accessor :statement_descriptor_suffix_kanji

            def initialize(
              installments: nil,
              request_decremental_authorization: nil,
              request_extended_authorization: nil,
              request_incremental_authorization: nil,
              request_multicapture: nil,
              request_overcapture: nil,
              request_three_d_secure: nil,
              setup_future_usage: nil,
              statement_descriptor_suffix_kana: nil,
              statement_descriptor_suffix_kanji: nil
            )
              @installments = installments
              @request_decremental_authorization = request_decremental_authorization
              @request_extended_authorization = request_extended_authorization
              @request_incremental_authorization = request_incremental_authorization
              @request_multicapture = request_multicapture
              @request_overcapture = request_overcapture
              @request_three_d_secure = request_three_d_secure
              @setup_future_usage = setup_future_usage
              @statement_descriptor_suffix_kana = statement_descriptor_suffix_kana
              @statement_descriptor_suffix_kanji = statement_descriptor_suffix_kanji
            end
          end

          class Cashapp < Stripe::RequestParams
            # Indicates that you intend to make future payments with this PaymentIntent's payment method.
            #
            # If you provide a Customer with the PaymentIntent, you can use this parameter to [attach the payment method](/payments/save-during-payment) to the Customer after the PaymentIntent is confirmed and the customer completes any required actions. If you don't provide a Customer, you can still [attach](/api/payment_methods/attach) the payment method to a Customer after the transaction completes.
            #
            # If the payment method is `card_present` and isn't a digital wallet, Stripe creates and attaches a [generated_card](/api/charges/object#charge_object-payment_method_details-card_present-generated_card) payment method representing the card to the Customer instead.
            #
            # When processing card payments, Stripe uses `setup_future_usage` to help you comply with regional legislation and network rules, such as [SCA](/strong-customer-authentication).
            attr_accessor :setup_future_usage

            def initialize(setup_future_usage: nil)
              @setup_future_usage = setup_future_usage
            end
          end

          class CustomerBalance < Stripe::RequestParams
            class BankTransfer < Stripe::RequestParams
              class EuBankTransfer < Stripe::RequestParams
                # The desired country code of the bank account information. Permitted values include: `BE`, `DE`, `ES`, `FR`, `IE`, or `NL`.
                attr_accessor :country

                def initialize(country: nil)
                  @country = country
                end
              end
              # Configuration for eu_bank_transfer funding type.
              attr_accessor :eu_bank_transfer
              # List of address types that should be returned in the financial_addresses response. If not specified, all valid types will be returned.
              #
              # Permitted values include: `sort_code`, `zengin`, `iban`, or `spei`.
              attr_accessor :requested_address_types
              # The list of bank transfer types that this PaymentIntent is allowed to use for funding.
              attr_accessor :type

              def initialize(eu_bank_transfer: nil, requested_address_types: nil, type: nil)
                @eu_bank_transfer = eu_bank_transfer
                @requested_address_types = requested_address_types
                @type = type
              end
            end
            # Configuration for the bank transfer funding type, if the `funding_type` is set to `bank_transfer`.
            attr_accessor :bank_transfer
            # The funding method type to be used when there are not enough funds in the customer balance. Permitted values include: `bank_transfer`.
            attr_accessor :funding_type
            # Indicates that you intend to make future payments with this PaymentIntent's payment method.
            #
            # If you provide a Customer with the PaymentIntent, you can use this parameter to [attach the payment method](/payments/save-during-payment) to the Customer after the PaymentIntent is confirmed and the customer completes any required actions. If you don't provide a Customer, you can still [attach](/api/payment_methods/attach) the payment method to a Customer after the transaction completes.
            #
            # If the payment method is `card_present` and isn't a digital wallet, Stripe creates and attaches a [generated_card](/api/charges/object#charge_object-payment_method_details-card_present-generated_card) payment method representing the card to the Customer instead.
            #
            # When processing card payments, Stripe uses `setup_future_usage` to help you comply with regional legislation and network rules, such as [SCA](/strong-customer-authentication).
            attr_accessor :setup_future_usage

            def initialize(bank_transfer: nil, funding_type: nil, setup_future_usage: nil)
              @bank_transfer = bank_transfer
              @funding_type = funding_type
              @setup_future_usage = setup_future_usage
            end
          end

          class Eps < Stripe::RequestParams
            # Indicates that you intend to make future payments with this PaymentIntent's payment method.
            #
            # If you provide a Customer with the PaymentIntent, you can use this parameter to [attach the payment method](/payments/save-during-payment) to the Customer after the PaymentIntent is confirmed and the customer completes any required actions. If you don't provide a Customer, you can still [attach](/api/payment_methods/attach) the payment method to a Customer after the transaction completes.
            #
            # If the payment method is `card_present` and isn't a digital wallet, Stripe creates and attaches a [generated_card](/api/charges/object#charge_object-payment_method_details-card_present-generated_card) payment method representing the card to the Customer instead.
            #
            # When processing card payments, Stripe uses `setup_future_usage` to help you comply with regional legislation and network rules, such as [SCA](/strong-customer-authentication).
            attr_accessor :setup_future_usage

            def initialize(setup_future_usage: nil)
              @setup_future_usage = setup_future_usage
            end
          end

          class Fpx < Stripe::RequestParams
            # Indicates that you intend to make future payments with this PaymentIntent's payment method.
            #
            # If you provide a Customer with the PaymentIntent, you can use this parameter to [attach the payment method](/payments/save-during-payment) to the Customer after the PaymentIntent is confirmed and the customer completes any required actions. If you don't provide a Customer, you can still [attach](/api/payment_methods/attach) the payment method to a Customer after the transaction completes.
            #
            # If the payment method is `card_present` and isn't a digital wallet, Stripe creates and attaches a [generated_card](/api/charges/object#charge_object-payment_method_details-card_present-generated_card) payment method representing the card to the Customer instead.
            #
            # When processing card payments, Stripe uses `setup_future_usage` to help you comply with regional legislation and network rules, such as [SCA](/strong-customer-authentication).
            attr_accessor :setup_future_usage

            def initialize(setup_future_usage: nil)
              @setup_future_usage = setup_future_usage
            end
          end

          class Giropay < Stripe::RequestParams
            # Indicates that you intend to make future payments with this PaymentIntent's payment method.
            #
            # If you provide a Customer with the PaymentIntent, you can use this parameter to [attach the payment method](/payments/save-during-payment) to the Customer after the PaymentIntent is confirmed and the customer completes any required actions. If you don't provide a Customer, you can still [attach](/api/payment_methods/attach) the payment method to a Customer after the transaction completes.
            #
            # If the payment method is `card_present` and isn't a digital wallet, Stripe creates and attaches a [generated_card](/api/charges/object#charge_object-payment_method_details-card_present-generated_card) payment method representing the card to the Customer instead.
            #
            # When processing card payments, Stripe uses `setup_future_usage` to help you comply with regional legislation and network rules, such as [SCA](/strong-customer-authentication).
            attr_accessor :setup_future_usage

            def initialize(setup_future_usage: nil)
              @setup_future_usage = setup_future_usage
            end
          end

          class Grabpay < Stripe::RequestParams
            # Indicates that you intend to make future payments with this PaymentIntent's payment method.
            #
            # If you provide a Customer with the PaymentIntent, you can use this parameter to [attach the payment method](/payments/save-during-payment) to the Customer after the PaymentIntent is confirmed and the customer completes any required actions. If you don't provide a Customer, you can still [attach](/api/payment_methods/attach) the payment method to a Customer after the transaction completes.
            #
            # If the payment method is `card_present` and isn't a digital wallet, Stripe creates and attaches a [generated_card](/api/charges/object#charge_object-payment_method_details-card_present-generated_card) payment method representing the card to the Customer instead.
            #
            # When processing card payments, Stripe uses `setup_future_usage` to help you comply with regional legislation and network rules, such as [SCA](/strong-customer-authentication).
            attr_accessor :setup_future_usage

            def initialize(setup_future_usage: nil)
              @setup_future_usage = setup_future_usage
            end
          end

          class Ideal < Stripe::RequestParams
            # Indicates that you intend to make future payments with this PaymentIntent's payment method.
            #
            # If you provide a Customer with the PaymentIntent, you can use this parameter to [attach the payment method](/payments/save-during-payment) to the Customer after the PaymentIntent is confirmed and the customer completes any required actions. If you don't provide a Customer, you can still [attach](/api/payment_methods/attach) the payment method to a Customer after the transaction completes.
            #
            # If the payment method is `card_present` and isn't a digital wallet, Stripe creates and attaches a [generated_card](/api/charges/object#charge_object-payment_method_details-card_present-generated_card) payment method representing the card to the Customer instead.
            #
            # When processing card payments, Stripe uses `setup_future_usage` to help you comply with regional legislation and network rules, such as [SCA](/strong-customer-authentication).
            attr_accessor :setup_future_usage

            def initialize(setup_future_usage: nil)
              @setup_future_usage = setup_future_usage
            end
          end

          class KakaoPay < Stripe::RequestParams
            # Controls when the funds will be captured from the customer's account.
            attr_accessor :capture_method
            # Indicates that you intend to make future payments with this PaymentIntent's payment method.
            #
            # If you provide a Customer with the PaymentIntent, you can use this parameter to [attach the payment method](/payments/save-during-payment) to the Customer after the PaymentIntent is confirmed and the customer completes any required actions. If you don't provide a Customer, you can still [attach](/api/payment_methods/attach) the payment method to a Customer after the transaction completes.
            #
            # If the payment method is `card_present` and isn't a digital wallet, Stripe creates and attaches a [generated_card](/api/charges/object#charge_object-payment_method_details-card_present-generated_card) payment method representing the card to the Customer instead.
            #
            # When processing card payments, Stripe uses `setup_future_usage` to help you comply with regional legislation and network rules, such as [SCA](/strong-customer-authentication).
            attr_accessor :setup_future_usage

            def initialize(capture_method: nil, setup_future_usage: nil)
              @capture_method = capture_method
              @setup_future_usage = setup_future_usage
            end
          end

          class Klarna < Stripe::RequestParams
            # Indicates that you intend to make future payments with this PaymentIntent's payment method.
            #
            # If you provide a Customer with the PaymentIntent, you can use this parameter to [attach the payment method](/payments/save-during-payment) to the Customer after the PaymentIntent is confirmed and the customer completes any required actions. If you don't provide a Customer, you can still [attach](/api/payment_methods/attach) the payment method to a Customer after the transaction completes.
            #
            # If the payment method is `card_present` and isn't a digital wallet, Stripe creates and attaches a [generated_card](/api/charges/object#charge_object-payment_method_details-card_present-generated_card) payment method representing the card to the Customer instead.
            #
            # When processing card payments, Stripe uses `setup_future_usage` to help you comply with regional legislation and network rules, such as [SCA](/strong-customer-authentication).
            attr_accessor :setup_future_usage

            def initialize(setup_future_usage: nil)
              @setup_future_usage = setup_future_usage
            end
          end

          class Konbini < Stripe::RequestParams
            # The number of calendar days (between 1 and 60) after which Konbini payment instructions will expire. For example, if a PaymentIntent is confirmed with Konbini and `expires_after_days` set to 2 on Monday JST, the instructions will expire on Wednesday 23:59:59 JST. Defaults to 3 days.
            attr_accessor :expires_after_days
            # Indicates that you intend to make future payments with this PaymentIntent's payment method.
            #
            # If you provide a Customer with the PaymentIntent, you can use this parameter to [attach the payment method](/payments/save-during-payment) to the Customer after the PaymentIntent is confirmed and the customer completes any required actions. If you don't provide a Customer, you can still [attach](/api/payment_methods/attach) the payment method to a Customer after the transaction completes.
            #
            # If the payment method is `card_present` and isn't a digital wallet, Stripe creates and attaches a [generated_card](/api/charges/object#charge_object-payment_method_details-card_present-generated_card) payment method representing the card to the Customer instead.
            #
            # When processing card payments, Stripe uses `setup_future_usage` to help you comply with regional legislation and network rules, such as [SCA](/strong-customer-authentication).
            attr_accessor :setup_future_usage

            def initialize(expires_after_days: nil, setup_future_usage: nil)
              @expires_after_days = expires_after_days
              @setup_future_usage = setup_future_usage
            end
          end

          class KrCard < Stripe::RequestParams
            # Controls when the funds will be captured from the customer's account.
            attr_accessor :capture_method
            # Indicates that you intend to make future payments with this PaymentIntent's payment method.
            #
            # If you provide a Customer with the PaymentIntent, you can use this parameter to [attach the payment method](/payments/save-during-payment) to the Customer after the PaymentIntent is confirmed and the customer completes any required actions. If you don't provide a Customer, you can still [attach](/api/payment_methods/attach) the payment method to a Customer after the transaction completes.
            #
            # If the payment method is `card_present` and isn't a digital wallet, Stripe creates and attaches a [generated_card](/api/charges/object#charge_object-payment_method_details-card_present-generated_card) payment method representing the card to the Customer instead.
            #
            # When processing card payments, Stripe uses `setup_future_usage` to help you comply with regional legislation and network rules, such as [SCA](/strong-customer-authentication).
            attr_accessor :setup_future_usage

            def initialize(capture_method: nil, setup_future_usage: nil)
              @capture_method = capture_method
              @setup_future_usage = setup_future_usage
            end
          end

          class Link < Stripe::RequestParams
            # Indicates that you intend to make future payments with this PaymentIntent's payment method.
            #
            # If you provide a Customer with the PaymentIntent, you can use this parameter to [attach the payment method](/payments/save-during-payment) to the Customer after the PaymentIntent is confirmed and the customer completes any required actions. If you don't provide a Customer, you can still [attach](/api/payment_methods/attach) the payment method to a Customer after the transaction completes.
            #
            # If the payment method is `card_present` and isn't a digital wallet, Stripe creates and attaches a [generated_card](/api/charges/object#charge_object-payment_method_details-card_present-generated_card) payment method representing the card to the Customer instead.
            #
            # When processing card payments, Stripe uses `setup_future_usage` to help you comply with regional legislation and network rules, such as [SCA](/strong-customer-authentication).
            attr_accessor :setup_future_usage

            def initialize(setup_future_usage: nil)
              @setup_future_usage = setup_future_usage
            end
          end

          class Mobilepay < Stripe::RequestParams
            # Indicates that you intend to make future payments with this PaymentIntent's payment method.
            #
            # If you provide a Customer with the PaymentIntent, you can use this parameter to [attach the payment method](/payments/save-during-payment) to the Customer after the PaymentIntent is confirmed and the customer completes any required actions. If you don't provide a Customer, you can still [attach](/api/payment_methods/attach) the payment method to a Customer after the transaction completes.
            #
            # If the payment method is `card_present` and isn't a digital wallet, Stripe creates and attaches a [generated_card](/api/charges/object#charge_object-payment_method_details-card_present-generated_card) payment method representing the card to the Customer instead.
            #
            # When processing card payments, Stripe uses `setup_future_usage` to help you comply with regional legislation and network rules, such as [SCA](/strong-customer-authentication).
            attr_accessor :setup_future_usage

            def initialize(setup_future_usage: nil)
              @setup_future_usage = setup_future_usage
            end
          end

          class Multibanco < Stripe::RequestParams
            # Indicates that you intend to make future payments with this PaymentIntent's payment method.
            #
            # If you provide a Customer with the PaymentIntent, you can use this parameter to [attach the payment method](/payments/save-during-payment) to the Customer after the PaymentIntent is confirmed and the customer completes any required actions. If you don't provide a Customer, you can still [attach](/api/payment_methods/attach) the payment method to a Customer after the transaction completes.
            #
            # If the payment method is `card_present` and isn't a digital wallet, Stripe creates and attaches a [generated_card](/api/charges/object#charge_object-payment_method_details-card_present-generated_card) payment method representing the card to the Customer instead.
            #
            # When processing card payments, Stripe uses `setup_future_usage` to help you comply with regional legislation and network rules, such as [SCA](/strong-customer-authentication).
            attr_accessor :setup_future_usage

            def initialize(setup_future_usage: nil)
              @setup_future_usage = setup_future_usage
            end
          end

          class NaverPay < Stripe::RequestParams
            # Controls when the funds will be captured from the customer's account.
            attr_accessor :capture_method
            # Indicates that you intend to make future payments with this PaymentIntent's payment method.
            #
            # If you provide a Customer with the PaymentIntent, you can use this parameter to [attach the payment method](/payments/save-during-payment) to the Customer after the PaymentIntent is confirmed and the customer completes any required actions. If you don't provide a Customer, you can still [attach](/api/payment_methods/attach) the payment method to a Customer after the transaction completes.
            #
            # If the payment method is `card_present` and isn't a digital wallet, Stripe creates and attaches a [generated_card](/api/charges/object#charge_object-payment_method_details-card_present-generated_card) payment method representing the card to the Customer instead.
            #
            # When processing card payments, Stripe uses `setup_future_usage` to help you comply with regional legislation and network rules, such as [SCA](/strong-customer-authentication).
            attr_accessor :setup_future_usage

            def initialize(capture_method: nil, setup_future_usage: nil)
              @capture_method = capture_method
              @setup_future_usage = setup_future_usage
            end
          end

          class Oxxo < Stripe::RequestParams
            # The number of calendar days before an OXXO voucher expires. For example, if you create an OXXO voucher on Monday and you set expires_after_days to 2, the OXXO invoice will expire on Wednesday at 23:59 America/Mexico_City time.
            attr_accessor :expires_after_days
            # Indicates that you intend to make future payments with this PaymentIntent's payment method.
            #
            # If you provide a Customer with the PaymentIntent, you can use this parameter to [attach the payment method](/payments/save-during-payment) to the Customer after the PaymentIntent is confirmed and the customer completes any required actions. If you don't provide a Customer, you can still [attach](/api/payment_methods/attach) the payment method to a Customer after the transaction completes.
            #
            # If the payment method is `card_present` and isn't a digital wallet, Stripe creates and attaches a [generated_card](/api/charges/object#charge_object-payment_method_details-card_present-generated_card) payment method representing the card to the Customer instead.
            #
            # When processing card payments, Stripe uses `setup_future_usage` to help you comply with regional legislation and network rules, such as [SCA](/strong-customer-authentication).
            attr_accessor :setup_future_usage

            def initialize(expires_after_days: nil, setup_future_usage: nil)
              @expires_after_days = expires_after_days
              @setup_future_usage = setup_future_usage
            end
          end

          class P24 < Stripe::RequestParams
            # Indicates that you intend to make future payments with this PaymentIntent's payment method.
            #
            # If you provide a Customer with the PaymentIntent, you can use this parameter to [attach the payment method](/payments/save-during-payment) to the Customer after the PaymentIntent is confirmed and the customer completes any required actions. If you don't provide a Customer, you can still [attach](/api/payment_methods/attach) the payment method to a Customer after the transaction completes.
            #
            # If the payment method is `card_present` and isn't a digital wallet, Stripe creates and attaches a [generated_card](/api/charges/object#charge_object-payment_method_details-card_present-generated_card) payment method representing the card to the Customer instead.
            #
            # When processing card payments, Stripe uses `setup_future_usage` to help you comply with regional legislation and network rules, such as [SCA](/strong-customer-authentication).
            attr_accessor :setup_future_usage
            # Confirm that the payer has accepted the P24 terms and conditions.
            attr_accessor :tos_shown_and_accepted

            def initialize(setup_future_usage: nil, tos_shown_and_accepted: nil)
              @setup_future_usage = setup_future_usage
              @tos_shown_and_accepted = tos_shown_and_accepted
            end
          end

          class Payco < Stripe::RequestParams
            # Controls when the funds will be captured from the customer's account.
            attr_accessor :capture_method

            def initialize(capture_method: nil)
              @capture_method = capture_method
            end
          end

          class Paynow < Stripe::RequestParams
            # Indicates that you intend to make future payments with this PaymentIntent's payment method.
            #
            # If you provide a Customer with the PaymentIntent, you can use this parameter to [attach the payment method](/payments/save-during-payment) to the Customer after the PaymentIntent is confirmed and the customer completes any required actions. If you don't provide a Customer, you can still [attach](/api/payment_methods/attach) the payment method to a Customer after the transaction completes.
            #
            # If the payment method is `card_present` and isn't a digital wallet, Stripe creates and attaches a [generated_card](/api/charges/object#charge_object-payment_method_details-card_present-generated_card) payment method representing the card to the Customer instead.
            #
            # When processing card payments, Stripe uses `setup_future_usage` to help you comply with regional legislation and network rules, such as [SCA](/strong-customer-authentication).
            attr_accessor :setup_future_usage

            def initialize(setup_future_usage: nil)
              @setup_future_usage = setup_future_usage
            end
          end

          class Paypal < Stripe::RequestParams
            # Controls when the funds will be captured from the customer's account.
            attr_accessor :capture_method
            # [Preferred locale](https://stripe.com/docs/payments/paypal/supported-locales) of the PayPal checkout page that the customer is redirected to.
            attr_accessor :preferred_locale
            # A reference of the PayPal transaction visible to customer which is mapped to PayPal's invoice ID. This must be a globally unique ID if you have configured in your PayPal settings to block multiple payments per invoice ID.
            attr_accessor :reference
            # A reference of the PayPal transaction visible to customer which is mapped to PayPal's invoice ID. This must be a globally unique ID if you have configured in your PayPal settings to block multiple payments per invoice ID.
            attr_accessor :reference_id
            # The risk correlation ID for an on-session payment using a saved PayPal payment method.
            attr_accessor :risk_correlation_id
            # Indicates that you intend to make future payments with this PaymentIntent's payment method.
            #
            # If you provide a Customer with the PaymentIntent, you can use this parameter to [attach the payment method](/payments/save-during-payment) to the Customer after the PaymentIntent is confirmed and the customer completes any required actions. If you don't provide a Customer, you can still [attach](/api/payment_methods/attach) the payment method to a Customer after the transaction completes.
            #
            # If the payment method is `card_present` and isn't a digital wallet, Stripe creates and attaches a [generated_card](/api/charges/object#charge_object-payment_method_details-card_present-generated_card) payment method representing the card to the Customer instead.
            #
            # When processing card payments, Stripe uses `setup_future_usage` to help you comply with regional legislation and network rules, such as [SCA](/strong-customer-authentication).
            #
            # If you've already set `setup_future_usage` and you're performing a request using a publishable key, you can only update the value from `on_session` to `off_session`.
            attr_accessor :setup_future_usage
            # The Stripe connected account IDs of the sellers on the platform for this transaction (optional). Only allowed when [separate charges and transfers](https://stripe.com/docs/connect/separate-charges-and-transfers) are used.
            attr_accessor :subsellers

            def initialize(
              capture_method: nil,
              preferred_locale: nil,
              reference: nil,
              reference_id: nil,
              risk_correlation_id: nil,
              setup_future_usage: nil,
              subsellers: nil
            )
              @capture_method = capture_method
              @preferred_locale = preferred_locale
              @reference = reference
              @reference_id = reference_id
              @risk_correlation_id = risk_correlation_id
              @setup_future_usage = setup_future_usage
              @subsellers = subsellers
            end
          end

          class Payto < Stripe::RequestParams
            class MandateOptions < Stripe::RequestParams
              # Amount that will be collected. It is required when `amount_type` is `fixed`.
              attr_accessor :amount
              # The type of amount that will be collected. The amount charged must be exact or up to the value of `amount` param for `fixed` or `maximum` type respectively.
              attr_accessor :amount_type
              # Date, in YYYY-MM-DD format, after which payments will not be collected. Defaults to no end date.
              attr_accessor :end_date
              # The periodicity at which payments will be collected.
              attr_accessor :payment_schedule
              # The number of payments that will be made during a payment period. Defaults to 1 except for when `payment_schedule` is `adhoc`. In that case, it defaults to no limit.
              attr_accessor :payments_per_period
              # The purpose for which payments are made. Defaults to retail.
              attr_accessor :purpose
              # Date, in YYYY-MM-DD format, from which payments will be collected. Defaults to confirmation time.
              attr_accessor :start_date

              def initialize(
                amount: nil,
                amount_type: nil,
                end_date: nil,
                payment_schedule: nil,
                payments_per_period: nil,
                purpose: nil,
                start_date: nil
              )
                @amount = amount
                @amount_type = amount_type
                @end_date = end_date
                @payment_schedule = payment_schedule
                @payments_per_period = payments_per_period
                @purpose = purpose
                @start_date = start_date
              end
            end
            # Additional fields for Mandate creation
            attr_accessor :mandate_options
            # Indicates that you intend to make future payments with this PaymentIntent's payment method.
            #
            # If you provide a Customer with the PaymentIntent, you can use this parameter to [attach the payment method](/payments/save-during-payment) to the Customer after the PaymentIntent is confirmed and the customer completes any required actions. If you don't provide a Customer, you can still [attach](/api/payment_methods/attach) the payment method to a Customer after the transaction completes.
            #
            # If the payment method is `card_present` and isn't a digital wallet, Stripe creates and attaches a [generated_card](/api/charges/object#charge_object-payment_method_details-card_present-generated_card) payment method representing the card to the Customer instead.
            #
            # When processing card payments, Stripe uses `setup_future_usage` to help you comply with regional legislation and network rules, such as [SCA](/strong-customer-authentication).
            attr_accessor :setup_future_usage

            def initialize(mandate_options: nil, setup_future_usage: nil)
              @mandate_options = mandate_options
              @setup_future_usage = setup_future_usage
            end
          end

          class Pix < Stripe::RequestParams
            # The number of seconds (between 10 and 1209600) after which Pix payment will expire. Defaults to 86400 seconds.
            attr_accessor :expires_after_seconds

            def initialize(expires_after_seconds: nil)
              @expires_after_seconds = expires_after_seconds
            end
          end

          class RevolutPay < Stripe::RequestParams
            # Indicates that you intend to make future payments with this PaymentIntent's payment method.
            #
            # If you provide a Customer with the PaymentIntent, you can use this parameter to [attach the payment method](/payments/save-during-payment) to the Customer after the PaymentIntent is confirmed and the customer completes any required actions. If you don't provide a Customer, you can still [attach](/api/payment_methods/attach) the payment method to a Customer after the transaction completes.
            #
            # If the payment method is `card_present` and isn't a digital wallet, Stripe creates and attaches a [generated_card](/api/charges/object#charge_object-payment_method_details-card_present-generated_card) payment method representing the card to the Customer instead.
            #
            # When processing card payments, Stripe uses `setup_future_usage` to help you comply with regional legislation and network rules, such as [SCA](/strong-customer-authentication).
            attr_accessor :setup_future_usage

            def initialize(setup_future_usage: nil)
              @setup_future_usage = setup_future_usage
            end
          end

          class SamsungPay < Stripe::RequestParams
            # Controls when the funds will be captured from the customer's account.
            attr_accessor :capture_method

            def initialize(capture_method: nil)
              @capture_method = capture_method
            end
          end

          class SepaDebit < Stripe::RequestParams
            class MandateOptions < Stripe::RequestParams
              # Prefix used to generate the Mandate reference. Must be at most 12 characters long. Must consist of only uppercase letters, numbers, spaces, or the following special characters: '/', '_', '-', '&', '.'. Cannot begin with 'STRIPE'.
              attr_accessor :reference_prefix

              def initialize(reference_prefix: nil)
                @reference_prefix = reference_prefix
              end
            end
            # Additional fields for Mandate creation
            attr_accessor :mandate_options
            # Indicates that you intend to make future payments with this PaymentIntent's payment method.
            #
            # If you provide a Customer with the PaymentIntent, you can use this parameter to [attach the payment method](/payments/save-during-payment) to the Customer after the PaymentIntent is confirmed and the customer completes any required actions. If you don't provide a Customer, you can still [attach](/api/payment_methods/attach) the payment method to a Customer after the transaction completes.
            #
            # If the payment method is `card_present` and isn't a digital wallet, Stripe creates and attaches a [generated_card](/api/charges/object#charge_object-payment_method_details-card_present-generated_card) payment method representing the card to the Customer instead.
            #
            # When processing card payments, Stripe uses `setup_future_usage` to help you comply with regional legislation and network rules, such as [SCA](/strong-customer-authentication).
            attr_accessor :setup_future_usage

            def initialize(mandate_options: nil, setup_future_usage: nil)
              @mandate_options = mandate_options
              @setup_future_usage = setup_future_usage
            end
          end

          class Sofort < Stripe::RequestParams
            # Indicates that you intend to make future payments with this PaymentIntent's payment method.
            #
            # If you provide a Customer with the PaymentIntent, you can use this parameter to [attach the payment method](/payments/save-during-payment) to the Customer after the PaymentIntent is confirmed and the customer completes any required actions. If you don't provide a Customer, you can still [attach](/api/payment_methods/attach) the payment method to a Customer after the transaction completes.
            #
            # If the payment method is `card_present` and isn't a digital wallet, Stripe creates and attaches a [generated_card](/api/charges/object#charge_object-payment_method_details-card_present-generated_card) payment method representing the card to the Customer instead.
            #
            # When processing card payments, Stripe uses `setup_future_usage` to help you comply with regional legislation and network rules, such as [SCA](/strong-customer-authentication).
            attr_accessor :setup_future_usage

            def initialize(setup_future_usage: nil)
              @setup_future_usage = setup_future_usage
            end
          end

          class Swish < Stripe::RequestParams
            # The order reference that will be displayed to customers in the Swish application. Defaults to the `id` of the Payment Intent.
            attr_accessor :reference

            def initialize(reference: nil)
              @reference = reference
            end
          end

          class UsBankAccount < Stripe::RequestParams
            class FinancialConnections < Stripe::RequestParams
              # The list of permissions to request. If this parameter is passed, the `payment_method` permission must be included. Valid permissions include: `balances`, `ownership`, `payment_method`, and `transactions`.
              attr_accessor :permissions
              # List of data features that you would like to retrieve upon account creation.
              attr_accessor :prefetch

              def initialize(permissions: nil, prefetch: nil)
                @permissions = permissions
                @prefetch = prefetch
              end
            end
            # Additional fields for Financial Connections Session creation
            attr_accessor :financial_connections
            # Indicates that you intend to make future payments with this PaymentIntent's payment method.
            #
            # If you provide a Customer with the PaymentIntent, you can use this parameter to [attach the payment method](/payments/save-during-payment) to the Customer after the PaymentIntent is confirmed and the customer completes any required actions. If you don't provide a Customer, you can still [attach](/api/payment_methods/attach) the payment method to a Customer after the transaction completes.
            #
            # If the payment method is `card_present` and isn't a digital wallet, Stripe creates and attaches a [generated_card](/api/charges/object#charge_object-payment_method_details-card_present-generated_card) payment method representing the card to the Customer instead.
            #
            # When processing card payments, Stripe uses `setup_future_usage` to help you comply with regional legislation and network rules, such as [SCA](/strong-customer-authentication).
            attr_accessor :setup_future_usage
            # Verification method for the intent
            attr_accessor :verification_method

            def initialize(
              financial_connections: nil,
              setup_future_usage: nil,
              verification_method: nil
            )
              @financial_connections = financial_connections
              @setup_future_usage = setup_future_usage
              @verification_method = verification_method
            end
          end

          class WechatPay < Stripe::RequestParams
            # The app ID registered with WeChat Pay. Only required when client is ios or android.
            attr_accessor :app_id
            # The client type that the end customer will pay from
            attr_accessor :client
            # Indicates that you intend to make future payments with this PaymentIntent's payment method.
            #
            # If you provide a Customer with the PaymentIntent, you can use this parameter to [attach the payment method](/payments/save-during-payment) to the Customer after the PaymentIntent is confirmed and the customer completes any required actions. If you don't provide a Customer, you can still [attach](/api/payment_methods/attach) the payment method to a Customer after the transaction completes.
            #
            # If the payment method is `card_present` and isn't a digital wallet, Stripe creates and attaches a [generated_card](/api/charges/object#charge_object-payment_method_details-card_present-generated_card) payment method representing the card to the Customer instead.
            #
            # When processing card payments, Stripe uses `setup_future_usage` to help you comply with regional legislation and network rules, such as [SCA](/strong-customer-authentication).
            attr_accessor :setup_future_usage

            def initialize(app_id: nil, client: nil, setup_future_usage: nil)
              @app_id = app_id
              @client = client
              @setup_future_usage = setup_future_usage
            end
          end
          # contains details about the ACSS Debit payment method options.
          attr_accessor :acss_debit
          # contains details about the Affirm payment method options.
          attr_accessor :affirm
          # contains details about the Afterpay Clearpay payment method options.
          attr_accessor :afterpay_clearpay
          # contains details about the Alipay payment method options.
          attr_accessor :alipay
          # contains details about the AmazonPay payment method options.
          attr_accessor :amazon_pay
          # contains details about the AU Becs Debit payment method options.
          attr_accessor :au_becs_debit
          # contains details about the Bacs Debit payment method options.
          attr_accessor :bacs_debit
          # contains details about the Bancontact payment method options.
          attr_accessor :bancontact
          # contains details about the Boleto payment method options.
          attr_accessor :boleto
          # contains details about the Card payment method options.
          attr_accessor :card
          # contains details about the Cashapp Pay payment method options.
          attr_accessor :cashapp
          # contains details about the Customer Balance payment method options.
          attr_accessor :customer_balance
          # contains details about the EPS payment method options.
          attr_accessor :eps
          # contains details about the FPX payment method options.
          attr_accessor :fpx
          # contains details about the Giropay payment method options.
          attr_accessor :giropay
          # contains details about the Grabpay payment method options.
          attr_accessor :grabpay
          # contains details about the Ideal payment method options.
          attr_accessor :ideal
          # contains details about the Kakao Pay payment method options.
          attr_accessor :kakao_pay
          # contains details about the Klarna payment method options.
          attr_accessor :klarna
          # contains details about the Konbini payment method options.
          attr_accessor :konbini
          # contains details about the Korean card payment method options.
          attr_accessor :kr_card
          # contains details about the Link payment method options.
          attr_accessor :link
          # contains details about the Mobilepay payment method options.
          attr_accessor :mobilepay
          # contains details about the Multibanco payment method options.
          attr_accessor :multibanco
          # contains details about the Naver Pay payment method options.
          attr_accessor :naver_pay
          # contains details about the OXXO payment method options.
          attr_accessor :oxxo
          # contains details about the P24 payment method options.
          attr_accessor :p24
          # contains details about the PAYCO payment method options.
          attr_accessor :payco
          # contains details about the PayNow payment method options.
          attr_accessor :paynow
          # contains details about the PayPal payment method options.
          attr_accessor :paypal
          # contains details about the PayTo payment method options.
          attr_accessor :payto
          # contains details about the Pix payment method options.
          attr_accessor :pix
          # contains details about the RevolutPay payment method options.
          attr_accessor :revolut_pay
          # contains details about the Samsung Pay payment method options.
          attr_accessor :samsung_pay
          # contains details about the Sepa Debit payment method options.
          attr_accessor :sepa_debit
          # contains details about the Sofort payment method options.
          attr_accessor :sofort
          # contains details about the Swish payment method options.
          attr_accessor :swish
          # contains details about the Us Bank Account payment method options.
          attr_accessor :us_bank_account
          # contains details about the WeChat Pay payment method options.
          attr_accessor :wechat_pay

          def initialize(
            acss_debit: nil,
            affirm: nil,
            afterpay_clearpay: nil,
            alipay: nil,
            amazon_pay: nil,
            au_becs_debit: nil,
            bacs_debit: nil,
            bancontact: nil,
            boleto: nil,
            card: nil,
            cashapp: nil,
            customer_balance: nil,
            eps: nil,
            fpx: nil,
            giropay: nil,
            grabpay: nil,
            ideal: nil,
            kakao_pay: nil,
            klarna: nil,
            konbini: nil,
            kr_card: nil,
            link: nil,
            mobilepay: nil,
            multibanco: nil,
            naver_pay: nil,
            oxxo: nil,
            p24: nil,
            payco: nil,
            paynow: nil,
            paypal: nil,
            payto: nil,
            pix: nil,
            revolut_pay: nil,
            samsung_pay: nil,
            sepa_debit: nil,
            sofort: nil,
            swish: nil,
            us_bank_account: nil,
            wechat_pay: nil
          )
            @acss_debit = acss_debit
            @affirm = affirm
            @afterpay_clearpay = afterpay_clearpay
            @alipay = alipay
            @amazon_pay = amazon_pay
            @au_becs_debit = au_becs_debit
            @bacs_debit = bacs_debit
            @bancontact = bancontact
            @boleto = boleto
            @card = card
            @cashapp = cashapp
            @customer_balance = customer_balance
            @eps = eps
            @fpx = fpx
            @giropay = giropay
            @grabpay = grabpay
            @ideal = ideal
            @kakao_pay = kakao_pay
            @klarna = klarna
            @konbini = konbini
            @kr_card = kr_card
            @link = link
            @mobilepay = mobilepay
            @multibanco = multibanco
            @naver_pay = naver_pay
            @oxxo = oxxo
            @p24 = p24
            @payco = payco
            @paynow = paynow
            @paypal = paypal
            @payto = payto
            @pix = pix
            @revolut_pay = revolut_pay
            @samsung_pay = samsung_pay
            @sepa_debit = sepa_debit
            @sofort = sofort
            @swish = swish
            @us_bank_account = us_bank_account
            @wechat_pay = wechat_pay
          end
        end

        class Permissions < Stripe::RequestParams
          class Update < Stripe::RequestParams
            # Determines which entity is allowed to update the line items.
            #
            # Default is `client_only`. Stripe Checkout client will automatically update the line items. If set to `server_only`, only your server is allowed to update the line items.
            #
            # When set to `server_only`, you must add the onLineItemsChange event handler when initializing the Stripe Checkout client and manually update the line items from your server using the Stripe API.
            attr_accessor :line_items
            # Determines which entity is allowed to update the shipping details.
            #
            # Default is `client_only`. Stripe Checkout client will automatically update the shipping details. If set to `server_only`, only your server is allowed to update the shipping details.
            #
            # When set to `server_only`, you must add the onShippingDetailsChange event handler when initializing the Stripe Checkout client and manually update the shipping details from your server using the Stripe API.
            attr_accessor :shipping_details

            def initialize(line_items: nil, shipping_details: nil)
              @line_items = line_items
              @shipping_details = shipping_details
            end
          end
          # Permissions for updating the Checkout Session.
          attr_accessor :update

          def initialize(update: nil)
            @update = update
          end
        end

        class PhoneNumberCollection < Stripe::RequestParams
          # Set to `true` to enable phone number collection.
          #
          # Can only be set in `payment` and `subscription` mode.
          attr_accessor :enabled

          def initialize(enabled: nil)
            @enabled = enabled
          end
        end

        class SavedPaymentMethodOptions < Stripe::RequestParams
          # Uses the `allow_redisplay` value of each saved payment method to filter the set presented to a returning customer. By default, only saved payment methods with ’allow_redisplay: ‘always’ are shown in Checkout.
          attr_accessor :allow_redisplay_filters
          # Enable customers to choose if they wish to save their payment method for future use. Disabled by default.
          attr_accessor :payment_method_save

          def initialize(allow_redisplay_filters: nil, payment_method_save: nil)
            @allow_redisplay_filters = allow_redisplay_filters
            @payment_method_save = payment_method_save
          end
        end

        class SetupIntentData < Stripe::RequestParams
          # An arbitrary string attached to the object. Often useful for displaying to users.
          attr_accessor :description
          # Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format. Individual keys can be unset by posting an empty value to them. All keys can be unset by posting an empty value to `metadata`.
          attr_accessor :metadata
          # The Stripe account for which the setup is intended.
          attr_accessor :on_behalf_of

          def initialize(description: nil, metadata: nil, on_behalf_of: nil)
            @description = description
            @metadata = metadata
            @on_behalf_of = on_behalf_of
          end
        end

        class ShippingAddressCollection < Stripe::RequestParams
          # An array of two-letter ISO country codes representing which countries Checkout should provide as options for
          # shipping locations.
          attr_accessor :allowed_countries

          def initialize(allowed_countries: nil)
            @allowed_countries = allowed_countries
          end
        end

        class ShippingOption < Stripe::RequestParams
          class ShippingRateData < Stripe::RequestParams
            class DeliveryEstimate < Stripe::RequestParams
              class Maximum < Stripe::RequestParams
                # A unit of time.
                attr_accessor :unit
                # Must be greater than 0.
                attr_accessor :value

                def initialize(unit: nil, value: nil)
                  @unit = unit
                  @value = value
                end
              end

              class Minimum < Stripe::RequestParams
                # A unit of time.
                attr_accessor :unit
                # Must be greater than 0.
                attr_accessor :value

                def initialize(unit: nil, value: nil)
                  @unit = unit
                  @value = value
                end
              end
              # The upper bound of the estimated range. If empty, represents no upper bound i.e., infinite.
              attr_accessor :maximum
              # The lower bound of the estimated range. If empty, represents no lower bound.
              attr_accessor :minimum

              def initialize(maximum: nil, minimum: nil)
                @maximum = maximum
                @minimum = minimum
              end
            end

            class FixedAmount < Stripe::RequestParams
              class CurrencyOptions < Stripe::RequestParams
                # A non-negative integer in cents representing how much to charge.
                attr_accessor :amount
                # Specifies whether the rate is considered inclusive of taxes or exclusive of taxes. One of `inclusive`, `exclusive`, or `unspecified`.
                attr_accessor :tax_behavior

                def initialize(amount: nil, tax_behavior: nil)
                  @amount = amount
                  @tax_behavior = tax_behavior
                end
              end
              # A non-negative integer in cents representing how much to charge.
              attr_accessor :amount
              # Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies).
              attr_accessor :currency
              # Shipping rates defined in each available currency option. Each key must be a three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html) and a [supported currency](https://stripe.com/docs/currencies).
              attr_accessor :currency_options

              def initialize(amount: nil, currency: nil, currency_options: nil)
                @amount = amount
                @currency = currency
                @currency_options = currency_options
              end
            end
            # The estimated range for how long shipping will take, meant to be displayable to the customer. This will appear on CheckoutSessions.
            attr_accessor :delivery_estimate
            # The name of the shipping rate, meant to be displayable to the customer. This will appear on CheckoutSessions.
            attr_accessor :display_name
            # Describes a fixed amount to charge for shipping. Must be present if type is `fixed_amount`.
            attr_accessor :fixed_amount
            # Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format. Individual keys can be unset by posting an empty value to them. All keys can be unset by posting an empty value to `metadata`.
            attr_accessor :metadata
            # Specifies whether the rate is considered inclusive of taxes or exclusive of taxes. One of `inclusive`, `exclusive`, or `unspecified`.
            attr_accessor :tax_behavior
            # A [tax code](https://stripe.com/docs/tax/tax-categories) ID. The Shipping tax code is `txcd_92010001`.
            attr_accessor :tax_code
            # The type of calculation to use on the shipping rate.
            attr_accessor :type

            def initialize(
              delivery_estimate: nil,
              display_name: nil,
              fixed_amount: nil,
              metadata: nil,
              tax_behavior: nil,
              tax_code: nil,
              type: nil
            )
              @delivery_estimate = delivery_estimate
              @display_name = display_name
              @fixed_amount = fixed_amount
              @metadata = metadata
              @tax_behavior = tax_behavior
              @tax_code = tax_code
              @type = type
            end
          end
          # The ID of the Shipping Rate to use for this shipping option.
          attr_accessor :shipping_rate
          # Parameters to be passed to Shipping Rate creation for this shipping option.
          attr_accessor :shipping_rate_data

          def initialize(shipping_rate: nil, shipping_rate_data: nil)
            @shipping_rate = shipping_rate
            @shipping_rate_data = shipping_rate_data
          end
        end

        class SubscriptionData < Stripe::RequestParams
          class InvoiceSettings < Stripe::RequestParams
            class Issuer < Stripe::RequestParams
              # The connected account being referenced when `type` is `account`.
              attr_accessor :account
              # Type of the account referenced in the request.
              attr_accessor :type

              def initialize(account: nil, type: nil)
                @account = account
                @type = type
              end
            end
            # The connected account that issues the invoice. The invoice is presented with the branding and support information of the specified account.
            attr_accessor :issuer

            def initialize(issuer: nil)
              @issuer = issuer
            end
          end

          class TransferData < Stripe::RequestParams
            # A non-negative decimal between 0 and 100, with at most two decimal places. This represents the percentage of the subscription invoice total that will be transferred to the destination account. By default, the entire amount is transferred to the destination.
            attr_accessor :amount_percent
            # ID of an existing, connected Stripe account.
            attr_accessor :destination

            def initialize(amount_percent: nil, destination: nil)
              @amount_percent = amount_percent
              @destination = destination
            end
          end

          class TrialSettings < Stripe::RequestParams
            class EndBehavior < Stripe::RequestParams
              # Indicates how the subscription should change when the trial ends if the user did not provide a payment method.
              attr_accessor :missing_payment_method

              def initialize(missing_payment_method: nil)
                @missing_payment_method = missing_payment_method
              end
            end
            # Defines how the subscription should behave when the user's free trial ends.
            attr_accessor :end_behavior

            def initialize(end_behavior: nil)
              @end_behavior = end_behavior
            end
          end
          # A non-negative decimal between 0 and 100, with at most two decimal places. This represents the percentage of the subscription invoice total that will be transferred to the application owner's Stripe account. To use an application fee percent, the request must be made on behalf of another account, using the `Stripe-Account` header or an OAuth key. For more information, see the application fees [documentation](https://stripe.com/docs/connect/subscriptions#collecting-fees-on-subscriptions).
          attr_accessor :application_fee_percent
          # A future timestamp to anchor the subscription's billing cycle for new subscriptions.
          attr_accessor :billing_cycle_anchor
          # The tax rates that will apply to any subscription item that does not have
          # `tax_rates` set. Invoices created will have their `default_tax_rates` populated
          # from the subscription.
          attr_accessor :default_tax_rates
          # The subscription's description, meant to be displayable to the customer.
          # Use this field to optionally store an explanation of the subscription
          # for rendering in the [customer portal](https://stripe.com/docs/customer-management).
          attr_accessor :description
          # All invoices will be billed using the specified settings.
          attr_accessor :invoice_settings
          # Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format. Individual keys can be unset by posting an empty value to them. All keys can be unset by posting an empty value to `metadata`.
          attr_accessor :metadata
          # The account on behalf of which to charge, for each of the subscription's invoices.
          attr_accessor :on_behalf_of
          # Determines how to handle prorations resulting from the `billing_cycle_anchor`. If no value is passed, the default is `create_prorations`.
          attr_accessor :proration_behavior
          # If specified, the funds from the subscription's invoices will be transferred to the destination and the ID of the resulting transfers will be found on the resulting charges.
          attr_accessor :transfer_data
          # Unix timestamp representing the end of the trial period the customer
          # will get before being charged for the first time. Has to be at least
          # 48 hours in the future.
          attr_accessor :trial_end
          # Integer representing the number of trial period days before the
          # customer is charged for the first time. Has to be at least 1.
          attr_accessor :trial_period_days
          # Settings related to subscription trials.
          attr_accessor :trial_settings

          def initialize(
            application_fee_percent: nil,
            billing_cycle_anchor: nil,
            default_tax_rates: nil,
            description: nil,
            invoice_settings: nil,
            metadata: nil,
            on_behalf_of: nil,
            proration_behavior: nil,
            transfer_data: nil,
            trial_end: nil,
            trial_period_days: nil,
            trial_settings: nil
          )
            @application_fee_percent = application_fee_percent
            @billing_cycle_anchor = billing_cycle_anchor
            @default_tax_rates = default_tax_rates
            @description = description
            @invoice_settings = invoice_settings
            @metadata = metadata
            @on_behalf_of = on_behalf_of
            @proration_behavior = proration_behavior
            @transfer_data = transfer_data
            @trial_end = trial_end
            @trial_period_days = trial_period_days
            @trial_settings = trial_settings
          end
        end

        class TaxIdCollection < Stripe::RequestParams
          # Enable tax ID collection during checkout. Defaults to `false`.
          attr_accessor :enabled
          # Describes whether a tax ID is required during checkout. Defaults to `never`.
          attr_accessor :required

          def initialize(enabled: nil, required: nil)
            @enabled = enabled
            @required = required
          end
        end
        # Settings for price localization with [Adaptive Pricing](https://docs.stripe.com/payments/checkout/adaptive-pricing).
        attr_accessor :adaptive_pricing
        # Configure actions after a Checkout Session has expired.
        attr_accessor :after_expiration
        # Enables user redeemable promotion codes.
        attr_accessor :allow_promotion_codes
        # Settings for automatic tax lookup for this session and resulting payments, invoices, and subscriptions.
        attr_accessor :automatic_tax
        # Specify whether Checkout should collect the customer's billing address. Defaults to `auto`.
        attr_accessor :billing_address_collection
        # If set, Checkout displays a back button and customers will be directed to this URL if they decide to cancel payment and return to your website. This parameter is not allowed if ui_mode is `embedded` or `custom`.
        attr_accessor :cancel_url
        # A unique string to reference the Checkout Session. This can be a
        # customer ID, a cart ID, or similar, and can be used to reconcile the
        # session with your internal systems.
        attr_accessor :client_reference_id
        # Configure fields for the Checkout Session to gather active consent from customers.
        attr_accessor :consent_collection
        # Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies). Required in `setup` mode when `payment_method_types` is not set.
        attr_accessor :currency
        # Collect additional information from your customer using custom fields. Up to 3 fields are supported.
        attr_accessor :custom_fields
        # Display additional text for your customers using custom text.
        attr_accessor :custom_text
        # ID of an existing Customer, if one exists. In `payment` mode, the customer’s most recently saved card
        # payment method will be used to prefill the email, name, card details, and billing address
        # on the Checkout page. In `subscription` mode, the customer’s [default payment method](https://stripe.com/docs/api/customers/update#update_customer-invoice_settings-default_payment_method)
        # will be used if it’s a card, otherwise the most recently saved card will be used. A valid billing address, billing name and billing email are required on the payment method for Checkout to prefill the customer's card details.
        #
        # If the Customer already has a valid [email](https://stripe.com/docs/api/customers/object#customer_object-email) set, the email will be prefilled and not editable in Checkout.
        # If the Customer does not have a valid `email`, Checkout will set the email entered during the session on the Customer.
        #
        # If blank for Checkout Sessions in `subscription` mode or with `customer_creation` set as `always` in `payment` mode, Checkout will create a new Customer object based on information provided during the payment flow.
        #
        # You can set [`payment_intent_data.setup_future_usage`](https://stripe.com/docs/api/checkout/sessions/create#create_checkout_session-payment_intent_data-setup_future_usage) to have Checkout automatically attach the payment method to the Customer you pass in for future reuse.
        attr_accessor :customer
        # Configure whether a Checkout Session creates a [Customer](https://stripe.com/docs/api/customers) during Session confirmation.
        #
        # When a Customer is not created, you can still retrieve email, address, and other customer data entered in Checkout
        # with [customer_details](https://stripe.com/docs/api/checkout/sessions/object#checkout_session_object-customer_details).
        #
        # Sessions that don't create Customers instead are grouped by [guest customers](https://stripe.com/docs/payments/checkout/guest-customers)
        # in the Dashboard. Promotion codes limited to first time customers will return invalid for these Sessions.
        #
        # Can only be set in `payment` and `setup` mode.
        attr_accessor :customer_creation
        # If provided, this value will be used when the Customer object is created.
        # If not provided, customers will be asked to enter their email address.
        # Use this parameter to prefill customer data if you already have an email
        # on file. To access information about the customer once a session is
        # complete, use the `customer` field.
        attr_accessor :customer_email
        # Controls what fields on Customer can be updated by the Checkout Session. Can only be provided when `customer` is provided.
        attr_accessor :customer_update
        # The coupon or promotion code to apply to this Session. Currently, only up to one may be specified.
        attr_accessor :discounts
        # Specifies which fields in the response should be expanded.
        attr_accessor :expand
        # The Epoch time in seconds at which the Checkout Session will expire. It can be anywhere from 30 minutes to 24 hours after Checkout Session creation. By default, this value is 24 hours from creation.
        attr_accessor :expires_at
        # Generate a post-purchase Invoice for one-time payments.
        attr_accessor :invoice_creation
        # A list of items the customer is purchasing. Use this parameter to pass one-time or recurring [Prices](https://stripe.com/docs/api/prices).
        #
        # For `payment` mode, there is a maximum of 100 line items, however it is recommended to consolidate line items if there are more than a few dozen.
        #
        # For `subscription` mode, there is a maximum of 20 line items with recurring Prices and 20 line items with one-time Prices. Line items with one-time Prices will be on the initial invoice only.
        attr_accessor :line_items
        # The IETF language tag of the locale Checkout is displayed in. If blank or `auto`, the browser's locale is used.
        attr_accessor :locale
        # Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format. Individual keys can be unset by posting an empty value to them. All keys can be unset by posting an empty value to `metadata`.
        attr_accessor :metadata
        # The mode of the Checkout Session. Pass `subscription` if the Checkout Session includes at least one recurring item.
        attr_accessor :mode
        # A subset of parameters to be passed to PaymentIntent creation for Checkout Sessions in `payment` mode.
        attr_accessor :payment_intent_data
        # Specify whether Checkout should collect a payment method. When set to `if_required`, Checkout will not collect a payment method when the total due for the session is 0.
        # This may occur if the Checkout Session includes a free trial or a discount.
        #
        # Can only be set in `subscription` mode. Defaults to `always`.
        #
        # If you'd like information on how to collect a payment method outside of Checkout, read the guide on configuring [subscriptions with a free trial](https://stripe.com/docs/payments/checkout/free-trials).
        attr_accessor :payment_method_collection
        # The ID of the payment method configuration to use with this Checkout session.
        attr_accessor :payment_method_configuration
        # This parameter allows you to set some attributes on the payment method created during a Checkout session.
        attr_accessor :payment_method_data
        # Payment-method-specific configuration.
        attr_accessor :payment_method_options
        # A list of the types of payment methods (e.g., `card`) this Checkout Session can accept.
        #
        # You can omit this attribute to manage your payment methods from the [Stripe Dashboard](https://dashboard.stripe.com/settings/payment_methods).
        # See [Dynamic Payment Methods](https://stripe.com/docs/payments/payment-methods/integration-options#using-dynamic-payment-methods) for more details.
        #
        # Read more about the supported payment methods and their requirements in our [payment
        # method details guide](/docs/payments/checkout/payment-methods).
        #
        # If multiple payment methods are passed, Checkout will dynamically reorder them to
        # prioritize the most relevant payment methods based on the customer's location and
        # other characteristics.
        attr_accessor :payment_method_types
        # This property is used to set up permissions for various actions (e.g., update) on the CheckoutSession object.
        #
        # For specific permissions, please refer to their dedicated subsections, such as `permissions.update.shipping_details`.
        attr_accessor :permissions
        # Controls phone number collection settings for the session.
        #
        # We recommend that you review your privacy policy and check with your legal contacts
        # before using this feature. Learn more about [collecting phone numbers with Checkout](https://stripe.com/docs/payments/checkout/phone-numbers).
        attr_accessor :phone_number_collection
        # This parameter applies to `ui_mode: embedded`. Learn more about the [redirect behavior](https://stripe.com/docs/payments/checkout/custom-success-page?payment-ui=embedded-form) of embedded sessions. Defaults to `always`.
        attr_accessor :redirect_on_completion
        # The URL to redirect your customer back to after they authenticate or cancel their payment on the
        # payment method's app or site. This parameter is required if `ui_mode` is `embedded` or `custom`
        # and redirect-based payment methods are enabled on the session.
        attr_accessor :return_url
        # Controls saved payment method settings for the session. Only available in `payment` and `subscription` mode.
        attr_accessor :saved_payment_method_options
        # A subset of parameters to be passed to SetupIntent creation for Checkout Sessions in `setup` mode.
        attr_accessor :setup_intent_data
        # When set, provides configuration for Checkout to collect a shipping address from a customer.
        attr_accessor :shipping_address_collection
        # The shipping rate options to apply to this Session. Up to a maximum of 5.
        attr_accessor :shipping_options
        # Describes the type of transaction being performed by Checkout in order to customize
        # relevant text on the page, such as the submit button. `submit_type` can only be
        # specified on Checkout Sessions in `payment` mode. If blank or `auto`, `pay` is used.
        attr_accessor :submit_type
        # A subset of parameters to be passed to subscription creation for Checkout Sessions in `subscription` mode.
        attr_accessor :subscription_data
        # The URL to which Stripe should send customers when payment or setup
        # is complete.
        # This parameter is not allowed if ui_mode is `embedded` or `custom`. If you'd like to use
        # information from the successful Checkout Session on your page, read the
        # guide on [customizing your success page](https://stripe.com/docs/payments/checkout/custom-success-page).
        attr_accessor :success_url
        # Controls tax ID collection during checkout.
        attr_accessor :tax_id_collection
        # The UI mode of the Session. Defaults to `hosted`.
        attr_accessor :ui_mode

        def initialize(
          adaptive_pricing: nil,
          after_expiration: nil,
          allow_promotion_codes: nil,
          automatic_tax: nil,
          billing_address_collection: nil,
          cancel_url: nil,
          client_reference_id: nil,
          consent_collection: nil,
          currency: nil,
          custom_fields: nil,
          custom_text: nil,
          customer: nil,
          customer_creation: nil,
          customer_email: nil,
          customer_update: nil,
          discounts: nil,
          expand: nil,
          expires_at: nil,
          invoice_creation: nil,
          line_items: nil,
          locale: nil,
          metadata: nil,
          mode: nil,
          payment_intent_data: nil,
          payment_method_collection: nil,
          payment_method_configuration: nil,
          payment_method_data: nil,
          payment_method_options: nil,
          payment_method_types: nil,
          permissions: nil,
          phone_number_collection: nil,
          redirect_on_completion: nil,
          return_url: nil,
          saved_payment_method_options: nil,
          setup_intent_data: nil,
          shipping_address_collection: nil,
          shipping_options: nil,
          submit_type: nil,
          subscription_data: nil,
          success_url: nil,
          tax_id_collection: nil,
          ui_mode: nil
        )
          @adaptive_pricing = adaptive_pricing
          @after_expiration = after_expiration
          @allow_promotion_codes = allow_promotion_codes
          @automatic_tax = automatic_tax
          @billing_address_collection = billing_address_collection
          @cancel_url = cancel_url
          @client_reference_id = client_reference_id
          @consent_collection = consent_collection
          @currency = currency
          @custom_fields = custom_fields
          @custom_text = custom_text
          @customer = customer
          @customer_creation = customer_creation
          @customer_email = customer_email
          @customer_update = customer_update
          @discounts = discounts
          @expand = expand
          @expires_at = expires_at
          @invoice_creation = invoice_creation
          @line_items = line_items
          @locale = locale
          @metadata = metadata
          @mode = mode
          @payment_intent_data = payment_intent_data
          @payment_method_collection = payment_method_collection
          @payment_method_configuration = payment_method_configuration
          @payment_method_data = payment_method_data
          @payment_method_options = payment_method_options
          @payment_method_types = payment_method_types
          @permissions = permissions
          @phone_number_collection = phone_number_collection
          @redirect_on_completion = redirect_on_completion
          @return_url = return_url
          @saved_payment_method_options = saved_payment_method_options
          @setup_intent_data = setup_intent_data
          @shipping_address_collection = shipping_address_collection
          @shipping_options = shipping_options
          @submit_type = submit_type
          @subscription_data = subscription_data
          @success_url = success_url
          @tax_id_collection = tax_id_collection
          @ui_mode = ui_mode
        end
      end

      class RetrieveParams < Stripe::RequestParams
        # Specifies which fields in the response should be expanded.
        attr_accessor :expand

        def initialize(expand: nil)
          @expand = expand
        end
      end

      class UpdateParams < Stripe::RequestParams
        class CollectedInformation < Stripe::RequestParams
          class ShippingDetails < Stripe::RequestParams
            class Address < Stripe::RequestParams
              # City, district, suburb, town, or village.
              attr_accessor :city
              # Two-letter country code ([ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2)).
              attr_accessor :country
              # Address line 1 (e.g., street, PO Box, or company name).
              attr_accessor :line1
              # Address line 2 (e.g., apartment, suite, unit, or building).
              attr_accessor :line2
              # ZIP or postal code.
              attr_accessor :postal_code
              # State, county, province, or region.
              attr_accessor :state

              def initialize(
                city: nil,
                country: nil,
                line1: nil,
                line2: nil,
                postal_code: nil,
                state: nil
              )
                @city = city
                @country = country
                @line1 = line1
                @line2 = line2
                @postal_code = postal_code
                @state = state
              end
            end
            # The address of the customer
            attr_accessor :address
            # The name of customer
            attr_accessor :name

            def initialize(address: nil, name: nil)
              @address = address
              @name = name
            end
          end
          # The shipping details to apply to this Session.
          attr_accessor :shipping_details

          def initialize(shipping_details: nil)
            @shipping_details = shipping_details
          end
        end

        class LineItem < Stripe::RequestParams
          class AdjustableQuantity < Stripe::RequestParams
            # Set to true if the quantity can be adjusted to any positive integer. Setting to false will remove any previously specified constraints on quantity.
            attr_accessor :enabled
            # The maximum quantity the customer can purchase for the Checkout Session. By default this value is 99. You can specify a value up to 999999.
            attr_accessor :maximum
            # The minimum quantity the customer must purchase for the Checkout Session. By default this value is 0.
            attr_accessor :minimum

            def initialize(enabled: nil, maximum: nil, minimum: nil)
              @enabled = enabled
              @maximum = maximum
              @minimum = minimum
            end
          end
          # When set, provides configuration for this item’s quantity to be adjusted by the customer during Checkout.
          attr_accessor :adjustable_quantity
          # ID of an existing line item.
          attr_accessor :id
          # Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format. Individual keys can be unset by posting an empty value to them. All keys can be unset by posting an empty value to `metadata`.
          attr_accessor :metadata
          # The ID of the [Price](https://stripe.com/docs/api/prices).
          attr_accessor :price
          # The quantity of the line item being purchased.
          attr_accessor :quantity
          # The [tax rates](https://stripe.com/docs/api/tax_rates) which apply to this line item.
          attr_accessor :tax_rates

          def initialize(
            adjustable_quantity: nil,
            id: nil,
            metadata: nil,
            price: nil,
            quantity: nil,
            tax_rates: nil
          )
            @adjustable_quantity = adjustable_quantity
            @id = id
            @metadata = metadata
            @price = price
            @quantity = quantity
            @tax_rates = tax_rates
          end
        end

        class ShippingOption < Stripe::RequestParams
          class ShippingRateData < Stripe::RequestParams
            class DeliveryEstimate < Stripe::RequestParams
              class Maximum < Stripe::RequestParams
                # A unit of time.
                attr_accessor :unit
                # Must be greater than 0.
                attr_accessor :value

                def initialize(unit: nil, value: nil)
                  @unit = unit
                  @value = value
                end
              end

              class Minimum < Stripe::RequestParams
                # A unit of time.
                attr_accessor :unit
                # Must be greater than 0.
                attr_accessor :value

                def initialize(unit: nil, value: nil)
                  @unit = unit
                  @value = value
                end
              end
              # The upper bound of the estimated range. If empty, represents no upper bound i.e., infinite.
              attr_accessor :maximum
              # The lower bound of the estimated range. If empty, represents no lower bound.
              attr_accessor :minimum

              def initialize(maximum: nil, minimum: nil)
                @maximum = maximum
                @minimum = minimum
              end
            end

            class FixedAmount < Stripe::RequestParams
              class CurrencyOptions < Stripe::RequestParams
                # A non-negative integer in cents representing how much to charge.
                attr_accessor :amount
                # Specifies whether the rate is considered inclusive of taxes or exclusive of taxes. One of `inclusive`, `exclusive`, or `unspecified`.
                attr_accessor :tax_behavior

                def initialize(amount: nil, tax_behavior: nil)
                  @amount = amount
                  @tax_behavior = tax_behavior
                end
              end
              # A non-negative integer in cents representing how much to charge.
              attr_accessor :amount
              # Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies).
              attr_accessor :currency
              # Shipping rates defined in each available currency option. Each key must be a three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html) and a [supported currency](https://stripe.com/docs/currencies).
              attr_accessor :currency_options

              def initialize(amount: nil, currency: nil, currency_options: nil)
                @amount = amount
                @currency = currency
                @currency_options = currency_options
              end
            end
            # The estimated range for how long shipping will take, meant to be displayable to the customer. This will appear on CheckoutSessions.
            attr_accessor :delivery_estimate
            # The name of the shipping rate, meant to be displayable to the customer. This will appear on CheckoutSessions.
            attr_accessor :display_name
            # Describes a fixed amount to charge for shipping. Must be present if type is `fixed_amount`.
            attr_accessor :fixed_amount
            # Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format. Individual keys can be unset by posting an empty value to them. All keys can be unset by posting an empty value to `metadata`.
            attr_accessor :metadata
            # Specifies whether the rate is considered inclusive of taxes or exclusive of taxes. One of `inclusive`, `exclusive`, or `unspecified`.
            attr_accessor :tax_behavior
            # A [tax code](https://stripe.com/docs/tax/tax-categories) ID. The Shipping tax code is `txcd_92010001`.
            attr_accessor :tax_code
            # The type of calculation to use on the shipping rate.
            attr_accessor :type

            def initialize(
              delivery_estimate: nil,
              display_name: nil,
              fixed_amount: nil,
              metadata: nil,
              tax_behavior: nil,
              tax_code: nil,
              type: nil
            )
              @delivery_estimate = delivery_estimate
              @display_name = display_name
              @fixed_amount = fixed_amount
              @metadata = metadata
              @tax_behavior = tax_behavior
              @tax_code = tax_code
              @type = type
            end
          end
          # The ID of the Shipping Rate to use for this shipping option.
          attr_accessor :shipping_rate
          # Parameters to be passed to Shipping Rate creation for this shipping option.
          attr_accessor :shipping_rate_data

          def initialize(shipping_rate: nil, shipping_rate_data: nil)
            @shipping_rate = shipping_rate
            @shipping_rate_data = shipping_rate_data
          end
        end
        # Information about the customer collected within the Checkout Session.
        attr_accessor :collected_information
        # Specifies which fields in the response should be expanded.
        attr_accessor :expand
        # A list of items the customer is purchasing.
        #
        # When updating line items, you must retransmit the entire array of line items.
        #
        # To retain an existing line item, specify its `id`.
        #
        # To update an existing line item, specify its `id` along with the new values of the fields to update.
        #
        # To add a new line item, specify a `price` and `quantity`. We don't currently support recurring prices.
        #
        # To remove an existing line item, omit the line item's ID from the retransmitted array.
        #
        # To reorder a line item, specify it at the desired position in the retransmitted array.
        attr_accessor :line_items
        # Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format. Individual keys can be unset by posting an empty value to them. All keys can be unset by posting an empty value to `metadata`.
        attr_accessor :metadata
        # The shipping rate options to apply to this Session. Up to a maximum of 5.
        attr_accessor :shipping_options

        def initialize(
          collected_information: nil,
          expand: nil,
          line_items: nil,
          metadata: nil,
          shipping_options: nil
        )
          @collected_information = collected_information
          @expand = expand
          @line_items = line_items
          @metadata = metadata
          @shipping_options = shipping_options
        end
      end

      class ListLineItemsParams < Stripe::RequestParams
        # A cursor for use in pagination. `ending_before` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, starting with `obj_bar`, your subsequent call can include `ending_before=obj_bar` in order to fetch the previous page of the list.
        attr_accessor :ending_before
        # Specifies which fields in the response should be expanded.
        attr_accessor :expand
        # A limit on the number of objects to be returned. Limit can range between 1 and 100, and the default is 10.
        attr_accessor :limit
        # A cursor for use in pagination. `starting_after` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, ending with `obj_foo`, your subsequent call can include `starting_after=obj_foo` in order to fetch the next page of the list.
        attr_accessor :starting_after

        def initialize(ending_before: nil, expand: nil, limit: nil, starting_after: nil)
          @ending_before = ending_before
          @expand = expand
          @limit = limit
          @starting_after = starting_after
        end
      end

      class ExpireParams < Stripe::RequestParams
        # Specifies which fields in the response should be expanded.
        attr_accessor :expand

        def initialize(expand: nil)
          @expand = expand
        end
      end
      # Settings for price localization with [Adaptive Pricing](https://docs.stripe.com/payments/checkout/adaptive-pricing).
      attr_reader :adaptive_pricing
      # When set, provides configuration for actions to take if this Checkout Session expires.
      attr_reader :after_expiration
      # Enables user redeemable promotion codes.
      attr_reader :allow_promotion_codes
      # Total of all items before discounts or taxes are applied.
      attr_reader :amount_subtotal
      # Total of all items after discounts and taxes are applied.
      attr_reader :amount_total
      # Attribute for field automatic_tax
      attr_reader :automatic_tax
      # Describes whether Checkout should collect the customer's billing address. Defaults to `auto`.
      attr_reader :billing_address_collection
      # If set, Checkout displays a back button and customers will be directed to this URL if they decide to cancel payment and return to your website.
      attr_reader :cancel_url
      # A unique string to reference the Checkout Session. This can be a
      # customer ID, a cart ID, or similar, and can be used to reconcile the
      # Session with your internal systems.
      attr_reader :client_reference_id
      # The client secret of the Session. Use this with [initCheckout](https://stripe.com/docs/js/custom_checkout/init) on your front end.
      attr_reader :client_secret
      # Information about the customer collected within the Checkout Session.
      attr_reader :collected_information
      # Results of `consent_collection` for this session.
      attr_reader :consent
      # When set, provides configuration for the Checkout Session to gather active consent from customers.
      attr_reader :consent_collection
      # Time at which the object was created. Measured in seconds since the Unix epoch.
      attr_reader :created
      # Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies).
      attr_reader :currency
      # Currency conversion details for [Adaptive Pricing](https://docs.stripe.com/payments/checkout/adaptive-pricing) sessions
      attr_reader :currency_conversion
      # Collect additional information from your customer using custom fields. Up to 3 fields are supported.
      attr_reader :custom_fields
      # Attribute for field custom_text
      attr_reader :custom_text
      # The ID of the customer for this Session.
      # For Checkout Sessions in `subscription` mode or Checkout Sessions with `customer_creation` set as `always` in `payment` mode, Checkout
      # will create a new customer object based on information provided
      # during the payment flow unless an existing customer was provided when
      # the Session was created.
      attr_reader :customer
      # Configure whether a Checkout Session creates a Customer when the Checkout Session completes.
      attr_reader :customer_creation
      # The customer details including the customer's tax exempt status and the customer's tax IDs. Customer's address details are not present on Sessions in `setup` mode.
      attr_reader :customer_details
      # If provided, this value will be used when the Customer object is created.
      # If not provided, customers will be asked to enter their email address.
      # Use this parameter to prefill customer data if you already have an email
      # on file. To access information about the customer once the payment flow is
      # complete, use the `customer` attribute.
      attr_reader :customer_email
      # The timestamp at which the Checkout Session will expire.
      attr_reader :expires_at
      # Unique identifier for the object.
      attr_reader :id
      # ID of the invoice created by the Checkout Session, if it exists.
      attr_reader :invoice
      # Details on the state of invoice creation for the Checkout Session.
      attr_reader :invoice_creation
      # The line items purchased by the customer.
      attr_reader :line_items
      # Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
      attr_reader :livemode
      # The IETF language tag of the locale Checkout is displayed in. If blank or `auto`, the browser's locale is used.
      attr_reader :locale
      # Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format.
      attr_reader :metadata
      # The mode of the Checkout Session.
      attr_reader :mode
      # String representing the object's type. Objects of the same type share the same value.
      attr_reader :object
      # The ID of the PaymentIntent for Checkout Sessions in `payment` mode. You can't confirm or cancel the PaymentIntent for a Checkout Session. To cancel, [expire the Checkout Session](https://stripe.com/docs/api/checkout/sessions/expire) instead.
      attr_reader :payment_intent
      # The ID of the Payment Link that created this Session.
      attr_reader :payment_link
      # Configure whether a Checkout Session should collect a payment method. Defaults to `always`.
      attr_reader :payment_method_collection
      # Information about the payment method configuration used for this Checkout session if using dynamic payment methods.
      attr_reader :payment_method_configuration_details
      # Payment-method-specific configuration for the PaymentIntent or SetupIntent of this CheckoutSession.
      attr_reader :payment_method_options
      # A list of the types of payment methods (e.g. card) this Checkout
      # Session is allowed to accept.
      attr_reader :payment_method_types
      # The payment status of the Checkout Session, one of `paid`, `unpaid`, or `no_payment_required`.
      # You can use this value to decide when to fulfill your customer's order.
      attr_reader :payment_status
      # This property is used to set up permissions for various actions (e.g., update) on the CheckoutSession object.
      #
      # For specific permissions, please refer to their dedicated subsections, such as `permissions.update.shipping_details`.
      attr_reader :permissions
      # Attribute for field phone_number_collection
      attr_reader :phone_number_collection
      # The ID of the original expired Checkout Session that triggered the recovery flow.
      attr_reader :recovered_from
      # This parameter applies to `ui_mode: embedded`. Learn more about the [redirect behavior](https://stripe.com/docs/payments/checkout/custom-success-page?payment-ui=embedded-form) of embedded sessions. Defaults to `always`.
      attr_reader :redirect_on_completion
      # Applies to Checkout Sessions with `ui_mode: embedded` or `ui_mode: custom`. The URL to redirect your customer back to after they authenticate or cancel their payment on the payment method's app or site.
      attr_reader :return_url
      # Controls saved payment method settings for the session. Only available in `payment` and `subscription` mode.
      attr_reader :saved_payment_method_options
      # The ID of the SetupIntent for Checkout Sessions in `setup` mode. You can't confirm or cancel the SetupIntent for a Checkout Session. To cancel, [expire the Checkout Session](https://stripe.com/docs/api/checkout/sessions/expire) instead.
      attr_reader :setup_intent
      # When set, provides configuration for Checkout to collect a shipping address from a customer.
      attr_reader :shipping_address_collection
      # The details of the customer cost of shipping, including the customer chosen ShippingRate.
      attr_reader :shipping_cost
      # Shipping information for this Checkout Session.
      attr_reader :shipping_details
      # The shipping rate options applied to this Session.
      attr_reader :shipping_options
      # The status of the Checkout Session, one of `open`, `complete`, or `expired`.
      attr_reader :status
      # Describes the type of transaction being performed by Checkout in order to customize
      # relevant text on the page, such as the submit button. `submit_type` can only be
      # specified on Checkout Sessions in `payment` mode. If blank or `auto`, `pay` is used.
      attr_reader :submit_type
      # The ID of the subscription for Checkout Sessions in `subscription` mode.
      attr_reader :subscription
      # The URL the customer will be directed to after the payment or
      # subscription creation is successful.
      attr_reader :success_url
      # Attribute for field tax_id_collection
      attr_reader :tax_id_collection
      # Tax and discount details for the computed total amount.
      attr_reader :total_details
      # The UI mode of the Session. Defaults to `hosted`.
      attr_reader :ui_mode
      # The URL to the Checkout Session. Redirect customers to this URL to take them to Checkout. If you’re using [Custom Domains](https://stripe.com/docs/payments/checkout/custom-domains), the URL will use your subdomain. Otherwise, it’ll use `checkout.stripe.com.`
      # This value is only present when the session is active.
      attr_reader :url

      # Creates a Session object.
      def self.create(params = {}, opts = {})
        request_stripe_object(
          method: :post,
          path: "/v1/checkout/sessions",
          params: params,
          opts: opts
        )
      end

      # A Session can be expired when it is in one of these statuses: open
      #
      # After it expires, a customer can't complete a Session and customers loading the Session see a message saying the Session is expired.
      def expire(params = {}, opts = {})
        request_stripe_object(
          method: :post,
          path: format("/v1/checkout/sessions/%<session>s/expire", { session: CGI.escape(self["id"]) }),
          params: params,
          opts: opts
        )
      end

      # A Session can be expired when it is in one of these statuses: open
      #
      # After it expires, a customer can't complete a Session and customers loading the Session see a message saying the Session is expired.
      def self.expire(session, params = {}, opts = {})
        request_stripe_object(
          method: :post,
          path: format("/v1/checkout/sessions/%<session>s/expire", { session: CGI.escape(session) }),
          params: params,
          opts: opts
        )
      end

      # Returns a list of Checkout Sessions.
      def self.list(params = {}, opts = {})
        request_stripe_object(
          method: :get,
          path: "/v1/checkout/sessions",
          params: params,
          opts: opts
        )
      end

      # When retrieving a Checkout Session, there is an includable line_items property containing the first handful of those items. There is also a URL where you can retrieve the full (paginated) list of line items.
      def list_line_items(params = {}, opts = {})
        request_stripe_object(
          method: :get,
          path: format("/v1/checkout/sessions/%<session>s/line_items", { session: CGI.escape(self["id"]) }),
          params: params,
          opts: opts
        )
      end

      # When retrieving a Checkout Session, there is an includable line_items property containing the first handful of those items. There is also a URL where you can retrieve the full (paginated) list of line items.
      def self.list_line_items(session, params = {}, opts = {})
        request_stripe_object(
          method: :get,
          path: format("/v1/checkout/sessions/%<session>s/line_items", { session: CGI.escape(session) }),
          params: params,
          opts: opts
        )
      end

      # Updates a Session object.
      def self.update(id, params = {}, opts = {})
        request_stripe_object(
          method: :post,
          path: format("/v1/checkout/sessions/%<id>s", { id: CGI.escape(id) }),
          params: params,
          opts: opts
        )
      end
    end
  end
end
