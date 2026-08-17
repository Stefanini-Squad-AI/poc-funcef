Unit uCtrlAlteraVenc;

{-------------------------------------------------------------------------------------------------
Solicitação........: WO 13404
Data da Alteração..: 08/08/2024
Responsável........: Cássio Florencio Rovaroto
Descrição..........: Mudança na forma de atribuição de data programada. 
--------------------------------------------------------------------------------------------------
Data      : 22/09/2013
Autor     : Fernando Xavier SOL 209171 Kintana 2046428
N. SOL    : 209171
N. Kintana: 2046428
Descrição : Foi incluido o update para a tabela PARCELAREALCONTR na data de DATAVENCPARCELA.
--------------------------------------------------------------------------------------------------
Data      : 28/08/2013
Autor     : Marcio Sanches Spinosa SOL 214861 Kintana 2043472
N. SOL    : 214861
N. Kintana: 2043472
Descrição : Foi ajustado o update para data de vencimento ser alterada.
--------------------------------------------------------------------------------------------------
Data      : 16/08/2011
Autor     : Vinicius Eduardo Nascimento Maciel
N. SOL    : 65757
N. Kintana: 523339
Descrição : Foi criada a Rotina AlteraVencimentoProg para utilização com o
            formulário FalteraVencAP
--------------------------------------------------------------------------------------------------
Data      : 13/12/2006
Autor     : Marcus Oliveira
Pendência : 23978
Descrição : Não permitir alterar a data com a disponibilidade bloqueada
--------------------------------------------------------------------------------------------------
Rotina    : AlteraVencimento
Data      : 15/05/2006
Autor     : andré tavares
pendência : 21735
Descrição : exclui todos os impostos do documento cuja data para lançamento é a data programada do documento.
--------------------------------------------------------------------------------------------------
Rotina    : AlteraVencimento
Data      : 02/02/2006
Autor     : andré tavares
pendência : 20543
Descrição : Não permitir alterar a data de vencimento em um documento com lote
--------------------------------------------------------------------------------------------------
Rotina    : AlteraVencimento
Data      : 24/11/2004
Autor     : Alex Pereira
pendência : 17992
Descrição : Não permitir alterar a data de vencimento em um documento com lote
----------------------------------------------------------------------------------------------------}
Interface

Uses sysutils, uCmControlObject, uCmDbObject, DB, uDataBase, DbClient, uCMTypes,
   uCtrlFinanc, //Marcus Oliveira 13/12/2006 P. 23978
   uCtrlPadroes, uCtrlImpostoRetido, uCtrlParamIntegra, uSistema,  //andré tavares - pendência 20543 - 02/02/2006
   uCMClientDataSet, uDiasUteis, dBaseDados ; //Vinicius Maciel - SOL 65757 Kintana : 523339
Type
  TCtrlAlteraVenc = Class(TCmControlObject)
  protected
    Procedure AfterInitialize; override;
  private
    _Padroes: TCtrlPadroes;
    //Marcus Oliveira 13/12/2006  P.23978
    CtrlFinanc : TCtrlFinanc;
    //Vinicius Maciel - SOL 65757 Kintana : 523339
    cdsAlteraMedicao : TCMClientDataSet;
    cdsDisponibilidade : TCMClientDataSet;
    cdsOperacao : TCMClientDataSet;
    cdsAuxiliar : TCMClientDataSet;
    CdsBuscaParamBaixa : TCMClientDataSet;
    CtrlDiasUteis : TDiasUteis;
    function VerificaStatus(dCodDocumento: Double): OleVariant;
    function verificaLancamentos(dCodDocumento: Double): OleVariant;
    function carregaDisponibilidade(iIdPessoa,
      iIdUsuario: Integer): OleVariant;
    function carregaOperacao(dDocumento: Double): OleVariant;
    function carregaParamDocs(dDocumento: Double): OleVariant;
    //Vinicius Maciel - SOL 65757 Kintana : 523339 - FIM
  public
    Constructor Create; override;
    Destructor Destroy; override;
    Function ListDocumento(iCodDocumento: Integer; RecPag: String): OleVariant;
    Function AlteraVencimento(iCodDocumento: Integer; DataProgramada:
      TDateTime; iEmpresa, iModulo, iUsuario: Integer; bAlteraVencimento: Boolean = True): Boolean;
    //Vinicius Maciel - SOL 65757 Kintana : 523339
    function verificaEstorno(dDocumento: Double): boolean;
    function validaOperacao(dDocumento: Double): boolean;
    Function AlteraVencimentoProg(iCodDocumento: Integer; DataProgramada:
      TDateTime; iEmpresa, iModulo, iUsuario: Integer): Boolean;
    function VerificaDocBaixa(dCodDocumento: Double): Boolean;
    Function VerificaMedicao(iCodDocumento, rIDPessoa: Double): OleVariant;
    function verificaLancamentosBaixa(dCodDocumento :Double) :Boolean;
    function TestaDispFinanc(iIdPessoa,iIdUsuario : Integer;
                                           dDataOper : TDateTime) :Boolean;
    function verificaEnglobamento(dDocumento: Double): boolean;
    //Vinicius Maciel - SOL 65757 Kintana : 523339 - FIM

  End;

Implementation

{ TCtrlAlteraVenc }

Procedure TCtrlAlteraVenc.AfterInitialize;
Begin
  Inherited;
  _Padroes.InitializeAs(self);
  _Padroes.OpenTransaction := false;
End;

Function TCtrlAlteraVenc.AlteraVencimento(iCodDocumento: Integer;
  DataProgramada: TDateTime; iEmpresa, iModulo, iUsuario: Integer; bAlteraVencimento: Boolean): Boolean;
