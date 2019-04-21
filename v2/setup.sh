#! /bin/bash

master_sh="IyEgL2Jpbi9iYXNoCgpmdW5jdGlvbiBlY2hvLWxvZwp7CiAgICAKICAgIGVjaG8gLWUgIlwwMzNbNDY7MzBtICQxIFwwMzNbMG0iCiAgICBlY2hvICItLS0tLS0tLS0tLS0tIgp9Cgoj6YWN572uCklQX01BU1RFUj0iMTkyLjE2OC4xLjIwMSIKSVBfU0xBVkUxPSIxOTIuMTY4LjEuMjAyIgpJUF9TTEFWRTI9IjE5Mi4xNjguMS4yMDMiCmVjaG8tbG9nICJJUF9NQVNURVI9JElQX01BU1RFUiIKZWNoby1sb2cgIklQX1NMQVZFMT0kSVBfU0xBVkUxIgplY2hvLWxvZyAiSVBfU0xBVkUyPSRJUF9TTEFWRTIiCmVjaG8tbG9nICJQcmVzcyBhbnkga2V5IHRvIGNvbnRpdW5lLiIKcmVhZAoKI+W7uueri+aXpeW/l+aWh+S7tuWkuQppZiAoIHRlc3QgLWQgLi9sb2cgKQp0aGVuCiAgICBscyAuL2xvZwplbHNlCiAgICBta2RpciAuL2xvZwpmaQoKI+WFs+mXremYsueBq+WimQplY2hvLWxvZyAiU3RvcCBhbmQgRGlzYWJsZSBmaXJld2FsbGQiCnN5c3RlbWN0bCBzdG9wIGZpcmV3YWxsZApzeXN0ZW1jdGwgZGlzYWJsZSBmaXJld2FsbGQKCiPorr7nva7kuLvmnLrlkI0KZWNoby1sb2cgImhvc3RuYW1lIC0+IG1hc3RlciIKaG9zdG5hbWUgbWFzdGVyCmVjaG8gbWFzdGVyID4gL2V0Yy9ob3N0bmFtZQoKI+mFjee9rklQ5ZKMSG9zdHMKZWNoby1sb2cgIkJ1aWxkIC9ldGMvaG9zdHMiCmVjaG8tbG9nICJJUF9NQVNURVI9JElQX01BU1RFUiIKZWNoby1sb2cgIklQX1NMQVZFMT0kSVBfU0xBVkUxIgplY2hvLWxvZyAiSVBfU0xBVkUyPSRJUF9TTEFWRTIiCmVjaG8gIjEyNy4wLjAuMSBsb2NhbGhvc3QgbG9jYWxob3N0LmxvY2FsZG9tYWluIGxvY2FsaG9zdDQgbG9jYWxob3N0NC5sb2NhbGRvbWFpbjQiID4gL2V0Yy9ob3N0cwplY2hvICI6OjEgbG9jYWxob3N0IGxvY2FsaG9zdC5sb2NhbGRvbWFpbiBsb2NhbGhvc3Q2IGxvY2FsaG9zdDYubG9jYWxkb21haW42IiA+PiAvZXRjL2hvc3RzCmVjaG8gIiRJUF9NQVNURVIgbWFzdGVyIiA+PiAvZXRjL2hvc3RzCmVjaG8gIiRJUF9TTEFWRTEgc2xhdmUxIiA+PiAvZXRjL2hvc3RzCmVjaG8gIiRJUF9TTEFWRTIgc2xhdmUyIiA+PiAvZXRjL2hvc3RzCgoj5Y+R5biDSG9zdHMKZWNoby1sb2cgIlNlbmQgL2V0Yy9ob3N0cyIKc2NwIC9ldGMvaG9zdHMgc2xhdmUxOi9ldGMvaG9zdHMKc2NwIC9ldGMvaG9zdHMgc2xhdmUyOi9ldGMvaG9zdHMKCiPml7bpl7TlkIzmraUKbm93ZGF0ZT0kKGRhdGUpCmlmICh3aGlwdGFpbCAtLXRpdGxlICJDaGFuZ2UgVGltZSBab25lID8iIC0teWVzbm8gIiRub3dkYXRlIiAxMCA2MCkgdGhlbgogICAgdHpzZWxlY3QKZmkKY2xlYXIKd2hpY2ggbnRwZGF0ZQppZiBbWyAkPyA9PSAwIF1dCnRoZW4KICAgIGVjaG8tbG9nICdOVFAgaGFzIGluc3RhbGxlZCcKZWxzZQogICAgaWYgKHdoaXB0YWlsIC0tdGl0bGUgInl1bSBpbnN0YWxsIG50cCA/IiAtLXllc25vICIiIDEwIDYwKSB0aGVuCiAgICAgICAgZWNoby1sb2cgJ0luc3RhbGwgTlRQLi4uJwogICAgICAgIHl1bSBpbnN0YWxsIG50cCAteSA+PiAuL2xvZy9udHAubG9nCiAgICBmaQpmaQp3aGljaCBudHBkYXRlCmlmIFtbICQ/ID09IDAgXV0KdGhlbgogICAgZWNobyAiZGlzYWJsZSBtb25pdG9yIiA+IC9ldGMvbnRwLmNvbmYKICAgIGVjaG8gInNlcnZlciAxMjcuMTI3LjEuMCIgPj4gL2V0Yy9udHAuY29uZgogICAgZWNobyAiZnVkZ2UgMTI3LjEyNy4xLjAgc3RyYXR1bSAxMCIgPj4gL2V0Yy9udHAuY29uZgogICAgc3lzdGVtY3RsIHJlc3RhcnQgbnRwZC5zZXJ2aWNlCmZpCgoj6YWN572uU2xhdmVzCmNobW9kIDc3NyAqLnNoCmVjaG8tbG9nICJDb25maWd1cmUgc2xhdmUxIgpzY3Agc2xhdmUuc2ggc2xhdmUxOn4vc2xhdmUuc2gKc3NoIHNsYXZlMSAiLi9zbGF2ZS5zaCBzbGF2ZTEiCmVjaG8tbG9nICJDb25maWd1cmUgc2xhdmUyIgpzY3Agc2xhdmUuc2ggc2xhdmUyOn4vc2xhdmUuc2gKc3NoIHNsYXZlMiAiLi9zbGF2ZS5zaCBzbGF2ZTIiCgojU1NI5YWN5a+G55m75b2VCmVjaG8tbG9nICJTU0ggcHVibGljIGtleSIKaWYgKCB0ZXN0IC1kIH4vLnNzaC9pZF9yc2EgKQp0aGVuCiAgICBybSAtZiB+Ly5zc2gvaWRfcnNhCmZpCnNzaC1rZXlnZW4gLXQgcnNhIC1QICcnIC1mIH4vLnNzaC9pZF9yc2EgPiAuL2xvZy9zc2hfa2V5LmxvZwpzY3Agc2xhdmUxOn4vLnNzaC9pZF9yc2EucHViIH4vLnNzaC9zbGF2ZTEKc2NwIHNsYXZlMjp+Ly5zc2gvaWRfcnNhLnB1YiB+Ly5zc2gvc2xhdmUyCmNhdCB+Ly5zc2gvaWRfcnNhLnB1YiA+IH4vLnNzaC9hdXRob3JpemVkX2tleXMKY2F0IH4vLnNzaC9zbGF2ZTEgPj4gfi8uc3NoL2F1dGhvcml6ZWRfa2V5cwpjYXQgfi8uc3NoL3NsYXZlMiA+PiB+Ly5zc2gvYXV0aG9yaXplZF9rZXlzCnNjcCB+Ly5zc2gvYXV0aG9yaXplZF9rZXlzIHNsYXZlMTp+Ly5zc2gvYXV0aG9yaXplZF9rZXlzCnNjcCB+Ly5zc2gvYXV0aG9yaXplZF9rZXlzIHNsYXZlMjp+Ly5zc2gvYXV0aG9yaXplZF9rZXlzCgoj6Kej5Y6L5omA5pyJ6L2v5Lu25YyFCmZvciB0YXIgaW4gL29wdC9zb2Z0LyoudGFyLmd6CmRvCiAgICBlY2hvLWxvZyAidW56aXAgJHRhci4uLiIKICAgIHRhciB4dmYgJHRhciAtQyAvdXNyID4+IC4vbG9nL3Rhci5sb2cKZG9uZSAmCgpmb3IgdGFyIGluIC9vcHQvc29mdC8qLnRnegpkbwogICAgZWNoby1sb2cgInVuemlwICR0YXIuLi4iCiAgICB0YXIgeHZmICR0YXIgLUMgL3VzciA+PiAuL2xvZy90YXIubG9nCmRvbmUgJgoKd2FpdAoKI+enu+WKqOi9r+S7tuebruW9lQptdiAvdXNyL2pkazEuKiAvdXNyL2phdmEKbXYgL3Vzci96b29rZWVwZXItKiAvdXNyL3pvb2tlZXBlcgptdiAvdXNyL2hhZG9vcC0qIC91c3IvaGFkb29wCm12IC91c3Ivc2NhbGEtKiAvdXNyL3NjYWxhCm12IC91c3Ivc3BhcmstKiAvdXNyL3NwYXJrCgoj5aSN5Yi2SGFkb29w6YWN572u5paH5Lu2CmVjaG8tbG9nICdDb3B5IGhhZG9vcCBjb25mIGZpbGVzLicKaGRwY2ZnPS91c3IvaGFkb29wL2V0Yy9oYWRvb3AKY3AgLi9jb25mL2NvcmUtc2l0ZS54bWwgJGhkcGNmZy9jb3JlLXNpdGUueG1sCmNwIC4vY29uZi9oZGZzLXNpdGUueG1sICRoZHBjZmcvaGRmcy1zaXRlLnhtbApjcCAuL2NvbmYveWFybi1zaXRlLnhtbCAkaGRwY2ZnL3lhcm4tc2l0ZS54bWwKY3AgLi9jb25mL21hcHJlZC1zaXRlLnhtbCAkaGRwY2ZnL21hcHJlZC1zaXRlLnhtbAplY2hvICJleHBvcnQgSkFWQV9IT01FPS91c3IvamF2YSIgPj4gJGhkcGNmZy9oYWRvb3AtZW52LnNoCmVjaG8gIm1hc3RlciIgPiAkaGRwY2ZnL21hc3RlcgplY2hvICJzbGF2ZTEiID4gJGhkcGNmZy9zbGF2ZXMKZWNobyAic2xhdmUyIiA+PiAkaGRwY2ZnL3NsYXZlcwoKI+eUn+aIkFpvb2tlZXBlcumFjee9ruaWh+S7tgplY2hvLWxvZyAnQ29uZmlndXJlIHpvb2tlZXBlci4nCnpvb2NmZz0iL3Vzci96b29rZWVwZXIvY29uZi96b28uY2ZnIgplY2hvICJ0aWNrVGltZT0yMDAwIiA+ICR6b29jZmcKZWNobyAiaW5pdExpbWl0PTEwIiA+PiAkem9vY2ZnCmVjaG8gInN5bmNMaW1pdD01IiA+PiAkem9vY2ZnCmVjaG8gImRhdGFEaXI9L3Vzci96b29rZWVwZXIvemtkYXRhIiA+PiAkem9vY2ZnCmVjaG8gImNsaWVudFBvcnQ9MjE4MSIgPj4gJHpvb2NmZwplY2hvICJkYXRhTG9nRGlyPS91c3Ivem9va2VlcGVyL3prZGF0YWxvZyIgPj4gJHpvb2NmZwplY2hvICJzZXJ2ZXIuMT1tYXN0ZXI6Mjg4ODozODg4IiA+PiAkem9vY2ZnCmVjaG8gInNlcnZlci4yPXNsYXZlMToyODg4OjM4ODgiID4+ICR6b29jZmcKZWNobyAic2VydmVyLjM9c2xhdmUyOjI4ODg6Mzg4OCIgPj4gJHpvb2NmZwpta2RpciAvdXNyL3pvb2tlZXBlci96a2RhdGEKbWtkaXIgL3Vzci96b29rZWVwZXIvemtkYXRhbG9nCmVjaG8gIjEiID4gL3Vzci96b29rZWVwZXIvemtkYXRhL215aWQKZWNobyAiMiIgPiAvdXNyL3pvb2tlZXBlci96a2RhdGEvaWQyCmVjaG8gIjMiID4gL3Vzci96b29rZWVwZXIvemtkYXRhL2lkMwoKI+eUn+aIkFNwYXJr6YWN572u5paH5Lu2CmVjaG8tbG9nICdDb25maWd1cmUgU3BhcmsuJwplY2hvICJleHBvcnQgU1BBUktfTUFTVEVSX0lQPW1hc3RlciIgPiAvdXNyL3NwYXJrL2NvbmYvc3BhcmstZW52LnNoCmVjaG8gImV4cG9ydCBTQ0FMQV9IT01FPS91c3Ivc2NhbGEiID4+IC91c3Ivc3BhcmsvY29uZi9zcGFyay1lbnYuc2gKZWNobyAiZXhwb3J0IFNQQVJLX1dPUktFUl9NRU1PUlk9OGciID4+IC91c3Ivc3BhcmsvY29uZi9zcGFyay1lbnYuc2gKZWNobyAiZXhwb3J0IEpBVkFfSE9NRT0vdXNyL2phdmEiID4+IC91c3Ivc3BhcmsvY29uZi9zcGFyay1lbnYuc2gKZWNobyAiZXhwb3J0IEhBRE9PUF9IT01FPS91c3IvaGFkb29wIiA+PiAvdXNyL3NwYXJrL2NvbmYvc3BhcmstZW52LnNoCmVjaG8gImV4cG9ydCBIQURPT1BfQ09ORl9ESVI9L3Vzci9oYWRvb3AvZXRjL2hhZG9vcCIgPj4gL3Vzci9zcGFyay9jb25mL3NwYXJrLWVudi5zaAplY2hvICJzbGF2ZTEiID4gL3Vzci9zcGFyay9jb25mL3NsYXZlcwplY2hvICJzbGF2ZTIiID4+IC91c3Ivc3BhcmsvY29uZi9zbGF2ZXMKCiPlj5HluIPphY3nva7mlofku7YKZWNoby1sb2cgJ0NvbmZpZ3VyZSBmaWxlIC0+IHNsYXZlMScKc2NwIC4vY29uZi9jb3JlLXNpdGUueG1sIHNsYXZlMTokaGRwY2ZnL2NvcmUtc2l0ZS54bWwKc2NwIC4vY29uZi9oZGZzLXNpdGUueG1sIHNsYXZlMTokaGRwY2ZnL2hkZnMtc2l0ZS54bWwKc2NwIC4vY29uZi95YXJuLXNpdGUueG1sIHNsYXZlMTokaGRwY2ZnL3lhcm4tc2l0ZS54bWwKc2NwICRoZHBjZmcvaGFkb29wLWVudi5zaCBzbGF2ZTE6JGhkcGNmZy9oYWRvb3AtZW52LnNoCnNjcCAkaGRwY2ZnL21hcHJlZC1zaXRlLnhtbCBzbGF2ZTE6JGhkcGNmZy9tYXByZWQtc2l0ZS54bWwKc2NwICRoZHBjZmcvbWFzdGVyIHNsYXZlMTokaGRwY2ZnL21hc3RlcgpzY3AgJGhkcGNmZy9zbGF2ZXMgc2xhdmUxOiRoZHBjZmcvc2xhdmVzCnNjcCAvdXNyL3NwYXJrL2NvbmYvc3BhcmstZW52LnNoIHNsYXZlMTovdXNyL3NwYXJrL2NvbmYvc3BhcmstZW52LnNoCnNjcCAvdXNyL3NwYXJrL2NvbmYvc2xhdmVzIHNsYXZlMTovdXNyL3NwYXJrL2NvbmYvc2xhdmVzCnNjcCAkem9vY2ZnIHNsYXZlMTokem9vY2ZnCnNjcCAvdXNyL3pvb2tlZXBlci96a2RhdGEvaWQyIHNsYXZlMTovdXNyL3pvb2tlZXBlci96a2RhdGEvbXlpZAoKZWNoby1sb2cgJ0NvbmZpZ3VyZSBmaWxlIC0+IHNsYXZlMicKc2NwIC4vY29uZi9jb3JlLXNpdGUueG1sIHNsYXZlMjokaGRwY2ZnL2NvcmUtc2l0ZS54bWwKc2NwIC4vY29uZi9oZGZzLXNpdGUueG1sIHNsYXZlMjokaGRwY2ZnL2hkZnMtc2l0ZS54bWwKc2NwIC4vY29uZi95YXJuLXNpdGUueG1sIHNsYXZlMjokaGRwY2ZnL3lhcm4tc2l0ZS54bWwKc2NwICRoZHBjZmcvaGFkb29wLWVudi5zaCBzbGF2ZTI6JGhkcGNmZy9oYWRvb3AtZW52LnNoCnNjcCAkaGRwY2ZnL21hcHJlZC1zaXRlLnhtbCBzbGF2ZTI6JGhkcGNmZy9tYXByZWQtc2l0ZS54bWwKc2NwICRoZHBjZmcvbWFzdGVyIHNsYXZlMjokaGRwY2ZnL21hc3RlcgpzY3AgJGhkcGNmZy9zbGF2ZXMgc2xhdmUyOiRoZHBjZmcvc2xhdmVzCnNjcCAvdXNyL3NwYXJrL2NvbmYvc3BhcmstZW52LnNoIHNsYXZlMjovdXNyL3NwYXJrL2NvbmYvc3BhcmstZW52LnNoCnNjcCAvdXNyL3NwYXJrL2NvbmYvc2xhdmVzIHNsYXZlMjovdXNyL3NwYXJrL2NvbmYvc2xhdmVzCnNjcCAkem9vY2ZnIHNsYXZlMjokem9vY2ZnCnNjcCAvdXNyL3pvb2tlZXBlci96a2RhdGEvaWQzIHNsYXZlMjovdXNyL3pvb2tlZXBlci96a2RhdGEvbXlpZAoKZWNoby1sb2cgJ0NvbmZpZ3VyZSAvZXRjL3Byb2ZpbGUnCmVjaG8gLWUgIlxuXApleHBvcnQgSkFWQV9IT01FPS91c3IvamF2YVxuXApleHBvcnQgWk9PS0VFUEVSX0hPTUU9L3Vzci96b29rZWVwZXJcblwKZXhwb3J0IEhBRE9PUF9IT01FPS91c3IvaGFkb29wXG5cCmV4cG9ydCBTQ0FMQV9IT01FPS91c3Ivc2NhbGFcblwKZXhwb3J0IFNQQVJLX0hPTUU9L3Vzci9zcGFya1xuXApleHBvcnQgUEFUSD1cJFBBVEg6XCRKQVZBX0hPTUUvYmluOlwkWk9PS0VFUEVSX0hPTUUvYmluOlwkSEFET09QX0hPTUUvYmluOlwkSEFET09QX0hPTUUvc2JpbjpcJFNDQUxBX0hPTUUvYmluOlwkU1BBUktfSE9NRS9iaW5cbiIgPj4gL2V0Yy9wcm9maWxlCnNvdXJjZSAvZXRjL3Byb2ZpbGUKc2NwIC9ldGMvcHJvZmlsZSBzbGF2ZTE6L2V0Yy9wcm9maWxlCnNjcCAvZXRjL3Byb2ZpbGUgc2xhdmUyOi9ldGMvcHJvZmlsZQ=="
slave_sh="IyEgL2Jpbi9iYXNoCgpmdW5jdGlvbiBlY2hvLWxvZwp7CiAgICBlY2hvIC1lICJcMDMzWzQ3OzM0bSAkMSBcMDMzWzBtIgogICAgZWNobyAiLS0tLS0tLS0tLS0tLSIKfQoKI+W7uueri+aXpeW/l+aWh+S7tuWkuQppZiAoIHRlc3QgLWQgLi9sb2cgKQp0aGVuCiAgICBscyAuL2xvZwplbHNlCiAgICBta2RpciAuL2xvZwpmaQoKSE9TVF9OQU1FPSQxCgplY2hvLWxvZyAiU3RvcCBhbmQgRGlzYWJsZSBmaXJld2FsbGQgb24gJEhPU1RfTkFNRSIKc3lzdGVtY3RsIHN0b3AgZmlyZXdhbGxkCnN5c3RlbWN0bCBkaXNhYmxlIGZpcmV3YWxsZAoKZWNoby1sb2cgImhvc3RuYW1lIC0+ICRIT1NUX05BTUUiCmhvc3RuYW1lICRIT1NUX05BTUUKZWNobyAkSE9TVF9OQU1FID4gL2V0Yy9ob3N0bmFtZQoKZWNoby1sb2cgInNzaC1rZXlnZW4gb24gJEhPU1RfTkFNRSIKaWYgKCB0ZXN0IC1kIH4vLnNzaC9pZF9yc2EgKQp0aGVuCiAgICBybSAtZiB+Ly5zc2gvaWRfcnNhCmZpCnNzaC1rZXlnZW4gLXQgcnNhIC1QICcnIC1mIH4vLnNzaC9pZF9yc2EgPiAuL2xvZy9zc2hfa2V5LmxvZwoKbm93ZGF0ZT0kKGRhdGUpCmlmICh3aGlwdGFpbCAtLXRpdGxlICJDaGFuZ2UgVGltZSBab25lID8iIC0teWVzbm8gIiRub3dkYXRlIiAxMCA2MCkgdGhlbgogICAgdHpzZWxlY3QKZmkKY2xlYXIKCndoaWNoIG50cGRhdGUKaWYgW1sgJD8gPT0gMCBdXQp0aGVuCiAgICBlY2hvLWxvZyAnU3luYyB0aW1lIGZyb20gbWFzdGVyLi4uJwogICAgbnRwZGF0ZSBtYXN0ZXIgPj4gLi9sb2cvbnRwLmxvZyAmCmZpCgoj6Kej5Y6L5omA5pyJ6L2v5Lu25YyFCmZvciB0YXIgaW4gL29wdC9zb2Z0LyoudGFyLmd6CmRvCiAgICBlY2hvLWxvZyAidW56aXAgJHRhci4uLiIKICAgIHRhciAtdnh6ZiAkdGFyIC1DIC91c3IgPj4gLi9sb2cvdGFyLmxvZwpkb25lICYKCmZvciB0YXIgaW4gL29wdC9zb2Z0LyoudGd6CmRvCiAgICBlY2hvLWxvZyAidW56aXAgJHRhci4uLiIKICAgIHRhciAtdnh6ZiAkdGFyIC1DIC91c3IgPj4gLi9sb2cvdGFyLmxvZwpkb25lICYKCndhaXQKCiPnp7vliqjova/ku7bnm67lvZUKbXYgL3Vzci9qZGsxLiogL3Vzci9qYXZhCm12IC91c3Ivem9va2VlcGVyLSogL3Vzci96b29rZWVwZXIKbXYgL3Vzci9oYWRvb3AtKiAvdXNyL2hhZG9vcAptdiAvdXNyL3NjYWxhLSogL3Vzci9zY2FsYQptdiAvdXNyL3NwYXJrLSogL3Vzci9zcGFyawoKbWtkaXIgL3Vzci96b29rZWVwZXIvemtkYXRhCm1rZGlyIC91c3Ivem9va2VlcGVyL3prZGF0YWxvZw=="
check_sh="IyEgL2Jpbi9iYXNoCgpmdW5jdGlvbiBsb2ctY2hlY2sKewogICAgaWYgWyAkPyAtZXEgMCBdOyB0aGVuCiAgICAgICAgZWNobyAtZSAiXDAzM1s0NDszMG0gJDEgW1N1Y2Nlc3NdIFwwMzNbMG0iCiAgICBlbHNlCiAgICAgICAgZWNobyAtZSAiXDAzM1s0MTszMG0gJDEgW0Vycm9yXSBcMDMzWzBtIgogICAgZmkKICAgIGVjaG8gIi0tLS0tLS0tLS0tLS0iCn0KCmZ1bmN0aW9uIGNoZWNrLWNvbW1vbgp7CiPpmLLngavlopkKICAgIHN5c3RlbWN0bCBzdGF0dXMgZmlyZXdhbGxkIHwgZ3JlcCBpbmFjdGl2ZSA+IC9kZXYvbnVsbAogICAgbG9nLWNoZWNrICJGaXJld2FsbGQiCgojL2V0Yy9ob3N0cwogICAgY2F0IC9ldGMvaG9zdHMgfCBncmVwIG1hc3RlciA+IC9kZXYvbnVsbAogICAgbG9nLWNoZWNrICJIb3N0cyAtIG1hc3RlciIKCiAgICBjYXQgL2V0Yy9ob3N0cyB8IGdyZXAgc2xhdmUxID4gL2Rldi9udWxsCiAgICBsb2ctY2hlY2sgIkhvc3RzIC0gc2xhdmUxIgoKICAgIGNhdCAvZXRjL2hvc3RzIHwgZ3JlcCBzbGF2ZTIgPiAvZGV2L251bGwKICAgIGxvZy1jaGVjayAiSG9zdHMgLSBzbGF2ZTIiCgojU1NIIEtleQogICAgY2F0IH4vLnNzaC9hdXRob3JpemVkX2tleXMgfCBncmVwIHJvb3RAbWFzdGVyID4gL2Rldi9udWxsCiAgICBsb2ctY2hlY2sgIlNTSCBLZXkgLSBtYXN0ZXIiCiAgICBjYXQgfi8uc3NoL2F1dGhvcml6ZWRfa2V5cyB8IGdyZXAgcm9vdEBzbGF2ZTEgPiAvZGV2L251bGwKICAgIGxvZy1jaGVjayAiU1NIIEtleSAtIHNsYXZlMSIKICAgIGNhdCB+Ly5zc2gvYXV0aG9yaXplZF9rZXlzIHwgZ3JlcCByb290QHNsYXZlMiA+IC9kZXYvbnVsbAogICAgbG9nLWNoZWNrICJTU0ggS2V5IC0gc2xhdmUyIgoKICAgIHNzaCBtYXN0ZXIgaG9zdG5hbWUgfCBncmVwIG1hc3RlciA+IC9kZXYvbnVsbAogICAgbG9nLWNoZWNrICJTU0ggVGVzdCAtIG1hc3RlciIKICAgIHNzaCBzbGF2ZTEgaG9zdG5hbWUgfCBncmVwIHNsYXZlMSA+IC9kZXYvbnVsbAogICAgbG9nLWNoZWNrICJTU0ggVGVzdCAtIHNsYXZlMSIKICAgIHNzaCBzbGF2ZTIgaG9zdG5hbWUgfCBncmVwIHNsYXZlMiA+IC9kZXYvbnVsbAogICAgbG9nLWNoZWNrICJTU0ggVGVzdCAtIHNsYXZlMiIKCiNQcm9ncmFtcwogICAgdGVzdCAkKHdoaWNoIG50cGRhdGUpCiAgICBsb2ctY2hlY2sgIlByb2dyYW0gLSBOVFAiCgogICAgdGVzdCAkKHdoaWNoIGpwcykKICAgIGxvZy1jaGVjayAiUHJvZ3JhbSAtIEphdmEiCgogICAgdGVzdCAkKHdoaWNoIGhhZG9vcCkKICAgIGxvZy1jaGVjayAiUHJvZ3JhbSAtIEhhZG9vcCIKCiAgICB0ZXN0ICQod2hpY2ggemtTZXJ2ZXIuc2gpCiAgICBsb2ctY2hlY2sgIlByb2dyYW0gLSBab29rZWVwZXIiCgogICAgdGVzdCAkKHdoaWNoIHNjYWxhKQogICAgbG9nLWNoZWNrICJQcm9ncmFtIC0gU2NhbGEiCgogICAgdGVzdCAkKHdoaWNoIHNwYXJrLXNoZWxsKQogICAgbG9nLWNoZWNrICJQcm9ncmFtIC0gU3BhcmsiCn0KCmZ1bmN0aW9uIGNoZWNrLW1hc3Rlcgp7CiNOVFDmnI3liqEKICAgIG5ldHN0YXQgLWFubyB8IGdyZXAgMTIzID4gL2Rldi9udWxsCiAgICBsb2ctY2hlY2sgIk5UUCAtIFNlcnZpY2UiCgojSlBT6L+b56iLCiAgICBqcHMgfCBncmVwIE1hc3RlciA+IC9kZXYvbnVsbAogICAgbG9nLWNoZWNrICJOVFAgLSBNYXN0ZXIiCgogICAganBzIHwgZ3JlcCBRdW9ydW1QZWVyTWFpbiA+IC9kZXYvbnVsbAogICAgbG9nLWNoZWNrICJKcHMgLSBRdW9ydW1QZWVyTWFpbiIKCiAgICBqcHMgfCBncmVwIE5hbWVOb2RlID4gL2Rldi9udWxsCiAgICBsb2ctY2hlY2sgIkpwcyAtIE5hbWVOb2RlIgoKICAgIGpwcyB8IGdyZXAgUmVzb3VyY2VNYW5hZ2VyID4gL2Rldi9udWxsCiAgICBsb2ctY2hlY2sgIkpwcyAtIFJlc291cmNlTWFuYWdlciIKfQoKZnVuY3Rpb24gY2hlY2stc2xhdmUKewojSlBT6L+b56iLCiAgICBqcHMgfCBncmVwIFdvcmtlciA+IC9kZXYvbnVsbAogICAgbG9nLWNoZWNrICJKcHMgLSBXb3JrZXIiCgogICAganBzIHwgZ3JlcCBEYXRhTm9kZSA+IC9kZXYvbnVsbAogICAgbG9nLWNoZWNrICJKcHMgLSBEYXRhTm9kZSIKCiAgICBqcHMgfCBncmVwIE5vZGVNYW5hZ2VyID4gL2Rldi9udWxsCiAgICBsb2ctY2hlY2sgIkpwcyAtIE5vZGVNYW5hZ2VyIgoKICAgIGpwcyB8IGdyZXAgUXVvcnVtUGVlck1haW4gPiAvZGV2L251bGwKICAgIGxvZy1jaGVjayAiSnBzIC0gUXVvcnVtUGVlck1haW4iCn0KCmVjaG8gLWUgIlwwMzNbNDY7MzBtIC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0gXDAzM1swbSIKZWNobyAtZSAiXDAzM1s0NjszMG0gfCAgICBDaGVjayAkKGhvc3RuYW1lKSAgICB8IFwwMzNbMG0iCmVjaG8gLWUgIlwwMzNbNDY7MzBtIC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0gXDAzM1swbSIKc291cmNlIC9ldGMvcHJvZmlsZQpjaGVjay1jb21tb24KCmlmIChbICQoaG9zdG5hbWUpID09ICJtYXN0ZXIiIF0pCnRoZW4KICAgIGNoZWNrLW1hc3RlcgogICAgaWYgKHdoaXB0YWlsIC0tdGl0bGUgIkNoZWNrIFNhbHZlcyA/IiAtLXllc25vICJDaGVjayBTYWx2ZXMgPyIgMTAgNjApIHRoZW4KICAgICAgICBzY3AgLi9jaGVjay5zaCBzbGF2ZTE6fi9jaGVjay5zaAogICAgICAgIHNzaCBzbGF2ZTEgIi4vY2hlY2suc2giCiAgICAgICAgc2NwIC4vY2hlY2suc2ggc2xhdmUyOn4vY2hlY2suc2gKICAgICAgICBzc2ggc2xhdmUyICIuL2NoZWNrLnNoIgogICAgZmkKZWxzZQogICAgY2hlY2stc2xhdmUKZmk="

