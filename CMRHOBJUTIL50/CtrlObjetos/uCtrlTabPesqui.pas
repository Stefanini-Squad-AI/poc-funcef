{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Criado Em: 04/11/2002                                 }
{                                                       }
{*******************************************************}

unit uCtrlTabPesqui;

interface

uses Classes, Controls, Db, SysUtils, uCmDbObject, uCmControlObject, IvDictio,
  uCtrlCustomRH, uCMClientDataSet;

type
  TCtrlTabPesqui = class(TCtrlCustomRH)
  protected
    procedure DoChangeDataBase; override;
    procedure OnCreateAppServer; override;
  private
    FCdsTendencia: TCMClientDataSet;
    FFrequencia, FValMenor, FValMenorReal, FValMaior, FValMaiorReal, FQuartil1,
    FQuartil1Real, FQuartil3, FQuartil3Real, FMediana, FMedianaReal: integer;
    FMedia, FMediaReal, FModa, FModaReal: double;
  public
    constructor Create; override;
    destructor  Destroy; override;

    function ListPessoaComTendPesquisaSal(IdPesqSalar: double; IdCargo: double = 0): OleVariant;
    function ListHistorico(IdEmpresa: integer; IdPesqSalar, IdCargo: double): OleVariant;
    function ListDadosTend(IdEmpresa: integer; IdPesqSalar, IdCargo: double): OleVariant;

    function GerarTabulacao(TipoExclusao: integer; IdEmpresa: integer; IdEntidade,
      IdPesqSalar, IdCargo, PercCorte: double): boolean;

    property CdsTendencia: TCMClientDataSet read FCdsTendencia write FCdsTendencia;
    property Frequencia: integer read FFrequencia;
    property ValMenor: integer read FValMenor;
    property ValMenorReal: integer read FValMenorReal;
    property ValMaior: integer read FValMaior;
    property ValMaiorReal: integer read FValMaiorReal;
    property Quartil1: integer read FQuartil1;
    property Quartil1Real: integer read FQuartil1Real;
    property Quartil3: integer read FQuartil3;
    property Quartil3Real: integer read FQuartil3Real;
    property Mediana: integer read FMediana;
    property MedianaReal: integer read FMedianaReal;
    property Media: double read FMedia;
    property MediaReal: double read FMediaReal;
    property Moda: double read FModa;
    property ModaReal: double read FModaReal;
  end;

implementation

uses uCMTypes, uCtrlFuncoesRH;

{ TCtrlTabPesqui }

constructor TCtrlTabPesqui.Create;
begin
  inherited;
end;

destructor TCtrlTabPesqui.Destroy;
begin
  inherited;
  if (IsAppServer) then
    FCdsTendencia.Free;
end;

procedure TCtrlTabPesqui.DoChangeDataBase;
begin
  inherited;
  FCdsTendencia := TCMClientDataSet.Create(nil);
end;

procedure TCtrlTabPesqui.OnCreateAppServer;
begin
  inherited;
end;

function TCtrlTabPesqui.ListPessoaComTendPesquisaSal(IdPesqSalar, IdCargo: double): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT DISTINCT' +CR_LF+
    '  P.IDPESSOA, P.NOME' +CR_LF+
    'FROM' +CR_LF+
    '  PESSOA P, TENDPESQSAL T' +CR_LF+
    'WHERE' +CR_LF+
    '  (T.IDPESQSALAR     = ' +FloatToStr(IdPesqSalar)+ ') AND' +CR_LF+
    IFF(IdCargo=0, '', '  (T.IDCARGO         = ' +FloatToStr(IdCargo)+ ') AND' +CR_LF)+
    '  (T.IDEMPRESAPARTIC = P.IDPESSOA)' +CR_LF+
    'ORDER BY' +CR_LF+
    '  P.NOME');
end;

