{-------------------------------------------------------------------------------
--------------------------------- ALTERA«√O ------------------------------------
Atender   : WO18638
Data      : 17/02/2025
Autor     : Paulo Nobre
DescriÁ„o : CorreÁ„o do FatorVencimento, que a partir de 22/02/2025 dever· ser
            abatido em 1000 dias por conta do Codigo n„o exceder 9999.
--------------------------------------------------------------------------------
 N. Chamado....: MIGRACAO-ORACLE
 Dt AlteraÁ„o..: 21/10/2025
 Respons·vel...: Edilaine
 DescriÁ„o.....: colocado CAST nas consultas para defdinir o tamanho do campo NSA
--------------------------------------------------------------------------------
Atender   : WO16145
Data      : 19/12/2024
Autor     : Arnaldo V. Scarin
DescriÁ„o : CorreÁ„o do FatorVencimento, que a partir de 22/02/2025 ser· reiniciado
            em 1000, por conta do Codigo exceder 9999
--------------------------------------------------------------------------------
 N. SIG      : 116936
 Respons·vel : Everson Cunha
 Data        : 23/06/2021
 DescriÁ„o   : Inclus„o da tabela CORE_CADASTRO.CONTA_BANCARIA_DEBITO_AUTO
               para vinculaÁ„o do ID_CLIENTE_CAIXA na geraÁ„o do arquivo dÈbito
--------------------------------------------------------------------------------
 PendÍncia   : SIG 114623
 Respons·vel : Ewerton Beltramini
 Data        : 29/01/2021
 DescriÁ„o   : ImplementaÁ„o do comando Copy, para igualar as bases de produÁ„o
--------------------------------------------------------------------------------
 N. SIG.............: 115364
 Data da AlteraÁ„o..: 15/04/2021
 Respons·vel........: Everson Cunha
 DescriÁ„o..........: Inclus„o do novo portador forma de contribuiÁ„o (295)
--------------------------------------------------------------------------------
 N. SIG.............: 113888
 Data da AlteraÁ„o..: 26/02/2021
 Respons·vel........: Everson Cunha
 DescriÁ„o..........: Arredondamento do valor total no footer do arquivo SIACC
--------------------------------------------------------------------------------
 N. SIG.............: 112949
 Data da AlteraÁ„o..: 22/01/2021
 Respons·vel........: Everson Cunha
 DescriÁ„o..........: MudanÁa no formato de geraÁ„o do ID_CLIENTE_CAIXA - SIACC
--------------------------------------------------------------------------------
 N. SIG.............: 112672
 Data da AlteraÁ„o..: 20/01/2021
 Respons·vel........: Everson Cunha
 DescriÁ„o..........: Duplicidade no registro quando o participante possui
                      mais de uma conta banc·ria cadastrada como preferencial
--------------------------------------------------------------------------------
 N. SIG.............: 111426
 Data da AlteraÁ„o..: 01/12/2020
 Respons·vel........: Everson Cunha
 DescriÁ„o..........: Melhoria no formato do Cancelamento
--------------------------------------------------------------------------------
 N. SIG.............: 104134
 Data da AlteraÁ„o..: 17/11/2020
 Respons·vel........: Everson Cunha
 DescriÁ„o..........: Melhoria performance SIACC
--------------------------------------------------------------------------------
 N. SIG.............: 103935
 Data da AlteraÁ„o..: 09/11/2020
 Respons·vel........: Everson Cunha
 DescriÁ„o..........: Melhorias/Ajustes SIACC
--------------------------------------------------------------------------------
 N. SIG.............: 103725
 Data da AlteraÁ„o..: 30/10/2020
 Respons·vel........: Everson Cunha
 DescriÁ„o..........: Melhorias/Ajustes SIACC
--------------------------------------------------------------------------------
 N. SIG.............: 103661
 Data da AlteraÁ„o..: 28/10/2020
 Respons·vel........: Everson Cunha
 DescriÁ„o..........: Inclus„o do NUMEMPRESABANCO
--------------------------------------------------------------------------------
 Rotina.............: _SelecionaMovArqDetalhe, _SelecionaDadosMovimento
 N. SIG.............: 102320
 Data da AlteraÁ„o..: 30/09/2020
 Respons·vel........: C·ssio Florencio Rovaroto
 DescriÁ„o..........: AtualizaÁ„o de execuÁ„o da rotina de arquivo de dÈbito.
--------------------------------------------------------------------------------
 Rotina.............: _SelecionaDadosCabecArq, _SelecionaDadosMovimento
 N. SIG.............: 94625
 Data da AlteraÁ„o..: 20/12/2019
 Respons·vel........: C·ssio Florencio Rovaroto
 DescriÁ„o..........: AdequaÁıes a geraÁ„o do arquivo SIACC 150 para dÈbito
                      autom·tico.
--------------------------------------------------------------------------------
 N. SIG.............: 63651
 Data da AlteraÁ„o..: 12/11/2019
 Respons·vel........: C·ssio Florencio Rovaroto
 DescriÁ„o..........: CriaÁ„o da funcionalidade de Remessa EletrÙnica a dÈbito.
--------------------------------------------------------------------------------}

Unit uCtrlRemessaEletronicaDeb;

Interface

Uses Classes, Db, DbClient, SysUtils, contnrs, controls, adodb,
  UDiasUteis, umenserro, uSistema, uCmControlObject, uCmMath,
  uCmDbObject, uDataBase, uCMTypes, DBaseDados, Dialogs, Forms,
  comCtrls, dbTables, Wwquery, uCmSqlParams, math, CMwwQuery, FProgresso,
  FProgressoDuplo, Gauges, Shellapi, filectrl, ucmFileUtils, uFuncoesUteisIR,
  Windows, UCripto;

// Chaves de encriptaÁ„o
Const StKey = 7848567;
Const MtKey = 1741378;
Const AdKey = 6574985;

const fUser = '±'#5'≠ç'#$D'TZ!,|'#$1F'jº'#$15'rÙVÅ‡9'; //Login de acesso ao servidor, criptografado.
const fPw   = '„që∫%⁄ØÙ'; //Senha do login de acesso ao servidor, criptografado.

Type

  // Objeto tipo Record contendo dados de parametrizaÁ„o do ConvÍnio
  TDadosParamConv = Record
    sNumBanco: String;
    sNomeBanco: String;
    dVlrObrigaCpfCnpj: Double;
    sParamTrans: String;
    sAmbiente: String;
    sVerLeiauteArq: String;
    sVerLeiauteLote: String;
    sDensidade: String;
    sTipoOper: String;
    sCodCompromisso: String;
    sTipoServico: String;
    sTipoServicoK: String;
    sTipoCompromisso: String;
    sTipoCompromissoK: String;
    sFinalidadeDOC: String;
  End;

  TCtrlRemessaEletronicaDeb = Class(tCmControlObject)
  Private
    iAno, iMes, iDia: Word;

    iEmpresa: Integer;
    sPathArquivo: String;

    CdsAux1: TClientDataSet;
    cdsGeraCabecRodapeArq: TClientDataSet;
    cdsGeraCabecRodapeLote: TClientDataSet;
    cdsGeraMovLote: TClientDataSet;
    cdsConvenioParam: TClientDataSet;

    qryAux1: TwwQuery;
    sqlText: TStringList;
    ArquivoEnvioCEF: TextFile;
    //C·ssio Rovaroto - SIG n∫ 67165
    function RemoveCaracterEspecial(pTexto: String; pRemoveExtra: boolean): String;
  Public
    // Objeto tipo Record contendo dados de parametrizaÁ„o do ConvÍnio
    rDadosParamConv: TDadosParamConv;

    Constructor Create; Override;
    Destructor Destroy; Override;

    // FunÁıes B·sicas de Apoio
    Procedure _AtualizaFrmProgresso(Var iContador: integer);
    Function _PrepararFloat(sString: String): String;
    Function _ConverteListas(Const pListaPessoas: TStringList): String;
    Function _TiraMascara(wTexto: String): String;
    Function _TrocaTexto(sString: String; sOld: String; sNew: String; bInsensitive: boolean = true): String;
    Function _ExtrairDataVencimentoCodigoDeBarra(Const sCodigoBarras: String): TDateTime;
    Function _ExtrairValorCodigoDeBarra(Const sCodigoBarras: String): Currency;
    Function _ValidaCodBarrasFichaComp(sCodBarras: String; idv: Integer): Boolean;
    Function _ValidaCodBarrasArrecadacao(sCodBarras: String): Boolean;
    Function _CompletaEspacoDir(sNome: String; iTam: integer): String;
    Function _CompletaZeroEsq(sNome: String; iTam: integer): String;
    Function _ValidaCPF(sDocum: String): Boolean;
    Function _ValidaCNPJ(sDocum: String): Boolean;
    Function _SomaDig(sDocum: String; iTotDig, iPot: integer): integer;
    Function _EncryptSTR(Const InString: String; StartKey, MultKey, AddKey: Integer): String;
    Function _DecryptSTR(Const InString: String; StartKey, MultKey, AddKey: Integer): String;
    Function _CriptoDecripto(sAcao, sString: String): String;
    //
    Function _ListaConvenios: OleVariant;
    Function _ListaFormaRecebimentos: OleVariant;
    Function _ListaFormaRecebimentosGeral: OleVariant;
    Function _SelecionaMovimentoRemessa(pConvenio, pFormaPagto: String; pDataIni, pDataFim: TDateTime): OleVariant;
    function _SelecionaMovimentoRemessaDebito(pConvenio, pFormaPagto: String; pDataIni, pDataFim: TDateTime): OleVariant;
    Function _SelecionaMovArquivo(pConvenio, pFlgEnviado: String): OleVariant;
    Function _SelecionaMovArqDetalhe(pCodPortForma: integer): String;
    Procedure _GravaLinha(sArquivo, sLinha: String);
    Procedure _GeraArquivoDeRemessa(pNomeCompletoArquivoRemessa, pIdArqPagto, pCodPortForma, pNSA, pTipoDeb: String);
    Function _CriaArquivo(sArquivo: String): Boolean;
    Function _SelecionaDadosCabecArq(pCodPortForma, pNSA: String): Olevariant;
    Function _SelecionaDadosRodapeArq(pVlrTotalLote, pQtdRegsArq, pNSR: String): Olevariant;
    function _SelecionaDadosMovimento(pIdArqPagto: string; pCodPortForma: integer; pTipoDeb: string): OleVariant;
    function Impersonate: Boolean;
    function _GetArquivoRetorno(pCodPortForma: string; sNomeArquivo: string = ''): OleVariant;
  Protected
    Procedure DoChangeDataBase; Override;
  End;

Implementation

{ TCtrlRemessaEletronicaDeb }

Procedure TCtrlRemessaEletronicaDeb.DoChangeDataBase;
Begin
  Inherited;
End;

Constructor TCtrlRemessaEletronicaDeb.Create;
Begin
  Inherited;
  CdsAux1 := TClientDataSet.Create(Nil);
  cdsGeraCabecRodapeArq := TClientDataSet.Create(Nil);
  cdsGeraCabecRodapeLote := TClientDataSet.Create(Nil);
  cdsGeraMovLote := TClientDataSet.Create(Nil);
  cdsConvenioParam := TClientDataSet.Create(Nil);

  qryAux1 := TwwQuery.Create(Nil);
  qryAux1.DatabaseName := 'BaseDados';

  sqlText := TStringList.create;

  iEmpresa := Sistema.IdEmpresa;
  sPathArquivo := Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa) + '\LogRemessaEletro';
End;

Destructor TCtrlRemessaEletronicaDeb.Destroy;
Begin
  Inherited;
  CdsAux1.Close;
  qryAux1.Close;

  FreeAndNil(CdsAux1);
  FreeAndNil(cdsGeraCabecRodapeArq);
  FreeAndNil(cdsGeraCabecRodapeLote);
  FreeAndNil(cdsGeraMovLote);
  FreeAndNil(cdsConvenioParam);
  FreeAndNil(qryAux1);
  FreeAndNil(sqlText);
End;

//////////////////////////////// INÕCIO FUN«’ES B¡SICAS /////////////////////////////////

Function TCtrlRemessaEletronicaDeb._ValidaCPF(sDocum: String): boolean;
Var idvo1, idvo2, idv1, idv2, iSoma, iResto: integer;
Begin
  If length(sDocum) <> 11 Then
    Result := false
  Else
    Begin
      If strtoFloat(sDocum) = 0 Then
        Result := false
      Else
        Begin
          idvo1 := StrToInt(sDocum[10]);
          idvo2 := StrToInt(sDocum[11]);

          //Calcula o digito verificador 1
          iSoma := _SomaDig(sDocum, 9, 10);
          iResto := iSoma Mod 11;
          If (iResto <= 1) Then
            idv1 := 0
          Else
            idv1 := 11 - iResto;

          //Calcula o digito verificador 2
          iSoma := _SomaDig(sDocum, 9, 11);
          iSoma := iSoma + (idv1 * 2);

          iResto := iSoma Mod 11;
          If (iResto <= 1) Then
            idv2 := 0
          Else
            idv2 := 11 - iResto;

          Result := ((idv1 = idvo1) And (idv2 = idvo2));
        End;
    End;
End;

Function TCtrlRemessaEletronicaDeb._ValidaCNPJ(sDocum: String): boolean;
Var iSoma, idvo1, idvo2, idv1, idv2, iResto: integer;
Begin
  If length(sDocum) <> 14 Then
    Result := false
  Else
    Begin
      If strtoFloat(sDocum) = 0 Then
        Result := false
      Else
        Begin
          idvo1 := StrToInt(sDocum[13]);
          idvo2 := StrToInt(sDocum[14]);

          //Calcula o digito verificador 1
          iSoma := _SomaDig(sDocum, 12, 5);
          iResto := iSoma Mod 11;
          If (iResto <= 1) Then
            idv1 := 0
          Else
            idv1 := 11 - iResto;

          // Calcula o digito verificador 2
          iSoma := _SomaDig(sDocum, 12, 6);
          iSoma := iSoma + (idv1 * 2);

          iResto := iSoma Mod 11;
          If (iResto <= 1) Then
            idv2 := 0
          Else
            idv2 := 11 - iResto;

          Result := ((idv1 = idvo1) And (idv2 = idvo2));
        End;
    End;
End;

Function TCtrlRemessaEletronicaDeb._SomaDig(sDocum: String; iTotDig, iPot: integer): integer;
Var i: integer;
Begin
  Result := 0;
  For i := 1 To iTotDig Do
    Begin
      Result := Result + (StrToInt(sDocum[i]) * iPot);
      Dec(iPot);
      If iPot = 1 Then
        iPot := 9;
    End;
End;

Function TCtrlRemessaEletronicaDeb._PrepararFloat(sString: String): String;
Begin
  Result := sString;
  Result := _TrocaTexto(Result, '.', DecimalSeparator);
  Result := _TrocaTexto(Result, ',', DecimalSeparator);
End;

Function TCtrlRemessaEletronicaDeb._ConverteListas(Const pListaPessoas: TStringList): String;
Var I: Integer;
Begin
  For i := 0 To pListaPessoas.Count - 1 Do
    result := result + quotedstr(pListaPessoas[i]) + ',';

  Result := Copy(Result, 1, Length(Result) - 1);
End;

Function TCtrlRemessaEletronicaDeb._TiraMascara(wTexto: String): String;
Var wCon, wCC: Integer;
  wRet, wParte: String;
