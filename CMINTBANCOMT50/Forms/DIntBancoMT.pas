{*******************************************************}
{                                                       }
{ CM Soluções Informática  - CMIntBanco50               }
{ ** Todos os Direitos Reservados                       }
{                                                       }
{ - Impressão de arquivos com código de barras do BB    }
{ - Geração do arquivo BANCO DO BRASIL ARQUVIVO LASER   }
{                      IDMODELOSCNAB = 15/R             }
{                                                       }
{ Analista Responsável: Gustavo Viegas                  }
{ Atualizado Em: 27/06/2001                             }
{                23/10/2001 - Fábio Barros              }
{                                                       }
{*******************************************************}


unit DIntBancoMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBTables, Db, Wwdatsrc, ppDB, ppDBBDE, ppCtrls, ppBarCod,
  ppPrnabl, ppClass, ppCache, ppBands, ppComm, ppProd, ppReport, 
  ppStrtch, ppMemo, uSistema, ppVar, ppDBPipe, ppRelatv, CmParamReport, uCnabBbMT,
  DBClient, uCMClientDataSet, uCmSqlParams;

type
  TDtmIntBancoMT = class(TForm)
    RptBarrasBB: TppReport;
    ppReport1DetailBand1: TppDetailBand;
    RptBarrasBBLine36: TppLine;
    RptBarrasBBLine41: TppLine;
    RptBarrasBBLine29: TppLine;
    RptBarrasBBLine43: TppLine;
    RptBarrasBBLine42: TppLine;
    RptBarrasBBLabel42: TppLabel;
    RptBarrasBBLine48: TppLine;
    RptBarrasBBLine52: TppLine;
    RptBarrasBBLine50: TppLine;
    RptBarrasBBLine49: TppLine;
    RptBarrasBBLine21: TppLine;
    RptBarrasBBLine23: TppLine;
    RptBarrasBBLine22: TppLine;
    RptBarrasBBLine19: TppLine;
    RptBarrasBBLine5: TppLine;
    RptBarrasBBLine13: TppLine;
    RptBarrasBBLabel1: TppLabel;
    RptBarrasBBLabel2: TppLabel;
    RptBarrasBBLine1: TppLine;
    RptBarrasBBLine3: TppLine;
    RptBarrasBBLine2: TppLine;
    RptBarrasBBLine4: TppLine;
    RptBarrasBBLine6: TppLine;
    RptBarrasBBLine7: TppLine;
    RptBarrasBBLine8: TppLine;
    RptBarrasBBLine9: TppLine;
    RptBarrasBBLine10: TppLine;
    RptBarrasBBLine11: TppLine;
    RptBarrasBBLabel3: TppLabel;
    RptBarrasBBLine14: TppLine;
    RptBarrasBBLine15: TppLine;
    RptBarrasBBLine16: TppLine;
    RptBarrasBBLine17: TppLine;
    RptBarrasBBLabel4: TppLabel;
    RptBarrasBBLabel5: TppLabel;
    RptBarrasBBLabel6: TppLabel;
    RptBarrasBBLabel7: TppLabel;
    RptBarrasBBLabel8: TppLabel;
    RptBarrasBBLabel9: TppLabel;
    RptBarrasBBLabel10: TppLabel;
    RptBarrasBBLabel11: TppLabel;
    RptBarrasBBLabel12: TppLabel;
    RptBarrasBBLabel13: TppLabel;
    RptBarrasBBLabel14: TppLabel;
    RptBarrasBBLabel15: TppLabel;
    RptBarrasBBLabel16: TppLabel;
    RptBarrasBBLabel17: TppLabel;
    RptBarrasBBLabel18: TppLabel;
    RptBarrasBBLabel19: TppLabel;
    RptBarrasBBLabel20: TppLabel;
    RptBarrasBBLabel21: TppLabel;
    RptBarrasBBLabel22: TppLabel;
    RptBarrasBBLine18: TppLine;
    RptBarrasBBLabel23: TppLabel;
    RptBarrasBBLine20: TppLine;
    RptBarrasBBLabel24: TppLabel;
    RptBarrasBBLabel25: TppLabel;
    RptBarrasBBLabel26: TppLabel;
    RptBarrasBBLabel27: TppLabel;
    RptBarrasBBLabel28: TppLabel;
    RptBarrasBBLabel29: TppLabel;
    RptBarrasBBLabel30: TppLabel;
    RptBarrasBBLabel31: TppLabel;
    RptBarrasBBLabel32: TppLabel;
    RptBarrasBBLine24: TppLine;
    RptBarrasBBLine25: TppLine;
    RptBarrasBBLine26: TppLine;
    RptBarrasBBLine27: TppLine;
    RptBarrasBBLine28: TppLine;
    RptBarrasBBLabel33: TppLabel;
    RptBarrasBBLabel34: TppLabel;
    RptBarrasBBLine30: TppLine;
    RptBarrasBBLine31: TppLine;
    RptBarrasBBLine32: TppLine;
    RptBarrasBBLine33: TppLine;
    RptBarrasBBLine34: TppLine;
    RptBarrasBBLine35: TppLine;
    RptBarrasBBLine37: TppLine;
    RptBarrasBBLine38: TppLine;
    RptBarrasBBLabel36: TppLabel;
    RptBarrasBBLine40: TppLine;
    RptBarrasBBLabel37: TppLabel;
    RptBarrasBBLabel39: TppLabel;
    RptBarrasBBLabel40: TppLabel;
    RptBarrasBBLabel41: TppLabel;
    RptBarrasBBLabel43: TppLabel;
    RptBarrasBBLabel44: TppLabel;
    RptBarrasBBLabel45: TppLabel;
    RptBarrasBBLabel46: TppLabel;
    RptBarrasBBLabel47: TppLabel;
    RptBarrasBBLabel48: TppLabel;
    RptBarrasBBLabel49: TppLabel;
    RptBarrasBBLabel50: TppLabel;
    RptBarrasBBLabel51: TppLabel;
    RptBarrasBBLabel52: TppLabel;
    RptBarrasBBLabel53: TppLabel;
    RptBarrasBBLabel54: TppLabel;
    RptBarrasBBLabel55: TppLabel;
    RptBarrasBBLine44: TppLine;
    RptBarrasBBLabel56: TppLabel;
    RptBarrasBBLine45: TppLine;
    RptBarrasBBLabel57: TppLabel;
    RptBarrasBBLabel58: TppLabel;
    RptBarrasBBLabel59: TppLabel;
    RptBarrasBBLabel60: TppLabel;
    RptBarrasBBLabel61: TppLabel;
    RptBarrasBBLabel62: TppLabel;
    RptBarrasBBLabel63: TppLabel;
    LblAceite: TppLabel;
    RptBarrasBBLabel65: TppLabel;
    RptBarrasBBLine46: TppLine;
    RptBarrasBBLine47: TppLine;
    RptBarrasBBDBText1: TppDBText;
    RptBarrasBBDBText2: TppDBText;
    RptBarrasBBDBText4: TppDBText;
    RptBarrasBBDBText5: TppDBText;
    RptBarrasBBDBText6: TppDBText;
    RptBarrasBBLabel35: TppLabel;
    RptBarrasBBLabel38: TppLabel;
    RptBarrasBBLabel66: TppLabel;
    LblCarteira: TppLabel;
    RptBarrasBBDBText3: TppDBText;
    RptBarrasBBDBText7: TppDBText;
    RptBarrasBBLabel69: TppLabel;
    RptBarrasBBLabel70: TppLabel;
    RptBarrasBBLabel71: TppLabel;
    RptBarrasBBDBText17: TppDBText;
    RptBarrasBBDBText18: TppDBText;
    RptBarrasBBLabel72: TppLabel;
    RptBarrasBBDBText19: TppDBText;
    RptBarrasBBDBText20: TppDBText;
    RptBarrasBBDBText21: TppDBText;
    RptBarrasBBDBText22: TppDBText;
    RptBarrasBBDBText23: TppDBText;
    RptBarrasBBDBText24: TppDBText;
    RptBarrasBBDBText25: TppDBText;
    RptBarrasBBDBText26: TppDBText;
    RptBarrasBBDBText27: TppDBText;
    RptBarrasBBLabel73: TppLabel;
    RptBarrasBBDBText28: TppDBText;
    RptBarrasBBDBText29: TppDBText;
    RptBarrasBBDBText30: TppDBText;
    RptBarrasBBDBText31: TppDBText;
    RptBarrasBBDBText32: TppDBText;
    RptBarrasBBDBText33: TppDBText;
    RptBarrasBBDBText34: TppDBText;
    RptBarrasBBLabel74: TppLabel;
    LblEmpresa2: TppLabel;
    RptBarrasBBDBText40: TppDBText;
    RptBarrasBBDBText41: TppDBText;
    RptBarrasBBDBText42: TppDBText;
    LblCarteira2: TppLabel;
    RptBarrasBBDBText43: TppDBText;
    RptBarrasBBDBText44: TppDBText;
    RptBarrasBBDBText45: TppDBText;
    RptBarrasBBDBText46: TppDBText;
    LblAgenciaCedente: TppLabel;
    LblEmpresa: TppLabel;
    RptBarrasBBDBText47: TppDBText;
    RptBarrasBBDBText48: TppDBText;
    RptBarrasBBDBText49: TppDBText;
    Barras: TppDBBarCode;
    RptBarrasBBLine51: TppLine;
    RptBarrasBBImage1: TppImage;
    RptBarrasBBImage2: TppImage;
    PpBarrasBB: TppBDEPipeline;
    DsBarrasBB: TwwDataSource;
    MemMensagem2: TppMemo;
    MemMensagem1: TppMemo;
    LblEspeciedoc: TppLabel;
    LblEspecieDoc2: TppLabel;
    RptBarrasBBCalc1: TppSystemVariable;
    RptBarrasBBCalc2: TppSystemVariable;
    CprBBLaser: TCmParamReport;
    SQLParamIntBanco: TCMSqlParams;
    CdsParamIntBanco: TCMClientDataSet;
    SQLBarrasBB: TCMSqlParams;
    CdsBarrasBB: TCMClientDataSet;
    sqlValMaximo: TCMSqlParams;
    cdsValMaximo: TCMClientDataSet;
   procedure RptBarrasBBBeforePrint(Sender: TObject);
   procedure LblEmpresa2Print(Sender: TObject);
   procedure LblAgenciaCedentePrint(Sender: TObject);
    procedure ppReport1DetailBand1BeforePrint(Sender: TObject);
    procedure LblCarteiraPrint(Sender: TObject);
    procedure LblEspeciedocPrint(Sender: TObject);
    procedure LblAceitePrint(Sender: TObject);
    procedure RptBarrasBBCancel(Sender: TObject);
    procedure DtmCobrancaDestroy(Sender: TObject);
  private
    {Nome do Arquivo de Remessa a Ser Gerado}
    ArquivoRemessa :TextFile;
    {Array com as mensgens a serem impressas na ficha de compensação}
    fMensagensCnab :TMensagensCnab;
    {Dígito verficador do código de barras calculado com módulo 11}
    iDigito11 :Integer;
    {Carteira de cobrança da ficha de compensação}
    sCarteira :String;
    {Carteira de cobrança do título da ficha de compensação}
    sCarteiraTit :String;
    {espécie do documento da ficha de compensação}
    sEspecieDoc :String;
    {tipo de aceite do documento da ficha de compensação}
    sAceite :String;
    {Contador de registros gerados (fichas de compensação impressas)}
    _iNumSeq :Integer;
    {Tipo de inscrição do favorecido (CPF ou CGC)}
    _TipoInsc :String;
    {Nosso numero gerado a ser impresso}
    _NossoNumero :Double;
    {Busca a mensagem do documento cadastrada na tabela MENSAGENSCNAB}
    function GetMensagensCnab(indice, itam :Integer) :String;
    {Calcula dígito verificador do nosso número com a base passada em imodulo}
    function CalculaDac(sNossoNumero: String; iModulo: Integer): String;
    {Monta o a composição do código de barras ou da linha digitável da ficha de compensação}
    function MontaBarras(bCodBarras: Boolean): String;
    {Cálculo do dígito verificado com módulo 10}
    function CalculaDac10(sNum:String):Integer;
    {Cálculo do dígito verificado com módulo 11}
    function CalculaDac11(sNum:String):Integer;

    {Arquivo BANCO DO BRASIL ARQUVIVO LASER - IDMODELOSCNAB = 15}
    {Header do Arquivo}
    Procedure BbLaserHeader01;
    {Registro de Detalhe para Instruçòes de cobrança específicas do título para a ficha de compensação
     Até 2 registros, 8 mensagens com 60 caracteres}
    Procedure BbLaserDet02(ifatorMsg :Integer);
    {Registro de Detalhe Instruçòes de cobrança específicas do título para a ficha de compensação
     Até 2 registros, 8 mensagens com 60 caracteres}
    Procedure BbLaserDet05(ifatorMsg :Integer);
    {Detalhe com os atributos para a cobrança}
    Procedure BbLaserDet10;
    {Trailer do Registro}
    Procedure BbLaserTrailer99;
  public
    {Gera e imprime as fichas de compensação}
    Procedure ExibeRelatorio;
    {Gera o Arquivo BANCO DO BRASIL ARQUVIVO LASER - IDMODELOSCNAB = 15}
    Procedure MontaBBLaser;
  end;

