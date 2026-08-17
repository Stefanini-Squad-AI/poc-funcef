{*******************************************************************************
  Alterações:
*******************************************************************************}
{-------------------------------------------------------------------------------
--------------------------------------------------------------------------------
Pendência: MIGRAÇÃO-ORACLE
Analista : Paulo Nobre
Data     : 21/10/2025
Solução  : Inclusão da função CAST, em campos, no cds:
           .CdsDocPendentes                      
--------------------------------------------------------------------------------
Desenvolvedor: Marcus Oliveira
Data         : 24/08/2007
Pendência    : 23738
Descrição    : Criado uma opção para trazer apenas documentos aprovados pelo
               RAD(Ultima Etapa)
{-------------------------------------------------------------------------------
Rotinas   : bbtnSelecionaDocClick
Data      : 06/11/2006
Autor     : andré tavares
Pendência : 23658
Descrição : adaptação para filtar os documento de conta corrente do mesmo banco do portador forma,
bem como a exibição dos dados das contas corrente dos mesmos.
-------------------------------------------------------------------------------}
{-------------------------------------------------------------------------------
Rotinas   : bbtnSelecionaDocClick
Data      : 09/05/2006
Autor     : andré tavares
Pendência : 22197
Descrição : acerto na query para buscar o valor líquido do documento.
-------------------------------------------------------------------------------}
{-------------------------------------------------------------------------------
Rotinas   : Várias
Data      : 19/08/2004 (término)
Autor     : David Ayrolla
Pendência : 17221
Descrição : Implementar processo RAD por lote ou por documento.
-------------------------------------------------------------------------------}
{-------------------------------------------------------------------------------
Rotinas   : ProcessoRadLiberado
Data      : 07/06/2004 (Término)
Autor     : David Ayrolla
Pendência : 14646
Descrição : Criação de função que retorna se o documento foi liberado no RAD.
-------------------------------------------------------------------------------}

Unit
  uCtrlGeraLotePgto;

Interface

Uses
  SysUtils, DB, DbClient, Classes, StdCtrls, uCmControlObject, uCmDbObject,
  uCmTypes, uDtmGeraLotePgto, uMidasUtil, uDataBase, uCtrlImpostoRetido,
  uCtrlDocumento, uRad, uDbLotePagto, uDbLotexdocum, DBaseDados, uCtrlPadroes,
  CmParamReport, JclMath, uCtrlRAD,

  // Rodolpho da SIlva - 27/11/2006
  uCtrlRADPlus;



Type
  TCtrlGeraLotePgto = Class(TCmControlObject)
  Protected
    Procedure OnCreateAppServer; Override;
    Procedure AfterInitialize; Override;
    Procedure DoChangeDataBase; Override;



  Private
    Rad :Trad; // andré tavares - 25/08/2006 - declarei esta variável com private por que tinha 2 ctrls liberando a mesma variável de escopo da unit urad e isso tava causando access violation
    _DtmGeraLotePgto       : TDtmGeraLotePgto;
    CtrlImpostoRetidoLote : TCtrlImpostoRetido;
    CtrlPadroes           : TCtrlPadroes;

    // Rodolpho da SIlva - 27/11/2006
    CtrlRadPlus: TCtrlRADPlus;

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
    FRADValMinimo   : Double;    // Fdias - 26.05.2003
    FRadLote        : Double;    // Fdias - 26.05.2003
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

    Function AtualizaTabela( pSql : String ) : Boolean;

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
                                pSauxDataDiferido : String) : Boolean;
                                 
    Function GeraSql( pParametro : String ) : String;

    Function ListaPlano: OleVariant;

    Procedure bbtnSelecionaDocClick( CmpDadosParaBaixa : TCmParamReport;
                                     pModuloCodDocCPMF : Double;
                                     Var DocPend       : Integer;
                                     Var ValtotSel     : Double);

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
    Property RADValMinimo     : Double  Read FRADValMinimo    Write FRADValMinimo;
    Property RadLote          : Double  Read FRadLote         Write FRadLote;
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

Constructor TCtrlGeraLotePgto.Create;
Begin
  Inherited;

  DbLotePagto  := TDbLotePagto.Create( Self );
  DbLotexdocum := TDbLotexdocum.Create( Self );
End;


Destructor TCtrlGeraLotePgto.Destroy;
Begin
  If ( IsAppServer ) Then FreeCds( [ CdsDocPendentes,  CdsLoteXDocumento,      CdsDescPortadorForma,
                                     CdsLotePagto,     CdsAux,                 CdsNumlancto,
                                     CdsFormadePagto,  Cdsseladiantpendent,    CdsModulos,
                                     CdsTipoDocRecPag, CdsSaldoLoteNaoEmitido, CdsRateio ] );
  DbLotePagto.Free;
  DbLotexdocum.Free;
  _DtmGeraLotePgto.Free;
  CtrlImpostoRetidoLote.Free;
  CtrlPadroes.Free;

  // Rodolpho da SIlva - 27/11/2006
  FreeAndNil(CtrlRadPlus);

  if assigned(Rad) then
    freeAndNil(Rad);

  Inherited;
End;


Procedure TCtrlGeraLotePgto.AfterInitialize;
Begin
  Inherited;
  _DtmGeraLotePgto := TDtmGeraLotePgto.Create( Nil );

  With _DtmGeraLotePgto Do Begin
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

  CtrlPadroes                 := TCtrlPadroes.Create;
  CtrlPadroes.OpenTransaction := false;
  CtrlPadroes.InitializeAs( Self );

  // Rodolpho da SIlva - 27/11/2006
  CtrlRadPlus := TCtrlRADPlus.Create;
  CtrlRadPlus.InitializeAs(Padroes);

  Rad := Trad.Create;



End;


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


Procedure TCtrlGeraLotePgto.DoChangeDataBase;
Begin
  Inherited;
  DBLotePagto.DatabaseName := DataBaseName;
  DbLotexdocum.DatabaseName := DataBaseName;
End;


Procedure TCtrlGeraLotePgto.SetCdsAux( Const Value: TClientDataSet);
Begin
  FCdsAux := Value;
