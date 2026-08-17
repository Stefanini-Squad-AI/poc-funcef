unit uCtrlConciliaCPMF;

interface

Uses SysUtils, Controls, Classes, DbClient, uCmControlObject, DConciliaCPMFMT,
     uFuncaoGeral, uCtrlDocumento, uCtrlImpostoRetido, uCtrlBaixaDocumentos,
     uCmSqlParams, uDiasUteis;

Type
  TCtrlConciliaCPMF = Class(TCmControlObject)

  private
    _Documento: TCtrlDocumento;
    _ImpostoRetido: TCtrlImpostoRetido;
    _BaixaDocumentos: TCtrlBaixaDocumentos;
    _FuncaoGeral: TFuncaoGeral;
    _DiasUteis: TDiasUteis;

    _CdsLotes: TClientDataSet;
    _CdsLotesBaixa: TClientDataSet;

    _iCodCidade, _iCodPais: LongInt;
    _sEstado: String;

    fLugarBaixaFinanc: String;
    FIdPessoa: Integer;
    FDtmConciliaCPMFMT: TDtmConciliaCPMFMT;
    procedure SetIdPessoa(const Value: Integer);
    procedure SetDtmConciliaCPMFMT(const Value: TDtmConciliaCPMFMT);
    procedure CalculaValor(rValPercent: Double);
    procedure AtualizaDocs(SqlRegistros, SqlUpdate: TCMSqlParams;
        bAtualizaData: Boolean);
    function IsCpmfConsistente: Boolean;
    function GetDataLancDocImposto(DataPagto: TDateTime): TDateTime;
    procedure AtualizaDataImposto(bLoteManual: Boolean; iNumLote: Integer; dData: TDateTime);
  protected
    procedure AfterInitialize; Override;
  public
    Constructor Create; Override;
    Destructor Destroy; Override;

    (* Monta ClientDataSets - SELECTS *)
    function SelLotes(iIdForCli, iNumLote, iTipoSelecao,
      iCodPortador: Integer; dDataProgramada: TDateTime; Var rValPrev: Double; rValPercent: Double): OleVariant;
    function SelLotesVazios: OleVariant;
    function SelLotesBaixa(dDataProgBaixa: TDateTime; iCodPortForma, iIdForCli, iNumLoteBaixa: Integer): OleVariant;

    (* Processamentos *)
    function AlteraAliquota(OvManutCpmf: OleVariant; NewValue: Double): Boolean;
    function Recalcula(OvLotes: OleVariant; iIdEspAcesso, iIdUsuario, iPlanoConta,
       iIdModulo: Integer; bUsaPlanoPatro, bLancaContab, bLancaPartidaDobrada: Boolean;
       cRecPag: Char): Boolean;
    function BaixaCpmf(ovLotesBaixa: OleVariant; iIdForCli, iCodPortForma,
    iIdModulo, iIdUsuario, iIdEspAcesso, iPlano: Integer; dDataBaixa: TDateTime;
    bUsaPlanoPatro, bLancaContab, bPartidaDobrada: Boolean): Boolean;
    function ProcessaConciliaCPMF(OvLotes: OleVariant; bReprogramaNaoConciliados: Boolean): Boolean;
    function AlteraDataRetencao(OvLote: OleVariant; iNumLote: Integer; dData: TDateTime): Boolean;

    property IdPessoa: Integer read FIdPessoa write SetIdPessoa;
    property LugarBaixaFinanc: String read fLugarBaixaFinanc;
    property DtmConciliaCPMFMT: TDtmConciliaCPMFMT read FDtmConciliaCPMFMT write SetDtmConciliaCPMFMT;
  end;


implementation

{ TCtrlConciliaCPMF }

Uses uCmTypes, FBaixaCPMFMT, Forms, uCMMath, JclMath, uCMFileUtils;

procedure TCtrlConciliaCPMF.AfterInitialize;
begin
  inherited;
  _FuncaoGeral.InitializeAs(Self);
  _FuncaoGeral.OpenTransaction := false;

  _Documento.InitializeAs(Self);
  _Documento.OpenTransaction := false;

  _ImpostoRetido.InitializeAs(Self);
  _ImpostoRetido.OpenTransaction := false;

  _DiasUteis.InitializeAs(Self);
  _DiasUteis.OpenTransaction := false;

  _BaixaDocumentos.InitializeAs(Self);
  _BaixaDocumentos.OpenTransaction := false;
end;

function TCtrlConciliaCPMF.AlteraAliquota(
  OvManutCpmf: OleVariant; NewValue: Double): Boolean;
begin
  if ConnectionSide = cnsClient then
  begin
     Result := Connection.AppServer.AlteraAliquota( OvManutCpmf, NewValue );

     if not Result then
       MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
     Try
        StartTransaction;

        _Cds.Data := OvManutCpmf;

        With _Cds Do
        Begin
           First;
           While Not Eof Do
           Begin
             If (FieldByName('ALTERA').AsInteger = 1) Then
             Begin
                FDtmConciliaCPMFMT.SQLUpdFaixaAgreg.Prepare;
                FDtmConciliaCPMFMT.SQLUpdFaixaAgreg.Params[0].AsFloat := NewValue;
                FDtmConciliaCPMFMT.SQLUpdFaixaAgreg.Params[1].AsFloat := FieldByName('NUMFAIXA').AsFloat;

                if not ExecSQL(FDtmConciliaCPMFMT.SQLUpdFaixaAgreg.SQLChanged,True) then raise Exception.Create(MessageInfo);
             End;
             Next;
           End;

           Close;
        End;

        Commit;

        Result := True;
     except
        On E:Exception Do
         Begin
            Rollback;
            Result := False;
            MessageInfo := E.Message;
         End;
     End;
  end;
end;

function TCtrlConciliaCPMF.GetDataLancDocImposto(
  DataPagto: TDateTime): TDateTime;
Var
   DataFeriado :TDateTime;
   bExisteFeriado :Boolean;
begin
   Result :=  DataPagto + 7;

   DataFeriado := Result;
   bExisteFeriado := True;

   While bExisteFeriado Do
   Begin
     bExisteFeriado := False;

     If _DiasUteis.Feriado(DataFeriado,_iCodCidade,_iCodPais,_sEstado,True,False) Then
     Begin
        DataFeriado := _DiasUteis.UltDiaUtilAnterior(DataFeriado,_iCodCidade,_iCodPais,_sEstado,True,False,False);
        bExisteFeriado := True;
     End
     Else
     Begin
        If _DiasUteis.Feriado(DataFeriado,_iCodCidade,_iCodPais,_sEstado,True,True) Then
        Begin
           DataFeriado := _DiasUteis.PrimeiroDiaUtilPosterior(DataFeriado,_iCodCidade,_iCodPais,_sEstado,True,False,False);
           bExisteFeriado := True;
        End;
     End;

     If ((DataFeriado - 2) < DataPagto) Then DataFeriado := Result + 7;
   End;

   If (Result <> DataFeriado) Then Result := DataFeriado;
end;

function TCtrlConciliaCPMF.IsCpmfConsistente: Boolean;
begin
  Result := (FormatFloat('#,##0.00',_CdsLotes.FieldByName('VALCALCULADO').AsFloat) = FormatFloat('#,##0.00',_CdsLotes.FieldByName('VALORAUDITORIA').AsFloat)) And
            (FormatFloat('#,##0.00',_CdsLotes.FieldByName('VALCALCULADO').AsFloat) = FormatFloat('#,##0.00',_CdsLotes.FieldByName('VALPREVISTO').AsFloat))
end;

procedure TCtrlConciliaCPMF.AtualizaDocs(SqlRegistros, SqlUpdate: TCMSqlParams;
  bAtualizaData: Boolean);
begin
  SqlRegistros.Prepare;
  SqlRegistros.Params[0].AsInteger := _CdsLotes.FieldByName('NUMLOTE').AsInteger;
  SqlRegistros.Open;

  SqlRegistros.ClientDataSet.First;
  While Not SqlRegistros.ClientDataSet.Eof Do
  Begin
    SqlRegistros.ClientDataSet.Edit;

    If bAtualizaData And IsCpmfConsistente Then
    Begin
      SqlRegistros.ClientDataSet.FieldByName('DATAVENCTO').AsDateTime := GetDataLancDocImposto(SqlRegistros.ClientDataSet.FieldByName('DATAVENCTO').AsDateTime);
      SqlRegistros.ClientDataSet.FieldByName('DATAPROGRAMADA').AsDateTime := GetDataLancDocImposto(SqlRegistros.ClientDataSet.FieldByName('DATAPROGRAMADA').AsDateTime);
      SqlRegistros.ClientDataSet.FieldByName('FLGCONFIRMARECPAG').AsString := 'S';
    End
    Else
      SqlRegistros.ClientDataSet.FieldByName('FLGCONFIRMARECPAG').AsString := _CdsLotes.FieldByName('FLGCONFIRMARECPAG').AsString;

    SqlRegistros.ClientDataSet.Post;

    SqlUpdate.Prepare;
    SqlUpdate.ParamByName('FLGCONFIRMARECPAG').AsString := SqlRegistros.ClientDataSet.FieldByName('FLGCONFIRMARECPAG').AsString;
    SqlUpdate.ParamByName('DATAVENCTO').AsDate := SqlRegistros.ClientDataSet.FieldByName('DATAVENCTO').AsDateTime;
    SqlUpdate.ParamByName('DATAPROGRAMADA').AsDate := SqlRegistros.ClientDataSet.FieldByName('DATAPROGRAMADA').AsDateTime;
    SqlUpdate.ParamByName('CODDOCUMENTO').AsInteger := SqlRegistros.ClientDataSet.FieldByName('CODDOCUMENTO').AsInteger;

    if not ExecSQL(SqlUpdate.SqlChanged) then raise Exception.Create(MessageInfo);

    SqlRegistros.ClientDataSet.Next;
  End;
