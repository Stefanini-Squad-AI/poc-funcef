Unit
  uCtrlGeraLotePgto;

Interface

Uses
  SysUtils, DB, DbClient, Classes, StdCtrls, uCmControlObject, uCmDbObject,
  uCmTypes, uDtmGeraLotePgto, uMidasUtil, uDataBase, uCtrlImpostoRetido,
  uCtrlDocumento, uRad, uDbLotePagto, uDbLotexdocum, DBaseDados, uCtrlPadroes,
  CmParamReport;

Type
  TCtrlGeraLotePgto = Class(TCmControlObject)
  Protected
    Procedure OnCreateAppServer; Override;
    Procedure AfterInitialize; Override;

  Private
    DtmGeraLotePgto       : TDtmGeraLotePgto;
    CtrlImpostoRetidoLote : TCtrlImpostoRetido;
    CtrlDocumento         : TCtrlDocumento;
    CtrlPadroes           : TCtrlPadroes;

    DBLotePagto  : TDbLotePagto;
    DbLotexdocum : TDbLotexDocum;

    Sadiantapag, Sadiantarec           : String;

    FUsaPlanoPatro  : Boolean;
    FIntegraContab  : Boolean;
    FPartidaDobrada : Boolean;
    FIdPlanoConta   : Double;
    FIdEspAcesso    : Double;
    FIdModulo       : Double;
    FIdEmpresa      : Double;
    FIdUsuario      : Double;
    FRecPag         : String;
    FValorZero      : Double;
    FIdTipoProcRad  : Double;
    FVlrRetencao    : Double;
    FEmiteLancaBaixa: Boolean;

    FCdsRateio: TClientDataSet;
    FCdsTipoDocRecPag: TClientDataSet;
    FCdsLoteXDocumento: TClientDataSet;
    FCdsAux: TClientDataSet;
    FCdsFormadePagto: TClientDataSet;
    FCdsModulos: TClientDataSet;
    FCdsLotePagto: TClientDataSet;
    FCdsDocPendentes: TClientDataSet;
    FCdsseladiantpendent: TClientDataSet;
    FCdsNumlancto: TClientDataSet;
    FCdsSaldoLoteNaoEmitido: TClientDataSet;
    FCdsDescPortadorForma: TClientDataSet;

    Procedure CalculaSaldos( Var pDocPend   : Integer;
                             Var pValtotSel : Double );

    procedure SetCdsAux( Const Value: TClientDataSet);
    procedure SetCdsDescPortadorForma( Const Value: TClientDataSet);
    procedure SetCdsDocPendentes( Const Value: TClientDataSet);
    procedure SetCdsFormadePagto( Const Value: TClientDataSet);
    procedure SetCdsLotePagto( Const Value: TClientDataSet);
    procedure SetCdsLoteXDocumento( Const Value: TClientDataSet);
    procedure SetCdsModulos( Const Value: TClientDataSet);
    procedure SetCdsNumlancto( Const Value: TClientDataSet);
    procedure SetCdsRateio( Const Value: TClientDataSet);
    procedure SetCdsSaldoLoteNaoEmitido( Const Value: TClientDataSet);
    procedure SetCdsseladiantpendent( Const Value: TClientDataSet);
    procedure SetCdsTipoDocRecPag( Const Value: TClientDataSet);
  Public
    rSumValor,
    iSeqDesperdicado,
    iNumSeqLote      : Double;

    bMontaQuery,
    bLoteSendoGerado : Boolean;

    Constructor Create; Override;
    Destructor Destroy; Override;

    Function  SequenciaTabela( TabelaDeSequencia : String ;
                                Var iSeqDesperdicado : Double ) : Double;
    Function Verifica_Adianto( idocumento : Integer ) : Boolean;
    Function bbtnCriaLoteClick( psbLotePanels2,
                                pdblkcmbDescricaoLookupValue,
                                pSauxDataDiferido : String ) : Boolean;
    Function GeraSql( pParametro : String ) : String;

    Procedure bbtnSelecionaDocClick( CmpDadosParaBaixa : TCmParamReport;
                                     pModuloCodDocCPMF : Double;
                                     Var DocPend       : Integer;
                                     Var ValtotSel     : Double );

    Procedure GetNumLancto(piCodDocumento :Integer; Var iNumLancto :Integer; Var sDebCre : String);
    Procedure AbreQueries;
    Procedure MontaCdsVazia( pbLimpaDocPendentes : Boolean );
    Procedure AbreCdsSelAdiantPendent;

    Property IdEmpresa        : Double  Read FIdEmpresa       Write FIdEmpresa;
    Property IdUsuario        : Double  Read FIdUsuario       Write FIdUsuario;
    Property IdModulo         : Double  Read FIdModulo        Write FIdModulo;
    Property UsaPlanoPatro    : Boolean Read FUsaPlanoPatro   Write FUsaPlanoPatro;
    Property IdPlanoConta     : Double  Read FIdPlanoConta    Write FIdPlanoConta;
    Property IdEspAcesso      : Double  Read FIdEspAcesso     Write FIdEspAcesso;
    Property RecPag           : String  Read FRecPag          Write FRecPag;
    Property IntegraContab    : Boolean Read FIntegraContab   Write FIntegraContab;
    Property PartidaDobrada   : Boolean Read FPartidaDobrada  Write FPartidaDobrada;
    Property ValorZero        : Double  Read FValorZero       Write FValorZero;
    Property IdTipoProcRad    : Double  Read FIdTipoProcRad   Write FIdTipoProcRad;
    Property VlrRetencao      : Double  Read FVlrRetencao     Write FVlrRetencao;
    Property EmiteLancaBaixa  : Boolean Read FEmiteLancaBaixa Write FEmiteLancaBaixa;

    Property CdsDocPendentes        : TClientDataSet Read FCdsDocPendentes        Write SetCdsDocPendentes;
    Property CdsLoteXDocumento      : TClientDataSet Read FCdsLoteXDocumento      Write SetCdsLoteXDocumento;
    Property CdsDescPortadorForma   : TClientDataSet Read FCdsDescPortadorForma   Write SetCdsDescPortadorForma;
    Property CdsLotePagto           : TClientDataSet Read FCdsLotePagto           Write SetCdsLotePagto;
    Property CdsAux                 : TClientDataSet Read FCdsAux                 Write SetCdsAux;
    Property CdsNumlancto           : TClientDataSet Read FCdsNumlancto           Write SetCdsNumlancto;
    Property CdsFormadePagto        : TClientDataSet Read FCdsFormadePagto        Write SetCdsFormadePagto;
    Property Cdsseladiantpendent    : TClientDataSet Read FCdsseladiantpendent    Write SetCdsseladiantpendent;
    Property CdsModulos             : TClientDataSet Read FCdsModulos             Write SetCdsModulos;
    Property CdsTipoDocRecPag       : TClientDataSet Read FCdsTipoDocRecPag       Write SetCdsTipoDocRecPag;
    Property CdsSaldoLoteNaoEmitido : TClientDataSet Read FCdsSaldoLoteNaoEmitido Write SetCdsSaldoLoteNaoEmitido;
    Property CdsRateio              : TClientDataSet Read FCdsRateio              Write SetCdsRateio;
  End;