End;



Procedure TCtrlGeraLotePgto.SetCdsDescPortadorForma( Const Value: TClientDataSet);
Begin
  FCdsDescPortadorForma := Value;
End;


Procedure TCtrlGeraLotePgto.SetCdsDocPendentes( Const Value: TClientDataSet);
Begin
  FCdsDocPendentes := Value;
End;


Procedure TCtrlGeraLotePgto.SetCdsFormadePagto( Const Value: TClientDataSet);
Begin
  FCdsFormadePagto := Value;
End;


Procedure TCtrlGeraLotePgto.SetCdsLotePagto( Const Value: TClientDataSet);
Begin
  FCdsLotePagto := Value;
End;

Procedure TCtrlGeraLotePgto.SetCdsLoteXDocumento( Const Value: TClientDataSet);
Begin
  FCdsLoteXDocumento := Value;
End;


Procedure TCtrlGeraLotePgto.SetCdsModulos( Const Value: TClientDataSet);
Begin
  FCdsModulos := Value;
End;


Procedure TCtrlGeraLotePgto.SetCdsNumlancto( Const Value: TClientDataSet);
Begin
  FCdsNumlancto := Value;
End;



Procedure TCtrlGeraLotePgto.SetCdsRateio( Const Value: TClientDataSet);
Begin
  FCdsRateio := Value;
End;



Procedure TCtrlGeraLotePgto.SetCdsSaldoLoteNaoEmitido( Const Value: TClientDataSet);
Begin
  FCdsSaldoLoteNaoEmitido := Value;
End;



Procedure TCtrlGeraLotePgto.SetCdsseladiantpendent( Const Value: TClientDataSet);
Begin
  FCdsseladiantpendent := Value;
End;


Procedure TCtrlGeraLotePgto.SetCdsTipoDocRecPag( Const Value: TClientDataSet);
Begin
  FCdsTipoDocRecPag := Value;
End;


Procedure TCtrlGeraLotePgto.MontaCdsVazia( pbLimpaDocPendentes : Boolean );
Begin
  rSumValor := 0;

  If pbLimpaDocPendentes Then Begin
    if assigned(CdsDocPendentes) then //andre tavares - 04/08/2006
    begin
      If ( CdsDocPendentes.Active ) And ( CdsDocPendentes.ChangeCount > 0 ) Then
        CdsDocPendentes.CancelUpdates;
      FazQuery(CdsDocPendentes, ' SELECT DECODE(NVL(DOCUMENTO.FLGCONTAINVEST,0),0,''Velho'',''Novo'') AS TIPO, '+
                                ' (0)as VLRLIQUIDO, (0) AS SALDO, '+
                                ' DOCUMENTO.IDFORCLI,DOCUMENTO.OPERACAO, '+
                                ' DOCUMENTO.CODDOCUMENTO, DOCUMENTO.IDPESSOA,DOCUMENTO.NODOCUMENTO, '+
                                ' DOCUMENTO.COMPLDOCUMENTO,DOCUMENTO.DATAPROGRAMADA, DOCUMENTO.DATAVENCTO, '+
                                ' DOCUMENTO.RECPAG,PESSOA.RAZAOSOCIAL, PESSOA.NOME AS FORNECEDOR, PESSOA.RAZAOSOCIAL AS NOME, '+
                                ' DOCUMENTO.STATUS, DOCUMENTO.NUMLEITCODBARRAS, DOCUMENTO.NUMDIGCODBARRAS, '+
                                // Paulo Nobre - MIGRAÇÃO-ORACLE - Inicio
                                ' CAST(''                                                                                                                                                                                                            '' AS VARCHAR2(254)) AS PLANOPREV, '+
                                // Paulo Nobre - MIGRAÇÃO-ORACLE - Fim                                
                                '  ''N'' as FLGPPDIFERENTE, '+
                                ' PB.NUMBANCO AS BANCO, AG.NUMAGENCIA, CC.CONTACORRENTE '+#13+ // andre tavares - pendência 23658 - 06/11/2006
                                ' FROM DOCUMENTO,LANCTODOCUM,PESSOA, '+
                                '      CONTABANCARIA CC, AGENCIABANCARIA AG, BANCO PB '+#13+ // andre tavares - pendência 23658 - 06/11/2006
                                ' WHERE 1 = 2 '+
                              //início - andre tavares - pendência 23658 - 06/11/2006
                                ' AND PB.IDPESSOA(+) = AG.IDBANCO '+#13+
                                ' AND AG.IDPESSOA(+) = CC.IDAGENCIA '+#13+
                                ' AND DOCUMENTO.IDCBANCARIA = CC.IDCBANCARIA(+) '+#13
                               //fim - andre tavares - pendência 23658 - 06/11/2006
                                 );
    end;
  End;

  if assigned(CdsLoteXDocumento) then //andre tavares - 04/08/2006
  begin
    FazQuery(CdsLoteXDocumento, ' SELECT 0 AS VLRLIQUIDO, LOTEXDOCUM.NUMLOTE, LOTEXDOCUM.CODDOCUMENTO, LOTEXDOCUM.VALOR, ' +
                                       ' LOTEXDOCUM.IDPROCESSO, ' + //DAVID - Pendência 17221
                                       ' LOTEXDOCUM.CODBARRA, LOTEXDOCUM.CODBARRAVALOR, Pessoa.RAZAOSOCIAL AS nome,DOCUMENTO.DATAPROGRAMADA, '+
                                       ' Documento.idpessoa,DOCUMENTO.DATAVENCTO,DOCUMENTO.NoDOCUMENTO, '+
                                       ' DOCUMENTO.COMPLDOCUMENTO, DOCUMENTO.OPERACAO, DOCUMENTO.IDFORCLI,0 as imp, 0 as tot, '+
                                       // Paulo Nobre - MIGRAÇÃO-ORACLE - Inicio
                                       ' CAST(''                                                                                                                                                                                                            '' AS VARCHAR2(254)) AS PLANOPREV, '+
                                       // Paulo Nobre - MIGRAÇÃO-ORACLE - Fim
                                ' PB.NUMBANCO AS BANCO, AG.NUMAGENCIA, CC.CONTACORRENTE '+#13+ // andre tavares - pendência 23658 - 06/11/2006
                                ' FROM LOTEXDOCUM,PESSOA,DOCUMENTO, '+
                                '      CONTABANCARIA CC, AGENCIABANCARIA AG, BANCO PB '+#13+ // andre tavares - pendência 23658 - 06/11/2006

                                ' WHERE  (1=2) '+
                              //início - andre tavares - pendência 23658 - 06/11/2006
                                ' AND PB.IDPESSOA(+) = AG.IDBANCO '+#13+
                                ' AND AG.IDPESSOA(+) = CC.IDAGENCIA '+#13+
                                ' AND DOCUMENTO.IDCBANCARIA = CC.IDCBANCARIA(+) '+#13
                               //fim - andre tavares - pendência 23658 - 06/11/2006
                                 );
  end;

  if assigned(CdsLotePagto) then //andre tavares - 04/08/2006
  begin
    FazQuery(CdsLotePagto, 'SELECT NUMLOTE, IDPESSOA, CODPORTFORMA, DATAEMISSAO, IDPROCESSO, ' +
       ' FLGRADLOTEDOC, ' + //DAVID - Pendência 17221
       ' NUMCHQBORDERO, FAVORECIDO, FLAGEMISSAO, FLAGCANCEL, OBSERVACAO, IDUSUARIOINCLUSAO, DATADIFERIDO ' +
       ' FROM LOTEPAGTO WHERE (1=2)' );
  end;