end;

function TCtrlConciliaCPMF.BaixaCpmf(ovLotesBaixa: OleVariant; iIdForCli, iCodPortForma,
    iIdModulo, iIdUsuario, iIdEspAcesso, iPlano: Integer; dDataBaixa: TDateTime;
    bUsaPlanoPatro, bLancaContab, bPartidaDobrada: Boolean): Boolean;

Var
  rValorCpmf :Double;

  iNumDocLancado: Integer;
  sNumLoteManual, sNumLoteAutomatico: String;

  (****************************************************************************)
  procedure BaixaLote(Data: TDateTime; iNumChqBordero: Integer);
  var
    rValorDiferenca: Double;
    sDebCreTeste, sSqlDeb, sSqlCred :String;
    iCodLancFinancArredonda, iCodDocumentoArredonda, iPlnCodigoArredonda, idRateioDocumArredonda,
    idRateioFinancArredonda: Integer;

    (**************************************************************************)
    procedure ArredondaLancamentosContabeis(vPlnCodigo: Integer);
    Begin
         _Cds.Data := GetDataPacket('SELECT LACDEBCRE, LACNUMLAN FROM LANCAMENTO WHERE PLNCODIGO = ' + IntToStr(vPlnCodigo));

         sDebCreTeste := '';
         sSqlDeb := '';
         sSqlCred := '';

         While Not _Cds.Eof DO
         Begin
            If sDebCreTeste <> _Cds.FieldByName('LACDEBCRE').ASString Then
            Begin
               sDebCreTeste := _Cds.FieldByName('LACDEBCRE').ASString;

               If sSqlDeb = '' Then
                  sSqlDeb := 'UPDATE LANCAMENTO SET LACVALOR = LACVALOR + ' + FloatToStrCM(rValorDiferenca) + ' WHERE PLNCODIGO = ' + IntToStr(vPlnCodigo) + ' AND LACNUMLAN = ' + _Cds.FieldByName('LACNUMLAN').ASString + ' AND LACDEBCRE = ' + QuotedStr(_Cds.FieldByName('LACDEBCRE').ASString)
               Else
                  sSqlCred := 'UPDATE LANCAMENTO SET LACVALOR = LACVALOR + ' + FloatToStrCM(rValorDiferenca) + ' WHERE PLNCODIGO = ' + IntToStr(vPlnCodigo) + ' AND LACNUMLAN = ' + _Cds.FieldByName('LACNUMLAN').ASString + ' AND LACDEBCRE = ' + QuotedStr(_Cds.FieldByName('LACDEBCRE').ASString);
            End;

            If (sSqlCred <> '') And (sSqlDeb <> '') Then
               _Cds.Last
            Else
               _Cds.Next;
         End;
         _Cds.Close;

         (** 0 **)
         {** Faz update do arredondamento na contabilidade do lançamento de baixa **}
         If (sSqlCred <> '') And (sSqlDeb <> '') Then
         Begin
            if not ExecSQL(sSqlDeb) then raise Exception.Create(MessageInfo);
            if not ExecSQL(sSqlCred) then raise Exception.Create(MessageInfo);
            if not ExecSQL('UPDATE PLANILHA SET PLNTOTDEB = PLNTOTDEB + ' + FloatToStrCM(rValorDiferenca) + ', PLNTOTCRE = PLNTOTCRE + ' + FloatToStrCM(rValorDiferenca) +  ' WHERE PLNCODIGO = ' + IntToStr(vPlnCodigo)) then raise Exception.Create(MessageInfo);
         End;
    End;
    (****************************************************************************)
  begin
    inherited;
    FDtmConciliaCPMFMT.SQLDocsBaixaLote.SQL.Text :=
        'SELECT ' + {Documentos de Baixa Automática}
        '  DOCUMENTO.CODDOCUMENTO, LANCTODOCUM.NUMLANCTO, DOCUMENTO.IDUSUARIOINCLUSAO, ' +
        '  PESSOA.RAZAOSOCIAL AS NOME, DOCUMENTO.DATAPROGRAMADA, ' +
        '  DOCUMENTO.IDPESSOA, DOCUMENTO.DATAVENCTO, DOCUMENTO.NODOCUMENTO, ' +
        '  DOCUMENTO.COMPLDOCUMENTO, DOCUMENTO.OPERACAO, ' +
        '  IMPOSTORETIDO.VLRRETIDO AS VALORIMPOSTO, ' +
        '  LANCTODOCUM.VALOR AS VALOR, ' +
        '  (0) VALOROUTRAMOEDA, DOCUMENTO.CODCENTROCUSTO, DOCUMENTO.PLACONTA, '+
        '  (''D'') AS DEBCRE, ' +
        '  DOCUMENTO.CODSUBCONTA, DOCUMENTO.IDFORCLI, DOCUMENTO.CODGRUPOCNAB, DOCUMENTO.NOSSONUMERO, ' +
        '  IMPOSTORETIDO.VLRRETIDO AS VLRLIQUIDO, DOCUMENTO.CODTIPDOC ' +
        'FROM ' +
        '  DOCUMENTO, ' +
        '  PESSOA, ' +
        '  LANCTODOCUM, ' +
        '  IMPOSTORETIDO ' +
        'WHERE ' +
        '  IMPOSTORETIDO.NUMLOTE IN (' + sNumLoteAutomatico + ') AND ' +
        '  IMPOSTORETIDO.CODDOCLANCADO = DOCUMENTO.CODDOCUMENTO AND ' +
        '  DOCUMENTO.IDFORCLI = PESSOA.IDPESSOA AND ' +
        '  DOCUMENTO.CODDOCUMENTO = LANCTODOCUM.CODDOCUMENTO AND ' +
        '  DOCUMENTO.OPERACAO = LANCTODOCUM.OPERACAO ' +
        'UNION ' + {Documentos de baixa manual}
        'SELECT ' +
        '  DOCUMENTO.CODDOCUMENTO, LANCTODOCUM.NUMLANCTO, DOCUMENTO.IDUSUARIOINCLUSAO, ' +
        '  PESSOA.RAZAOSOCIAL AS NOME, DOCUMENTO.DATAPROGRAMADA, ' +
        '  DOCUMENTO.IDPESSOA, DOCUMENTO.DATAVENCTO, DOCUMENTO.NODOCUMENTO, ' +
        '  DOCUMENTO.COMPLDOCUMENTO, DOCUMENTO.OPERACAO, ' +
        '  IMPOSTORETIDO.VLRRETIDO AS VALORIMPOSTO, ' +
        '  LANCTODOCUM.VALOR AS VALOR, ' +
        '  (0) AS VALOROUTRAMOEDA, DOCUMENTO.CODCENTROCUSTO, DOCUMENTO.PLACONTA,  ' +
        '  (''D'') AS DEBCRE, ' +
        '  DOCUMENTO.CODSUBCONTA, DOCUMENTO.IDFORCLI, DOCUMENTO.CODGRUPOCNAB, DOCUMENTO.NOSSONUMERO, ' +
        '  IMPOSTORETIDO.VLRRETIDO AS VLRLIQUIDO, DOCUMENTO.CODTIPDOC ' +
        'FROM ' +
        '  DOCUMENTO, ' +
        '  PESSOA, ' +
        '  LANCTODOCUM, ' +
        '  IMPOSTORETIDO ' +
        'WHERE ' +
        '  IMPOSTORETIDO.NUMLOTEMANUAL IN (' + sNumLoteManual + ') AND ' +
        '  IMPOSTORETIDO.CODDOCLANCADO = DOCUMENTO.CODDOCUMENTO AND ' +
        '  DOCUMENTO.IDFORCLI = PESSOA.IDPESSOA AND ' +
        '  DOCUMENTO.CODDOCUMENTO = LANCTODOCUM.CODDOCUMENTO AND ' +
        '  DOCUMENTO.OPERACAO = LANCTODOCUM.OPERACAO ' +
        'UNION ' + {Documento de Arredondamento lançado}
        'SELECT ' +
        '  DOCUMENTO.CODDOCUMENTO, LANCTODOCUM.NUMLANCTO, DOCUMENTO.IDUSUARIOINCLUSAO, ' +
        '  PESSOA.RAZAOSOCIAL AS NOME, DOCUMENTO.DATAPROGRAMADA, ' +
        '  DOCUMENTO.IDPESSOA, DOCUMENTO.DATAVENCTO, DOCUMENTO.NODOCUMENTO, ' +
        '  DOCUMENTO.COMPLDOCUMENTO, DOCUMENTO.OPERACAO, ' +
        '  LANCTODOCUM.VALOR AS VALORIMPOSTO, ' +
        '  LANCTODOCUM.VALOR AS VALOR, ' +
        '  LANCTODOCUM.VALOROUTRAMOEDA, DOCUMENTO.CODCENTROCUSTO, DOCUMENTO.PLACONTA,  ' +
        '  (''D'') AS DEBCRE, ' +
        '  DOCUMENTO.CODSUBCONTA, DOCUMENTO.IDFORCLI, DOCUMENTO.CODGRUPOCNAB, DOCUMENTO.NOSSONUMERO, ' +
        '  LANCTODOCUM.VLRLIQUIDO, DOCUMENTO.CODTIPDOC ' +
        'FROM ' +
        '  DOCUMENTO, ' +
        '  PESSOA, ' +
        '  LANCTODOCUM ' +
        'WHERE ' +
        '  DOCUMENTO.CODDOCUMENTO = ' + IntToStr(iNumDocLancado) + ' AND ' +
        '  DOCUMENTO.IDFORCLI = PESSOA.IDPESSOA AND ' +
        '  DOCUMENTO.CODDOCUMENTO = LANCTODOCUM.CODDOCUMENTO AND ' +
        '  DOCUMENTO.OPERACAO = LANCTODOCUM.OPERACAO';


    {** Verifica se existe diferença de arredondamento a ser lançada para a CPMF **}
    FDtmConciliaCPMFMT.SQLVerArredBaixa.SQL.Text := FDtmConciliaCPMFMT.SQLDocsBaixaLote.SQL.Text;
    FDtmConciliaCPMFMT.SQLVerArredBaixa.SQL.Insert(0,'SELECT (ROUND(SUM(VALORIMPOSTO),2) - SUM(ROUND(VALOR,2))) AS DIFERENCA FROM (');
    FDtmConciliaCPMFMT.SQLVerArredBaixa.SQL.Add(')');
    FDtmConciliaCPMFMT.SQLVerArredBaixa.open;

    If FDtmConciliaCPMFMT.CdsVerArredBaixa.IsEmpty Then
       rValorDiferenca := 0
    Else
       rValorDiferenca := FDtmConciliaCPMFMT.CdsVerArredBaixa.FieldByName('DIFERENCA').AsFloat;

    FDtmConciliaCPMFMT.CdsVerArredBaixa.Close;
    {** Fim da verificação **}

    FDtmConciliaCPMFMT.SQLDocsBaixaLote.Open;
    FDtmConciliaCPMFMT.CdsDocsBaixaLote.First;

    iCodDocumentoArredonda := FDtmConciliaCPMFMT.CdsDocsBaixaLote.FieldByName('CODDOCUMENTO').AsInteger;

    (* Baixa os documento com a função de baixa do CtrBaixaDocumentos  *)
    if not _BaixaDocumentos.ProcessaBaixaManual(false, iCodPortForma,
           GetSequence('NUMCHQBORD'), FDtmConciliaCPMFMT.CdsDocsBaixaLote.Data,
           dDataBaixa, TSistemaLancto(iIdModulo - 3), False, iIdUsuario, fIdPessoa,
           iIdEspAcesso, iPlano, bUsaPlanoPatro, bLancaContab, bPartidaDobrada, false, 0) then
           raise Exception.Create(_BaixaDocumentos.MessageInfo);

    {** Caso exista diferença de lançamento da cpmf, é corrigida a contabilização da baixa da mesma **}
    If (_BaixaDocumentos.PlnCodigoBaixa > 0) And (Not IsFloatZero(rValorDiferenca)) Then
    Begin
       (** 0 **)
       {** Arredonda Lançamentos Contábeis da baixa **}
       ArredondaLancamentosContabeis(_BaixaDocumentos.PlnCodigoBaixa);

       (** 1 **)
       {** Faz update do arredondamento no Rateiofinanc do lançamento de baixa **}
       _Cds.Data := GetDataPacket('SELECT CODLANCFINANC FROM RECBTOPAGTO WHERE CODDOCUMENTO = ' + IntToStr(iCodDocumentoArredonda));
       iCodLancFinancArredonda := _Cds.FieldByName('CODLANCFINANC').AsInteger;

       if not ExecSql('UPDATE MOVIMFINANC SET VALORLANCFINAN = VALORLANCFINAN + ' + FloatToStrCM(rValorDiferenca) + ' WHERE CODLANCFINANC = ' + IntToStr(iCodLancFinancArredonda)) then
          raise Exception.Create(MessageInfo);

       _Cds.Data := GetDataPacket('SELECT MIN(IDRATEIOFINANC) AS IDRATEIOFINANC FROM RATEIOFINANC WHERE CODLANCFINANC = ' + IntToStr(iCodLancFinancArredonda));
       idRateioFinancArredonda := _Cds.FieldByName('IDRATEIOFINANC').AsInteger;

       if not ExecSql('UPDATE RATEIOFINANC SET VALOR = VALOR + ' + FloatToStrCM(rValorDiferenca) + ' WHERE IDRATEIOFINANC = ' + IntToStr(idRateioFinancArredonda)) then
          raise Exception.Create(MessageInfo);

       (** 2 **)
       {** faz update do arredondamento no RateioDocum de um documento da CPMF **}
       _Cds.Data := GetDataPacket('SELECT MIN(IDRATEIODOCUM) AS IDRATEIODOCUM FROM RATEIODOCUM WHERE CODDOCUMENTO = ' + IntToStr(iCodDocumentoArredonda));
       idRateioDocumArredonda := _Cds.FieldByName('IDRATEIODOCUM').AsInteger;

       if not ExecSql('UPDATE RATEIODOCUM SET VALOR = VALOR + ' + FloatToStrCM(rValorDiferenca) + ' WHERE IDRATEIODOCUM = ' + IntToStr(idRateioDocumArredonda)) then
          raise Exception.Create(MessageInfo);

       (** 3 **)
       {** faz update do arredondamento na lanctodocum de um documento da CPMF  **}
       if not ExecSql('UPDATE LANCTODOCUM SET VALOR = VALOR + ' + FloatToStrCM(rValorDiferenca) + ' WHERE CODDOCUMENTO = ' + IntToStr(iCodDocumentoArredonda)) then
          raise Exception.Create(MessageInfo);

       (** 4 **)
       {** faz update do arredondamento na contabilização do operação 2 de um documento da CPMF **}
       _Cds.Data := GetDataPacket('SELECT PLNCODIGO FROM LANCTODOCUM WHERE RTRIM(OPERACAO) = ''2'' AND CODDOCUMENTO = ' + IntToStr(iCodDocumentoArredonda));
       iPlnCodigoArredonda := _Cds.FieldByName('PLNCODIGO').AsInteger;

       if not ExecSql('UPDATE PLANILHA SET PLNTOTDEB = PLNTOTDEB + ' + FloatToStrCM(rValorDiferenca) + ', PLNTOTCRE = PLNTOTCRE + ' + FloatToStrCM(rValorDiferenca) +  ' WHERE PLNCODIGO = ' + IntToStr(iPlnCodigoArredonda)) then
          raise Exception.Create(MessageInfo);

       ArredondaLancamentosContabeis(iPlnCodigoArredonda);
    End;
    {** Fim do lançamento de arredondamento da cpmf **}

  end;
  (****************************************************************************)
