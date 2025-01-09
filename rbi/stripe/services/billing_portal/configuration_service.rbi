# File generated from our OpenAPI spec
# frozen_string_literal: true

# typed: true
module Stripe
  module BillingPortal
    class ConfigurationService < StripeService
      class ListParams < Stripe::RequestParams
        # Only return configurations that are active or inactive (e.g., pass `true` to only list active configurations).
        sig { returns(T::Boolean) }
        attr_accessor :active
        # A cursor for use in pagination. `ending_before` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, starting with `obj_bar`, your subsequent call can include `ending_before=obj_bar` in order to fetch the previous page of the list.
        sig { returns(String) }
        attr_accessor :ending_before
        # Specifies which fields in the response should be expanded.
        sig { returns(T::Array[String]) }
        attr_accessor :expand
        # Only return the default or non-default configurations (e.g., pass `true` to only list the default configuration).
        sig { returns(T::Boolean) }
        attr_accessor :is_default
        # A limit on the number of objects to be returned. Limit can range between 1 and 100, and the default is 10.
        sig { returns(Integer) }
        attr_accessor :limit
        # A cursor for use in pagination. `starting_after` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, ending with `obj_foo`, your subsequent call can include `starting_after=obj_foo` in order to fetch the next page of the list.
        sig { returns(String) }
        attr_accessor :starting_after
        sig {
          params(active: T::Boolean, ending_before: String, expand: T::Array[String], is_default: T::Boolean, limit: Integer, starting_after: String).void
         }
        def initialize(
          active: nil,
          ending_before: nil,
          expand: nil,
          is_default: nil,
          limit: nil,
          starting_after: nil
        ); end
      end
      class CreateParams < Stripe::RequestParams
        class BusinessProfile < Stripe::RequestParams
          # The messaging shown to customers in the portal.
          sig { returns(T.nilable(String)) }
          attr_accessor :headline
          # A link to the business’s publicly available privacy policy.
          sig { returns(String) }
          attr_accessor :privacy_policy_url
          # A link to the business’s publicly available terms of service.
          sig { returns(String) }
          attr_accessor :terms_of_service_url
          sig {
            params(headline: T.nilable(String), privacy_policy_url: String, terms_of_service_url: String).void
           }
          def initialize(headline: nil, privacy_policy_url: nil, terms_of_service_url: nil); end
        end
        class Features < Stripe::RequestParams
          class CustomerUpdate < Stripe::RequestParams
            # The types of customer updates that are supported. When empty, customers are not updateable.
            sig { returns(T.nilable(T::Array[String])) }
            attr_accessor :allowed_updates
            # Whether the feature is enabled.
            sig { returns(T::Boolean) }
            attr_accessor :enabled
            sig { params(allowed_updates: T.nilable(T::Array[String]), enabled: T::Boolean).void }
            def initialize(allowed_updates: nil, enabled: nil); end
          end
          class InvoiceHistory < Stripe::RequestParams
            # Whether the feature is enabled.
            sig { returns(T::Boolean) }
            attr_accessor :enabled
            sig { params(enabled: T::Boolean).void }
            def initialize(enabled: nil); end
          end
          class PaymentMethodUpdate < Stripe::RequestParams
            # Whether the feature is enabled.
            sig { returns(T::Boolean) }
            attr_accessor :enabled
            sig { params(enabled: T::Boolean).void }
            def initialize(enabled: nil); end
          end
          class SubscriptionCancel < Stripe::RequestParams
            class CancellationReason < Stripe::RequestParams
              # Whether the feature is enabled.
              sig { returns(T::Boolean) }
              attr_accessor :enabled
              # Which cancellation reasons will be given as options to the customer.
              sig { returns(T.nilable(T::Array[String])) }
              attr_accessor :options
              sig { params(enabled: T::Boolean, options: T.nilable(T::Array[String])).void }
              def initialize(enabled: nil, options: nil); end
            end
            # Whether the cancellation reasons will be collected in the portal and which options are exposed to the customer
            sig {
              returns(::Stripe::BillingPortal::ConfigurationService::CreateParams::Features::SubscriptionCancel::CancellationReason)
             }
            attr_accessor :cancellation_reason
            # Whether the feature is enabled.
            sig { returns(T::Boolean) }
            attr_accessor :enabled
            # Whether to cancel subscriptions immediately or at the end of the billing period.
            sig { returns(String) }
            attr_accessor :mode
            # Whether to create prorations when canceling subscriptions. Possible values are `none` and `create_prorations`, which is only compatible with `mode=immediately`. No prorations are generated when canceling a subscription at the end of its natural billing period.
            sig { returns(String) }
            attr_accessor :proration_behavior
            sig {
              params(cancellation_reason: ::Stripe::BillingPortal::ConfigurationService::CreateParams::Features::SubscriptionCancel::CancellationReason, enabled: T::Boolean, mode: String, proration_behavior: String).void
             }
            def initialize(
              cancellation_reason: nil,
              enabled: nil,
              mode: nil,
              proration_behavior: nil
            ); end
          end
          class SubscriptionUpdate < Stripe::RequestParams
            class Product < Stripe::RequestParams
              # The list of price IDs for the product that a subscription can be updated to.
              sig { returns(T::Array[String]) }
              attr_accessor :prices
              # The product id.
              sig { returns(String) }
              attr_accessor :product
              sig { params(prices: T::Array[String], product: String).void }
              def initialize(prices: nil, product: nil); end
            end
            class ScheduleAtPeriodEnd < Stripe::RequestParams
              class Condition < Stripe::RequestParams
                # The type of condition.
                sig { returns(String) }
                attr_accessor :type
                sig { params(type: String).void }
                def initialize(type: nil); end
              end
              # List of conditions. When any condition is true, the update will be scheduled at the end of the current period.
              sig {
                returns(T::Array[::Stripe::BillingPortal::ConfigurationService::CreateParams::Features::SubscriptionUpdate::ScheduleAtPeriodEnd::Condition])
               }
              attr_accessor :conditions
              sig {
                params(conditions: T::Array[::Stripe::BillingPortal::ConfigurationService::CreateParams::Features::SubscriptionUpdate::ScheduleAtPeriodEnd::Condition]).void
               }
              def initialize(conditions: nil); end
            end
            # The types of subscription updates that are supported. When empty, subscriptions are not updateable.
            sig { returns(T.nilable(T::Array[String])) }
            attr_accessor :default_allowed_updates
            # Whether the feature is enabled.
            sig { returns(T::Boolean) }
            attr_accessor :enabled
            # The list of up to 10 products that support subscription updates.
            sig {
              returns(T.nilable(T::Array[::Stripe::BillingPortal::ConfigurationService::CreateParams::Features::SubscriptionUpdate::Product]))
             }
            attr_accessor :products
            # Determines how to handle prorations resulting from subscription updates. Valid values are `none`, `create_prorations`, and `always_invoice`.
            sig { returns(String) }
            attr_accessor :proration_behavior
            # Setting to control when an update should be scheduled at the end of the period instead of applying immediately.
            sig {
              returns(::Stripe::BillingPortal::ConfigurationService::CreateParams::Features::SubscriptionUpdate::ScheduleAtPeriodEnd)
             }
            attr_accessor :schedule_at_period_end
            sig {
              params(default_allowed_updates: T.nilable(T::Array[String]), enabled: T::Boolean, products: T.nilable(T::Array[::Stripe::BillingPortal::ConfigurationService::CreateParams::Features::SubscriptionUpdate::Product]), proration_behavior: String, schedule_at_period_end: ::Stripe::BillingPortal::ConfigurationService::CreateParams::Features::SubscriptionUpdate::ScheduleAtPeriodEnd).void
             }
            def initialize(
              default_allowed_updates: nil,
              enabled: nil,
              products: nil,
              proration_behavior: nil,
              schedule_at_period_end: nil
            ); end
          end
          # Information about updating the customer details in the portal.
          sig {
            returns(::Stripe::BillingPortal::ConfigurationService::CreateParams::Features::CustomerUpdate)
           }
          attr_accessor :customer_update
          # Information about showing the billing history in the portal.
          sig {
            returns(::Stripe::BillingPortal::ConfigurationService::CreateParams::Features::InvoiceHistory)
           }
          attr_accessor :invoice_history
          # Information about updating payment methods in the portal.
          sig {
            returns(::Stripe::BillingPortal::ConfigurationService::CreateParams::Features::PaymentMethodUpdate)
           }
          attr_accessor :payment_method_update
          # Information about canceling subscriptions in the portal.
          sig {
            returns(::Stripe::BillingPortal::ConfigurationService::CreateParams::Features::SubscriptionCancel)
           }
          attr_accessor :subscription_cancel
          # Information about updating subscriptions in the portal.
          sig {
            returns(::Stripe::BillingPortal::ConfigurationService::CreateParams::Features::SubscriptionUpdate)
           }
          attr_accessor :subscription_update
          sig {
            params(customer_update: ::Stripe::BillingPortal::ConfigurationService::CreateParams::Features::CustomerUpdate, invoice_history: ::Stripe::BillingPortal::ConfigurationService::CreateParams::Features::InvoiceHistory, payment_method_update: ::Stripe::BillingPortal::ConfigurationService::CreateParams::Features::PaymentMethodUpdate, subscription_cancel: ::Stripe::BillingPortal::ConfigurationService::CreateParams::Features::SubscriptionCancel, subscription_update: ::Stripe::BillingPortal::ConfigurationService::CreateParams::Features::SubscriptionUpdate).void
           }
          def initialize(
            customer_update: nil,
            invoice_history: nil,
            payment_method_update: nil,
            subscription_cancel: nil,
            subscription_update: nil
          ); end
        end
        class LoginPage < Stripe::RequestParams
          # Set to `true` to generate a shareable URL [`login_page.url`](https://stripe.com/docs/api/customer_portal/configuration#portal_configuration_object-login_page-url) that will take your customers to a hosted login page for the customer portal.
          sig { returns(T::Boolean) }
          attr_accessor :enabled
          sig { params(enabled: T::Boolean).void }
          def initialize(enabled: nil); end
        end
        # The business information shown to customers in the portal.
        sig {
          returns(::Stripe::BillingPortal::ConfigurationService::CreateParams::BusinessProfile)
         }
        attr_accessor :business_profile
        # The default URL to redirect customers to when they click on the portal's link to return to your website. This can be [overriden](https://stripe.com/docs/api/customer_portal/sessions/create#create_portal_session-return_url) when creating the session.
        sig { returns(T.nilable(String)) }
        attr_accessor :default_return_url
        # Specifies which fields in the response should be expanded.
        sig { returns(T::Array[String]) }
        attr_accessor :expand
        # Information about the features available in the portal.
        sig { returns(::Stripe::BillingPortal::ConfigurationService::CreateParams::Features) }
        attr_accessor :features
        # The hosted login page for this configuration. Learn more about the portal login page in our [integration docs](https://stripe.com/docs/billing/subscriptions/integrating-customer-portal#share).
        sig { returns(::Stripe::BillingPortal::ConfigurationService::CreateParams::LoginPage) }
        attr_accessor :login_page
        # Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format. Individual keys can be unset by posting an empty value to them. All keys can be unset by posting an empty value to `metadata`.
        sig { returns(T::Hash[String, String]) }
        attr_accessor :metadata
        sig {
          params(business_profile: ::Stripe::BillingPortal::ConfigurationService::CreateParams::BusinessProfile, default_return_url: T.nilable(String), expand: T::Array[String], features: ::Stripe::BillingPortal::ConfigurationService::CreateParams::Features, login_page: ::Stripe::BillingPortal::ConfigurationService::CreateParams::LoginPage, metadata: T::Hash[String, String]).void
         }
        def initialize(
          business_profile: nil,
          default_return_url: nil,
          expand: nil,
          features: nil,
          login_page: nil,
          metadata: nil
        ); end
      end
      class RetrieveParams < Stripe::RequestParams
        # Specifies which fields in the response should be expanded.
        sig { returns(T::Array[String]) }
        attr_accessor :expand
        sig { params(expand: T::Array[String]).void }
        def initialize(expand: nil); end
      end
      class UpdateParams < Stripe::RequestParams
        class BusinessProfile < Stripe::RequestParams
          # The messaging shown to customers in the portal.
          sig { returns(T.nilable(String)) }
          attr_accessor :headline
          # A link to the business’s publicly available privacy policy.
          sig { returns(T.nilable(String)) }
          attr_accessor :privacy_policy_url
          # A link to the business’s publicly available terms of service.
          sig { returns(T.nilable(String)) }
          attr_accessor :terms_of_service_url
          sig {
            params(headline: T.nilable(String), privacy_policy_url: T.nilable(String), terms_of_service_url: T.nilable(String)).void
           }
          def initialize(headline: nil, privacy_policy_url: nil, terms_of_service_url: nil); end
        end
        class Features < Stripe::RequestParams
          class CustomerUpdate < Stripe::RequestParams
            # The types of customer updates that are supported. When empty, customers are not updateable.
            sig { returns(T.nilable(T::Array[String])) }
            attr_accessor :allowed_updates
            # Whether the feature is enabled.
            sig { returns(T::Boolean) }
            attr_accessor :enabled
            sig { params(allowed_updates: T.nilable(T::Array[String]), enabled: T::Boolean).void }
            def initialize(allowed_updates: nil, enabled: nil); end
          end
          class InvoiceHistory < Stripe::RequestParams
            # Whether the feature is enabled.
            sig { returns(T::Boolean) }
            attr_accessor :enabled
            sig { params(enabled: T::Boolean).void }
            def initialize(enabled: nil); end
          end
          class PaymentMethodUpdate < Stripe::RequestParams
            # Whether the feature is enabled.
            sig { returns(T::Boolean) }
            attr_accessor :enabled
            sig { params(enabled: T::Boolean).void }
            def initialize(enabled: nil); end
          end
          class SubscriptionCancel < Stripe::RequestParams
            class CancellationReason < Stripe::RequestParams
              # Whether the feature is enabled.
              sig { returns(T::Boolean) }
              attr_accessor :enabled
              # Which cancellation reasons will be given as options to the customer.
              sig { returns(T.nilable(T::Array[String])) }
              attr_accessor :options
              sig { params(enabled: T::Boolean, options: T.nilable(T::Array[String])).void }
              def initialize(enabled: nil, options: nil); end
            end
            # Whether the cancellation reasons will be collected in the portal and which options are exposed to the customer
            sig {
              returns(::Stripe::BillingPortal::ConfigurationService::UpdateParams::Features::SubscriptionCancel::CancellationReason)
             }
            attr_accessor :cancellation_reason
            # Whether the feature is enabled.
            sig { returns(T::Boolean) }
            attr_accessor :enabled
            # Whether to cancel subscriptions immediately or at the end of the billing period.
            sig { returns(String) }
            attr_accessor :mode
            # Whether to create prorations when canceling subscriptions. Possible values are `none` and `create_prorations`, which is only compatible with `mode=immediately`. No prorations are generated when canceling a subscription at the end of its natural billing period.
            sig { returns(String) }
            attr_accessor :proration_behavior
            sig {
              params(cancellation_reason: ::Stripe::BillingPortal::ConfigurationService::UpdateParams::Features::SubscriptionCancel::CancellationReason, enabled: T::Boolean, mode: String, proration_behavior: String).void
             }
            def initialize(
              cancellation_reason: nil,
              enabled: nil,
              mode: nil,
              proration_behavior: nil
            ); end
          end
          class SubscriptionUpdate < Stripe::RequestParams
            class Product < Stripe::RequestParams
              # The list of price IDs for the product that a subscription can be updated to.
              sig { returns(T::Array[String]) }
              attr_accessor :prices
              # The product id.
              sig { returns(String) }
              attr_accessor :product
              sig { params(prices: T::Array[String], product: String).void }
              def initialize(prices: nil, product: nil); end
            end
            class ScheduleAtPeriodEnd < Stripe::RequestParams
              class Condition < Stripe::RequestParams
                # The type of condition.
                sig { returns(String) }
                attr_accessor :type
                sig { params(type: String).void }
                def initialize(type: nil); end
              end
              # List of conditions. When any condition is true, the update will be scheduled at the end of the current period.
              sig {
                returns(T.nilable(T::Array[::Stripe::BillingPortal::ConfigurationService::UpdateParams::Features::SubscriptionUpdate::ScheduleAtPeriodEnd::Condition]))
               }
              attr_accessor :conditions
              sig {
                params(conditions: T.nilable(T::Array[::Stripe::BillingPortal::ConfigurationService::UpdateParams::Features::SubscriptionUpdate::ScheduleAtPeriodEnd::Condition])).void
               }
              def initialize(conditions: nil); end
            end
            # The types of subscription updates that are supported. When empty, subscriptions are not updateable.
            sig { returns(T.nilable(T::Array[String])) }
            attr_accessor :default_allowed_updates
            # Whether the feature is enabled.
            sig { returns(T::Boolean) }
            attr_accessor :enabled
            # The list of up to 10 products that support subscription updates.
            sig {
              returns(T.nilable(T::Array[::Stripe::BillingPortal::ConfigurationService::UpdateParams::Features::SubscriptionUpdate::Product]))
             }
            attr_accessor :products
            # Determines how to handle prorations resulting from subscription updates. Valid values are `none`, `create_prorations`, and `always_invoice`.
            sig { returns(String) }
            attr_accessor :proration_behavior
            # Setting to control when an update should be scheduled at the end of the period instead of applying immediately.
            sig {
              returns(::Stripe::BillingPortal::ConfigurationService::UpdateParams::Features::SubscriptionUpdate::ScheduleAtPeriodEnd)
             }
            attr_accessor :schedule_at_period_end
            sig {
              params(default_allowed_updates: T.nilable(T::Array[String]), enabled: T::Boolean, products: T.nilable(T::Array[::Stripe::BillingPortal::ConfigurationService::UpdateParams::Features::SubscriptionUpdate::Product]), proration_behavior: String, schedule_at_period_end: ::Stripe::BillingPortal::ConfigurationService::UpdateParams::Features::SubscriptionUpdate::ScheduleAtPeriodEnd).void
             }
            def initialize(
              default_allowed_updates: nil,
              enabled: nil,
              products: nil,
              proration_behavior: nil,
              schedule_at_period_end: nil
            ); end
          end
          # Information about updating the customer details in the portal.
          sig {
            returns(::Stripe::BillingPortal::ConfigurationService::UpdateParams::Features::CustomerUpdate)
           }
          attr_accessor :customer_update
          # Information about showing the billing history in the portal.
          sig {
            returns(::Stripe::BillingPortal::ConfigurationService::UpdateParams::Features::InvoiceHistory)
           }
          attr_accessor :invoice_history
          # Information about updating payment methods in the portal.
          sig {
            returns(::Stripe::BillingPortal::ConfigurationService::UpdateParams::Features::PaymentMethodUpdate)
           }
          attr_accessor :payment_method_update
          # Information about canceling subscriptions in the portal.
          sig {
            returns(::Stripe::BillingPortal::ConfigurationService::UpdateParams::Features::SubscriptionCancel)
           }
          attr_accessor :subscription_cancel
          # Information about updating subscriptions in the portal.
          sig {
            returns(::Stripe::BillingPortal::ConfigurationService::UpdateParams::Features::SubscriptionUpdate)
           }
          attr_accessor :subscription_update
          sig {
            params(customer_update: ::Stripe::BillingPortal::ConfigurationService::UpdateParams::Features::CustomerUpdate, invoice_history: ::Stripe::BillingPortal::ConfigurationService::UpdateParams::Features::InvoiceHistory, payment_method_update: ::Stripe::BillingPortal::ConfigurationService::UpdateParams::Features::PaymentMethodUpdate, subscription_cancel: ::Stripe::BillingPortal::ConfigurationService::UpdateParams::Features::SubscriptionCancel, subscription_update: ::Stripe::BillingPortal::ConfigurationService::UpdateParams::Features::SubscriptionUpdate).void
           }
          def initialize(
            customer_update: nil,
            invoice_history: nil,
            payment_method_update: nil,
            subscription_cancel: nil,
            subscription_update: nil
          ); end
        end
        class LoginPage < Stripe::RequestParams
          # Set to `true` to generate a shareable URL [`login_page.url`](https://stripe.com/docs/api/customer_portal/configuration#portal_configuration_object-login_page-url) that will take your customers to a hosted login page for the customer portal.
          #
          # Set to `false` to deactivate the `login_page.url`.
          sig { returns(T::Boolean) }
          attr_accessor :enabled
          sig { params(enabled: T::Boolean).void }
          def initialize(enabled: nil); end
        end
        # Whether the configuration is active and can be used to create portal sessions.
        sig { returns(T::Boolean) }
        attr_accessor :active
        # The business information shown to customers in the portal.
        sig {
          returns(::Stripe::BillingPortal::ConfigurationService::UpdateParams::BusinessProfile)
         }
        attr_accessor :business_profile
        # The default URL to redirect customers to when they click on the portal's link to return to your website. This can be [overriden](https://stripe.com/docs/api/customer_portal/sessions/create#create_portal_session-return_url) when creating the session.
        sig { returns(T.nilable(String)) }
        attr_accessor :default_return_url
        # Specifies which fields in the response should be expanded.
        sig { returns(T::Array[String]) }
        attr_accessor :expand
        # Information about the features available in the portal.
        sig { returns(::Stripe::BillingPortal::ConfigurationService::UpdateParams::Features) }
        attr_accessor :features
        # The hosted login page for this configuration. Learn more about the portal login page in our [integration docs](https://stripe.com/docs/billing/subscriptions/integrating-customer-portal#share).
        sig { returns(::Stripe::BillingPortal::ConfigurationService::UpdateParams::LoginPage) }
        attr_accessor :login_page
        # Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format. Individual keys can be unset by posting an empty value to them. All keys can be unset by posting an empty value to `metadata`.
        sig { returns(T.nilable(T::Hash[String, String])) }
        attr_accessor :metadata
        sig {
          params(active: T::Boolean, business_profile: ::Stripe::BillingPortal::ConfigurationService::UpdateParams::BusinessProfile, default_return_url: T.nilable(String), expand: T::Array[String], features: ::Stripe::BillingPortal::ConfigurationService::UpdateParams::Features, login_page: ::Stripe::BillingPortal::ConfigurationService::UpdateParams::LoginPage, metadata: T.nilable(T::Hash[String, String])).void
         }
        def initialize(
          active: nil,
          business_profile: nil,
          default_return_url: nil,
          expand: nil,
          features: nil,
          login_page: nil,
          metadata: nil
        ); end
      end
      # Creates a configuration that describes the functionality and behavior of a PortalSession
      sig {
        params(params: T.any(::Stripe::BillingPortal::ConfigurationService::CreateParams, T::Hash[T.untyped, T.untyped]), opts: T.untyped).returns(Stripe::BillingPortal::Configuration)
       }
      def create(params = {}, opts = {}); end

      # Returns a list of configurations that describe the functionality of the customer portal.
      sig {
        params(params: T.any(::Stripe::BillingPortal::ConfigurationService::ListParams, T::Hash[T.untyped, T.untyped]), opts: T.untyped).returns(Stripe::ListObject)
       }
      def list(params = {}, opts = {}); end

      # Retrieves a configuration that describes the functionality of the customer portal.
      sig {
        params(configuration: String, params: T.any(::Stripe::BillingPortal::ConfigurationService::RetrieveParams, T::Hash[T.untyped, T.untyped]), opts: T.untyped).returns(Stripe::BillingPortal::Configuration)
       }
      def retrieve(configuration, params = {}, opts = {}); end

      # Updates a configuration that describes the functionality of the customer portal.
      sig {
        params(configuration: String, params: T.any(::Stripe::BillingPortal::ConfigurationService::UpdateParams, T::Hash[T.untyped, T.untyped]), opts: T.untyped).returns(Stripe::BillingPortal::Configuration)
       }
      def update(configuration, params = {}, opts = {}); end
    end
  end
end