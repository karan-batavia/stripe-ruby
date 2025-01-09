# File generated from our OpenAPI spec
# frozen_string_literal: true

module Stripe
  module Billing
    class CreditBalanceSummaryService < StripeService
      class RetrieveParams < Stripe::RequestParams
        class Filter < Stripe::RequestParams
          class ApplicabilityScope < Stripe::RequestParams
            # The price type that credit grants can apply to. We currently only support the `metered` price type.
            attr_accessor :price_type

            def initialize(price_type: nil)
              @price_type = price_type
            end
          end
          # The billing credit applicability scope for which to fetch credit balance summary.
          attr_accessor :applicability_scope
          # The credit grant for which to fetch credit balance summary.
          attr_accessor :credit_grant
          # Specify the type of this filter.
          attr_accessor :type

          def initialize(applicability_scope: nil, credit_grant: nil, type: nil)
            @applicability_scope = applicability_scope
            @credit_grant = credit_grant
            @type = type
          end
        end
        # The customer for which to fetch credit balance summary.
        attr_accessor :customer
        # Specifies which fields in the response should be expanded.
        attr_accessor :expand
        # The filter criteria for the credit balance summary.
        attr_accessor :filter

        def initialize(customer: nil, expand: nil, filter: nil)
          @customer = customer
          @expand = expand
          @filter = filter
        end
      end

      # Retrieves the credit balance summary for a customer.
      def retrieve(params = {}, opts = {})
        request(
          method: :get,
          path: "/v1/billing/credit_balance_summary",
          params: params,
          opts: opts,
          base_address: :api
        )
      end
    end
  end
end
