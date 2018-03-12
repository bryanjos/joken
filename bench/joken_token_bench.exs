Code.load_file("test/support/keys_fixture.exs")

defmodule Joken.Token.Bench do
  use Benchfella
  import Joken
  import Joken.Fixtures

  @secret "test"

  setup_all do
    app = :joken
    :application.ensure_all_started(app)
    Logger.configure(level: :warn)
    JOSE.JWA.crypto_fallback(true)
    {:ok, app}
  end

  teardown_all app do
    :application.stop(app)
  end

  ## ------------------------------
  ## HS256, HS384, HS512 benchmarks
  ## ------------------------------

  bench "HS256 token generation" do
    token |> sign(hs256(@secret)) |> get_compact
    :ok
  end

  bench "HS384 token generation" do
    token |> sign(hs384(@secret)) |> get_compact
    :ok
  end

  bench "HS512 token generation" do
    token |> sign(hs512(@secret)) |> get_compact
    :ok
  end

  ## ------------------------------
  ## RS256, RS384, RS512 benchmarks
  ## ------------------------------
  bench "RS256 token generation" do
    token |> sign(rs256(rsa_key)) |> get_compact
    :ok
  end

  bench "RS384 token generation" do
    token |> sign(rs384(rsa_key)) |> get_compact
    :ok
  end

  bench "RS512 token generation" do
    token |> sign(rs512(rsa_key)) |> get_compact
    :ok
  end

  ## ------------------------------
  ## ES256, ES384, ES512 benchmarks
  ## ------------------------------
  bench "ES256 token generation" do
    token |> sign(es256(ec_p256_key)) |> get_compact
    :ok
  end

  bench "ES384 token generation" do
    token |> sign(es384(ec_p384_key)) |> get_compact
    :ok
  end

  bench "ES512 token generation" do
    token |> sign(es512(ec_p521_key)) |> get_compact
    :ok
  end

  ## ------------------------------
  ## PS256, PS384, PS512 benchmarks
  ## ------------------------------
  bench "PS256 token generation" do
    token |> sign(ps256(rsa_key)) |> get_compact
    :ok
  end

  bench "PS384 token generation" do
    token |> sign(ps384(rsa_key)) |> get_compact
    :ok
  end

  bench "PS512 token generation" do
    token |> sign(ps512(rsa_key)) |> get_compact
    :ok
  end

  ## ---------------------------------------------
  ## Ed25519, Ed25519ph, Ed448, Ed448ph benchmarks
  ## ---------------------------------------------
  bench "Ed25519 token generation" do
    token |> sign(ed25519(ed25519_key)) |> get_compact
    :ok
  end

  bench "Ed25519ph token generation" do
    token |> sign(ed25519ph(ed25519ph_key)) |> get_compact
    :ok
  end

  bench "Ed448 token generation" do
    token |> sign(ed448(ed448_key)) |> get_compact
    :ok
  end

  bench "Ed448ph token generation" do
    token |> sign(ed448ph(ed448ph_key)) |> get_compact
    :ok
  end
end