function TCtrlTabPesqui.ListHistorico(IdEmpresa: integer; IdPesqSalar, IdCargo: double): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+CR_LF+
    '  TEN.IDEMPRESAPARTIC, TEN.FREQ,'+CR_LF+
    '  TO_CHAR(DECODE(P.IDPESSOA,'+CR_LF+
    '    NULL,' +QuotedStr(('Empresa '))+ ' || TO_CHAR(TEN.IDEMPRESAPARTIC),'+CR_LF+
    '    P.NOME'+CR_LF+
    '  )) AS ENTIDADE,'+CR_LF+
    '  TRUNC(TO_NUMBER(DECODE(TEN.IDEMPRESAPARTIC,' +IntToStr(IdEmpresa)+ ',1,DECODE(AJU.IDPESQSALAR,NULL,1,AJU.FATOR))) * TEN.MENOR) AS MENORC,'+CR_LF+
    '  TRUNC(TO_NUMBER(DECODE(TEN.IDEMPRESAPARTIC,' +IntToStr(IdEmpresa)+ ',1,DECODE(AJU.IDPESQSALAR,NULL,1,AJU.FATOR))) * TEN.PRIMQUA) AS PRIMQUAC,'+CR_LF+
    '  TRUNC(TO_NUMBER(DECODE(TEN.IDEMPRESAPARTIC,' +IntToStr(IdEmpresa)+ ',1,DECODE(AJU.IDPESQSALAR,NULL,1,AJU.FATOR))) * TEN.MEDIA) AS MEDIAC,'+CR_LF+
    '  TRUNC(TO_NUMBER(DECODE(TEN.IDEMPRESAPARTIC,' +IntToStr(IdEmpresa)+ ',1,DECODE(AJU.IDPESQSALAR,NULL,1,AJU.FATOR))) * TEN.MODA) AS MODAC,'+CR_LF+
    '  TRUNC(TO_NUMBER(DECODE(TEN.IDEMPRESAPARTIC,' +IntToStr(IdEmpresa)+ ',1,DECODE(AJU.IDPESQSALAR,NULL,1,AJU.FATOR))) * TEN.MEDIANA) AS MEDIANAC,'+CR_LF+
    '  TRUNC(TO_NUMBER(DECODE(TEN.IDEMPRESAPARTIC,' +IntToStr(IdEmpresa)+ ',1,DECODE(AJU.IDPESQSALAR,NULL,1,AJU.FATOR))) * TEN.TERCQUA) AS TERCQUAC,'+CR_LF+
    '  TRUNC(TO_NUMBER(DECODE(TEN.IDEMPRESAPARTIC,' +IntToStr(IdEmpresa)+ ',1,DECODE(AJU.IDPESQSALAR,NULL,1,AJU.FATOR))) * TEN.MAIOR) AS MAIORC,'+CR_LF+
    '  TRUNC(TO_NUMBER(DECODE(TEN.IDEMPRESAPARTIC,' +IntToStr(IdEmpresa)+ ',1,DECODE(AJU.IDPESQSALAR,NULL,1,AJU.FATOR))) * TEN.MENOR_R) AS MENOR_RC,'+CR_LF+
    '  TRUNC(TO_NUMBER(DECODE(TEN.IDEMPRESAPARTIC,' +IntToStr(IdEmpresa)+ ',1,DECODE(AJU.IDPESQSALAR,NULL,1,AJU.FATOR))) * TEN.PRIMQUA_R) AS PRIMQUA_RC,'+CR_LF+
    '  TRUNC(TO_NUMBER(DECODE(TEN.IDEMPRESAPARTIC,' +IntToStr(IdEmpresa)+ ',1,DECODE(AJU.IDPESQSALAR,NULL,1,AJU.FATOR))) * TEN.MEDIA_R) AS MEDIA_RC,'+CR_LF+
    '  TRUNC(TO_NUMBER(DECODE(TEN.IDEMPRESAPARTIC,' +IntToStr(IdEmpresa)+ ',1,DECODE(AJU.IDPESQSALAR,NULL,1,AJU.FATOR))) * TEN.MODA_R) AS MODA_RC,'+CR_LF+
    '  TRUNC(TO_NUMBER(DECODE(TEN.IDEMPRESAPARTIC,' +IntToStr(IdEmpresa)+ ',1,DECODE(AJU.IDPESQSALAR,NULL,1,AJU.FATOR))) * TEN.MEDIANA_R) AS MEDIANA_RC,'+CR_LF+
    '  TRUNC(TO_NUMBER(DECODE(TEN.IDEMPRESAPARTIC,' +IntToStr(IdEmpresa)+ ',1,DECODE(AJU.IDPESQSALAR,NULL,1,AJU.FATOR))) * TEN.TERCQUA_R) AS TERCQUA_RC,'+CR_LF+
    '  TRUNC(TO_NUMBER(DECODE(TEN.IDEMPRESAPARTIC,' +IntToStr(IdEmpresa)+ ',1,DECODE(AJU.IDPESQSALAR,NULL,1,AJU.FATOR))) * TEN.MAIOR_R) AS MAIOR_RC'+CR_LF+
    'FROM'+CR_LF+
    '  PESSOA P, TENDPESQSAL TEN, AJUSTPESQ AJU'+CR_LF+
    'WHERE'+CR_LF+
    '  (TEN.IDPESQSALAR     = ' +FloatToStr(IdPesqSalar)+ ') AND'+CR_LF+
    '  (TEN.IDCARGO         = ' +FloatToStr(IdCargo)+ ') AND'+CR_LF+
    '  (P.TIPO              = ''J'') AND'+CR_LF+
    '  (TEN.IDEMPRESAPARTIC = P.IDPESSOA(+)) AND'+CR_LF+
    '  (TEN.IDEMPRESAPARTIC = AJU.IDEMPRESAPARTIC(+)) AND'+CR_LF+
    '  (TEN.IDPESQSALAR     = AJU.IDPESQSALAR(+))');