var
  _CdsLocal, _CdsDocumento : TClientDataSet;
  sSql: string;
  _Imposto: TCtrlImpostoRetido; //andré tavares - pendência 20543 - 02/02/2006

  cdsAux : TclientDataset;
  flgDataIRRF, flgDataCapCar, sSqlUpd : string;
  dDataDisp: tdateTime;

Begin
  If ConnectionSide = cnsClient Then
  Begin
    Result := Connection.AppServer.AlteraVencimento(iCodDocumento,
      DataProgramada, iEmpresa, iModulo, iUsuario);
    If Not Result Then
      MessageInfo := Connection.AppServer.MessageInfo;
  End
  Else
  Begin
    Result := True;
    StartTransaction;
    try
      Try

      //Marcus Oliveira P. 23978 13/12/2006
      CtrlFinanc := TCtrlFinanc.Create(sistema.IdEmpresa, Sistema.IdModulo, Sistema.IdUsuario, False);
      CtrlFinanc.InitializeAs(Padroes);

        //início - andré tavares - pendência 20543 - 02/02/2006
        _CdsDocumento := TClientDataset.Create(nil);
        //busca os dados do documento
        _CdsDocumento.Data := getDataPacket( ' SELECT '+
                                             '   D.PLANO, L.NUMLANCTO, D.IDPESSOA, D.RECPAG, D.IDMODULO, D.DATAPROGRAMADA, D.DATADISPONIB,'+ //inclui data disp para alteração - andre tavares - pendência 23416 - 29/09/2006
                                             '   D.IDFORCLI, L.NUMLANCTO, L.VALOR, L.DATALANCTO, D.DATAEMISSAO, L.DEBCRE, D.CODTIPDOC '+
                                             ' FROM DOCUMENTO D, LANCTODOCUM L, RECBTOPAGTO R, PESSOA P, '+
                                             '      MODULO M, USUARIOSISTEMA US, CONTABANCARIA C, AGENCIABANCARIA A, BANCO B '+
                                             ' WHERE  (D.CODDOCUMENTO = ' + intToStr(icodDocumento) +' ) AND '+
                                             '   (D.IDMODULO = M.IDMODULO) AND '+
                                             '   (D.CODDOCUMENTO = L.CODDOCUMENTO) AND '+
                                             '   (D.OPERACAO = L.OPERACAO) AND '+
                                             '   (R.CODDOCUMENTO(+) = L.CODDOCUMENTO) AND '+
                                             '   (R.NUMLANCTO(+) = L.NUMLANCTO) AND '+
                                             '   (P.IDPESSOA = D.IDFORCLI) AND '+
                                             '   (D.IDUSUARIOINCLUSAO = US.IDUSUARIO) AND '+
                                             '   (C.IDAGENCIA = A.IDPESSOA(+))  AND '+
                                             '   (A.IDBANCO   = B.IDPESSOA(+)) AND '+
                                             '   (D.IDCBANCARIA = C.IDCBANCARIA(+)) ');



      //início - andre tavares - pendência 21735 - 12/04/2006
      flgDataIRRF := '';
      flgDataCapCar := '';
      cdsAux := TclientDataset.Create(nil);

      cdsAux.Data := GetDataPacket(' SELECT FLGPAGLANC FROM PARAMIRRF WHERE IDPESSOA = '+ _CdsDocumento.FieldByName('IDPESSOA').AsString );

      flgDataIRRF := trim(cdsAux.fieldByName('FLGPAGLANC').asString);

      //busca todos os impostos do documento cuja data para lançamento é a data programada do documento
      cdsAux.Data := GetDataPacket(' SELECT IR.CODDOCUMENTO, T.LANCAMENTOIMPOSTO, T.CODTIPOCUSTAGREG FROM IMPOSTORETIDO IR, TIPOAGRE T '+
                                   ' WHERE IR.CODDOCUMENTO = ' + intToStr(icodDocumento) + ' AND ' +
                                   ' IR.CODTIPOCUSTAGREG = T.CODTIPOCUSTAGREG AND '+
                                   ' LANCAMENTOIMPOSTO = ''P'' ' );

      flgDataCapCar := trim(cdsAux.fieldByName('LANCAMENTOIMPOSTO').asString);

      if (flgDataIRRF = 'P') or (flgDataCapCar = 'P') then
      begin
      //fim - andre tavares - pendência 21735 - 12/04/2006

        _Imposto := TCtrlImpostoRetido.Create;
        _Imposto.InitializeAs(self);
        _Imposto.OpenTransaction := false;

        _Imposto.UsaPlanoPatro := Sistema.UsaPlanoPatro;
        _Imposto.NumLanctoOrigem := _CdsDocumento.FieldByName('NUMLANCTO').AsInteger;
        _Imposto.PartidaDobrada := ParamIntegra.PartidaDobrada;
        _Imposto.IdPlanoConta := _CdsDocumento.FieldByName('PLANO').AsInteger;
        _Imposto.IntegraContab := ParamIntegra.IntegraContab;
        _Imposto.IdEmpresa := _CdsDocumento.FieldByName('IDPESSOA').AsInteger;
        _Imposto.RecPag := _CdsDocumento.FieldByName('RECPAG').AsString[1];
        _Imposto.IdUsuario := Sistema.IdUsuario;
        _Imposto.IdEspAcesso := sistema.IdEspAcesso;
        _Imposto.IdModulo := _CdsDocumento.FieldByName('IDMODULO').AsInteger;
        _Imposto.DataProgramada := _CdsDocumento.FieldByName('DATAPROGRAMADA').AsDateTime;
        _Imposto.OperacaoDocumento := '2';
        _Imposto.IdForCli := _CdsDocumento.FieldByName('IDFORCLI').AsInteger;
        _Imposto.CodDocumento := iCodDocumento;
        _Imposto.NumLancto := _CdsDocumento.FieldByName('NUMLANCTO').AsInteger;
        _Imposto.ValorLancto := _CdsDocumento.FieldByName('VALOR').AsFloat;
        _Imposto.ValorLiquido := 0;
        _Imposto.DataLancto := _CdsDocumento.FieldByName('DATALANCTO').AsDateTime;
        _Imposto.DataEmissao := _CdsDocumento.FieldByName('DATAEMISSAO').AsDateTime;
        _Imposto.DebCre := _CdsDocumento.FieldByName('DEBCRE').AsString;
        _Imposto.MomentoLancamento := mlLancamento;
        _Imposto.CodTipoDoc := _CdsDocumento.FieldByName('CODTIPDOC').AsInteger;

        //exclui todos os impostos do documento cuja data para lançamento é a data programada do documento - 21735
        cdsAux.first;
        while not cdsAux.Eof do
        begin
          _Imposto.Excluir(iCodDocumento, cdsAux.fieldByName('CODTIPOCUSTAGREG').asInteger);
          cdsAux.Next;
        end;//while

        _Imposto.UsaPlanoPatro := Sistema.UsaPlanoPatro;
        _Imposto.NumLanctoOrigem := 0;
        _Imposto.PartidaDobrada := ParamIntegra.PartidaDobrada;
        _Imposto.IdPlanoConta := _CdsDocumento.FieldByName('PLANO').AsInteger;
        _Imposto.IntegraContab := ParamIntegra.IntegraContab;
        _Imposto.IdEmpresa := _CdsDocumento.FieldByName('IDPESSOA').AsInteger;
        _Imposto.RecPag := _CdsDocumento.FieldByName('RECPAG').AsString[1];
        _Imposto.IdUsuario := Sistema.IdUsuario;

        //andré tavares - pendência 21219 - 06/02/2006 - aproveitei para resolver o bug da autorização de lançamento de documentos
        _Imposto.IdEspAcesso := sistema.IdEspAcesso;

        _Imposto.IdModulo := _CdsDocumento.FieldByName('IDMODULO').AsInteger;
        _Imposto.DataProgramada := DataProgramada;
        _Imposto.OperacaoDocumento := '2';
        _Imposto.IdForCli := _CdsDocumento.FieldByName('IDFORCLI').AsInteger;
        _Imposto.CodDocumento := iCodDocumento;
        _Imposto.NumLancto := _CdsDocumento.FieldByName('NUMLANCTO').AsInteger;
        _Imposto.ValorLancto := _CdsDocumento.FieldByName('VALOR').AsFloat;
        _Imposto.ValorLiquido := 0;
        _Imposto.DataLancto := _CdsDocumento.FieldByName('DATALANCTO').AsDateTime;
        _Imposto.DataEmissao := _CdsDocumento.FieldByName('DATAEMISSAO').AsDateTime;
        _Imposto.DebCre := _CdsDocumento.FieldByName('DEBCRE').AsString;
        _Imposto.MomentoLancamento := mlLancamento;
        _Imposto.CodTipoDoc := _CdsDocumento.FieldByName('CODTIPDOC').AsInteger;


        //inclui novamente o imposto que foi excluído - 21735
        cdsAux.first;
        while not cdsAux.Eof do
        begin
          _Imposto.Incluir(cdsAux.fieldByName('CODTIPOCUSTAGREG').asInteger);
          cdsAux.Next;
        end;//while
        //fim - andré tavares - pendência 21735 - 02/02/2006

      end;//if

        _CdsLocal := TClientDataSet.Create(nil);


        // 24.11.04 Pendência 17992 Alex - não permitir alterar a data programada de um documento em lote
        sSql := 'SELECT ' + #13 +
                '  L.FLAGCANCEL, L.NUMLOTE ' + #13 +
                'FROM ' + #13 +
                '  LOTEPAGTO L, ' + #13 +
                '  LOTEXDOCUM LX ' + #13 +
                'WHERE ' + #13 +
                '  L.NUMLOTE = LX.NUMLOTE AND ' + #13 +
                '  LX.FLGESTORNO  <> ''S'' AND ' + #13 + //andre tavares - pendência 23240 - 06/09/2006 - só que o documento pede estar estornado no lote
                '  LX.CODDOCUMENTO = ' + IntToStr (iCodDocumento);
        _CdsLocal.Data := GetDataPacket (sSql);

        if not _CdsLocal.IsEmpty then
          raise Exception.Create ('Este documento pertence ao lote ' +
                                   IntToStr(_CdsLocal.FieldByName('NUMLOTE').AsInteger) +
                                   ' e não pode ser alterado!');
        // 24.11.04 Pendência 17992 Alex - não permitir alterar a data programada de um documento em lote

        sSqlUpd := '';

        // Marcus Oliveira  13/12/2006  P. 23978
        if not _CdsDocumento.FieldByName('DATADISPONIB').IsNull then
          dDataDisp := trunc (_CdsDocumento.FieldByName('DATADISPONIB').AsDateTime)
        else
          dDataDisp := trunc (_CdsDocumento.FieldByName('DATAPROGRAMADA').AsDateTime);

        // testando com a data anterior
        Result := (CtrlFinanc.TestaDispFinanc(Sistema.IdEmpresa, Trunc(sistema.IdUsuario), dDataDisp))
               or (_CdsDocumento.FieldByName('RECPAG').AsString[1] = 'R'); //André Tavares - 23/10/2007 - pendência 26627 -
                                                                             //só faz sentido se for CAP, es for CAR, então result será true
        if Result then
          // testando com a data atual, ou seja, a reprogramada
          Result := (CtrlFinanc.TestaDispFinanc(Sistema.IdEmpresa, Trunc(sistema.IdUsuario), DataProgramada))
                 or (_CdsDocumento.FieldByName('RECPAG').AsString[1] = 'R'); //André Tavares - 23/10/2007 - pendência 26627 -
                                                                             //só faz sentido se for CAP, es for CAR, então result será true


        if not Result then
        begin
            MessageInfo := 'O Documento não pode ser Reprogramado - Motivo: '+ CtrlFinanc.MessageInfo;

            Raise Exception.Create(MessageInfo);
        end;
        // fim Marcus Oliveira  13/12/2006  P. 23978
        dDataDisp := trunc(DataProgramada);

        sSqlUpd := 'UPDATE DOCUMENTO SET DATAPROGRAMADA = TO_DATE(' +
          QuotedStr(DateToStr(DataProgramada)) + ', ''DD/MM/YYYY'') ';

        sSqlUpd := sSqlUpd + ', DATADISPONIB = TO_DATE(' + QuotedStr(DateToStr(dDataDisp)) + ', ''DD/MM/YYYY'') ';

        if bAlteraVencimento then
          sSqlUpd := sSqlUpd + ', DATAVENCTO = TO_DATE(' + QuotedStr(DateToStr(dDataDisp)) + ', ''DD/MM/YYYY'') ';//Marcio Sanches Spinosa SOL 214861 Kintana 2043472


        sSqlUpd := sSqlUpd + ' WHERE CODDOCUMENTO = ' + IntToStr(iCodDocumento);

        If Not ExecSQL(sSqlUpd) Then
          Raise Exception.Create(MessageInfo);

        //fim - andre tavares - pendência 23416 - 29/09/2006




        If Not _Padroes.GravaLogOperacoes(iEmpresa, iModulo, iUsuario, 'Alteracao de Vencimento', False) Then
          Raise Exception.Create(_Padroes.MessageInfo);
        Commit;
      Except
        On E: Exception Do
        Begin
          Rollback;
          Result := False;
          MessageInfo := E.Message;
        End;
      End;
    finally
      _CdsLocal.Free;
      _Imposto.Free; //andré tavares - pendência 20543 - 02/02/2006
      _CdsDocumento.Free; //andré tavares - pendência 20543 - 02/02/2006
      cdsAux.free;
      CtrlFinanc.free;
    end;
  End;