Begin
  wRet := '';
  wCC := Length(wTexto);
  For wCon := 1 To wCC Do
    Begin
      wParte := copy(wTexto, wCon, 1);
      If (wParte <> '-') And
        (wParte <> '/') And
        (wParte <> '.') And
        (wParte <> '"') And
        (wParte <> '*') Then
        wRet := wRet + wParte;
    End;
  _TiraMascara := wRet;
End;

Function TCtrlRemessaEletronicaDeb._TrocaTexto(sString: String; sOld: String; sNew: String; bInsensitive: boolean = true): String;
Var
  iPosition: integer;
  sTemp: String;
Begin
  iPosition := 1;
  sTemp := '';
  While (iPosition > 0) Do
    Begin
      If bInsensitive Then
        iPosition := AnsiPos(UpperCase(sOld), UpperCase(sString))
      Else
        iPosition := AnsiPos(sOld, sString);
      If (iPosition > 0) Then
        Begin
          sTemp := sTemp + copy(sString, 1, iPosition - 1) + sNew;
          sString := copy(sString, iPosition + Length(sOld), Length(sString));
        End;
    End;
  sTemp := sTemp + sString;
  Result := (sTemp);
End;

Procedure TCtrlRemessaEletronicaDeb._AtualizaFrmProgresso(Var iContador: Integer);
Begin
  inc(iContador);
  frmProgresso.AndaFormProgresso(iContador);
  Application.ProcessMessages;
End;

Function TCtrlRemessaEletronicaDeb._ExtrairDataVencimentoCodigoDeBarra(Const sCodigoBarras: String): TDateTime;
var FatorVencimento : integer;
    sDataInicioFatorVencimento : String;
Begin
  If length(sCodigoBarras) = 47 Then // Boletos de TÌtulos comuns
  begin
    // '07/10/1997' - Data padr„o de inicio da contagem do vencimento definida pela FEBRABAN
    // Result := StrToDate('07/10/1997') + StrToInt(Copy(sCodigoBarras, 34, 4));

    // WO16145 - Inicio
    // Alterado por Arnaldo V. Scarin em 19/12/2024
    // A partir de 22/02/2025, o FatorVencimento do CÛdigo de Barras ser· ressetado
    // para 1000, pois esse valor n„o poder· passar de 9999.
    // Por conta disso, a rotina abaixo verifica se o FatorVencimento È menor que
    // 8852 (Data: 31/12/2022), e se for, ao invÈs de utilizar a data inicial do
    // FatorVencimento, que È 07/10/1997, passar· a utilizar a data de 22/05/2025,
    // fazendo com que a data de vencimento seja recuperada corretamente do
    // cÛdigo de barras.

    FatorVencimento := StrToInt(Copy(sCodigoBarras, 34, 4));
    sDataInicioFatorVencimento := '07/10/1997';

    If FatorVencimento < 8852 then // 8852 + '07/10/1997' -> 31/12/2022
    begin
      sDataInicioFatorVencimento := '22/02/2025';
      FatorVencimento := FatorVencimento - 1000;    // Paulo Nobre - WO18638
    end;

    Result := StrToDate(sDataInicioFatorVencimento) + StrToInt(Copy(sCodigoBarras, 34, 4));
    // WO16145 - Fim
  end;
End;

Function TCtrlRemessaEletronicaDeb._ExtrairValorCodigoDeBarra(Const sCodigoBarras: String): Currency;
Begin
  If length(sCodigoBarras) = 47 Then // Boletos de TÌtulos comuns
    Result := StrToCurr(Copy(sCodigoBarras, 38, 10)) / 100
  Else If length(sCodigoBarras) = 48 Then // Boletos de Tributos e ArrecadaÁıes
    Result := StrToCurr(Copy(sCodigoBarras, 5, 7) + Copy(sCodigoBarras, 13, 4)) / 100
End;

Function TCtrlRemessaEletronicaDeb._ValidaCodBarrasFichaComp(sCodBarras: String; idv: Integer): Boolean;
Var sTipoCodigo, sAuxCodBarras, sProd: String;
  X, iBase, iDividendo, iDigito, I, Z, isprod: Integer;
  iCdigito: Array[0..3] Of Integer;
Begin
  Result := False;
  sTipoCodigo := '';
  Case idv Of
    10: //ComposiÁ„o da represantaÁ„o numÈrica do cÛdigo de barras - parte superior da ficha de compensaÁ„o
      Begin
        sTipoCodigo := 'Superior';
        //C·lculo do DV MÛdulo 10 base 2
        If Length(sCodBarras) >= 33 Then
          Begin
            //C·lculo do DV do Campo 1
            iBase := 2;
            iDividendo := 0;
            I := 9;
            sAuxCodBarras := Copy(sCodBarras, 1, 9);
            For X := 1 To 9 Do
              Begin
                isprod := 0;

                sProd := IntToStr(StrToInt(sAuxCodBarras[I]) * iBase);

                For Z := 1 To Length(sProd) Do
                  isprod := isprod + StrToInt(sProd[Z]);

                iDividendo := iDividendo + isprod;
                If iBase = 2 Then
                  iBase := 1
                Else
                  Inc(iBase);
                dec(I)
              End;
            iCdigito[0] := 10 - (iDividendo Mod 10);

            //C·lculo do DV do Campo 2
            iBase := 2;
            iDividendo := 0;
            I := 10;
            sAuxCodBarras := Copy(sCodBarras, 11, 10);
            For X := 1 To 10 Do
              Begin
                isprod := 0;

                sProd := IntToStr(StrToInt(sAuxCodBarras[I]) * iBase);

                For Z := 1 To Length(sProd) Do
                  isprod := isprod + StrToInt(sProd[Z]);

                iDividendo := iDividendo + isprod;
                If iBase = 2 Then
                  iBase := 1
                Else
                  Inc(iBase);
                dec(I)
              End;
            iCdigito[1] := 10 - (iDividendo Mod 10);

            //C·lculo do DV do Campo 3
            iBase := 2;
            iDividendo := 0;
            I := 10;
            sAuxCodBarras := Copy(sCodBarras, 22, 10);
            For X := 1 To 10 Do
              Begin
                isprod := 0;

                sProd := IntToStr(StrToInt(sAuxCodBarras[I]) * iBase);

                For Z := 1 To Length(sProd) Do
                  isprod := isprod + StrToInt(sProd[Z]);

                iDividendo := iDividendo + isprod;
                If iBase = 2 Then
                  iBase := 1
                Else
                  Inc(iBase);
                dec(I)
              End;
            iCdigito[2] := 10 - (iDividendo Mod 10);

            //-------------------------------------------------------

            For X := 0 To 2 Do
              If iCdigito[X] = 10 Then
                iCdigito[X] := 0;

            Result := ((iCdigito[0] = StrToInt(sCodBarras[10])) And
              (iCdigito[1] = StrToInt(sCodBarras[21])) And
              (iCdigito[2] = StrToInt(sCodBarras[32])));
          End;
      End;

    11: //ComposiÁ„o do cÛdigo de barras - parte inferior da ficha de compensaÁ„o
      Begin
        sTipoCodigo := 'Inferior';
        //C·lculo do DV MÛdulo 11 base 9
        If Length(sCodBarras) >= 40 Then
          Begin
            iBase := 2;
            iDividendo := 0;
            sAuxCodBarras := Copy(sCodBarras, 1, 4) + Copy(sCodBarras, 6, 39);
            For X := 1 To 43 Do
              Begin
                iDividendo := iDividendo + (StrToInt(sAuxCodBarras[44 - X]) * iBase);
                If iBase = 9 Then
                  iBase := 2
                Else
                  Inc(iBase);
              End;
            iDigito := 11 - (iDividendo Mod 11);

            If iDigito In [10, 11] Then
              iDigito := 1;

            Result := (iDigito = StrToInt(sCodBarras[5]));
          End;
      End;
  End;
End;

Function TCtrlRemessaEletronicaDeb._ValidaCodBarrasArrecadacao(sCodBarras: String): Boolean;
Var iBlocoDigitos: Array[1..48] Of integer;
  iSomatorio: Array[1..48] Of integer;
  i, p, peso, resto: integer;
  dv1, dv2, dv3, dv4: integer;
Begin
  resto := 0;
  dv1 := 0;
  dv2 := 0;
  dv3 := 0;
  dv4 := 0;
  result := false;
  For i := 1 To 48 Do
    iSomatorio[i] := 0;

  // varre a string e pega cada dÌgito do cÛdigo de barras
  p := 1;
  For i := 1 To length(sCodBarras) Do
    Begin
      If (sCodBarras[i] >= '0') And (sCodBarras[i] <= '9') Then
        Begin
          iBlocoDigitos[p] := strToInt(sCodBarras[i]);
          p := p + 1;
        End
    End;

  peso := 2;
  For i := 1 To 48 Do
    Begin
      If Not (i In [12, 24, 36, 48]) Then // posiÁıes dos dÌgitos no array
        Begin
          iSomatorio[i] := (iBlocoDigitos[i] * peso);
          If iSomatorio[i] > 9 Then
            iSomatorio[i] := iSomatorio[i] - 9;
          If peso = 2 Then
            peso := 1
          Else
            peso := 2;
        End
      Else
        peso := 2;
    End;

  // c·lculo do dv1
  resto := 0;
  For i := 1 To 11 Do
    dv1 := dv1 + iSomatorio[i];
  If dv1 > 10 Then
    resto := dv1 Mod 10
  Else
    resto := dv1;
  If resto = 0 Then
    dv1 := 0
  Else
    dv1 := 10 - resto;

  // c·lculo do dv2
  resto := 0;
  For i := 13 To 23 Do
    dv2 := dv2 + iSomatorio[i];
  If dv2 > 10 Then
    resto := dv2 Mod 10
  Else
    resto := dv2;
  If resto = 0 Then
    dv2 := 0
  Else
    dv2 := 10 - resto;

  // c·lculo do dv3
  resto := 0;
  For i := 25 To 35 Do
    dv3 := dv3 + iSomatorio[i];
  If dv3 > 10 Then
    resto := dv3 Mod 10
  Else
    resto := dv3;
  If resto = 0 Then
    dv3 := 0
  Else
    dv3 := 10 - resto;

  // c·lculo do dv4
  resto := 0;
  For i := 37 To 47 Do
    dv4 := dv4 + iSomatorio[i];
  If dv4 > 10 Then
    resto := dv4 Mod 10
  Else
    resto := dv4;
  If resto = 0 Then
    dv4 := 0
  Else
    dv4 := 10 - resto;

  result := (dv1 = iBlocoDigitos[12]) And (dv2 = iBlocoDigitos[24]) And
    (dv3 = iBlocoDigitos[36]) And (dv4 = iBlocoDigitos[48]);
End;

Function TCtrlRemessaEletronicaDeb._CriaArquivo(sArquivo: String): Boolean;
Begin
  Result := False;
  Try
    //C·ssio Rovaroto - SIG n∫ 73883 - InÌcio
    //if Impersonate then //Everson Cunha - SIG104134
    //begin               //Everson Cunha - SIG104134
      AssignFile(ArquivoEnvioCEF, sArquivo);
      Rewrite(ArquivoEnvioCEF);
      CloseFile(ArquivoEnvioCEF);
      Result := True;
    //  RevertToSelf;   //Everson Cunha - SIG104134
    //end;              //Everson Cunha - SIG104134
    //C·ssio Rovaroto - SIG n∫ 73883 - Fim
  Except
    Result := False;
  End;
End;

Procedure TCtrlRemessaEletronicaDeb._GravaLinha(sArquivo, sLinha: String);
Begin
  If sLinha <> '' Then
    Begin
      //C·ssio Rovaroto - SIG n∫ 73883 - InÌcio
      //if Impersonate then  //Everson Cunha - SIG104134
      //begin                //Everson Cunha - SIG104134
        AssignFile(ArquivoEnvioCEF, sArquivo);
        Append(ArquivoEnvioCEF);
        Write(ArquivoEnvioCEF, sLinha);
        WriteLn(ArquivoEnvioCEF);
        CloseFile(ArquivoEnvioCEF);
      //  RevertToSelf;      //Everson Cunha - SIG104134
      //end;                 //Everson Cunha - SIG104134
      //C·ssio Rovaroto - SIG n∫ 73883 - Fim 
    End;
End;

Function TCtrlRemessaEletronicaDeb._CompletaEspacoDir(sNome: String; iTam: integer): String;
Var i, k: integer;
  Espacos: String;
Begin
  If Length(sNome) > iTam Then
    sNome := Copy(sNome, 1, iTam);

  sNome := trim(sNome);
  i := length(sNome);
  Espacos := '';
  For k := 1 To (iTam - i) Do
    Espacos := Espacos + ' ';

  Result := sNome + Espacos;
End;

Function TCtrlRemessaEletronicaDeb._CompletaZeroEsq(sNome: String; iTam: integer): String;
Var i, k: integer;
Begin
  If Length(sNome) > iTam Then
    sNome := Copy(sNome, 1, iTam);

  sNome := trim(sNome);
  i := length(sNome);
  Result := '';
  For k := 1 To (iTam - i) Do
    Result := Result + '0';
  Result := Result + sNome;
End;

// ************************ Funcıes EncriptaÁ„o/DesencriptaÁ„o **********************
// PARA ENCRIPTAR
//
{$R-}{$Q-}
// Habilita/Desabilita a geraÁ„o de checagem de cÛdigo de Faixa e
// de checagem de cÛdigo exceÁ„o de overflow
//

Function TCtrlRemessaEletronicaDeb._EncryptSTR(Const InString: String; StartKey, MultKey, AddKey: Integer): String;
Var I: Byte;
Begin
  Result := '';
  For I := 1 To Length(InString) Do
    Begin
      Result := Result + Char(Byte(InString[I]) Xor (StartKey Shr 8));
      StartKey := (Byte(Result[I]) + StartKey) * MultKey + AddKey;
    End;
End;

// PARA DESENCRIPTAR
//

Function TCtrlRemessaEletronicaDeb._DecryptSTR(Const InString: String; StartKey, MultKey, AddKey: Integer): String;
Var I: Byte;
Begin
  Result := '';
  For I := 1 To Length(InString) Do
    Begin
      Result := Result + Char(Byte(InString[I]) Xor (StartKey Shr 8));
      StartKey := (Byte(InString[I]) + StartKey) * MultKey + AddKey;
    End;
End;
{$R+}{$Q+}
// ************************ Funcıes EncriptaÁ„o/DesencriptaÁ„o **********************

Function TCtrlRemessaEletronicaDeb._CriptoDecripto(sAcao, sString: String): String;
Label Fim;
Var KeyLen: Integer;
  KeyPos: Integer;
  OffSet: Integer;
  Dest, Key: String;
  SrcPos: Integer;
  SrcAsc: Integer;
  TmpSrcAsc: Integer;
  Range: Integer;