implementation

{$R *.DFM}

Uses
  uContaBancariaMT, uIntBancoManager, uString, uCMDialogs;

Procedure TDtmIntBancoMT.ExibeRelatorio;
Var
    X, iCarteira:Integer;
    rNossoNumero: Double;
Begin
   sCarteiraTit      := IntBancoManager.BuscaParamIntBanco('CARTEIRA','S');
   sAceite           := IntBancoManager.BuscaParamIntBanco('ACEITE','S');
   sEspecieDoc       := IntBancoManager.BuscaParamIntBanco('ESPECIEDOC','S');

   Try
     iCarteira := StrToInt(Copy(sCarteiraTit,1,2));
   Except
     iCarteira := 0;
   End;

   sCarteira := ZD(IntToStr(iCarteira),2);

   SQLBarrasBB.Open;

   If IntBancoManager.NossoNumero <> '0' Then
       rNossoNumero := StrToFloat(Copy(IntBancoManager.NossoNumero,1,11))
   Else
       rNossoNumero := 0;

   IntBancoManager.CdsTexto.First;

   While Not IntBancoManager.CdsTexto.Eof Do
   Begin
     CdsBarrasBB.Append;
// início - andré tavares - pendência 16952 - 11/06/2004 - isso abaixo não funciona, pois o código sql do cdstexto pode mudar !!!!
{
     For X:=0 To 27 Do
        CdsBarrasBB.Fields[x].Value := IntBancoManager.CdsTexto.Fields[x].Value;
}
// isso aqui funciona
     CdsBarrasBB.fieldByName('CEP').asString            := IntBancoManager.CdsTexto.fieldByName('CEP').asString;
     CdsBarrasBB.fieldByName('CODESTADO').asString      := IntBancoManager.CdsTexto.fieldByName('CODESTADO').asString;
     CdsBarrasBB.fieldByName('CIDADE').asString         := IntBancoManager.CdsTexto.fieldByName('CIDADE').asString;
     CdsBarrasBB.fieldByName('BAIRRO').asString         := IntBancoManager.CdsTexto.fieldByName('BAIRRO').asString;
     CdsBarrasBB.fieldByName('COMPLEMENTO').asString    := IntBancoManager.CdsTexto.fieldByName('COMPLEMENTO').asString;
     CdsBarrasBB.fieldByName('NUMERO').asString         := IntBancoManager.CdsTexto.fieldByName('NUMERO').asString;
     CdsBarrasBB.fieldByName('LOGRADOURO').asString     := IntBancoManager.CdsTexto.fieldByName('LOGRADOURO').asString;
     CdsBarrasBB.fieldByName('NUMDOCUMENTO').asString   := IntBancoManager.CdsTexto.fieldByName('NUMDOCUMENTO').asString;
     CdsBarrasBB.fieldByName('NOME').asString           := IntBancoManager.CdsTexto.fieldByName('NOME').asString;
     CdsBarrasBB.fieldByName('VALORDESCONTO').asString  := IntBancoManager.CdsTexto.fieldByName('VALORDESCONTO').asString;
     CdsBarrasBB.fieldByName('DATALIMITE').asString     := IntBancoManager.CdsTexto.fieldByName('DATALIMITE').asString;
     CdsBarrasBB.fieldByName('DATAPROGRAMADA').asString := IntBancoManager.CdsTexto.fieldByName('DATAPROGRAMADA').asString;
     CdsBarrasBB.fieldByName('CODPORTFORMA').asString   := IntBancoManager.CdsTexto.fieldByName('CODPORTFORMA').asString;
     CdsBarrasBB.fieldByName('DATAVENCTO').asString     := IntBancoManager.CdsTexto.fieldByName('DATAVENCTO').asString;
     CdsBarrasBB.fieldByName('DATAEMISSAO').asString    := IntBancoManager.CdsTexto.fieldByName('DATAEMISSAO').asString;
     CdsBarrasBB.fieldByName('NODOCUMENTO').asString    := IntBancoManager.CdsTexto.fieldByName('NODOCUMENTO').asString;
     CdsBarrasBB.fieldByName('CODDOCUMENTO').asString   := IntBancoManager.CdsTexto.fieldByName('CODDOCUMENTO').asString;
     CdsBarrasBB.fieldByName('TIPO').asString           := IntBancoManager.CdsTexto.fieldByName('TIPO').asString;
     CdsBarrasBB.fieldByName('COMPLDOCUMENTO').asString := IntBancoManager.CdsTexto.fieldByName('COMPLDOCUMENTO').asString;
     CdsBarrasBB.fieldByName('TIPOENDERECO').asString   := IntBancoManager.CdsTexto.fieldByName('TIPOENDERECO').asString;
     CdsBarrasBB.fieldByName('NUMAGENCIA').asString     := IntBancoManager.CdsTexto.fieldByName('NUMAGENCIA').asString;
     CdsBarrasBB.fieldByName('NUMCONTA').asString       := IntBancoManager.CdsTexto.fieldByName('NUMCONTA').asString;
     CdsBarrasBB.fieldByName('VALORJUROS').asString     := IntBancoManager.CdsTexto.fieldByName('VALORJUROS').asString;
     CdsBarrasBB.fieldByName('RSALDO').asString         := IntBancoManager.CdsTexto.fieldByName('VALOR').asString;
     CdsBarrasBB.fieldByName('RSALDOOUTRAMOEDA').asString := IntBancoManager.CdsTexto.fieldByName('VALOROM').asString;
