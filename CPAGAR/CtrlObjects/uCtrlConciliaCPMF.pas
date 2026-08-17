unit uCtrlConciliaCPMF;
{*****************************************************************************
Nº SOL......: 235849
Nº PPM......: 459943
Data........: 23/07/2014
Responsável.: Paulo Nobre SOL 235849 PPM 459943
Descrição...: Ajuste na baixa automatica
=====================================================================================
//Rotina                : GetEmptyCdsBaixa
//N. Sol..........      : 214738_15892
//N. Kintana......      : 2057238
//Data da Alteração:    : 13/03/2014
//Alteração Form:       : FBaixaIntBancoMT
//Responsável:          : Paulo Nobre
//Descrição.......      : Inclusão do campo virtual FLGMARCADO
//******************************************************************************************
Autor(a)    :  Henrique Massão
Data        :  26/02/2009
Pendência   :  SOL 109421 KINTANA 496332
Descricao   :  Alteração de gravação de arquivos de log na raiz do disco C:
------------------------------------------------------------------------------}
{--------------------------------------------------------------------------------
Rotina    : IsCpmfConsistente, SelLotes, SelLotesBaixa
Data      : 24/11/2006
Autor     : André Tavares
Descrição : não estava buscando os lançamento de cpmf do cfinan (tranf entre contas) - tive que alterar joins das querys
Pendência : 23827
--------------------------------------------------------------------------------}
{--------------------------------------------------------------------------------
Rotina    : GetDataLancDocImposto
Data      : 17/03/2006
Autor     : André Tavares
Descrição : Utiliza o método correspondente da uctrlImpostoReido
Pendência : 21775
--------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : BaixaCpmf
Autor     : André Tavares
Data      : 09/02/2006
Pendência : 21510
Descrição : coloquei a coluna DOCUMENTO.IDMODULO na query FDtmConciliaCPMFMT.SQLDocsBaixaLote .
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : Diversas
Autor     : Rodolpho da Silva
Data      : 01/11/2005
Pendência : 20640
Descrição : Corrigido o erro gerado pela pendência 19331 em que os registros referente a CPMF não
            estavam aparecendo na tela de conciliação de CPMF, mesmo não estando baixados
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Autor     : Rodolpho da Silva
Data      : 18/03/2005
Pendência : 18397
Descrição : Validar regra de feriado de acordo com o estado/cidade do portadorforma
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Autor     : Rodolpho da Silva
Data      : 18/03/2005
Pendência : 18634
Descrição : Alterar a data programada da tabela DOCUMENTO quando a mesma for alterada na tabela
            IMPOSTORETIDO (DATARETENCAO)
---------------------------------------------------------------------------------------------------}

{ --------------------------------------------------------------------------------------------------
Autor     : Rodolpho da Silva
Data      : 21/12/2004
Pendência : 18362
Descrição : Alterar a qry do SelLotes para melhor performance
---------------------------------------------------------------------------------------------------}

{ --------------------------------------------------------------------------------------------------
Autor     : Alex Pererira
Data      : 03/08/2004
Descrição : Ajustando o arredondamento da CPMF, caso o mesmo menor que R$0,01
            a prevista e a auditada passam a ser igual a calculada.
            Trocando o foco da CPMF prevista para CPMF calculada
---------------------------------------------------------------------------------------------------}

{ --------------------------------------------------------------------------------------------------
Método    : SelLotes
Data      : 07/07/2004
Autor     : Alex Pereira
Pendência : Emergencial Funcef: corrigir o arredondamento da CPMF na tela de conciliação
Descrição : utilizado a função RoundCM
---------------------------------------------------------------------------------------------------}

{ --------------------------------------------------------------------------------------------------
Método    : SelLotes, SelLotesBaixa
Data      : 26/04/2004
Autor     : Alex Pereira
Pendência : 16220 - Implementar a CPMF em lança e baixa simultânea
Descrição : Colocado no filtro da query a operação 10 - lança e baixa simultânea
---------------------------------------------------------------------------------------------------}
interface

Uses SysUtils, Controls, Classes, DbClient, uCmControlObject, DConciliaCPMFMT,
     uFuncaoGeral, uCtrlDocumento, uCtrlImpostoRetido, uCtrlBaixaDocumentos,
     uCmSqlParams, uDiasUteis, uCtrlLancamento, Usistema;
     //Henrique Massão
     //andre tavares - 19/03/2007 - pendência 24748



Type

  // andré tavares - pendência 24417 - 06/02/2007 - envento para lançamento de arredondamento de cpmf (chamada do form de lançamento a ser associado na inteface)
  TEventoLancaArredondamento = function(const idforcli: integer; const dataprog: tdateTime; const valor : double; const icodportforma: integer; var iNumDocArredonda: int64): Boolean of object;


  //andré tavares - pendência 23440 - 17/10/2006 - contem a data de início e fim do decêncio que será retornado por um método
  TDecendio = Record
                DataIni, DataFim: TdateTime;
              end;

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
    procedure AtualizaDocs(SqlRegistros, SqlUpdate: TCMSqlParams; bAtualizaData: Boolean; bIntegraContab: boolean;
                           dDataNova: TDateTime = 0); //andre tavares - pendência 24748 - 16/03/2007
    
// andré tavares - aboli o uso deste método, pois somente deverá ser utilizado o método correspondente da uCtrlImpostoRetido
    function getCodPortForma: integer;

    procedure AtualizaDataImposto(bLoteManual: Boolean; iNumLote: Integer; dData: TDateTime);

  protected
    procedure AfterInitialize; Override;



  public

    // andré tavares - pendência 24417 - 06/02/2007 - envento para lançamento de arredondamento de cpmf (chamada do form de lançamento a ser associado na inteface)
    onLancaArredondamento: TEventoLancaArredondamento;


    Constructor Create; Override;
    Destructor Destroy; Override;

    (* Monta ClientDataSets - SELECTS *)
    function SelLotes(iIdForCli, iNumLote, iTipoSelecao,
                      iCodPortador: Integer; sPercentual: string; dDataProgramada: TDateTime; Var rValCalc: Double; rValPercent: Double;
                      //  Rodolpho da Silva - P: 19331 - 05/07/2005
                      bSelCPMFBaixadas: boolean = False;
                      bApenasInconsistentes: boolean = False ): OleVariant;

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
    function ProcessaConciliaCPMF(OvLotes: OleVariant; bReprogramaNaoConciliados: Boolean; dataReprog: TDateTime = 0): Boolean;
    function AlteraDataRetencao(OvLote: OleVariant; iNumLote: Integer; dData: TDateTime; bIntegraContab: Boolean; idimpostoretido: integer): Boolean;

    //andré tavares - pendência 23440 - 17/10/2006 - busca as data de início e fim do decencio que gerou a cpmf na data passada como parâmetro
    function GetDecendioCPMF(ddata: TdateTime; iPeriodo, iDiasVenc: integer): TDecendio;

    function IsCpmfConsistente(const cds : TClientDataSet): Boolean; //andré tavares pendência 23827 - coloquei o método com público

    //pendência 26936 - 30/11/2007 - busca a data da planilha de baixa do lote
    function getDataContabLote(sNumLote: string):TdateTime;

    property IdPessoa: Integer read FIdPessoa write SetIdPessoa;
    property LugarBaixaFinanc: String read fLugarBaixaFinanc;
    property DtmConciliaCPMFMT: TDtmConciliaCPMFMT read FDtmConciliaCPMFMT write SetDtmConciliaCPMFMT;
  end;


implementation

{ TCtrlConciliaCPMF }



Uses uCmTypes, uCMMath, JclMath, uCMFileUtils;



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

function TCtrlConciliaCPMF.IsCpmfConsistente(const cds : TClientDataSet): Boolean;
var fDiferenca: Extended;
begin
  //  Extrai a diferença dos valores
  if not Cds.FieldByName('NUMLOTE').isNull then //andré tavares - pendência 23827 - 24/11/2006 - se o documento não está em um lote (documento de cpmf transf. entre contas), então não pode calcular diferença
  begin
    fDiferenca := Cds.FieldByName('VALORLOTE').AsFloat - Cds.FieldByName('VALORBASE').AsFloat;
    //  Se a difenreça estiver entre R$ 0,99 e -R$ 0,99, a linha não é considerada, porém
    //se a diferença estiver  maior que R$ 0,99 e -R$ 0,99, alinha é pintada, como marcador de texto
    Result := (fDiferenca > -1.00) and (fDiferenca < 1.00);
  end else result := true; //andré tavares - pendência 23827
end;




procedure TCtrlConciliaCPMF.AtualizaDocs(SqlRegistros, SqlUpdate: TCMSqlParams; bAtualizaData: Boolean; bIntegraContab: boolean;
                                         dDataNova: TDateTime = 0); //andre tavares - pendência 24748 - 16/03/2007
var ctrlLancamento: TctrlLancamento;
    sPlacontaDeb, sPlacontaCred, scCustDeb, scCustCred :String;
    icodSubContaDeb, icodSubContaCred : integer;
    dPlnCodigo : Extended;