Begin
  If (sString = '') Then
    Result := ''
  Else
    Begin
      Key := 'YUQL23KL23DF90WI5E1JAS467NMCXXL6JAOAUWWMCL0AOMM4A4VZYW9KHJUI2347EJHJKDF3424SKL K3LAKDJSL9RTIKJ';
      Dest := '';
      KeyLen := Length(Key);
      KeyPos := 0;
      SrcPos := 0;
      SrcAsc := 0;
      Range := 256;
      If (sAcao = UpperCase('C')) Then // Criptografa
        Begin
          Randomize;
          OffSet := Random(Range);
          Dest := Format('%1.2x', [OffSet]);
          For SrcPos := 1 To Length(sString) Do
            Begin
              Application.ProcessMessages;
              SrcAsc := (Ord(sString[SrcPos]) + OffSet) Mod 255;
              If KeyPos < KeyLen Then
                KeyPos := KeyPos + 1
              Else
                KeyPos := 1;
              SrcAsc := SrcAsc Xor Ord(Key[KeyPos]);
              Dest := Dest + Format('%1.2x', [SrcAsc]);
              OffSet := SrcAsc;
            End;
        End
      Else If (sAcao = UpperCase('D')) Then // Descriptografa
        Begin
          OffSet := StrToInt('$' + copy(sString, 1, 2));
          SrcPos := 3;
          Repeat
            SrcAsc := StrToInt('$' + copy(sString, SrcPos, 2));
            If (KeyPos < KeyLen) Then
              KeyPos := KeyPos + 1
            Else
              KeyPos := 1;
            TmpSrcAsc := SrcAsc Xor Ord(Key[KeyPos]);
            If TmpSrcAsc <= OffSet Then
              TmpSrcAsc := 255 + TmpSrcAsc - OffSet
            Else
              TmpSrcAsc := TmpSrcAsc - OffSet;
            Dest := Dest + Chr(TmpSrcAsc);
            OffSet := SrcAsc;
            SrcPos := SrcPos + 2;
          Until (SrcPos >= Length(sString));
        End;
      Result := Dest;
    End;
End;

//////////////////////////////// FIM FUN«’ES B¡SICAS /////////////////////////////////

Function TCtrlRemessaEletronicaDeb._ListaConvenios: OleVariant;
Var sSql: String;
Begin
  sSql :=
    'SELECT PF.CODPORTFORMA, PF.DESCRICAO, PF.PATHARQUIVOREM ' +
    '       , PF.NUMEMPRESABANCO                 ' + //Everson Cunha - SIG103661
    'FROM PORTADORFORMA PF                       ' +
    'WHERE PF.RECPAG = ''R''                     ' +
    '      AND PF.FLGARQUIVO = ''S''             ' +
    'ORDER BY PF.DESCRICAO';

  Result := GetDataPacket(sSql);
End;

Function TCtrlRemessaEletronicaDeb._ListaFormaRecebimentos: OleVariant;
Var sSql: String;
Begin
  sSql := 'SELECT 0 ORDEM, ''Todas as Formas de Recebimento'' AS DESCRICAO, -1 AS CODFORMA ' +
    'FROM DUAL                        ' +
    'UNION ALL                        ' +
    'SELECT 1 ORDEM, FO.DESCRICAO, FO.CODFORMA  ' +
    'FROM FORMARECPAG FO              ' +
    'WHERE FO.RECPAG = ''R''          ' +
    '      AND FO.FLGARQUIVO = ''S''  ' +
    'ORDER BY ORDEM, DESCRICAO        ';

  Result := GetDataPacket(sSql);
End;

Function TCtrlRemessaEletronicaDeb._ListaFormaRecebimentosGeral: OleVariant;
Var sSql: String;
Begin
  sSql := 'SELECT FO.DESCRICAO, FO.CODFORMA ' +
    'FROM FORMARECPAG FO                    ' +
    'WHERE FO.RECPAG = ''R''                ' +
    '      AND FO.FLGARQUIVO = ''S''        ' +
    'ORDER BY FO.DESCRICAO                  ';

  Result := GetDataPacket(sSql);
End;

Procedure TCtrlRemessaEletronicaDeb._GeraArquivoDeRemessa(pNomeCompletoArquivoRemessa, pIdArqPagto,
pCodPortForma, pNSA, pTipoDeb: String);
Var sLinha, sTipFormaRecPag, sFormaLanc, sVlrTotal: String;
  iQtdRegsArq, iContador1, iContador2, iNSR: Integer;
  dVlrTotal: Double;
Begin
  iQtdRegsArq := 0;
  iContador1 := 0;
  iContador2 := 0;
  sVlrTotal := EmptyStr;
  iNSR := 0;

  //
  // 1.0.Gerando Linha do CabeÁalho do Arquivo
  //
  cdsGeraCabecRodapeArq.data := _SelecionaDadosCabecArq(pCodPortForma, pNSA);
  sLinha := cdsGeraCabecRodapeArq.FieldByName('LINHACABECARQ').asString;
  _GravaLinha(pNomeCompletoArquivoRemessa, sLinha);

  //
  // 2.0.Gerando Linhas do Movimento
  //
  // Selecionado o movimento pendente detalhado com distinct que vai gerar um lote
  cdsGeraMovLote.Data := _SelecionaDadosMovimento(pIdArqPagto, StrToInt(pCodPortForma), pTipoDeb);

  Inc(iContador1);

  if not cdsGeraMovLote.IsEmpty then
  begin
    dVlrTotal := 0.00;
    frmProgressoDuplo.Caption := 'Processando a GeraÁ„o do Arquivo de Remessa';
    frmProgressoDuplo.MostraFormProgressoDuplo('Processando Arquivo... ', 'Gravando Linhas do Lote', 0, 0, 1, cdsGeraMovLote.RecordCount, False, True);
    Screen.Cursor := crSQLWait;
    iQtdRegsArq := cdsGeraMovLote.Recordcount + 2;
    cdsGeraMovLote.First;
    while not cdsGeraMovLote.Eof Do
    begin
      Inc(iContador2);
      // 2.2.Gravando a linha do lanÁamento
      sLinha := cdsGeraMovLote.FieldByName('DETALHE').asString;
      _GravaLinha(pNomeCompletoArquivoRemessa, RemoveCaracterEspecial(sLinha, True));

      //dVlrTotal := dVlrTotal + cdsGeraMovLote.FieldByName('VALOR').asFloat; //Everson Cunha - SIG112672

      iNsr := cdsGeraMovLote.FieldByName('NSR').AsInteger;
      cdsGeraMovLote.Next;                                
      frmProgressoDuplo.AndaFormProgressoDuplo(iContador1, iContador2);
    end;

    //dVlrTotal := cdsGeraMovLote.FieldByName('VLRTOTAL').asFloat;           //Everson Cunha - SIG112672 //Everson Cunha - SIG113888
    dVlrTotal := RoundCM(cdsGeraMovLote.FieldByName('VLRTOTAL').asFloat, 2); //Everson Cunha - SIG112672 //Everson Cunha - SIG113888
    sVlrTotal := FormataValor(2, FloatToStr(dVlrTotal));
  end;

  //
  // 3.0.Gerando Linha do RodapÈ do Arquivo
  //
  cdsGeraCabecRodapeArq.data := _SelecionaDadosRodapeArq(sVlrTotal, IntToStr(iQtdRegsArq), IntToStr(iNSR + 1));
  sLinha := cdsGeraCabecRodapeArq.FieldByName('LINHARODAPEARQ').asString;
  _GravaLinha(pNomeCompletoArquivoRemessa, sLinha);

  // Limpando o CDS para receber novos dados, se for o caso
  cdsGeraMovLote.EmptyDataSet;
  frmProgressoDuplo.EscondeFormProgressoDuplo;

  Screen.Cursor := crDefault;
End;


Function TCtrlRemessaEletronicaDeb._SelecionaMovimentoRemessa(
  pConvenio,
  pFormaPagto: String;
  pDataIni,
  pDataFim: TDateTime): OleVariant;