// fim - andré tavares - pendência 16952 - 11/06/2004
     CdsBarrasBB.FieldByName('STATUS').AsString := '1';
     CdsBarrasBB.FieldByName('EMISBLOQ').AsString := 'S';
     CdsBarrasBB.FieldByName('DATAREMESSA').AsDateTime := Date;
     CdsBarrasBB.FieldByName('NOSSONUMERO').AsString := CalculaDac(FloatToStr(rNossoNumero),11);
     CdsBarrasBB.FieldByName('CODBARRA').AsString := MontaBarras(True); //'01234567890123456789012345678901234567890123'
     CdsBarrasBB.FieldByName('CODBARRADIG').AsString := MontaBarras(False); //00186.99595  90309.403922  00152.059168         123'
     If CdsBarrasBB.FieldByName('MOESIGLA').IsNull Then
        CdsBarrasBB.FieldByName('MOESIGLA').AsString := 'R$';
     CdsBarrasBB.Post;

     if not IntBancoManager.AtualizaDoc('1',
                                        'S',
                                        CdsBarrasBB.FieldByName('NOSSONUMERO').AsString,
                                        DateToStr(Date),
                                        IntBancoManager.CodArquivoRemessa,
                                        CdsBarrasBB.FieldByName('CODDOCUMENTO').AsString,
                                        IntBancoManager.CdsTexto.FieldByName('FLGGRUPO').AsString) then
        raise Exception.Create(IntBancoManager.MessageInfo);

     IntBancoManager.CdsTexto.Next;
     rNossoNumero := rNossoNumero + 1;
   End;

   IntBancoManager.UltNossoNumero := FloatToStr(rNossoNumero);

   CdsBarrasBB.First;
   Try
     RptBarrasBB.Print;
     IntBancoManager.UltCodArquivoGerado := IntBancoManager.CodArquivoRemessa;
   Except
     IntBancoManager.UltNossoNumero := 'null';
     Raise;
   End;