Implementation

{ TCtrGeraLotePgto }
//************************************************
Constructor TCtrlGeraLotePgto.Create;
Begin
  Inherited;

  DbLotePagto  := TDbLotePagto.Create( Self );
  DbLotexdocum := TDbLotexdocum.Create( Self );
End;
//************************************************
Destructor TCtrlGeraLotePgto.Destroy;
Begin
  If ( IsAppServer ) Then FreeCds( [ CdsDocPendentes,  CdsLoteXDocumento,      CdsDescPortadorForma,
                                     CdsLotePagto,     CdsAux,                 CdsNumlancto,
                                     CdsFormadePagto,  Cdsseladiantpendent,    CdsModulos,
                                     CdsTipoDocRecPag, CdsSaldoLoteNaoEmitido, CdsRateio ] );
  DbLotePagto.Free;
  DbLotexdocum.Free;

  DtmGeraLotePgto.Free;
  CtrlImpostoRetidoLote.Free;
  CtrlDocumento.Free;
  CtrlPadroes.Free;

  Rad.Free;

  Inherited;
End;
//************************************************
Procedure TCtrlGeraLotePgto.AfterInitialize;
Begin
  Inherited;
  DtmGeraLotePgto := TDTmGeraLotePgto.Create( Nil );

  With DtmGeraLotePgto Do Begin
    SqlDocPendentes.ClientDataSet        := CdsDocPendentes;
    SqlLoteXDocumento.ClientDataSet      := CdsLoteXDocumento;
    SqlDescPortadorForma.ClientDataSet   := CdsDescPortadorForma;
    SqlLotePagto.ClientDataSet           := CdsLotePagto;
    SqlAux.ClientDataSet                 := CdsAux;
    SqlNumlancto.ClientDataSet           := CdsNumlancto;
    SqlFormadePagto.ClientDataSet        := CdsFormadePagto;
    Sqlseladiantpendent.ClientDataSet    := Cdsseladiantpendent;
    SqlModulos.ClientDataSet             := CdsModulos;
    SqlTipoDocRecPag.ClientDataSet       := CdsTipoDocRecPag;
    SqlSaldoLoteNaoEmitido.ClientDataSet := CdsSaldoLoteNaoEmitido;
    SqlRateio.ClientDataSet              := CdsRateio;
  End;

  CtrlImpostoRetidoLote := TCtrlImpostoRetido.Create;
  CtrlImpostoRetidoLote.InitializeAs( Self );
  CtrlImpostoRetidoLote.OpenTransaction := False;

  CtrlDocumento := TCtrlDocumento.Create;
  CtrlDocumento.InitializeAs( Self );
  CtrlDocumento.OpenTransaction := False;

  CtrlDocumento.IdModulo      := Trunc( IdModulo );
  CtrlDocumento.IdUsuario     := Trunc( IdUsuario );
  CtrlDocumento.UsaPlanoPatro := UsaPlanoPatro;
  CtrlDocumento.IdEspAcesso   := Trunc( IdEspAcesso );

  CtrlPadroes                 := TCtrlPadroes.Create;
  CtrlPadroes.OpenTransaction := false;
  CtrlPadroes.InitializeAs( Self );

  Rad := Trad.Create;
End;
//************************************************
Procedure TCtrlGeraLotePgto.OnCreateAppServer;
Begin
  Inherited;
  CdsDocPendentes        := TClientDataSet.Create( Nil );
  CdsLoteXDocumento      := TClientDataSet.Create( Nil );
  CdsDescPortadorForma   := TClientDataSet.Create( Nil );
  CdsLotePagto           := TClientDataSet.Create( Nil );
  CdsAux                 := TClientDataSet.Create( Nil );
  CdsNumlancto           := TClientDataSet.Create( Nil );
  CdsFormadePagto        := TClientDataSet.Create( Nil );
  Cdsseladiantpendent    := TClientDataSet.Create( Nil );
  CdsModulos             := TClientDataSet.Create( Nil );
  CdsTipoDocRecPag       := TClientDataSet.Create( Nil );
  CdsSaldoLoteNaoEmitido := TClientDataSet.Create( Nil );
  CdsRateio              := TClientDataSet.Create( Nil );
End;
//************************************************
Procedure TCtrlGeraLotePgto.SetCdsAux( Const Value: TClientDataSet);
Begin
  FCdsAux := Value;
End;
//************************************************
Procedure TCtrlGeraLotePgto.SetCdsDescPortadorForma( Const Value: TClientDataSet);
Begin
  FCdsDescPortadorForma := Value;