End;


Procedure TCtrlGeraLotePgto.AbreQueries;
Begin

  With _DtmGeraLotePgto Do Begin

    if assigned(SqlModulos.Clientdataset) then //andre tavares - 04/08/2006
    begin
      SqlModulos.Prepare;
      SqlModulos.Open;
    end;

    iSeqDesperdicado := 0;
    bLoteSendoGerado:=False;

    MontaCdsVazia( True );

    bMontaQuery := True;
  End;
End;


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


Procedure TCtrlGeraLotePgto.CalculaSaldos( Var pDocPend  : Integer;
                                           Var pValtotSel : Double );
Var
  icodigo,
  iContreg    : Integer;
  rsaldo,
  fTotalPend  : Double;
  CtrlDocumento: TCtrlDocumento;
Begin

  //INÍCIO andre tavares - 04/08/2006
  CtrlDocumento := TCtrlDocumento.Create;
  CtrlDocumento.InitializeAs( Self );
  CtrlDocumento.OpenTransaction := False;

  CtrlDocumento.IdModulo      := Trunc( IdModulo );
  CtrlDocumento.IdUsuario     := Trunc( IdUsuario );
  CtrlDocumento.UsaPlanoPatro := UsaPlanoPatro;
  CtrlDocumento.IdEspAcesso   := Trunc( IdEspAcesso );
  //fim andre tavares - 04/08/2006

  try
    iContreg := 0;
    fTotalPend := 0;

    CdsDocPendentes.first;
    While Not( CdsDocPendentes.EOF ) Do Begin
      icodigo:=CdsDocPendentes.FieldByname( 'CODDOCUMENTO' ).Asinteger;

      CtrlDocumento.Saldo.CalculaSaldo( icodigo );
      rSaldo := CtrlDocumento.Saldo.Valor;

      //verifica se o documento pendente está selecionado atribuindo ao saldo a diferença do valor
      //do documento e do valor selecionado
      if CdsLoteXDocumento.Locate('CODDOCUMENTO',CdsDocPendentes.FieldByname( 'CODDOCUMENTO' ).Asinteger,[]) then
         rSaldo:=rSaldo-CdsLoteXDocumento.FieldByname( 'VALOR' ).AsFloat;

      //PERMITIR CRIAR VÁRIOS PAGAMENTOS PARCIAIS DO MESMO DOCUMENTO
      //verifica se o documento está contido em outro lote nao emitido e diminui do saldo do mesmo
      With _DtmGeraLotePgto.SqlSaldoLoteNaoEmitido Do
      Begin
        _DtmGeraLotePgto.SqlSaldoLoteNaoEmitido.ClientDataset := CdsSaldoLoteNaoEmitido;
        If CdsSaldoLoteNaoEmitido.Active Then CdsSaldoLoteNaoEmitido.Close;
        If Not Prepared Then Prepare;
        Params[0].AsFloat := CdsDocPendentes.FieldByname( 'CODDOCUMENTO' ).Asinteger;
        Open;
        If Not CdsSaldoLoteNaoEmitido.IsEmpty Then rSaldo := rSaldo - CdsSaldoLoteNaoEmitido.Fields[0].AsFloat;
        CdsSaldoLoteNaoEmitido.Close;
      End;

      //Se houver saldo o documento recebe o valor calcula
      If not IsFloatZero (rSaldo) Then Begin
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

  finally //andre tavares 04/08/2006
    CtrlDocumento.Free;
  end;
End;


Procedure TCtrlGeraLotePgto.AbreCdsSelAdiantPendent;
Begin
  With _DtmGeraLotePgto.SqlSelAdiantPendent Do
  Begin
    clientDataset := CdsSelAdiantPendent; //andre tavares - 04/08/2006
    CdsSelAdiantPendent.Close;
    If Not Prepared Then Prepare;
    Params[0].AsInteger := CdsDocPendentes.FieldByName( 'IDFORCLI' ).AsInteger;
    Open;
  End;
End;


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


Function TCtrlGeraLotePgto.bbtnCriaLoteClick( psbLotePanels2,
                                              pdblkcmbDescricaoLookupValue,
                                              psAuxDataDiferido : String)  : Boolean;
Var
  iNumLancto: Integer;
  sDebCre   : String;
  iNumLote  : Integer;