End;


procedure TDtmIntBancoMT.RptBarrasBBBeforePrint(Sender: TObject);
begin
  Barras.AutoSize := False;
end;

procedure TDtmIntBancoMT.LblEmpresa2Print(Sender: TObject);
begin
 If Sender is TppLabel Then
    (Sender As TppLabel).Text := IntBancoManager.CdsEmpresa.FieldByName('RAZAOSOCIAL').AsString
end;

procedure TDtmIntBancoMT.LblAgenciaCedentePrint(Sender: TObject);
begin
 LblAgenciaCedente.Text := CdsBarrasBB.FieldByName('NUMAGENCIA').AsString + ' / ' +
                           IntBancoManager.NumeEmpresaBanco;
end;

Function TDtmIntBancoMT.CalculaDac(sNossoNumero: String; iModulo: Integer): String;
Var
  sNumero,sAuxResult: String;
  iPosicao, iBase, x, iDividendo, iDigito, iTamNum: Integer;
Begin
  Case iModulo of
  11:
    Begin
      sNumero := ZD(sNossoNumero,11);

      iBase := 9;
      iDividendo := 0;

      iTamNum := Length(sNumero) + 1;

      For X:=1 to Length(sNumero) do
      begin
          iDividendo := iDividendo + (StrToInt(sNumero[iTamNum - x]) * ibase);
          if iBase = 2 Then
           iBase := 9
          Else
           Dec(iBase);
      end;

      If (iDividendo Mod 11) <> 0 Then
      Begin
         iDigito := (iDividendo Mod 11)
      End
      Else
          iDigito := 0;

      If iDigito = 10 Then
         Result := sNumero + 'X'
      Else
         Result := sNumero + IntToStr(iDigito);
    End;
  10:
    Begin
       sNumero := Trim(sNossoNumero);
       iPosicao := Length(sNumero) + 1;
       iBase := 2;
       iDividendo := 0;

       For X:=1 to Length(sNumero) do
       begin
           sAuxResult := IntToStr((StrToInt(sNumero[iPosicao - x]) * ibase));
           If  Length(sAuxResult) > 1 Then
              iDividendo := iDividendo + StrToInt(sAuxResult[1]) + strToInt(sAuxResult[2])
           Else
              iDividendo := iDividendo + StrToInt(sAuxResult[1]);
           Dec(iBase);
           If iBase = 0 Then iBase := 2;
       end;

       iDigito := 10 - (iDividendo Mod 10);

       Result := Zd(sNossoNumero + IntToStr(iDigito),12);
    End;
  End;