End;

Constructor TCtrlAlteraVenc.Create;
Begin
  Inherited;
  _Padroes := TCtrlPadroes.Create;
  //Vinicius Maciel - SOL 65757 Kintana : 523339 
  cdsAlteraMedicao := TCMClientDataSet.Create(nil);
  CdsBuscaParamBaixa := TCMClientDataSet.Create(nil);
  cdsDisponibilidade := TCMClientDataSet.Create(nil);
  cdsOperacao := TCMClientDataSet.Create(nil);
  cdsAuxiliar := TCMClientDataSet.Create(nil);
  CtrlDiasUteis:=TDiasUteis.Create;
  CtrlDiasUteis.Initialize(DtmBaseDados.dbBaseDados, True, Sistema.ConnectionType, Sistema.ConnectionSide, Sistema.AppRemoteServer, True);
  //Vinicius Maciel - SOL 65757 Kintana : 523339 - FIM
End;

Destructor TCtrlAlteraVenc.Destroy;
Begin
  _Padroes.Free;
  //Vinicius Maciel - SOL 65757 Kintana : 523339
  cdsAlteraMedicao.Free;
  CdsBuscaParamBaixa.Free;
  cdsDisponibilidade.Free;
  cdsOperacao.Free;
  cdsAuxiliar.Free;
  CtrlDiasUteis.Free;
  //Vinicius Maciel - SOL 65757 Kintana : 523339 - FIM
  Inherited;