end;

function TCtrlTabPesqui.ListDadosTend(IdEmpresa: integer; IdPesqSalar, IdCargo: double): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+CR_LF+
    '  DAD.IDEMPRPART, DAD.NOMINAL, DAD.REAL, DAD.FREQ,'+CR_LF+
    '  TO_NUMBER(DECODE(DAD.IDEMPRPART,'+CR_LF+
    '    ' +IntToStr(IdEmpresa)+ ',1,'+CR_LF+
    '    TO_NUMBER(DECODE(AJU.IDPESQSALAR,'+CR_LF+
    '      NULL,1,'+CR_LF+
    '      AJU.FATOR'+CR_LF+
    '    ))'+CR_LF+
    '  )) AS FATOR'+CR_LF+
    'FROM'+CR_LF+
    '  DADOPESQSAL DAD, AJUSTPESQ AJU'+CR_LF+
    'WHERE'+CR_LF+
    '  (DAD.IDPESQSALAR = ' +FloatToStr(IdPesqSalar)+ ') AND'+CR_LF+
    '  (DAD.IDCARGO     = ' +FloatToStr(IdCargo)+ ') AND'+CR_LF+
    '  (DAD.IDEMPRPART  = ' +IntToStr(IdEmpresa)+ ') AND'+CR_LF+
    '  (DAD.IDPESQSALAR = AJU.IDPESQSALAR(+))');
end;

function TCtrlTabPesqui.GerarTabulacao(TipoExclusao: integer; IdEmpresa: integer; IdEntidade,
  IdPesqSalar, IdCargo, PercCorte: double): boolean;
var
  iTotFreq, Indice, iModaFreq, iTamanho: integer;
  rTotNom, rTotReal, rModaNom, rModaReal, rMediaNom, rMediaReal, rFatAjus: real;
  sVinteZeros: string;
  bTemDados: boolean;
  _CdsDadosTend: TCMClientDataSet;
  ListaSalNom, ListaSalReal: TStringList;