end;


Function TDtmIntBancoMT.MontaBarras(bCodBarras: Boolean): String;
Var
    sCodBarras, sAuxCodBarras, sBanco, sMoeda, sValor, sCampoLivre: String;
    iCdigito: array [0..3] of Integer;
Begin
   If bCodBarras Then
   Begin
    sBanco      := '001';
    sMoeda      := '9';
    sValor      := ZD(RemoveVirgulas(IntBancoManager.CdsTexto.FieldByName('VALOR').AsFloat,2),14);
    sCampoLivre := Copy(CdsBarrasBB.FieldByName('NOSSONUMERO').AsString,1,11) +
                   ZD(CdsBarrasBB.FieldByName('NUMAGENCIA').AsString,4) +
                   ZD(Copy(Trim(IntBancoManager.NumeEmpresaBanco),1,
                           Length(Trim(IntBancoManager.NumeEmpresaBanco)) - 1),8) + sCarteira;
    //Cálculo do Dv Geral
    sAuxCodBarras := sBanco + sMoeda + sValor + sCampoLivre;

    iDigito11 := CalculaDac11(sAuxCodBarras);

    Result := sBanco + sMoeda + IntToStr(iDigito11) + sValor + sCampoLivre;
   End
   Else
   Begin
    sBanco      := '001';
    sMoeda      := '9';
    sCampoLivre := Copy(CdsBarrasBB.FieldByName('NOSSONUMERO').AsString,1,11) +
                   ZD(CdsBarrasBB.FieldByName('NUMAGENCIA').AsString,4) +
                   ZD(Copy(Trim(IntBancoManager.NumeEmpresaBanco),1,
                      Length(Trim(IntBancoManager.NumeEmpresaBanco)) - 1),8) + sCarteira;

    //Calculas os 3 Primeiros Dv's
    sCodBarras := sBanco + sMoeda + sCampoLivre;

    //Cálculo do DV do Campo 1
    sAuxCodBarras := Copy(sCodBarras,1,9);
    iCDigito[0]   := CalculaDac10(sAuxCodBarras);

    //Cálculo do DV do Campo 2
    sAuxCodBarras := Copy(sCodBarras,10,10);
    iCDigito[1]   := CalculaDac10(sAuxCodBarras);

    //Cálculo do DV do Campo 3
    sAuxCodBarras := Copy(sCodBarras,20,10);
    iCDigito[2]   := CalculaDac10(sAuxCodBarras);

    //-------------------------------------------------------
    sValor      := ZD(RemoveVirgulas(IntBancoManager.CdsTexto.FieldByName('VALOR').AsFloat,2),14);

    //Calculas o Dv Geral
    sCodBarras    := sBanco + sMoeda + sCampoLivre;

    sAuxCodBarras := Copy(sCodBarras,1,9) + IntToStr(iCDigito[0]) +
                     Copy(sCodBarras,10,10) + IntToStr(iCDigito[1]) +
                     Copy(sCodBarras,20,10) + IntToStr(iCDigito[2]) + sValor;

    //sAuxCodBarras := Copy(sAuxCodBarras,1,4) + Copy(sAuxCodBarras,6,39);

    //sAuxCodBarras := Copy(sAuxCodBarras,1,4) + Copy(sCodBarras,5,1) + Copy(sAuxCodBarras,5,44);

    sAuxCodBarras := Copy(sAuxCodBarras,1,Length(sAuxCodBarras)-14) + IntToStr(iDigito11) + sValor;

    Result := Copy(sAuxCodBarras,1,5) + '.'  +
              Copy(sAuxCodBarras,6,5) + '  ' +
              Copy(sAuxCodBarras,11,5) + '.' +
              Copy(sAuxCodBarras,16,6) + '  ' +
              Copy(sAuxCodBarras,22,5) + '.' +
              Copy(sAuxCodBarras,27,6) + '  ' +
              IntToStr(iDigito11) +
              AD(RemoveVirgulas(IntBancoManager.CdsTexto.FieldByName('VALOR').AsFloat,2),14);
   End;
End;



procedure TDtmIntBancoMT.ppReport1DetailBand1BeforePrint(Sender: TObject);
Var
  x:Integer;
  sSQL: String;