Begin
  Try

    StartTransacao;

    CdsLotePagto.first;
    CdsLotePagto.Edit;
    CdsLotePagto.FieldByName( 'NUMLOTE' ).Value := iNumSeqLote;

    // Rodolpho da Silva - 27/11/2006
    if CtrlRadPlus.RecuperaVersaoRAD = '+' then
       // Evento gerador 6 - Autorização de pagamento
       IdTipoProcRad := CtrlRadPlus.RecuperaTipoProcesso(6,Trunc(IdEmpresa));


    If ( IdTipoProcRad > 0 ) Then
    Begin
      CdsLoteXDocumento.First;

      // Início - Rodolpho da Silva - 27/11/2006
      if CtrlRadPlus.RecuperaVersaoRAD = '+' then
      begin
         CtrlRadPlus.InicializaPropriedades;
         CtrlRadPlus.TipoProcesso := Trunc(IdTipoProcRad);
         CtrlRadPlus.IdEmpresa    := Trunc(IdEmpresa);
         CtrlRadPlus.IdUsuario    := Trunc(IdUsuario);
         CtrlRadPlus.Obs          := 'Lote Nº: ' + CdsLotePagto.FieldByName( 'NUMLOTE' ).AsString;
      // Fim - Rodolpho da Silva - 27/11/2006
      end
      else
      begin
         Rad.IdEmpresa    := Trunc(IdEmpresa);
         Rad.IdPessoa     := Trunc(IdEmpresa);
         Rad.TipoProcesso := Trunc( IdTipoProcRad );
         Rad.OBS          := 'Lote Nº: ' + CdsLotePagto.FieldByName( 'NUMLOTE' ).AsString;
      end;


      // Varre os documentos contidos no lote
      CdsLoteXDocumento.First;
      While Not CdsLoteXDocumento.Eof Do
      Begin
        // Esta variável RadLote vem do parâmetro do sistema e ela indica como o
        //processo do RAD será tratado: 0 = Valor total do lote; 1 = Valor de cada documento 
        if RadLote = 1 Then
        Begin
           // Início - Rodolpho da Silva - 27/11/2006
           if CtrlRadPlus.RecuperaVersaoRAD = '+' then
           begin
              CtrlRadPlus.VlrProc := CdsLoteXDocumento.FieldByName( 'Valor' ).AsFloat;
              CtrlRadPlus.Obs     := 'Lote nº: ' + CdsLotePagto.FieldByName( 'NUMLOTE' ).AsString + '; Documento nº: ' + CdsLoteXDocumento.FieldByName('NODOCUMENTO').AsString;
              iNumLote            := CtrlRadPlus.IniciarProcesso(true);
           // Fim - Rodolpho da Silva - 27/11/2006
           end
           else
           begin
              rad.Valor := CdsLoteXDocumento.FieldByName( 'Valor' ).AsFloat;
              Rad.OBS   := 'Lote nº: ' + CdsLotePagto.FieldByName( 'NUMLOTE' ).AsString + '; Documento nº: ' + CdsLoteXDocumento.FieldByName('NODOCUMENTO').AsString;
              iNumLote  := Rad.IniciarProcesso;
           end;

           // Atribui o numero do processo no documento
           if iNumLote > 0 then
           begin
             CdsLoteXDocumento.Edit;
             CdsLoteXDocumento.FieldByName('IDPROCESSO').AsInteger   := iNumLote;
             CdsLoteXDocumento.Post;
           end;
        end
        else
        begin
           // Rodolpho da Silva - 27/11/2006
           if CtrlRadPlus.RecuperaVersaoRAD = '+' then
              CtrlRadPlus.VlrProc := CtrlRadPlus.VlrProc + CdsLoteXDocumento.FieldByName( 'Valor' ).AsFloat
           else
              rad.Valor := rad.Valor + CdsLoteXDocumento.FieldByName( 'Valor' ).AsFloat;
        end;


        CdsLoteXDocumento.Next;
      End;    


      // Se o processo RAD for pelo total dos documentos
      if RadLote = 0 then
      Begin
         CdsLotePagto.FieldByName('FLGRADLOTEDOC').AsString := 'L';

         // Rodolpho da Silva - 27/11/2006
         if CtrlRadPlus.RecuperaVersaoRAD = '+' then
            iNumLote := CtrlRadPlus.IniciarProcesso(true)
         else
            iNumLote := Rad.IniciarProcesso;

         if iNumLote > 0 then
            CdsLotePagto.FieldByName( 'IDPROCESSO' ).AsInteger := iNumLote
         else
            CdsLotePagto.FieldByName( 'IDPROCESSO' ).AsInteger := 0;
      end
      else
         CdsLotePagto.FieldByName('FLGRADLOTEDOC').AsString := 'D';

    End;

    CdsLotePagto.FieldByName('DATAEMISSAO' ).AsDateTime := StrToDate( pSbLotePanels2 );
    CdsLotePagto.FieldByName('CODPORTFORMA' ).AsInteger := StrToInt( pdblkcmbDescricaoLookupValue );
    CdsLotePagto.FieldByName('IDPESSOA' ).AsInteger     := Trunc( IdEmpresa );;

    If ( psAuxDataDiferido <> '' ) Then
      CdsLotePagto.FieldByName('DATADIFERIDO' ).AsDateTime := StrToDate( psAuxDataDiferido );

    CdsLotePagto.FieldByName('flagcancel' ).AsString:='';
    CdsLotePagto.Post;

    ApplyCds( CdsLotePagto, DbLotepagto, [], [] );

    CdsLoteXDocumento.first;

    while not(CdsLoteXDocumento.eof) do
    begin
       GetNumLancto(CdsLoteXDocumento.FieldByName( 'CODDOCUMENTO' ).AsInteger,iNumLancto,sDebCre);

       AtualizaTabela( 'UPDATE DOCUMENTO SET CODPORTFORMA = ' +
                       pdblkcmbDescricaoLookupValue + ' WHERE CODDOCUMENTO = ' +
                       CdsLoteXDocumento.FieldByName( 'CODDOCUMENTO' ).AsString );


       CtrlImpostoRetidoLote.RecPag            := RecPag[ 1 ];
       CtrlImpostoRetidoLote.IdEmpresa         := Trunc( IdEmpresa );
       CtrlImpostoRetidoLote.IdUsuario         := Trunc( IdUsuario );
       CtrlImpostoRetidoLote.IdEspAcesso       := Trunc(IdEspAcesso);
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

       try
         CtrlImpostoRetidoLote.Incluir;
       except
         self.messageInfo := CtrlImpostoRetidoLote.MessageInfo;
         Raise Exception.Create(self.messageInfo);
       end;

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
          If AtualizaTabela( 'UPDATE RECBTOPAGTO SET NUMCHQBORDERO = ''' +
            CdsLotePagto.FieldByName( 'NUMLOTE' ).AsString + ''' WHERE CODDOCUMENTO = ' + CdsLoteXDocumento.FieldByName( 'CODDOCUMENTO' ).AsString ) Then Begin
              If FazQuery(DtmBaseDados.Cds,'SELECT CODLANCFINANC FROM RECBTOPAGTO WHERE CODDOCUMENTO = ' +
                           CdsLoteXDocumento.FieldByName( 'CODDOCUMENTO' ).AsString) Then
              Begin
                   If Not AtualizaTabela( 'UPDATE MOVIMFINANC SET NUMCHQBORDERO = ''' +
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

       CdsLoteXdocumento.next;
    end;

    If CdsLoteXDocumento.UpdateStatus in [usModified,usInserted] then
      ApplyCds( CdsLoteXDocumento, DbLotexdocum, [ DbLotepagto.Numlote ], [ DbLotexdocum.Numlote ] );

    CtrlImpostoRetidoLote.NumLote := CdsLoteXDocumento.FieldByName( 'NUMLOTE' ).AsFloat;
    CtrlImpostoRetidoLote.CodPortForma := StrToInt( pdblkcmbDescricaoLookupValue );

    try
      CtrlImpostoRetidoLote.EfetivaNovoDocumento;
    except
      self.messageInfo := self.messageInfo + ' ' + CtrlImpostoRetidoLote.MessageInfo;
      Raise Exception.Create(self.messageInfo);
    end;


    If Not CtrlPadroes.GravaLogOperacoes( IdEmpresa, IdModulo, IdUsuario, 'Criar Lote', False ) Then Begin
      Raise Exception.Create('Não Consegui Gravar o Log');
    End;
    Commit;

    CtrlImpostoRetidoLote.CancelaAcumulaImposto;

    //andre tavares - 04/08/2006
    _DtmGeraLotePgto.SqlLoteXDocumento.ClientDataSet := CdsLoteXDocumento;
    //andre tavares - 04/08/2006
    _DtmGeraLotePgto.SqlLotePagto.ClientDataSet := CdsLotePagto;
    CdsLoteXDocumento.Close;
    CdsLotePagto.Close;
    _DtmGeraLotePgto.SqlLoteXDocumento.Open;
    _DtmGeraLotePgto.SqlLotePagto.Open;

    iSeqDesperdicado := 0;
    MessageInfo := 'Lote ' + FloatToStr( iNumSeqLote ) + ' gerado com sucesso ';
    bMontaQuery := True;

    MontaCdsVazia(False);
    Result := True;
  except
     On E : Exception Do Begin
       Result := False;
       Rollback;
       CtrlImpostoRetidoLote.CancelaAcumulaImposto;
       MessageInfo := 'Erro ao Gerar Lotes' + #13 + #10 + self.messageInfo;

       If CdsLotePagto.ChangeCount > 0 Then CdsLotePagto.CancelUpdates;
       If CdsLoteXDocumento.ChangeCount > 0 Then CdsLoteXDocumento.CancelUpdates;
     End;
  end;
End;


Procedure TCtrlGeraLotePgto.GetNumLancto(piCodDocumento :Integer; Var iNumLancto :Integer; Var sDebCre :String);
Begin
  CdsNumlancto.Close;

  With _DtmGeraLotePgto.SqlNumlancto Do
  Begin
    ClientDataSet := CdsNumlancto; //andre tavares 04/08/2006
    If Not Prepared Then Prepare;
    ParamByName('CODDOCUMENTO').AsInteger := piCodDocumento;
    Open;
  End;

  iNumLancto := CdsNumlancto.FieldByName( 'NUMLANCTO' ).AsInteger;
  sDebCre    := CdsNumlancto.FieldByName( 'DEBCRE' ).AsString;
  CdsNumlancto.Close;
End;


Procedure TCtrlGeraLotePgto.bbtnSelecionaDocClick( CmpDadosParaBaixa : TCmParamReport;
                                                   pModuloCodDocCPMF : Double;
                                                   Var DocPend       : Integer;
                                                   Var ValtotSel     : Double);
Var
  sqlDocPendentes, sqlaux,  rdifplano : String;
  icodigo : integer;
  sSql : TStringList;

Begin
  Try
          // Alterado por Arnaldo V. Scarin em 17/03/2009 - SOL: 110303 - Kintana: 503728
//          //início - andré tavares - pendência 22197 - 09/05/2006
//          '  SDO.VLRLIQUIDO, (0) AS SALDO, '+  #13 +
    sqlDocPendentes :=
          'SELECT DECODE(NVL(DOCUMENTO.FLGCONTAINVEST,0),0,''Velho'',''Novo'') AS TIPO, '+ #13 +
          '       ( SELECT SUM(DECODE(LANC.DEBCRE,''D'',' + #13 +
          '                    DECODE(DOC.RECPAG, ''R'', LANC.VALOR, LANC.VALOR * -1),' + #13 +
          '                    DECODE(DOC.RECPAG, ''R'', LANC.VALOR * -1, LANC.VALOR) ) )' + #13 +
          '         FROM LANCTODOCUM LANC, DOCUMENTO DOC' + #13 +
          '         WHERE DOC.CODDOCUMENTO = LANC.CODDOCUMENTO' + #13 +
          '           and DOC.CODDOCUMENTO = DOCUMENTO.CODDOCUMENTO' + #13 +
          '         GROUP BY DOC.CODDOCUMENTO) AS VLRLIQUIDO,' + #13 +
          '       (0) AS SALDO, '+  #13 +
          '       DOCUMENTO.IDFORCLI,'+#13+
          '       DOCUMENTO.OPERACAO,'+#13+
          '       DOCUMENTO.CODDOCUMENTO,'+#13+
          '       DOCUMENTO.IDPESSOA,'+#13+
          '       DOCUMENTO.NODOCUMENTO,' + #13 +
          '       DOCUMENTO.COMPLDOCUMENTO,'+#13+
          '       DOCUMENTO.DATAPROGRAMADA,'+#13+
          '       DOCUMENTO.DATAVENCTO,'+#13+
          '       DOCUMENTO.RECPAG,'+#13+
          '       PESSOA.RAZAOSOCIAL,'+#13+
          '       PESSOA.NOME AS FORNECEDOR,'+#13+
          '       PESSOA.RAZAOSOCIAL AS NOME,'+#13+
          '       DOCUMENTO.STATUS,'+#13+
          '       DOCUMENTO.NUMLEITCODBARRAS,'+#13+
          '       DOCUMENTO.NUMDIGCODBARRAS, '+#13+
          '       ''                                                                                                                                                                                                        '' AS PLANOPREV, '+#13+
          '       ''N'' AS FLGPPDIFERENTE, '+#13+
          '       PB.NUMBANCO AS BANCO,'+#13+
          '       AG.NUMAGENCIA,'+#13+
          '       CC.CONTACORRENTE '+#13+ // andre tavares - pendência 23658 - 06/11/2006
          'FROM DOCUMENTO,'+#13+
          '     LANCTODOCUM,'+#13+
          '     PESSOA, '+#13+
          //início - andre tavares - pendência 23658 - 06/11/2006
          '     CONTABANCARIA CC,'+#13+
          '     AGENCIABANCARIA AG,'+#13+
          '     BANCO PB '+#13;

          //Marcus Oliveira p.23738 24/08/2007
          if CmpDadosParaBaixa.ParamValues[19].AsBoolean then
            sqlDocPendentes := sqlDocPendentes + '    ,RADINSTPROCESSO ';

          if CmpDadosParaBaixa.ParamValues[12].AsBoolean then
          begin
            sqlDocPendentes := sqlDocPendentes + '    ,( SELECT PC.IDBANCO'+#13+
                                                 '       FROM PORTADORFORMA PF,'+#13+
                                                 '            PORTADORCONTA PC '+#13+
                                                 '       WHERE PF.CODPORTADOR = PC.CODPORTADOR'+#13+
                                                 '         AND PF.CODPORTFORMA = '+ CmpDadosParaBaixa.ParamValues[0].asString +') PC '+#13;
          end;
          //fim - andre tavares - pendência 23658 - 06/11/2006

          // Alterado por Arnaldo V. Scarin em 17/03/2009 - SOL: 110303 - Kintana: 503728
//          //início - andré tavares - pendência 22197 - 09/05/2006 - é assim que se busca o valor líquido de um documento.
//          sqlDocPendentes := sqlDocPendentes +
//          ' , (SELECT '+#13+
//          '     SUM(DECODE(LANC.DEBCRE,''D'',DECODE(DOC.RECPAG,''R'',LANC.VALOR,LANC.VALOR * -1),DECODE(DOC.RECPAG,''R'',LANC.VALOR * -1,LANC.VALOR))) AS VLRLIQUIDO, '+#13+
//          '     DOC.CODDOCUMENTO '+#13+
//          '   FROM LANCTODOCUM LANC, DOCUMENTO DOC '+#13+
//          '   WHERE DOC.CODDOCUMENTO = LANC.CODDOCUMENTO '+#13+
//          '   GROUP BY DOC.CODDOCUMENTO) SDO '+#13+
//          //fim - andré tavares - pendência 22197 - 09/05/2006
          sqlDocPendentes := sqlDocPendentes +
          'WHERE (DOCUMENTO.IDFORCLI=PESSOA.IDPESSOA)'+#13+
          '  AND (NVL(EMISBLOQ,''N'') <> ''S'')'+#13;

           If EmiteLancaBaixa Then
             sqlDocPendentes := sqlDocPendentes +
               '  AND ( ( NVL(DOCUMENTO.STATUS,''0'') In (''0'',''1'') AND DOCUMENTO.OPERACAO in (''2'',''3'',''14'')  ) OR ' +#13+
               '        ( DOCUMENTO.STATUS = ''2'' AND DOCUMENTO.OPERACAO = ''10'' ) )' +#13+
               '  AND (DOCUMENTO.FLGEMITELANCBAIX IS NULL)' +#13+
               '  AND DOCUMENTO.CODTIPDOC in ( SELECT CODTIPDOC'+#13+
               '                               FROM TIPODOCRECPAG a'+#13+
               '                               WHERE a.RECPAG = '+QuotedStr(recpag)+#13+
               '                                 AND NOT EXISTS ( SELECT 1 FROM USUARIOXTPDOCTO B'+#13+
               '                                                  WHERE RECPAG='+QuotedStr(recpag)+#13+
               '                                                    and b.idusuario=' + FloatToStr( IdUsuario)+' )'+#13+
               '                               union'+#13+
               '                               SELECT CODTIPDOC'+#13+
               '                               FROM TIPODOCRECPAG a'+#13+
               '                               WHERE a.RECPAG = '+QuotedStr(RecPag)+#13+
               '                                 and exists ( select 1 from UsuarioxTpdocto b'+#13+
               '                                              where recpag='+QuotedStr(recpag)+#13+
               '                                                and a.codtipdoc=b.codtipdoc'+#13+
               '                                                and b.idusuario=' + FloatToStr( idusuario)+' ) )'+#13
           Else
             sqlDocPendentes := sqlDocPendentes +
               '  AND ( NVL(DOCUMENTO.STATUS,''0'') In (''0'',''1'') AND DOCUMENTO.OPERACAO in (''2'',''3'',''14'')  )'+#13+
               '  AND DOCUMENTO.CODTIPDOC IN ( SELECT CODTIPDOC'+#13+
               '                               FROM TIPODOCRECPAG a'+#13+
               '                               WHERE a.RECPAG = '+QuotedStr(RecPag)+#13+
               '                                 and not exists ( select 1 from UsuarioxTpdocto b'+#13+
               '                                                  where recpag='+QuotedStr(recpag)+#13+
               '                                                    and b.idusuario='+FloatToStr(IdUsuario)+' )'+#13+
               '                               union'+#13+
               '                               SELECT CODTIPDOC'+#13+
               '                               FROM TIPODOCRECPAG a'+#13+
               '                               WHERE a.RECPAG = '+QuotedStr(RecPag)+#13+
               '                                 and exists ( select 1 from UsuarioxTpdocto b'+#13+
               '                                              where recpag='+QuotedStr(recpag)+#13+
               '                                                and a.codtipdoc=b.codtipdoc'+#13+
               '                                                and b.idusuario='+FloatToStr( idusuario )+' ) )'+#13;

    If ( CmpDadosParaBaixa.ParamValues[ 1 ].AsString <> '' ) Then
      sqlDocPendentes:= sqlDocPendentes + '  AND (DOCUMENTO.IDFORCLI = ' + CmpDadosParaBaixa.ParamValues[ 1 ].AsString + ')'+#13;

    If Not CmpDadosParaBaixa.ParamValues[ 7 ].IsNull Then
      sqlDocPendentes:= sqlDocPendentes + '  AND (DOCUMENTO.DATAPROGRAMADA >= TO_DATE('''+ CmpDadosParaBaixa.ParamValues[ 7 ].AsString +''',''DD/MM/YYYY''))'+#13;

    If Not CmpDadosParaBaixa.ParamValues[ 8 ].IsNull Then
      sqlDocPendentes:= sqlDocPendentes + '  AND (DOCUMENTO.DATAPROGRAMADA <= TO_DATE('''+ CmpDadosParaBaixa.ParamValues[ 8 ].AsString +''',''DD/MM/YYYY''))'+#13;

    If Not CmpDadosParaBaixa.ParamValues[ 2 ].IsNull Then
      sqlDocPendentes:= sqlDocPendentes + '  AND (DOCUMENTO.NODOCUMENTO = ' + Trim( CmpDadosParaBaixa.ParamValues[ 2 ].AsString ) + ')'+#13;

    If Not CmpDadosParaBaixa.ParamValues[ 6 ].IsNull Then
      sqlDocPendentes:= sqlDocPendentes + '  AND (DOCUMENTO.IDMODULO = ' + CmpDadosParaBaixa.ParamValues[ 6 ].AsString + ')'+#13;

    If Not CmpDadosParaBaixa.ParamValues[ 3 ].IsNull Then
       sqlDocPendentes:= sqlDocPendentes + '  AND (RTRIM(DOCUMENTO.COMPLDOCUMENTO) = ''' + CmpDadosParaBaixa.ParamValues[ 3 ].AsString + ''')'+#13;


    If Not CmpDadosParaBaixa.ParamValues[ 13 ].AsBoolean Then
       sqlDocPendentes:= sqlDocPendentes + '  AND (DOCUMENTO.CODTIPDOC <> ' + FloatToStr( pModuloCodDocCPMF ) + ')'+#13;

    If Not CmpDadosParaBaixa.ParamValues[ 5 ].IsNull Then
       sqlDocPendentes:= sqlDocPendentes + '  AND (DOCUMENTO.CODTIPDOC = ' + CmpDadosParaBaixa.ParamValues[ 5 ].AsString + ')'+#13;

    If ( CmpDadosParaBaixa.ParamValues[ 11 ].AsBoolean ) And
       (Not CdsDescPortadorForma.FieldByname( 'CODFORMA' ).IsNull ) And
       ( Not CmpDadosParaBaixa.ParamValues[ 0 ].IsNull ) and
       ( CmpDadosParaBaixa.ParamValues[ 4 ].IsNull ) Then
      sqlDocPendentes:= sqlDocPendentes + '  AND (DOCUMENTO.CODFORMA = ' + CdsDescPortadorForma.FieldByname( 'CODFORMA' ).AsString + ')'+#13
    Else
      If ( Not CmpDadosParaBaixa.ParamValues[ 4 ].IsNull ) Then
        sqlDocPendentes := sqlDocPendentes + '  AND (DOCUMENTO.CODFORMA = ' + CmpDadosParaBaixa.ParamValues[ 4 ].AsString + ')'+#13;

    If ( CmpDadosParaBaixa.ParamValues[ 10 ].AsBoolean )  Then
       sqlDocPendentes:= sqlDocPendentes + '  AND (DOCUMENTO.CODPORTFORMA = ' + CmpDadosParaBaixa.ParamValues[0].AsString + ')'+#13;

    If ( trim (CmpDadosParaBaixa.ParamValues[ 14 ].AsString) <> '' )  Then
        sqlDocPendentes:= sqlDocPendentes + '  AND DOCUMENTO.CODDOCUMENTO IN ( SELECT DISTINCT CODDOCUMENTO'+#13+
                                            '                                  FROM RATEIODOCUM'+#13+
                                            '                                  WHERE IDPLANOPREV IN ('+ trim (CmpDadosParaBaixa.ParamValues[ 14 ].AsString) +' ) )'+#13;

    If ( trim (CmpDadosParaBaixa.ParamValues[ 15 ].AsString) <> '' )  Then
        sqlDocPendentes:= sqlDocPendentes +
          '  AND (DOCUMENTO.DATAEMISSAO = TO_DATE('''+ CmpDadosParaBaixa.ParamValues[ 15 ].AsString +''',''DD/MM/YYYY''))'+#13;

    sqlDocPendentes := sqlDocPendentes +
      '  AND (DOCUMENTO.RECPAG='''+ RecPag +''')'+#13+
      '  AND (DOCUMENTO.IDPESSOA='+ FloatToStr( idEmpresa)+ ')' +#13+
      '  AND (DOCUMENTO.OPERACAO = LANCTODOCUM.OPERACAO)' +#13+
      '  AND (DOCUMENTO.CODDOCUMENTO = LANCTODOCUM.CODDOCUMENTO)' +#13+
//          //início - andré tavares - pendência 22197 - 09/05/2006
//           ' (SDO.CODDOCUMENTO = DOCUMENTO.CODDOCUMENTO) AND '+#13+
//          //fim - andré tavares - pendência 22197 - 09/05/2006
      '  AND (LANCTODOCUM.ESTORNO IS NULL)' +#13+
      //início - andre tavares - pendência 23658 - 06/11/2006
      '  AND PB.IDPESSOA(+) = AG.IDBANCO '+#13+
      '  AND AG.IDPESSOA(+) = CC.IDAGENCIA '+#13+
      '  AND DOCUMENTO.IDCBANCARIA = CC.IDCBANCARIA(+) '+#13;
    //Marcus Oliveira p.23738 24/08/2007
    if CmpDadosParaBaixa.ParamValues[19].AsBoolean then
      sqlDocPendentes := sqlDocPendentes + '  AND (DOCUMENTO.IDPROCESSO = RADINSTPROCESSO.IDPROCESSO)' +#13+
                                           '  AND (RADINSTPROCESSO.FLGOK = ''S'' )  '+#13;


    if CmpDadosParaBaixa.ParamValues[12].AsBoolean then
    begin
      sqlDocPendentes := sqlDocPendentes + '   AND AG.IDBANCO = PC.IDBANCO '+#13;
    end;

    //fim - andre tavares - pendência 23658 - 06/11/2006

    sqlDocPendentes := sqlDocPendentes + 'ORDER BY PESSOA.RAZAOSOCIAL,'+#13+
                                         '         DOCUMENTO.DATAPROGRAMADA,'+#13+
                                         '         DOCUMENTO.NoDOCUMENTO';

    FazQuery(CdsDocPendentes,sqlDocPendentes);

    CdsLoteXDocumento.First;
    While Not CdsLoteXDocumento.Eof Do
    Begin
      If CdsDocPendentes.Locate('CODDOCUMENTO',CdsLoteXDocumento.FieldByname( 'CODDOCUMENTO' ).AsFloat,[]) Then
        CdsDocPendentes.Delete;

      CdsLoteXDocumento.Next;
    End;
    CdsLoteXDocumento.First;

    CdsDocPendentes.DisableControls;
    CdsDocPendentes.First;
    while not CdsDocPendentes.Eof do
    begin
      with TClientDataset.Create(nil) do
      begin
        data := GetDataPacket(' SELECT DISTINCT PC.NOME '+#13+
                              ' FROM PLANPREV PP, PLANPREVCONTABIL PC, RATEIODOCUM R '+#13+
                              ' WHERE PP.IDPLANOPREV = PC.IDPLANOPREVPREV AND '+#13+
                              '       PC.IDPLANOPREV = R.IDPLANOPREV AND '+#13+
                              '       R.CODDOCUMENTO =  '+ CdsDocPendentes.FieldByname( 'CODDOCUMENTO' ).asString +#13+
                              ' UNION '+#13+
                              ' SELECT DISTINCT PC.NOME '+#13+
                              ' FROM PLANPREVCONTABIL PC, RATEIODOCUM R '+#13+
                              ' WHERE IDPLANOPREVPREV IS NULL AND '+#13+
                              '       PC.IDPLANOPREV = R.IDPLANOPREV AND '+#13+
                              '       R.CODDOCUMENTO =  '+ CdsDocPendentes.FieldByname( 'CODDOCUMENTO' ).asString );

        first;
        CdsDocPendentes.Edit;
        CdsDocPendentes.fieldByName('PLANOPREV').asString := '';
        while not eof do
        begin
          CdsDocPendentes.Edit;
          if (recno > 1) then
            CdsDocPendentes.fieldByName('PLANOPREV').asString := CdsDocPendentes.fieldByName('PLANOPREV').asString + '; '+ fieldByName('NOME').asString
          else
            CdsDocPendentes.fieldByName('PLANOPREV').asString := CdsDocPendentes.fieldByName('PLANOPREV').asString + fieldByName('NOME').asString;
          CdsDocPendentes.Post;
          next;
        end;
      end;

      CdsDocPendentes.Next;
    end;
    CdsDocPendentes.EnableControls;


    CalculaSaldos( DocPend, ValtotSel );
  Except
    On  E : Exception Do MessageInfo := E.Message;
  End;
End;


Function TCtrlGeraLotePgto.GeraSql( pParametro : String ) : String;
Begin
  With _DtmGeraLotePgto Do Begin
    If ( UpperCase( pParametro ) = 'DBLKCMBDESCRICAO' ) Then Begin

      Result := ' SELECT B.RAZAOSOCIAL, PF.DESCRICAO, PF.CODPORTFORMA, PF.IDTEMPLCHEQUE, PF.CODFORMA, PF.FLGCHEQUEDIFERIDO, PF.FLGOBRIGAFAV ' +
                ' FROM PORTADORFORMA PF, PORTADORCONTA PC, PESSOA B  '+#13+
                ' WHERE PF.IDPESSOA = '+#13+ FloatToStr(idEmpresa)+
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


Function TCtrlGeraLotePgto.AtualizaTabela( pSql : String ) : Boolean;
Begin
  If ( ConnectionSide = cnsClient ) Then Begin

    Result := Connection.AppServer.AtualizaTabela( pSql );

    If Not Result Then MessageInfo := Connection.AppServer.MessageInfo;

  End Else Begin

    Try
      ExecSql( pSql );
      Result := True;
    Except
      On E : Exception Do Begin
        MessageInfo := E.Message;
        Result := False;
      End;
    End;
  End;
End;

function TCtrlGeraLotePgto.ListaPlano: OleVariant;
begin
   Result := GetDataPacket('SELECT ' +
                           '  IDPLANOPREV, ' +
                           '  NOME, ' +
                           '  ''N'' AS MARCA ' +
                           'FROM ' +
                           '  PLANPREVCONTABIL ' +
                           'ORDER BY ' +
                           '  NOME ');
end;


End.