begin

  SqlRegistros.Prepare;
  SqlRegistros.Params[0].AsInteger := _CdsLotes.FieldByName('NUMLOTE').AsInteger;
  SqlRegistros.Open;
  //início - andre tavares 24/02/2007 - na movimentação financeira ou transferência entre contas, esta é a única maneira de buscar os documentos para atualizá-los
  if (SqlRegistros.ClientDataSet.isEmpty) and
     ((_CdsLotes.FieldByName('ORIGEM').AsString = 'T') or (_CdsLotes.FieldByName('ORIGEM').AsString = 'F')
     or (_CdsLotes.FieldByName('ORIGEM').AsString = 'M') ) then //pendência 26936 - 03/12/2007
  begin
    if (_CdsLotes.FieldByName('CODLANCFINANC').AsInteger > 0)  then //andre tavares - pendência 24748 - 16/03/2007
      SqlRegistros.ClientDataSet.data := getDataPacket(' SELECT DOCUMENTO.CODDOCUMENTO, DOCUMENTO.FLGCONFIRMARECPAG, DOCUMENTO.DATAVENCTO, DOCUMENTO.DATAPROGRAMADA, DOCUMENTO.DATAEMISSAO '+#13+
                              ' FROM IMPOSTORETIDO, DOCUMENTO, LANCTODOCUM '+#13+
                              ' WHERE IMPOSTORETIDO.CODLANCFINANC = '+ _CdsLotes.FieldByName('CODLANCFINANC').AsString +' AND '+#13+
                              '       DOCUMENTO.CODDOCUMENTO = IMPOSTORETIDO.CODDOCLANCADO AND '+#13+
                              '       LANCTODOCUM.CODDOCUMENTO = IMPOSTORETIDO.CODDOCLANCADO AND '+#13+
                              '       LANCTODOCUM.OPERACAO = DOCUMENTO.OPERACAO AND '+#13+
                              '       LANCTODOCUM.ESTORNO IS NULL ');

  end;
  //fim - andre tavares 24/02/2007

  SqlRegistros.ClientDataSet.First;
  While Not SqlRegistros.ClientDataSet.Eof Do
  Begin
    SqlRegistros.ClientDataSet.Edit;

    If bAtualizaData And IsCpmfConsistente(_cdsLotes) Then
    Begin
       //início andre tavares  - pendência 21775 - 16/03/2006 - tem que usar a mesma rotina da ctrlImpostoRetido
      _ImpostoRetido.CodDocumento  := SqlRegistros.ClientDataSet.FieldByName('CODDOCUMENTO').AsInteger;
      _impostoRetido.CodPortForma  := getCodPortForma;
      _impostoRetido.CodLancFinanc := _CdsLotes.FieldByName('CODLANCFINANC').AsInteger;

      if trunc(dDataNova) = 0 then //andre tavares - pendência 24748 - 16/03/2007
      begin
        SqlRegistros.ClientDataSet.FieldByName('DATAVENCTO').AsDateTime     := _ImpostoRetido.GetDataLancDocImposto(SqlRegistros.ClientDataSet.FieldByName('DATAVENCTO').AsDateTime);
        SqlRegistros.ClientDataSet.FieldByName('DATAPROGRAMADA').AsDateTime := _ImpostoRetido.GetDataLancDocImposto(SqlRegistros.ClientDataSet.FieldByName('DATAPROGRAMADA').AsDateTime);
        SqlRegistros.ClientDataSet.FieldByName('DATAEMISSAO').AsDateTime    := SqlRegistros.ClientDataSet.FieldByName('DATAPROGRAMADA').AsDateTime;
      end
      else //andre tavares - pendência 24748 - 16/03/2007
      begin
        SqlRegistros.ClientDataSet.FieldByName('DATAVENCTO').AsDateTime     := dDataNova;
        SqlRegistros.ClientDataSet.FieldByName('DATAPROGRAMADA').AsDateTime := dDataNova;
        SqlRegistros.ClientDataSet.FieldByName('DATAEMISSAO').AsDateTime    := dDataNova;


         //andre tavares - 19/03/2007 - pendência 24748 - não podemos esquecer da contabilidade
        if bIntegraContab then
        begin
         CtrlLancamento := TCtrlLancamento.Create;
         CtrlLancamento.initializeAs(self);
          try
            try

             //verifica se o documento está num lote
             _cds.data := getDataPacket('SELECT CODDOCUMENTO FROM LOTEXDOCUM WHERE CODDOCUMENTO  = '+ SqlRegistros.ClientDataSet.FieldByName('CODDOCUMENTO').AsString);
             if not _cds.IsEmpty then
             begin
               self.messageInfo := 'O documento está em um lote e não pode ser alterado.';
               raise exception.create(self.messageInfo);
             end;

              //carrega os lançamentos contábeis do lançamento do documento para alterá-los
              _cds.Data := getDataPacket(' SELECT L.*, P.* FROM LANCTODOCUM LD, DOCUMENTO D, LANCAMENTO L, PLANILHA P '+
                                         ' WHERE LD.CODDOCUMENTO = '+ SqlRegistros.ClientDataSet.FieldByName('CODDOCUMENTO').AsString +' AND '+
                                         '       LD.OPERACAO     = D.OPERACAO AND '+
                                         '       LD.CODDOCUMENTO = D.CODDOCUMENTO AND '+
                                         '       D.STATUS <> ''2'' AND '+
                                         '       LD.PLNCODIGO    = L.PLNCODIGO AND '+
                                         '       P.PLNCODIGO     = L.PLNCODIGO     ');

              sPlacontaDeb     := '';
              sPlacontaCred    := '';
              icodSubContaDeb  := 0;
              icodSubContaCred := 0;
              _cds.first;
              while not _cds.Eof do
              begin
                if trim(_cds.fieldByName('LACDEBCRE').asString) = 'C' then
                begin
                  sPlacontaCred    := _cds.fieldByName('PLACONTA').asString;
                  icodSubContaCred := _cds.fieldByName('CODSUBCONTA').asInteger;
                  scCustCred       := _cds.fieldByName('CODCENTROCUSTO').asString;
                end
                else
                begin
                  sPlacontaDeb    := _cds.fieldByName('PLACONTA').asString;
                  icodSubContaDeb := _cds.fieldByName('CODSUBCONTA').asInteger;
                  scCustDeb       := _cds.fieldByName('CODCENTROCUSTO').asString;
                end;

                _cds.Next;
              end;

              _cds.first;
              if not _cds.isempty then
                if not CtrlLancamento.AlteraLancaContab(_cds.fieldByName('LACTIPO').asString[1], fIdPessoa, _cds.fieldByName('IDMODULO').asInteger,
                                                 _cds.fieldByName('IDUSUARIOINCLUSAO').asInteger,  _cds.fieldByName('PLANO').asInteger,
                                                 _cds.fieldByName('UNIDNEGOC').asInteger, icodSubContaDeb, icodSubContaCred,
                                                 _cds.fieldByName('IDPLANOPREV').asInteger, _cds.fieldByName('IDPATRO').asInteger,
                                                 _cds.fieldByName('PLNCODIGO').asInteger, _cds.fieldByName('LACNUMLAN').asInteger,
                                                 formatDateTime('DD/MM/YYYY', dDataNova), _cds.fieldByName('LACNUMDOC').asString,
                                                 _cds.fieldByName('LACHIST1').asString, _cds.fieldByName('LACHIST2').asString,
                                                 _cds.fieldByName('LACHIST3').asString, _cds.fieldByName('LACHIST4').asString,
                                                 _cds.fieldByName('LACHIST5').asString, _cds.fieldByName('TIPCODIGO').asString,
                                                 scCustDeb, sPlacontaDeb, scCustCred, sPlacontaCred,
                                                 _cds.fieldByName('HITCODHIST').asString, _cds.fieldByName('LACVALOR').asFloat,
                                                 true, true, _cds.fieldByName('IDSEGREGACRITER').asInteger,
                                                 _cds.fieldByName('DATASEGREGACRITER').asDateTime, false) then
                  raise Exception.Create(CtrlLancamento.MessageInfo);

              dPlnCodigo := 0;
              dPlnCodigo := CtrlLancamento.RetornoPlnCodigo;
              if trunc(dPlnCodigo) > 0 then
              begin
                if not ExecSQL(' UPDATE LANCTODOCUM SET PLNCODIGO = '+ floatToStr(dPlnCodigo) +', DATALANCTO = TO_DATE('+ quotedStr(formatDateTime('DD/MM/YYYY', dDataNova))+ ', ''DD/MM/YYYY'') '+ #13+
                               ' WHERE OPERACAO = ''2'' AND CODDOCUMENTO = ' + SqlRegistros.ClientDataSet.FieldByName('CODDOCUMENTO').AsString) then
                  raise Exception.Create(self.MessageInfo);
              end
              else
              begin
                self.MessageInfo := 'Não houve lançamento na contabilidade';
                raise Exception.Create(self.MessageInfo);
              end;
            except
              raise Exception.Create(self.MessageInfo +#13+ CtrlLancamento.MessageInfo);
            end;
          finally
           CtrlLancamento.free;
          end;
        end;//if integracontab
      end;//else

      //fim andre tavares
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

  // Marchetti
     sHistorico : String;
     rValorCPMFTransf : Double;
     bExisteTransf    : Boolean;
  // Fim Marchetti

  sFiltroDocs: string; //ANDRE TAVARES - PENDÊNCIA 23827 - 04/12/2006 - PARA RESPEITAR OS FILTROS DA TELA

  rValorCpmf :Double;

  iNumDocArredonda, iNumDocLancado: int64;
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

         {** Faz update do arredondamento na contabilidade do lançamento de baixa **}
         If (sSqlCred <> '') And (sSqlDeb <> '') Then
         Begin
            if not ExecSQL(sSqlDeb) then raise Exception.Create(MessageInfo);
            if not ExecSQL(sSqlCred) then raise Exception.Create(MessageInfo);
            if not ExecSQL('UPDATE PLANILHA SET PLNTOTDEB = PLNTOTDEB + ' + FloatToStrCM(rValorDiferenca) + ', PLNTOTCRE = PLNTOTCRE + ' + FloatToStrCM(rValorDiferenca) +  ' WHERE PLNCODIGO = ' + IntToStr(vPlnCodigo)) then raise Exception.Create(MessageInfo);
         End;
    End;

  begin
    inherited;
      //início - ANDRE TAVARES - PENDÊNCIA 23827 - 04/12/2006 - PARA RESPEITAR OS FILTROS DA TELA
      sFiltroDocs := '' ;
      _CdsLotesBaixa.DisableControls;
      _CdsLotesBaixa.First;
      while not _CdsLotesBaixa.Eof do
      begin
        //andre tavares - 10/01/2007
        if (_CdsLotesBaixa.FieldByName('FLGCONFIRMARECPAG').asString = 'S') and (_CdsLotesBaixa.FieldByName('CODDOCLANCADO').asInteger > 0) then
          sFiltroDocs := sFiltroDocs + _CdsLotesBaixa.FieldByName('CODDOCLANCADO').asString + ',';

        if iNumDocArredonda > 0 then //andre tavares - 15/03/2007
          sFiltroDocs := sFiltroDocs + intToStr(iNumDocArredonda) + ',';

        _CdsLotesBaixa.Next;
      end;
      _CdsLotesBaixa.EnableControls;

      if trim (sFiltroDocs) <> '' then
        sFiltroDocs[length(sFiltroDocs)] := ' ';
      //fim - ANDRE TAVARES - PENDÊNCIA 23827 - 04/12/2006 - PARA RESPEITAR OS FILTROS DA TELA

    FDtmConciliaCPMFMT.SQLDocsBaixaLote.SQL.Text :=
        ' SELECT * FROM ( ' +#13+
        'SELECT ' +#13+ {Documentos de Baixa Automática}
        '  DOCUMENTO.CODDOCUMENTO, LANCTODOCUM.NUMLANCTO, DOCUMENTO.IDUSUARIOINCLUSAO, ' +#13+
        '  PESSOA.RAZAOSOCIAL AS NOME, DOCUMENTO.DATAPROGRAMADA, ' +#13+
        '  DOCUMENTO.IDPESSOA, DOCUMENTO.DATAVENCTO, DOCUMENTO.NODOCUMENTO, ' +#13+
        '  DOCUMENTO.COMPLDOCUMENTO, DOCUMENTO.OPERACAO, ' +#13+
        '  IMPOSTORETIDO.VLRRETIDO AS VALORIMPOSTO, ' +#13+
        '  LANCTODOCUM.VALOR AS VALOR, ' +#13+
        '  (0) VALOROUTRAMOEDA, DOCUMENTO.CODCENTROCUSTO, DOCUMENTO.PLACONTA, '+#13+
        '  (''D'') AS DEBCRE, ' +#13+
        '  DOCUMENTO.CODSUBCONTA, DOCUMENTO.IDFORCLI, DOCUMENTO.CODGRUPOCNAB, DOCUMENTO.NOSSONUMERO, ' +#13+
        '  IMPOSTORETIDO.VLRRETIDO AS VLRLIQUIDO, DOCUMENTO.CODTIPDOC, DOCUMENTO.IDMODULO ' +#13+
        'FROM ' +#13+
        '  DOCUMENTO, ' +#13+
        '  PESSOA, ' +#13+
        '  LANCTODOCUM, ' +#13+
        '  IMPOSTORETIDO ' +#13+
        'WHERE ' +#13+
        '  IMPOSTORETIDO.NUMLOTE IN (' + sNumLoteAutomatico + ') AND ' +#13+
        '  IMPOSTORETIDO.CODDOCLANCADO = DOCUMENTO.CODDOCUMENTO AND ' +#13+
        '  DOCUMENTO.IDFORCLI = PESSOA.IDPESSOA AND ' +#13+
        '  DOCUMENTO.CODDOCUMENTO = LANCTODOCUM.CODDOCUMENTO AND ' +#13+
        '  DOCUMENTO.STATUS <> ''2'' AND ' +#13+
        '  DOCUMENTO.OPERACAO = LANCTODOCUM.OPERACAO ' +#13+
        'UNION ' +#13+ {Documentos de baixa manual}
        'SELECT ' +#13+
        '  DOCUMENTO.CODDOCUMENTO, LANCTODOCUM.NUMLANCTO, DOCUMENTO.IDUSUARIOINCLUSAO, ' +#13+
        '  PESSOA.RAZAOSOCIAL AS NOME, DOCUMENTO.DATAPROGRAMADA, ' +#13+
        '  DOCUMENTO.IDPESSOA, DOCUMENTO.DATAVENCTO, DOCUMENTO.NODOCUMENTO, ' +#13+
        '  DOCUMENTO.COMPLDOCUMENTO, DOCUMENTO.OPERACAO, ' +#13+
        '  IMPOSTORETIDO.VLRRETIDO AS VALORIMPOSTO, ' +#13+
        '  LANCTODOCUM.VALOR AS VALOR, ' +#13+
        '  (0) AS VALOROUTRAMOEDA, DOCUMENTO.CODCENTROCUSTO, DOCUMENTO.PLACONTA,  ' +#13+
        '  (''D'') AS DEBCRE, ' +#13+
        '  DOCUMENTO.CODSUBCONTA, DOCUMENTO.IDFORCLI, DOCUMENTO.CODGRUPOCNAB, DOCUMENTO.NOSSONUMERO, ' +#13+
        '  IMPOSTORETIDO.VLRRETIDO AS VLRLIQUIDO, DOCUMENTO.CODTIPDOC, DOCUMENTO.IDMODULO ' +#13+
        'FROM ' +#13+
        '  DOCUMENTO, ' +#13+
        '  PESSOA, ' +#13+
        '  LANCTODOCUM, ' +#13+
        '  IMPOSTORETIDO ' +#13+
        'WHERE ' +#13+
        '  IMPOSTORETIDO.NUMLOTEMANUAL IN (' + sNumLoteManual + ') AND ' +#13+
        '  IMPOSTORETIDO.CODDOCLANCADO = DOCUMENTO.CODDOCUMENTO AND '+#13+
        '  DOCUMENTO.IDFORCLI = PESSOA.IDPESSOA AND '+#13+
        '  DOCUMENTO.CODDOCUMENTO = LANCTODOCUM.CODDOCUMENTO AND '+#13+
        '  DOCUMENTO.STATUS <> ''2'' AND '+#13+
        '  DOCUMENTO.OPERACAO = LANCTODOCUM.OPERACAO '+#13+
        'UNION '+#13+ {Documento de Arredondamento lançado}
        'SELECT '+#13+
        '  DOCUMENTO.CODDOCUMENTO, LANCTODOCUM.NUMLANCTO, DOCUMENTO.IDUSUARIOINCLUSAO, '+#13+
        '  PESSOA.RAZAOSOCIAL AS NOME, DOCUMENTO.DATAPROGRAMADA, '+#13+
        '  DOCUMENTO.IDPESSOA, DOCUMENTO.DATAVENCTO, DOCUMENTO.NODOCUMENTO, '+#13+
        '  DOCUMENTO.COMPLDOCUMENTO, DOCUMENTO.OPERACAO, '+#13+
        '  LANCTODOCUM.VALOR AS VALORIMPOSTO, '+#13+
        '  LANCTODOCUM.VALOR AS VALOR, '+#13+
        '  LANCTODOCUM.VALOROUTRAMOEDA, DOCUMENTO.CODCENTROCUSTO, DOCUMENTO.PLACONTA,  '+#13+
        '  (''D'') AS DEBCRE, '+#13+
        '  DOCUMENTO.CODSUBCONTA, DOCUMENTO.IDFORCLI, DOCUMENTO.CODGRUPOCNAB, DOCUMENTO.NOSSONUMERO, '+#13+
        '  LANCTODOCUM.VLRLIQUIDO, DOCUMENTO.CODTIPDOC, DOCUMENTO.IDMODULO '+#13+
        'FROM '+#13+
        '  DOCUMENTO, '+#13+
        '  PESSOA, '+#13+
        '  LANCTODOCUM '+#13+
        'WHERE '+#13+
        '  DOCUMENTO.CODDOCUMENTO = '+ IntToStr(iNumDocArredonda)+ ' AND '+#13+
        '  DOCUMENTO.IDFORCLI = PESSOA.IDPESSOA AND '+#13+
        '  DOCUMENTO.STATUS <> ''2'' AND ' +  
        '  DOCUMENTO.CODDOCUMENTO = LANCTODOCUM.CODDOCUMENTO AND ' +#13+
        '  DOCUMENTO.OPERACAO = LANCTODOCUM.OPERACAO ' +#13+
        'UNION ' + {Documento de CPMF de Transferencia e movimento financeiro}
        'SELECT '+#13+
        '  DOCUMENTO.CODDOCUMENTO, LANCTODOCUM.NUMLANCTO, DOCUMENTO.IDUSUARIOINCLUSAO, ' +#13+
        '  PESSOA.RAZAOSOCIAL AS NOME, DOCUMENTO.DATAPROGRAMADA, '+#13+
        '  DOCUMENTO.IDPESSOA, DOCUMENTO.DATAVENCTO, DOCUMENTO.NODOCUMENTO, '+#13+
        '  DOCUMENTO.COMPLDOCUMENTO, DOCUMENTO.OPERACAO, '+#13+
        '  LANCTODOCUM.VALOR AS VALORIMPOSTO, '+#13+
        '  LANCTODOCUM.VALOR AS VALOR, '+#13+
        '  LANCTODOCUM.VALOROUTRAMOEDA, DOCUMENTO.CODCENTROCUSTO, DOCUMENTO.PLACONTA,  '+#13+
        '  (''D'') AS DEBCRE, '+#13+
        '  DOCUMENTO.CODSUBCONTA, DOCUMENTO.IDFORCLI, DOCUMENTO.CODGRUPOCNAB, DOCUMENTO.NOSSONUMERO, '+#13+
        '  LANCTODOCUM.VLRLIQUIDO, DOCUMENTO.CODTIPDOC, DOCUMENTO.IDMODULO '+#13+
        'FROM '+#13+
        '  DOCUMENTO, '+#13+
        '  PESSOA, '+#13+
        '  LANCTODOCUM '+#13+
        'WHERE '+#13+
        '  DOCUMENTO.CODDOCUMENTO = '+ IntToStr(iNumDocLancado) + ' AND '+#13+
        '  DOCUMENTO.IDFORCLI = PESSOA.IDPESSOA AND '+#13+
        '  DOCUMENTO.STATUS <> ''2'' AND '+#13+
        '  DOCUMENTO.CODDOCUMENTO = LANCTODOCUM.CODDOCUMENTO AND '+#13+
        '  DOCUMENTO.OPERACAO = LANCTODOCUM.OPERACAO '+#13+
        ' UNION '+#13+
        'SELECT '+#13+
        '  DOCUMENTO.CODDOCUMENTO, LANCTODOCUM.NUMLANCTO, DOCUMENTO.IDUSUARIOINCLUSAO, '+#13+
        '  PESSOA.RAZAOSOCIAL AS NOME, DOCUMENTO.DATAPROGRAMADA, '+#13+
        '  DOCUMENTO.IDPESSOA, DOCUMENTO.DATAVENCTO, DOCUMENTO.NODOCUMENTO, '+#13+
        '  DOCUMENTO.COMPLDOCUMENTO, DOCUMENTO.OPERACAO, '+#13+
        '  IMPOSTORETIDO.VLRRETIDO AS VALORIMPOSTO, '+#13+
        '  LANCTODOCUM.VALOR AS VALOR, '+#13+
        '  (0) AS VALOROUTRAMOEDA, DOCUMENTO.CODCENTROCUSTO, DOCUMENTO.PLACONTA, '+#13+
        '  (''D'') AS DEBCRE, '+#13+
        '  DOCUMENTO.CODSUBCONTA, IMPOSTORETIDO.IDFORCLI, DOCUMENTO.CODGRUPOCNAB, DOCUMENTO.NOSSONUMERO, '+#13+
        '  IMPOSTORETIDO.VLRRETIDO AS VLRLIQUIDO, DOCUMENTO.CODTIPDOC, DOCUMENTO.IDMODULO '+#13+
        'FROM DOCUMENTO, '+#13+
        '     PESSOA, '+#13+
        '     LANCTODOCUM, '+#13+
        '     IMPOSTORETIDO, MOVIMFINANC  '+#13+
        'WHERE '+#13+
        '  IMPOSTORETIDO.CODDOCUMENTO IS NULL AND '+#13+
        '  IMPOSTORETIDO.CODDOCLANCADO = DOCUMENTO.CODDOCUMENTO AND '+#13+
        '  MOVIMFINANC.CODLANCFINANC = MOVIMFINANC.CODLANCFINANC AND '+#13+
        '  NVL(IMPOSTORETIDO.FLGCONCILIADO,''N'') = ''S'' AND ' + #13 +
        '  NVL(IMPOSTORETIDO.NUMLOTEMANUAL, 0) = 0 AND ' + #13 +
        '  DOCUMENTO.IDFORCLI = PESSOA.IDPESSOA AND '+#13+
        '  DOCUMENTO.CODDOCUMENTO = LANCTODOCUM.CODDOCUMENTO AND '+#13+
        '  DOCUMENTO.STATUS <> ''2'' AND '+#13+
        '  DOCUMENTO.OPERACAO = LANCTODOCUM.OPERACAO AND '+#13+
        '  DOCUMENTO.IDMODULO <> 3 '+#13+
        ' ) DOCS WHERE  DOCS.DATAPROGRAMADA = TO_DATE('+ quotedStr(DateToStr(dDataBaixa))+', ''DD/MM/YYYY'') AND DOCS.IDFORCLI = '+ intToStr(iIdForCli) +#13;

   if trim (sFiltroDocs) <> '' then
     FDtmConciliaCPMFMT.SQLDocsBaixaLote.SQL.Text := FDtmConciliaCPMFMT.SQLDocsBaixaLote.SQL.Text + ' AND CODDOCUMENTO IN ( ' + sFiltroDocs + ' )'+#13;
//fim - andré tavares - pendência 23827 - 27/11/2006


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
            GetSequence('NUMCHQBORD'), FDtmConciliaCPMFMT.CdsDocsBaixaLote.Data, 0, //Paulo Nobre SOL 235849 PPM 459943
//            date, // Paulo Nobre - Sol 214738_15892  KTN 2057238 - 13/03/2014
            dDataBaixa, TSistemaLancto(iIdModulo - 3), False, iIdUsuario, fIdPessoa,
            iIdEspAcesso, iPlano, bUsaPlanoPatro, bLancaContab, bPartidaDobrada, false, 0) then
            raise Exception.Create(_BaixaDocumentos.MessageInfo);

    {** Caso exista diferença de lançamento da cpmf, é corrigida a contabilização da baixa da mesma **}
    If (_BaixaDocumentos.PlnCodigoBaixa > 0) And (Not IsFloatZero(rValorDiferenca)) Then
    Begin
       {** Arredonda Lançamentos Contábeis da baixa **}
       ArredondaLancamentosContabeis(_BaixaDocumentos.PlnCodigoBaixa);

       //andre tavares - pendência 24713 - 15/03/2007 - faz um update para que fique com o mesmo codigo de lancamento
       if not execSql('UPDATE RECBTOPAGTO SET CODLANCFINANC = '+ IntToStr(iCodLancFinancArredonda) + ' WHERE CODDOCUMENTO = '+ intToStr(iNumDocArredonda) )  then
          raise Exception.Create(MessageInfo);

       {** Faz update do arredondamento no Rateiofinanc do lançamento de baixa **}
       _Cds.Data := GetDataPacket('SELECT CODLANCFINANC FROM RECBTOPAGTO WHERE CODDOCUMENTO = ' + IntToStr(iCodDocumentoArredonda));
       iCodLancFinancArredonda := _Cds.FieldByName('CODLANCFINANC').AsInteger;

       if not ExecSql('UPDATE MOVIMFINANC SET VALORLANCFINAN = VALORLANCFINAN + ' + FloatToStrCM(rValorDiferenca) + ' WHERE CODLANCFINANC = ' + IntToStr(iCodLancFinancArredonda)) then
          raise Exception.Create(MessageInfo);

       _Cds.Data := GetDataPacket('SELECT MIN(IDRATEIOFINANC) AS IDRATEIOFINANC FROM RATEIOFINANC WHERE CODLANCFINANC = ' + IntToStr(iCodLancFinancArredonda));
       idRateioFinancArredonda := _Cds.FieldByName('IDRATEIOFINANC').AsInteger;

       if not ExecSql('UPDATE RATEIOFINANC SET VALOR = VALOR + ' + FloatToStrCM(rValorDiferenca) + ' WHERE IDRATEIOFINANC = ' + IntToStr(idRateioFinancArredonda)) then
          raise Exception.Create(MessageInfo);

       {** faz update do arredondamento no RateioDocum de um documento da CPMF **}
       _Cds.Data := GetDataPacket('SELECT MIN(IDRATEIODOCUM) AS IDRATEIODOCUM FROM RATEIODOCUM WHERE CODDOCUMENTO = ' + IntToStr(iCodDocumentoArredonda));
       idRateioDocumArredonda := _Cds.FieldByName('IDRATEIODOCUM').AsInteger;

       if not ExecSql('UPDATE RATEIODOCUM SET VALOR = VALOR + ' + FloatToStrCM(rValorDiferenca) + ' WHERE IDRATEIODOCUM = ' + IntToStr(idRateioDocumArredonda)) then
          raise Exception.Create(MessageInfo);

       {** faz update do arredondamento na lanctodocum de um documento da CPMF  **}
       if not ExecSql('UPDATE LANCTODOCUM SET VALOR = VALOR + ' + FloatToStrCM(rValorDiferenca) + ' WHERE CODDOCUMENTO = ' + IntToStr(iCodDocumentoArredonda)) then
          raise Exception.Create(MessageInfo);

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


        // Marchetti
        sHistorico       := '';
        rValorCPMFTransf := 0;
        bExisteTransf    := False;
        // Fim Marchetti

        While Not _CdsLotesBaixa.Eof Do
        Begin
           If (_CdsLotesBaixa.FieldByName('FLGCONFIRMARECPAG').AsString = 'S') Then
              rValorCpmf := rValorCpmf + _CdsLotesBaixa.FieldByName('VALCALCULADO').AsFloat;

           // Marchetti
           If (_CdsLotesBaixa.FieldByName('ORIGEM').AsString = 'T') and
              (_CdsLotesBaixa.FieldByName('FLGCONFIRMARECPAG').AsString = 'S') Then
           begin
              bExisteTransf := True;
              if sHistorico <> '' then sHistorico := sHistorico + ',';
              sHistorico := sHistorico + _CdsLotesBaixa.FieldByName('IDIMPOSTORETIDO').AsString;
              rValorCPMFTransf := rValorCPMFTransf + _CdsLotesBaixa.FieldByName('VALCALCULADO').AsFloat;
           end;
           // Fim Marchetti
           _CdsLotesBaixa.Next;
        End;
        _CdsLotesBaixa.First;

        iNumDocLancado := -1;
        iNumDocArredonda := -1;

        // andré tavares - pendência 24417 - 06/02/2007 - envento para lançamento de arredondamento de cpmf (chamada do form de lançamento a ser associado na inteface)
        if assigned(onLancaArredondamento) then
        begin
          try
            if not onLancaArredondamento(iIdForCli, dDataBaixa, rValorCpmf, icodportForma, iNumDocArredonda) then
            begin
              Rollback;
              exit;
            end;
           except
             On E:Exception Do
             begin
               messageInfo := E.message;
               raise;
             end;
           end;
         end;

        sNumLoteManual := '';
        sNumLoteAutomatico := '';

        While Not _CdsLotesBaixa.Eof Do
        Begin
           If (_CdsLotesBaixa.FieldByName('FLGCONFIRMARECPAG').AsString = 'S') Then
           Begin
             If _CdsLotesBaixa.FieldByName('ORIGEM').AsString = 'M' Then
              begin
                 if sNumLoteManual <> '' then sNumLoteManual := sNumLoteManual + ',';
                 sNumLoteManual := sNumLoteManual + _CdsLotesBaixa.FieldByName('NUMLOTE').AsString;
              end
              else

              If _CdsLotesBaixa.FieldByName('ORIGEM').AsString = 'L' Then
              begin
                 if sNumLoteAutomatico <> '' then sNumLoteAutomatico := sNumLoteAutomatico + ',';
                 sNumLoteAutomatico := sNumLoteAutomatico + _CdsLotesBaixa.FieldByName('NUMLOTE').AsString;
              end
              else

             If _CdsLotesBaixa.FieldByName('ORIGEM').AsString = 'T' Then
             begin
                sHistorico         := '';
                 sNumLoteManual     := '-99';
             end;
             // Fim Marchetti
           End;

           _CdsLotesBaixa.Next;
        End;

        If sNumLoteManual = '' Then sNumLoteManual := '-1';
        If sNumLoteAutomatico = '' Then sNumLoteAutomatico := '-1';

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

      Arredonda('VALCALCULADO','VALORAUDITORIA');
      Arredonda('VALCALCULADO','VALPREVISTO');

      Post;
    End
    Else