begin
   MemMensagem1.Lines.Clear;
   MemMensagem2.Lines.Clear;

   If CdsBarrasBB.FieldByName('FLGGRUPO').AsString = 'N' Then
      sSQL := 'SELECT MENSAGEM1,MENSAGEM2,MENSAGEM3,MENSAGEM4,MENSAGEM5,MENSAGEM6,MENSAGEM7,MENSAGEM8,MENSAGEM9 FROM MENSAGENSCNAB WHERE CODDOCUMENTO = ' + CdsBarrasBB.FieldByName('CODDOCUMENTO').AsString
   Else
      sSQL := 'SELECT MENSAGEM1,MENSAGEM2,MENSAGEM3,MENSAGEM4,MENSAGEM5,MENSAGEM6,MENSAGEM7,MENSAGEM8,MENSAGEM9 FROM MENSAGENSCNAB WHERE CODGRUPOCNAB = ' + CdsBarrasBB.FieldByName('CODDOCUMENTO').AsString;

   IntBancoManager.CdsAux.Data := IntBancoManager.GetDataPacket(sSQL);

   If Not IntBancoManager.CdsAux.isEmpty Then
      For X:=0 To 8 Do
      Begin
        MemMensagem1.Lines.Add(IntBancoManager.CdsAux.Fields[x].AsString);
        MemMensagem2.Lines.Add(IntBancoManager.CdsAux.Fields[x].AsString);
      End;

   IntBancoManager.CdsAux.Close;
end;

procedure TDtmIntBancoMT.LblCarteiraPrint(Sender: TObject);
begin
  If Sender is TppLabel Then
    (Sender as  TppLabel).Caption := sCarteiraTit;
end;

procedure TDtmIntBancoMT.LblEspeciedocPrint(Sender: TObject);
begin
  If Sender is TppLabel Then
    (Sender as  TppLabel).Caption := sEspecieDoc;
end;

procedure TDtmIntBancoMT.LblAceitePrint(Sender: TObject);
begin
  If Sender is TppLabel Then
    (Sender as  TppLabel).Caption := sAceite;
end;

function TDtmIntBancoMT.CalculaDac10(sNum:String):Integer;
Var
  sNumero,sAuxResult: String;
  iPosicao, iBase, x, iDividendo, iDigito : Integer;
Begin
       sNumero := Trim(sNum);
       iPosicao := Length(sNumero) + 1;
       iBase := 2;
       iDividendo := 0;

       For X:=1 to Length(sNumero) do
       begin
           sAuxResult := IntToStr((StrToInt(sNumero[iPosicao - x]) * ibase));
           If  Length(sAuxResult) > 1 Then
              iDividendo := iDividendo + StrToInt(sAuxResult[1]) + strToInt(sAuxResult[2])
           Else
              iDividendo := iDividendo + StrToInt(sAuxResult[1]);
           Dec(iBase);
           If iBase = 0 Then iBase := 2;
       end;

       If (iDividendo Mod 10) = 0 Then
          iDigito := 0
       Else
          iDigito := 10 - (iDividendo Mod 10);

       Result := iDigito
End;

function TDtmIntBancoMT.CalculaDac11(sNum:String):Integer;
Var
  sNumero: String;
  iBase, iDividendo, iDigito, X, iTamNum : Integer;
Begin
      sNumero := sNum;

      iBase := 9;
      iDividendo := 0;

      iTamNum := Length(sNumero) + 1;

      For X:=1 to Length(sNumero) do
      begin
          iDividendo := iDividendo + (StrToInt(sNumero[iTamNum - x]) * ibase);
          if iBase = 2 Then
           iBase := 9
          Else
           Dec(iBase);
      end;

      iDigito := (iDividendo Mod 11);

      If (iDigito = 0) OR (Idigito > 9) Then
         Result := 1
      Else
         Result := iDigito;
End;


procedure TDtmIntBancoMT.RptBarrasBBCancel(Sender: TObject);
begin
   RptBarrasBB.tag:=1;
end;

procedure TDtmIntBancoMT.DtmCobrancaDestroy(Sender: TObject);
begin
  RptBarrasBB.ResetDevices;
end;

procedure TDtmIntBancoMT.MontaBBLaser;
Var
 iContMessage, y: Integer;
