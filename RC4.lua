RC4 = {}

local string_byte = string.byte
local string_char = string.char
local string_len = string.len
local bit_bxor = bit.bxor
local table_concat = table.concat

local function initialize(key)
	local S = {}
	local keyLen = string_len(key)
	
	for i = 0, 255 do
		S[i] = i
	end

	local j = 0
	for i = 0, 255 do
		j = (j + S[i] + string_byte(key, i % keyLen + 1)) % 256
		S[i], S[j] = S[j], S[i]
	end
	
	return S
end
RC4.initialize = initialize

local function generatestream(S, len)
	local i, j = 0, 0
	local keystream = {}
	
	for k = 1, len do
		i = (i + 1)	% 256
		j = (j + S[i])	% 256
		
		S[i], S[j] = S[j], S[i]
		keystream[k] = S[(S[i] + S[j]) % 256]
	end
	
	return keystream
end
RC4.generatestream = generatestream

local function crypt(key, msg)
	local ciphertext = {}
	local msgLen = string_len(msg)
	
	local keystream = generatestream(initialize(key), msgLen)
	
	for i = 1, msgLen do
		ciphertext[i] = string_char(bit_bxor(string_byte(msg, i), keystream[i]))
	end
	
	return table_concat(ciphertext)
end
RC4.crypt = crypt