End;

Function TCtrlAlteraVenc.ListDocumento(iCodDocumento: Integer; RecPag: String):
  OleVariant;
Var
  sSQL: String;
Begin
  sSQL := 'SELECT ' +
    '  P.RAZAOSOCIAL,D.CODDOCUMENTO, ' +
    '  D.NODOCUMENTO,D.COMPLDOCUMENTO,D.DATAVENCTO, ' +
    '  D.DATAPROGRAMADA AS DATAATU,D.DATAPROGRAMADA, ' +
    '  D.DATAEMISSAO ' +
    'FROM PESSOA P,DOCUMENTO D ' +
    'WHERE ' +
    '(D.CODDOCUMENTO = ' + IntToStr(iCodDocumento) + ') AND ' +
    '(D.RECPAG = ' + QuotedStr(RecPag) + ') AND ' +
    '(P.IDPESSOA = D.IDFORCLI) ';
  Result := GetDataPacket(sSQL);
End;

//Vinicius Maciel - SOL 65757 Kintana : 523339
Function TCtrlAlteraVenc.AlteraVencimentoProg(iCodDocumento: Integer;
  DataProgramada: TDateTime; iEmpresa, iModulo, iUsuario: Integer): Boolean;
var
  _CdsLocal, _CdsDocumento : TClientDataSet;
  sSql: string;
  _Imposto: TCtrlImpostoRetido;

  cdsAux : TclientDataset;
  flgDataIRRF, flgDataCapCar, sSqlUpd : string;
  dDataDisp: tdateTime;