begin
  if ConnectionSide = cnsClient then
  begin
     Result := Connection.AppServer.BaixaCpmf(ovLotesBaixa, iIdForCli, iCodPortForma,
              iIdModulo, iIdUsuario, iIdEspAcesso, iPlano, dDataBaixa,
              bUsaPlanoPatro, bLancaContab, bPartidaDobrada);

     if not Result then
       MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
     _CdsLotesBaixa.Data := ovLotesBaixa;
     _CdsLotesBaixa.First;
     Try
        StartTransaction;

        rValorCpmf := 0;

        While Not _CdsLotesBaixa.Eof Do
        Begin
           If (_CdsLotesBaixa.FieldByName('FLGCONFIRMARECPAG').AsString = 'S') Then
              rValorCpmf := rValorCpmf + _CdsLotesBaixa.FieldByName('VALCALCULADO').AsFloat;
           _CdsLotesBaixa.Next;
        End;
        _CdsLotesBaixa.First;

        iNumDocLancado := -1;
        With TFrmBaixaCPMFMT.Create(Application) Do
          Try
            RevalCpmf.Value := rValorCpmf;
            Idfavorecido := iIdForCli;
            DtProgBaixaF.Date := dDataBaixa;
            If ShowModal = MrOk Then
            Begin
               dDataBaixa := DtProgBaixaF.Date;
               iNumDocLancado := NumDocLancado;
            End
            Else
            begin
              Raise Exception.Create('Lançamento de Arredondamento de CPMF cancelado');
            end;
            
            free;
          Except
            On E:Exception Do
            Begin
              free;
              Raise Exception.Create('Não foi possível lançar o Arredondamento da CPMF' + (#13+#10) + E.Message);
            End;
          End;

        sNumLoteManual := '';
        sNumLoteAutomatico := '';
        While Not _CdsLotesBaixa.Eof Do
        Begin
           If (_CdsLotesBaixa.FieldByName('FLGCONFIRMARECPAG').AsString = 'S') Then
           Begin
             If _CdsLotesBaixa.FieldByName('ORIGEM').AsString = 'M' Then
               sNumLoteManual := sNumLoteManual + ',' + _CdsLotesBaixa.FieldByName('NUMLOTE').AsString
             Else
               sNumLoteAutomatico := sNumLoteAutomatico + ',' + _CdsLotesBaixa.FieldByName('NUMLOTE').AsString;
           End;

           _CdsLotesBaixa.Next;
        End;

        If sNumLoteManual = '' Then
           sNumLoteManual := '-1'
        Else
           sNumLoteManual := Copy(sNumLoteManual,2,Length(sNumLoteManual));


        If sNumLoteAutomatico = '' Then
           sNumLoteAutomatico := '-1'
        Else
           sNumLoteAutomatico := Copy(sNumLoteAutomatico,2,Length(sNumLoteAutomatico));

        BaixaLote(dDataBaixa, GetSequence('NUMCHQBORD'));

        Commit;
        Result := True;
     Except
        On E:Exception Do
        Begin
          Result := False; 
          Rollback;
          MessageInfo := E.Message;
        End;
     End;
  end;
end;

procedure TCtrlConciliaCPMF.CalculaValor(rValPercent: Double);
  Procedure Arredonda(sField1, sField2: String);
  Var
    Delta: Double;
  Begin
      Delta := _Cds.FieldByName(sField1).AsFloat - _Cds.FieldByName(sField2).AsFloat;

      If (Delta <= 0.01) And (Delta >= -0.01) Then
         _Cds.FieldByName(sField2).AsFloat := _Cds.FieldByName(sField1).AsFloat;
  End;
begin
  With _Cds Do
    If (FieldByName('ORIGEM').AsString = 'L') Then
    Begin
      FDtmConciliaCPMFMT.SqlValLote.Prepare;
      FDtmConciliaCPMFMT.SqlValLote.Params[0].AsFloat := rValPercent;
      FDtmConciliaCPMFMT.SqlValLote.Params[1].AsFloat := FieldByName('NUMLOTE').AsFloat;
      FDtmConciliaCPMFMT.SqlValLote.open;

      Edit;

      FieldByName('VALPREVISTO').AsFloat := FDtmConciliaCPMFMT.CdsValLote.FieldByName('VLRPREVISTO').AsFloat;
      FieldByName('VALORAUDITORIA').AsFloat := FDtmConciliaCPMFMT.CdsValLote.FieldByName('VLRAUDITORIA').AsFloat;
      FieldByName('VALORLOTE').AsFloat := FDtmConciliaCPMFMT.CdsValLote.FieldByName('VALORLOTE').AsFloat;

      Arredonda('VALPREVISTO','VALORAUDITORIA');
      Arredonda('VALPREVISTO','VALCALCULADO');

      Post;
    End
    Else
    Begin
      FDtmConciliaCPMFMT.SQLValManual.Prepare;
      FDtmConciliaCPMFMT.SQLValManual.Params[0].AsFloat := rValPercent;
      FDtmConciliaCPMFMT.SQLValManual.Params[1].AsFloat := FieldByName('NUMLOTE').AsFloat;
      FDtmConciliaCPMFMT.SQLValManual.open;

      Edit;

      FieldByName('VALPREVISTO').AsFloat := FDtmConciliaCPMFMT.CdsValManual.FieldByName('VLRPREVISTO').AsFloat;
      FieldByName('VALORAUDITORIA').AsFloat := FDtmConciliaCPMFMT.CdsValManual.FieldByName('VLRAUDITORIA').AsFloat;
      FieldByName('VALORLOTE').AsFloat := FDtmConciliaCPMFMT.CdsValManual.FieldByName('VALORLOTE').AsFloat;

      Arredonda('VALPREVISTO','VALORAUDITORIA');
      Arredonda('VALPREVISTO','VALCALCULADO');

      Post;
    End;
end;

constructor TCtrlConciliaCPMF.Create;
begin
  inherited;
  _Documento := TCtrlDocumento.Create;
  _ImpostoRetido := TCtrlImpostoRetido.Create;
  _BaixaDocumentos := TCtrlBaixaDocumentos.Create;
  _FuncaoGeral := TFuncaoGeral.Create;
  _DiasUteis := TDiasUteis.Create;

  _CdsLotes := TClientDataSet.Create(nil);
  _CdsLotesBaixa := TClientDataSet.Create(nil);

  FDtmConciliaCPMFMT := TDtmConciliaCPMFMT.Create(nil);
end;

destructor TCtrlConciliaCPMF.Destroy;
begin
  _Documento.Free;
  _ImpostoRetido.Free;
  _BaixaDocumentos.Free;
  _FuncaoGeral.Free;
  _DiasUteis.Free;
  
  _CdsLotes.Free;
  _CdsLotesBaixa.Free;

  FDtmConciliaCPMFMT.Free;
  inherited;
end;

function TCtrlConciliaCPMF.Recalcula(OvLotes: OleVariant; iIdEspAcesso, iIdUsuario, iPlanoConta,
   iIdModulo: Integer; bUsaPlanoPatro, bLancaContab, bLancaPartidaDobrada: Boolean; cRecPag: Char): Boolean;
Var
  sSqlLote, sColunaLote: String;
  iCodDoc, iPosProgresso, iMaxProgresso: Integer;
begin
  inherited;
  if ConnectionSide = cnsClient then
  begin
     Result := Connection.AppServer.Recalcula(OvLotes, iIdEspAcesso, iIdUsuario, iPlanoConta,
               iIdModulo, bUsaPlanoPatro, bLancaContab, bLancaPartidaDobrada, cRecPag);

     if not Result then
       MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
     Result := True;
     _CdsLotes.Data := OvLotes;

     iPosProgresso := 0;
     iMaxProgresso := _CdsLotes.RecordCount + 1;

     CreateThreadProgresso;

     DoProgresso([0, iMaxProgresso, 'Recalculando CPMF']);

     _CdsLotes.First;
     While Not _CdsLotes.Eof Do
     Begin
        inc(iPosProgresso);
        DoProgresso([iPosProgresso, iMaxProgresso, 'Recalculando CPMF']);

        If _CdsLotes.FieldByName('RECALCULA').AsString = '1' Then
        Begin
             If _CdsLotes.FieldByName('ORIGEM').AsString = 'L' Then
             Begin
                sColunaLote := 'NUMLOTE';
                sSqlLote := ' SELECT ' +
                            '   LP.NUMLOTE, LP.DATAEMISSAO, D.OPERACAO, D.IDFORCLI, D.CODDOCUMENTO, ' +
                            '   L.NUMLANCTO, L.DEBCRE, LX.VALOR, LP.CODPORTFORMA, D.CODTIPDOC ' +
                            ' FROM ' +
                            '   DOCUMENTO D, LANCTODOCUM L, LOTEPAGTO LP, LOTEXDOCUM LX ' +
                            ' WHERE ' +
                            '   LP.NUMLOTE = :NUMLOTE AND ' +
                            '   D.CODDOCUMENTO = L.CODDOCUMENTO AND ' +
                            '   D.OPERACAO = L.OPERACAO AND ' +
                            '   L.ESTORNO IS NULL AND ' +
                            '   D.CODDOCUMENTO = LX.CODDOCUMENTO AND ' +
                            '   LX.NUMLOTE = LP.NUMLOTE ';
             End
             Else
             Begin
                sColunaLote := 'NUMLOTEMANUAL';
                sSqlLote := ' SELECT ' +
                            '   L.NUMLOTEMANUAL AS NUMLOTE, L.DATALANCTO AS  DATAEMISSAO, D.OPERACAO, D.IDFORCLI, D.CODDOCUMENTO,  ' +
                            '   L.NUMLANCTO, L.DEBCRE, L.VALOR, R.CODPORTFORMA, D.CODTIPDOC ' +
                            ' FROM  ' +
                            '   DOCUMENTO D, LANCTODOCUM L, RECBTOPAGTO  R  ' +
                            ' WHERE  ' +
                            '   L.NUMLOTEMANUAL = :NUMLOTE AND  ' +
                            '   D.CODDOCUMENTO = L.CODDOCUMENTO AND  ' +
                            '   L.OPERACAO = ''5'' AND  ' +
                            '   L.ESTORNO IS NULL AND  ' +
                            '   R.CODDOCUMENTO = L.CODDOCUMENTO AND ' +
                            '   R.NUMLANCTO = L.NUMLANCTO ';
             End;


             FDtmConciliaCPMFMT.SQLLoteImposto.SQL.Text := sSqlLote;
             FDtmConciliaCPMFMT.SQLLoteImposto.Prepare;
             FDtmConciliaCPMFMT.SQLLoteImposto.ParamByName('NUMLOTE').AsFloat := _CdsLotes.FieldByName('NUMLOTE').AsFloat;
             FDtmConciliaCPMFMT.SQLLoteImposto.Open;

             If Not FDtmConciliaCPMFMT.CdsLoteImposto.IsEmpty Then
             Begin
               Try
                  StartTransaction;

                  _Cds.Data := GetDataPacket('SELECT IDIMPOSTORETIDO, CODDOCLANCADO FROM IMPOSTORETIDO WHERE ' +  sColunaLote + ' = ' + _CdsLotes.FieldByName('NUMLOTE').AsString);

                  if not _Cds.IsEmpty then
                  Begin
                    //Loop para excluir os impostos já calculados
                    While Not _Cds.Eof Do
                    Begin
                      iCodDoc := _Cds.Fields[1].AsInteger;
                      if not ExecSQL('DELETE FROM IMPOSTORETIDO WHERE IDIMPOSTORETIDO = ' + _Cds.Fields[0].AsString) then
                         raise Exception.Create(MessageInfo);

                      _Documento.Prepare( OpDocumento, odlEfetivo );
                      _Documento.IdEspAcesso := iIdEspAcesso;
                      _Documento.IdUsuario := iIdUsuario;
                      _Documento.IdModulo := iIdModulo;
                      _Documento.UsaPlanoPatro := bUsaPlanoPatro;
                      _Documento.CodDocumento := iCodDoc;
                      If Not _Documento.Delete Then raise Exception.Create(_Documento.MessageInfo);

                      _Cds.Next;
                    End;
                  End;

                  _Cds.Close;

                  While Not FDtmConciliaCPMFMT.CdsLoteImposto.Eof Do
                  Begin
                     //Cálculo do ImpostoRetido
                     _ImpostoRetido.TipoImpostoLancto := tilNovoDoc;

                     If _CdsLotes.FieldByName('ORIGEM').AsString = 'L' Then
                        _ImpostoRetido.NumLote := FDtmConciliaCPMFMT.CdsLoteImposto.FieldByName('NUMLOTE').AsFloat
                     Else
                     Begin
                        _ImpostoRetido.NumLote := -1;
                        _ImpostoRetido.NumLoteManual := FDtmConciliaCPMFMT.CdsLoteImposto.FieldByname('NUMLOTE').AsFloat;
                     End;

                     _ImpostoRetido.DataProgramada := FDtmConciliaCPMFMT.CdsLoteImposto.FieldByname('DATAEMISSAO').AsDateTime;
                     _ImpostoRetido.OperacaoDocumento := FDtmConciliaCPMFMT.CdsLoteImposto.FieldByname('OPERACAO').AsString;
                     _ImpostoRetido.IdForCli := FDtmConciliaCPMFMT.CdsLoteImposto.FieldByname('IDFORCLI').AsInteger;
                     _ImpostoRetido.CodDocumento := FDtmConciliaCPMFMT.CdsLoteImposto.FieldByname('CODDOCUMENTO').AsInteger;
                     _ImpostoRetido.NumLancto := FDtmConciliaCPMFMT.CdsLoteImposto.FieldByname('NUMLANCTO').AsInteger;
                     _ImpostoRetido.ValorLancto := FDtmConciliaCPMFMT.CdsLoteImposto.FieldByname('VALOR').AsFloat;
                     _ImpostoRetido.ValorLiquido := FDtmConciliaCPMFMT.CdsLoteImposto.FieldByname('VALOR').AsFloat;
                     _ImpostoRetido.DataLancto := FDtmConciliaCPMFMT.CdsLoteImposto.FieldByname('DATAEMISSAO').AsDateTime;
                     _ImpostoRetido.DataEmissao := FDtmConciliaCPMFMT.CdsLoteImposto.FieldByname('DATAEMISSAO').AsDateTime;
                     _ImpostoRetido.DebCre := _Documento.GetDebCre(FDtmConciliaCPMFMT.CdsLoteImposto.FieldByname('CODTIPDOC').AsInteger);
                     _ImpostoRetido.MomentoLancamento := mlBaixa;
                     _ImpostoRetido.CodPortForma := FDtmConciliaCPMFMT.CdsLoteImposto.FieldByname('CODPORTFORMA').AsInteger;
                     _ImpostoRetido.PartidaDobrada := bLancaPartidaDobrada;
                     _ImpostoRetido.IdPlanoConta := iPlanoConta;
                     _ImpostoRetido.IntegraContab := bLancaContab;
                     _ImpostoRetido.IdEmpresa := IdPessoa;
                     _ImpostoRetido.RecPag := cRecPag;
                     _ImpostoRetido.IdUsuario := iIdUsuario;
                     _ImpostoRetido.IdModulo := iIdModulo;
                     _ImpostoRetido.Incluir;

                     FDtmConciliaCPMFMT.CdsLoteImposto.Next;
                  End;

                  If _CdsLotes.FieldByName('ORIGEM').AsString = 'L' Then
                     _ImpostoRetido.NumLote := FDtmConciliaCPMFMT.CdsLoteImposto.FieldByName('NUMLOTE').AsFloat
                  Else
                  Begin
                     _ImpostoRetido.NumLote := -1;
                     _ImpostoRetido.NumLoteManual := FDtmConciliaCPMFMT.CdsLoteImposto.FieldByName('NUMLOTE').AsFloat;
                  End;

                  _ImpostoRetido.CodPortForma := FDtmConciliaCPMFMT.CdsLoteImposto.FieldByName('CODPORTFORMA').AsInteger;
                  _ImpostoRetido.EfetivaNovoDocumento;

                  Commit;

                  _ImpostoRetido.CancelaAcumulaImposto;
                  Result := True;
               Except
                  On E:Exception Do
                  Begin
                    Rollback;
                    _ImpostoRetido.CancelaAcumulaImposto;
                    MessageInfo := 'Erro ao Recalcular CPMF' + (#13+#10) + E.Message;
                    Result := False;
                    break;
                  End;
               End;
            End;
        End;
        _CdsLotes.Next;
     End;

     DoProgresso([iMaxProgresso, iMaxProgresso, 'Recalculando CPMF']);
     FreeThreadProgresso;
  End;
end;

function TCtrlConciliaCPMF.SelLotes(iIdForCli, iNumLote, iTipoSelecao,
   iCodPortador: Integer; dDataProgramada: TDateTime; Var rValPrev: Double; rValPercent: Double) : OleVariant;
Var
  sSql: String;
  iRecordCount, iPosicao: Integer;
begin
  CreateThreadProgresso;
  
  DoProgresso([0,0,'Selecionando Lotes...']);

  sSql :=
      'SELECT ORIGEM, NUMLOTE, IDFORCLI, IDPESSOA, ' +
      '       SUM(VALOR) AS VALCALCULADO,  ' +
      '       DATARETENCAO, FLGCONFIRMARECPAG,FAVORECIDO,NUMCHQBORDERO, DIASEMANALANCTO, ' +
      '       DIASUTEISLANCTO, DATAEMISSAO, (0) AS RECALCULA, ' +
      '       (0) AS VALORLOTE, (0) AS VALPREVISTO, (0) AS VALORAUDITORIA ' +
      'FROM ' +
      '( ' +
      ' SELECT  ' +
      '   (''L'') AS ORIGEM, ' +
      '   LOTEPAGTO.NUMLOTE, ' +
      '   PORTADORFORMA.IDFORCLI, ' +
      '   PORTADORFORMA.IDPESSOA, ' +
      '   SUM(IMPOSTORETIDO.VLRRETIDO) AS VALOR, ' +
      '   IMPOSTORETIDO.DATARETENCAO, ' +
      '   DOCUMENTO.FLGCONFIRMARECPAG, ' +
      '   LOTEPAGTO.FAVORECIDO, ' +
      '   LOTEPAGTO.NUMCHQBORDERO, ' +
      '   PORTADORFORMA.DIASEMANALANCTO, ' +
      '   PORTADORFORMA.DIASUTEISLANCTO, ' +
      '   LOTEPAGTO.DATAEMISSAO ' +
      ' FROM ' +
      '   DOCUMENTO, LOTEPAGTO, PORTADORFORMA, IMPOSTORETIDO ' +
      ' WHERE ' +
      '   DOCUMENTO.RECPAG = ''P'' AND ' +
      '   ((DOCUMENTO.STATUS IS NULL) OR (DOCUMENTO.STATUS <> ''2'')) AND ' +
      //Filtro seleção da tela
      '    (DOCUMENTO.IDPESSOA = ' + IntToStr(fIdPessoa) + ' OR DOCUMENTO.IDPESSOA = 0) ' +
       _FuncaoGeral.Decode(iIdForCli, 0,'', ' AND (DOCUMENTO.IDFORCLI = ' + IntToStr(iIdForCli) + ' OR DOCUMENTO.IDFORCLI = 0) ') +
       _FuncaoGeral.Decode(iNumLote, 0, '', ' AND (LOTEPAGTO.NUMLOTE = ' + IntToStr(iNumLote) + ' OR LOTEPAGTO.NUMLOTE = 0) ') +
       _FuncaoGeral.Decode(dDataProgramada, 0, '', ' AND IMPOSTORETIDO.DATARETENCAO = TO_DATE(''' + DateToStr(dDataProgramada) + ''',''DD/MM/YYYY'') ') +
       _FuncaoGeral.Decode(iTipoSelecao,0,'',
          _FuncaoGeral.Decode(iTipoSelecao,1,
             ' AND (DOCUMENTO.FLGCONFIRMARECPAG = ''S'') ',' AND ((DOCUMENTO.FLGCONFIRMARECPAG = ''N'') OR (DOCUMENTO.FLGCONFIRMARECPAG IS NULL)) ')) +
      _FuncaoGeral.Decode(iCodPortador, 0, '', ' AND PORTADORFORMA.CODPORTADOR = ' + IntToStr(iCodPortador)) +
      //Filtro para seleção da tela
      '   AND DOCUMENTO.CODDOCUMENTO(+) = IMPOSTORETIDO.CODDOCLANCADO AND ' +
      '   LOTEPAGTO.NUMLOTE = IMPOSTORETIDO.NUMLOTE(+) AND ' +
      '   PORTADORFORMA.CODPORTFORMA = LOTEPAGTO.CODPORTFORMA ' +
      ' GROUP BY  ' +
      '   LOTEPAGTO.NUMLOTE, ' +
      '   PORTADORFORMA.IDFORCLI, ' +
      '   PORTADORFORMA.IDPESSOA, ' +
      '   IMPOSTORETIDO.DATARETENCAO, ' +
      '   DOCUMENTO.FLGCONFIRMARECPAG, ' +
      '   LOTEPAGTO.FAVORECIDO, ' +
      '   LOTEPAGTO.NUMCHQBORDERO, ' +
      '   PORTADORFORMA.DIASEMANALANCTO, ' +
      '   PORTADORFORMA.DIASUTEISLANCTO, ' +
      '   LOTEPAGTO.DATAEMISSAO ' +
      ' ' +
      ' UNION ' +
      ' ' +
      ' SELECT  ' +
      '   (''M'') AS ORIGEM, ' +
      '   L.NUMLOTEMANUAL AS NUMLOTE, ' +
      '   PORTADORFORMA.IDFORCLI, ' +
      '   PORTADORFORMA.IDPESSOA, ' +
      '   SUM(IMPOSTORETIDO.VLRRETIDO) AS VALOR, ' +
      '   IMPOSTORETIDO.DATARETENCAO, ' +
      '   DOCUMENTO.FLGCONFIRMARECPAG, ' +
      '   (''Pagamento Manual'') AS FAVORECIDO, ' +
      '   L.NUMCHQBORDERO, ' +
      '   PORTADORFORMA.DIASEMANALANCTO, ' +
      '   PORTADORFORMA.DIASUTEISLANCTO, ' +
      '   L.DATALANCTO ' +
      ' FROM ' +
      '   DOCUMENTO, IMPOSTORETIDO, PORTADORFORMA, ' +
      '   (SELECT L.NUMLOTEMANUAL, R.CODPORTFORMA, L.DATALANCTO, R.NUMCHQBORDERO '+
      '    FROM LANCTODOCUM L, RECBTOPAGTO R '+
      '    WHERE (L.CODDOCUMENTO = R.CODDOCUMENTO) '+
       _FuncaoGeral.Decode(iNumLote, 0, '', ' AND (L.NUMLOTEMANUAL = ' + IntToStr(iNumLote) + ' OR L.NUMLOTEMANUAL = 0) ') +
      '      AND (L.NUMLANCTO = R.NUMLANCTO) '+
      '      AND (RTRIM(L.OPERACAO) = ''5'') '+
      '      AND (L.ESTORNO IS NULL) '+
      '    GROUP BY L.NUMLOTEMANUAL, R.CODPORTFORMA, L.DATALANCTO, R.NUMCHQBORDERO) L '+
      ' WHERE '+
      '   DOCUMENTO.RECPAG = ''P'' AND ' +
      '   ((DOCUMENTO.STATUS IS NULL) OR (DOCUMENTO.STATUS <> ''2'')) AND ' +
      //Filtro seleção da tela
      '    (DOCUMENTO.IDPESSOA = ' + IntToStr(fIdPessoa) + ' OR DOCUMENTO.IDPESSOA = 0) ' +
       _FuncaoGeral.Decode(iIdForCli, 0, '', ' AND (DOCUMENTO.IDFORCLI = ' + IntToStr(iIdForCli) + ' OR DOCUMENTO.IDFORCLI = 0) ') +
       _FuncaoGeral.Decode(dDataProgramada, 0, '', ' AND IMPOSTORETIDO.DATARETENCAO = TO_DATE(''' + DateToStr(dDataProgramada) + ''',''DD/MM/YYYY'') ') +
       _FuncaoGeral.Decode(iTipoSelecao,0,'',
          _FuncaoGeral.Decode(iTipoSelecao,1,
             ' AND (DOCUMENTO.FLGCONFIRMARECPAG = ''S'') ',' AND ((DOCUMENTO.FLGCONFIRMARECPAG = ''N'') OR (DOCUMENTO.FLGCONFIRMARECPAG IS NULL)) ')) +
      _FuncaoGeral.Decode(iCodPortador, 0, '',' AND PORTADORFORMA.CODPORTADOR = ' + IntToStr(iCodPortador)) +
      //Filtro para seleção da tela
      '   AND DOCUMENTO.CODDOCUMENTO(+) = IMPOSTORETIDO.CODDOCLANCADO AND ' +
      '   L.NUMLOTEMANUAL = IMPOSTORETIDO.NUMLOTEMANUAL(+) AND ' +
      '   PORTADORFORMA.CODPORTFORMA = L.CODPORTFORMA ' +
      ' GROUP BY  ' +
      '   L.NUMLOTEMANUAL, ' +
      '   PORTADORFORMA.IDFORCLI, ' +
      '   PORTADORFORMA.IDPESSOA, ' +
      '   IMPOSTORETIDO.DATARETENCAO, ' +
      '   DOCUMENTO.FLGCONFIRMARECPAG, ' +
      '   L.NUMCHQBORDERO, ' +
      '   PORTADORFORMA.DIASEMANALANCTO, ' +
      '   PORTADORFORMA.DIASUTEISLANCTO, ' +
      '   L.DATALANCTO ' +
      ') ' +
      'GROUP BY ' +
      '   ORIGEM, NUMLOTE, IDFORCLI, IDPESSOA, DATARETENCAO, FLGCONFIRMARECPAG, ' +
      '   FAVORECIDO,NUMCHQBORDERO, DIASEMANALANCTO, DIASUTEISLANCTO, DATAEMISSAO ' +
      'ORDER BY ' +
      '   DATARETENCAO, ' +
      '   NUMLOTE ';

  If  FDtmConciliaCPMFMT.CdsRptConciliaCpmf.Active Then
  Begin
     If FDtmConciliaCPMFMT.CdsRptConciliaCpmf.ChangeCount > 0 Then FDtmConciliaCPMFMT.CdsRptConciliaCpmf.CancelUpdates;
     FDtmConciliaCPMFMT.CdsRptConciliaCpmf.Close;
  End;

  With _Cds Do
  begin
    Data := GetDataPacket(sSql);
    iRecordCount := (RecordCount + 1);
    rValPrev :=0;
    iPosicao := 0;
    DoProgresso([iPosicao, iRecordCount,'Calculando Valores dos Lotes...']);
    First;
    While Not Eof Do
    Begin
      inc(iPosicao);
      DoProgresso([iPosicao, iRecordCount,'Calculando Valores dos Lotes...']);

      CalculaValor(rValPercent);

      rValPrev := rValPrev + FieldByName('VALPREVISTO').AsFloat;

      Next;
    End;

    First;
  End;

  Result := _Cds.Data;
  DoProgresso([iRecordCount, iRecordCount,'Calculando Valores dos Lotes...']);
  FreeThreadProgresso;
end;

function TCtrlConciliaCPMF.SelLotesBaixa(dDataProgBaixa: TDateTime; iCodPortForma, iIdForCli, iNumLoteBaixa: Integer): OleVariant;
Var
  sSql: String;
begin
   sSql := 'SELECT ORIGEM, NUMLOTE, IDFORCLI, IDPESSOA, ' +
           '       SUM(VALOR) AS VALCALCULADO,  ' +
           '       DATARETENCAO, FLGCONFIRMARECPAG,FAVORECIDO,NUMCHQBORDERO, DIASEMANALANCTO, ' +
           '       DIASUTEISLANCTO, DATAEMISSAO, (0) AS RECALCULA, ' +
           '       (0) AS VALORLOTE, (0) AS VALPREVISTO, (0) AS VALORAUDITORIA ' +
           'FROM ' +
           '( ' +
           ' SELECT  ' +
           '   (''L'') AS ORIGEM, ' +
           '   LOTEPAGTO.NUMLOTE, ' +
           '   PORTADORFORMA.IDFORCLI, ' +
           '   PORTADORFORMA.IDPESSOA, ' +
           '   SUM(IMPOSTORETIDO.VLRRETIDO) AS VALOR, ' +
           '   IMPOSTORETIDO.DATARETENCAO, ' +
           '   DOCUMENTO.FLGCONFIRMARECPAG, ' +
           '   LOTEPAGTO.FAVORECIDO, ' +
           '   LOTEPAGTO.NUMCHQBORDERO, ' +
           '   PORTADORFORMA.DIASEMANALANCTO, ' +
           '   PORTADORFORMA.DIASUTEISLANCTO, ' +
           '   LOTEPAGTO.DATAEMISSAO ' +
           ' FROM ' +
           '   DOCUMENTO, LOTEPAGTO, PORTADORFORMA, IMPOSTORETIDO ' +
           ' WHERE ' +
           '   DOCUMENTO.RECPAG = ''P'' AND ' +
           '   ((DOCUMENTO.STATUS IS NULL) OR (DOCUMENTO.STATUS <> ''2'')) AND ' +

           //Filtro seleção da tela
           '     (DOCUMENTO.IDPESSOA = ' + IntToStr(FIdPessoa) + ') AND ' +
           '     (DOCUMENTO.IDFORCLI = ' + IntToStr(iIdForCli) + ') ' +
           _FuncaoGeral.Decode(iNumLoteBaixa,0.00,'',' AND (LOTEPAGTO.NUMLOTE = ' + IntToStr(iNumLoteBaixa) + ') ') +
           _FuncaoGeral.Decode(dDataProgBaixa,0,'',' AND IMPOSTORETIDO.DATARETENCAO = TO_DATE(''' + DateToStr(dDataProgBaixa)+ ''',''DD/MM/YYYY'') ') +
           ' AND (DOCUMENTO.FLGCONFIRMARECPAG = ''S'') ' +
           _FuncaoGeral.Decode(iCodPortForma,0,'',' AND PORTADORFORMA.CODPORTADOR = ' + IntToStr(iCodPortForma)) +
           //Filtro para seleção da tela

           '   AND DOCUMENTO.CODDOCUMENTO(+) = IMPOSTORETIDO.CODDOCLANCADO AND ' +
           '   LOTEPAGTO.NUMLOTE = IMPOSTORETIDO.NUMLOTE(+) AND ' +
           '   PORTADORFORMA.CODPORTFORMA = LOTEPAGTO.CODPORTFORMA ' +
           ' GROUP BY  ' +
           '   LOTEPAGTO.NUMLOTE, ' +
           '   PORTADORFORMA.IDFORCLI, ' +
           '   PORTADORFORMA.IDPESSOA, ' +
           '   IMPOSTORETIDO.DATARETENCAO, ' +
           '   DOCUMENTO.FLGCONFIRMARECPAG, ' +
           '   LOTEPAGTO.FAVORECIDO, ' +
           '   LOTEPAGTO.NUMCHQBORDERO, ' +
           '   PORTADORFORMA.DIASEMANALANCTO, ' +
           '   PORTADORFORMA.DIASUTEISLANCTO, ' +
           '   LOTEPAGTO.DATAEMISSAO ' +
           ' ' +
           ' UNION ' +
           ' ' +
           ' SELECT  ' +
           '   (''M'') AS ORIGEM, ' +
           '   L.NUMLOTEMANUAL AS NUMLOTE, ' +
           '   PORTADORFORMA.IDFORCLI, ' +
           '   PORTADORFORMA.IDPESSOA, ' +
           '   SUM(IMPOSTORETIDO.VLRRETIDO) AS VALOR, ' +
           '   IMPOSTORETIDO.DATARETENCAO, ' +
           '   DOCUMENTO.FLGCONFIRMARECPAG, ' +
           '   (''Pagamento Manual'') AS FAVORECIDO, ' +
           '   L.NUMCHQBORDERO, ' +
           '   PORTADORFORMA.DIASEMANALANCTO, ' +
           '   PORTADORFORMA.DIASUTEISLANCTO, ' +
           '   L.DATALANCTO ' +
           ' FROM ' +
           '   DOCUMENTO, IMPOSTORETIDO, PORTADORFORMA, ' +
           '   (SELECT L.NUMLOTEMANUAL, R.CODPORTFORMA, L.DATALANCTO, R.NUMCHQBORDERO '+
           '    FROM LANCTODOCUM L, RECBTOPAGTO R '+
           '    WHERE (L.CODDOCUMENTO = R.CODDOCUMENTO) '+
           '      AND (L.NUMLANCTO = R.NUMLANCTO) '+
           '      AND (RTRIM(L.OPERACAO) = ''5'') '+
           '      AND (L.ESTORNO IS NULL) '+
           '    GROUP BY L.NUMLOTEMANUAL, R.CODPORTFORMA, L.DATALANCTO, R.NUMCHQBORDERO) L '+
           ' WHERE '+
           '   DOCUMENTO.RECPAG = ''P'' AND ' +
           '   ((DOCUMENTO.STATUS IS NULL) OR (DOCUMENTO.STATUS <> ''2'')) AND ' +
           //Filtro seleção da tela
           '     (DOCUMENTO.IDPESSOA = ' + IntToStr(fIdPessoa) + ') AND ' +
           '     (DOCUMENTO.IDFORCLI = ' + IntToStr(iIdForCli) + ') ' +
            _FuncaoGeral.Decode(iNumLoteBaixa,0.00,'',' AND (L.NUMLOTEMANUAL = ' + IntToStr(iNumLoteBaixa) + ') ') +
            _FuncaoGeral.Decode(dDataProgBaixa,0,'',' AND IMPOSTORETIDO.DATARETENCAO = TO_DATE(''' + DateToStr(dDataProgBaixa) + ''',''DD/MM/YYYY'') ') +
           ' AND (DOCUMENTO.FLGCONFIRMARECPAG = ''S'') ' +
            _FuncaoGeral.Decode(iCodPortForma, 0,'',' AND PORTADORFORMA.CODPORTADOR = ' + IntToStr(iCodPortForma)) +
           //Filtro para seleção da tela
           '   AND DOCUMENTO.CODDOCUMENTO(+) = IMPOSTORETIDO.CODDOCLANCADO AND ' +
           '   L.NUMLOTEMANUAL = IMPOSTORETIDO.NUMLOTEMANUAL(+) AND ' +
           '   PORTADORFORMA.CODPORTFORMA = L.CODPORTFORMA ' +
           ' GROUP BY  ' +
           '   L.NUMLOTEMANUAL, ' +
           '   PORTADORFORMA.IDFORCLI, ' +
           '   PORTADORFORMA.IDPESSOA, ' +
           '   IMPOSTORETIDO.DATARETENCAO, ' +
           '   DOCUMENTO.FLGCONFIRMARECPAG, ' +
           '   L.NUMCHQBORDERO, ' +
           '   PORTADORFORMA.DIASEMANALANCTO, ' +
           '   PORTADORFORMA.DIASUTEISLANCTO, ' +
           '   L.DATALANCTO ' +
           ') ' +
           'GROUP BY ' +
           '   ORIGEM, NUMLOTE, IDFORCLI, IDPESSOA, DATARETENCAO, FLGCONFIRMARECPAG, ' +
           '   FAVORECIDO,NUMCHQBORDERO, DIASEMANALANCTO, DIASUTEISLANCTO, DATAEMISSAO ' +
           'ORDER BY ' +
           '   DATARETENCAO, ' +
           '   NUMLOTE ';

   CMDebugToFile(sSQL);
   Result := GetDataPacket(sSQL);
end;

function TCtrlConciliaCPMF.SelLotesVazios: OleVariant;
begin
  result := GetDataPacket(
            ' SELECT ORIGEM, NUMLOTE, IDFORCLI, IDPESSOA, ' +
            '        (0) AS VALORLOTE , (0) AS VALPREVISTO, VALOR AS VALCALCULADO, (0) VALORAUDITORIA, ' +
            '        DATARETENCAO, FLGCONFIRMARECPAG,FAVORECIDO,NUMCHQBORDERO, DIASEMANALANCTO, ' +
            '        DIASUTEISLANCTO, DATAEMISSAO, (0) AS RECALCULA, ' +
            '       (0) AS VALORLOTE, (0) AS VALPREVISTO, (0) AS VALORAUDITORIA ' +
            '   FROM ' +
            '  (SELECT DISTINCT ' +
            '    (''L'') AS ORIGEM, ' +
            '    IMPOSTORETIDO.NUMLOTE, ' +
            '    PORTADORFORMA.IDFORCLI, ' +
            '    PORTADORFORMA.IDPESSOA, ' +
            '    (IMPOSTORETIDO.VLRRETIDO) AS VALOR, ' +
            '    IMPOSTORETIDO.DATARETENCAO, ' +
            '    DOCUMENTO.FLGCONFIRMARECPAG, ' +
            '    LOTEPAGTO.FAVORECIDO, ' +
            '    LOTEPAGTO.NUMCHQBORDERO, ' +
            '    PORTADORFORMA.DIASEMANALANCTO, ' +
            '    PORTADORFORMA.DIASUTEISLANCTO, ' +
            '    LOTEPAGTO.DATAEMISSAO ' +
            '  FROM ' +
            '    DOCUMENTO, LOTEPAGTO, PORTADORFORMA, IMPOSTORETIDO ' +
            '  WHERE ' +
            '    1=2)');
end;

procedure TCtrlConciliaCPMF.SetDtmConciliaCPMFMT(
  const Value: TDtmConciliaCPMFMT);
begin
  FDtmConciliaCPMFMT := Value;
end;

procedure TCtrlConciliaCPMF.SetIdPessoa(const Value: Integer);
begin
  FIdPessoa := Value;

  _Cds.Data := GetDataPacket('SELECT FLGSTATUSFINANC FROM PARAMCAP WHERE IDPESSOA = ' + IntToStr(Value));

  if (_Cds.FieldByName('FLGSTATUSFINANC').AsString = 'C') then
    fLugarBaixaFinanc := 'C'
  else
    fLugarBaixaFinanc := 'N';

  _Cds.Data := GetDataPacket(' SELECT E.IDCIDADES, ' +
                             '        ES.IDPAIS, ' +
                             '        ES.CODESTADO ' +
                             ' FROM ' +
                             '   ENDPESS E, PESSOA P, CIDADES C, ESTADO ES ' +
                             ' WHERE P.IDPESSOA = ' + IntToStr(Value)+ ' AND ' +
                             '       P.IDENDCOMERCIAL = E.IDENDERECO AND ' +
                             '       E.IDCIDADES = C.IDCIDADES AND ' +
                             '       ES.IDESTADO = C.IDESTADO');
  if not _Cds.IsEmpty then
  begin
    _iCodCidade       := _Cds.Fields[0].AsInteger;
    _iCodPais         := _Cds.Fields[1].AsInteger;
    _sEstado          := _Cds.Fields[2].AsString;
  end
  else
  begin
    _iCodCidade       := 0;
    _iCodPais         := 0;
    _sEstado          := '';
  end;

  _Cds.Close;
end;


function TCtrlConciliaCPMF.ProcessaConciliaCPMF(
  OvLotes: OleVariant; bReprogramaNaoConciliados: Boolean): Boolean;
begin
  if ConnectionSide = cnsClient then
  begin
     Result := Connection.AppServer.ProcessaConciliaCPMF(OvLotes, bReprogramaNaoConciliados);

     if not Result then
       MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
     _CdsLotes.Data := OvLotes;
     Try
        StartTransaction;
        _CdsLotes.First;

        While Not _CdsLotes.Eof Do
        Begin
           If _CdsLotes.FieldByName('ORIGEM').AsString = 'L' Then
              AtualizaDocs(FDtmConciliaCPMFMT.SQLUpdDocLote,  FDtmConciliaCPMFMT.SQLExecUpdDocLote, False)
           Else
              AtualizaDocs(FDtmConciliaCPMFMT.SQLUpdDocManual, FDtmConciliaCPMFMT.SQLExecUpdDocManual, False);

           _CdsLotes.Next;
        End;

        _CdsLotes.First;
        //Testa se existem documentos não conciliados e reprograma do documentos
        If  (Not _CdsLotes.IsEmpty) And bReprogramaNaoConciliados Then
        Begin
          _CdsLotes.First;
          While Not _CdsLotes.Eof Do
          Begin
             If (_CdsLotes.FieldByName('FLGCONFIRMARECPAG').AsString <> 'S') {AND (CdsLotesVALOR.AsFloat = CdsLotesVALORCPMFPREV.AsFloat)} Then
             Begin
                If _CdsLotes.FieldByName('ORIGEM').AsString = 'L' Then
                Begin
                   AtualizaDocs(FDtmConciliaCPMFMT.SQLUpdDocLote,  FDtmConciliaCPMFMT.SQLExecUpdDocLote, True);
                   AtualizaDataImposto(false, _CdsLotes.FieldByName('NUMLOTE').AsInteger, 0);
                End
                Else
                Begin
                   AtualizaDocs(FDtmConciliaCPMFMT.SQLUpdDocManual, FDtmConciliaCPMFMT.SQLExecUpdDocManual, True);
                   AtualizaDataImposto(True, _CdsLotes.FieldByName('NUMLOTE').AsInteger, 0);
                End;
             End;
             _CdsLotes.Next;
          End;
        End;

        Commit;
        Result := True;

     Except
        On E:Exception Do
         Begin
            Rollback;
            Result := False;
            MessageInfo := E.Message;
         End;
     End;
  End;
end;

function TCtrlConciliaCPMF.AlteraDataRetencao(OvLote: OleVariant; iNumLote: Integer;
  dData: TDateTime): Boolean;
begin
  if ConnectionSide = cnsClient then
  begin
     Result := Connection.AppServer.AlteraDataRetencao(OvLote, iNumLote, _CdsLotes.FieldByName('ORIGEM').AsString, dData);

     if not Result then
       MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
     Try
        StartTransaction;

        _CdsLotes.Data := OvLote;
        _CdsLotes.Locate('NUMLOTE', iNumLote, []);


        If _CdsLotes.FieldByName('ORIGEM').AsString = 'L' Then
        begin
           AtualizaDocs(FDtmConciliaCPMFMT.SQLUpdDocLote,  FDtmConciliaCPMFMT.SQLExecUpdDocLote, True);
           AtualizaDataImposto(false, iNumLote, dData);
        end
        Else
        begin
           AtualizaDocs(FDtmConciliaCPMFMT.SQLUpdDocManual, FDtmConciliaCPMFMT.SQLExecUpdDocManual, True);
           AtualizaDataImposto(True, iNumLote, dData);
        end;

        Commit;

        Result := True;
     except
        On E:Exception Do
         Begin
            Rollback;
            Result := False;
            MessageInfo := E.Message;
         End;
     End;
  end;
end;

procedure TCtrlConciliaCPMF.AtualizaDataImposto(bLoteManual: Boolean;
  iNumLote: Integer; dData: TDateTime);
begin
  if bLoteManual then
  begin
     With FDtmConciliaCPMFMT, SQLUpdImpostoManual Do
     Begin
        If Not Prepared Then Prepare;
        ParamByName('NUMLOTE').AsFloat := iNumLote;
        Open;

        CdsUpdImpostoManual.First;
        While Not CdsUpdImpostoManual.Eof Do
        Begin
          ExecUpdImpostoManual.Prepare;
          ExecUpdImpostoManual.ParamByName('IDIMPOSTORETIDO').AsInteger := CdsUpdImpostoManual.FieldByName('IDIMPOSTORETIDO').AsInteger;

          if dData = 0 then
             ExecUpdImpostoManual.ParamByName('DATARETENCAO').AsDate := GetDataLancDocImposto(CdsUpdImpostoManual.FieldByName('DATARETENCAO').AsDateTime)
          else
             ExecUpdImpostoManual.ParamByName('DATARETENCAO').AsDate := dData;

          if not ExecSQL(ExecUpdImpostoManual.SQLChanged) then raise Exception.Create(MessageInfo);

          CdsUpdImpostoManual.Next;
        End;
     end;
  end
  else
  begin
     With FDtmConciliaCPMFMT, SQLUpdImposto Do
     Begin
        If Not Prepared Then Prepare;
        ParamByName('NUMLOTE').AsFloat := iNumLote;
        Open;

        CdsUpdImposto.First;
        While Not CdsUpdImposto.Eof Do
        Begin
          ExecUpdImposto.Prepare;
          ExecUpdImposto.ParamByName('IDIMPOSTORETIDO').AsInteger := CdsUpdImposto.FieldByName('IDIMPOSTORETIDO').AsInteger;

          if dData = 0 then
             ExecUpdImposto.ParamByName('DATARETENCAO').AsDate := GetDataLancDocImposto(CdsUpdImposto.FieldByName('DATARETENCAO').AsDateTime)
          else
             ExecUpdImposto.ParamByName('DATARETENCAO').AsDate := dData;

          if not ExecSQL(ExecUpdImposto.SQLChanged) then raise Exception.Create(MessageInfo);

          CdsUpdImposto.Next;
        End;
     End;
  end

end;

end.
