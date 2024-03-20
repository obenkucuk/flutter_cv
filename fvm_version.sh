#!/bin/bash

# .fvmrc dosyasının yolunu kontrol et
fvmrc_file=".fvmrc"

if [ -f "$fvmrc_file" ]; then
    # .fvmrc dosyası varsa, içeriğini oku ve flutter sürümünü al
    flutter_version=$(grep -o '"flutter": *"[^"]*"' "$fvmrc_file" | cut -d '"' -f 4)
    
    if [ -n "$flutter_version" ]; then
        echo "$flutter_version"
    else
        echo "Hata: Flutter sürümü bulunamadı."
        exit 1
    fi
else
    echo "Hata: .fvmrc dosyası bulunamadı."
    exit 1
fi