begin
  try
    rMediaNom := FMedia;
    rMediaReal := FMediaReal;
    _CdsDadosTend := TCMClientDataSet.Create(nil);
    ListaSalNom := TStringList.Create;
    ListaSalReal := TStringList.Create;

    ListaSalNom.Sorted := true;
    ListaSalNom.Duplicates := dupAccept;
    ListaSalReal.Sorted := true;
    ListaSalReal.Duplicates := dupAccept;

    sVinteZeros := '00000000000000000000';
    iTotFreq := 0;
    iModaFreq := 0;
    rTotNom := 0;
    rTotReal := 0;
    rModaNom := 0;
    rModaReal := 0;

    FCdsTendencia.Data := ListHistorico(IdEmpresa, IdPesqSalar, IdCargo);

    while not(FCdsTendencia.EOF) do
    begin
      _CdsDadosTend.Data := ListDadosTend(FCdsTendencia.FieldByName('IDEMPRESAPARTIC').asInteger,
        IdPesqSalar, IdCargo);

      bTemDados := false;
      while not(_CdsDadosTend.EOF) do
      begin
        bTemDados := true;
        if ((TipoExclusao = 0) and
            (_CdsDadosTend.FieldByName('IDEMPRPART').asFloat = IdEmpresa)) or
           ((TipoExclusao = 1) and
            (_CdsDadosTend.FieldByName('IDEMPRPART').asFloat = IdEntidade)) then
        begin
          _CdsDadosTend.Next;
          Continue;
        end;

        // Considera o Fator de Ajuste
        rFatAjus := _CdsDadosTend.FieldByName('FATOR').asFloat;

        // Faz o Corte
        if (PercCorte > 0) and
           ((abs(_CdsDadosTend.FieldByName('NOMINAL').asFloat * rFatAjus - rMediaNom)
             * 100 / rMediaNom > PercCorte) or
            (abs(_CdsDadosTend.FieldByName('REAL').asFloat * rFatAjus - rMediaReal)
             * 100 / rMediaReal > PercCorte)) then
        begin
          _CdsDadosTend.Next;
          Continue;
        end;

        iTotFreq := iTotFreq + _CdsDadosTend.FieldByName('FREQ').asInteger;

        for Indice:=1 to _CdsDadosTend.FieldByName('FREQ').asInteger do
        begin
          // Criar Listas Classificadas para Sal. Nominal e Real
          iTamanho := Length(FloatToStrF(_CdsDadosTend.FieldByName('NOMINAL').asFloat * rFatAjus,ffFixed,10,0));
          ListaSalNom.Add(Copy(sVinteZeros,1,20-iTamanho) +
            FloatToStrF(_CdsDadosTend.FieldByName('NOMINAL').asFloat * rFatAjus,ffFixed,10,0));

          iTamanho := Length(FloatToStrF(_CdsDadosTend.FieldByName('REAL').asFloat * rFatAjus,ffFixed,10,0));
          ListaSalReal.Add(Copy(sVinteZeros,1,20-iTamanho) +
            FloatToStrF(_CdsDadosTend.FieldByName('REAL').asFloat * rFatAjus,ffFixed,10,0));
        end;

        rTotNom := rTotNom + _CdsDadosTend.FieldByName('FREQ').asInteger *
          _CdsDadosTend.FieldByName('NOMINAL').asFloat * rFatAjus;
        rTotReal := rTotReal + _CdsDadosTend.FieldByName('FREQ').asInteger *
          _CdsDadosTend.FieldByName('REAL').asFloat * rFatAjus;

        if (_CdsDadosTend.FieldByName('FREQ').asInteger >= iModaFreq) then
        begin
          rModaNom := _CdsDadosTend.FieldByName('NOMINAL').asFloat * rFatAjus;
          rModaReal := _CdsDadosTend.FieldByName('REAL').asFloat * rFatAjus;
          iModaFreq := _CdsDadosTend.FieldByName('FREQ').asInteger;
        end;
        _CdsDadosTend.Next;
      end;

      if not(bTemDados) then
      begin
        // Faz o Corte
        if (PercCorte > 0) and
           ((abs(FCdsTendencia.FieldByName('MENORC').asFloat - rMediaNom)
             * 100 / rMediaNom > PercCorte) or
            (abs(FCdsTendencia.FieldByName('MAIORC').asFloat - rMediaNom)
             * 100 / rMediaNom > PercCorte) or
            (abs(FCdsTendencia.FieldByName('MENOR_RC').asFloat - rMediaReal)
             * 100 / rMediaReal > PercCorte) or
            (abs(FCdsTendencia.FieldByName('MAIOR_RC').asFloat - rMediaReal)
             * 100 / rMediaReal > PercCorte)) then
        begin
          FCdsTendencia.Next;
          Continue;
        end;

        // Faz a acumulação com dados de tendência
        iTotFreq := iTotFreq + FCdsTendencia.FieldByName('FREQ').asInteger;

        iTamanho := Length(FloatToStrF(FCdsTendencia.FieldByName('MENORC').asFloat,ffFixed,10,0));
        ListaSalNom.Add(Copy(sVinteZeros,1,20-iTamanho) +
          FloatToStrF(FCdsTendencia.FieldByName('MENORC').asFloat, ffFixed,10,0));

        iTamanho := Length(FloatToStrF(FCdsTendencia.FieldByName('MENOR_RC').asFloat,ffFixed,10,0));
        ListaSalReal.Add(Copy(sVinteZeros,1,20-iTamanho) +
          FloatToStrF(FCdsTendencia.FieldByName('MENOR_RC').asFloat, ffFixed,10,0));

        if (FCdsTendencia.FieldByName('FREQ').asInteger > 1) then
        begin
          iTamanho := Length(FloatToStrF(FCdsTendencia.FieldByName('MAIORC').asFloat,ffFixed,10,0));
          ListaSalNom.Add(Copy(sVinteZeros,1,20-iTamanho) +
            FloatToStrF(FCdsTendencia.FieldByName('MAIORC').asFloat, ffFixed,10,0));

          iTamanho := Length(FloatToStrF(FCdsTendencia.FieldByName('MAIOR_RC').asFloat,ffFixed,10,0));
          ListaSalReal.Add(Copy(sVinteZeros,1,20-iTamanho) +
            FloatToStrF(FCdsTendencia.FieldByName('MAIOR_RC').asFloat, ffFixed,10,0));
        end;

        if (FCdsTendencia.FieldByName('FREQ').asInteger > 2) then
          for Indice:=3 to FCdsTendencia.FieldByName('FREQ').asInteger do
          begin
            iTamanho := Length(FloatToStrF(FCdsTendencia.FieldByName('MEDIAC').asFloat,ffFixed,10,0));
            ListaSalNom.Add(Copy(sVinteZeros,1,20-iTamanho) +
              FloatToStrF(FCdsTendencia.FieldByName('MEDIAC').asFloat, ffFixed,10,0));

            iTamanho := Length(FloatToStrF(FCdsTendencia.FieldByName('MEDIA_RC').asFloat,ffFixed,10,0));
            ListaSalReal.Add(Copy(sVinteZeros,1,20-iTamanho) +
              FloatToStrF(FCdsTendencia.FieldByName('MEDIA_RC').asFloat, ffFixed,10,0));
          end;

        rTotNom := rTotNom + FCdsTendencia.FieldByName('FREQ').asFloat *
          FCdsTendencia.FieldByName('MEDIAC').asFloat;
        rTotReal := rTotReal + FCdsTendencia.FieldByName('FREQ').asFloat *
          FCdsTendencia.FieldByName('MEDIA_RC').asFloat;

        if (FCdsTendencia.FieldByName('FREQ').asInteger >= iModaFreq) then
        begin
          rModaNom := FCdsTendencia.FieldByName('MODAC').asFloat;
          rModaReal := FCdsTendencia.FieldByName('MODA_RC').asFloat;
          iModaFreq := FCdsTendencia.FieldByName('FREQ').asInteger;
        end;
      end;
      FCdsTendencia.Next;
    end;

    FFrequencia := iTotFreq;

    // Valores Nominais
    FValMenor := StrToInt(ListaSalNom[0]);

    Indice := Round(ListaSalNom.Count/4)-1;
    if (Indice < 0) then
      Indice := 0;
    FQuartil1 := StrToInt(ListaSalNom[Indice]);

    Indice := Round(ListaSalNom.Count/2)-1;
    if (Indice < 0) then
      Indice := 0;
    FMediana := StrToInt(ListaSalNom[Indice]);

    Indice := Round(3*ListaSalNom.Count/4)-1;
    if (Indice < 0) then
      Indice := 0;
    FQuartil3 := StrToInt(ListaSalNom[Indice]);

    FMedia := rTotNom / iTotFreq;
    FModa := rModaNom;
    FValMaior := StrToInt(ListaSalNom[ListaSalNom.Count-1]);

    // Valores Reais
    FValMenorReal := StrToInt(ListaSalReal[0]);

    Indice := Round(ListaSalReal.Count/4)-1;
    if (Indice < 0) then
      Indice := 0;
    FQuartil1Real := StrToInt(ListaSalReal[Indice]);

    Indice := Round(ListaSalReal.Count/2)-1;
    if (Indice < 0) then
      Indice := 0;
    FMedianaReal := StrToInt(ListaSalReal[Indice]);

    Indice := Round(3 * ListaSalReal.Count / 4) - 1;
    if (Indice < 0) then
      Indice := 0;
    FQuartil3Real := StrToInt(ListaSalReal[Indice]);

    FMediaReal := rTotReal / iTotFreq;
    FModaReal := rModaReal;
    FValMaiorReal := StrToInt(ListaSalReal[ListaSalReal.Count - 1]);

    _CdsDadosTend.Free;
    ListaSalNom.Free;
    ListaSalReal.Free;

    Result := true;
  except
    on E: Exception do
    begin
      Result := false;
      MessageInfo := E.Message;
    end;
  end;
end;

end.
