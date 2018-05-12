require 'jwt'

class Auth
  ALGORITHM = 'HS256'

  def self.encrypt(payload)
    JWT.encode(payload, secret_key, ALGORITHM)
  end

  def self.decode(token)
    JWT.decode(token, secret_key, true, { algorithm: ALGORITHM }).first
  end

  def self.secret_key
    '5f163f719115debc8cdc61c33055f934ebef8abf08ca82d5d6a018ee01cbc2e7fdaada47fbfd3ad3aa885afea19176881a345631748091ca4868ddc1b3d46db7'
  end
end