conf_core="PGNvbmZpZ3VyYXRpb24+Cjxwcm9wZXJ0eT4KICA8bmFtZT5mcy5kZWZhdWx0Lm5hbWU8L25hbWU+CiAgPHZhbHVlPmhkZnM6Ly9tYXN0ZXI6OTAwMDwvdmFsdWU+CjwvcHJvcGVydHk+Cjxwcm9wZXJ0eT4KICA8bmFtZT5oYWRvb3AudG1wLmRpcjwvbmFtZT4KICA8dmFsdWU+L3Vzci9oYWRvb3AvaGRmcy90bXA8L3ZhbHVlPgogIDxkZXNjcmlwdGlvbj5BIGJhc2UgZm9yIG90aGVyIHRlbXBvcmFyeSBkaXJlY3Rvcmllcy48L2Rlc2NyaXB0aW9uPgo8L3Byb3BlcnR5Pgo8cHJvcGVydHk+CiAgPG5hbWU+aW8uZmlsZS5idWZmZXIuc2l6ZTwvbmFtZT4KICA8dmFsdWU+MTMxMDcyPC92YWx1ZT4KPC9wcm9wZXJ0eT4KPHByb3BlcnR5PgogIDxuYW1lPmZzLmNoZWNrcG9pdC5wZXJpb2Q8L25hbWU+CiAgPHZhbHVlPjYwPC92YWx1ZT4KPC9wcm9wZXJ0eT4KPHByb3BlcnR5PgogIDxuYW1lPmZzLmNoZWNrcG9pdC5zaXplPC9uYW1lPgogIDx2YWx1ZT42NzEwODg2NDwvdmFsdWU+CjwvcHJvcGVydHk+CjwvY29uZmlndXJhdGlvbj4g"
conf_hdfs="PGNvbmZpZ3VyYXRpb24+Cjxwcm9wZXJ0eT4KICA8bmFtZT5kZnMucmVwbGljYXRpb248L25hbWU+CiAgPHZhbHVlPjI8L3ZhbHVlPgo8L3Byb3BlcnR5Pgo8cHJvcGVydHk+CiAgPG5hbWU+ZGZzLm5hbWVub2RlLm5hbWUuZGlyPC9uYW1lPgogIDx2YWx1ZT5maWxlOi91c3IvaGFkb29wL2hkZnMvbmFtZTwvdmFsdWU+CiAgPGZpbmFsPnRydWU8L2ZpbmFsPgo8L3Byb3BlcnR5Pgo8cHJvcGVydHk+CiAgPG5hbWU+ZGZzLmRhdGFub2RlLmRhdGEuZGlyPC9uYW1lPgogIDx2YWx1ZT5maWxlOi91c3IvaGFkb29wL2hkZnMvZGF0YTwvdmFsdWU+CiAgPGZpbmFsPnRydWU8L2ZpbmFsPgo8L3Byb3BlcnR5Pgo8cHJvcGVydHk+CiAgPG5hbWU+ZGZzLm5hbWVub2RlLnNlY29uZGFyeS5odHRwLWFkZHJlc3M8L25hbWU+CiAgPHZhbHVlPm1hc3Rlcjo5MDAxPC92YWx1ZT4KPC9wcm9wZXJ0eT4KPHByb3BlcnR5PgogIDxuYW1lPmRmcy53ZWJoZGZzLmVuYWJsZWQ8L25hbWU+CiAgPHZhbHVlPnRydWU8L3ZhbHVlPgo8L3Byb3BlcnR5Pgo8cHJvcGVydHk+CiAgPG5hbWU+ZGZzLnBlcm1pc3Npb25zPC9uYW1lPgogIDx2YWx1ZT5mYWxzZTwvdmFsdWU+CjwvcHJvcGVydHk+CjwvY29uZmlndXJhdGlvbj4="
conf_mapred="PGNvbmZpZ3VyYXRpb24+CiAgPHByb3BlcnR5PgogICAgPG5hbWU+bWFwcmVkdWNlLmZyYW1ld29yay5uYW1lPC9uYW1lPgogICAgPHZhbHVlPnlhcm48L3ZhbHVlPgogIDwvcHJvcGVydHk+CjwvY29uZmlndXJhdGlvbj4="
conf_yarn="PGNvbmZpZ3VyYXRpb24+Cjxwcm9wZXJ0eT4KICA8bmFtZT55YXJuLnJlc291cmNlbWFuYWdlci5hZGRyZXNzPC9uYW1lPgogIDx2YWx1ZT5tYXN0ZXI6MTgwNDA8L3ZhbHVlPgo8L3Byb3BlcnR5Pgo8cHJvcGVydHk+CiAgPG5hbWU+eWFybi5yZXNvdXJjZW1hbmFnZXIuc2NoZWR1bGVyLmFkZHJlc3M8L25hbWU+CiAgPHZhbHVlPm1hc3RlcjoxODAzMDwvdmFsdWU+CjwvcHJvcGVydHk+Cjxwcm9wZXJ0eT4KICA8bmFtZT55YXJuLnJlc291cmNlbWFuYWdlci53ZWJhcHAuYWRkcmVzczwvbmFtZT4KICA8dmFsdWU+bWFzdGVyOjE4MDg4PC92YWx1ZT4KPC9wcm9wZXJ0eT4KPHByb3BlcnR5PgogIDxuYW1lPnlhcm4ucmVzb3VyY2VtYW5hZ2VyLnJlc291cmNlLXRyYWNrZXIuYWRkcmVzczwvbmFtZT4KICA8dmFsdWU+bWFzdGVyOjE4MDI1PC92YWx1ZT4KPC9wcm9wZXJ0eT4KPHByb3BlcnR5PgogIDxuYW1lPnlhcm4ucmVzb3VyY2VtYW5hZ2VyLmFkbWluLmFkZHJlc3M8L25hbWU+CiAgPHZhbHVlPm1hc3RlcjoxODE0MTwvdmFsdWU+CjwvcHJvcGVydHk+Cjxwcm9wZXJ0eT4KICA8bmFtZT55YXJuLm5vZGVtYW5hZ2VyLmF1eC1zZXJ2aWNlczwvbmFtZT4KICA8dmFsdWU+bWFwcmVkdWNlX3NodWZmbGU8L3ZhbHVlPgo8L3Byb3BlcnR5Pgo8cHJvcGVydHk+CiAgPG5hbWU+eWFybi5ub2RlbWFuYWdlci5hdXhzZXJ2aWNlcy5tYXByZWR1Y2Uuc2h1ZmZsZS5jbGFzczwvbmFtZT4KICA8dmFsdWU+b3JnLmFwYWNoZS5oYWRvb3AubWFwcmVkLlNodWZmbGVIYW5kbGU8L3ZhbHVlPgo8L3Byb3BlcnR5Pgo8L2NvbmZpZ3VyYXRpb24+"

echo $master_sh | base64 -d > master.sh
echo $slave_sh | base64 -d > slave.sh
echo $check_sh | base64 -d > check.sh

mkdir ./conf
echo $conf_core | base64 -d > ./conf/core-site.xml
echo $conf_hdfs | base64 -d > ./conf/hdfs-site.xml
echo $conf_mapred | base64 -d > ./conf/mapred-site.xml
echo $conf_yarn | base64 -d > ./conf/yarn-site.xml
chmod 777 *.sh
./master.sh