End;
//************************************************
Procedure TCtrlGeraLotePgto.SetCdsDocPendentes( Const Value: TClientDataSet);
Begin
  FCdsDocPendentes := Value;
End;
//************************************************
Procedure TCtrlGeraLotePgto.SetCdsFormadePagto( Const Value: TClientDataSet);
Begin
  FCdsFormadePagto := Value;
End;
//************************************************
Procedure TCtrlGeraLotePgto.SetCdsLotePagto( Const Value: TClientDataSet);
Begin
  FCdsLotePagto := Value;
End;
//************************************************
Procedure TCtrlGeraLotePgto.SetCdsLoteXDocumento( Const Value: TClientDataSet);
Begin
  FCdsLoteXDocumento := Value;
End;
//************************************************
Procedure TCtrlGeraLotePgto.SetCdsModulos( Const Value: TClientDataSet);
Begin
  FCdsModulos := Value;
End;
//************************************************
Procedure TCtrlGeraLotePgto.SetCdsNumlancto( Const Value: TClientDataSet);
Begin
  FCdsNumlancto := Value;
End;
//************************************************
Procedure TCtrlGeraLotePgto.SetCdsRateio( Const Value: TClientDataSet);
Begin
  FCdsRateio := Value;
End;
//************************************************
Procedure TCtrlGeraLotePgto.SetCdsSaldoLoteNaoEmitido( Const Value: TClientDataSet);
Begin
  FCdsSaldoLoteNaoEmitido := Value;
End;
//************************************************
Procedure TCtrlGeraLotePgto.SetCdsseladiantpendent( Const Value: TClientDataSet);
Begin
  FCdsseladiantpendent := Value;
End;
//************************************************
Procedure TCtrlGeraLotePgto.SetCdsTipoDocRecPag( Const Value: TClientDataSet);
Begin
  FCdsTipoDocRecPag := Value;
End;
//************************************************
Procedure TCtrlGeraLotePgto.MontaCdsVazia( pbLimpaDocPendentes : Boolean );
Begin
  rSumValor := 0;

  If pbLimpaDocPendentes Then Begin
    If ( CdsDocPendentes.Active ) And ( CdsDocPendentes.ChangeCount > 0 ) Then CdsDocPendentes.CancelUpdates;

    FazQuery(CdsDocPendentes, 'SELECT LANCTODOCUM.VLRLIQUIDO,(0)as SALDO,DOCUMENTO.IDFORCLI,DOCUMENTO.OPERACAO,DOCUMENTO.CODDOCUMENTO,'+
       'DOCUMENTO.IDPESSOA,DOCUMENTO.NoDOCUMENTO,DOCUMENTO.COMPLDOCUMENTO,DOCUMENTO.DATAPROGRAMADA,'+
       'DOCUMENTO.DATAVENCTO,DOCUMENTO.RECPAG,PESSOA.RAZAOSOCIAL AS NOME,DOCUMENTO.STATUS, DOCUMENTO.NUMLEITCODBARRAS, DOCUMENTO.NUMDIGCODBARRAS '+
       'FROM DOCUMENTO,LANCTODOCUM,PESSOA WHERE (1=2) ' );
  End;

  FazQuery(CdsLoteXDocumento, 'SELECT 0 AS VLRLIQUIDO, LOTEXDOCUM.NUMLOTE, LOTEXDOCUM.CODDOCUMENTO, LOTEXDOCUM.VALOR, ' +
     'LOTEXDOCUM.CODBARRA, LOTEXDOCUM.CODBARRAVALOR, Pessoa.RAZAOSOCIAL AS nome,DOCUMENTO.DATAPROGRAMADA, '+
     'Documento.idpessoa,DOCUMENTO.DATAVENCTO,DOCUMENTO.NoDOCUMENTO, '+
     'DOCUMENTO.COMPLDOCUMENTO, DOCUMENTO.OPERACAO, DOCUMENTO.IDFORCLI,0 as imp, 0 as tot FROM LOTEXDOCUM,PESSOA,DOCUMENTO  '+
     'WHERE  (1=2)' );

  FazQuery(CdsLotePagto, 'SELECT NUMLOTE, IDPESSOA, CODPORTFORMA, DATAEMISSAO, IDPROCESSO, ' +
     ' NUMCHQBORDERO, FAVORECIDO, FLAGEMISSAO, FLAGCANCEL, OBSERVACAO, IDUSUARIOINCLUSAO, DATADIFERIDO ' +
     ' FROM LOTEPAGTO WHERE (1=2)' );
