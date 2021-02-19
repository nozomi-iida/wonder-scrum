# frozen_string_literal: true

# ExceptionHandler
module ExceptionHandler
  # エラーコード
  module ErrorCode
    UNAUTHORIZED_ERROR = 'UNAUTHORIZED_ERROR'
    INTERNAL_SERVER_ERROR = 'INTERNAL_SERVER_ERROR'
  end

  included do
    rescue_from Exceptions::UnauthorizedError do |e|
      fail GraphQL::ExecutionError.new("認証エラー: #{e.message}", extensions: { code: ErrorCode::UNAUTHORIZED_ERROR })
    end

    rescue_from StandardError do |e|
      fail GraphQL::ExecutionError.new(e.message, extensions: { code: ErrorCode::INTERNAL_SERVER_ERROR })
    end
  end
end