Begin
  If ConnectionSide = cnsClient Then
  Begin
    Result := Connection.AppServer.AlteraVencimento(iCodDocumento,
      DataProgramada, iEmpresa, iModulo, iUsuario);
    If Not Result Then
      MessageInfo := Connection.AppServer.MessageInfo;
  End
  Else
  Begin
    Result := True;
    StartTransaction;
    try
      Try

      CtrlFinanc := TCtrlFinanc.Create(sistema.IdEmpresa, Sistema.IdModulo, Sistema.IdUsuario, False);
      CtrlFinanc.InitializeAs(Padroes);
        _CdsDocumento := TClientDataset.Create(nil);
        //busca os dados do documento
        _CdsDocumento.Data := getDataPacket( ' SELECT '+
                                             '   D.PLANO, L.NUMLANCTO, D.IDPESSOA, D.RECPAG, D.IDMODULO, D.DATAPROGRAMADA, D.DATADISPONIB,'+ //inclui data disp para alteração - andre tavares - pendência 23416 - 29/09/2006
                                             '   D.IDFORCLI, L.NUMLANCTO, L.VALOR, L.DATALANCTO, D.DATAEMISSAO, L.DEBCRE, D.CODTIPDOC '+
                                             ' FROM DOCUMENTO D, LANCTODOCUM L, RECBTOPAGTO R, PESSOA P, '+
                                             '      MODULO M, USUARIOSISTEMA US, CONTABANCARIA C, AGENCIABANCARIA A, BANCO B '+
                                             ' WHERE  (D.CODDOCUMENTO = ' + intToStr(icodDocumento) +' ) AND '+
                                             '   (D.IDMODULO = M.IDMODULO) AND '+
                                             '   (D.CODDOCUMENTO = L.CODDOCUMENTO) AND '+
                                             '   (D.OPERACAO = L.OPERACAO) AND '+
                                             '   (R.CODDOCUMENTO(+) = L.CODDOCUMENTO) AND '+
                                             '   (R.NUMLANCTO(+) = L.NUMLANCTO) AND '+
                                             '   (P.IDPESSOA = D.IDFORCLI) AND '+
                                             '   (D.IDUSUARIOINCLUSAO = US.IDUSUARIO) AND '+
                                             '   (C.IDAGENCIA = A.IDPESSOA(+))  AND '+
                                             '   (A.IDBANCO   = B.IDPESSOA(+)) AND '+
                                             '   (D.IDCBANCARIA = C.IDCBANCARIA(+)) ');


      flgDataIRRF := '';
      flgDataCapCar := '';
      cdsAux := TclientDataset.Create(nil);

      cdsAux.Data := GetDataPacket(' SELECT FLGPAGLANC FROM PARAMIRRF WHERE IDPESSOA = '+ _CdsDocumento.FieldByName('IDPESSOA').AsString );

      flgDataIRRF := trim(cdsAux.fieldByName('FLGPAGLANC').asString);

      //busca todos os impostos do documento cuja data para lançamento é a data programada do documento
      cdsAux.Data := GetDataPacket(' SELECT IR.CODDOCUMENTO, T.LANCAMENTOIMPOSTO, T.CODTIPOCUSTAGREG FROM IMPOSTORETIDO IR, TIPOAGRE T '+
                                   ' WHERE IR.CODDOCUMENTO = ' + intToStr(icodDocumento) + ' AND ' +
                                   ' IR.CODTIPOCUSTAGREG = T.CODTIPOCUSTAGREG AND '+
                                   ' LANCAMENTOIMPOSTO = ''P'' ' );

      flgDataCapCar := trim(cdsAux.fieldByName('LANCAMENTOIMPOSTO').asString);

      if (flgDataIRRF = 'P') or (flgDataCapCar = 'P') then
      begin
        _Imposto := TCtrlImpostoRetido.Create;
        _Imposto.InitializeAs(self);
        _Imposto.OpenTransaction := false;

        _Imposto.UsaPlanoPatro := Sistema.UsaPlanoPatro;
        _Imposto.NumLanctoOrigem := _CdsDocumento.FieldByName('NUMLANCTO').AsInteger;
        _Imposto.PartidaDobrada := ParamIntegra.PartidaDobrada;
        _Imposto.IdPlanoConta := _CdsDocumento.FieldByName('PLANO').AsInteger;
        _Imposto.IntegraContab := ParamIntegra.IntegraContab;
        _Imposto.IdEmpresa := _CdsDocumento.FieldByName('IDPESSOA').AsInteger;
        _Imposto.RecPag := _CdsDocumento.FieldByName('RECPAG').AsString[1];
        _Imposto.IdUsuario := Sistema.IdUsuario;
        _Imposto.IdEspAcesso := sistema.IdEspAcesso;
        _Imposto.IdModulo := _CdsDocumento.FieldByName('IDMODULO').AsInteger;
        _Imposto.DataProgramada := _CdsDocumento.FieldByName('DATAPROGRAMADA').AsDateTime;
        _Imposto.OperacaoDocumento := '2';
        _Imposto.IdForCli := _CdsDocumento.FieldByName('IDFORCLI').AsInteger;
        _Imposto.CodDocumento := iCodDocumento;
        _Imposto.NumLancto := _CdsDocumento.FieldByName('NUMLANCTO').AsInteger;
        _Imposto.ValorLancto := _CdsDocumento.FieldByName('VALOR').AsFloat;
        _Imposto.ValorLiquido := 0;
        _Imposto.DataLancto := _CdsDocumento.FieldByName('DATALANCTO').AsDateTime;
        _Imposto.DataEmissao := _CdsDocumento.FieldByName('DATAEMISSAO').AsDateTime;
        _Imposto.DebCre := _CdsDocumento.FieldByName('DEBCRE').AsString;
        _Imposto.MomentoLancamento := mlLancamento;
        _Imposto.CodTipoDoc := _CdsDocumento.FieldByName('CODTIPDOC').AsInteger;

        //exclui todos os impostos do documento cuja data para lançamento é a data programada do documento - 21735
        cdsAux.first;
        while not cdsAux.Eof do
        begin
          _Imposto.Excluir(iCodDocumento, cdsAux.fieldByName('CODTIPOCUSTAGREG').asInteger);
          cdsAux.Next;
        end;//while

        _Imposto.UsaPlanoPatro := Sistema.UsaPlanoPatro;
        _Imposto.NumLanctoOrigem := 0;
        _Imposto.PartidaDobrada := ParamIntegra.PartidaDobrada;
        _Imposto.IdPlanoConta := _CdsDocumento.FieldByName('PLANO').AsInteger;
        _Imposto.IntegraContab := ParamIntegra.IntegraContab;
        _Imposto.IdEmpresa := _CdsDocumento.FieldByName('IDPESSOA').AsInteger;
        _Imposto.RecPag := _CdsDocumento.FieldByName('RECPAG').AsString[1];
        _Imposto.IdUsuario := Sistema.IdUsuario;

        _Imposto.IdEspAcesso := sistema.IdEspAcesso;

        _Imposto.IdModulo := _CdsDocumento.FieldByName('IDMODULO').AsInteger;
        _Imposto.DataProgramada := DataProgramada;
        _Imposto.OperacaoDocumento := '2';
        _Imposto.IdForCli := _CdsDocumento.FieldByName('IDFORCLI').AsInteger;
        _Imposto.CodDocumento := iCodDocumento;
        _Imposto.NumLancto := _CdsDocumento.FieldByName('NUMLANCTO').AsInteger;
        _Imposto.ValorLancto := _CdsDocumento.FieldByName('VALOR').AsFloat;
        _Imposto.ValorLiquido := 0;
        _Imposto.DataLancto := _CdsDocumento.FieldByName('DATALANCTO').AsDateTime;
        _Imposto.DataEmissao := _CdsDocumento.FieldByName('DATAEMISSAO').AsDateTime;
        _Imposto.DebCre := _CdsDocumento.FieldByName('DEBCRE').AsString;
        _Imposto.MomentoLancamento := mlLancamento;
        _Imposto.CodTipoDoc := _CdsDocumento.FieldByName('CODTIPDOC').AsInteger;


        //inclui novamente o imposto que foi excluído - 21735
        cdsAux.first;
        while not cdsAux.Eof do
        begin
          _Imposto.Incluir(cdsAux.fieldByName('CODTIPOCUSTAGREG').asInteger);
          cdsAux.Next;
        end;//while
      end;//if

        _CdsLocal := TClientDataSet.Create(nil);

        sSql := 'SELECT ' + #13 +
                '  L.FLAGCANCEL, L.NUMLOTE ' + #13 +
                'FROM ' + #13 +
                '  LOTEPAGTO L, ' + #13 +
                '  LOTEXDOCUM LX ' + #13 +
                'WHERE ' + #13 +
                '  L.NUMLOTE = LX.NUMLOTE AND ' + #13 +
                '  LX.FLGESTORNO  <> ''S'' AND ' + #13 + //andre tavares - pendência 23240 - 06/09/2006 - só que o documento pede estar estornado no lote
                '  LX.CODDOCUMENTO = ' + IntToStr (iCodDocumento);
        _CdsLocal.Data := GetDataPacket (sSql);

        if not _CdsLocal.IsEmpty then
          raise Exception.Create ('Este documento pertence ao lote ' +
                                   IntToStr(_CdsLocal.FieldByName('NUMLOTE').AsInteger) +
                                   ' e não pode ser alterado!');
        sSqlUpd := '';

        if not _CdsDocumento.FieldByName('DATADISPONIB').IsNull then
          dDataDisp := trunc (_CdsDocumento.FieldByName('DATADISPONIB').AsDateTime)
        else
          dDataDisp := trunc (_CdsDocumento.FieldByName('DATAPROGRAMADA').AsDateTime);

        // testando com a data anterior
        Result := (CtrlFinanc.TestaDispFinanc(Sistema.IdEmpresa, Trunc(sistema.IdUsuario), dDataDisp))
               or (_CdsDocumento.FieldByName('RECPAG').AsString[1] = 'R');   //só faz sentido se for CAP, es for CAR, então result será true
        if Result then
          // testando com a data atual, ou seja, a reprogramada
          Result := (CtrlFinanc.TestaDispFinanc(Sistema.IdEmpresa, Trunc(sistema.IdUsuario), DataProgramada))
                 or (_CdsDocumento.FieldByName('RECPAG').AsString[1] = 'R'); //só faz sentido se for CAP, es for CAR, então result será true


        if not Result then
        begin
            MessageInfo := 'O Documento não pode ser Reprogramado - Motivo: '+ CtrlFinanc.MessageInfo;

            Raise Exception.Create(MessageInfo);
        end;
        dDataDisp := trunc(DataProgramada);

        sSqlUpd := 'UPDATE DOCUMENTO SET DATAPROGRAMADA = TO_DATE(' +
          QuotedStr(DateToStr(DataProgramada)) + ', ''DD/MM/YYYY'') ';
        sSqlUpd := sSqlUpd + ', DATAVENCTO   = TO_DATE(' + QuotedStr(DateToStr(DataProgramada)) + ', ''DD/MM/YYYY'') ';
        sSqlUpd := sSqlUpd + ', DATADISPONIB = TO_DATE(' + QuotedStr(DateToStr(dDataDisp)) + ', ''DD/MM/YYYY'') ';


        sSqlUpd := sSqlUpd + ' WHERE CODDOCUMENTO = ' + IntToStr(iCodDocumento);

        If Not ExecSQL(sSqlUpd) Then
          Raise Exception.Create(MessageInfo);

        sSqlUpd := 'UPDATE PARCELAMEDICAO SET DATAPREVISTAVENC = TO_DATE(' +
          QuotedStr(DateToStr(DataProgramada)) + ', ''DD/MM/YYYY'') ';
        sSqlUpd := sSqlUpd + ' WHERE CODDOCUMENTO = ' + IntToStr(iCodDocumento);
        If Not ExecSQL(sSqlUpd) Then
          Raise Exception.Create(MessageInfo);

        // SOL 209171 Kintana 2046428
        sSqlUpd := 'UPDATE PARCELAREALCONTR SET DATAVENCPARCELA = TO_DATE(' +
          QuotedStr(DateToStr(DataProgramada)) + ', ''DD/MM/YYYY'') ';
        sSqlUpd := sSqlUpd + ' WHERE CODDOCUMENTO = ' + IntToStr(iCodDocumento);
        If Not ExecSQL(sSqlUpd) Then
          Raise Exception.Create(MessageInfo);
        // SOL 209171 Kintana 2046428

        //If Not _Padroes.GravaLogOperacoes(iEmpresa, iModulo, iUsuario, 'Alteracao de Vencimento', False) Then
        If Not _Padroes.GravaLogOperacoes(iEmpresa, iModulo, iUsuario, 'Alteracao de Venc. Prog', False) Then
          Raise Exception.Create(_Padroes.MessageInfo);
        Commit;
      Except
        On E: Exception Do
        Begin
          Rollback;
          Result := False;
          MessageInfo := E.Message;
        End;
      End;
    finally
      _CdsLocal.Free;
      _Imposto.Free;
      _CdsDocumento.Free;
      cdsAux.free;
      CtrlFinanc.free;
    end;
  End;