End;
//************************************************
Procedure TCtrlGeraLotePgto.AbreQueries;
Begin

  With DtmGeraLotePgto Do Begin

    SqlModulos.Prepare;
    SqlModulos.Open;
    {
    CdsTipoDocRecPag.Close;
    If Not SqlTipoDocRecPag.Prepared Then SqlTipoDocRecPag.Prepare;
    SqlTipoDocRecPag.Params[0].AsString  := RecPag;
    SqlTipoDocRecPag.Params[1].Asinteger := Trunc( IdUsuario );
    SqlTipoDocRecPag.Open;

    CdsFormadePagto.Close;
    If Not SqlFormadePagto.Prepared Then SqlFormadePagto.Prepare;
    SqlFormadePagto.ParamByName('RECPAG').AsString    := RecPag;
    SqlFormadePagto.ParamByName('IDPESSOA').AsInteger := Trunc( IdEmpresa );
    SqlFormadePagto.Open;
    }
    iSeqDesperdicado := 0;
    bLoteSendoGerado:=False;

    MontaCdsVazia( True );

    bMontaQuery := True;
    {
    FazQuery(CdsDescPortadorForma, ' SELECT B.RAZAOSOCIAL, PF.DESCRICAO, PF.CODPORTFORMA, PF.IDTEMPLCHEQUE, PF.CODFORMA, PF.FLGCHEQUEDIFERIDO, PF.FLGOBRIGAFAV ' +
                                   ' FROM PORTADORFORMA PF, PORTADORCONTA PC, PESSOA B  '+
                                   ' WHERE PF.IDPESSOA = '+ FloatToStr(idEmpresa)+
                                   ' AND PF.RECPAG = '''+ RecPag +'''' +
                                   ' AND PF.CODPORTADOR = PC.CODPORTADOR(+) ' +
                                   ' AND PC.IDBANCO = B.IDPESSOA(+) ORDER BY PF.DESCRICAO');
    }
  End;
End;
//************************************************
Function TCtrlGeraLotePgto.SequenciaTabela( TabelaDeSequencia : String ;
                                            Var iSeqDesperdicado : Double ) : Double;
Var
  INumSeq : Double;
Begin
  If ( iSeqDesperdicado = 0 ) Then Begin
    iNumSeq          := GetSequence( 'LOTEPAGTO' );
    iSeqDesperdicado := iNumSeq;
  End Else Begin
    iNumSeq          := iSeqDesperdicado;
  End;

  SequenciaTabela := iNumSeq;
End;
//************************************************
Procedure TCtrlGeraLotePgto.CalculaSaldos( Var pDocPend  : Integer;
                                           Var pValtotSel : Double );
Var
  icodigo,
  iContreg    : Integer;
  rsaldo,
  fTotalPend  : Double;
Begin
  iContreg := 0;
  fTotalPend := 0;

  CdsDocPendentes.first;
  While Not( CdsDocPendentes.EOF ) Do Begin
    rSaldo:=0;
    icodigo:=CdsDocPendentes.FieldByname( 'CODDOCUMENTO' ).Asinteger;

    CtrlDocumento.Saldo.CalculaSaldo( icodigo );

    //verifica se o documento pendente está selecionado atribuindo ao saldo a diferença do valor
    //do documento e do valor selecionado
    if CdsLoteXDocumento.Locate('CODDOCUMENTO',CdsDocPendentes.FieldByname( 'CODDOCUMENTO' ).Asinteger,[]) then
       rSaldo:=rSaldo-CdsLoteXDocumento.FieldByname( 'VALOR' ).AsFloat;

    //20/10/2000 INICIO - PERMITIR CRIAR VÁRIOS PAGAMENTOS PARCIAIS DO MESMO DOCUMENTO
    //verifica se o documento está contido em outro lote nao emitido e diminui do saldo do mesmo
    With DtmGeraLotePgto.SqlSaldoLoteNaoEmitido Do Begin
      If CdsSaldoLoteNaoEmitido.Active Then CdsSaldoLoteNaoEmitido.Close;
      If Not Prepared Then Prepare;
      Params[0].AsFloat := CdsDocPendentes.FieldByname( 'CODDOCUMENTO' ).Asinteger;
      Open;
      If Not CdsSaldoLoteNaoEmitido.IsEmpty Then rSaldo := rSaldo - CdsSaldoLoteNaoEmitido.Fields[0].AsFloat;
      CdsSaldoLoteNaoEmitido.Close;
    End;
    //20/10/2000 FIM - PERMITIR CRIAR VÁRIOS PAGAMENTOS PARCIAIS DO MESMO DOCUMENTO

    //Se houver saldo o documento recebe o valor calcula
    If Format( '%17.2f',[ rSaldo ] ) <> Format( '%17.2f',[ ValorZero ] ) Then Begin
      CdsDocPendentes.edit;
      CdsDocPendentes.FieldByname( 'SALDO' ).AsFloat:=rSaldo;
      CdsDocPendentes.post;
      Inc(iContreg);
      fTotalPend := fTotalPend + rSaldo;
      CdsDocPendentes.Next;
    End Else Begin
       CdsDocPendentes.Delete;
    End;
  End;
  CdsDocPendentes.first;

  pDocPend   := iContreg;
  pValtotSel := fTotalPend;
End;
//************************************************
Procedure TCtrlGeraLotePgto.AbreCdsSelAdiantPendent;
Begin
  With DtmGeraLotePgto.SqlSelAdiantPendent Do Begin
    CdsSelAdiantPendent.Close;
    If Not Prepared Then Prepare;
    Params[0].AsInteger := CdsDocPendentes.FieldByName( 'IDFORCLI' ).AsInteger;
    Open;
  End;
End;
//************************************************
Function TCtrlGeraLotePgto.Verifica_Adianto( idocumento : Integer ) : Boolean;
Begin
  Result := false;
  Try
    If ( Cdsdocpendentes.FieldByName( 'OPERACAO' ).AsString = '14' ) And
       ( IntegraContab ) Then Begin

      If ( RecPag = 'P' ) Then Begin

        FazQuery(CdsAux, ' SELECT CONTACADIANTAMENTO FROM EMPRESAFORN EMP , DOCUMENTO DOC '+
                ' WHERE DOC.CODDOCUMENTO  =  ''' + INTTOSTR(IDOCUMENTO) + '''   AND '+
                '       DOC.IDPESSOA      = EMP.IDPESSOA AND '+
                '       DOC.IDFORCLI      = EMP.IDFORCLI ' );
        SAdiantaPag := CdsAux.FieldByName('CONTACADIANTAMENTO').Asstring;
      End Else Begin
        FazQuery(CdsAux, ' SELECT CONTACADIANTAMENTO FROM EMPRESACLIENTE EMP , DOCUMENTO DOC '+
                ' WHERE DOC.CODDOCUMENTO  =  ''' + INTTOSTR(IDOCUMENTO) + '''   AND '+
                '       DOC.IDPESSOA      = EMP.IDPESSOA AND '+
                '       DOC.IDFORCLI      = EMP.IDFORCLI ' );
        Sadiantarec := CdsAux.FieldByName('CONTACADIANTAMENTO').Asstring;
      End;

      If ( CdsAux.FieldByName('CONTACADIANTAMENTO').AsString <> '' ) Then
        Result := True
      Else Begin
        MessageInfo := 'Não existe Conta de Adiantamento';
      End;
    End Else Begin
      Result := true;
    End;
  Except
    On E : Exception Do Exception.Create( E.Message );
  End;
End;
//************************************************
Function TCtrlGeraLotePgto.bbtnCriaLoteClick( psbLotePanels2,
                                              pdblkcmbDescricaoLookupValue,
                                              psAuxDataDiferido : String )  : Boolean;
Var
  iNumLancto : Integer;
  sDebCre    : String;
Begin
  Try
    StartTransacao;

    CdsLotePagto.first;

    CdsLotePagto.Edit;
    CdsLotePagto.FieldByName( 'NUMLOTE' ).Value := iNumSeqLote;
    If ( IdTipoProcRad > 0 ) Then Begin
      CdsLoteXDocumento.First;

      While Not CdsLoteXDocumento.Eof Do Begin
        rad.Valor := rad.Valor + CdsLoteXDocumento.FieldByName( 'Valor' ).AsFloat;
        CdsLoteXDocumento.Next;
      End;
      Rad.TipoProcesso                 := Trunc( IdTipoProcRad );
      Rad.OBS                          := 'Lote Nº: ' + CdsLotePagto.FieldByName( 'NUMLOTE' ).AsString;
      CdsLotePagto.FieldByName( 'IDPROCESSO' ).AsInteger := Rad.IniciarProcesso;
    End;

    CdsLotePagto.FieldByName('DATAEMISSAO' ).AsDateTime := StrToDate( pSbLotePanels2 );
    CdsLotePagto.FieldByName('CODPORTFORMA' ).AsInteger := StrToInt( pdblkcmbDescricaoLookupValue );
    CdsLotePagto.FieldByName('IDPESSOA' ).AsInteger     := Trunc( IdEmpresa );;

    If ( psAuxDataDiferido <> '' ) Then
      CdsLotePagto.FieldByName('DATADIFERIDO' ).AsDateTime := StrToDate( psAuxDataDiferido );

    CdsLotePagto.FieldByName('flagcancel' ).AsString:='';
    CdsLotePagto.Post;

    ApplyCds( CdsLotePagto, DbLotepagto, [], [] );
    //updsqlLotePagto.Apply(ukInsert);

    CdsLoteXDocumento.first;

    while not(CdsLoteXDocumento.eof) do
    begin
       GetNumLancto(CdsLoteXDocumento.FieldByName( 'CODDOCUMENTO' ).AsInteger,iNumLancto,sDebCre);

       FazQuery(DtmbaseDados.Cds,'UPDATE DOCUMENTO SET CODPORTFORMA = ' +
                       pdblkcmbDescricaoLookupValue + ' WHERE CODDOCUMENTO = ' +
                       CdsLoteXDocumento.FieldByName( 'CODDOCUMENTO' ).AsString );

       CtrlImpostoRetidoLote.RecPag            := RecPag[ 1 ];
       CtrlImpostoRetidoLote.IdEmpresa         := Trunc( IdEmpresa );
       CtrlImpostoRetidoLote.IdUsuario         := Trunc( IdUsuario );
       CtrlImpostoRetidoLote.IdModulo          := Trunc( IdModulo );
       CtrlImpostoRetidoLote.IdPlanoConta      := Trunc( IdPlanoConta );
       CtrlImpostoRetidoLote.UsaPlanoPatro     := UsaPlanoPatro;
       CtrlImpostoRetidoLote.IntegraContab     := IntegraContab;
       CtrlImpostoRetidoLote.PartidaDobrada    := PartidaDobrada;
       CtrlImpostoRetidoLote.NumLote           := CdsLoteXDocumento.FieldByName( 'NUMLOTE' ).AsFloat;
       CtrlImpostoRetidoLote.DataProgramada    := CdsLotePagto.FieldByName( 'DATAEMISSAO' ).AsDateTime;
       CtrlImpostoRetidoLote.OperacaoDocumento := CdsLoteXDocumento.FieldByName( 'OPERACAO' ).AsString;
       CtrlImpostoRetidoLote.IdForCli          := CdsLoteXDocumento.FieldByName( 'IDFORCLI' ).AsInteger;
       CtrlImpostoRetidoLote.CodDocumento      := CdsLoteXDocumento.FieldByName( 'CODDOCUMENTO' ).AsInteger;
       CtrlImpostoRetidoLote.NumLancto         := iNumLancto;
       CtrlImpostoRetidoLote.ValorLancto       := CdsLoteXDocumento.FieldByName( 'VALOR' ).AsFloat;
       CtrlImpostoRetidoLote.ValorLiquido      := CdsLoteXDocumento.FieldByName( 'VLRLIQUIDO' ).AsFloat;
       CtrlImpostoRetidoLote.DataLancto        := CdsLotePagto.FieldByName( 'DATAEMISSAO' ).AsDateTime;
       CtrlImpostoRetidoLote.DataEmissao       := CdsLotePagto.FieldByName( 'DATAEMISSAO' ).AsDateTime;
       CtrlImpostoRetidoLote.DebCre            := sDebCre;
       CtrlImpostoRetidoLote.MomentoLancamento := mlBaixa;
       CtrlImpostoRetidoLote.CodPortForma      := StrToInt( pdblkcmbDescricaoLookupValue);
       CtrlImpostoRetidoLote.Incluir;

       VlrRetencao := CtrlImpostoRetidoLote.ValorAlteradores;

       //Para documentos com a natureza invertida
       If ((sDebCre = 'D') And ( RecPag = 'P')) Or
          ((sDebCre = 'C') And ( RecPag = 'R')) Then
          VlrRetencao := VlrRetencao * -1;

       If CtrlImpostoRetidoLote.ValorAlteradores <> 0 Then Begin
          CdsLoteXDocumento.Edit;
          CdsLoteXDocumento.FieldByName( 'VALOR' ).AsFloat := CdsLoteXDocumento.FieldByName( 'VALOR' ).AsFloat + VlrRetencao;
          CdsLoteXDocumento.Post;
       End;

       If CdsLoteXDocumento.FieldByName( 'OPERACAO' ).AsString = '10' Then Begin
          If FazQuery(DtmBaseDados.Cds,'UPDATE RECBTOPAGTO SET NUMCHQBORDERO = ''' +
            CdsLotePagto.FieldByName( 'NUMLOTE' ).AsString + ''' WHERE CODDOCUMENTO = ' + CdsLoteXDocumento.FieldByName( 'CODDOCUMENTO' ).AsString ) Then Begin
              If FazQuery(DtmBaseDados.Cds,'SELECT CODLANCFINANC FROM RECBTOPAGTO WHERE CODDOCUMENTO = ' +
                           CdsLoteXDocumento.FieldByName( 'CODDOCUMENTO' ).AsString) Then
              Begin
                   If Not FazQuery(DtmBaseDados.Cds,'UPDATE MOVIMFINANC SET NUMCHQBORDERO = ''' +
                          CdsLotePagto.FieldByName( 'NUMLOTE' ).AsString + ''', HISTORICO = ''BORDERÔ Nº ' + CdsLotePagto.FieldByName( 'NUMLOTE' ).AsString +
                          ''' WHERE CODLANCFINANC = ' + IntToStr(DtmBaseDados.Cds.Fields[0].AsInteger)) Then
                          Raise EdataBaseError.Create('Não foi possível atualizar movimento financeiro para o Doc ' +
                                                CdsLoteXDocumento.FieldByName( 'CODDOCUMENTO' ).AsString + ', verifique');
              End
              Else
                 Raise EdataBaseError.Create('Erro ao selecionar movimento financeiro para o Doc ' +
                        CdsLoteXDocumento.FieldByName( 'CODDOCUMENTO' ).AsString + ', verifique');
          End
          Else
             Raise EdataBaseError.Create('Não foi possível atualiar Nº do Cheque\Borderô para o Doc ' +
                   CdsLoteXDocumento.FieldByName( 'CODDOCUMENTO' ).AsString + ', verifique');
       End;

       if CdsLoteXDocumento.UpdateStatus in [usModified,usInserted] then
          ApplyCds( CdsLoteXDocumento, DbLotexdocum, [], [] );
          //updsqlLoteXDocumento.Apply(ukInsert);

       CdsLoteXdocumento.next;
    end;

    CtrlImpostoRetidoLote.NumLote := CdsLoteXDocumento.FieldByName( 'NUMLOTE' ).AsFloat;
    CtrlImpostoRetidoLote.CodPortForma := StrToInt( pdblkcmbDescricaoLookupValue );
    CtrlImpostoRetidoLote.EfetivaNovoDocumento;
    If Not CtrlPadroes.GravaLogOperacoes( IdEmpresa, IdModulo, IdUsuario, 'Criar Lote', False ) Then Begin
      Raise Exception.Create('Não Consegui Gravar o Log');
    End;
    Commit;

    CtrlImpostoRetidoLote.CancelaAcumulaImposto;

    CdsLoteXDocumento.Close;
    CdsLotePagto.Close;
    DtmGeraLotePgto.SqlLoteXDocumento.Open;
    DtmGeraLotePgto.SqlLotePagto.Open;

    iSeqDesperdicado := 0;
    MessageInfo := 'Lote gerado com sucesso ';
    bMontaQuery := True;

    MontaCdsVazia(False);
    Result := True;
  except
     Result := False;
     Rollback;
     CtrlImpostoRetidoLote.CancelaAcumulaImposto;
     MessageInfo := 'Erro ao Gerar Lotes';
     If CdsLotePagto.ChangeCount > 0 Then CdsLotePagto.CancelUpdates;
     If CdsLoteXDocumento.ChangeCount > 0 Then CdsLoteXDocumento.CancelUpdates;
  end;
End;
//************************************************
Procedure TCtrlGeraLotePgto.GetNumLancto(piCodDocumento :Integer; Var iNumLancto :Integer; Var sDebCre :String);
Begin
  CdsNumlancto.Close;
  With DtmGeraLotePgto.SqlNumlancto Do Begin

    If Not Prepared Then Prepare;
    ParamByName('CODDOCUMENTO').AsInteger := piCodDocumento;
    Open;
  End;

  iNumLancto := CdsNumlancto.FieldByName( 'NUMLANCTO' ).AsInteger;
  sDebCre    := CdsNumlancto.FieldByName( 'DEBCRE' ).AsString;
  CdsNumlancto.Close;
End;
//************************************************
Procedure TCtrlGeraLotePgto.bbtnSelecionaDocClick( CmpDadosParaBaixa : TCmParamReport;
                                                   pModuloCodDocCPMF : Double;
                                                   Var DocPend       : Integer;
                                                   Var ValtotSel     : Double );
Var
  sqlDocPendentes : String;


Begin
  Try
    sqlDocPendentes:=
           'SELECT LANCTODOCUM.VLRLIQUIDO, (0)as SALDO,DOCUMENTO.IDFORCLI,DOCUMENTO.OPERACAO,DOCUMENTO.CODDOCUMENTO,'+
           ' DOCUMENTO.IDPESSOA,DOCUMENTO.NoDOCUMENTO,DOCUMENTO.COMPLDOCUMENTO,DOCUMENTO.DATAPROGRAMADA,'+
           ' DOCUMENTO.DATAVENCTO,DOCUMENTO.RECPAG,PESSOA.RAZAOSOCIAL AS NOME,DOCUMENTO.STATUS, DOCUMENTO.NUMLEITCODBARRAS, DOCUMENTO.NUMDIGCODBARRAS, DOCUMENTO.IDFORCLI '+
           ' FROM DOCUMENTO,LANCTODOCUM,PESSOA WHERE (DOCUMENTO.IDFORCLI=PESSOA.IDPESSOA) AND ((EMISBLOQ <> ''S'') OR (EMISBLOQ IS NULL)) AND ';

           If EmiteLancaBaixa Then
             sqlDocPendentes := sqlDocPendentes +
             ' ((((DOCUMENTO.STATUS=''0'') OR (DOCUMENTO.STATUS=''1'') OR (DOCUMENTO.STATUS is  NULL))   AND ' +
             ' ((DOCUMENTO.OPERACAO=''2'') OR (DOCUMENTO.OPERACAO=''3'') OR (DOCUMENTO.OPERACAO=''14''))) OR ' +
             ' ((DOCUMENTO.STATUS = ''2'') AND (DOCUMENTO.OPERACAO = ''10''))) AND ' +
             ' (DOCUMENTO.FLGEMITELANCBAIX IS NULL) AND ' +
              ' documento.CODTIPDOC in (SELECT CODTIPDOC FROM TIPODOCRECPAG a WHERE a.RECPAG =   ''' +
                           RecPag+''' and not exists  (select 1 from UsuarioxTpdocto b where recpag='+#39+recpag+#39+' and b.idusuario=' +
                           FloatToStr( IdUsuario)+') union  SELECT CODTIPDOC  FROM TIPODOCRECPAG a WHERE a.RECPAG =   ''' +
                           RecPag+ '''  and exists (select 1 from UsuarioxTpdocto b where recpag='+#39+ recpag+#39+' and a.codtipdoc=b.codtipdoc and b.idusuario=' +
                           FloatToStr( idusuario)+')) and '
           Else
             sqlDocPendentes := sqlDocPendentes +
             ' (DOCUMENTO.STATUS=''0'' or DOCUMENTO.STATUS=''1'' or (DOCUMENTO.STATUS is  NULL))   AND '+
             ' (DOCUMENTO.OPERACAO=''2'' OR DOCUMENTO.OPERACAO=''3'' OR DOCUMENTO.OPERACAO=''14'') AND '+
             ' documento.CODTIPDOC in (SELECT CODTIPDOC FROM TIPODOCRECPAG a WHERE a.RECPAG =   ''' +
                           RecPag+''' and not exists  (select 1 from UsuarioxTpdocto b where recpag='+#39+recpag+#39+' and b.idusuario=' +
                           FloatToStr(IdUsuario)+') union  SELECT CODTIPDOC  FROM TIPODOCRECPAG a WHERE a.RECPAG =   ''' +
                           RecPag+ '''  and exists (select 1 from UsuarioxTpdocto b where recpag='+#39+recpag+#39+' and a.codtipdoc=b.codtipdoc and b.idusuario=' +
                           FloatToStr( idusuario )+')) and ' ;

    If Not CmpDadosParaBaixa.ParamValues[ 1 ].IsNull Then
      sqlDocPendentes:= sqlDocPendentes + ' (DOCUMENTO.IDFORCLI = ' + CmpDadosParaBaixa.ParamValues[ 1 ].AsString + ') AND ';

    If Not CmpDadosParaBaixa.ParamValues[ 7 ].IsNull Then
      sqlDocPendentes:= sqlDocPendentes + ' (DOCUMENTO.DATAPROGRAMADA >= TO_DATE('''+ CmpDadosParaBaixa.ParamValues[ 7 ].AsString +''',''DD/MM/YYYY'')) AND ';

    If CmpDadosParaBaixa.ParamValues[ 8 ].IsNull Then
      sqlDocPendentes:= sqlDocPendentes + ' (DOCUMENTO.DATAPROGRAMADA <= TO_DATE('''+ CmpDadosParaBaixa.ParamValues[ 8 ].AsString +''',''DD/MM/YYYY'')) AND ';

    If Not CmpDadosParaBaixa.ParamValues[ 2 ].IsNull Then
      sqlDocPendentes:= sqlDocPendentes + ' (DOCUMENTO.NODOCUMENTO = ' + Trim( CmpDadosParaBaixa.ParamValues[ 2 ].AsString ) + ') AND ';

    If Not CmpDadosParaBaixa.ParamValues[ 6 ].IsNull Then
      sqlDocPendentes:= sqlDocPendentes + ' (DOCUMENTO.IDMODULO = ' + CmpDadosParaBaixa.ParamValues[ 6 ].AsString + ') AND ';

    If Not CmpDadosParaBaixa.ParamValues[ 3 ].IsNull Then
       sqlDocPendentes:= sqlDocPendentes + ' (RTRIM(DOCUMENTO.COMPLDOCUMENTO) = ''' + CmpDadosParaBaixa.ParamValues[ 3 ].AsString + ''') AND ';

    If Not CmpDadosParaBaixa.ParamValues[  0 ].IsNull Then
       sqlDocPendentes:= sqlDocPendentes + ' (DOCUMENTO.FLGCONFIRMARECPAG = ''S'') AND ';

    If CmpDadosParaBaixa.ParamValues[ 13 ].AsBoolean Then
       sqlDocPendentes:= sqlDocPendentes + ' (DOCUMENTO.CODTIPDOC <> ' + FloatToStr( pModuloCodDocCPMF ) + ') AND ';

    If Not CmpDadosParaBaixa.ParamValues[ 5 ].IsNull Then
       sqlDocPendentes:= sqlDocPendentes + ' (DOCUMENTO.CODTIPDOC = ' + CmpDadosParaBaixa.ParamValues[ 5 ].AsString + ') AND ';

    If ( CmpDadosParaBaixa.ParamValues[ 12 ].AsBoolean ) And
       (Not CdsDescPortadorForma.FieldByname( 'CODFORMA' ).IsNull ) And
       ( Not CmpDadosParaBaixa.ParamValues[ 10 ].AsBoolean ) and
       ( CmpDadosParaBaixa.ParamValues[ 4 ].IsNull ) Then

        sqlDocPendentes:= sqlDocPendentes + ' (DOCUMENTO.CODFORMA = ' + CdsDescPortadorForma.FieldByname( 'CODFORMA' ).AsString + ') AND '
    Else
    If ( Not CmpDadosParaBaixa.ParamValues[ 4 ].IsNull ) Then
        sqlDocPendentes := sqlDocPendentes + ' (DOCUMENTO.CODFORMA = ' + CmpDadosParaBaixa.ParamValues[ 4 ].AsString + ') AND ';

    If ( CmpDadosParaBaixa.ParamValues[ 11 ].AsBoolean ) And
       ( Not CmpDadosParaBaixa.ParamValues[ 10 ].AsBoolean ) Then
        sqlDocPendentes:= sqlDocPendentes + ' (DOCUMENTO.CODPORTFORMA = ' + CdsDescPortadorForma.FieldByname( 'CODPORTFORMA' ).AsString + ') AND ';

    sqlDocPendentes:= sqlDocPendentes +
  //               ' (DOCUMENTO.CODDOCUMENTO !=ALL (select coddocumento from lotexdocum where flgbaixa is null or flgbaixa = ''N'')) AND ' +
           ' (DOCUMENTO.RECPAG='''+ RecPag +''') AND '+
           ' (DOCUMENTO.IDPESSOA='+ FloatToStr( idEmpresa)+ ') AND ' +
           ' (DOCUMENTO.OPERACAO = LANCTODOCUM.OPERACAO) AND ' +
           ' (DOCUMENTO.CODDOCUMENTO = LANCTODOCUM.CODDOCUMENTO) AND ' +
           ' (LANCTODOCUM.ESTORNO IS NULL)' +
           ' ORDER BY  PESSOA.RAZAOSOCIAL ,DOCUMENTO.DATAPROGRAMADA, DOCUMENTO.NoDOCUMENTO';

    FazQuery(CdsDocPendentes,sqlDocPendentes);

    //Rosane 26/11/2001
    {if Documento.ProcessoAutLote <> 0 then begin
        CdsDocPendentes.First;
        While Not CdsDocPendentes.Eof Do
        Begin
           //Faz query do rateio do documento para saber se tem processo do rad.
           CdsRateio.Close;
           CdsRateio.ParamByName('CODDOCUMENTO').AsFloat := CdsDocPendentes.FieldByName('CODDOCUMENTO').AsFloat;
           CdsRateio.Open;
           bNaoAutorizou := False;
           While not CdsRateio.Eof do Begin
              if not FazQuery(DtmBaseDados.Cds,'SELECT FLGOK FROM RADINSTPROCESSO WHERE (IDPROCESSO = '+CdsRateio.FieldByName('IDPROCESSO').AsString+') AND (FLGOK = ''S'')') Then begin
                 bNaoAutorizou := True;
                 Break;
              end;
              CdsRateio.Next;
           end;
           if bNaoAutorizou then
              CdsDocPendentes.Delete;
           CdsDocPendentes.Next;
        End;
    end;}

    CdsLoteXDocumento.First;
    While Not CdsLoteXDocumento.Eof Do
    Begin
      If CdsDocPendentes.Locate('CODDOCUMENTO',CdsLoteXDocumento.FieldByname( 'CODDOCUMENTO' ).AsFloat,[]) Then
        CdsDocPendentes.Delete;

      CdsLoteXDocumento.Next;
    End;

    CdsLoteXDocumento.First;

    CalculaSaldos( DocPend, ValtotSel );
  Except 
    On  E : Exception Do MessageInfo := E.Message;
  End;
End;
//************************************************
Function TCtrlGeraLotePgto.GeraSql( pParametro : String ) : String;
Begin
  With DtmGeraLotePgto Do Begin
    If ( UpperCase( pParametro ) = 'DBLKCMBDESCRICAO' ) Then Begin

      Result := ' SELECT B.RAZAOSOCIAL, PF.DESCRICAO, PF.CODPORTFORMA, PF.IDTEMPLCHEQUE, PF.CODFORMA, PF.FLGCHEQUEDIFERIDO, PF.FLGOBRIGAFAV ' +
                ' FROM PORTADORFORMA PF, PORTADORCONTA PC, PESSOA B  '+
                ' WHERE PF.IDPESSOA = '+ FloatToStr(idEmpresa)+
                ' AND PF.RECPAG = '''+ RecPag +'''' +
                ' AND PF.CODPORTADOR = PC.CODPORTADOR(+) ' +
                ' AND PC.IDBANCO = B.IDPESSOA(+) ORDER BY PF.DESCRICAO';

    End Else If ( UpperCase( pParametro ) = 'DBLCODFORMA' ) Then Begin

      If Not SqlFormadePagto.Prepared Then SqlFormadePagto.Prepare;
      SqlFormadePagto.ParamByName('RECPAG').AsString    := RecPag;
      SqlFormadePagto.ParamByName('IDPESSOA').AsInteger := Trunc( IdEmpresa );
      Result := SqlFormadePagto.SQLChanged;

    End Else If ( UpperCase( pParametro ) = 'CMBTIPODOCRECPAG' ) Then Begin

      If Not SqlTipoDocRecPag.Prepared Then SqlTipoDocRecPag.Prepare;
      SqlTipoDocRecPag.Params[0].AsString  := RecPag;
      SqlTipoDocRecPag.Params[1].Asinteger := Trunc( IdUsuario );
      Result := SqlTipoDocRecPag.SQLChanged;
    End;
  End;
End;
//************************************************
End.
