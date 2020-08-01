-- webchum.util.auth
import hash_encoded, verify from require "argon2"
import bytes                from require "openssl.rand"
import config               from require "webchum.config"

hashPassword   = (pwd)       -> (hash_encoded pwd, bytes 16)\sub 1, -2
verifyPassword = (pwd, hash) -> verify "#{hash}\0", pwd

{
  :hashPassword, :verifyPassword
}