End;


Function TCtrlAlteraVenc.VerificaMedicao(iCodDocumento, rIDPessoa: Double): OleVariant;
Var
  sSQL: String;
Begin
// Criado por Helen - SOL: 65757 KTN: 523339
  sSql:='SELECT DISTINCT '+
         '   M.IDMEDICAO, '+
         '   M.IDCONTRATO, '+
         '   M.IDPROJETO, '+
         '   M.IDATIVIDADE, '+
         '   M.IDITEM, '+
         '   M.IDOBJETO, '+
         '   M.IDPESSOA, '+
         '   M.DATAPREVMEDICAO, '+
         '   M.DATAMEDICAO, '+
         '   M.MEDICAOAPROVADA, '+
         '   M.QTDEMEDICAO, '+
         '   M.VALORMEDICAO, '+
         '   M.QTDEPREVISTA, '+
         '   M.VALORPREVISTO, '+
         '   M.NUMPARCELAS, '+
         '   NVL(M.FLGESTORNADO,0) AS FLGESTORNADO, '+
         '   PM.DATAPREVISTAVENC, '+
         '   PM.CODDOCUMENTO '+
         'FROM '+
         '   MEDICAO M, '+
         '   PARCELAMEDICAO PM  '+
         'WHERE '+
         '   (M.IDPESSOA = '+FloatToStr(rIDPessoa)+') AND '+
         '   (M.IDMEDICAO = PM.IDMEDICAO) AND '+
         '   (PM.CODDOCUMENTO = '+FloatToStr(iCodDocumento)+')';
  Result := GetDataPacket(sSQL);