begin
   If CprBBLaser.Execute Then
   Begin
      _iNumSeq   := 0;
      _TipoInsc  := '2';
      _NossoNumero := StrToFloat(IntBancoManager.NossoNumero);

      Try
         If IntBancoManager.CdsEmpresa.FieldByName('TIPO').AsString = 'J' Then
            _TipoInsc := '2'
         Else
            _TipoInsc := '1';

         AssignFile(ArquivoRemessa, IntBancoManager.sNomeArquivo);
         ReWrite(ArquivoRemessa);

         BbLaserHeader01;

         IntBancoManager.CdsTexto.First;
         While Not IntBancoManager.CdsTexto.Eof Do
         Begin
            If IntBancoManager.CdsTexto.FieldByName('TIPO').AsString = 'F' Then
                _TipoInsc := '1'
            Else
                _TipoInsc := '2';

            _NossoNumero := _NossoNumero + 1;

            If IntBancoManager.MontaSqlTestaMensagem(IntBancoManager.CdsTexto.FieldByName('FLGGRUPO').AsString) Then
            Begin
                iContMessage := 0;

                For Y:=0 To 8 Do
                    fMensagensCnab[y] := '';

                IntBancoManager.CdsMensagens.First;
                While not IntBancoManager.CdsMensagens.Eof Do
                Begin
                  fMensagensCnab[iContMessage] := IntBancoManager.CdsMensagens.Fields[0].AsString;

                  Inc(iContMessage);

                  If iContMessage > 8 Then break;

                  IntBancoManager.CdsMensagens.Next;
                End;
            End
            Else
            Begin
                fMensagensCnab[0] := '';
                fMensagensCnab[1] := '';
                fMensagensCnab[2] := '';
                fMensagensCnab[3] := '';
                fMensagensCnab[4] := '';
                fMensagensCnab[5] := '';
                fMensagensCnab[6] := '';
                fMensagensCnab[7] := '';
                fMensagensCnab[8] := '';
            End;

            BbLaserDet02(0);
            BbLaserDet02(4);
            //Mensagens do Verso da ficha de compensação
            //BbLaserDet03(0);
            //BbLaserDet04(0);
            BbLaserDet05(0);
            BbLaserDet05(4);

            BbLaserDet10;

            if not IntBancoManager.AtualizaDoc('1','S',FloatToStr(_NossoNumero),DateToStr(Date),IntBancoManager.CodArquivoRemessa,
                   IntBancoManager.CdsTexto.FieldByName('CodDocumento').AsString,
                   IntBancoManager.CdsTexto.FieldByName('FLGGRUPO').AsString) then
              raise Exception.Create(IntBancoManager.MessageInfo);

            IntBancoManager.CdsTexto.Next;
         End;

         BbLaserTrailer99;

         IntBancoManager.CdsMensagens.Close;

         CloseFile(ArquivoRemessa);

         IntBancoManager.UltNossoNumero      := FloatToStr(_NossoNumero);
         IntBancoManager.UltCodArquivoGerado := IntBancoManager.CodArquivoRemessa;
         IntBancoManager.MostraArquivo;
       Except
         IntBancoManager.CdsMensagens.Close;
         MsgAviso('Erro ao gerar arquivo de remessa, tente novamente!','Atenção');
         CloseFile(ArquivoRemessa);
         Abort;
       End;
   End
   Else
   Begin
     Raise Exception.Create('O arquivo de remessa para o Banco do Brasil não foi gerado');
   End;
end;

procedure TDtmIntBancoMT.BbLaserHeader01;
begin
  With IntBancoManager Do
  Begin
    WriteLn(ArquivoRemessa,Concat('01', //Código Do Registro
                                  GetAG(CdsEmpresa.FieldByName('NUMAGENCIA').AsString,4,False,True), //Prefixo da Agência
                                  GetDvAg(CdsEmpresa.FieldByName('NUMAGENCIA').AsString), //Dv Agência
                                  GetCC(CdsEmpresa.FieldByName('NUMCONTA').AsString,10,True,True), //Número CC + DV
                                  CprBBLaser.ParamValues[2].AsString, //Carteira
                                  ZD(CprBBLaser.ParamValues[12].AsString,3), //Variação
                                  ZD(CprBBLaser.ParamValues[0].AsString,6), //Número do Convênio
                                  AE(CdsEmpresa.FieldByName('RAZAOSOCIAL').AsString,45),//Nome Cedente
                                  AE(CprBBLaser.ParamValues[1].AsString,10), //Sigla Cedente
                                  CprBBLaser.ParamValues[7].AsString, //Forma Impressão
                                  AE(CdsEmpresa.FieldByName('ENDERECO').AsString,60),//Endereço para devolução
                                  ZE(CdsEmpresa.FieldByName('CEP').AsString,8),//Cep Para Devolução
                                  AE(CdsEmpresa.FieldByName('CIDADE').AsString,20),//Praça para Devolução
                                  ZD(CodArquivoRemessa,7), //Sequencia da remessa
                                  CprBBLaser.ParamValues[4].AsString, //Indicador de Conferência do Controle da Remessa
                                  Spc(4), //Espaços
                                  AE('CBR454',8), //Identificador do Arquivo
                                  Spc(3), //Reservado para o Banco
                                  Spc(53))); //Reservado para o Banco
    Inc(_iNumSeq);
  End;
end;

procedure TDtmIntBancoMT.BbLaserDet02(ifatorMsg :Integer);
begin
  //Instruções de Cobrança Fixas para a ficha de compensação
  //2 Registros, 8 mensagens com até 60 caracteres
  If (Trim(fMensagensCnab[0 + ifatorMsg]) <> '') Then
  begin
     WriteLn(ArquivoRemessa,Concat('02', //Código Do Registro
                                   CprBBLaser.ParamValues[9].AsString, //Tipo de Fonte Instrução 1
                                   CprBBLaser.ParamValues[9].AsString, //Tipo de Fonte Instrução 2
                                   CprBBLaser.ParamValues[9].AsString, //Tipo de Fonte Instrução 3
                                   CprBBLaser.ParamValues[9].AsString, //Tipo de Fonte Instrução 4
                                   GetMensagensCnab(0 + ifatorMsg,60),
                                   GetMensagensCnab(1 + ifatorMsg,60),
                                   GetMensagensCnab(2 + ifatorMsg,60),
                                   GetMensagensCnab(3 + ifatorMsg,60),
                                   Spc(4))); //Reservado para o Banco
     Inc(_iNumSeq);
  End;
end;

{procedure TDtmCobranca.BbLaserDet03(ifatorMsg :Integer);
begin
  //Mensagens Fixas para o verso da via do recibo do sacado
  //Até 7 registros, 21 mensagens com 80 caracteres
  If (Trim(fMensagensCnab[0 + ifatorMsg]) <> '') Then
     With Biblioteca Do
     Begin
       WriteLn(ArquivoRemessa,Concat('03', //Código Do Registro
                                     CprBBLaser.ParamValues[10].AsString, //Tipo de Fonte Instrução 1
                                     CprBBLaser.ParamValues[10].AsString, //Tipo de Fonte Instrução 2
                                     CprBBLaser.ParamValues[10].AsString, //Tipo de Fonte Instrução 3
                                     GetMensagensCnab(0 + ifatorMsg,80),
                                     GetMensagensCnab(1 + ifatorMsg,80),
                                     GetMensagensCnab(2 + ifatorMsg,80),
                                     Spc(5))); //Reservado para o Banco
       Inc(_iNumSeq);
     End;
end;}

