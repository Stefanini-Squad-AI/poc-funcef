{--------------------------------------------------------------------------------------------------
Atender   : WO16145
Data      : 19/12/2024
Autor     : Arnaldo V. Scarin
Descrição : Correção do FatorVencimento, que a partir de 22/02/2025 será reiniciado em 1000, por conta
            do Codigo exceder 9999
--------------------------------------------------------------------------------------------------}
unit uCodBarrasRH;

interface

uses Controls, SysUtils, MaskUtils, uCtrlFuncoesRH;

type
  TCodBarrasRH = class
  public
    class function CalculaDac10(const Num: string): string;
    class function CalculaDac11(const Num: string): string;

    class procedure Montar(const NumBanco: byte; const DataVenc: TDate;
      const Valor: currency; const CampoLivre: string; var CodBarras, NumCodBarras: string);
  end;

implementation

const
  MSG_ERRO_DAC11 = 'Erro no CalculaDac11 - posição :1 para :2';

{ TCodBarrasRH }

class function TCodBarrasRH.CalculaDac11(const Num: string): string;
var
  sNumero: string;
  iBase, iDividendo, iDigito, c, iTamNum : integer;
begin
  sNumero := Num;
  iBase := 9;
  iDividendo := 0;
  iTamNum := Length(sNumero) + 1;

  for c:=1 to Length(sNumero) do
  begin
    try
      iDividendo := iDividendo + (StrToInt(sNumero[iTamNum - c]) * iBase);
    except
      on E: Exception do
        raise Exception.Create(
          CMTranslateMsg(MSG_ERRO_DAC11, [IntToStr(iTamNum-c-1), sNumero]));
    end;

    if (iBase = 2) then
      iBase := 9
    else
      Dec(iBase);
  end;

  iDigito := (iDividendo mod 11);

  if (iDigito = 0) or (iDigito > 9) then
    Result := '1'
  else
    Result := IntToStr(iDigito);
end;

class function TCodBarrasRH.CalculaDac10(const Num: string): string;
var
  sNumero, sAuxResult: string;
  iPosicao, iBase, c, iDividendo, iDigito: integer;
begin
  sNumero := Trim(Num);
  iPosicao := Length(sNumero) + 1;
  iBase := 2;
  iDividendo := 0;

  for c:=1 to Length(sNumero) do
  begin
    sAuxResult := IntToStr((StrToInt(sNumero[iPosicao - c]) * iBase));
    if (Length(sAuxResult) > 1) then
      iDividendo := iDividendo + StrToInt(sAuxResult[1]) + StrToInt(sAuxResult[2])
    else
      iDividendo := iDividendo + StrToInt(sAuxResult[1]);

    Dec(iBase);
    if (iBase = 0) then
      iBase := 2;
  end;

  if ((iDividendo mod 10) = 0) then
    iDigito := 0
  else
    iDigito := 10 - (iDividendo mod 10);

  Result := IntToStr(iDigito);
end;

class procedure TCodBarrasRH.Montar(const NumBanco: byte; const DataVenc: TDate;
  const Valor: currency; const CampoLivre: string; var CodBarras, NumCodBarras: string);
var
  sDigitoGeral: string;
  sCod: string;
  FatorVencimento : Integer;
begin
  FatorVencimento := DataVenc - StrToDate('07/10/1997');
  // WO16145 - Inicio
  // Alterado por Arnaldo V. Scarin em 19/12/2024
  // Descrição : A partir de 22/02/2025 o Fator de Vencimento deverá ser reiniciado, pois
  // o Valor dele chegará a 9999 em 21/02/2025, e começará a gerar problemas nos boletos.
  // Para tanto, foi implementada a verificação abaixo, fazendo com que seja ajustado o
  // Fator de Vencimento.
  if FatorVencimento > 9999 then
    FatorVencimento := 1000 + DataVenc - StrToDate('22/02/2025');
  // WO16145 - Término

  // Montar o Código de Barras
  sCod :=
    // Banco
    Copy(IntToStr(NumBanco),1,4) +
    // Moeda (9 = Real)
    '9' +
    // Fator de vencimento
    FU.Alinha(FloatToStr(FatorVencimento),4,'D','0') +
    // Valor do documento
    FU.Alinha(FU.GetNumeros(FormatFloat('#########0.00',Valor)), 10, 'D', '0') +
    // Dados do Campo Livre
    CampoLivre;

  // Calcular o Dígito Verificador Geral (Módulo 11)
  sDigitoGeral := CalculaDac11(sCod);
  Insert(sDigitoGeral, sCod, 5);

  CodBarras := sCod;

  // Montar a Representação Numérica do Código de Barras
  sCod :=
    // Banco
    Copy(IntToStr(NumBanco),1,4) +
    // Moeda (9 = Real)
    '9' +
    // Dados do Campo Livre
    CampoLivre +
    // Fator de vencimento
    FU.Alinha(FloatToStr(FatorVencimento),4,'D','0') +
    // Valor do documento
    FU.Alinha(FU.GetNumeros(FormatFloat('#########0.00',Valor)), 10, 'D', '0');

  // Calcular os Dígito Verificador de Cada Grupo Numérico (Módulo 10)
  sCod := Copy(sCod,01,09) + CalculaDac10(Copy(sCod,01,09)) +
          Copy(sCod,10,10) + CalculaDac10(Copy(sCod,10,10)) +
          Copy(sCod,20,10) + CalculaDac10(Copy(sCod,20,10)) +
          Copy(sCod,30,30); // restante do código

  // Atribuir o Dígito Verificador Geral (Módulo 11)
  Insert(sDigitoGeral, sCod, 33);
  NumCodBarras :=
    FormatMaskText('99999\.99999\ 99999\.999999\ 99999\.999999\ 9\ 99999999999999;0', sCod);
end;

end.