End;

function TCtrlAlteraVenc.VerificaStatus (dCodDocumento :Double) :OleVariant;
var
sSQL : String;
begin
    sSQL := ' SELECT L.FLAGCANCEL, L.NUMLOTE, LE.ESTORNO' +
            ' FROM LOTEPAGTO L, ' +
            ' LOTEXDOCUM LX, ' +
            ' (SELECT L.NUMLANCTO, L.ESTORNO, R.NUMLOTE, R.CODDOCUMENTO' +
            ' FROM LANCTODOCUM L, RECBTOPAGTO R ' +
            ' WHERE L.NUMLANCTO = R.NUMLANCTO ' +
            ' AND L.CODDOCUMENTO = R.CODDOCUMENTO ' +
            ' AND L.ESTORNO IS NOT NULL) LE ' +
            ' WHERE L.NUMLOTE = LX.NUMLOTE ' +
            ' AND LX.CODDOCUMENTO = ' + FloatToStr(dCodDocumento) +
            ' AND LX.CODDOCUMENTO = LE.CODDOCUMENTO(+) ' +
            ' AND LX.NUMLOTE = LE.NUMLOTE(+) ';
Result := GetDataPacket(sSQL);
end;

function TCtrlAlteraVenc.VerificaDocBaixa(dCodDocumento :Double): Boolean;
Begin
Result := True;
    cdsAlteraMedicao.Data :=VerificaStatus(dCodDocumento);
    cdsAlteraMedicao.First;
    While Not cdsAlteraMedicao.Eof Do
    Begin
        If (cdsAlteraMedicao.FieldByName('FLAGCANCEL').AsString <> 'C') then
        MessageInfo := 'Este documento consta no Lote ' + cdsAlteraMedicao.FieldByName('NUMLOTE').AsString;

        if not cdsAlteraMedicao.FieldByName('ESTORNO').isNull then
        Begin
            cdsAlteraMedicao.Filter := ' ESTORNO IS NULL ';
            cdsAlteraMedicao.Filtered := true;
            if cdsAlteraMedicao.recordCount = 0 then
            begin
                result := true;
                exit;
            end;
        end;
        If (cdsAlteraMedicao.FieldByName('FLAGCANCEL').AsString = 'B') then
        Begin
          MessageInfo := MessageInfo + ' que foi baixado.';
          Result := False;
          exit;
        End;
        cdsAlteraMedicao.Next;
    end;
End;


function TCtrlAlteraVenc.verificaLancamentos(dCodDocumento :Double) :OleVariant;
var
sSQL : String;
begin
    sSQL := 'SELECT L.CODDOCUMENTO, L.NUMLANCTO, L.DATALANCTO, P.DESCRICAO '+
    ' FROM LANCTODOCUM L, RECBTOPAGTO R, PORTADORFORMA P '+
    ' WHERE (L.CODDOCUMENTO = ' + floatTostr(dCodDocumento) +')' +
    ' AND ((RTRIM(L.OPERACAO) = 5) OR '+
    ' ((RTRIM(L.OPERACAO) = 15) AND '+
    ' (FLGLANCBAIXAADTO IS NULL OR FLGLANCBAIXAADTO <> '+QuotedStr('s')+'))) '+
    ' AND (L.CODDOCUMENTO = R.CODDOCUMENTO) '+
    ' AND (L.NUMLANCTO = R.NUMLANCTO) '+
    ' AND (P.CODPORTFORMA(+) = R.CODPORTFORMA) ';