Var sSql: String;
Begin
  sSql := 'SELECT ''S'' MARCADO, ' + #13#10 +
    '       D.CODDOCUMENTO,                                                                        ' + #13#10 +
    '       D.CODFORMA,                                                                            ' + #13#10 +
    '       D.CODPORTFORMA,                                                                        ' + #13#10 +
    '       D.NUMAPGR NUM_AP,                                                                      ' + #13#10 +
    '       D.NODOCUMENTO NUM_DOC,                                                                 ' + #13#10 +
    '       REGEXP_REPLACE(P.NUMDOCUMENTO, ''\D'') NUMDOCUMENTO,                                   ' + #13#10 +
    '       CAST(                                                                                  ' + #13#10 +
    '       CASE LENGTH(REGEXP_REPLACE(P.NUMDOCUMENTO, ''\D''))                                    ' + #13#10 +
    '           WHEN 11 THEN                                                                       ' + #13#10 +
    '             regexp_replace(REGEXP_REPLACE(P.NUMDOCUMENTO, ''\D''), ''([0-9]{3})([0-9]{3})([0-9]{3})([0-9]{2})'',''\1.\2.\3-\4'')  ' + #13#10 +
    '           WHEN 14 THEN                                                                       ' + #13#10 +
    '             regexp_replace(REGEXP_REPLACE(P.NUMDOCUMENTO, ''\D''), ''([0-9]{2})([0-9]{3})([0-9]{3})([0-9]{4})([0-9]{2})'',''\1.\2.\3/\4-\5'')  ' + #13#10 +
    '           ELSE                                                                               ' + #13#10 +
    '             REGEXP_REPLACE(P.NUMDOCUMENTO, ''\D'')                                           ' + #13#10 +
    '       END AS VARCHAR2(20)) CPF_CNPJ_MASC,                                                    ' + #13#10 +
    '       TRIM(P.RAZAOSOCIAL) RAZAOSOCIAL,                                                       ' + #13#10 +
    '       (SELECT SUM(DECODE(LANC.DEBCRE, ''D'',                                                 ' + #13#10 +
    '               DECODE(DOC.RECPAG, ''R'', LANC.VALOR, LANC.VALOR * -1),                        ' + #13#10 +
    '               DECODE(DOC.RECPAG, ''R'', LANC.VALOR * -1, LANC.VALOR))) AS VALOR              ' + #13#10 +
    '        FROM LANCTODOCUM LANC                                                                 ' + #13#10 +
    '        JOIN DOCUMENTO DOC ON DOC.CODDOCUMENTO = LANC.CODDOCUMENTO                            ' + #13#10 +
    '        WHERE D.CODDOCUMENTO = LANC.CODDOCUMENTO) VALOR,                                      ' + #13#10 +
    '       PO.DESCRICAO AS NOME_CONVENIO,                                                         ' + #13#10 +
    '       D.DATAPROGRAMADA,                                                                      ' + #13#10 +
    '       FO.DESCRICAO FORMA_PAGTO,                                                              ' + #13#10 +
    '       FO.FLGPERMITELISTAFAVORECIDO,                                                          ' + #13#10 +
    '       FO.FLGPERMITETITULOSPAGTO,                                                             ' + #13#10 +
    '       CAST(RPAD('' '', 250, '' '') AS VARCHAR2(250)) AS MSGERRO                              ' + #13#10 +
    'FROM DOCUMENTO D                                                                              ' + #13#10 +
    'JOIN PESSOA P ON P.IDPESSOA = D.IDFORCLI                                                      ' + #13#10 +
    'JOIN LANCTODOCUM L ON L.CODDOCUMENTO = D.CODDOCUMENTO AND L.OPERACAO = 2                      ' + #13#10 +
    'LEFT JOIN FORMARECPAG FO ON FO.CODFORMA = D.CODFORMA AND FO.FLGARQUIVO = ''S''                ' + #13#10 + // 'S' = Formas que geram arquivo de remessa
  'JOIN PORTADORFORMA PO ON PO.CODPORTFORMA = D.CODPORTFORMA                                       ' + #13#10 +
    'WHERE D.RECPAG = ''P''                                                                        ' + #13#10 +
    '      AND D.STATUS NOT IN (1, 2)                                                              ' + #13#10 +
    '      AND NOT EXISTS (SELECT 1                                                                ' + #13#10 +
    '                      FROM ARQUIVOPAGTO AP                                                    ' + #13#10 +
    '                      JOIN ARQUIVOXDOCUM AXD ON AXD.IDARQUIVOPAGTO = AP.IDARQUIVOPAGTO        ' + #13#10 +
    '                      LEFT JOIN DOCUMENTOXPESSOAS DP ON DP.IDDOCUMENTOXPESSOAS = AXD.ID_DOC_CODBARRAS_PESSOAS AND AXD.TIPO = 2      ' + #13#10 +
    '                      LEFT JOIN DOCUMENTOXCODBARRAS DC ON DC.IDDOCUMENTOXCODBARRAS = AXD.ID_DOC_CODBARRAS_PESSOAS AND AXD.TIPO = 3  ' + #13#10 +
    '                      WHERE AP.FLGENVIADO <> ''C''                                            ' + #13#10 + // Cancelado
  '                              AND DECODE(AXD.TIPO, 1, AXD.ID_DOC_CODBARRAS_PESSOAS, 2, DP.CODDOCUMENTO, 3, DC.CODDOCUMENTO) = D.CODDOCUMENTO)  ' + #13#10;

  If pConvenio <> '' Then
    sSql := sSql + '      AND D.CODPORTFORMA = ' + quotedstr(pConvenio) + #13#10;

  If pFormaPagto <> '-1' Then
    sSql := sSql + '   AND D.CODFORMA = ' + quotedstr(pFormaPagto) + #13#10;

  sSql := sSql + '   AND ((D.DATAPROGRAMADA >= TO_DATE(''' + DateToStr(pDataIni) + ''',''DD/MM/YYYY''))   ' + #13#10 +
    '   AND (D.DATAPROGRAMADA <= TO_DATE(''' + DateToStr(pDataFim) + ''',''DD/MM/YYYY'')))                ' + #13#10;

  sSql := sSql + 'ORDER BY D.DATAPROGRAMADA, FO.DESCRICAO, P.RAZAOSOCIAL, D.NODOCUMENTO     ';

  Result := GetDataPacket(sSql);
  sqlText.Clear;
  sqlText.add(sSql);
  sqlText.SaveToFile(sPathArquivo + '\SQL_SelMovRemessa.txt');
End;



Function TCtrlRemessaEletronicaDeb._SelecionaMovArquivo(pConvenio, pFlgEnviado: String): OleVariant;
Var sSql: String;
Begin
  sSql := 'SELECT AP.IDARQUIVOPAGTO,                                                                                       ' + #13#10 +
    '       AP.CODPORTFORMA,                                                                                               ' + #13#10 +
    //'       LPAD(AP.NSA, 6, ''0'') AS NSA,                                                                                 ' + #13#10 +   //MIGRACAO-ORACLE
    '       CAST(LPAD(AP.NSA, 6, ''0'') AS VARCHAR2(6)) AS NSA,                                                            ' + #13#10 +     //MIGRACAO-ORACLE
    '       AP.VLRTOTAL,                                                                                                   ' + #13#10 +
    '       AP.TRGDTINCLUSAO DT_PREPARO,                                                                                   ' + #13#10 +
    '       DECODE(TRIM(U.NOMEUSUARIO), ''CM'', AP.TRGUSERINCLUSAO, U.NOMEUSUARIO) USU_PREPARO,                            ' + #13#10 +
    '       AP.DTGERACAOARQTXT,                                                                                            ' + #13#10 +
    '       AP.USUGERACAOARQTXT,                                                                                           ' + #13#10 +
    '       AP.NOMEARQTXT,                                                                                                 ' + #13#10 +
    '       AP.DTFINALIZAARQTXT,                                                                                           ' + #13#10 +
    '       AP.USUFINALIZAARQTXT,                                                                                          ' + #13#10 +
    '       AP.DTCANCELAARQTXT,                                                                                            ' + #13#10 +
    '       AP.USUCANCELAARQTXT,                                                                                           ' + #13#10 +
    '       P.DESCRICAO AS NOME_CONVENIO,                                                                                  ' + #13#10 +
    '       AP.FLGENVIADO,                                                                                                 ' + #13#10 +
    '       P.PATHARQUIVOREM,                                                                                              ' + #13#10 +
    '       P.PATHARQUIVORET,                                                                                              ' + #13#10 +
    '       P.PATHARQUIVOSEGURANCA,                                                                                        ' + #13#10 +
    '       P.PATHARQUIVOBACKUP,                                                                                           ' + #13#10 +
    '       DECODE((SELECT DISTINCT DECODE(AR.TIPO, 1, D1.STATUS, 2, D2.STATUS, 3, D3.STATUS) STATUS                       ' + #13#10 +
    '               FROM ARQUIVOXDOCUM AR                                                                                  ' + #13#10 +
    '               LEFT JOIN (SELECT DI1.CODDOCUMENTO, DI1.STATUS                                                         ' + #13#10 +
    '                          FROM DOCUMENTO DI1) D1 ON D1.CODDOCUMENTO = AR.ID_DOC_CODBARRAS_PESSOAS AND AR.TIPO = 1     ' + #13#10 +
    '               LEFT JOIN (SELECT DP.IDDOCUMENTOXPESSOAS, DI2.STATUS                                                   ' + #13#10 +
    '                          FROM DOCUMENTO DI2                                                                          ' + #13#10 +
    '                          JOIN DOCUMENTOXPESSOAS DP ON DP.CODDOCUMENTO = DI2.CODDOCUMENTO                             ' + #13#10 +
    '                          ) D2 ON D2.IDDOCUMENTOXPESSOAS = AR.ID_DOC_CODBARRAS_PESSOAS AND AR.TIPO = 2                ' + #13#10 +
    '               LEFT JOIN (SELECT DC.IDDOCUMENTOXCODBARRAS, DI3.STATUS, DC.CODDOCUMENTO                                ' + #13#10 +
    '                          FROM DOCUMENTO DI3                                                                          ' + #13#10 +
    '                          JOIN DOCUMENTOXCODBARRAS DC ON DC.CODDOCUMENTO = DI3.CODDOCUMENTO                           ' + #13#10 +
    '                          ) D3 ON D3.IDDOCUMENTOXCODBARRAS = AR.ID_DOC_CODBARRAS_PESSOAS AND AR.TIPO = 3              ' + #13#10 +
    '               WHERE DECODE(AR.TIPO, 1, D1.STATUS, 2, D2.STATUS, 3, D3.STATUS) = 2                                    ' + #13#10 +
    '                     AND AR.IDARQUIVOPAGTO = AP.IDARQUIVOPAGTO), 2, ''Baixado'', ''Aberto'') STATUS                   ' + #13#10 +
    'FROM ARQUIVOPAGTO AP                                                                                                  ' + #13#10 +
    'JOIN USUARIOSISTEMA U ON U.IDUSUARIO = NVL(REGEXP_REPLACE(AP.TRGUSERINCLUSAO, ''\D''), 2)                             ' + #13#10 +
    'JOIN PORTADORFORMA P ON P.CODPORTFORMA = AP.CODPORTFORMA                                                              ' + #13#10 +
    'WHERE AP.FLGENVIADO = ' + quotedstr(pFlgEnviado) + #13#10 +
    '      AND AP.CODPORTFORMA = ' + quotedstr(pConvenio) + #13#10 +
    'ORDER BY AP.IDARQUIVOPAGTO DESC                                                                                       ' + #13#10;

  Result := GetDataPacket(sSql);
  sqlText.Clear;
  sqlText.add(sSql);
  sqlText.SaveToFile(sPathArquivo + '\SQL_SelMovArquivo_' + pFlgEnviado + '.txt');
End;

Function TCtrlRemessaEletronicaDeb._SelecionaMovArqDetalhe(pCodPortForma: integer): String;
var
  sSQL: string;
Begin
  //Everson Cunha - SIG103935 - SIACC - Ini
  sSQL :=
  //'SELECT D.NUMAPGR NUM_AP, ' + #13#10 +        //Everson Cunha - SIG112672
  'SELECT DISTINCT D.NUMAPGR NUM_AP, ' + #13#10 + //Everson Cunha - SIG112672
  '       D.NODOCUMENTO,' + #13#10 +
  '       D.DATAPROGRAMADA,' + #13#10 +
  '       AX.VALOR,' + #13#10 +
  '       CAST(' + #13#10 +
  '        CASE LENGTH(REGEXP_REPLACE(P.NUMDOCUMENTO, ''\D''))' + #13#10 +
  '         WHEN 11 THEN' + #13#10 +
  '          regexp_replace(REGEXP_REPLACE(P.NUMDOCUMENTO, ''\D''), ''([0-9]{3})([0-9]{3})([0-9]{3})([0-9]{2})'',''\1.\2.\3-\4'')' + #13#10 +
  '         WHEN 14 THEN' + #13#10 +
  '          regexp_replace(REGEXP_REPLACE(P.NUMDOCUMENTO, ''\D''), ''([0-9]{2})([0-9]{3})([0-9]{3})([0-9]{4})([0-9]{2})'',''\1.\2.\3/\4-\5'')' + #13#10 +
  '         ELSE' + #13#10 +
  '          REGEXP_REPLACE(P.NUMDOCUMENTO, ''\D'')' + #13#10 +
  '        END AS VARCHAR(18)) CPF_CNPJ_MASC,' + #13#10 +
  '       P.RAZAOSOCIAL,' + #13#10 +
  '       DADOS_BANCARIOS.NUMBANCO NUM_BANCO,' + #13#10 +
  '       CASE' + #13#10 +
  '        WHEN INSTR(DADOS_BANCARIOS.MASCARAAGENCIA, ''-'') = 0 THEN' + #13#10 +
  '         REGEXP_REPLACE(DADOS_BANCARIOS.NUMAGENCIA, ''\W'')' + #13#10 +
  '        ELSE' + #13#10 +
  '         SUBSTR(REGEXP_REPLACE(DADOS_BANCARIOS.NUMAGENCIA, ''\W''), 0, INSTR(TRIM(DADOS_BANCARIOS.MASCARAAGENCIA), ''-'')-1) ||''-''||' + #13#10 +
  '         SUBSTR(REGEXP_REPLACE(DADOS_BANCARIOS.NUMAGENCIA, ''\W''), INSTR(TRIM(DADOS_BANCARIOS.MASCARAAGENCIA), ''-''), 1)' + #13#10 +
  '       END NUM_AGENCIA,' + #13#10 +
  '       CASE' + #13#10 +
  '       WHEN INSTR(DADOS_BANCARIOS.MASCARACC, ''-'') = 0 THEN' + #13#10 +
  '        REGEXP_REPLACE(DADOS_BANCARIOS.CONTACORRENTE, ''\W'')' + #13#10 +
  '       ELSE' + #13#10 +
  '        SUBSTR(REGEXP_REPLACE(DADOS_BANCARIOS.CONTACORRENTE, ''\W''), 0, INSTR(TRIM(DADOS_BANCARIOS.MASCARACC), ''-'')-1) ||''-''||' + #13#10 +
  '        SUBSTR(REGEXP_REPLACE(DADOS_BANCARIOS.CONTACORRENTE, ''\W''), INSTR(TRIM(DADOS_BANCARIOS.MASCARACC), ''-''), 1)' + #13#10 +
  '       END NUM_CONTA,' + #13#10 +
  '       FO.DESCRICAO FORMA_PAGTO,' + #13#10 +
  '       DECODE(D.STATUS, 2, ''Baixado'', ''Aberto'') STATUS,' + #13#10 +
  '       AX.CODFORMA,' + #13#10 +
  //'       LPAD(AP.NSA, 6, ''0'') NSA,' + #13#10 +                                //MIGRACAO-ORACLE
  '       CAST(LPAD(AP.NSA, 6, ''0'') AS VARCHAR2(6)) AS NSA,' + #13#10 +          //MIGRACAO-ORACLE
  '       AX.IDARQUIVOPAGTO,' + #13#10 +
  '       COD.CODIGO COD_OCORRENCIA_RET,' + #13#10 +
  '       COD.DESCRICAO DESC_OCORRENCIA_RET,' + #13#10 +
  '       AX.VL_TARIFA_CONVENIO ' + #13#10 + //Everson Cunha - SIG111426
  '  FROM CM.ARQUIVOXDOCUM AX' + #13#10 +
  '  JOIN CM.ARQUIVOPAGTO AP ON AP.IDARQUIVOPAGTO = AX.IDARQUIVOPAGTO' + #13#10 +
  '  JOIN CM.DOCUMENTO D ON D.CODDOCUMENTO = AX.ID_DOC_CODBARRAS_PESSOAS AND AX.TIPO = 1 /*Se vier a usar os tipos 2 e 3 ter· que implementar*/' + #13#10 +
  '  JOIN CM.PESSOA P ON P.IDPESSOA = D.IDFORCLI' + #13#10 +
  
  '  JOIN (SELECT CC.IDPESSOA, CC.IDCBANCARIA, BA.MASCARAAGENCIA, BA.MASCARACC,' + #13#10 +
  '               NVL(CC.FLGCONTAPREF, 0) FLGCONTAPREF,' + #13#10 +
  '               REGEXP_REPLACE(BA.NUMBANCO, ''\D'') NUMBANCO,' + #13#10 +
  '               REGEXP_REPLACE(AG.NUMAGENCIA, ''\W'') NUMAGENCIA, ' + #13#10 +
  '               REGEXP_REPLACE(CC.CONTACORRENTE, ''\D'') CONTACORRENTE' + #13#10 +
  '          FROM CM.CONTABANCARIA CC' + #13#10 +
  '          JOIN CM.AGENCIABANCARIA AG ON AG.IDPESSOA = CC.IDAGENCIA' + #13#10 +
  '          JOIN CM.BANCO BA ON BA.IDPESSOA= AG.IDBANCO) DADOS_BANCARIOS ON ' + #13#10;

  //Everson Cunha - SIG115364 - Ini
  {
  //Everson Cunha - SIG104134 - Ini
  if pCodPortForma <> 261 then //Tratamento diferenciado para as rotinas que NAO gravam IDCBANCARIA na tabela cm.documento
  begin
    sSQL := sSQL + ' DADOS_BANCARIOS.IDCBANCARIA = D.IDCBANCARIA ' + #13#10
  end
  else
  begin
    sSQL := sSQL + ' DADOS_BANCARIOS.IDPESSOA = D.IDFORCLI AND DADOS_BANCARIOS.FLGCONTAPREF = 1 ' + #13#10;
  end; }

  case pCodPortForma of
    261: sSQL := sSQL + ' DADOS_BANCARIOS.IDPESSOA = D.IDFORCLI AND DADOS_BANCARIOS.FLGCONTAPREF = 1 ' + #13#10;
    295: sSQL := sSQL + ' DADOS_BANCARIOS.IDPESSOA = D.IDFORCLI AND DADOS_BANCARIOS.FLGCONTAPREF = 1 ' + #13#10;
  else
    sSQL := sSQL + ' DADOS_BANCARIOS.IDCBANCARIA = D.IDCBANCARIA ' + #13#10;
  end;
  //Everson Cunha - SIG115364 - Fim

  //'/*Tratamento diferenciado para as rotinas que NAO gravam IDCBANCARIA na tabela cm.documento*/ ' + #13#10 +
  //'((AP.CODPORTFORMA <> 261 AND DADOS_BANCARIOS.IDCBANCARIA = D.IDCBANCARIA) OR ' + #13#10 +
  //' (AP.CODPORTFORMA = 261 AND DADOS_BANCARIOS.IDPESSOA = D.IDFORCLI AND DADOS_BANCARIOS.FLGCONTAPREF = 1)) ' + #13#10 +
  //Everson Cunha - SIG104134 - Fim
  
  sSQL := sSQL +
  '  LEFT JOIN CM.FORMARECPAG FO ON FO.CODFORMA = D.CODFORMA' + #13#10 +
  '  LEFT JOIN CM.CODIGOSCNAB COD ON TRIM(COD.CODIGO) = TRIM(AX.OCORRENCIA_RET) AND COD.IDMODELOSCNAB = 62 /*BANCO CEF - SIACC - DEBITO AUTOMATICO*/' + #13#10 +
  ' WHERE AX.IDARQUIVOPAGTO = :IDARQUIVOPAGTO ' + #13#10 +
  ' ORDER BY D.DATAPROGRAMADA, FO.DESCRICAO, P.RAZAOSOCIAL, AX.VALOR ';

  Result := sSQL;

(*Result := 'SELECT DECODE(AX.TIPO, 1, D1.NUMAPGR, 2, D2.NUMAPGR, 3, D3.NUMAPGR) NUM_AP,                                     ' + #13#10 +
    '       DECODE(AX.TIPO, 1, D1.NODOCUMENTO, 2, D2.NODOCUMENTO, 3, D3.NODOCUMENTO) NODOCUMENTO,                            ' + #13#10 +
    '       DECODE(AX.TIPO, 1, D1.DATAPROGRAMADA, 2, D2.DATAPROGRAMADA, 3, D3.DTPAGTO) DATAPROGRAMADA,                       ' + #13#10 +
    '       AX.VALOR,                                                                                                        ' + #13#10 +
    '       CAST(                                                                                                            ' + #13#10 +
    '       CASE LENGTH(REGEXP_REPLACE(DECODE(AX.TIPO, 1, D1.NUMDOCUMENTO, 2, D2.NUMDOCUMENTO, 3, D3.NUMDOCUMENTO), ''\D'')) ' + #13#10 +
    '         WHEN 11 THEN ' + #13#10 +
    '           regexp_replace(REGEXP_REPLACE(DECODE(AX.TIPO, 1, D1.NUMDOCUMENTO, 2, D2.NUMDOCUMENTO, 3, D3.NUMDOCUMENTO), ''\D''), ''([0-9]{3})([0-9]{3})([0-9]{3})([0-9]{2})'',''\1.\2.\3-\4'') ' + #13#10 +
    '         WHEN 14 THEN ' + #13#10 +
    '           regexp_replace(REGEXP_REPLACE(DECODE(AX.TIPO, 1, D1.NUMDOCUMENTO, 2, D2.NUMDOCUMENTO, 3, D3.NUMDOCUMENTO), ''\D''), ''([0-9]{2})([0-9]{3})([0-9]{3})([0-9]{4})([0-9]{2})'',''\1.\2.\3/\4-\5'') ' + #13#10 +
    '         ELSE' + #13#10 +
    '           REGEXP_REPLACE(DECODE(AX.TIPO, 1, D1.NUMDOCUMENTO, 2, D2.NUMDOCUMENTO, 3, D3.NUMDOCUMENTO), ''\D'')' + #13#10 +
    '       END AS VARCHAR(18)) CPF_CNPJ_MASC, ' + #13#10 +
    '       DECODE(AX.TIPO, 1, D1.RAZAOSOCIAL, 2, D2.RAZAOSOCIAL, 3, D3.RAZAOSOCIAL) RAZAOSOCIAL, ' + #13#10 +
    '       DECODE(' + #13#10 +
    '       DECODE(AX.TIPO, 1, D1.FLGPERMITETITULOSPAGTO, 2, D2.FLGPERMITETITULOSPAGTO, 3, D3.FLGPERMITETITULOSPAGTO), ''S'', '' - '',' + #13#10 +
    '       REGEXP_REPLACE(DECODE(AX.TIPO, 1, D1.NUMBANCO, 2, D2.NUMBANCO), ''\D'')) NUM_BANCO, ' + #13#10 +
    '       DECODE(' + #13#10 +
    '       DECODE(AX.TIPO, 1, D1.FLGPERMITETITULOSPAGTO, 2, D2.FLGPERMITETITULOSPAGTO, 3, D3.FLGPERMITETITULOSPAGTO), ''S'', '' - '',' + #13#10 +
    '       CASE AX.TIPO ' + #13#10 +
    '         WHEN ''1'' THEN ' + #13#10 +
    '           CASE ' + #13#10 +
    '             WHEN INSTR(D1.MASCARAAGENCIA, ''-'') = 0 THEN ' + #13#10 +
    '               REGEXP_REPLACE(D1.NUMAGENCIA, ''\W'') ' + #13#10 +
    '             ELSE ' + #13#10 +
    '               SUBSTR(REGEXP_REPLACE(D1.NUMAGENCIA, ''\W''), 0, INSTR(TRIM(D1.MASCARAAGENCIA), ''-'')-1) ||''-''|| ' + #13#10 +
    '               SUBSTR(REGEXP_REPLACE(D1.NUMAGENCIA, ''\W''), INSTR(TRIM(D1.MASCARAAGENCIA), ''-''), 1) ' + #13#10 +
    '           END ' + #13#10 +
    '         WHEN ''2'' THEN ' + #13#10 +
    '           CASE D2.FLGIMPORTADO ' + #13#10 +
    '             WHEN ''N'' THEN ' + #13#10 +
    '               CASE ' + #13#10 +
    '                 WHEN INSTR(D2.MASCARAAGENCIA, ''-'') = 0 THEN ' + #13#10 +
    '                   REGEXP_REPLACE(D2.NUMAGENCIA, ''\W'') ' + #13#10 +
    '                 ELSE ' + #13#10 +
    '                   SUBSTR(REGEXP_REPLACE(D2.NUMAGENCIA, ''\W''), 0, INSTR(TRIM(D2.MASCARAAGENCIA), ''-'')-1) ||''-''|| ' + #13#10 +
    '                   SUBSTR(REGEXP_REPLACE(D2.NUMAGENCIA, ''\W''), INSTR(TRIM(D2.MASCARAAGENCIA), ''-''), 1) ' + #13#10 +
    '               END ' + #13#10 +
    '             WHEN ''S'' THEN ' + #13#10 +
    '               REGEXP_REPLACE(D2.NUMAGENCIA, ''\s'')' + #13#10 +
    '           END ' + #13#10 +
    '       END) NUM_AGENCIA, ' + #13#10 +
    '       DECODE(' + #13#10 +
    '       DECODE(AX.TIPO, 1, D1.FLGPERMITETITULOSPAGTO, 2, D2.FLGPERMITETITULOSPAGTO, 3, D3.FLGPERMITETITULOSPAGTO), ''S'', '' - '',' + #13#10 +
    '       CASE AX.TIPO ' + #13#10 +
    '         WHEN ''1'' THEN ' + #13#10 +
    '           CASE ' + #13#10 +
    '             WHEN INSTR(D1.MASCARACC, ''-'') = 0 THEN ' + #13#10 +
    '               REGEXP_REPLACE(D1.CONTACORRENTE, ''\W'') ' + #13#10 +
    '             ELSE ' + #13#10 +
    '               SUBSTR(REGEXP_REPLACE(D1.CONTACORRENTE, ''\W''), 0, INSTR(TRIM(D1.MASCARACC), ''-'')-1) ||''-''|| ' + #13#10 +
    '               SUBSTR(REGEXP_REPLACE(D1.CONTACORRENTE, ''\W''), INSTR(TRIM(D1.MASCARACC), ''-''), 1) ' + #13#10 +
    '           END ' + #13#10 +
    '         WHEN ''2'' THEN ' + #13#10 +
    '           CASE D2.FLGIMPORTADO ' + #13#10 +
    '             WHEN ''N'' THEN ' + #13#10 +
    '               CASE ' + #13#10 +
    '                 WHEN INSTR(D2.MASCARACC, ''-'') = 0 THEN ' + #13#10 +
    '                   REGEXP_REPLACE(D2.CONTACORRENTE, ''\W'')' + #13#10 +
    '                 ELSE ' + #13#10 +
    '                   SUBSTR(REGEXP_REPLACE(D2.CONTACORRENTE, ''\W''), 0, INSTR(TRIM(D2.MASCARACC), ''-'')-1) ||''-''|| ' + #13#10 +
    //C·ssio Rovaroto - SIG n∫ 73883 - InÌcio
    //Tratamento para contas do HSBC
    //'                   SUBSTR(REGEXP_REPLACE(D2.CONTACORRENTE, ''\W''), INSTR(TRIM(D2.MASCARACC), ''-''), 1) ' + #13#10 +
    '                   SUBSTR(REGEXP_REPLACE(D2.CONTACORRENTE, ''\W''), INSTR(TRIM(D2.MASCARACC), ''-'')) ' + #13#10 +
    //C·ssio Rovaroto - SIG n∫ 73883 - Fim
    '               END ' + #13#10 +
    '             WHEN ''S'' THEN' + #13#10 +
    '               REGEXP_REPLACE(D2.CONTACORRENTE, ''\s'')' + #13#10 +
    '           END ' + #13#10 +
    '       END) NUM_CONTA,' + #13#10 +
    '       DECODE(' + #13#10 +
    '       DECODE(AX.TIPO, 1, D1.FLGPERMITETITULOSPAGTO, 2, D2.FLGPERMITETITULOSPAGTO, 3, D3.FLGPERMITETITULOSPAGTO), ''N'', '' - '',' + #13#10 +
    '       CAST( ' + #13#10 +
    '       CASE AX.TIPO ' + #13#10 +
    '         WHEN ''1'' THEN ' + #13#10 +
    '           CASE LENGTH(REGEXP_REPLACE(D1.NUMLEITCODBARRAS, ''\D'')) ' + #13#10 +
    '             WHEN 47 THEN ' + #13#10 +
    '               REGEXP_REPLACE(REGEXP_REPLACE(D1.NUMLEITCODBARRAS, ''\D''), ''([0-9]{5})([0-9]{5})([0-9]{5})([0-9]{6})([0-9]{5})([0-9]{6})([0-9]{1})([0-9]{14})'', ''\1.\2 \3.\4 \5.\6 \7 \8'') ' + #13#10 +
    '             WHEN 48 THEN ' + #13#10 +
    '               REGEXP_REPLACE(REGEXP_REPLACE(D1.NUMLEITCODBARRAS, ''\D''), ''([0-9]{11})([0-9]{1})([0-9]{11})([0-9]{1})([0-9]{11})([0-9]{1})([0-9]{11})([0-9]{1})'', ''\1-\2 \3-\4 \5-\6 \7-\8'') ' + #13#10 +
    '             ELSE ' + #13#10 +
    '               REGEXP_REPLACE(D1.NUMLEITCODBARRAS, ''\D'')' + #13#10 +
    '           END' + #13#10 +
    '         WHEN ''3'' THEN ' + #13#10 +
    '           CASE LENGTH(REGEXP_REPLACE(D3.NUMCODBARRAS, ''\D''))                                              ' + #13#10 +
    '             WHEN 47 THEN ' + #13#10 +
    '               REGEXP_REPLACE(REGEXP_REPLACE(D3.NUMCODBARRAS, ''\D''), ''([0-9]{5})([0-9]{5})([0-9]{5})([0-9]{6})([0-9]{5})([0-9]{6})([0-9]{1})([0-9]{14})'', ''\1.\2 \3.\4 \5.\6 \7 \8'') ' + #13#10 +
    '             WHEN 48 THEN ' + #13#10 +
    '               REGEXP_REPLACE(REGEXP_REPLACE(D3.NUMCODBARRAS, ''\D''), ''([0-9]{11})([0-9]{1})([0-9]{11})([0-9]{1})([0-9]{11})([0-9]{1})([0-9]{11})([0-9]{1})'', ''\1-\2 \3-\4 \5-\6 \7-\8'') ' + #13#10 +
    '             ELSE ' + #13#10 +
    '               REGEXP_REPLACE(D3.NUMCODBARRAS, ''\D'')' + #13#10 +
    '           END ' + #13#10 +
    '       END AS VARCHAR2(100))) COD_BARRAS_MASC, ' + #13#10 +
    '       DECODE(AX.TIPO, 1, D1.FORMA_PAGTO, 2, D2.FORMA_PAGTO, 3, D3.FORMA_PAGTO) FORMA_PAGTO, ' + #13#10 +
    '       DECODE(DECODE(AX.TIPO, 1, D1.STATUS, 2, D2.STATUS, 3, D3.STATUS), 2, ''Baixado'', ''Aberto'') STATUS, ' + #13#10 +
    '       AX.CODFORMA,              ' + #13#10 +
    '       LPAD(AP.NSA, 6, ''0'') NSA,         ' + #13#10 +
    '       AX.IDARQUIVOPAGTO                 ' + #13#10 +
    '  FROM ARQUIVOXDOCUM AX                  ' + #13#10 +
    '  JOIN ARQUIVOPAGTO AP ON AP.IDARQUIVOPAGTO = AX.IDARQUIVOPAGTO     ' + #13#10 +
    '  LEFT JOIN ( ' + #13#10 +
    'SELECT DI1.CODDOCUMENTO, DI1.NUMAPGR, DI1.NODOCUMENTO, DI1.DATAPROGRAMADA, DI1.STATUS, P.NUMDOCUMENTO, P.RAZAOSOCIAL, ' + #13#10 +
    '       CONTA.MASCARAAGENCIA, CONTA.MASCARACC, CONTA.NUMBANCO, CONTA.NUMAGENCIA, CONTA.CONTACORRENTE, ' + #13#10 +
    '       FO.DESCRICAO FORMA_PAGTO, NVL(FO.FLGPERMITETITULOSPAGTO, ''N'') FLGPERMITETITULOSPAGTO, DI1.NUMLEITCODBARRAS ' + #13#10 +
    '  FROM DOCUMENTO DI1 ' + #13#10 +
    '  LEFT JOIN FORMARECPAG FO ON FO.CODFORMA = DI1.CODFORMA ' + #13#10 +
    '  JOIN PESSOA P ON P.IDPESSOA = DI1.IDFORCLI ' + #13#10 +
    '  LEFT JOIN (' + #13#10 +
    'SELECT C.IDPESSOA, C.IDCBANCARIA, B.MASCARAAGENCIA, B.MASCARACC, B.NUMBANCO, A.NUMAGENCIA, C.CONTACORRENTE, C.FLGCONTAPREF, C.TIPOCONTA ' + #13#10 +
    '  FROM CONTABANCARIA C ' + #13#10 +
    '  JOIN AGENCIABANCARIA A ON C.IDAGENCIA = A.IDPESSOA ' + #13#10 +
    //C·ssio Rovaroto - SIG n∫ 102320 - InÌcio
    //'  JOIN BANCO B ON B.IDPESSOA = A.IDBANCO) CONTA ON (DI1.IDCBANCARIA IS NOT NULL AND (CONTA.IDCBANCARIA = DI1.IDCBANCARIA)) OR ( DI1.IDCBANCARIA IS NULL AND (CONTA.IDPESSOA = DI1.IDFORCLI AND CONTA.FLGCONTAPREF = 1 AND CONTA.TIPOCONTA IN (1,3))) ' + #13#10 +
    //'  JOIN BANCO B ON B.IDPESSOA = A.IDBANCO) CONTA ON CONTA.IDCBANCARIA = DI1.IDCBANCARIA ' + #13#10 +
    '  JOIN BANCO B ON B.IDPESSOA = A.IDBANCO ' + #13#10 +
    '  WHERE C.FLGCONTAPREF = 1) CONTA ON CONTA.IDPESSOA = P.IDPESSOA ' + #13#10 +
    //C·ssio Rovaroto - SIG n∫ 102320 - Fim
    '            ) D1 ON D1.CODDOCUMENTO = AX.ID_DOC_CODBARRAS_PESSOAS AND AX.TIPO = 1 ' + #13#10 +
    '  LEFT JOIN ( ' + #13#10 +
    'SELECT DP.IDDOCUMENTOXPESSOAS, DI2.NUMAPGR, DI2.NODOCUMENTO, DI2.DATAPROGRAMADA, DI2.STATUS, DP.NUMDOCUMENTO, DP.RAZAOSOCIAL, ' + #13#10 +
    '       MANUAL.MASCARAAGENCIA, MANUAL.MASCARACC, DP.NUMBANCO, DP.NUMAGENCIA, DP.NUMOPERACAO || DP.NUMCONTA CONTACORRENTE, ' + #13#10 +
    '       FO.DESCRICAO FORMA_PAGTO, NVL(FO.FLGPERMITETITULOSPAGTO, ''N'') FLGPERMITETITULOSPAGTO, DP.FLGIMPORTADO ' + #13#10 +
    '  FROM DOCUMENTO DI2 ' + #13#10 +
    '  LEFT JOIN FORMARECPAG FO ON FO.CODFORMA = DI2.CODFORMA ' + #13#10 +
    '  JOIN DOCUMENTOXPESSOAS DP ON DI2.CODDOCUMENTO = DP.CODDOCUMENTO ' + #13#10 +
    '  LEFT JOIN (SELECT B.MASCARACC, ' + #13#10 +
    '                    B.MASCARAAGENCIA, ' + #13#10 +
    '                    C.IDCBANCARIA ' + #13#10 +
    '               FROM CONTABANCARIA C ' + #13#10 +
    '               JOIN AGENCIABANCARIA A ON C.IDAGENCIA = A.IDPESSOA ' + #13#10 +
    '               JOIN BANCO B ON B.IDPESSOA = A.IDBANCO) MANUAL ON MANUAL.IDCBANCARIA = DP.IDCBANCARIA ' + #13#10 +
    '            ) D2 ON D2.IDDOCUMENTOXPESSOAS = AX.ID_DOC_CODBARRAS_PESSOAS AND AX.TIPO = 2 ' + #13#10 +
    '  LEFT JOIN ( ' + #13#10 +
    'SELECT DC.IDDOCUMENTOXCODBARRAS, DI3.NUMAPGR, DI3.NODOCUMENTO, DC.DTPAGTO, DI3.STATUS, ' + #13#10 +
    '       NVL(DC.NUMDOCUMENTO, P3.NUMDOCUMENTO) NUMDOCUMENTO, P3.RAZAOSOCIAL, ' + #13#10 +
    '       DC.NUMCODBARRAS, FO.DESCRICAO FORMA_PAGTO, NVL(FO.FLGPERMITETITULOSPAGTO, ''N'') FLGPERMITETITULOSPAGTO' + #13#10 +
    '  FROM DOCUMENTO DI3 ' + #13#10 +
    '  LEFT JOIN FORMARECPAG FO ON FO.CODFORMA = DI3.CODFORMA ' + #13#10 +
    '  JOIN DOCUMENTOXCODBARRAS DC ON DI3.CODDOCUMENTO = DC.CODDOCUMENTO ' + #13#10 +
    '  JOIN PESSOA P3 ON P3.IDPESSOA = DI3.IDFORCLI ' + #13#10 +
    '            ) D3 ON D3.IDDOCUMENTOXCODBARRAS = AX.ID_DOC_CODBARRAS_PESSOAS AND AX.TIPO = 3 ' + #13#10 +
    ' WHERE AX.IDARQUIVOPAGTO = :IDARQUIVOPAGTO ' + #13#10 +
    ' ORDER BY DATAPROGRAMADA, FORMA_PAGTO, RAZAOSOCIAL, VALOR ';*)
    //Everson Cunha - SIG103935 - SIACC - Fim
End;



Function TCtrlRemessaEletronicaDeb._SelecionaDadosCabecArq(pCodPortForma, pNSA: String): Olevariant;
Var sSql: String;
Begin
  sSql := 'SELECT ''A'' ||--REG                                                                                                            ' +#13#10+
          '       ''1'' || --COD REMESSA                                                                                                   ' +#13#10+

          '       LPAD(TRIM(PO.NUMEMPRESABANCO), 6, ''0'') || ''11'' || ''0001'' || LPAD('' '', 8) || --CONVENIO                           ' +#13#10+
          '       RPAD(P.NOME, 20, '' '') ||                                                                                               ' +#13#10+
          '       TRIM(BA.NUMBANCO) || --NUM_BANCO                                                                                         ' +#13#10+
          '       RPAD(NVL(PB.NOME, PB.RAZAOSOCIAL), 20, '' '') || --NOME_BANCO                                                            ' +#13#10+
          '       TO_CHAR(SYSDATE, ''YYYYMMDD'') || --DATA                                                                                 ' +#13#10;
  sSql := sSql + Quotedstr(_CompletaZeroEsq(pNSA, 6)) + '|| --NSA                                                                          ' +#13#10;
  sSql := sSql + '''04'' || --VERSAO                                                                                                       ' +#13#10+
          '       RPAD(''DEB AUTOMAT'', 17, '' '') || --ID SERVI«O                                                                         ' +#13#10+
          '       CASE                                                                                                                     ' +#13#10+
          '         WHEN INSTR(BA.MASCARAAGENCIA, ''-'') = 0 THEN                                                                          ' +#13#10+
          '           LPAD(NVL(REGEXP_REPLACE(AG.NUMAGENCIA, ''\W''), ''0''), 4, ''0'')                                                    ' +#13#10+
          '         ELSE                                                                                                                   ' +#13#10+
          '           LPAD(NVL(SUBSTR(REGEXP_REPLACE(AG.NUMAGENCIA, ''\W''), 0, INSTR(TRIM(BA.MASCARAAGENCIA), ''-'')-1), 0), 4, ''0'')    ' +#13#10+
          '       END ||                                                                                                                   ' +#13#10+
          //C·ssio Rovaroto - SIG n∫ 94625 - InÌcio
          {'       CASE                                                                                                                     ' +#13#10+
          '         WHEN INSTR(BA.MASCARACC, ''-'') = 0 THEN                                                                               ' +#13#10+
          '           LPAD(NVL(REGEXP_REPLACE(CO.CONTACORRENTE, ''\W''), ''0''), 12, ''0'')                                                ' +#13#10+
          '         ELSE                                                                                                                   ' +#13#10+
          '           LPAD(NVL(SUBSTR(REGEXP_REPLACE(CO.CONTACORRENTE, ''\W''), 0, INSTR(TRIM(BA.MASCARACC), ''-'')-1), ''0''), 12, ''0'') ' +#13#10+
          '       END ||                                                                                                                   ' +#13#10+
          '       CASE                                                                                                                     ' +#13#10+
          '         WHEN INSTR(BA.MASCARACC, ''-'') = 0 THEN                                                                               ' +#13#10+
          '           '' ''                                                                                                                ' +#13#10+
          '         ELSE                                                                                                                   ' +#13#10+
          '           NVL(SUBSTR(REGEXP_REPLACE(CO.CONTACORRENTE, ''\W''), INSTR(TRIM(BA.MASCARACC), ''-''), 1), '' '')                    ' +#13#10+
          '       END || --CONTA_CLI                                                                                                       ' +#13#10;
          }
          'CASE                                                                                                                            ' +#13#10+
				  ' WHEN BA.MASCARACC IS NULL THEN                                                                                                 ' +#13#10+
			    '   	CASE                                                                                                                       ' +#13#10+
          '  		  WHEN INSTR(REPLACE(CO.CONTACORRENTE, ''-'', ''''), ''-'') = 0 THEN                                                       ' +#13#10+
			    '      	LPAD(NVL(REPLACE(CO.CONTACORRENTE, ''-'', ''''), 0), 11, ''0'')                                                          ' +#13#10+
          '   		  ELSE                                                                                                                   ' +#13#10+
			    '      	LPAD(NVL(SUBSTR(REPLACE(CO.CONTACORRENTE, ''-'', ''''), 0, INSTR(REPLACE(CO.CONTACORRENTE, ''-'', ''''), ''-'')-1), 0), 11, ''0'') ' +#13#10+
          '   		  END                                                                                                                    ' +#13#10+
			    '   WHEN INSTR(BA.MASCARACC, ''-'') = 0 THEN                                                                                     ' +#13#10+
			    '     LPAD(NVL(CO.CONTACORRENTE, 0), 11, ''0'')                                                                                  ' +#13#10+
		      '     ELSE                                                                                                                       ' +#13#10+
          '			LPAD(NVL(SUBSTR(REPLACE(CO.CONTACORRENTE, ''-'', ''''), 0, INSTR(TRIM(BA.MASCARACC), ''-'')-1), 0), 11, ''0'')             ' +#13#10+
          '       END ||                                                                                                                   ' +#13#10+
          '       CASE                                                                                                                     ' +#13#10+
			    '  WHEN BA.MASCARACC IS NULL THEN                                                                                                ' +#13#10+
		      '     CASE                                                                                                                       ' +#13#10+
          '  	 	WHEN INSTR(REPLACE(CO.CONTACORRENTE, ''-'', ''''), ''-'') = 0 THEN '' ''                                                   ' +#13#10+
          '          ELSE                                                                                                                  ' +#13#10+
		      '       NVL(SUBSTR(REPLACE(CO.CONTACORRENTE, ''-'', ''''), INSTR(REPLACE(CO.CONTACORRENTE, ''-'', ''''), ''-'')+1, 1), '' '')    ' +#13#10+
          '         END                                                                                                                    ' +#13#10+
         	'	    WHEN INSTR(BA.MASCARACC, ''-'') = 0 THEN '' ''                                                                             ' +#13#10+
		      '     ELSE                                                                                                                       ' +#13#10+
          ' 		  NVL(SUBSTR(REPLACE(CO.CONTACORRENTE, ''-'', ''''), INSTR(TRIM(BA.MASCARACC), ''-''), 1), '' '')                          ' +#13#10+
          '       END || --CONTA_CLI                                                                                                       ' +#13#10;
          //C·ssio Rovaroto - SIG n∫ 94625 - Fim
  if Copy(UpperCase(Sistema.AliasServidor),1,8) = 'PRODUCAO' then  //Ejrb - 29/04/2021 - SIG 114623 - ImplementaÁ„o do comando Copy, para igualar as bases de produÁ„o.
    sSql := sSql + '''PP''||                                                                                                               ' +#13#10
  else
    sSql := sSql + '''TT'' || --AMB                                                                                                        ' +#13#10;
//C·ssio Rovaroto - SIG n∫ 94625 - InÌcio
//  sSql := sSql +  'LPAD('' '', 26) ||                                                                                                      ' +#13#10+
  sSql := sSql +  'LPAD('' '', 27) ||                                                                                                      ' +#13#10+
//C·ssio Rovaroto - SIG n∫ 94625 - Fim
          '       ''000000'' ||                                                                                                            ' +#13#10+
          '       '' '' AS LINHACABECARQ                                                                                                   ' +#13#10+
          '  FROM PESSOA P                                                                                                                 ' +#13#10+
          '  JOIN PORTADORFORMA PO ON PO.IDPESSOA = P.IDPESSOA                                                                             ' +#13#10+
          '  JOIN PORTADORCONTA PC ON PC.CODPORTADOR = PO.CODPORTADOR                                                                      ' +#13#10+
          '  JOIN AGENCIABANCARIA AG ON AG.IDPESSOA = PC.IDAGENCIA                                                                         ' +#13#10+
          '  JOIN BANCO BA ON BA.IDPESSOA = AG.IDBANCO                                                                                     ' +#13#10+
          '  JOIN CONTABANCARIA CO ON CO.IDAGENCIA = AG.IDPESSOA AND CO.IDPESSOA = P.IDPESSOA                                              ' +#13#10+
          '  JOIN PESSOA PB ON PB.IDPESSOA = BA.IDPESSOA                                                                                   ' +#13#10+
          ' WHERE PO.CODPORTFORMA = ' + pCodPortForma                                                                                        +#13#10+
          '   AND PO.RECPAG = ''R''                                                                                                        ';
  Result := GetDataPacket(sSql);
  sqlText.Clear;
  sqlText.add(sSql);
  sqlText.SaveToFile(sPathArquivo + '\SQL_SelecionaDadosCabecArq.txt');
End;

Function TCtrlRemessaEletronicaDeb._SelecionaDadosRodapeArq(pVlrTotalLote, pQtdRegsArq, pNSR: String): Olevariant;
Var sSql: String;
Begin
  sSql := 'SELECT ''Z'' || --REG                                      ' + #13#10 ;
  sSql := sSql + Quotedstr(_CompletaZeroEsq(pQtdRegsArq, 6)) + '||    ' + #13#10 ;
  sSql := sSql + Quotedstr(_CompletaZeroEsq(pVlrTotalLote, 17)) + '|| ' + #13#10 ;
  sSql := sSql + ' RPAD('' '', 119) || --RESERVADO                    ' + #13#10 +
  QuotedStr(_CompletaZeroEsq(pNsr, 6)) + '||                          ' + #13#10 +
          '        RPAD('' '', 1) AS LINHARODAPEARQ                   ' + #13#10 +
          'FROM DUAL                                                  ';

  Result := GetDataPacket(sSql);
  sqlText.Clear;
  sqlText.add(sSql);
  sqlText.SaveToFile(sPathArquivo + '\SQL_SelecionaDadosRodapeArq.txt');
End;


function TCtrlRemessaEletronicaDeb.RemoveCaracterEspecial(pTexto: String;
  pRemoveExtra: boolean): String;
const
  //Lista de caracteres especiais
  xCarEsp: array[1..38] of String = ('·', '‡', '„', '‚', '‰','¡', '¿', '√', '¬', 'ƒ',
                                     'È', 'Ë','…', '»','Ì', 'Ï','Õ', 'Ã',
                                     'Û', 'Ú', 'ˆ','ı', 'Ù','”', '“', '÷', '’', '‘',
                                     '˙', '˘', '¸','⁄','Ÿ', '‹','Á','«','Ò','—');
  //Lista de caracteres para troca
  xCarTro: array[1..38] of String = ('a', 'a', 'a', 'a', 'a','A', 'A', 'A', 'A', 'A',
                                     'e', 'e','E', 'E','i', 'i','I', 'I',
                                     'o', 'o', 'o','o', 'o','O', 'O', 'O', 'O', 'O',
                                     'u', 'u', 'u','u','u', 'u','c','C','n', 'N');
  //Lista de Caracteres Extras
  xCarExt: array[1..48] of string = ('<','>','!','@','#','$','%','®','&','*',
                                     '(',')','_','+','=','{','}','[',']','?',
                                     ';',':',',','|','*','"','~','^','¥','`',
                                     '®','Ê','∆','¯','£','ÿ','É','™','∫','ø',
                                     'Æ','Ω','º','ﬂ','µ','˛','˝','›');
var
  xTexto : string;
  i : Integer;
begin
   xTexto := pTexto;
   for i:=1 to 38 do
     xTexto := StringReplace(xTexto, xCarEsp[i], xCarTro[i], [rfreplaceall]);
   //De acordo com o par‚metro aLimExt, elimina caracteres extras.
   if (pRemoveExtra) then
     for i:=1 to 48 do
       xTexto := StringReplace(xTexto, xCarExt[i], ' ', [rfreplaceall]);
   Result := xTexto;
end;

function TCtrlRemessaEletronicaDeb.Impersonate: Boolean;
var
  LogonType: Integer;
  LogonProvider: Integer;
  TokenHandle: THandle;
begin
  LogonType := LOGON32_LOGON_INTERACTIVE;
  LogonProvider := LOGON32_PROVIDER_DEFAULT;

  Result := LogonUser(PChar(_DecryptSTR(fUser, StKey, MtKey, AdKey)), nil, PChar(_DecryptSTR(fPw, StKey, MtKey, AdKey)),
                      LogonType, LogonProvider, TokenHandle);

  if Result then
    Result := ImpersonateLoggedOnUser(TokenHandle);
end;

function TCtrlRemessaEletronicaDeb._SelecionaMovimentoRemessaDebito(
  pConvenio, pFormaPagto: String; pDataIni,
  pDataFim: TDateTime): OleVariant;
var
  sSql: String;
begin
  sSql := 'SELECT MARCADO,                                                                                                                              ' +#13#10+
          '       CODDOCUMENTO,                                                                                                                         ' +#13#10+
          '       CODFORMA,                                                                                                                             ' +#13#10+
          '       CODPORTFORMA,                                                                                                                         ' +#13#10;

  //Everson Cunha - SIG104134 - Ini
  {case StrToInt(pConvenio) of
    104, 259: sSql := sSql + '       TO_CHAR(IDCONTRATOEMPTMO) AS DADOS_PART,                                                                          ' +#13#10;
    105, 261: sSql := sSql + '       TO_CHAR(MATRICULA) AS DADOS_PART,                                                                                 ' +#13#10;
    else
      sSql := sSql + ' '' '' AS DADOS_PART,  ' +#13#10; //Everson Cunha - SIG103661
  end;}
  //Everson Cunha - SIG104134 - Fim

  sSql := sSql + ' NUM_AP,                                                                                                                              ' +#13#10+
          '       NUM_DOC,                                                                                                                              ' +#13#10+
          '       NUMDOCUMENTO,                                                                                                                         ' +#13#10+
          '       CPF_CNPJ_MASC,                                                                                                                        ' +#13#10+
          '       RAZAOSOCIAL,                                                                                                                          ' +#13#10+
          '       VALOR,                                                                                                                                ' +#13#10+
          '       NOME_CONVENIO,                                                                                                                        ' +#13#10+
          '       DATAPROGRAMADA,                                                                                                                       ' +#13#10+
          '       FORMA_PAGTO,                                                                                                                          ' +#13#10+
          '       FLGPERMITELISTAFAVORECIDO,                                                                                                            ' +#13#10+
          '       FLGPERMITETITULOSPAGTO,                                                                                                               ' +#13#10+
          '       CAST(RPAD('' '', 250, '' '') AS VARCHAR2(250)) AS MSGERRO                                                                             ' +#13#10+ //Everson Cunha - SIG119696
          '  FROM (SELECT ''S'' MARCADO,                                                                                                                ' +#13#10+
          '     D.CODDOCUMENTO,                                                                                                                         ' +#13#10+
          '     D.CODFORMA,                                                                                                                             ' +#13#10+
          '     D.CODPORTFORMA,                                                                                                                         ' +#13#10;

  //Everson Cunha - SIG104134 - Ini
  {case StrToInt(pConvenio) of
    104, 259: sSql := sSql + ' HA.IDCONTRATOEMPTMO,                                                                                                          ' +#13#10;
    105, 261: sSql := sSql + ' DE.MATRICULA,                                                                                                                 ' +#13#10;
  end;}
  //Everson Cunha - SIG104134 - Fim

  sSql := sSql + '     D.NUMAPGR NUM_AP,                                                                                                                ' +#13#10+
          '     D.NODOCUMENTO NUM_DOC,                                                                                                                  ' +#13#10+
          '     REGEXP_REPLACE(P.NUMDOCUMENTO, ''\D'') NUMDOCUMENTO,                                                                                    ' +#13#10+
          '     CAST(                                                                                                                                   ' +#13#10+
          '     CASE LENGTH(REGEXP_REPLACE(P.NUMDOCUMENTO, ''\D''))                                                                                     ' +#13#10+
          '         WHEN 11 THEN                                                                                                                        ' +#13#10+
          '           regexp_replace(REGEXP_REPLACE(P.NUMDOCUMENTO, ''\D''), ''([0-9]{3})([0-9]{3})([0-9]{3})([0-9]{2})'',''\1.\2.\3-\4'')              ' +#13#10+
          '         WHEN 14 THEN                                                                                                                        ' +#13#10+
          '           regexp_replace(REGEXP_REPLACE(P.NUMDOCUMENTO, ''\D''), ''([0-9]{2})([0-9]{3})([0-9]{3})([0-9]{4})([0-9]{2})'',''\1.\2.\3/\4-\5'') ' +#13#10+
          '         ELSE                                                                                                                                ' +#13#10+
          '           REGEXP_REPLACE(P.NUMDOCUMENTO, ''\D'')                                                                                            ' +#13#10+
          '     END AS VARCHAR2(20)) CPF_CNPJ_MASC,                                                                                                     ' +#13#10+
          '     TRIM(P.RAZAOSOCIAL) RAZAOSOCIAL,                                                                                                        ' +#13#10+
          '     (SELECT SUM(DECODE(LANC.DEBCRE, ''C'',                                                                                                  ' +#13#10+
          '             DECODE(DOC.RECPAG, ''P'', LANC.VALOR, LANC.VALOR * -1),                                                                         ' +#13#10+
          '             DECODE(DOC.RECPAG, ''P'', LANC.VALOR * -1, LANC.VALOR))) AS VALOR                                                               ' +#13#10+
          '      FROM LANCTODOCUM LANC                                                                                                                  ' +#13#10+
          '      JOIN DOCUMENTO DOC ON DOC.CODDOCUMENTO = LANC.CODDOCUMENTO                                                                             ' +#13#10+
          '      WHERE D.CODDOCUMENTO = LANC.CODDOCUMENTO) VALOR,                                                                                       ' +#13#10+
          '     PO.DESCRICAO AS NOME_CONVENIO,                                                                                                          ' +#13#10+
          '     D.DATAPROGRAMADA,                                                                                                                       ' +#13#10+
          '     FO.DESCRICAO FORMA_PAGTO,                                                                                                               ' +#13#10+
          '     FO.FLGPERMITELISTAFAVORECIDO,                                                                                                           ' +#13#10+
          '     FO.FLGPERMITETITULOSPAGTO                                                                                                               ' +#13#10+
          'FROM DOCUMENTO D                                                                                                                             ' +#13#10+
          'JOIN PESSOA P ON P.IDPESSOA = D.IDFORCLI                                                                                                     ' +#13#10+
          'JOIN PORTADORFORMA PO ON PO.CODPORTFORMA = D.CODPORTFORMA                                                                                    ' +#13#10+
          //'JOIN LANCTODOCUM L ON L.CODDOCUMENTO = D.CODDOCUMENTO AND L.OPERACAO = 2                                                                     ' +#13#10+ //Everson Cunha - SIG104134
          'LEFT JOIN FORMARECPAG FO ON FO.CODFORMA = D.CODFORMA /*AND FO.FLGARQUIVO = ''S''*/                                                               ' +#13#10;

  //Everson Cunha - SIG104134 - Ini
  {case StrToInt(pConvenio) of
    104, 259: sSql := sSql + 'JOIN HMEENVIO HE ON HE.CODDOCUMENTO = D.CODDOCUMENTO                                                                           ' +#13#10+
          'JOIN HMEALL HA ON HA.idhistmovemptmo = HE.IDHISTMOVEMPTMO                                                                                    ' +#13#10;
    105, 261: sSql := sSql + 'JOIN DEPENTIT DE ON DE.IDTITULAR = D.IDFORCLI AND DE.IDTITULAR = DE.IDPESSOA                                                   ' +#13#10;
  end;}
  //Everson Cunha - SIG104134 - Fim

 sSql := sSql +
          'WHERE D.RECPAG = ''R''                                                                                                                       ' +#13#10+
          '      AND D.STATUS = ''0''                                                                                                                     ' +#13#10+
          '      AND NOT EXISTS (SELECT 1                                                                                                                 ' +#13#10+
          '                        FROM ARQUIVOPAGTO AP                                                                                                     ' +#13#10+
          '                        JOIN ARQUIVOXDOCUM AXD ON AXD.IDARQUIVOPAGTO = AP.IDARQUIVOPAGTO                                                         ' +#13#10+

          //Everson Cunha - SIG104134 - Ini
          //'                    LEFT JOIN DOCUMENTOXPESSOAS DP ON DP.IDDOCUMENTOXPESSOAS = AXD.ID_DOC_CODBARRAS_PESSOAS AND AXD.TIPO = 2                 ' +#13#10+
          //'                    LEFT JOIN DOCUMENTOXCODBARRAS DC ON DC.IDDOCUMENTOXCODBARRAS = AXD.ID_DOC_CODBARRAS_PESSOAS AND AXD.TIPO = 3             ' +#13#10+
          '                       WHERE AP.FLGENVIADO <> ''C'' -- Cancelado                                    ' +#13#10+
          //'                          AND DECODE(AXD.TIPO, 1, AXD.ID_DOC_CODBARRAS_PESSOAS, 2, DP.CODDOCUMENTO, 3, DC.CODDOCUMENTO) = D.CODDOCUMENTO)    ' +#13#10;
          '                         AND AXD.TIPO = 1 ' +#13#10+
          '                         AND AXD.ID_DOC_CODBARRAS_PESSOAS = D.CODDOCUMENTO) ' +#13#10;
          //Everson Cunha - SIG104134 - Fim

  if pConvenio <> '' then
    sSql := sSql + '      AND D.CODPORTFORMA = ' + quotedstr(pConvenio) + #13#10;

  if pFormaPagto <> '-1' then
    sSql := sSql + '   AND D.CODFORMA = ' + quotedstr(pFormaPagto) + #13#10;

  sSql := sSql + '   AND ((D.DATAPROGRAMADA >= TO_DATE(''' + DateToStr(pDataIni) + ''',''DD/MM/YYYY''))   ' + #13#10 +
    '   AND (D.DATAPROGRAMADA <= TO_DATE(''' + DateToStr(pDataFim) + ''',''DD/MM/YYYY''))))               ' + #13#10;

  sSql := sSql + 'WHERE VALOR > 0                                                                                                             ' + #13#10 ;

  //Everson Cunha - SIG104134 - Ini
  {case StrToInt(pConvenio) of
    104, 259: sSql := sSql + 'GROUP BY MARCADO, CODDOCUMENTO, CODFORMA, CODPORTFORMA, IDCONTRATOEMPTMO, NUM_AP, NUM_DOC, NUMDOCUMENTO, CPF_CNPJ_MASC,     ' + #13#10 +
                        '         RAZAOSOCIAL, VALOR, NOME_CONVENIO, DATAPROGRAMADA, FORMA_PAGTO, FLGPERMITELISTAFAVORECIDO, FLGPERMITETITULOSPAGTO  ' + #13#10;

    105, 261: sSql := sSql + 'GROUP BY MARCADO, CODDOCUMENTO, CODFORMA, CODPORTFORMA, MATRICULA, NUM_AP, NUM_DOC, NUMDOCUMENTO, CPF_CNPJ_MASC,            ' + #13#10 +
                        '         RAZAOSOCIAL, VALOR, NOME_CONVENIO, DATAPROGRAMADA, FORMA_PAGTO, FLGPERMITELISTAFAVORECIDO, FLGPERMITETITULOSPAGTO  ' + #13#10;
  end;}
  //Everson Cunha - SIG104134 - Fim

  sSql := sSql +'ORDER BY DATAPROGRAMADA, FORMA_PAGTO, RAZAOSOCIAL, NUM_DOC';

  Result := GetDataPacket(sSql);
  sqlText.Clear;
  sqlText.add(sSql);
  sqlText.SaveToFile(sPathArquivo + '\SQL_SelMovRemessaDebito.txt');
end;

function TCtrlRemessaEletronicaDeb._SelecionaDadosMovimento(pIdArqPagto: string; pCodPortForma: integer; pTipoDeb: string): OleVariant;
var
    sSQL: string;
begin
  sSQL := 'SELECT ROWNUM AS NSR,                                                                                                                               '+#13#10+
          '       DET.VLRTOTAL,                                                                                                                                '+#13#10+   //Everson Cunha - SIG112672
          '       DET.VALOR AS VALOR,                                                                                                                          '+#13#10+
          '       ''E'' || --REG,                                                                                                                              '+#13#10+
          //'       RPAD(DET.COD, 25, '' '') || --ID CLIENTE                                                                                                     '+#13#10+ //Everson Cunha - SIG103725 - SIACC
          //'       LPAD(DET.NUMDOCUMENTO, 25, ''0'') || --ID CLIENTE  /*MUDEI PRA LPAD E COLOQUEI ZEROS PQ EST¡ MANDANDO ASSIM NOS OPTANTES*/                   '+#13#10+ //Everson Cunha - SIG103725 - SIACC //Everson Cunha - SIG112949 - SIACC
          //'       RPAD(substr(DET.CONVENIO, -2) || DET.CONTACORRENTE || DET.NUMDOCUMENTO, 25, ''0'') || --ID_CLIENTE_CAIXA                                     '+#13#10+   //Everson Cunha - SIG103725 - SIACC //Everson Cunha - SIG112949 - SIACC //Everson Cunha - SIG116936
          '       RPAD(NVL(DET.ID_CLIENTE_CAIXA, substr(DET.CONVENIO, -2) || DET.CONTACORRENTE || DET.NUMDOCUMENTO), 25, ''0'') || --ID_CLIENTE_CAIXA          '+#13#10+ //Everson Cunha - SIG103725 - SIACC //Everson Cunha - SIG112949 - SIACC //Everson Cunha - SIG116936
          '       CASE                                                                                                                                         '+#13#10+
          '         WHEN DET.MASCARAAGENCIA IS NULL THEN                                                                                                       '+#13#10+
          '           CASE                                                                                                                                     '+#13#10+
          '             WHEN INSTR(DET.NUMAGENCIA, ''-'') = 0 THEN                                                                                             '+#13#10+
          '               LPAD(NVL(DET.NUMAGENCIA, 0), 4, ''0'')                                                                                               '+#13#10+
          '             ELSE                                                                                                                                   '+#13#10+
          '               LPAD(NVL(SUBSTR(DET.NUMAGENCIA, 0, INSTR(DET.NUMAGENCIA, ''-'')-1), 0), 4, ''0'')                                                    '+#13#10+
          '           END                                                                                                                                      '+#13#10+
          '         WHEN INSTR(DET.MASCARAAGENCIA, ''-'') = 0 THEN                                                                                             '+#13#10+
          '           LPAD(NVL(DET.NUMAGENCIA, 0), 4, ''0'')                                                                                                   '+#13#10+
          '         ELSE                                                                                                                                       '+#13#10+
          '           LPAD(NVL(SUBSTR(DET.NUMAGENCIA, 0, INSTR(TRIM(DET.MASCARAAGENCIA), ''-'')-1), 0), 4, ''0'')                                              '+#13#10+
          '       END ||--AGENCIA_CLI,                                                                                                                         '+#13#10+
          '       CASE                                                                                                                                         '+#13#10+
          '         WHEN DET.MASCARACC IS NULL THEN                                                                                                            '+#13#10+
          '           CASE                                                                                                                                     '+#13#10+
          //C·ssio Rovaroto - SIG n∫ 94625 - InÌcio
          '             WHEN INSTR(DET.CONTACORRENTE, ''-'') = 0 THEN LPAD(NVL(DET.CONTACORRENTE, 0), 11, ''0'')                                               '+#13#10+
          '             ELSE LPAD(NVL(SUBSTR(DET.CONTACORRENTE, 0, INSTR(DET.CONTACORRENTE, ''-'')-1), 0), 11, ''0'')                                          '+#13#10+
          '           END                                                                                                                                      '+#13#10+
          '         WHEN INSTR(DET.MASCARACC, ''-'') = 0 THEN LPAD(NVL(DET.CONTACORRENTE, 0), 11, ''0'')                                                       '+#13#10+
          '         ELSE                                                                                                                                       '+#13#10+
          '           LPAD(NVL(SUBSTR(DET.CONTACORRENTE, 0, INSTR(TRIM(DET.MASCARACC), ''-'')-1), 0), 11, ''0'')                                               '+#13#10+
          '       END || --CONTA_CLI,                                                                                                                          '+#13#10+
          '       CASE                                                                                                                                         '+#13#10+
          '         WHEN DET.MASCARACC IS NULL THEN                                                                                                            '+#13#10+
          '           CASE                                                                                                                                     '+#13#10+
          '             WHEN INSTR(DET.CONTACORRENTE, ''-'') = 0 THEN '' ''                                                                                    '+#13#10+
          '             ELSE NVL(SUBSTR(DET.CONTACORRENTE, INSTR(DET.CONTACORRENTE, ''-'')+1, 1), '' '')                                                       '+#13#10+
          '           END                                                                                                                                      '+#13#10+
          '         WHEN INSTR(DET.MASCARACC, ''-'') = 0 THEN '' ''                                                                                            '+#13#10+
          '         ELSE                                                                                                                                       '+#13#10+
          '           NVL(SUBSTR(DET.CONTACORRENTE, INSTR(TRIM(DET.MASCARACC), ''-''), 1), '' '')                                                              '+#13#10+
          '       END || ''  '' ||--DV_CC,                                                                                                                     '+#13#10+
          //C·ssio Rovaroto - SIG n∫ 94625 - Fim
          '       TO_CHAR(DET.DATAPROGRAMADA, ''YYYYMMDD'') ||--DT_VCTO,                                                                                       '+#13#10+
          '       LPAD(LTRIM(REPLACE(TO_CHAR(DET.VALOR, ''999999999999D99''), '','', '''')), 15, ''0'') ||--VALOR,                                             '+#13#10+
          '       ''03'' ||--TIP_MOEDA,                                                                                                                        '+#13#10+
          //'       RPAD(DET.IDARQUIVOPAGTO, 60, '' '') ||--RESERVADO EMPRESA,                                                                                    '+#13#10+  //Everson Cunha - SIG103725 - SIACC
          '       RPAD(LPAD(DET.IDARQUIVOPAGTO, 6, ''0'') || LPAD(DET.CODDOCARQ, 6, ''0'') || LPAD(DET.CODDOCUMENTO, 10, ''0''), 60, '' '') ||--RESERVADO EMPRESA,'+#13#10+  //Everson Cunha - SIG103725 - SIACC
          '       LPAD(ROWNUM, 6, ''0'') ||                                                                                                                    '+#13#10+
          '       RPAD('' '', 8) ||                                                                                                                            '+#13#10+
          '       LPAD(ROWNUM, 6, ''0'') ||                                                                                                                    '+#13#10;

          //Everson Cunha - SIG111426 - Ini
          if pTipoDeb = '0' then
            sSQL := sSQL + '       ''0'' DETALHE                                                                                                                                '+#13#10
          else if pTipoDeb = '1' then
            sSQL := sSQL + '       ''1'' DETALHE                                                                                                                                '+#13#10;
          //Everson Cunha - SIG111426 - Fim

          //Everson Cunha - SIG103935 - SIACC - Ini
          sSQL := sSQL +
          //'FROM (SELECT AX.IDARQUIVOPAGTO, AX.CODDOCARQ, AX.ID_DOC_CODBARRAS_PESSOAS CODDOCUMENTO,' + #13#10 +                     //Everson Cunha - SIG112672
          'FROM (SELECT DISTINCT AP.VLRTOTAL, AX.IDARQUIVOPAGTO, AX.CODDOCARQ, AX.ID_DOC_CODBARRAS_PESSOAS CODDOCUMENTO,' + #13#10 + //Everson Cunha - SIG112672
          '             TRIM(P.NUMDOCUMENTO) NUMDOCUMENTO, D.DATAPROGRAMADA,' + #13#10 +
          '             DADOS_BANCARIOS.MASCARAAGENCIA, DADOS_BANCARIOS.MASCARACC, AX.VALOR,' + #13#10 +
          '             DADOS_BANCARIOS.NUMBANCO, DADOS_BANCARIOS.NUMAGENCIA, DADOS_BANCARIOS.CONTACORRENTE' + #13#10 +
          '             , regexp_replace(PORT.NUMEMPRESABANCO, ''\D'') CONVENIO ' + #13#10 + //Everson Cunha - SIG112949
          '             , OPT.ID_CLIENTE_CAIXA                                  ' + #13#10 + //Everson Cunha - SIG116936
          '        FROM CM.ARQUIVOXDOCUM AX' + #13#10 +
          '        JOIN CM.ARQUIVOPAGTO AP ON AP.IDARQUIVOPAGTO = AX.IDARQUIVOPAGTO' + #13#10 + //Everson Cunha - SIG112672
          '        JOIN CM.DOCUMENTO D ON D.CODDOCUMENTO = AX.ID_DOC_CODBARRAS_PESSOAS AND AX.TIPO = 1 /*Se vier a usar os tipos 2 e 3 ter· que implementar*/' + #13#10 +
          '        JOIN CM.PORTADORFORMA PORT ON PORT.CODPORTFORMA = AP.CODPORTFORMA ' + #13#10 + //Everson Cunha - SIG112949
          '        JOIN CM.PESSOA P ON P.IDPESSOA  = D.IDFORCLI' + #13#10 +
          '        JOIN (SELECT CC.IDPESSOA, CC.IDCBANCARIA, BA.MASCARAAGENCIA, BA.MASCARACC,' + #13#10 +
          '                     NVL(CC.FLGCONTAPREF, 0) FLGCONTAPREF,' + #13#10 +
          '                     REGEXP_REPLACE(BA.NUMBANCO, ''\D'') NUMBANCO,' + #13#10 +
          '                     REGEXP_REPLACE(AG.NUMAGENCIA, ''\W'') NUMAGENCIA, ' + #13#10 +
          '                     REGEXP_REPLACE(CC.CONTACORRENTE, ''\D'') CONTACORRENTE' + #13#10 +
          '                FROM CM.CONTABANCARIA CC' + #13#10 +
          '                JOIN CM.AGENCIABANCARIA AG ON AG.IDPESSOA = CC.IDAGENCIA' + #13#10 +
          '                JOIN CM.BANCO BA ON BA.IDPESSOA= AG.IDBANCO) DADOS_BANCARIOS ON ' + #13#10;

          //Everson Cunha - SIG115364 - Ini
          {if pCodPortForma <> 261 then //Tratamento diferenciado para as rotinas que NAO gravam IDCBANCARIA na tabela cm.documento
          begin
            sSQL := sSQL + ' DADOS_BANCARIOS.IDCBANCARIA = D.IDCBANCARIA ' + #13#10
          end
          else
          begin
            sSQL := sSQL + ' DADOS_BANCARIOS.IDPESSOA = D.IDFORCLI AND DADOS_BANCARIOS.FLGCONTAPREF = 1 ' + #13#10;
          end;}

          case pCodPortForma of
            261: sSQL := sSQL + ' DADOS_BANCARIOS.IDPESSOA = D.IDFORCLI AND DADOS_BANCARIOS.FLGCONTAPREF = 1 ' + #13#10;
            295: sSQL := sSQL + ' DADOS_BANCARIOS.IDPESSOA = D.IDFORCLI AND DADOS_BANCARIOS.FLGCONTAPREF = 1 ' + #13#10;
          else
            sSQL := sSQL + ' DADOS_BANCARIOS.IDCBANCARIA = D.IDCBANCARIA ' + #13#10;
          end;
          //Everson Cunha - SIG115364 - Fim

          //Everson Cunha - SIG116936 - Ini
          sSQL := sSQL +
          'LEFT JOIN CORE_CADASTRO.CONTA_BANCARIA_DEBITO_AUTO OPT ON OPT.ID_PORTADOR_FORMA = PORT.CODPORTFORMA AND TRIM(OPT.ID_CLIENTE_FUNCEF) = TRIM(P.NUMDOCUMENTO)  ' + #13#10 +
          '                                                   AND OPT.NU_AGENCIA = SUBSTR(DADOS_BANCARIOS.NUMAGENCIA, 0, 4) AND OPT.NU_CONTACORRENTE = DADOS_BANCARIOS.CONTACORRENTE ' + #13#10;
          //Everson Cunha - SIG116936 - Fim

          sSQL := sSQL + 'WHERE AX.IDARQUIVOPAGTO = ' + pIdArqPagto + #13#10 +
                         '  AND REGEXP_REPLACE(DADOS_BANCARIOS.NUMBANCO, ''\D'') = ''104'') DET ';

          (*'  FROM (SELECT AX.IDARQUIVOPAGTO,                                                                                                                   '+#13#10+
          '               AX.CODDOCARQ,                                                                                                                        '+#13#10+
          '               DECODE(AX.TIPO, 1, D1.CODDOCUMENTO, 2, D2.IDDOCUMENTOXPESSOAS) COD,                                                                  '+#13#10+
          '               DECODE(AX.TIPO, 1, D1.NUMDOCUMENTO, 2, D2.NUMDOCUMENTO) NUMDOCUMENTO,                                                                '+#13#10+ //Everson Cunha - SIG103725 - SIACC
          '               DECODE(AX.TIPO, 1, D1.DATAPROGRAMADA, 2, D2.DATAPROGRAMADA) DATAPROGRAMADA,                                                          '+#13#10+
          '               DECODE(AX.TIPO, 1, D1.MASCARACC, 2, D2.MASCARACC) MASCARACC,                                                                         '+#13#10+
          '               DECODE(AX.TIPO, 1, D1.MASCARAAGENCIA, 2, D2.MASCARAAGENCIA) MASCARAAGENCIA,                                                          '+#13#10+
          '               AX.VALOR,                                                                                                                            '+#13#10+
          '               REGEXP_REPLACE(DECODE(AX.TIPO, 1, D1.NUMBANCO, 2, D2.NUMBANCO), ''\D'') NUMBANCO,                                                    '+#13#10+
          '               CASE AX.TIPO                                                                                                                         '+#13#10+
          '                 WHEN ''1'' THEN REGEXP_REPLACE(D1.NUMAGENCIA, ''\W'')                                                                              '+#13#10+
          '                 WHEN ''2'' THEN DECODE(D2.FLGIMPORTADO, ''N'', REGEXP_REPLACE(D2.NUMAGENCIA, ''\W''), REGEXP_REPLACE(D2.NUMAGENCIA, ''\s''))       '+#13#10+
          '               END NUMAGENCIA,                                                                                                                      '+#13#10+
          '               CASE AX.TIPO                                                                                                                         '+#13#10+
          '                 WHEN ''1'' THEN REGEXP_REPLACE(D1.CONTACORRENTE, ''\D'')                                                                           '+#13#10+
          '                 WHEN ''2'' THEN DECODE(D2.FLGIMPORTADO, ''N'', REGEXP_REPLACE(D2.CONTACORRENTE, ''\D''), REGEXP_REPLACE(D2.CONTACORRENTE, ''\s'')) '+#13#10+
          '               END CONTACORRENTE                                                                                                                    '+#13#10+
          '          FROM ARQUIVOXDOCUM AX                                                                                                                     '+#13#10+
          '          LEFT JOIN (SELECT DI1.CODDOCUMENTO, DI1.DATAPROGRAMADA, NVL(P.RAZAOSOCIAL, P.NOME) RAZAOSOCIAL,                                           '+#13#10+
          '                            B.MASCARAAGENCIA, B.MASCARACC, C.TIPOCONTA, B.NUMBANCO, A.NUMAGENCIA, C.CONTACORRENTE                                   '+#13#10+
          '                            , TRIM(P.NUMDOCUMENTO) NUMDOCUMENTO                                                                                     '+#13#10+ //Everson Cunha - SIG103725 - SIACC
          '                       FROM DOCUMENTO DI1                                                                                                           '+#13#10+
          '                       JOIN PESSOA P ON P.IDPESSOA = DI1.IDFORCLI                                                                                   '+#13#10;

          //C·ssio Rovaroto - SIG n∫ 102320 - InÌcio
          //if pCodPortForma = -1 then
          //  sSQL := sSQL + '      JOIN CONTABANCARIA C ON C.IDCBANCARIA = DI1.IDCBANCARIA                                                                      '+#13#10;
          //else
          //  sSQL := sSQL + '      JOIN CONTABANCARIA C ON C.IDPESSOA = DI1.IDFORCLI AND C.FLGCONTAPREF = 1 AND C.TIPOCONTA IN (1,3)                            '+#13#10;
          //sSQL := sSQL + '      JOIN CONTABANCARIA C ON C.IDPESSOA = DI1.IDFORCLI AND C.FLGCONTAPREF = 1                                                       '+#13#10;  //Everson Cunha - SIG103725 - SIACC
          sSQL := sSQL + '      JOIN CONTABANCARIA C ON C.IDPESSOA = DI1.IDFORCLI AND C.IDCBANCARIA = DI1.IDCBANCARIA                                          '+#13#10;    //Everson Cunha - SIG103725 - SIACC
		  //C·ssio Rovaroto - SIG n∫ 102320 - Fim
          sSQL := sSQL + '        JOIN AGENCIABANCARIA A ON C.IDAGENCIA = A.IDPESSOA                                                                           '+#13#10+
          '                       JOIN BANCO B ON B.IDPESSOA = A.IDBANCO) D1 ON D1.CODDOCUMENTO = AX.ID_DOC_CODBARRAS_PESSOAS AND AX.TIPO = 1                  '+#13#10+
          '          LEFT JOIN (SELECT DP.IDDOCUMENTOXPESSOAS, DI2.DATAPROGRAMADA, DP.RAZAOSOCIAL,                                                             '+#13#10+
          '                            MANUAL.MASCARAAGENCIA, MANUAL.MASCARACC, DP.TIPOCONTA, DP.NUMBANCO, DP.NUMAGENCIA,                                      '+#13#10+
          '                            DP.NUMOPERACAO || DP.NUMCONTA CONTACORRENTE,                                                                            '+#13#10+
          '                            DP.FLGIMPORTADO                                                                                                         '+#13#10+
          '                            , TRIM(P2.NUMDOCUMENTO) NUMDOCUMENTO                                                                                    '+#13#10+ //Everson Cunha - SIG103725 - SIACC
          '                       FROM DOCUMENTO DI2                                                                                                           '+#13#10+
          '                       JOIN PESSOA P2 ON P2.IDPESSOA = DI2.IDFORCLI                                                                                 '+#13#10+ //Everson Cunha - SIG103725 - SIACC
          '                       JOIN DOCUMENTOXPESSOAS DP ON DI2.CODDOCUMENTO = DP.CODDOCUMENTO                                                              '+#13#10+
          '                       LEFT JOIN (SELECT B.MASCARACC, B.MASCARAAGENCIA, C.IDCBANCARIA                                                               '+#13#10+
          '                                    FROM CONTABANCARIA C                                                                                            '+#13#10+
          '                                    JOIN AGENCIABANCARIA A ON C.IDAGENCIA = A.IDPESSOA                                                              '+#13#10+
          '                                    JOIN BANCO B ON B.IDPESSOA = A.IDBANCO) MANUAL ON MANUAL.IDCBANCARIA = DP.IDCBANCARIA) D2                       '+#13#10+
          '                 ON D2.IDDOCUMENTOXPESSOAS = AX.ID_DOC_CODBARRAS_PESSOAS AND AX.TIPO = 2                                                            '+#13#10+
          '         WHERE AX.TIPO IN (1, 2) /*1=DOCUMENTO, 2=LISTA DE PESSOAS*/                                                                                '+#13#10+
          '           AND REGEXP_REPLACE(DECODE(AX.TIPO, 1, D1.NUMBANCO, 2, D2.NUMBANCO), ''\D'') = ''104''                                                    '+#13#10+
          '           AND AX.IDARQUIVOPAGTO = ' + pIdArqPagto + ') DET                                                                                         ';*)

          //Everson Cunha - SIG103935 - SIACC - Fim

  Result := GetDataPacket(sSQL);
  sqlText.Clear;
  sqlText.add(sSql);
  sqlText.SaveToFile(sPathArquivo + '\SQL_SelecionaDadosMovimento.txt');