//  ******************** Marchetti *********************
    If (FieldByName('ORIGEM').AsString = 'T') Then
    Begin
      Edit;

      FieldByName('VALPREVISTO').AsFloat := FieldByName('VALCALCULADO').AsFloat;
      FieldByName('VALORAUDITORIA').AsFloat := FieldByName('VALCALCULADO').AsFloat;
      FieldByName('VALORLOTE').AsFloat := FieldByName('VALORBASE').AsFloat;

      Arredonda('VALCALCULADO','VALORAUDITORIA');
      Arredonda('VALCALCULADO','VALPREVISTO');

      Post;
//  ******************** Fim Marchetti *********************
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

      Arredonda('VALCALCULADO','VALORAUDITORIA');
      Arredonda('VALCALCULADO','VALPREVISTO');

      Post;
    End;
end;




constructor TCtrlConciliaCPMF.Create;
begin
  inherited;
  // andré tavares - pendência 24417 - 06/02/2007 - envento para lançamento de arredondamento de cpmf (chamada do form de lançamento a ser associado na inteface)
  onLancaArredondamento := nil;

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
                            '   L.OPERACAO in (''5'', ''10'') AND  ' +
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
                     _ImpostoRetido.IdForCli := FDtmConciliaCPMFMT.CdsLoteImposto.FieldByname('IDFORCLI').AsInteger;
                     _ImpostoRetido.RecPag := cRecPag;
                     _ImpostoRetido.IdUsuario := iIdUsuario;

                     //andré tavares - pendência 21219 - 06/02/2006 - aproveitei para resolver o bug da autorização de lançamento de documentos
                     _ImpostoRetido.IdEspAcesso := iIdEspAcesso;

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
   iCodPortador: Integer; sPercentual: string; dDataProgramada: TDateTime; Var rValCalc: Double; rValPercent: Double;
   //  Rodolpho da Silva - P: 19331 - 05/07/2005
   bSelCPMFBaixadas: boolean = False;
   bApenasInconsistentes: boolean = False
   ) : OleVariant;