Result := GetDataPacket(sSQL);
end;

function TCtrlAlteraVenc.verificaLancamentosBaixa(dCodDocumento :Double) :Boolean;
begin
    Result := True;
    CdsBuscaParamBaixa.data := verificaLancamentos(dCodDocumento);
    if not CdsBuscaParamBaixa.isEmpty then
    begin
        Result := False;
        MessageInfo := 'Existem lançamentos de baixa no dia ' +CdsBuscaParamBaixa.FieldByName('DATALANCTO').AsString +
                        ' na conta ' + CdsBuscaParamBaixa.FieldByName('DESCRICAO').AsString;
    end;
end;

function TCtrlAlteraVenc.TestaDispFinanc(iIdPessoa,iIdUsuario : Integer;
                                           dDataOper : TDateTime) :Boolean;
var
dDTDisponibilidade : TDateTime;
begin
    dDataOper := StrToDatetime(FormatDatetime('dd/mm/yyyy',dDataOper) + '00:00:00');
    Result := True;
    cdsDisponibilidade.close;
    cdsDisponibilidade.data := carregaDisponibilidade (iIdPessoa,iIdUsuario);
    dDTDisponibilidade := DiasUteis.SomaDiasUteis(Sistema.IdEmpresa,cdsDisponibilidade.FieldByName('DATABLOQDISPFINAN').AsDateTime,2 ,True,False,False);
    dDTDisponibilidade := StrToDatetime(FormatDatetime('dd/mm/yyyy',dDTDisponibilidade) + '00:00:00');
    if ((dDataOper < dDTDisponibilidade) and (dDataOper > 0)) then
    begin
        if (cdsDisponibilidade.FieldByName('FLGDISPBLOQ').AsString) ='Y' then
        begin
          if (cdsDisponibilidade.FieldByName('FLGDISPFINANC').AsString) <> 'Y' then
          Result := False;
        end;    
    end;
end;

function TCtrlAlteraVenc.carregaDisponibilidade (iIdPessoa,iIdUsuario : Integer) :OleVariant;
var
    sSQL :String;
begin
    sSQL := 'SELECT PAR.FLGDISPBLOQ, '+
            ' PAR.DATABLOQDISPFINAN, '+
            ' USU.IDUSUARIO, '+
            ' USU.FLGDISPFINANC '+
            ' FROM PARAMFINANC PAR, USUARIOSISTEMA USU '+
            ' WHERE (PAR.IDPESSOA = '+IntToStr(iIdPessoa)+' )' +
            ' AND (USU.IDUSUARIO = '+IntToStr(iIdUsuario)+' )' ;
    Result := GetDataPacket(sSQL);
end;


function TCtrlAlteraVenc.validaOperacao (dDocumento : Double) :boolean;
begin
     result := true;
     //Verifica se o documento não está baixado
     cdsOperacao.close;
     cdsOperacao.data := carregaOperacao(dDocumento);
     Result :=  cdsOperacao.isEmpty;
     MessageInfo := 'Este lançamento foi baixado';

     //Valida o Lote do Documento
     if result then
        result := VerificaDocBaixa(dDocumento);

end;

function TCtrlAlteraVenc.carregaOperacao (dDocumento : Double) :OleVariant;
var
    sSQL :String;
begin
    sSQL := 'SELECT CODDOCUMENTO ' +
            'FROM LANCTODOCUM ' +
            'WHERE CODDOCUMENTO = ' + FloatToStr(dDocumento) +
            '  AND OPERACAO IN (5,10,15) ' +
            '  AND ESTORNO IS NULL';
    Result := GetDataPacket(sSQL);
end;

function TCtrlAlteraVenc.verificaEstorno (dDocumento : Double) :boolean;
begin
     result := true;
     cdsAuxiliar.close;
     cdsAuxiliar.data := carregaParamDocs(dDocumento);
     Result := (cdsAuxiliar.FieldByName('ESTORNO').isNull);
     MessageInfo := 'Este Lançamento foi estornado ou é um estorno';
end;



function TCtrlAlteraVenc.carregaParamDocs(dDocumento : Double) :OleVariant;
var
    sSQL :String;
begin
    sSQL := 'SELECT '+
            ' L.DATALANCTO, ' +
            ' L.ESTORNO, '+
            ' L.PLNCODIGO, ' +
            ' D.OPERACAO, ' +
            ' D.NUMFATURA, ' +
            ' D.IDPESSOA ' +
            ' FROM  ' +
            ' DOCUMENTO D, ' +
            ' LANCTODOCUM L '+
            ' WHERE  '+
            ' D.CODDOCUMENTO = ' +FloatToStr(dDocumento) + ' AND ' +
            ' D.CODDOCUMENTO = L.CODDOCUMENTO AND ' +
            '  D.OPERACAO = L.OPERACAO ';
    Result := GetDataPacket(sSQL);
end;


function TCtrlAlteraVenc.verificaEnglobamento (dDocumento : Double) :boolean;
begin
     result := true;
     cdsAuxiliar.close;
     cdsAuxiliar.data := carregaParamDocs(dDocumento);
     if not (cdsAuxiliar.isEmpty) then
     begin
     Result := (cdsAuxiliar.FieldByName('NUMFATURA').isNull);
     end;
     MessageInfo := 'Este documento foi englobado\parcelado.';
end;

//Vinicius Maciel - SOL 65757 Kintana : 523339 - FIM
End.

