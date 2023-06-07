# Argumentos de entrada
diaIni=$1
diaFim=$2
mes=$3
ano=$4

for ((dia=$diaIni; dia<=$diaFim; dia++)); do
    
    # Atribuições das variáveis
    diaFormatado=$(printf "%02d" $dia)
    data="${ano}${mes}${diaFormatado}"
    arquivo="$data.zip"

    # Criação dos arquivos de resultado
    arquivo_empenho="${ano}${mes}_${diaIni}-${diaFim}_Despesas_Empenho.csv"
    arquivo_pagamento="${ano}${mes}_${diaIni}-${diaFim}_Despesas_Pagamento.csv"

    # Extração dos dados e salvamento em arquivo neste diretório
    wget "http://portaldatransparencia.gov.br/download-de-dados/despesas/${data}" -O "$arquivo"
	
    # Descompactação dos arquivos separando empenho de despesas em pasta temporária
    unzip -j -o "$arquivo" "*_Despesas_Empenho.csv" -d "temporario"
    unzip -j -o "$arquivo" "*_Despesas_Pagamento.csv" -d "temporario"

    # Exclusão do arquivo zipado
    rm "$arquivo"
    
    # Separação dos arquivos de empenho e pagamento
    # Remoção do cabeçalho a partir depois do primeiro arquivo

    # Empenho
    if [ -f "$arquivo_empenho" ]; then
      tail -n +2 "temporario/${data}_Despesas_Empenho.csv" >> "$arquivo_empenho"
    else
      cat "temporario/${data}_Despesas_Empenho.csv" >> "$arquivo_empenho"
    fi
    
    # Despesas
    if [ -f "$arquivo_pagamento" ]; then
      tail -n +2 "temporario/${data}_Despesas_Pagamento.csv" >> "$arquivo_pagamento"
    else
      cat "temporario/${data}_Despesas_Pagamento.csv" >> "$arquivo_pagamento"
    fi

done

rm -r temporario