Var
  sSql: TStringList;
  iRecordCount, iPosicao: Integer;


begin
   try
      sSql := TStringList.Create;

      sSql.Add('SELECT ORIGEM, NUMLOTE, 0 AS CODLANCFINANC, IDFORCLI, IDPESSOA, ');
      sSql.Add('       SUM(VALOR) AS VALCALCULADO, SUM(VALORBASE) AS VALORBASE, ');
      sSql.Add('       DATARETENCAO, ');

      //  Rodolpho da SIlva - P: 19331 - 05/07/2005
      if  not bSelCPMFBaixadas  then
         sSql.Add('   FLGCONFIRMARECPAG, ');

      sSql.Add('   FAVORECIDO,NUMCHQBORDERO, DIASEMANALANCTO, ');
      sSql.Add('       DIASUTEISLANCTO, DATAEMISSAO, (0) AS RECALCULA, ');
      sSql.Add('       SUM(VALORLOTE) AS VALORLOTE, (SUM(VALORLOTE)*  '+ sPercentual +'/100) AS VALPREVISTO, (0) AS VALORAUDITORIA, IDIMPOSTORETIDO ');
      sSql.Add('FROM ');
      sSql.Add('( ');
      sSql.Add(' SELECT  ');
      sSql.Add('   (''L'') AS ORIGEM, ');
      sSql.Add('   LOTEPAGTO.NUMLOTE, ');
      sSql.Add('   PORTADORFORMA.IDFORCLI, ');
      sSql.Add('   PORTADORFORMA.IDPESSOA, ');
      sSql.Add('   SUM(IMPOSTORETIDO.VLRRETIDO) AS VALOR, ');
      sSql.Add('   SUM(IMPOSTORETIDO.VLRBASE) AS VALORBASE, ');
      sSql.Add('   LTXDC.VALOR AS VALORLOTE, ');
      sSql.Add('   IMPOSTORETIDO.DATARETENCAO, ');
      sSql.Add('   0 AS IDIMPOSTORETIDO, ');


      //  Rodolpho da SIlva - P: 19331 - 05/07/2005
      if not bSelCPMFBaixadas  then
         sSql.Add('   DOCUMENTO.FLGCONFIRMARECPAG, ');

      sSql.Add('   LOTEPAGTO.FAVORECIDO, ');
      sSql.Add('   LOTEPAGTO.NUMCHQBORDERO, ');
      sSql.Add('   PORTADORFORMA.DIASEMANALANCTO, ');
      sSql.Add('   PORTADORFORMA.DIASUTEISLANCTO, ');
      sSql.Add('   LOTEPAGTO.DATAEMISSAO ');
      sSql.Add(' FROM ');
     sSql.Add('   DOCUMENTO, ');


      sSql.Add('   LOTEPAGTO, PORTADORFORMA, IMPOSTORETIDO, ');
      sSql.Add('   (SELECT NUMLOTE, SUM(VALOR) AS VALOR FROM LOTEXDOCUM GROUP BY NUMLOTE) LTXDC ');
      sSql.Add(' WHERE ');
      sSql.Add('   DOCUMENTO.RECPAG = ''P'' AND ');

      // Início - Rodolpho da Silva - P: 19331 - 05/07/2005
      if not bSelCPMFBaixadas then
         sSql.Add('   ((DOCUMENTO.STATUS IS NULL) OR (DOCUMENTO.STATUS <> ''2'')) AND ');

      sSql.Add('    (DOCUMENTO.IDPESSOA = ' + IntToStr(fIdPessoa) + ' OR DOCUMENTO.IDPESSOA = 0) AND');
      sSql.Add('     DOCUMENTO.CODDOCUMENTO(+) = IMPOSTORETIDO.CODDOCLANCADO AND');
      sSql.Add( _FuncaoGeral.Decode(iIdForCli, 0,'', '(DOCUMENTO.IDFORCLI = ' + IntToStr(iIdForCli) + ' OR DOCUMENTO.IDFORCLI = 0) AND '));

      // Rodolpho da Silva - P: 20640 - 01/11/2005
      if iTipoSelecao <> 0 then
         sSql.Add(_FuncaoGeral.Decode(iTipoSelecao,1,'(DOCUMENTO.FLGCONFIRMARECPAG = ''S'') AND','((DOCUMENTO.FLGCONFIRMARECPAG = ''N'') OR (DOCUMENTO.FLGCONFIRMARECPAG IS NULL)) AND '));

      sSql.Add(_FuncaoGeral.Decode(iNumLote, 0, '', '(LOTEPAGTO.NUMLOTE = ' + IntToStr(iNumLote) + ' OR LOTEPAGTO.NUMLOTE = 0) AND'));
      sSql.Add( _FuncaoGeral.Decode(dDataProgramada, 0, '', 'IMPOSTORETIDO.DATARETENCAO = TO_DATE(''' + DateToStr(dDataProgramada) + ''',''DD/MM/YYYY'') AND'));
      sSql.Add(_FuncaoGeral.Decode(iCodPortador, 0, '', ' PORTADORFORMA.CODPORTADOR = ' + IntToStr(iCodPortador) + 'AND'));


      sSql.Add('LOTEPAGTO.NUMLOTE          = IMPOSTORETIDO.NUMLOTE(+) AND ');
      sSql.Add('LOTEPAGTO.NUMLOTE             = LTXDC.NUMLOTE AND ');
      sSql.Add('PORTADORFORMA.CODPORTFORMA = LOTEPAGTO.CODPORTFORMA ');

      sSql.Add(' GROUP BY  ');
      sSql.Add('   LOTEPAGTO.NUMLOTE, ');
      sSql.Add('   PORTADORFORMA.IDFORCLI, ');
      sSql.Add('   PORTADORFORMA.IDPESSOA, ');
      sSql.Add('   LTXDC.VALOR, ');
      sSql.Add('   IMPOSTORETIDO.DATARETENCAO, ');

      //  Rodolpho da Silva - P: 19331 -05/07/2005
      if not bSelCPMFBaixadas then
         sSql.Add('   DOCUMENTO.FLGCONFIRMARECPAG, ');


      sSql.Add('   LOTEPAGTO.FAVORECIDO, ');
      sSql.Add('   LOTEPAGTO.NUMCHQBORDERO, ');
      sSql.Add('   PORTADORFORMA.DIASEMANALANCTO, ');
      sSql.Add('   PORTADORFORMA.DIASUTEISLANCTO, ');
      sSql.Add('   LOTEPAGTO.DATAEMISSAO ');

      // andre tavares - 26/02/2007
      //  Se a difenreça estiver entre R$ 0,99 e -R$ 0,99, a linha não é considerada, porém
      //se a diferença estiver  maior que R$ 0,99 e -R$ 0,99, alinha é pintada, como marcador de texto
      if bApenasInconsistentes then
        sSql.Add(' HAVING (LTXDC.VALOR - SUM(IMPOSTORETIDO.VLRBASE) < -1) OR (LTXDC.VALOR - SUM(IMPOSTORETIDO.VLRBASE) > 1) ');

      sSql.Add(' ');
      sSql.Add(' UNION ');
      sSql.Add(' ');
      sSql.Add(' SELECT  ');
      sSql.Add('   (''M'') AS ORIGEM, ');
      sSql.Add('   L.NUMLOTEMANUAL AS NUMLOTE, ');
      sSql.Add('   PORTADORFORMA.IDFORCLI, ');
      sSql.Add('   PORTADORFORMA.IDPESSOA, ');
      sSql.Add('   SUM(IMPOSTORETIDO.VLRRETIDO) AS VALOR, ');
      sSql.Add('   SUM(IMPOSTORETIDO.VLRBASE) AS VALORBASE, ');
      sSql.Add('   L.VALOR AS VALORLOTE, ');
      sSql.Add('   IMPOSTORETIDO.DATARETENCAO, ');
      sSql.Add('   0 AS IDIMPOSTORETIDO, ');

      //  Rodolpho da Silva - P: 19331 - 05/07/2005
      if not bSelCPMFBaixadas then
         sSql.Add('   DOCUMENTO.FLGCONFIRMARECPAG, ');


      sSql.Add('   (''Pagamento Manual'') AS FAVORECIDO, ');
      sSql.Add('   L.NUMCHQBORDERO, ');
      sSql.Add('   PORTADORFORMA.DIASEMANALANCTO, ');
      sSql.Add('   PORTADORFORMA.DIASUTEISLANCTO, ');
      sSql.Add('   L.DATALANCTO ');
      sSql.Add(' FROM ');
      sSql.Add('   DOCUMENTO,');
      sSql.Add('IMPOSTORETIDO, PORTADORFORMA, ');
      sSql.Add('   (SELECT L.NUMLOTEMANUAL, R.CODPORTFORMA, L.DATALANCTO, R.NUMCHQBORDERO, ');
      sSql.Add('    SUM(L.VALOR) AS VALOR ');
      sSql.Add('    FROM LANCTODOCUM L, RECBTOPAGTO R ');
      sSql.Add('    WHERE (L.CODDOCUMENTO = R.CODDOCUMENTO) ');
      sSql.Add(_FuncaoGeral.Decode(iNumLote, 0, '', ' AND (L.NUMLOTEMANUAL = ' + IntToStr(iNumLote) + ' OR L.NUMLOTEMANUAL = 0) '));
      sSql.Add('      AND (L.NUMLANCTO = R.NUMLANCTO) ');
      sSql.Add('      AND ((RTRIM(L.OPERACAO) = ''5'') OR  (RTRIM(L.OPERACAO) = ''10''))');
      sSql.Add('      AND (L.ESTORNO IS NULL) ');
      sSql.Add('    GROUP BY L.NUMLOTEMANUAL, R.CODPORTFORMA, L.DATALANCTO, R.NUMCHQBORDERO) L ');
      sSql.Add(' WHERE ');

      sSql.Add('   DOCUMENTO.RECPAG = ''P'' AND ');
      // Início - Rodolpho da Silva - P: 19331 - 05/07/2005
      if not bSelCPMFBaixadas then
         sSql.Add('   ((DOCUMENTO.STATUS IS NULL) OR (DOCUMENTO.STATUS <> ''2'')) AND ');
      sSql.Add('    (DOCUMENTO.IDPESSOA = ' + IntToStr(fIdPessoa) + ' OR DOCUMENTO.IDPESSOA = 0) AND');
      sSql.Add('    (DOCUMENTO.CODDOCUMENTO(+) = IMPOSTORETIDO.CODDOCLANCADO) AND');
      sSql.Add(_FuncaoGeral.Decode(iIdForCli, 0, '', '(DOCUMENTO.IDFORCLI = ' + IntToStr(iIdForCli) + ' OR DOCUMENTO.IDFORCLI = 0) AND'));

      // Rodolpho da Silva - P: 20640 - 01/11/2005
      if iTipoSelecao <> 0 then
         sSql.Add(_FuncaoGeral.Decode(iTipoSelecao,1,'(DOCUMENTO.FLGCONFIRMARECPAG = ''S'') AND','((DOCUMENTO.FLGCONFIRMARECPAG = ''N'') OR (DOCUMENTO.FLGCONFIRMARECPAG IS NULL)) AND '));

      sSql.Add(_FuncaoGeral.Decode(dDataProgramada, 0, '', 'IMPOSTORETIDO.DATARETENCAO = TO_DATE(''' + DateToStr(dDataProgramada) + ''',''DD/MM/YYYY'') AND '));
      sSql.Add( _FuncaoGeral.Decode(iCodPortador, 0, '','PORTADORFORMA.CODPORTADOR = ' + IntToStr(iCodPortador) + 'AND'));
      sSql.Add('   L.NUMLOTEMANUAL = IMPOSTORETIDO.NUMLOTEMANUAL(+) AND ');
      sSql.Add('   PORTADORFORMA.CODPORTFORMA = L.CODPORTFORMA ');
      sSql.Add(' GROUP BY  ');
      sSql.Add('   L.NUMLOTEMANUAL, ');
      sSql.Add('   PORTADORFORMA.IDFORCLI, ');
      sSql.Add('   PORTADORFORMA.IDPESSOA, ');
      sSql.Add('   L.VALOR, ');
      sSql.Add('   IMPOSTORETIDO.DATARETENCAO, ');

      //  Rodolpho da Silva - P: 19331 - 05/07/2005
      if not bSelCPMFBaixadas then
         sSql.Add('   DOCUMENTO.FLGCONFIRMARECPAG, ');


      sSql.Add('   L.NUMCHQBORDERO, ');
      sSql.Add('   PORTADORFORMA.DIASEMANALANCTO, ');
      sSql.Add('   PORTADORFORMA.DIASUTEISLANCTO, ');
      sSql.Add('   L.DATALANCTO ');

      // andre tavares - 26/02/2007
      //  Se a difenreça estiver entre R$ 0,99 e -R$ 0,99, a linha não é considerada, porém
      //se a diferença estiver  maior que R$ 0,99 e -R$ 0,99, alinha é pintada, como marcador de texto
      if bApenasInconsistentes then
        sSql.Add(' HAVING (L.VALOR - SUM(IMPOSTORETIDO.VLRBASE) < -1.00) OR (L.VALOR - SUM(IMPOSTORETIDO.VLRBASE) > 1.00) ');

      sSql.Add(') ');
      sSql.Add('GROUP BY ');
      sSql.Add('   ORIGEM, NUMLOTE, IDFORCLI, IDPESSOA, DATARETENCAO,');

      // Rodolpho da Silva - P: 19331 - 05/07/2005
      if not bSelCPMFBaixadas then
         sSql.Add('FLGCONFIRMARECPAG, ');


      sSql.Add('   FAVORECIDO,NUMCHQBORDERO, DIASEMANALANCTO, DIASUTEISLANCTO, DATAEMISSAO, IDIMPOSTORETIDO ');
      // ************************    Marchetti *********************************
      sSql.Add(' UNION ');
      sSql.Add(' SELECT');
      sSql.Add('     (''T'') AS ORIGEM,');
      sSql.Add('     IMPOSTORETIDO.NUMLOTE,');
      sSql.Add('     IMPOSTORETIDO.CODLANCFINANC,');
      sSql.Add('     IMPOSTORETIDO.IDFORCLI,');
      sSql.Add('     IMPOSTORETIDO.IDPESSOA,');
      sSql.Add('     IMPOSTORETIDO.VLRRETIDO AS VALOR,');
      sSql.Add('     IMPOSTORETIDO.VLRBASE AS VALORBASE,');
      sSql.Add('     IMPOSTORETIDO.DATARETENCAO,');

      if not bSelCPMFBaixadas then
         sSql.Add('     ''S''  AS FLGCONFIRMARECPAG,');

      sSql.Add('     (''Transferência entre Contas'') AS FAVORECIDO,');
      sSql.Add('     ''               ''  AS NUMCHQBORDERO,');
      sSql.Add('     ''          ''  AS DIASEMANALANCTO,');
      sSql.Add('     0  AS DIASUTEISLANCTO,');
      sSql.Add('     IMPOSTORETIDO.DATALANCTO, ');
      sSql.Add('     (0) AS RECALCULA, MOVIMFINANC.VALORLANCFINAN AS VALORLOTE, (IMPOSTORETIDO.VLRBASE * '+ sPercentual +' /100) AS VALPREVISTO, (0) AS VALORAUDITORIA, ');
      sSql.Add(   '     IMPOSTORETIDO.IDIMPOSTORETIDO ');
      sSql.Add(' FROM');
      sSql.Add('     IMPOSTORETIDO, TRANSFFUNDOS, DOCUMENTO, MOVIMFINANC ');    //andre tavares - 09/01/2006 - incluí a tabela TRANSFFUNDOS para buscar somente as cpmf de transferência
      sSql.Add(' WHERE');
      sSql.Add('    (IMPOSTORETIDO.IDPESSOA = ' + IntToStr(fIdPessoa) + ' OR NVL(IMPOSTORETIDO.IDPESSOA,0) = 0) ');

      //  Rodolpho da Silva - P: 19331 - 05/07/2005
      if not bSelCPMFBaixadas then
         sSql.Add(' AND IMPOSTORETIDO.CODDOCUMENTO IS NULL ');

//início andre tavares - pendência 23827 - 24/11/2006 - não estava buscando os lançamento de cpmf do cfinan (tranf entre contas)
      sSql.Add('  AND NVL(IMPOSTORETIDO.NUMLOTEMANUAL, 0) = 0 ');
//fim andre tavares - pendência 23827 - 24/11/2006

//início - andré tavares - pendência 24294 - 25/01/2007 - adicionei aqui este filtro para somente trazer os documentos em aberto
      sSql.Add('  AND IMPOSTORETIDO.CODDOCLANCADO = DOCUMENTO.CODDOCUMENTO ');
      sSql.Add('  AND DOCUMENTO.STATUS <> ''2'' ');
//fim - andré tavares - pendência 24294 - 25/01/2007
      sSql.Add('  AND IMPOSTORETIDO.CODTIPOCUSTAGREG = (SELECT CODTIPOCUSTAGREG FROM PARAMFINANC)  ');
      sSql.Add('  AND IMPOSTORETIDO.IDIMPOSTORETIDO = TRANSFFUNDOS.IDIMPOSTORETIDO  ');//andre tavares - 09/01/2006 - incluí a tabela movimfinanc para buscar somente as cpmf de transferência
      sSql.Add('  AND TRANSFFUNDOS.CODLANCFINANCS = MOVIMFINANC.CODLANCFINANC ');

      // 22/12/04 -  Rodolpho P: 18362
      sSql.Add(_FuncaoGeral.Decode(iNumLote, 0, '', ' AND (IMPOSTORETIDO.NUMLOTE = ' + IntToStr(iNumLote) +  ')'));
      sSql.Add(_FuncaoGeral.Decode(iIdForCli, 0, '', ' AND (IMPOSTORETIDO.IDFORCLI = ' + IntToStr(iIdForCli) + ' OR NVL(IMPOSTORETIDO.IDFORCLI,0) = 0) '));
      sSql.Add(_FuncaoGeral.Decode(dDataProgramada, 0, '', ' AND IMPOSTORETIDO.DATARETENCAO = TO_DATE(''' + DateToStr(dDataProgramada) + ''',''DD/MM/YYYY'') '));
      sSql.Add(_FuncaoGeral.Decode(iCodPortador, 0, '',' AND IMPOSTORETIDO.CODPORTADOR = ' + IntToStr(iCodPortador)));
      //******************  Fim Marchetti ***********************************
      Case iTipoSelecao of
         1: sSql.Add(' AND NVL(IMPOSTORETIDO.FLGCONCILIADO,''N'') = ''S'' ');
         2: sSql.Add(' AND NVL(IMPOSTORETIDO.FLGCONCILIADO,''N'') = ''N'' ');
      end;

      // andre tavares - 26/02/2007
      //  Se a difenreça estiver entre R$ 0,99 e -R$ 0,99, a linha não é considerada, porém
      //se a diferença estiver  maior que R$ 0,99 e -R$ 0,99, alinha é pintada, como marcador de texto
      if bApenasInconsistentes then
        sSql.Add(' AND NOT ( (MOVIMFINANC.VALORLANCFINAN - IMPOSTORETIDO.VLRBASE) BETWEEN -1.00 AND 1.00 ) ');



      //início - andre tavares - início 21/02/2007 - gerado na movimentação financeira
      sSql.Add('  UNION ');
      sSql.Add('  SELECT ');
      sSql.Add('    (''F'') AS ORIGEM, ');
      sSql.Add('    IMPOSTORETIDO.NUMLOTE, ');
      sSql.Add('    IMPOSTORETIDO.CODLANCFINANC, ');
      sSql.Add('    IMPOSTORETIDO.IDFORCLI, ');
      sSql.Add('    IMPOSTORETIDO.IDPESSOA, ');
      sSql.Add('    IMPOSTORETIDO.VLRRETIDO AS VALOR, ');
      sSql.Add('    IMPOSTORETIDO.VLRBASE AS VALORBASE, ');
      sSql.Add('    IMPOSTORETIDO.DATARETENCAO, ');

      // Alex 24/02/07 homologação - o relatório de CPMF do menu relatórios não estava funcionando
      if not bSelCPMFBaixadas then
         sSql.Add('    ''S''  AS FLGCONFIRMARECPAG, ');

      sSql.Add('    (''Movimentação Financeira'') AS FAVORECIDO, ');
      sSql.Add('    ''               ''  AS NUMCHQBORDERO, ');
      sSql.Add('    ''          ''  AS DIASEMANALANCTO, ');
      sSql.Add('    0  AS DIASUTEISLANCTO, ');
      sSql.Add('    IMPOSTORETIDO.DATALANCTO, ');
      sSql.Add('    (0) AS RECALCULA, MOVIMFINANC.VALORLANCFINAN AS VALORLOTE, (IMPOSTORETIDO.VLRBASE * 0.38 /100) AS VALPREVISTO, (0) AS VALORAUDITORIA, ');
      sSql.Add('    IMPOSTORETIDO.IDIMPOSTORETIDO ');
      sSql.Add('    FROM IMPOSTORETIDO, DOCUMENTO, MOVIMFINANC ');
      sSql.Add('    WHERE ');
      sSql.Add('      (IMPOSTORETIDO.IDPESSOA = ' + IntToStr(fIdPessoa) + ' OR NVL(IMPOSTORETIDO.IDPESSOA,0) = 0) ');
      sSql.Add('      AND IMPOSTORETIDO.CODDOCUMENTO IS NULL ');

      sSql.Add('      AND NVL(IMPOSTORETIDO.NUMLOTEMANUAL, 0) = 0 ');
      sSql.Add('      AND IMPOSTORETIDO.CODDOCLANCADO = DOCUMENTO.CODDOCUMENTO ');
      sSql.Add('      AND DOCUMENTO.STATUS <> ''2'' ');
      sSql.Add('      AND MOVIMFINANC.CODLANCTRANSF IS NULL ');
      sSql.Add('      AND IMPOSTORETIDO.CODLANCFINANC = MOVIMFINANC.CODLANCFINANC ');
      sSql.Add(_FuncaoGeral.Decode(dDataProgramada, 0, '', ' AND IMPOSTORETIDO.DATARETENCAO = TO_DATE(''' + DateToStr(dDataProgramada) + ''',''DD/MM/YYYY'') '));
      sSql.Add(_FuncaoGeral.Decode(iIdForCli, 0, '', ' AND (IMPOSTORETIDO.IDFORCLI = ' + IntToStr(iIdForCli) + ' OR NVL(IMPOSTORETIDO.IDFORCLI,0) = 0) '));
      sSql.Add(_FuncaoGeral.Decode(dDataProgramada, 0, '', ' AND IMPOSTORETIDO.DATARETENCAO = TO_DATE(''' + DateToStr(dDataProgramada) + ''',''DD/MM/YYYY'') '));
      sSql.Add(_FuncaoGeral.Decode(iCodPortador, 0, '',' AND IMPOSTORETIDO.CODPORTADOR = ' + IntToStr(iCodPortador)));

      Case iTipoSelecao of
         1: sSql.Add(' AND NVL(IMPOSTORETIDO.FLGCONCILIADO,''N'') = ''S'' ');
         2: sSql.Add(' AND NVL(IMPOSTORETIDO.FLGCONCILIADO,''N'') = ''N'' ');
      end;
      //fim - andre tavares - início 21/02/2007 - gerado na movimentação financeira

      // andre tavares - 26/02/2007
      //  Se a difenreça estiver entre R$ 0,99 e -R$ 0,99, a linha não é considerada, porém
      //se a diferença estiver  maior que R$ 0,99 e -R$ 0,99, alinha é pintada, como marcador de texto
      if bApenasInconsistentes then
        sSql.Add(' AND NOT ( (MOVIMFINANC.VALORLANCFINAN - IMPOSTORETIDO.VLRBASE) BETWEEN -1.00 AND 1.00 ) ');

      sSql.Add('ORDER BY ');
      sSql.Add('   DATARETENCAO, ');
      sSql.Add('   NUMLOTE ');

      If  FDtmConciliaCPMFMT.CdsRptConciliaCpmf.Active Then
      Begin
         If FDtmConciliaCPMFMT.CdsRptConciliaCpmf.ChangeCount > 0 Then FDtmConciliaCPMFMT.CdsRptConciliaCpmf.CancelUpdates;
         FDtmConciliaCPMFMT.CdsRptConciliaCpmf.Close;
      End;
      //Henrique Massão
      //CMDebugToFile(sSql.getText, 'c:\CPMFCONC.txt');
      CMDebugToFile(sSql.getText, Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa) + '\CPMFCONC.txt');

      Result := GetDataPacket(sSql.Text);

   finally
      FreeAndNil(sSql);
   end;
end;




function TCtrlConciliaCPMF.SelLotesBaixa(dDataProgBaixa: TDateTime; iCodPortForma, iIdForCli, iNumLoteBaixa: Integer): OleVariant;
Var
  sSql: String;
begin
   sSql := 'SELECT ORIGEM, NUMLOTE, IDFORCLI, IDPESSOA, ' +#13+
           '       SUM(VALOR) AS VALCALCULADO,  ' +
           '       DATARETENCAO, FLGCONFIRMARECPAG, FAVORECIDO,NUMCHQBORDERO, DIASEMANALANCTO, ' +#13+
           '       DIASUTEISLANCTO, DATAEMISSAO, (0) AS RECALCULA, ' +#13+
           '       (0) AS VALORLOTE, (0) AS VALPREVISTO, (0) AS VALORAUDITORIA ' +#13+
           // Marchetti
           ', CODDOCUMENTO, CODDOCLANCADO, IDIMPOSTORETIDO ' +#13+
           // Fim Marchetti
           'FROM ' +#13+
           '( ' +#13+
           ' SELECT  ' +#13+
           '   (''L'') AS ORIGEM, ' +#13+
           '   LOTEPAGTO.NUMLOTE, ' +#13+
           '   PORTADORFORMA.IDFORCLI, ' +#13+
           '   PORTADORFORMA.IDPESSOA, ' +#13+
           '   SUM(IMPOSTORETIDO.VLRRETIDO) AS VALOR, ' +#13+
           '   IMPOSTORETIDO.DATARETENCAO, ' +#13+
           '   DOCUMENTO.FLGCONFIRMARECPAG, ' +#13+
           '   LOTEPAGTO.FAVORECIDO, ' +#13+
           '   LOTEPAGTO.NUMCHQBORDERO, ' +
           '   PORTADORFORMA.DIASEMANALANCTO, ' +#13+
           '   PORTADORFORMA.DIASUTEISLANCTO, ' +#13+

           //início - andre tavares - pendência 24294 - 26/01/2007
           '   0 AS CODDOCUMENTO, IMPOSTORETIDO.CODDOCLANCADO, 0 AS IDIMPOSTORETIDO, ' +#13+
           //fim - andre tavares - pendência 24294 - 26/01/2007

           '   LOTEPAGTO.DATAEMISSAO ' +#13+
           ' FROM ' +#13+
           '   DOCUMENTO, LOTEPAGTO, PORTADORFORMA, IMPOSTORETIDO ' +#13+
           ' WHERE ' +#13+
           '   DOCUMENTO.RECPAG = ''P'' AND ' +#13+
           '   ((DOCUMENTO.STATUS IS NULL) OR (DOCUMENTO.STATUS <> ''2'')) AND ' +#13+

           //Filtro seleção da tela
           '     (DOCUMENTO.IDPESSOA = ' + IntToStr(FIdPessoa) + ') AND ' +#13+
           '     (DOCUMENTO.IDFORCLI = ' + IntToStr(iIdForCli) + ') ' +#13+
           _FuncaoGeral.Decode(iNumLoteBaixa,0.00,'',' AND (LOTEPAGTO.NUMLOTE = ' + IntToStr(iNumLoteBaixa) + ') ') +#13+
           _FuncaoGeral.Decode(dDataProgBaixa,0,'',' AND IMPOSTORETIDO.DATARETENCAO = TO_DATE(''' + DateToStr(dDataProgBaixa)+ ''',''DD/MM/YYYY'') ') +#13+
           ' AND (DOCUMENTO.FLGCONFIRMARECPAG = ''S'') ' +#13+
           _FuncaoGeral.Decode(iCodPortForma,0,'',' AND PORTADORFORMA.CODPORTADOR = ' + IntToStr(iCodPortForma)) +#13+
           //Filtro para seleção da tela

           ' AND NVL(IMPOSTORETIDO.FLGCONCILIADO,''N'') = ''S'' ' + #13 + //andre tavares - 21/02/2007

           '   AND DOCUMENTO.CODDOCUMENTO(+) = IMPOSTORETIDO.CODDOCLANCADO AND ' +#13+
           '   LOTEPAGTO.NUMLOTE = IMPOSTORETIDO.NUMLOTE(+) AND ' +#13+
           '   PORTADORFORMA.CODPORTFORMA = LOTEPAGTO.CODPORTFORMA ' + #13+
           ' GROUP BY  ' +#13+
           '   LOTEPAGTO.NUMLOTE, ' +#13+
           '   PORTADORFORMA.IDFORCLI, ' +#13+
           '   PORTADORFORMA.IDPESSOA, ' +#13+
           '   IMPOSTORETIDO.DATARETENCAO, ' +#13+
           '   DOCUMENTO.FLGCONFIRMARECPAG, ' +#13+
           '   LOTEPAGTO.FAVORECIDO, ' +#13+
           '   LOTEPAGTO.NUMCHQBORDERO, ' +#13+
           '   PORTADORFORMA.DIASEMANALANCTO, ' +#13+
           '   PORTADORFORMA.DIASUTEISLANCTO, ' +#13+
           //início - andre tavares - pendência 24294 - 26/01/2007
           '   IMPOSTORETIDO.CODDOCLANCADO, ' +#13+
           //fim - andre tavares - pendência 24294 - 26/01/2007

           '   LOTEPAGTO.DATAEMISSAO ' +#13+
           ' ' +
           ' UNION ' +#13+
           ' ' +#13+
           ' SELECT  ' +#13+
           '   (''M'') AS ORIGEM, ' +#13+
           '   L.NUMLOTEMANUAL AS NUMLOTE, ' +#13+
           '   PORTADORFORMA.IDFORCLI, ' +#13+
           '   PORTADORFORMA.IDPESSOA, ' +#13+
           '   SUM(IMPOSTORETIDO.VLRRETIDO) AS VALOR, ' +#13+
           '   IMPOSTORETIDO.DATARETENCAO, ' +#13+
           '   DOCUMENTO.FLGCONFIRMARECPAG, ' +#13+
           '   (''Pagamento Manual'') AS FAVORECIDO, ' +#13+
           '   L.NUMCHQBORDERO, ' +#13+
           '   PORTADORFORMA.DIASEMANALANCTO, ' +#13+
           '   PORTADORFORMA.DIASUTEISLANCTO, ' +#13+

           //início andré tavares - pendência 24294 - 26/01/2007
           '   0 AS CODDOCUMENTO, IMPOSTORETIDO.CODDOCLANCADO, 0 AS IDIMPOSTORETIDO, ' +#13+
           //fim andré tavares - pendência 24294 - 26/01/2007

           '   L.DATALANCTO ' +#13+
           ' FROM ' +#13+
           '   DOCUMENTO, IMPOSTORETIDO, PORTADORFORMA, ' +#13+
           '   (SELECT L.NUMLOTEMANUAL, R.CODPORTFORMA, L.DATALANCTO, R.NUMCHQBORDERO '+#13+
           '    FROM LANCTODOCUM L, RECBTOPAGTO R '+#13+
           '    WHERE (L.CODDOCUMENTO = R.CODDOCUMENTO) '+#13+
           '      AND (L.NUMLANCTO = R.NUMLANCTO) '+#13+
           '      AND ((RTRIM(L.OPERACAO) = ''5'') OR  (RTRIM(L.OPERACAO) = ''10''))'+#13+
           '      AND (L.ESTORNO IS NULL) '+#13+
           '    GROUP BY L.NUMLOTEMANUAL, R.CODPORTFORMA, L.DATALANCTO, R.NUMCHQBORDERO) L '+#13+
           ' WHERE '+#13+
           '   DOCUMENTO.RECPAG = ''P'' AND ' +#13+
           '   ((DOCUMENTO.STATUS IS NULL) OR (DOCUMENTO.STATUS <> ''2'')) AND ' +#13+
           '     (DOCUMENTO.IDPESSOA = ' + IntToStr(fIdPessoa) + ') AND ' +#13+
           '     (DOCUMENTO.IDFORCLI = ' + IntToStr(iIdForCli) + ') ' +#13+
            _FuncaoGeral.Decode(iNumLoteBaixa,0.00,'',' AND (L.NUMLOTEMANUAL = ' + IntToStr(iNumLoteBaixa) + ') ') +#13+
            _FuncaoGeral.Decode(dDataProgBaixa,0,'',' AND IMPOSTORETIDO.DATARETENCAO = TO_DATE(''' + DateToStr(dDataProgBaixa) + ''',''DD/MM/YYYY'') ') +
           ' AND (DOCUMENTO.FLGCONFIRMARECPAG = ''S'') ' +#13+
            _FuncaoGeral.Decode(iCodPortForma, 0,'',' AND PORTADORFORMA.CODPORTADOR = ' + IntToStr(iCodPortForma)) +
           '   AND DOCUMENTO.CODDOCUMENTO(+) = IMPOSTORETIDO.CODDOCLANCADO AND ' +#13+
           '   L.NUMLOTEMANUAL = IMPOSTORETIDO.NUMLOTEMANUAL(+) AND ' +#13+
           '   PORTADORFORMA.CODPORTFORMA = L.CODPORTFORMA ' +#13+
           '  AND NVL(IMPOSTORETIDO.FLGCONCILIADO,''N'') = ''S'' ' + #13 + //andre tavares - 21/02/2007

           ' GROUP BY  ' +#13+
           '   L.NUMLOTEMANUAL, ' +#13+
           '   PORTADORFORMA.IDFORCLI, ' +#13+
           '   PORTADORFORMA.IDPESSOA, ' +#13+
           '   IMPOSTORETIDO.DATARETENCAO, ' +#13+
           '   DOCUMENTO.FLGCONFIRMARECPAG, ' +#13+
           '   L.NUMCHQBORDERO, ' +#13+
           '   PORTADORFORMA.DIASEMANALANCTO, ' +#13+
           '   PORTADORFORMA.DIASUTEISLANCTO, ' +#13+

           // Marchetti
           '   IMPOSTORETIDO.CODDOCLANCADO, ' +#13+
           // Fim Marchetti
           '   L.DATALANCTO ' +#13+

           ') ' +
           'GROUP BY ' +
           '   ORIGEM, NUMLOTE, IDFORCLI, IDPESSOA, DATARETENCAO, FLGCONFIRMARECPAG, ' +
           '   FAVORECIDO,NUMCHQBORDERO, DIASEMANALANCTO, DIASUTEISLANCTO, DATAEMISSAO ' +

           // Marchetti
           ', CODDOCUMENTO, CODDOCLANCADO, IDIMPOSTORETIDO ' +
           // Fim Marchetti

// ************************    Marchetti *********************************
      ' UNION ' + #13 +
      ' SELECT' + #13 +
      '     (''T'') AS ORIGEM,' + #13 +
      '     IMPOSTORETIDO.NUMLOTE,' + #13 +
      '     IMPOSTORETIDO.IDFORCLI,' + #13 +
      '     IMPOSTORETIDO.IDPESSOA,' + #13 +
      '     IMPOSTORETIDO.VLRRETIDO AS VALCALCULADO,' + #13 +
      '     IMPOSTORETIDO.DATARETENCAO,' + #13 +
      '     ''S''  AS FLGCONFIRMARECPAG,' + #13 +
      '     (''Transferência entre Contas'') AS FAVORECIDO,' + #13 +
      '     ''               ''  AS NUMCHQBORDERO,' + #13 +
      '     ''          ''  AS DIASEMANALANCTO,' + #13 +
      '     0  AS DIASUTEISLANCTO,' + #13 +
      '     IMPOSTORETIDO.DATALANCTO, ' + #13 +
      '     (0) AS RECALCULA, MOVIMFINANC.VALORLANCFINAN AS VALORLOTE, (0) AS VALPREVISTO, (0) AS VALORAUDITORIA, ' + #13 +
      '     IMPOSTORETIDO.CODDOCUMENTO, IMPOSTORETIDO.CODDOCLANCADO, IMPOSTORETIDO.IDIMPOSTORETIDO ' +
      ' FROM' + #13 +
      '     IMPOSTORETIDO, TRANSFFUNDOS, MOVIMFINANC '+ #13+ //andre tavares - 09/01/2006 - incluí a tabela movimfinanc para buscar somente as cpmf de transferência
      ' WHERE' + #13 +
      '    (IMPOSTORETIDO.IDPESSOA = ' + IntToStr(fIdPessoa) + ' OR NVL(IMPOSTORETIDO.IDPESSOA,0) = 0) ' + #13 +
      ' AND IMPOSTORETIDO.CODDOCUMENTO IS NULL ' + #13 +

//início andre tavares - pendência 23827 - 24/11/2006 - não estava buscando os lançamento de cpmf do cfinan (tranf entre contas)
      '  AND NVL(IMPOSTORETIDO.NUMLOTEMANUAL, 0) = 0 ' + #13 +
      '  AND IMPOSTORETIDO.CODDOCLANCADO IS NULL ' + #13 +
//fim andre tavares - pendência 23827 - 24/11/2006

      '  AND IMPOSTORETIDO.CODTIPOCUSTAGREG = (SELECT CODTIPOCUSTAGREG FROM PARAMFINANC)  ' + #13 +

      '  AND IMPOSTORETIDO.IDIMPOSTORETIDO = TRANSFFUNDOS.IDIMPOSTORETIDO  '+ #13 + //andre tavares - 09/01/2006 - incluí a tabela movimfinanc para buscar somente as cpmf de transferência
      '  AND TRANSFFUNDOS.CODLANCFINANCS = MOVIMFINANC.CODLANCFINANC '+#13+

      '  AND NVL(IMPOSTORETIDO.FLGCONCILIADO,''N'') = ''S'' ' + #13 +

       _FuncaoGeral.Decode(iIdForCli, 0, '', ' AND (IMPOSTORETIDO.IDFORCLI = ' + IntToStr(iIdForCli) + ' OR NVL(IMPOSTORETIDO.IDFORCLI,0) = 0) ') + #13 +
       _FuncaoGeral.Decode(dDataProgBaixa, 0, '', ' AND IMPOSTORETIDO.DATARETENCAO = TO_DATE(''' + DateToStr(dDataProgBaixa) + ''',''DD/MM/YYYY'') ') + #13 +
//******************  Fim Marchetti ***********************************

//início andre tavares - pendência 23827 - 24/11/2006 - não estava buscando os lançamento de cpmf do cfinan (tranf entre contas)
      ' UNION ' + #13 +
      ' SELECT' + #13 +
      '     (''T'') AS ORIGEM,' + #13 +
      '     IMPOSTORETIDO.NUMLOTE,' + #13 +
      '     IMPOSTORETIDO.IDFORCLI,' + #13 +
      '     IMPOSTORETIDO.IDPESSOA,' + #13 +
      '     IMPOSTORETIDO.VLRRETIDO AS VALCALCULADO,' + #13 +
      '     IMPOSTORETIDO.DATARETENCAO,' + #13 +
      '     DOCUMENTO.FLGCONFIRMARECPAG,' + #13 + //andre tavares - pendência 24294 - 25/01/2007
      '     (''Transferência entre Contas'') AS FAVORECIDO,' + #13 +
      '     ''               ''  AS NUMCHQBORDERO,' + #13 +
      '     ''          ''  AS DIASEMANALANCTO,' + #13 +
      '     0  AS DIASUTEISLANCTO,' + #13 +
      '     IMPOSTORETIDO.DATALANCTO, ' + #13 +
      '     (0) AS RECALCULA, MOVIMFINANC.VALORLANCFINAN AS VALORLOTE, (0) AS VALPREVISTO, (0) AS VALORAUDITORIA, ' + #13 +
      '     IMPOSTORETIDO.CODDOCUMENTO, IMPOSTORETIDO.CODDOCLANCADO, IMPOSTORETIDO.IDIMPOSTORETIDO ' +
      ' FROM' + #13 +
      '     IMPOSTORETIDO, DOCUMENTO, MOVIMFINANC, ' + #13 +
      '     TRANSFFUNDOS '+ #13+ //andre tavares - 09/01/2006 - incluí a tabela movimfinanc para buscar somente as cpmf de transferência
      ' WHERE' + #13 +
      '    (IMPOSTORETIDO.IDPESSOA = ' + IntToStr(fIdPessoa) + ' OR NVL(IMPOSTORETIDO.IDPESSOA,0) = 0) ' + #13 +
      '  AND IMPOSTORETIDO.CODDOCUMENTO IS NULL ' + #13 +
      '  AND NVL(IMPOSTORETIDO.NUMLOTEMANUAL, 0) = 0 ' + #13 +
      '  AND IMPOSTORETIDO.CODTIPOCUSTAGREG = (SELECT CODTIPOCUSTAGREG FROM PARAMFINANC)  ' + #13 +
      '  AND TRANSFFUNDOS.CODLANCFINANCS = MOVIMFINANC.CODLANCFINANC '+#13+

      '  AND IMPOSTORETIDO.IDIMPOSTORETIDO = TRANSFFUNDOS.IDIMPOSTORETIDO '+ #13 + //andre tavares - 09/01/2006 - incluí a tabela movimfinanc para buscar somente as cpmf de transferência
      '  AND NVL(IMPOSTORETIDO.FLGCONCILIADO,''N'') = ''S'' ' + #13 +
      '  AND IMPOSTORETIDO.CODDOCLANCADO = DOCUMENTO.CODDOCUMENTO '+ #13 +
      '  AND DOCUMENTO.STATUS <> ''2'' '+ #13 +

       _FuncaoGeral.Decode(iIdForCli, 0, '', ' AND (IMPOSTORETIDO.IDFORCLI = ' + IntToStr(iIdForCli) + ' OR NVL(IMPOSTORETIDO.IDFORCLI,0) = 0) ') + #13 +
       _FuncaoGeral.Decode(dDataProgBaixa, 0, '', ' AND IMPOSTORETIDO.DATARETENCAO = TO_DATE(''' + DateToStr(dDataProgBaixa) + ''',''DD/MM/YYYY'') ') + #13 +
//fim andre tavares - pendência 23827 - 24/11/2006

      //início - andre tavares - início 21/02/2007 - gerado na movimentação financeira
      '  UNION ' + #13 +
      '  SELECT ' + #13 +
      '     (''F'') AS ORIGEM,' + #13 +
      '     IMPOSTORETIDO.NUMLOTE,' + #13 +
      '     IMPOSTORETIDO.IDFORCLI,' + #13 +
      '     IMPOSTORETIDO.IDPESSOA,' + #13 +
      '     IMPOSTORETIDO.VLRRETIDO AS VALCALCULADO,' + #13 +
      '     IMPOSTORETIDO.DATARETENCAO,' + #13 +
      '     DOCUMENTO.FLGCONFIRMARECPAG,' + #13 +
      '     (''Movimentação Financeira'') AS FAVORECIDO,' + #13 +
      '     ''               ''  AS NUMCHQBORDERO,' + #13 +
      '     ''          ''  AS DIASEMANALANCTO,' + #13 +
      '     0  AS DIASUTEISLANCTO,' + #13 +
      '     IMPOSTORETIDO.DATALANCTO, ' + #13 +
      '     (0) AS RECALCULA, MOVIMFINANC.VALORLANCFINAN AS VALORLOTE, (0) AS VALPREVISTO, (0) AS VALORAUDITORIA, ' + #13 +
      '     IMPOSTORETIDO.CODDOCUMENTO, IMPOSTORETIDO.CODDOCLANCADO, IMPOSTORETIDO.IDIMPOSTORETIDO ' +
      '    FROM IMPOSTORETIDO, DOCUMENTO, MOVIMFINANC ' + #13 +
      '    WHERE ' + #13 +
      '      (IMPOSTORETIDO.IDPESSOA = ' + IntToStr(fIdPessoa) + ' OR NVL(IMPOSTORETIDO.IDPESSOA,0) = 0) ' + #13 +
      '      AND IMPOSTORETIDO.CODDOCUMENTO IS NULL ' + #13 +
      '      AND NVL(IMPOSTORETIDO.NUMLOTEMANUAL, 0) = 0 ' + #13 +
      '      AND IMPOSTORETIDO.CODDOCLANCADO = DOCUMENTO.CODDOCUMENTO ' + #13 +
      '      AND MOVIMFINANC.CODLANCTRANSF IS NULL ' + #13 +
      '      AND IMPOSTORETIDO.CODLANCFINANC = MOVIMFINANC.CODLANCFINANC '+ #13 +
      '      AND DOCUMENTO.STATUS <> ''2'' ' + #13 +
      '      AND NVL(IMPOSTORETIDO.FLGCONCILIADO,''N'') = ''S'' ' + #13 +

      _FuncaoGeral.Decode(dDataProgBaixa, 0, '', ' AND IMPOSTORETIDO.DATARETENCAO = TO_DATE(''' + DateToStr(dDataProgBaixa) + ''',''DD/MM/YYYY'') ') + #13 +
      _FuncaoGeral.Decode(iIdForCli, 0, '', ' AND (IMPOSTORETIDO.IDFORCLI = ' + IntToStr(iIdForCli) + ' OR NVL(IMPOSTORETIDO.IDFORCLI,0) = 0) ') + #13 +

      //fim - andre tavares - início 21/02/2007 - gerado na movimentação financeira

     ' ORDER BY DATARETENCAO, NUMLOTE ';
    //Henrique Massão
   //CMDebugToFile(sSQL, 'c:\CPMFBAIXA.txt');
   CMDebugToFile(sSQL, Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa) + '\CPMFBAIXA.txt');

   Result := GetDataPacket(sSQL);
end;




function TCtrlConciliaCPMF.SelLotesVazios: OleVariant;
begin
  result := GetDataPacket(
            ' SELECT ORIGEM, NUMLOTE, IDFORCLI, IDPESSOA, ' +
            '        (0) AS VALORLOTE , (0) AS VALPREVISTO, VALOR AS VALCALCULADO, (0) VALORAUDITORIA, ' +
            '        DATARETENCAO, FLGCONFIRMARECPAG,FAVORECIDO,NUMCHQBORDERO, DIASEMANALANCTO, ' +
            '        DIASUTEISLANCTO, DATAEMISSAO, (0) AS RECALCULA, (0) AS VALORBASE, ' +
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




function TCtrlConciliaCPMF.ProcessaConciliaCPMF(OvLotes: OleVariant; bReprogramaNaoConciliados: Boolean; dataReprog: TDateTime = 0): Boolean;
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
             //pendência 26936 - 30/11/2007
             if trunc(dataReprog) = 0 then
               AtualizaDocs(FDtmConciliaCPMFMT.SQLUpdDocLote,  FDtmConciliaCPMFMT.SQLExecUpdDocLote, False, true)
             else
               AtualizaDocs(FDtmConciliaCPMFMT.SQLUpdDocLote,  FDtmConciliaCPMFMT.SQLExecUpdDocLote, true, false, dataReprog)

           Else If (_CdsLotes.FieldByName('ORIGEM').AsString = 'M')
           or (_CdsLotes.FieldByName('ORIGEM').AsString = 'T') or (_CdsLotes.FieldByName('ORIGEM').AsString = 'F') // andre tavares - 24/02/2007 - para movimentação financeira ou transferências entre contas
           Then
             //pendência 26936 - 30/11/2007

             if trunc(dataReprog) = 0 then
               AtualizaDocs(FDtmConciliaCPMFMT.SQLUpdDocManual, FDtmConciliaCPMFMT.SQLExecUpdDocManual, False, true)
             else
               AtualizaDocs(FDtmConciliaCPMFMT.SQLUpdDocManual, FDtmConciliaCPMFMT.SQLExecUpdDocManual, true, false, dataReprog);

           //  else andre tavares - 24/02/2007 - comentei este else pois o documento tem que ser conciliado conforma a condição abaixo
           // Marchetti
           if (_CdsLotes.FieldByName('IDIMPOSTORETIDO').asInteger > 0) then // andre tavares - 24/02/2007 - coloquei esta condição
           begin
             If (_CdsLotes.FieldByName('FLGCONFIRMARECPAG').AsString = 'S') then
                ExecSql('UPDATE IMPOSTORETIDO SET FLGCONCILIADO = ''S'' WHERE IDIMPOSTORETIDO = ' + _CdsLotes.FieldByName('IDIMPOSTORETIDO').AsString)
             else
                ExecSql('UPDATE IMPOSTORETIDO SET FLGCONCILIADO = ''N'' WHERE IDIMPOSTORETIDO = ' + _CdsLotes.FieldByName('IDIMPOSTORETIDO').AsString);
           end
           else if (_CdsLotes.FieldByName('NUMLOTE').asInteger > 0) then
           begin //andre tavares - 24/02/2007 - coloquei esta condição
             if (_CdsLotes.FieldByName('ORIGEM').AsString = 'M') then
             begin
               If (_CdsLotes.FieldByName('FLGCONFIRMARECPAG').AsString = 'S') then
                  ExecSql('UPDATE IMPOSTORETIDO SET FLGCONCILIADO = ''S'' WHERE NUMLOTEMANUAL = ' + _CdsLotes.FieldByName('NUMLOTE').AsString)
               else
                  ExecSql('UPDATE IMPOSTORETIDO SET FLGCONCILIADO = ''N'' WHERE NUMLOTEMANUAL = ' + _CdsLotes.FieldByName('NUMLOTE').AsString);
             end
             else if (_CdsLotes.FieldByName('ORIGEM').AsString = 'L') then
             begin
               If (_CdsLotes.FieldByName('FLGCONFIRMARECPAG').AsString = 'S') then
                  ExecSql('UPDATE IMPOSTORETIDO SET FLGCONCILIADO = ''S'' WHERE NUMLOTE = ' + _CdsLotes.FieldByName('NUMLOTE').AsString)
               else
                  ExecSql('UPDATE IMPOSTORETIDO SET FLGCONCILIADO = ''N'' WHERE NUMLOTE = ' + _CdsLotes.FieldByName('NUMLOTE').AsString);
             end;

           end;
           // Fim Marchetti
           _CdsLotes.Next;
        End;

        _CdsLotes.First;
        //Testa se existem documentos não conciliados e reprograma do documentos
        If  (Not _CdsLotes.IsEmpty) And bReprogramaNaoConciliados Then
        Begin
          _CdsLotes.First;
          While Not _CdsLotes.Eof Do
          Begin
             //If (_CdsLotes.FieldByName('FLGCONFIRMARECPAG').AsString <> 'S') Then  //pendência 26936 - 30/11/2007 - este flag está obsoleto
             //Begin
            If _CdsLotes.FieldByName('ORIGEM').AsString = 'L' Then
            Begin
               //pendência 26936 - 30/11/2007
              if trunc(dataReprog) = 0 then
              begin
                AtualizaDocs(FDtmConciliaCPMFMT.SQLUpdDocLote,  FDtmConciliaCPMFMT.SQLExecUpdDocLote, True, true);
                AtualizaDataImposto(false, _CdsLotes.FieldByName('NUMLOTE').AsInteger, 0);
              end
              else
              begin
               AtualizaDocs(FDtmConciliaCPMFMT.SQLUpdDocLote,  FDtmConciliaCPMFMT.SQLExecUpdDocLote, true, false, dataReprog);
               AtualizaDataImposto(false, _CdsLotes.FieldByName('NUMLOTE').AsInteger, dataReprog);
              end;
            End
            Else
                                                                  //pendência 26936 - 03/12/2007
            If (_CdsLotes.FieldByName('ORIGEM').AsString = 'T') or (_CdsLotes.FieldByName('ORIGEM').AsString = 'F') Then
            Begin
               // início andre tavares - pendencia 21775
               _ImpostoRetido.idImpostoRetido := _CdsLotes.FieldByName('IDIMPOSTORETIDO').asInteger;
               _impostoRetido.CodPortForma := getCodPortForma;
               _impostoRetido.CodLancFinanc := _CdsLotes.FieldByName('CODLANCFINANC').AsInteger;
               // fim andre tavares - pendencia 21775

               if dataReprog = 0 then
               begin
                 ExecSql('UPDATE IMPOSTORETIDO SET FLGCONCILIADO = ''N'', DATARETENCAO = ' +  //reprograma em cima da data corrente
                         'TO_DATE(' +
                          //início andré tavares - pendência 21775 - 16/03/2006
                          QuotedStr(FormatDateTime('dd/mm/yyyy',_ImpostoRetido.GetDataLancDocImposto(_CdsLotes.FieldByName('DATARETENCAO').AsDateTime))) +
                          //fim andré tavares - pendência 21775 - 16/03/2006
                          ',''dd/mm/yyyy'') ' +
                          ' WHERE IDIMPOSTORETIDO = ' + _CdsLotes.FieldByName('IDIMPOSTORETIDO').AsString);
               end
               else
               begin //pendência 26936 - 30/11/2007
                 ExecSql('UPDATE IMPOSTORETIDO SET FLGCONCILIADO = ''N'', DATARETENCAO = ' +  //reprograma em cima da data selecionada
                         'TO_DATE(' +
                          //início andré tavares - pendência 21775 - 16/03/2006
                          QuotedStr(FormatDateTime('dd/mm/yyyy', dataReprog)) +
                          //fim andré tavares - pendência 21775 - 16/03/2006
                          ',''dd/mm/yyyy'') ' +
                          ' WHERE IDIMPOSTORETIDO = ' + _CdsLotes.FieldByName('IDIMPOSTORETIDO').AsString);
               end;
            End
            // Fim Marchetti
            Else
            Begin
               //pendência 26936 - 30/11/2007
              if trunc(dataReprog) = 0 then
              begin
                AtualizaDocs(FDtmConciliaCPMFMT.SQLUpdDocManual, FDtmConciliaCPMFMT.SQLExecUpdDocManual, True, true);
                AtualizaDataImposto(True, _CdsLotes.FieldByName('NUMLOTE').AsInteger, 0);
              end
              else
              begin
                AtualizaDocs(FDtmConciliaCPMFMT.SQLUpdDocManual, FDtmConciliaCPMFMT.SQLExecUpdDocManual, True, false, dataReprog);
                AtualizaDataImposto(True, _CdsLotes.FieldByName('NUMLOTE').AsInteger, dataReprog);
              end;
            End;
             //End;
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
                                              dData: TDateTime; bIntegraContab: Boolean; idimpostoretido: integer): Boolean;
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

        //andré tavares - pendência 24748 - 21/03/2007 - comentei acima e refiz abaixo para que seja possível localizar através do impostoretido (cpmf de transferencia e movimento finaceiro)
        if not _CdsLotes.Locate('NUMLOTE', iNumLote, []) then
          _cdsLotes.Locate('IDIMPOSTORETIDO', idimpostoretido, []);


        If _CdsLotes.FieldByName('ORIGEM').AsString = 'L' Then
        begin
           AtualizaDocs(FDtmConciliaCPMFMT.SQLUpdDocLote,  FDtmConciliaCPMFMT.SQLExecUpdDocLote, True, true, dData); //andre tavares - pendência 24748 - 16/03/2007
           AtualizaDataImposto(false, iNumLote, dData);
        end
        Else
        begin
           AtualizaDocs(FDtmConciliaCPMFMT.SQLUpdDocManual, FDtmConciliaCPMFMT.SQLExecUpdDocManual, True, true, dData); //andre tavares - pendência 24748 - 16/03/2007

           If _CdsLotes.FieldByName('ORIGEM').AsString[1] in ['T', 'F'] Then // andré tavares - pendência 24748 - somente cpmf transferncias entre contas e movimentos financeiros
             AtualizaDataImposto(false, 0, dData)
           else
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
          begin
            _ImpostoRetido.CodDocumento := CdsUpdImpostoManual.FieldByName('CODDOCUMENTO').AsInteger;
            _impostoRetido.CodPortForma := getCodPortForma;
            _impostoRetido.CodLancFinanc := _CdsLotes.FieldByName('CODLANCFINANC').AsInteger;
            ExecUpdImpostoManual.ParamByName('DATARETENCAO').AsDate := _ImpostoRetido.GetDataLancDocImposto(CdsUpdImpostoManual.FieldByName('DATARETENCAO').AsDateTime)
          end
          else
            ExecUpdImpostoManual.ParamByName('DATARETENCAO').AsDate := dData;


          //  Executa as instruções de UPDATE na tabela IMPOSTORETIDO...
          if not ExecSQL(ExecUpdImpostoManual.SQLChanged) then raise Exception.Create(MessageInfo);


          CdsUpdImpostoManual.Next;
        End;
     end;
  end
  else
  begin
     With FDtmConciliaCPMFMT, SQLUpdImposto Do
     Begin
        if iNumLote > 0 then
        begin
          If Not Prepared Then Prepare;
          ParamByName('NUMLOTE').AsFloat := iNumLote;
          Open;
        end else // andré tavares - pendência 24748 - somente cpmf transferncias entre contas e movimentos financeiros
        begin
          CdsUpdImposto.Data := getDataPacket( ' SELECT DATARETENCAO, IDIMPOSTORETIDO, CODDOCUMENTO, CODDOCLANCADO '+
                                               ' FROM IMPOSTORETIDO WHERE IDIMPOSTORETIDO = '+ _CdsLotes.FieldByName('IDIMPOSTORETIDO').asString );
        end;

        CdsUpdImposto.First;
        While Not CdsUpdImposto.Eof Do
        Begin
          ExecUpdImposto.Prepare;
          ExecUpdImposto.ParamByName('IDIMPOSTORETIDO').AsInteger := CdsUpdImposto.FieldByName('IDIMPOSTORETIDO').AsInteger;


          if dData = 0 then
          begin
            _ImpostoRetido.idImpostoRetido := CdsUpdImposto.FieldByName('IDIMPOSTORETIDO').AsInteger;
            _impostoRetido.CodPortForma := getCodPortForma;
            _impostoRetido.CodLancFinanc := _CdsLotes.FieldByName('CODLANCFINANC').AsInteger;

            ExecUpdImposto.ParamByName('DATARETENCAO').AsDate     := _ImpostoRetido.GetDataLancDocImposto(CdsUpdImposto.FieldByName('DATARETENCAO').AsDateTime)
          end
          else
            ExecUpdImposto.ParamByName('DATARETENCAO').AsDate     := dData;


          //  Executa as instruções de UPDATE nas tabelas IMPOSTORETIDO e DOCUMENTO...
          if not ExecSQL(ExecUpdImposto.SQLChanged)   then raise Exception.Create(MessageInfo);


          CdsUpdImposto.Next;
        End;
     End;
  end

end;


//início - andre tavares - ajuste da pendência 21775 - 10/04/2006
function TCtrlConciliaCPMF.getCodPortForma: integer;
var sSQL: string;
begin
  result := 0;
  //  Se for uma CPMF de transferência entre contas
  if _CdsLotes.FieldByName('NUMLOTE').IsNull then
    sSQL := ' SELECT PF.CODPORTFORMA '                  + #13 +
            ' FROM '                                    + #13 +
            '   IMPOSTORETIDO I, '                      + #13 +
            '   MOVIMFINANC M, '                        + #13 +
            '   PORTADORFORMA PF '                      + #13 +
            ' WHERE '                                   + #13 +
            '   I.CODLANCFINANC = M.CODLANCFINANC AND ' + #13 +
            '   M.CODPORTADOR  = PF.CODPORTADOR  AND '  + #13 +
            '   I.CODLANCFINANC = ' + _CdsLotes.FieldByName('CODLANCFINANC').AsString

  //  Caso contrário...
  else
    sSQL   :=  ' SELECT R.CODPORTFORMA  '+#13 +
               ' FROM '                                    + #13 +
               '   IMPOSTORETIDO I, '                      + #13 +
               '   RECBTOPAGTO R '                         + #13 +
               ' WHERE '                                   + #13 +
               ' R.NUMLOTE       = I.NUMLOTEMANUAL '       + #13 +
               ' AND   I.NUMLOTEMANUAL = ' + _CdsLotes.FieldByName('NUMLOTE').AsString + #13 +
               //início - andre tavares - 17/04/2006 - pendencia 21775 - resolução do probelama detectado pela homologação
               ' UNION '+ #13 +
               ' SELECT L.CODPORTFORMA FROM LOTEPAGTO L, IMPOSTORETIDO I '+ #13 +
               ' WHERE I.NUMLOTE = L.NUMLOTE AND '+ #13 +
               ' L.NUMLOTE = ' + _CdsLotes.FieldByName('NUMLOTE').AsString;
               //fim - andre tavares - 17/04/2006 - pendencia 21775 - resolução do probelama detectado pela homologação

  with TClientDataset.Create(nil) do
  begin
   try
     Data := GetDataPacket(sSQL);
   finally
     result := fieldByName('CODPORTFORMA').asInteger;
     free;
   end;//try
  end;//with
end;
//fim - andre tavares - ajuste da pendência 21775 - 10/04/2006
function TCtrlConciliaCPMF.GetDecendioCPMF(dData: TdateTime; iPeriodo, iDiasVenc: integer): TDecendio;
var wdia, wmes, wano: word;
    iContaDiasUteis, numDiasVenc : integer;
    dataAux: TDateTime;

    function DecresceData(data: TdateTime): TdateTime;
    begin
      iContaDiasUteis := 0;
      while iContaDiasUteis < iDiasVenc do
      begin
        data := data - 1;
        if _DiasUteis.DiaUtil(idpessoa, data, true, true, false) then
          inc(iContaDiasUteis);
      end;//while
      // 24/02/07 Alex homologação  result := data + 1;
      result := data;
    end;

begin
  result.DataIni := 0;
  result.DataFim := 0;

  // Alex 24/02/07 homologação dataAux := ddata - iperiodo;
  dataAux := ddata;

  dataAux := DecresceData(dataAux);
  decodeDate(dataAux, wano, wmes, wdia);

  // se cai no 1º decêndio (ou número de dias especificado) ex.: dia 1º ao 10
  if (dataAux >= trunc(strToDate('1/'+ intToStr(wmes)+ '/' +intToStr(wano)))) and
     (dataAux <= trunc(strToDate('1/'+ intToStr(wmes)+ '/' +intToStr(wano))) + iPeriodo - 1) then
  begin
    result.DataIni := trunc(strToDate('1/'+ intToStr(wmes)+ '/' +intToStr(wano)));
    result.DataFim := trunc(strToDate('1/'+ intToStr(wmes)+ '/' +intToStr(wano))) + iPeriodo - 1;
  end
  // se cai no 2º decêndio (ou número de dias especificado) ex.: dia 11 ao 20
  else if (dataAux >= trunc(strToDate('1/'+ intToStr(wmes)+ '/' +intToStr(wano))) + iPeriodo - 1) and
          (dataAux <= trunc(strToDate('1/'+ intToStr(wmes)+ '/' +intToStr(wano))) + (iPeriodo * 2) - 1) then
  begin
    result.DataIni := trunc(strToDate('1/'+ intToStr(wmes)+ '/' +intToStr(wano))) + iPeriodo - 1;
    result.DataFim := trunc(strToDate('1/'+ intToStr(wmes)+ '/' +intToStr(wano))) + (iPeriodo * 2) - 1;
  end
  // se cai no 3º decêndio (ou número de dias especificado) ex.: dia 21 ao último dia do mês
  else if (dataAux >= trunc(strToDate('1/'+ intToStr(wmes)+ '/' +intToStr(wano))) + (iPeriodo * 2) - 1) and
          (dataAux <= trunc(_DiasUteis.UltDiaMes(wano, wmes)) ) then
  begin
    result.DataIni := trunc(strToDate('1/'+ intToStr(wmes)+ '/' +intToStr(wano))) + (iPeriodo * 2) - 1;
    result.DataFim := trunc(_DiasUteis.UltDiaMes(wano, wmes));
  end;

end;



//pendência 26936 - 30/11/2007
function TCtrlConciliaCPMF.getDataContabLote(sNumLote: string): TDateTime;
begin
  result := 0;
  try
    with TClientDataset.Create(nil) do
    begin
      data := getDataPacket(' SELECT DISTINCT P.PLNDATDIA '+
                            ' FROM LANCTODOCUM L, RECBTOPAGTO R, PLANILHA P '+
                            ' WHERE L.NUMLANCTO = R.NUMLANCTO AND '+
                            ' P.PLNCODIGO = L.PLNCODIGO AND '+
                            ' L.OPERACAO = ''5'' AND '+
                            ' L.ESTORNO IS NULL AND '+
                            ' R.NUMLOTE = '+ sNumLote + //se for baixa de lote de documentos
                            ' UNION '+
                            ' SELECT DISTINCT P.PLNDATDIA '+
                            ' FROM LANCTODOCUM L, RECBTOPAGTO R, PLANILHA P '+
                            ' WHERE L.NUMLANCTO = R.NUMLANCTO AND '+
                            ' P.PLNCODIGO = L.PLNCODIGO AND '+
                            ' L.OPERACAO = ''5'' AND '+
                            ' L.ESTORNO IS NULL AND '+
                            ' R.NUMCHQBORDERO = '+ quotedStr(sNumLote)+ //se for baixa manual de um documento avulso
                            ' UNION '+
                            ' SELECT P.PLNDATDIA '+ //se for uma transferência entre contas CC e CI (que gera cpmf)
                            ' FROM MOVIMFINANC M, PLANILHA P '+
                            ' WHERE M.PLNCODIGO = P.PLNCODIGO AND '+
                            ' M.CODLANCFINANC = '+ sNumLote
                            );


      result := fieldByName('PLNDATDIA').asDateTime;
    end;
  except
    on e: Exception do
      messageInfo := e.Message;
  end;
end;

end.
