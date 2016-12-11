# Be sure to restart your server when you modify this file.

Rails.application.config.session_store :cookie_store, key: '_bookstore_session'

Rails.application.config.session_store(
  :cookie_store,
  key: 'order_id',
  expire_after: 3.hours
)
