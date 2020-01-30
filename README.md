### about
SidConversion module contains the cmdlets for conversion SID (security identifier) of a Windows user or group account to the name of this account and backward
* required PowerShell version 3.0 or later
* `ConvertFrom-Sid` cmdlet converts the SID of the user or group account to the name of this account
* `ConvertTo-Sid` converts a Windows user or group account name to the SID of this account
* if you want to try this cmdlets or need to convert a SID once and do not want to install module, you could use the scripts `ConvertFrom-Sid.ps1` and `ConvertTo-Sid.ps1`, which are full-fledged separate copies of the same-named cmdlets

#### license  
[![license](https://img.shields.io/github/license/almaceleste/xfce4-genmon-scripts.svg?longCache=true)](https://github.com/almaceleste/xfce4-genmon-scripts/blob/master/LICENSE)

### how to install
#### install from github with git
```
git clone https://github.com/almaceleste/sidcoversion.git
Register-PSRepository -Name SidConversionRepo -SourceLocation ./sidconversion
Install-Module SidConversion -Scope CurrentUser -Repository SidConversionRepo
```

### support me
[![Beerpay](https://beerpay.io/almaceleste/userscripts/badge.svg?style=beer-square)](https://beerpay.io/almaceleste/userscripts) [![Beerpay](https://beerpay.io/almaceleste/userscripts/make-wish.svg?style=flat-square)](https://beerpay.io/almaceleste/userscripts?focus=wish)
[![](https://img.shields.io/badge/Paypal-donate_me-blue.svg?longCache=true&logo=paypal)](https://www.paypal.me/almaceleste "paypal | donate me") 
<!--[![](https://img.shields.io/beerpay/almaceleste/userscripts.svg?longCache=true&logo=data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACAAAAAgCAMAAABEpIrGAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAL1QTFRF////5VVV5VVV5VVV5VVV63l55VVV5VVV5VVV5VVV////5VVV52Rk5VVV+t3d5VVV+t7e7oiI5VVV63195VVV5VVV++fn++Tk98rK++Li/fX15VVV87Cw7Xd375CQ86en7YyM7oeH75SU75iY/vv76mxs/vr66nFx7Ht78q2t9bu775aW6Wpq7YeH6F9f6GBg5lhY5llZ5VVV5lpa52Bg6Gpq6nV17ICA8KCg98rK+NTU+t/f/Orq/fT0////rl8lpQAAADJ0Uk5TABAgMEBMUGBwgICQnqCgsLO3wMzQ4ODk6Oju8PDz8/T19vb29vf3+Pj4+fv8/P39/v7M0GNzAAABHUlEQVQ4y52TWVODMBSFbyDSIkZsBLTi2ta6b8dSl5b7/3+WD0BJMJUZz1Nm8s3c5ZxL1MqPgdgn8qQgl/wcAPJAA1AuJIYh3f31lIaloYp941/k+K3cqDOES2ELhE4gaYHACcBoYu/65mnFvLqyAK9pUe7sM/Msy2a8njy2gKwWlAJYfj4UADAdM790gMSu+8H3NiCAUApjzpPyzWpSAr415ylPqsfrqAHsRSzm5cXZM4DzXQMwnVqOmUsAXxtAEtlWFXd8i3c+oLrJQRfAYs7faz6s1pRCEXWXXBxnR5d1KCLkgpxWpHVWgET+aVaEbaI+wtskzp2o2qztieoHBn1Am1r9T0DZZ+k4nWbOoA8gEYRKa6OQ1joKJRH9AFdugk7QRy6mAAAAAElFTkSuQmCC)](https://beerpay.io/almaceleste/userscripts "beerpay | beer me")--> 