end;

function TCtrlRemessaEletronicaDeb._GetArquivoRetorno(pCodPortForma: string; sNomeArquivo: string): OleVariant;
var
  sSQL: string;
begin
  sSQL :=  'SELECT A.IDARQUIVOPAGTO,  '+ #13#10 +
           '       P.PATHARQUIVORET AS CAMINHOARQ, ' +#13#10+
           '       SUBSTR(A.NOMEARQTXT, 1, LENGTH(A.NOMEARQTXT)-3) || ''ret'' AS ARQUIVO,' +#13#10+
           '       LPAD(A.NSA, 6, ''0'') AS NSA' +#13#10+
           '  FROM ARQUIVOPAGTO A' +#13#10+
           '  JOIN PORTADORFORMA P ON P.CODPORTFORMA = A.CODPORTFORMA' +#13#10+
           ' WHERE A.CODPORTFORMA = ' + pCodPortForma +#13#10+
           '   AND A.FLGENVIADO <> ''N'' '+#13#10;
  //if sNomeArquivo = EmptyStr then
  //  sSQL := sSQL +  '   AND A.FLGENVIADO = ''S'' '
  //else
  if sNomeArquivo <> EmptyStr then
    sSQL := sSQL + '   AND SUBSTR(A.NOMEARQTXT, 1, LENGTH(A.NOMEARQTXT)-4) = ' + QuotedStr(sNomeArquivo) +#13#10+
                   '   AND A.FLGENVIADO = ''S'' ';

  Result := GetDataPacket(sSQL);
end;

end.