{procedure TDtmCobranca.BbLaserDet04(ifatorMsg :Integer);
begin
  //Mensagens Específicas do título para o verso do recibo do sacado
  //Até 7 registros, 21 mensagens com 80 caracteres
  If (Trim(fMensagensCnab[0 + ifatorMsg]) <> '') Then
     With Biblioteca Do
     Begin
       WriteLn(ArquivoRemessa,Concat('04', //Código Do Registro
                                     CprBBLaser.ParamValues[11].AsString, //Tipo de Fonte Instrução 1
                                     CprBBLaser.ParamValues[11].AsString, //Tipo de Fonte Instrução 2
                                     CprBBLaser.ParamValues[11].AsString, //Tipo de Fonte Instrução 3
                                     GetMensagensCnab(0 + ifatorMsg,80),
                                     GetMensagensCnab(1 + ifatorMsg,80),
                                     GetMensagensCnab(2 + ifatorMsg,80),
                                     Spc(5))); //Reservado para o Banco
       Inc(_iNumSeq);
     End;
end;}

procedure TDtmIntBancoMT.BbLaserDet05(ifatorMsg :Integer);
begin
  //Instruçòes de cobrança específicas do título para a ficha de compensação
  //Até 2 registros, 8 mensagens com 60 caracteres
  If (Trim(fMensagensCnab[0 + ifatorMsg]) <> '') Then
  Begin
    WriteLn(ArquivoRemessa,Concat('05', //Código Do Registro
                                  CprBBLaser.ParamValues[12].AsString, //Tipo de Fonte Instrução 1
                                  CprBBLaser.ParamValues[12].AsString, //Tipo de Fonte Instrução 2
                                  CprBBLaser.ParamValues[12].AsString, //Tipo de Fonte Instrução 3
                                  CprBBLaser.ParamValues[12].AsString, //Tipo de Fonte Instrução 4
                                  GetMensagensCnab(0 + ifatorMsg,60),
                                  GetMensagensCnab(1 + ifatorMsg,60),
                                  GetMensagensCnab(2 + ifatorMsg,60),
                                  GetMensagensCnab(3 + ifatorMsg,60),
                                  Spc(4))); //Reservado para o Banco
    Inc(_iNumSeq);
  End;
end;

procedure TDtmIntBancoMT.BbLaserDet10;
Var
 sDataVencto :String;
begin
  //Dados do título

 With IntBancoManager Do
 Begin
   If Trim(CprBBLaser.ParamValues[8].AsString) = '' Then
      sDataVencto := RemoveBarras(CdsTexto.FieldByName('DATAVENCTO').AsString) //data venciento
   Else
      sDataVencto := CprBBLaser.ParamValues[8].AsString;

   WriteLn(ArquivoRemessa,Concat('10', //Código do Banco
                                 _TipoInsc, //Cod Inscrição do Sacado
                                 ZD(CdsTexto.FieldByName('NUMDOCUMENTO').AsString,15), //numero de inscricao
                                 AE(CdsTexto.FieldByName('NOME').AsString,60), //Nome do Sacado
                                 AE(Copy(CdsTexto.FieldByName('LOGRADOURO').AsString + ' ' +
                                         CdsTexto.FieldByName('NUMERO').AsString + ' ' +
                                         CdsTexto.FieldByName('COMPLEMENTO').AsString,1,60),60), //Endereço do Sacado
                                 ZE(CdsTexto.FieldByName('CEP').AsString,8), //Cep Sacado
                                 AE(CdsTexto.FieldByName('CIDADE').AsString,18), //Praça do Sacado
                                 AE(CdsTexto.FieldByName('CODESTADO').AsString,2), // UF
                                 RemoveBarras(DateToStr(Date)), //Data de emissão do arquivo
                                 sDataVencto, //Data de Vencimento
                                 CprBBLaser.ParamValues[3].AsString, //Aceite
                                 CprBBLaser.ParamValues[5].AsString, //Espécie
                                 FloatToStr(_NossoNumero) + IntToStr(CalculaDac11(FloatToStr(_NossoNumero))), //Nosso Número + Dv 12 posições
                                 AE(CdsTexto.FieldByName('NODOCUMENTO').AsString,15), //Número do Documento'
                                 CprBBLaser.ParamValues[6].AsString,
                                 ZD(RemoveVirgulas(CdsTexto.FieldByName('VALOROM').AsFloat,5),15), //Valor Outra Moeda
                                 ZD(RemoveVirgulas(CdsTexto.FieldByName('VALOR').AsFloat,2),15), //Valor Outra Moeda
                                 '00', // Prazo
                                 spc(6), //Brancos
                                 '00'));

   Inc(_iNumSeq);
 End;
end;

procedure TDtmIntBancoMT.BbLaserTrailer99;
begin
  WriteLn(ArquivoRemessa,Concat('99', //Código do Registro
                                Zd(IntToStr(_iNumSeq),15), //Quantidade de Registros
                                Spc(233))); //Zeros
end;

function TDtmIntBancoMT.GetMensagensCnab(indice, itam: Integer): String;
begin
  If (indice > 8) Or (Trim(fMensagensCnab[indice]) = '') Then
     Result := Spc(iTam)
  Else
     Result := Ae(fMensagensCnab[indice],ITam);
end;

end.



