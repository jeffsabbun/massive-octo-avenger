class PostPolicy < ApplicationPolicy
          attr_reader :user, :record

      def initialize(user, record)
        @user = user
        @record = record
      end
      def edit?
        user.present? && (record.user == user || user.role == "admin" )
      end

    def index?
        true
     end

end

