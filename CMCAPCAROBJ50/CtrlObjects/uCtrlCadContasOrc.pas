{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Analista Responsável: Davi Ramos                      }
{ Atualizado Em: Julho/2002                             }
{                                                       }
{*******************************************************}
Unit uCtrlCadContasOrc;

Interface

Uses
  DB, uDataBase, stdctrls, uCmControlObject, dbclient, sysutils, wwQuery, provider,
  uMidasUtil, udtmCadContasOrcamen, wwdbedit, uString, Mask, ComCtrls,
  uDbContasOrcamen, uDbSaldoOrcado, uDbCompContasOrcamen, uDbDataView, uCMTypes, classes;

Type
  TCtrlCadContasOrc = Class( TCmControlObject )

  Protected

    Procedure DoChangeDataBase; Override;
    Procedure OnCreateAppServer; Override;

  Private
    _dbContasOrcamen     : TdbContasOrcamen;
    _dbSaldoOrcado       : TdbSaldoOrcado;
    _dbCompContasOrcamen : TdbCompContasOrcamen;

    _dbDet               : TdbCompContasOrcamen;
    _dbDetCond           : TdbCompContasOrcamen;
    _dbDetContaOrc       : TdbCompContasOrcamen;
    _dbDetContaRea       : TdbCompContasOrcamen;
    _dbDetFluxo          : TdbCompContasOrcamen;
    _DbDataView          : TdbDataView;

    FidEmpresa     : Integer;
    FiPlanoOrc     : LongInt;
    FiPos          : LongInt;
    FiAbrePar      : LongInt;
    FiFechaPar     : LongInt;
    FiConsulta     : LongInt;
    FbInicioConta  : Boolean;
    FsCodContaOrc  : String;
    FsConta        : String;
    FMensagem      : TEdit;
    FConfirmado    : Boolean;
    FsMascaraGrupo : String;
    FpgbStatus     : TProgressBar;

    //Somente usado no controle
    FCdsAuxContab       : TClientDataSet;

    FCds                : TClientDataSet;
    FCdsAux             : TClientDataSet;
    FCdsCCusto          : TClientDataSet;
    FCdsCCustoConta     : TClientDataSet;
    FCdsCCustoFluxo     : TClientDataSet;
    FCdsCenRespConta    : TClientDataSet;
    FCdsCentroRespon    : TClientDataSet;
    FCdsContaCondFim    : TClientDataSet;
    FCdsContaCondIni    : TClientDataSet;
    FCdsContaCondRes    : TClientDataSet;
    FCdsContaContab     : TClientDataSet;
    FCdsContaContabil   : TClientDataSet;
    FCdsContasOrc       : TClientDataSet;
    FCdsContasRef       : TClientDataSet;
    FCdsDataView        : TClientDataSet;
    FCdsDet             : TClientDataSet;
    FCdsDetCond         : TClientDataSet;
    FCdsDetContaOrc     : TClientDataSet;
    FCdsDetContaRea     : TClientDataSet;
    FCdsDetFluxo        : TClientDataSet;
    FCdsGrupo           : TClientDataSet;
    FCdsGrupoAux        : TClientDataSet;
    FCdsMovOrcamento    : TClientDataSet;
    FCdsPatro           : TClientDataSet;
    FCdsPatroConta      : TClientDataSet;
    FCdsPlanoContabil   : TClientDataSet;
    FCdsPlanoPrev       : TClientDataSet;
    FCdsPlanoPrevConta  : TClientDataSet;
    FCdsTestaComposicao : TClientDataSet;
    FCdsTipoRD          : TClientDataSet;
    FCdsTodoDet         : TClientDataSet;
    FCdsUnidNegoc       : TClientDataSet;
    FCdsUnidNegocConta  : TClientDataSet;

    Function  PegaUltimoCaracter( edt           : TwwDBEdit;
                                  Var pMensagem : String ) : char;

    Procedure CdsCalcFields(DataSet: TDataSet);
    Procedure CdsDetCondCalcFields(DataSet: TDataSet);

    Procedure SetCdsAuxContab       ( Const Value: TClientDataSet );

    Procedure SetCds                ( Const Value: TClientDataSet );
    Procedure SetCdsAux             ( Const Value: TClientDataSet );
    Procedure SetCdsCCusto          ( Const Value: TClientDataSet );
    Procedure SetCdsCCustoConta     ( Const Value: TClientDataSet );
    Procedure SetCdsCCustoFluxo     ( Const Value: TClientDataSet );
    Procedure SetCdsCenRespConta    ( Const Value: TClientDataSet );
    Procedure SetCdsCentroRespon    ( Const Value: TClientDataSet );
    Procedure SetCdsContaCondFim    ( Const Value: TClientDataSet );
    Procedure SetCdsContaCondIni    ( Const Value: TClientDataSet );
    Procedure SetCdsContaCondRes    ( Const Value: TClientDataSet );
    Procedure SetCdsContaContab     ( Const Value: TClientDataSet );
    Procedure SetCdsContaContabil   ( Const Value: TClientDataSet );
    Procedure SetCdsContasOrc       ( Const Value: TClientDataSet );
    Procedure SetCdsContasRef       ( Const Value: TClientDataSet );
    Procedure SetCdsDataView        ( Const Value: TClientDataSet );
    Procedure SetCdsDet             ( Const Value: TClientDataSet );
    Procedure SetCdsDetCond         ( Const Value: TClientDataSet );
    Procedure SetCdsDetContaOrc     ( Const Value: TClientDataSet );
    Procedure SetCdsDetContaRea     ( Const Value: TClientDataSet );
    Procedure SetCdsDetFluxo        ( Const Value: TClientDataSet );
    Procedure SetCdsGrupo           ( Const Value: TClientDataSet );
    Procedure SetCdsGrupoAux        ( Const Value: TClientDataSet );
    Procedure SetCdsMovOrcamento    ( Const Value: TClientDataSet );
    Procedure SetCdsPatro           ( Const Value: TClientDataSet );
    Procedure SetCdsPatroConta      ( Const Value: TClientDataSet );
    Procedure SetCdsPlanoContabil   ( Const Value: TClientDataSet );
    Procedure SetCdsPlanoPrev       ( Const Value: TClientDataSet );
    Procedure SetCdsPlanoPrevConta  ( Const Value: TClientDataSet );
    Procedure SetCdsTestaComposicao ( Const Value: TClientDataSet );
    Procedure SetCdsTipoRD          ( Const Value: TClientDataSet );
    Procedure SetCdsTodoDet         ( Const Value: TClientDataSet );
    Procedure SetCdsUnidNegoc       ( Const Value: TClientDataSet );
    Procedure SetCdsUnidNegocConta  ( Const Value: TClientDataSet );
    procedure pgbStatusAtualiza(pPos: Integer);

  Public
    dtmCadContasOrcamen : TdtmCadContasOrcamen;

    Constructor Create; Override;
    Destructor  Destroy;Override;

    Function AplicaOperacaoCadContasOrcDelete : Boolean;
    Function AplicaOperacaoCadContasOrcGravar : Boolean;

    Function Procurar( idContasOrcamen : String ) : OleVariant;
    Function VerificaFormula( edt           : TwwDBEdit;
                              Var pMensagem : String ) : Boolean;
    Function  TestaCaracteres( edt           : TwwDBEdit;
                               sCaracter     : Char;
                               iPos          :Integer;
                               Var pMensagem : String ) : Boolean;
    Function VerificaLinhaGrid(Cds: TClientDataSet; iTagChave,
      iTagVazio: Integer; sTabelaMensagem: String;
      bPermiteChaveVazia: Boolean): Boolean;

    Procedure FazerQryPrincipal;
    Procedure SelecionaFilhos;
    Procedure ProcessaConfirma;
    Procedure AbreQueries;
    Procedure CadastroDelete;
    Procedure AbreQryMovOrcamento;
    Procedure ValoresDefault;
    Procedure CadastroConfirma( pdbeCodigoContaOrc : String;
                                pmemSQLLines       : String );
    Procedure ProcessaDetalheConfirma1( psePosIni1   : Real;
                                        psePosFim1   : Real;
                                        pedConteudo1 : String;
                                        prPerc       : Real );
    Procedure ProcessaDetalheConfirma2( psePosIni2   : Real;
                                        psePosFim2   : Real;
                                        pedConteudo2 : String;
                                        prPerc       : Real );
    Procedure AbreqryAuxContab;
    Procedure btnImportaContabClick( Var pdbeNomeContaOrc,
                                         pdbeCodigoContaOrc,
                                         sConta              : String );
    procedure ProcessabtnTransfClick1;
    procedure ProcessabtnTransfClick2;

    Property Mensagem      : TEdit        Read FMensagem      Write FMensagem;
    Property idEmpresa     : Integer      Read FidEmpresa     Write FidEmpresa;

    Property Confirmado    : Boolean      Read FConfirmado    Write FConfirmado;
    Property iPlanoOrc     : LongInt      Read FiPlanoOrc     Write FiPlanoOrc;
    Property iPos          : LongInt      Read FiPos          Write FiPos;
    Property iAbrePar      : LongInt      Read FiAbrePar      Write FiAbrePar;
    Property iFechaPar     : LongInt      Read FiFechaPar     Write FiFechaPar;
    Property iConsulta     : LongInt      Read FiConsulta     Write FiConsulta;
    Property bInicioConta  : Boolean      Read FbInicioConta  Write FbInicioConta;
    Property sCodContaOrc  : String       Read FsCodContaOrc  Write FsCodContaOrc;
    Property sConta        : String       Read FsConta        Write FsConta;
    Property sMascaraGrupo : String       Read FsMascaraGrupo Write FsMascaraGrupo;
    Property pgbStatus     : TProgressBar Read FpgbStatus     Write FpgbStatus;

    // Somenteusado no controle
    Property CdsAuxContab       : TClientDataSet Read FCdsAuxContab       Write SetCdsAuxContab;

    Property Cds                : TClientDataSet Read FCds                Write SetCds;
    Property CdsAux             : TClientDataSet Read FCdsAux             Write SetCdsAux;
    Property CdsCCusto          : TClientDataSet Read FCdsCCusto          Write SetCdsCCusto;
    Property CdsCCustoConta     : TClientDataSet Read FCdsCCustoConta     Write SetCdsCCustoConta;
    Property CdsCCustoFluxo     : TClientDataSet Read FCdsCCustoFluxo     Write SetCdsCCustoFluxo;
    Property CdsCenRespConta    : TClientDataSet Read FCdsCenRespConta    Write SetCdsCenRespConta;
    Property CdsCentroRespon    : TClientDataSet Read FCdsCentroRespon    Write SetCdsCentroRespon;
    Property CdsContaCondFim    : TClientDataSet Read FCdsContaCondFim    Write SetCdsContaCondFim;
    Property CdsContaCondIni    : TClientDataSet Read FCdsContaCondIni    Write SetCdsContaCondIni;
    Property CdsContaCondRes    : TClientDataSet Read FCdsContaCondRes    Write SetCdsContaCondRes;
    Property CdsContaContab     : TClientDataSet Read FCdsContaContab     Write SetCdsContaContab;
    Property CdsContaContabil   : TClientDataSet Read FCdsContaContabil   Write SetCdsContaContabil;
    Property CdsContasOrc       : TClientDataSet Read FCdsContasOrc       Write SetCdsContasOrc;
    Property CdsContasRef       : TClientDataSet Read FCdsContasRef       Write SetCdsContasRef;
    Property CdsDataView        : TClientDataSet Read FCdsDataView        Write SetCdsDataView;
    Property CdsDet             : TClientDataSet Read FCdsDet             Write SetCdsDet;
    Property CdsDetCond         : TClientDataSet Read FCdsDetCond         Write SetCdsDetCond;
    Property CdsDetContaOrc     : TClientDataSet Read FCdsDetContaOrc     Write SetCdsDetContaOrc;
    Property CdsDetContaRea     : TClientDataSet Read FCdsDetContaRea     Write SetCdsDetContaRea;
    Property CdsDetFluxo        : TClientDataSet Read FCdsDetFluxo        Write SetCdsDetFluxo;
    Property CdsGrupo           : TClientDataSet Read FCdsGrupo           Write SetCdsGrupo;
    Property CdsGrupoAux        : TClientDataSet Read FCdsGrupoAux        Write SetCdsGrupoAux;
    Property CdsMovOrcamento    : TClientDataSet Read FCdsMovOrcamento    Write SetCdsMovOrcamento;
    Property CdsPatro           : TClientDataSet Read FCdsPatro           Write SetCdsPatro;
    Property CdsPatroConta      : TClientDataSet Read FCdsPatroConta      Write SetCdsPatroConta;
    Property CdsPlanoContabil   : TClientDataSet Read FCdsPlanoContabil   Write SetCdsPlanoContabil;
    Property CdsPlanoPrev       : TClientDataSet Read FCdsPlanoPrev       Write SetCdsPlanoPrev;
    Property CdsPlanoPrevConta  : TClientDataSet Read FCdsPlanoPrevConta  Write SetCdsPlanoPrevConta;
    Property CdsTestaComposicao : TClientDataSet Read FCdsTestaComposicao Write SetCdsTestaComposicao;
    Property CdsTipoRD          : TClientDataSet Read FCdsTipoRD          Write SetCdsTipoRD;
    Property CdsTodoDet         : TClientDataSet Read FCdsTodoDet         Write SetCdsTodoDet;
    Property CdsUnidNegoc       : TClientDataSet Read FCdsUnidNegoc       Write SetCdsUnidNegoc;
    Property CdsUnidNegocConta  : TClientDataSet Read FCdsUnidNegocConta  Write SetCdsUnidNegocConta;
  End;

Implementation
//************************************************
Procedure TCtrlCadContasOrc.OnCreateAppServer;
Begin
  Inherited;

  Cds                := TClientDataSet.Create( Nil );
  CdsAux             := TClientDataSet.Create( Nil );
  CdsCCusto          := TClientDataSet.Create( Nil );
  CdsCCustoConta     := TClientDataSet.Create( Nil );
  CdsCCustoFluxo     := TClientDataSet.Create( Nil );
  CdsCenRespConta    := TClientDataSet.Create( Nil );
  CdsCentroRespon    := TClientDataSet.Create( Nil );
  CdsContaCondFim    := TClientDataSet.Create( Nil );
  CdsContaCondIni    := TClientDataSet.Create( Nil );
  CdsContaCondRes    := TClientDataSet.Create( Nil );
  CdsContaContab     := TClientDataSet.Create( Nil );
  CdsContaContabil   := TClientDataSet.Create( Nil );
  CdsContasOrc       := TClientDataSet.Create( Nil );
  CdsContasRef       := TClientDataSet.Create( Nil );
  CdsDataView        := TClientDataSet.Create( Nil );
  CdsDet             := TClientDataSet.Create( Nil );
  CdsDetCond         := TClientDataSet.Create( Nil );
  CdsDetContaOrc     := TClientDataSet.Create( Nil );
  CdsDetContaRea     := TClientDataSet.Create( Nil );
  CdsDetFluxo        := TClientDataSet.Create( Nil );
  CdsGrupo           := TClientDataSet.Create( Nil );
  CdsGrupoAux        := TClientDataSet.Create( Nil );
  CdsMovOrcamento    := TClientDataSet.Create( Nil );
  CdsPatro           := TClientDataSet.Create( Nil );
  CdsPatroConta      := TClientDataSet.Create( Nil );
  CdsPlanoContabil   := TClientDataSet.Create( Nil );
  CdsPlanoPrev       := TClientDataSet.Create( Nil );
  CdsPlanoPrevConta  := TClientDataSet.Create( Nil );
  CdsTestaComposicao := TClientDataSet.Create( Nil );
  CdsTipoRD          := TClientDataSet.Create( Nil );
  CdsTodoDet         := TClientDataSet.Create( Nil );
  CdsUnidNegoc       := TClientDataSet.Create( Nil );
  CdsUnidNegocConta  := TClientDataSet.Create( Nil );

  pgbStatus          := TProgressBar.Create( Nil );
End;
//************************************************
Procedure TCtrlCadContasOrc.DoChangeDataBase;
Begin
  Inherited;

  _dbContasOrcamen.DatabaseName     := DataBaseName;
  _dbSaldoOrcado.DatabaseName       := DataBaseName;
  _dbCompContasOrcamen.DatabaseName := DataBaseName;
  _dbDet.DatabaseName               := DataBaseName;
  _dbDetCond.DatabaseName           := DataBaseName;
  _dbDetContaOrc.DatabaseName       := DataBaseName;
  _dbDetContaRea.DatabaseName       := DataBaseName;
  _dbDetFluxo.DatabaseName          := DataBaseName;
  _DbDataView.DatabaseName          := DataBaseName;

End;
//************************************************
Constructor TCtrlCadContasOrc.Create;
Begin
  Inherited;

  dtmCadContasOrcamen := TdtmCadContasOrcamen.Create( Nil );

  _dbContasOrcamen     := TDbContasOrcamen.Create( Self );
  _dbSaldoOrcado       := TdbSaldoOrcado.Create( Self );
  _dbCompContasOrcamen := TdbCompContasOrcamen.Create( Self );
  _dbDet               := TdbCompContasOrcamen.Create( Self );
  _dbDetCond           := TdbCompContasOrcamen.Create( Self );
  _dbDetContaOrc       := TdbCompContasOrcamen.Create( Self );
  _dbDetContaRea       := TdbCompContasOrcamen.Create( Self );
  _dbDetFluxo          := TdbCompContasOrcamen.Create( Self );
  _DbDataView          := TdbDataView.Create( Self );

  // Cds somente usados no controle
  FCdsAuxContab := TClientDataSet.Create( Nil );

End;
//************************************************
Destructor TCtrlCadContasOrc.Destroy;
Begin
  Inherited;

  _DbContasOrcamen.Free;
  _dbSaldoOrcado.Free;
  _dbCompContasOrcamen.Free;
  _dbDet.Free;
  _dbDetCond.Free;
  _dbDetContaOrc.Free;
  _dbDetContaRea.Free;
  _dbDetFluxo.Free;
  _DbDataView.Free;
    
  FreeCds( [ FCdsAuxContab ] );

  If ( isAppServer ) Then Begin

    FreeCds( [ FCds,                FCdsAux,           FCdsCCusto,       FCdsCCustoConta,
               FCdsCCustoFluxo,     FCdsCenRespConta,  FCdsCentroRespon, FCdsContaCondFim,
               FCdsContaCondIni,    FCdsContaCondRes,  FCdsContaContab,  FCdsContaContabil,
               FCdsContasOrc,       FCdsContasRef,     FCdsDataView,     FCdsDet,
               FCdsDetCond,         FCdsDetContaOrc,   FCdsDetContaRea,  FCdsDetFluxo,
               FCdsGrupo,           FCdsGrupoAux,      FCdsMovOrcamento, FCdsPatro,
               FCdsPatroConta,      FCdsPlanoContabil, FCdsPlanoPrev,    FCdsPlanoPrevConta,
               FCdsTestaComposicao, FCdsTipoRD,        FCdsTodoDet,      FCdsUnidNegoc,
               FCdsUnidNegocConta ] );
    pgbStatus.Free;
  End;
End;
//************************************************
Function TCtrlCadContasOrc.Procurar( idContasOrcamen : String ) : OleVariant;
Begin

  _DbContasOrcamen.IdContaOrcamen.AsString := idContasOrcamen;
  Result := GetDataPacket(_DbContasOrcamen.SSqlSelect);

End;
//************************************************
Procedure TCtrlCadContasOrc.FazerQryPrincipal;
Begin

  With dtmCadContasOrcamen.Qry Do Begin
    Prepare;
    ParamByName( 'IDPLANOORCAMEN' ).AsInteger := iPlanoOrc;
    ParamByName( 'IDCONTAORCAMEN' ).AsString  := sCodContaOrc;

    Cds.Data := Data;
  End;
End;
//************************************************
Procedure TCtrlCadContasOrc.SelecionaFilhos;
Begin
  //Seleciona os registros das Tabelas Filhas

  //Consulta do Banco de Dados de Arquivos Genéricos
  With dtmCadContasOrcamen.qryDataView do Begin
    Prepare;
    ParamByName('IDDATAVIEW').asInteger := iConsulta;
    CdsDataView.Data := Data;
  End;

  //Composição de Contas Orçamentárias de Contabilidade
  With dtmCadContasOrcamen.qryDet do Begin
    Prepare;
    ParamByName('IDPLANOORCAMEN').AsInteger := iPlanoOrc;
    ParamByName('IDCONTAORCAMEN').AsString  := sCodContaOrc;
    CdsDet.Data := Data;
  End;

  //Composição de Contas Orçamentárias Orçadas
  With dtmCadContasOrcamen.qryDetContaOrc do Begin
    Prepare;
    ParamByName('IDPLANOORCAMEN').AsInteger := iPlanoOrc;
    ParamByName('IDCONTAORCAMEN').AsString  := sCodContaOrc;
    CdsDetContaOrc.Data := Data;
  End;

  //Composição de Contas Orçamentárias Realizadas
  With dtmCadContasOrcamen.qryDetContaRea do Begin
    Prepare;
    ParamByName('IDPLANOORCAMEN').AsInteger := iPlanoOrc;
    ParamByName('IDCONTAORCAMEN').AsString  := sCodContaOrc;
    CdsDetContaRea.Data := Data;
  End;

  //Composição de Contas Orçamentárias Condicionais
  With dtmCadContasOrcamen.qryDetCond do Begin
    SQL.Clear;
    SQL.Add('SELECT ' + QuotedStr( StringOfChar( ' ', 130 ) ) + ' AS CONDDESCRICAO, ' );
    SQL.Add('IDCONTACONDINI, IDCONTACONDFIM, IDCONTACONDRES, CONDICAO,');
    SQL.Add('TIPOCONDINI, TIPOCONDRES, VLRCONDINI, VLRCONDRES, ');
    SQL.Add('IDCONTAORCAMEN, IDPLANOORCAMEN, IDCOMPCONTASORC');
    SQL.Add('FROM COMPCONTASORCAMEN ');
    SQL.Add('WHERE IDPLANOORCAMEN = ' + IntToStr( iPlanoOrc ));
    SQL.Add(' AND IDCONTAORCAMEN = ''' + sCodContaOrc + '''');
    SQL.Add(' AND IDCONTACONDINI IS NOT NULL');
    Prepare;

    CdsDetCond.Data := Data;
  End;

  //Composição de Contas Orçamentárias Fluxo de Caixa
  With dtmCadContasOrcamen.qryDetFluxo do Begin
    Prepare;
    ParamByName('IDPLANOORCAMEN').AsInteger := iPlanoOrc;
    ParamByName('IDCONTAORCAMEN').AsString  := sCodContaOrc;
    CdsDetFluxo.Data := Data;
  End;
End;
//************************************************
function TCtrlCadContasOrc.VerificaFormula( edt           : TwwDBEdit;
                                            Var pMensagem : String ) : Boolean;
var i, j, k, iInicio, iFim, iTamanho:integer;
    sTeste : string;
Begin

   //Faz a Verificação Final da fórmula
   Result := true;

   sTeste := edt.text;

   if ( iAbrePar <> iFechaPar) Then Begin

      pMensagem := 'Parênteses não balanceados. Verifique.';
      Result := False;
   End;

   if PegaUltimoCaracter( edt, pMensagem ) in ['.','+','-','*','/','^','C','('] Then Begin

      pMensagem := 'Fórmula terminada incorretamente. Verifique.';
      Result := False;
   End;

   //Pega as Contas presentes na fórmula (C) e as transforma no valor 1
   //para serem verificadas pelo parser

   iTamanho := length(sTeste);

   //Faz a varredura das contas e as substitui
   for k := 1 to length(sTeste) do Begin
      for i := 1 to iTamanho do Begin
         if sTeste[i] in ['C'] Then Begin
            iInicio := i;
            for j := (i + 1) to iTamanho do Begin
               if not (sTeste[j] in ['0'..'9', 'C']) Then Begin
                  iFim := j;

                  delete(sTeste, iInicio, iFim-iInicio);
                  insert('1', sTeste, iInicio);
                  iTamanho := length(sTeste);
                  Break;
               End;
            End;
            Break;
         End;
      End;
   End;

   //Caso haja uma conta no final da fórmula, faz a varredura dela também
   for i := 1 to length(sTeste) do Begin
      if sTeste[i] in ['C'] Then Begin
         iInicio := i;

         delete(sTeste, iInicio, length(sTeste));
         insert('1', sTeste, iInicio);
      End;
   End;

   try
      dtmCadContasOrcamen.Parser.expression := sTeste;
   except
      pMensagem := 'Existem erros na Fórmula. Verifique.';
      result := false;
   End;

End;
//************************************************
Function TCtrlCadContasOrc.PegaUltimoCaracter( edt           : TwwDBEdit;
                                               Var pMensagem : String ) : char;
Var
  sTexto   : String;
  iTamanho : Integer;

Begin

   //Retorna qual é o último caracter da caixa de texto
   sTexto := edt.text;
   iTamanho := length(sTexto);
   if iTamanho <> 0 Then Result := sTexto[iTamanho] Else Result := #0;

End;
//************************************************
function TCtrlCadContasOrc.TestaCaracteres( edt           : TwwDBEdit;
                                            sCaracter     : Char;
                                            iPos          :Integer;
                                            Var pMensagem : String ) : Boolean;
var sContaAux : string;
Begin

   Result := true;

   // Verifica se o caracter digitado é válido
   if (not (sCaracter in ['0'..'9','+','-','*','/','^','C','(',')','.']) ) Then Begin

      pMensagem := 'Este caracter não pode ser usado na fórmula.';
      Result := false;
      exit;
   End;

   //Verifica se o primeiro caracter não é um operador
   if (iPos = 1) and (not (sCaracter in ['0'..'9','C','(',')'])) Then Begin

      pMensagem := 'Este caracter não pode ser usado no início da fórmula.';
      Result := false;
      exit;
   End;

   //Verifica se o caracter após o ")" é válido
   if (iPos > 1) and (sCaracter in ['0'..'9','.','C']) Then Begin
      if PegaUltimoCaracter( edt, pMensagem ) in [')'] Then Begin

         pMensagem := 'Este caracter não pode ser usado na fórmula nesta posição.';
         Result := false;
         exit;
      End;
   End;

   //Verifica se o caracter antes do "(" é válido
   if (iPos > 1) and (sCaracter in ['(']) Then Begin
      if PegaUltimoCaracter( edt, pMensagem ) in ['0'..'9','.','C'] Then Begin
         pMensagem := 'Este caracter não pode ser usado na fórmula nesta posição.';
         Result := false;
         exit;
      End;
   End;

   //Verifica se não estão sendo digitados dois operadores iguais (ex.: 66++7)
   if (iPos > 1) and (not (sCaracter in ['0'..'9','(',')'])) Then Begin
      if PegaUltimoCaracter( edt, pMensagem ) = sCaracter Then Begin
         pMensagem := 'Este caracter não pode ser usado na fórmula nesta posição.';
         Result := false;
         exit;
      End;
   End;

   //Verifica se o operador está numa posição correta
   if (iPos > 1) and (not (sCaracter in ['0'..'9','C','(',')'])) Then Begin
      if (PegaUltimoCaracter( edt, pMensagem ) ) in ['.','+','-','*','/','^','C'] Then Begin
         pMensagem := 'Este caracter não pode ser usado na fórmula nesta posição.';
         Result := false;
         exit;
      End;
   End;

   //Condições indicadoras de que a digitação corrente é de uma conta Orçamentária
   if bInicioConta = True Then Begin
      if not (sCaracter in ['0'..'9']) Then Begin
         bInicioConta := false;
      End;
   End;

   if sCaracter in ['C'] Then Begin
      bInicioConta := True;
      sConta := '';
   End;

   if bInicioConta = True Then
     sConta := sConta + sCaracter;

   //Verifica se a conta Orçamentária digitada é válida
   if (iPos=1) or ((sCaracter in ['.','+','-','*','/','^','C','(',')'])) Then Begin

         if sConta <> 'C' Then Begin
            sContaAux := copy( sConta, 2, ( length( sConta ) - 1));

            With dtmCadContasOrcamen.qryAux do Begin

               SQL.Clear;
               SQL.Add('SELECT IDCONTAORCAMEN FROM CONTASORCAMEN ');
               SQL.Add('WHERE IDPLANOORCAMEN = ' + IntToStr( iPlanoOrc ) );
               SQL.Add(' AND IDCONTAORCAMEN = ''' + sContaAux + '''');
               Prepare;
               CdsAux.Data :=Data;
            End;

            bInicioConta := False;

            if CdsAux.IsEmpty Then Begin

               pMensagem := 'Conta Orçamentária não cadastrada.';
               Result := false;
               sConta := '';
               exit;
            End;
         End;
      {End;}
   End;

   //Verificação de balanceamento de parêntesis
   if sCaracter = '(' Then iAbrePar  := iAbrePar  + 1;
   if sCaracter = ')' Then iFechaPar := iFechaPar + 1;
End;
//************************************************
Procedure TCtrlCadContasOrc.ProcessaConfirma;
Begin

  pgbStatus.Position := 0;
  pgbStatus.Min := 0;
  pgbStatus.Max := 5;

  With dtmCadContasOrcamen Do Begin

    if Cds.FieldByName('CODCENTROCUSTO').isNull Then
       Cds.FieldByName('IDEMPRESA').Clear
    Else
       Cds.FieldByName('IDEMPRESA').AsInteger := idEmpresa;

    CdsDet.First;
    while ( not CdsDet.EOF) do Begin

      CdsDet.Edit;

      if CdsDet.FieldByName('IDCOMPCONTASORC').AsInteger = 0 Then
         CdsDet.FieldByName('IDCOMPCONTASORC').AsInteger := GetSequence('COMPCONTASORCAMEN');

      if CdsDet.FieldByName('IDCONTAORCAMEN').AsString = '' Then
         CdsDet.FieldByName('IDCONTAORCAMEN').AsString := Cds.FieldByName('IDCONTAORCAMEN').AsString;

      if CdsDet.FieldByName('IDPLANOORCAMEN').AsInteger = 0 Then
         CdsDet.FieldByName('IDPLANOORCAMEN').AsInteger := Cds.FieldByName('IDPLANOORCAMEN').AsInteger;
      CdsDet.Post;
      //

      With QryTestaComposicao do Begin

         SQL.Clear;
         SQL.Add('SELECT IDCONTAORCAMEN FROM COMPCONTASORCAMEN ');
         SQL.Add('WHERE ( IDCONTAORCAMEN <> '''+Cds.FieldByName('IDCONTAORCAMEN').AsString+''')');
         SQL.Add('  AND ( IDPLANOORCAMEN = '+Cds.FieldByName('IDPLANOORCAMEN').AsString+')');
         SQL.Add('  AND ( PLACONTA = '''+Espaco( CdsDet.FieldByName('PLACONTA' ).AsString, 18)+''')');
         SQL.Add('  AND ( PLANO = '+ CdsDet.FieldByName('PLANO' ).AsString+')');

         If not CdsDet.FieldByName('IDPLANOPREV' ).isNull Then
            SQL.Add('  AND (IDPLANOPREV = '+ CdsDet.FieldByName('IDPLANOPREV' ).AsString + ')' )
         Else
            SQL.Add('  AND (IDPLANOPREV IS NULL)');

         If not CdsDet.FieldByName('IDPATRO' ).isNull Then
            SQL.Add('  AND (IDPATRO = ' + CdsDet.FieldByName('IDPATRO' ).AsString+')')
         Else
            SQL.Add('  AND (IDPATRO IS NULL)');

         If not CdsDet.FieldByName('UNIDNEGOC' ).isNull Then Begin
            SQL.Add('  AND (UNIDNEGOC = '+CdsDet.FieldByName('UNIDNEGOC' ).AsString+')');
            SQL.Add('  AND (IDPESSOA = '+CdsDet.FieldByName('IDPESSOA' ).AsString+')');
         End Else Begin
            SQL.Add('  AND (UNIDNEGOC IS NULL)');
         End;

         If not CdsDet.FieldByName('CODCENTROCUSTO' ).isNull Then Begin
            SQL.Add('  AND (CODCENTROCUSTO = '''+ CdsDet.FieldByName('CODCENTROCUSTO' ).AsString + ''')');
            SQL.Add('  AND (IDEMPRESA = ' + CdsDet.FieldByName('IDEMPRESA' ).AsString + ')');
         End Else Begin
            SQL.Add('  AND (CODCENTROCUSTO IS NULL)');
         End;
         CdsTestaComposicao.Data := Data;

         if not CdsTestaComposicao.isEmpty Then Begin

           // Ao atualizar a propriedade 'Mensagem', é chamado um método na tela principal
           // e esta atualiza a propriedade 'Confirmado'
           Mensagem.Text := 'Existe Composição de Contabilidade Repetida com a Conta Orçamentária ' +
                            CdsTestaComposicao.FieldByName('IDCONTAORCAMEN').AsString + '. Confirma?';

           If ( Not Confirmado ) Then Begin

             Exit;
           End;
         End;
      End;

      CdsDet.Next;
    End;
    //

    pgbStatusAtualiza( 2 );
    CdsDetContaOrc.First;
    while (not CdsDetContaOrc.EOF) do Begin
       CdsDetContaOrc.Edit;

       if CdsDetContaOrc.FieldByName('IDCOMPCONTASORC').isNull Then
          CdsDetContaOrc.FieldByName('IDCOMPCONTASORC').AsInteger := GetSequence('COMPCONTASORCAMEN');

       if CdsDetContaOrc.FieldByName('IDCONTAORCAMEN').isNull Then
          CdsDetContaOrc.FieldByName('IDCONTAORCAMEN').AsString := Cds.FieldByName('IDCONTAORCAMEN').AsString;

       if CdsDetContaOrc.FieldByName('IDPLANOORCAMEN').isNull Then
          CdsDetContaOrc.FieldByName('IDPLANOORCAMEN').AsInteger := Cds.FieldByName('IDPLANOORCAMEN').AsInteger;

       CdsDetContaOrc.Post;
       CdsDetContaOrc.Next;
    End;

    //
    pgbStatusAtualiza( 3 );
    CdsDetFluxo.First;
    while (not CdsDetFluxo.EOF) do Begin
       CdsDetFluxo.Edit;

       if CdsDetFluxo.FieldByName('IDCOMPCONTASORC').AsInteger = 0 Then
          CdsDetFluxo.FieldByName('IDCOMPCONTASORC').AsInteger := GetSequence('COMPCONTASORCAMEN');

       if CdsDetFluxo.FieldByName('IDCONTAORCAMEN').AsString = '' Then
          CdsDetFluxo.FieldByName('IDCONTAORCAMEN').AsString := Cds.FieldByName('IDCONTAORCAMEN').AsString;

       if CdsDetFluxo.FieldByName('IDPLANOORCAMEN').AsInteger = 0 Then
          CdsDetFluxo.FieldByName('IDPLANOORCAMEN').AsInteger := Cds.FieldByName('IDPLANOORCAMEN').AsInteger;

       CdsDetFluxo.Post;
       //
       With QryTestaComposicao do Begin

          SQL.Clear;
          SQL.Add('SELECT IDCONTAORCAMEN FROM COMPCONTASORCAMEN ');
          SQL.Add('WHERE (IDCONTAORCAMEN <> '''+Cds.FieldByName('IDCONTAORCAMEN' ).AsString+''')');
          SQL.Add('  AND (IDPLANOORCAMEN = '+Cds.FieldByName('IDPLANOORCAMEN').AsString+')');
          SQL.Add('  AND (CODTIPRECDES = '''+Espaco(CdsDetFluxo.FieldByName('CODTIPRECDES' ).AsString,15)+''')');
          SQL.Add('  AND (RECPAG = '''+CdsDetFluxo.FieldByName('RECPAG' ).AsString+''')');
          SQL.Add('  AND (IDPESSOA = '+CdsDetFluxo.FieldByName('IDPESSOA' ).AsString+')');
          If not CdsDetFluxo.FieldByName('IDPLANOPREV' ).isNull Then
             SQL.Add('  AND (IDPLANOPREV = '+CdsDetFluxo.FieldByName('IDPLANOPREV' ).AsString+')')
          Else
             SQL.Add('  AND (IDPLANOPREV IS NULL)');
          If not CdsDetFluxo.FieldByName('IDPATRO' ).isNull Then
             SQL.Add('  AND (IDPATRO = '+CdsDetFluxo.FieldByName('IDPATRO' ).AsString+')')
          Else
             SQL.Add('  AND (IDPATRO IS NULL)');
          If not CdsDetFluxo.FieldByName('UNIDNEGOC' ).isNull Then
             SQL.Add('  AND (UNIDNEGOC = '+CdsDetFluxo.FieldByName('UNIDNEGOC' ).AsString+')')
          Else
             SQL.Add('  AND (UNIDNEGOC IS NULL)');
          If not CdsDetFluxo.FieldByName('CODCENTRORESPON' ).isNull Then
             SQL.Add('  AND (CODCENTRORESPON = '''+CdsDetFluxo.FieldByName('CODCENTRORESPON' ).AsString+''')')
          Else
             SQL.Add('  AND (CODCENTRORESPON IS NULL)');
          If not CdsDetFluxo.FieldByName('CODCENTROCUSTO' ).isNull Then Begin
             SQL.Add('  AND (CODCENTROCUSTO = '''+CdsDetFluxo.FieldByName('CODCENTROCUSTO' ).AsString+''')');
             SQL.Add('  AND (IDEMPRESA = '+CdsDetFluxo.FieldByName('IDEMPRESA' ).AsString+')');
          End Else Begin
             SQL.Add('  AND (CODCENTROCUSTO IS NULL)');
          End;
          CdsTestaComposicao.Data := Data;

          if not CdsTestaComposicao.isEmpty Then Begin

            // Ao atualizar a propriedade 'Mensagem', é chamado um método na tela principal
            // e esta atualiza a propriedade 'Confirmado'
           Mensagem.Text := 'Existe Composição de Fluxo de Caixa Repetida com a Conta Orçamentária ' +
                            CdsTestaComposicao.FieldByName('IDCONTAORCAMEN').AsString + '. Confirma?';

            If ( Not Confirmado ) Then Begin

              Exit;
            End;
          End;
       End;
       CdsDetFluxo.Next;
    End;

    //
    pgbStatusAtualiza( 4 );
    CdsDetContaRea.First;
    while (not CdsDetContaRea.EOF) do Begin
       CdsDetContaRea.Edit;

       if CdsDetContaRea.FieldByName('IDCOMPCONTASORC').isNull Then
          CdsDetContaRea.FieldByName('IDCOMPCONTASORC').AsInteger := GetSequence('COMPCONTASORCAMEN');

       if CdsDetContaRea.FieldByName('IDCONTAORCAMEN').isNull  Then
          CdsDetContaRea.FieldByName('IDCONTAORCAMEN').AsString := Cds.FieldByName('IDCONTAORCAMEN').AsString;

       if CdsDetContaRea.FieldByName('IDPLANOORCAMEN').isNull  Then
          CdsDetContaRea.FieldByName('IDPLANOORCAMEN').AsInteger := Cds.FieldByName('IDPLANOORCAMEN').AsInteger;

       CdsDetContaRea.Post;
       CdsDetContaRea.Next;
    End;

    //
    pgbStatusAtualiza( 5 );
    CdsDetCond.First;
    while (not CdsDetCond.EOF) do Begin
       CdsDetCond.Edit;

       if CdsDetCond.FieldByName('IDCOMPCONTASORC').AsInteger < 1 Then
          CdsDetCond.FieldByName('IDCOMPCONTASORC').AsInteger := GetSequence('COMPCONTASORCAMEN');

       if CdsDetCond.FieldByName('IDCONTAORCAMEN').AsString = '' Then
          CdsDetCond.FieldByName('IDCONTAORCAMEN').AsString := Cds.FieldByName('IDCONTAORCAMEN').AsString;

       if CdsDetCond.FieldByName('IDPLANOORCAMEN').AsInteger < 1 Then
          CdsDetCond.FieldByName('IDPLANOORCAMEN').AsInteger := Cds.FieldByName('IDPLANOORCAMEN').AsInteger;

       CdsDetCond.Post;
       CdsDetCond.Next;
    End;
  End;
End;
//************************************************
Procedure TCtrlCadContasOrc.AbreQueries;
Begin

  pgbStatusAtualiza( 3 );
  With dtmCadContasOrcamen.qryAuxContab Do Begin

    Prepare;
    ParamByName('IDPESSOA').asInteger := idEmpresa;
    CdsAuxContab.Data := Data;
  End;

  //Seleciona os Grupos Orçamentários
  pgbStatusAtualiza( 4 );
  With dtmCadContasOrcamen.qryGrupo do Begin

    Prepare;
    ParamByName('CODGRUPOORC').AsString := '';
    CdsGrupo.Data := Data;
  End;

  //Seleciona os Centros de Responsabilidade das Contas Orçamentários
  pgbStatusAtualiza( 5 );
  With dtmCadContasOrcamen.qryCenRespConta do Begin

    Prepare;
    ParamByName('IDPESSOA').asInteger := idEmpresa;
    CdsCenRespConta.Data := Data;
  End;

  //Seleciona as Contas Orçamentários
  pgbStatusAtualiza( 6 );
  With dtmCadContasOrcamen.qryContasOrc do Begin

    Prepare;
    ParamByName('IDPLANOORCAMEN').asInteger := iPlanoOrc;
    // CdsContasOrc.Data := Data;     // Comentado para melhorar o tempo de carga da tela
  End;

  //Seleciona as Contas Orçamentárias das Condições
  pgbStatusAtualiza( 7 );
  With dtmCadContasOrcamen.qryContaCondIni do Begin

    Prepare;
    ParamByName('IDPLANOORCAMEN').asInteger := iPlanoOrc;
    //CdsContaCondIni.Data := Data;   // Comentado para melhorar o tempo de carga da tela
  End;

  pgbStatusAtualiza( 8 );
  With dtmCadContasOrcamen.qryContaCondFim do Begin

    Prepare;
    ParamByName('IDPLANOORCAMEN').asInteger := iPlanoOrc;
    //CdsContaCondFim.Data := Data;   // Comentado para melhorar o tempo de carga da tela
  End;

  pgbStatusAtualiza( 9 );
  With dtmCadContasOrcamen.qryContaCondRes do Begin

    Prepare;
    ParamByName('IDPLANOORCAMEN').asInteger := iPlanoOrc;
    //CdsContaCondRes.Data := Data;   // Comentado para melhorar o tempo de carga da tela
  End;

  //Seleciona Tipos de Recebimento
  pgbStatusAtualiza( 10 );
  With dtmCadContasOrcamen.qryTipoRD do Begin

    Prepare;
    ParamByName('IDPESSOA').asInteger := idEmpresa;
    CdsTipoRD.Data := Data;
  End;

  //Seleciona Centros de Responsabilidade
  pgbStatusAtualiza( 11 );
  With dtmCadContasOrcamen.qryCentroRespon do Begin

    Prepare;
    ParamByName('IDPESSOA').asInteger := idEmpresa;
    CdsCentroRespon.Data := Data;
  End;

  //Seleciona Unidades de Negócio
  pgbStatusAtualiza( 12 );
  With dtmCadContasOrcamen.qryUnidNegoc do Begin

    Prepare;
    ParamByName('IDPESSOA').asInteger := idEmpresa;
    CdsUnidNegoc.Data := Data
  End;

  //Seleciona Unidades de Negócio
  pgbStatusAtualiza( 13 );
  With dtmCadContasOrcamen.qryUnidNegocConta do Begin

    Prepare;
    ParamByName('IDPESSOA').asInteger := idEmpresa;
    CdsUnidNegocConta.Data := Data;
  End;

  //Seleciona os Centros de Custo
  pgbStatusAtualiza( 14 );

  With dtmCadContasOrcamen.qryCCusto do Begin

    Prepare;
    ParamByName('IDEMPRESA').asInteger := IdEmpresa;
    CdsCCusto.Data := Data;
  End;

  //Seleciona os Centros de Custo
  pgbStatusAtualiza( 15 );
  With dtmCadContasOrcamen.qryCCustoConta do Begin

    Prepare;
    ParamByName('IDEMPRESA').asInteger := IdEmpresa;
    CdsCCustoConta.Data := Data;
  End;

  //Seleciona os Centros de Custo do Fluxo de Caixa
  pgbStatusAtualiza( 16 );
  With dtmCadContasOrcamen.qryCCustoFluxo do Begin

    Prepare;
    ParamByName('IDEMPRESA').asInteger := IdEmpresa;
    CdsCCustoFluxo.Data := Data;
  End;

  pgbStatusAtualiza( 17 );
  With dtmCadContasOrcamen.qryPlanoContabil do Begin

    Prepare;
    CdsPlanoContabil.Data := Data;
  End;

  pgbStatusAtualiza( 18 );
  With dtmCadContasOrcamen.qryPlanoPrev do Begin
    Prepare;
    CdsPlanoPrev.Data := Data;
  End;

  pgbStatusAtualiza( 19 );
  With dtmCadContasOrcamen.qryPlanoPrevConta do Begin
    Prepare;
    CdsPlanoPrevConta.Data := Data;
  End;

  pgbStatusAtualiza( 20 );
  With dtmCadContasOrcamen.qryPatroConta do Begin
    Prepare;
    CdsPatroConta.Data := Data;
  End;

  pgbStatusAtualiza( 21 );
  With dtmCadContasOrcamen.qryPatro do Begin
    Prepare;
    CdsPatro.Data := Data;
  End;

  Cds.OnCalcFields             := CdsCalcFields;
  CdsDetCond.OnCalcFields      := CdsDetCondCalcFields;
  CdsTodoDet.OnCalcFields      := CdsCalcFields;
  CdsMovOrcamento.OnCalcFields := CdsCalcFields;
End;
//************************************************
Procedure TCtrlCadContasOrc.CdsCalcFields(DataSet: TDataSet);
Begin

  With dtmCadContasOrcamen.qryGrupoAux Do Begin

    SQL.Clear;
    SQL.Add('SELECT IDGRUPOORCAMEN, NOMEGRUPOORCAMEN, FLGANALSINT, CODGRUPOORC ');
    SQL.Add('FROM GRUPOORCAMEN WHERE IDGRUPOORCAMEN =:IDGRUPOORCAMEN');
    Prepare;
    ParamByName('IDGRUPOORCAMEN').asInteger := Cds.FieldByName('IDGRUPOORCAMEN').asInteger;
    CdsGrupoAux.Data := Data;

    Cds.FieldByName('DESCGRUPO').asString := FormatMaskText( ( Trim( sMascaraGrupo ) + ';0;_' ),
                                             CdsGrupoAux.FieldByName( 'CODGRUPOORC' ).asString) + ' - ' +
                                             CdsGrupoAux.FieldByName( 'NOMEGRUPOORCAMEN' ).asString;
  End;
End;
//************************************************
Procedure TCtrlCadContasOrc.CdsDetCondCalcFields(DataSet: TDataSet);
var sDescricao : string;
Begin
  Inherited;

  sDescricao := '';

  With CdsDetCond do Begin

    sDescricao := sDescricao + 'Se a Conta ' + FieldByName('IDCONTACONDINI').asString;
    if FieldByName('CONDICAO').asString = '<=' Then
       sDescricao := sDescricao + ' for menor ou igual ';
    if FieldByName('CONDICAO').asString = '<' Then
       sDescricao := sDescricao + ' for menor ';
    if FieldByName('CONDICAO').asString = '=' Then
       sDescricao := sDescricao + ' for igual ';
    if FieldByName('CONDICAO').asString = '>=' Then
       sDescricao := sDescricao + ' for maior ou igual ';
    if FieldByName('CONDICAO').asString = '>' Then
       sDescricao := sDescricao + ' for maior ';
    if FieldByName('CONDICAO').asString = '<>' Then
       sDescricao := sDescricao + ' for diferente ';

    if FieldByName('TIPOCONDINI').asString = 'V' Then
       sDescricao := sDescricao + 'que o Valor ' + FormatFloat('###,###,###,##0.00', FieldByName('VLRCONDINI').asFloat);
    if FieldByName('TIPOCONDINI').asString = 'C' Then
       sDescricao := sDescricao + 'que a Conta ' + FieldByName('IDCONTACONDFIM').asString;

    sDescricao := sDescricao + ' então a condição receberá o Valor ';

    if FieldByName('TIPOCONDRES').asString = 'V' Then
       sDescricao := sDescricao + FormatFloat('###,###,###,##0.00', FieldByName('VLRCONDRES').asFloat);
    if FieldByName('TIPOCONDRES').asString = 'C' Then
       sDescricao := sDescricao + 'da Conta ' + FieldByName('IDCONTACONDRES').asString;

    FieldByName('CONDDESCRICAO').asString := sDescricao;
  End;
End;
//************************************************
Procedure TCtrlCadContasOrc.SetCds              (Const Value : TClientDataSet) ;
Begin

  FCds := Value;
End;
//************************************************
Procedure TCtrlCadContasOrc.SetCdsDet(const Value: TClientDataSet);
Begin

  FCdsDet := Value;
End;
//************************************************
Procedure TCtrlCadContasOrc.SetCdsDetCond(const Value: TClientDataSet);
Begin

  FCdsDetCond := Value;
End;
//************************************************
Procedure TCtrlCadContasOrc.SetCdsCCustoConta(const Value: TClientDataSet);
Begin

  FCdsCCustoConta := Value;
End;
//************************************************
Procedure TCtrlCadContasOrc.SetCdsCenRespConta( const Value: TClientDataSet);
Begin

  FCdsCenRespConta := Value;
End;
//************************************************
Procedure TCtrlCadContasOrc.SetCdsPatroConta(const Value: TClientDataSet);
Begin

  FCdsPatroConta := Value;
End;
//************************************************
Procedure TCtrlCadContasOrc.SetCdsPlanoPrevConta( const Value: TClientDataSet );
Begin

  FCdsPlanoPrevConta := Value;
End;
//************************************************
Procedure TCtrlCadContasOrc.SetCdsUnidNegocConta( const Value: TClientDataSet);
Begin

  FCdsUnidNegocConta := Value;
End;
//************************************************
Procedure TCtrlCadContasOrc.SetCdsGrupo( const Value: TClientDataSet);
Begin

  FCdsGrupo := Value;
End;
//************************************************
Procedure TCtrlCadContasOrc.SetCdsContaContabil( const Value: TClientDataSet);
Begin

  FCdsContaContabil := Value;
End;
//************************************************
Procedure TCtrlCadContasOrc.SetCdsDataView(const Value: TClientDataSet);
Begin

  FCdsDataView := Value;
End;
//************************************************
Procedure TCtrlCadContasOrc.SetCdsDetContaOrc( const Value: TClientDataSet);
Begin

  FCdsDetContaOrc := Value;
End;
//************************************************
Procedure TCtrlCadContasOrc.SetCdsDetContaRea(const Value: TClientDataSet);
Begin

  FCdsDetContaRea := Value;
End;
//************************************************
Procedure TCtrlCadContasOrc.SetCdsDetFluxo(const Value: TClientDataSet);
Begin

  FCdsDetFluxo := Value;
End;
//************************************************
Procedure TCtrlCadContasOrc.SetCdsMovOrcamento(
  const Value: TClientDataSet);
Begin

 FCdsMovOrcamento := Value;
End;
//************************************************
Procedure TCtrlCadContasOrc.SetCdsTodoDet(const Value: TClientDataSet);
Begin

  FCdsTodoDet := Value;
End;
//************************************************
Procedure TCtrlCadContasOrc.SetCdsContasRef(const Value: TClientDataSet);
Begin

  FCdsContasRef := Value;
End;
//************************************************
Procedure TCtrlCadContasOrc.SetCdsContasOrc(const Value: TClientDataSet);
Begin

  FCdsContasOrc := Value;
End;
//************************************************
Procedure TCtrlCadContasOrc.SetCdsAuxContab(const Value: TClientDataSet);
Begin

  FCdsAuxContab := Value;
End;
//************************************************
Procedure TCtrlCadContasOrc.SetCdsContaContab(const Value: TClientDataSet);
Begin

  FCdsContaContab := Value;
End;
//************************************************
procedure TCtrlCadContasOrc.SetCdsAux(const Value: TClientDataSet);
begin

  FCdsAux := Value;
end;
//************************************************
procedure TCtrlCadContasOrc.SetCdsCCusto(const Value: TClientDataSet);
begin

  FCdsCCusto := Value;
end;
//************************************************
procedure TCtrlCadContasOrc.SetCdsCCustoFluxo(const Value: TClientDataSet);
begin

  FCdsCCustoFluxo := Value;
end;
//************************************************
procedure TCtrlCadContasOrc.SetCdsCentroRespon( const Value: TClientDataSet);
Begin
  FCdsCentroRespon := Value;
end;
//************************************************
procedure TCtrlCadContasOrc.SetCdsContaCondFim( const Value: TClientDataSet);
begin

  FCdsContaCondFim := Value;
end;
//************************************************
procedure TCtrlCadContasOrc.SetCdsContaCondIni( const Value: TClientDataSet);
begin

  FCdsContaCondIni := Value;
end;
//************************************************
procedure TCtrlCadContasOrc.SetCdsContaCondRes( const Value: TClientDataSet);
begin

  FCdsContaCondRes := Value;
end;
//************************************************
procedure TCtrlCadContasOrc.SetCdsGrupoAux(const Value: TClientDataSet);
begin

  FCdsGrupoAux := Value;
end;
//************************************************
procedure TCtrlCadContasOrc.SetCdsPatro(const Value: TClientDataSet);
begin

  FCdsPatro := Value;
end;
//************************************************
procedure TCtrlCadContasOrc.SetCdsPlanoContabil( const Value: TClientDataSet);
begin

  FCdsPlanoContabil := Value;
end;
//************************************************
procedure TCtrlCadContasOrc.SetCdsPlanoPrev(const Value: TClientDataSet);
begin

  FCdsPlanoPrev := Value;
end;
//************************************************
procedure TCtrlCadContasOrc.SetCdsTestaComposicao(  const Value: TClientDataSet);
begin

  FCdsTestaComposicao  := Value;
end;
//************************************************
procedure TCtrlCadContasOrc.SetCdsTipoRD(const Value: TClientDataSet);
begin

  FCdsTipoRD := Value;
end;
//************************************************
procedure TCtrlCadContasOrc.SetCdsUnidNegoc(const Value: TClientDataSet);
begin

  FCdsUnidNegoc := Value;
end;
//************************************************
Procedure TCtrlCadContasOrc.CadastroDelete;
Begin
  //Faz a deleção em cascata dos registros filhos e depois do pai

  //
  With dtmCadContasOrcamen Do Begin
    QryTodoDet.Prepare;
    QryTodoDet.ParamByName('IDCONTAORCAMEN').AsString := Cds.FieldByName( 'IDCONTAORCAMEN' ).AsString;
    QryTodoDet.ParamByName('IDPLANOORCAMEN').AsInteger := Cds.FieldByName( 'IDPLANOORCAMEN' ).AsInteger;
    CdsTodoDet.Data := qryTodoDet.Data;
    //
    CdsTodoDet.First;
    while not CdsTodoDet.Eof do
       CdsTodoDet.Delete;

    CdsMovOrcamento.First;
    while not CdsMovOrcamento.Eof do
       CdsMovOrcamento.Delete;

    Cds.Delete;
  End;

  AplicaOperacaoCadContasOrcDelete;
End;
//************************************************
Procedure TCtrlCadContasOrc.AbreQryMovOrcamento;
Begin

  With dtmCadContasOrcamen Do Begin
    QryMovOrcamento.Prepare;
    QryMovOrcamento.ParamByName('IDCONTAORCAMEN').AsString  := Cds.FieldByName( 'IDCONTAORCAMEN' ).AsString;
    QryMovOrcamento.ParamByName('IDPLANOORCAMEN').AsInteger := Cds.FieldByName( 'IDPLANOORCAMEN' ).AsInteger;
    CdsMovOrcamento.Data := qryMovOrcamento.Data;
  End;
End;
//************************************************
Procedure TCtrlCadContasOrc.ValoresDefault;
Begin

   //Inicializa os valores default's da tela de cadastro
   Cds.FieldByName('TIPOCALCREALIZADO').AsString := 'V';
   Cds.FieldByName('TIPOCALCORCADO').AsString    := 'V';
   Cds.FieldByName('FLGCONTAMONETARIA').AsString := 'S';
   Cds.FieldByName('FLGINFDIAMES').AsString      := 'P';
   Cds.FieldByName('FLGACUMULADO').AsString      := 'S';
   Cds.FieldByName('FLGTRANSFSALDO').AsString    := 'N';
   Cds.FieldByName('FLGATIVA').AsString          := 'A';
   Cds.FieldByName('IDPLANOORCAMEN').AsInteger   := iPlanoOrc;
   Cds.FieldByName('IDPESSOA').AsInteger         := idEmpresa;
   Cds.FieldByName('FLGSINALCONTA').AsString := 'P';
End;
//************************************************
Procedure TCtrlCadContasOrc.CadastroConfirma( pdbeCodigoContaOrc : String;
                                              pmemSQLLines       : String );
Var
  iNovaConsulta : LongInt;

Begin

  //iNovaConsulta := 0;
  If ( Cds.FieldByName('TIPOCALCREALIZADO').asString = 'G' ) Then Begin

    With CdsDataView Do Begin

      Data := dtmCadContasOrcamen.qryDataView.Data;

      If ( Cds.FieldByName('IDDATAVIEW').asInteger = 0 ) Then Begin          //Cds.State = dsInsert Then Begin

        Append;
        iNovaConsulta := GetSequence('DATAVIEW');

      End Else Begin                                   //if Cds.State = dsEdit Then Begin

        Edit;
        iNovaConsulta := Cds.FieldByName('IDDATAVIEW').asInteger;
      End;

      //If Cds.State in ([dsEdit, dsInsert]) Then Begin
      FieldByName('NAME').asString        := 'Consulta do Orçamento Conta ' + pdbeCodigoContaOrc;
      FieldByName('IDDATAVIEW').asInteger := iNovaConsulta;
      FieldByName('CLASSNAME').asString   := 'Orçamento';
      FieldByName('ORIGEMCMDV').asString  := '0';
      FieldByName('TEMPLATE').asString    := pmemSQLLines;
      Post;
      Cds.FieldByName('IDDATAVIEW').asInteger := iNovaConsulta;
      Cds.FieldByName('ORIGEMCMDV').asString  := '0';
      //End
    End;
  End;

  AplicaOperacaoCadContasOrcGravar;
End;
//************************************************
Procedure TCtrlCadContasOrc.ProcessaDetalheConfirma1( psePosIni1   : Real;
                                                      psePosFim1   : Real;
                                                      pedConteudo1 : String;
                                                      prPerc       : Real );
Begin

  CdsDetContaOrc.Delete;

  With dtmCadContasOrcamen.qryContasRef Do Begin
    Unprepare;
    SQL.Clear;
    SQL.Add('SELECT IDCONTAORCAMEN, NOMECONTAORCAMEN ');
    SQL.Add('FROM CONTASORCAMEN  ');
    SQL.Add('WHERE (SUBSTR(IDCONTAORCAMEN,' + FloatToStr( psePosIni1 ) + ',' + FloatToStr( psePosFim1 )+') IN ('+trim( pedConteudo1 )+')) ');
    SQL.Add('  AND (IDPLANOORCAMEN = '+IntToStr( iPlanoOrc )+')');
    Prepare;
    CdsContasRef.Data := Data;
  End;

  CdsContasRef.First;
  While ( not CdsContasRef.Eof ) do Begin

    CdsDetContaOrc.Insert;
    CdsDetContaOrc.FieldByName( 'IDCONTAREFORCADO' ).AsString := CdsContasRef.FieldByName( 'IDCONTAORCAMEN').AsString;
    CdsDetContaOrc.FieldByName( 'NOMECONTAORCAMEN' ).AsString := CdsContasRef.FieldByName( 'NOMECONTAORCAMEN').AsString;
    CdsDetContaOrc.FieldByName( 'PERCCONTAREFORC' ).AsFloat   := prPerc;
    CdsContasRef.Next;
  End;
  CdsDetContaOrc.Edit;
End;
//************************************************
Procedure TCtrlCadContasOrc.ProcessaDetalheConfirma2( psePosIni2   : Real;
                                                      psePosFim2   : Real;
                                                      pedConteudo2 : String;
                                                      prPerc       : Real );
Begin

  CdsDetContaRea.Delete;
  With dtmCadContasOrcamen.qryContasRef Do Begin

    Unprepare;
    SQL.Clear;
    SQL.Add('SELECT IDCONTAORCAMEN, NOMECONTAORCAMEN ');
    SQL.Add('FROM CONTASORCAMEN  ');
    SQL.Add('WHERE (SUBSTR(IDCONTAORCAMEN,'+FloatToStr( psePosIni2 )+','+FloatToStr( psePosFim2 )+') IN ('+trim( pedConteudo2 )+')) ');
    SQL.Add('  AND (IDPLANOORCAMEN = '+IntToStr( iPlanoOrc )+' )');
    Prepare;
    CdsContasRef.Data := Data;
  End;

  CdsContasRef.First;
  While not CdsContasRef.Eof do Begin
     CdsDetContaRea.Insert;
     CdsDetContaRea.FieldByName( 'IDCONTAREFREAL').AsString   := CdsContasRef.FieldByName( 'IDCONTAORCAMEN' ).AsString;
     CdsDetContaRea.FieldByName( 'NOMECONTAORCAMEN').AsString := CdsContasRef.FieldByName( 'NOMECONTAORCAMEN' ).AsString;
     CdsDetContaRea.FieldByName( 'PERCCONTAREFREA').AsFloat   := prPerc;
     CdsContasRef.Next;
  End;

  CdsDetContaRea.Edit;
End;
//************************************************
Procedure TCtrlCadContasOrc.AbreqryAuxContab;
Begin

  With dtmCadContasOrcamen.qryAuxContab Do Begin
    Prepare;
    ParamByName('IDPESSOA').asInteger := idEmpresa;

    CdsAuxContab.Data := Data;
  End;
End;
//************************************************
Procedure TCtrlCadContasOrc.btnImportaContabClick( Var pdbeNomeContaOrc,
                                                       pdbeCodigoContaOrc,
                                                       sConta              : String );
Begin

  With dtmCadContasOrcamen.qryContaContab do Begin
    Prepare;
    ParamByName('PLANO').asInteger   := CdsAuxContab.FieldByName('PLANO').asInteger;
    ParamByName('PLACONTA').asString := Trim( sConta );

    CdsContaContab.Data := Data;
  End;

  Cds.FieldByName('NOMECONTAORCAMEN').asString := CdsContaContab.FieldByName('PLANOME').asString;
  Cds.FieldByName('IDCONTAORCAMEN').asString   := CdsContaContab.FieldByName('PLACONTA').asString;

  pdbeNomeContaOrc   := CdsContaContab.FieldByName('PLANOME').asString;
  pdbeCodigoContaOrc := CdsContaContab.FieldByName('PLACONTA').asString;
End;
//************************************************
Procedure TCtrlCadContasOrc.ProcessabtnTransfClick1;
Begin

  With CdsDetContaRea Do Begin

    First;
    While ( Not EOF ) Do Begin
      CdsDetContaOrc.Append;
      CdsDetContaOrc.FieldByName('IDCONTAREFORCADO').asString := FieldByName('IDCONTAREFREAL').asString;
      CdsDetContaOrc.FieldByName('PERCCONTAREFORC').asFloat   := FieldByName('PERCCONTAREFREA').asFloat;
      CdsDetContaOrc.FieldByName('IDCOMPCONTASORC').asInteger := GetSequence('COMPCONTASORCAMEN');
      CdsDetContaOrc.FieldByName('IDCONTAORCAMEN').asString   := FieldByName('IDCONTAORCAMEN').asString;
      CdsDetContaOrc.FieldByName('IDPLANOORCAMEN').asInteger  := FieldByName('IDPLANOORCAMEN').asInteger;
      CdsDetContaOrc.FieldByName('NOMECONTAORCAMEN').asString := FieldByName('NOMECONTAORCAMEN').asString;
      CdsDetContaOrc.Post;
      Next;
    End;
  End;
End;
//************************************************
Procedure TCtrlCadContasOrc.ProcessabtnTransfClick2;
Begin

  With CdsDetContaOrc do Begin
    First;
    while not EOF do Begin
      CdsDetContaRea.Append;
      CdsDetContaRea.FieldByName('IDCONTAREFREAL' ).asString  := FieldByName('IDCONTAREFORCADO').asString;
      CdsDetContaRea.FieldByName('PERCCONTAREFREA').asFloat   := FieldByName('PERCCONTAREFORC').asFloat;
      CdsDetContaRea.FieldByName('IDCOMPCONTASORC').asInteger := GetSequence('COMPCONTASORCAMEN');
      CdsDetContaRea.FieldByName('IDCONTAORCAMEN').asString   := FieldByName('IDCONTAORCAMEN').asString;
      CdsDetContaRea.FieldByName('IDPLANOORCAMEN').asInteger  := FieldByName('IDPLANOORCAMEN').asInteger;
      CdsDetContaRea.FieldByName('NOMECONTAORCAMEN').asString := FieldByName('NOMECONTAORCAMEN').asString;
      CdsDetContaRea.Post;
      Next;
    End;
  End;
End;
//************************************************
Function TCtrlCadContasOrc.AplicaOperacaoCadContasOrcDelete : Boolean ;
Var
  Msg : String;
  
Begin

  If ( ConnectionSide = cnsClient ) Then Begin

    Result := Connection.AppServer.AplicaOperacaoCadContasOrcDelete( FCdsMovOrcamento.Data, FCdsTodoDet.Data, FCds.Data );

    If ( Not Result ) Then Begin

      MessageInfo := Connection.AppServer.MessageInfo;
    End;
  End Else Begin
    Try
      StartTransaction;

      // itens Filhos
      Result := ApplyCds( FCdsMovOrcamento, _dbSaldoOrcado,
                          [ _dbContasOrcamen.IdPessoa, _dbContasOrcamen.IdPlanoOrcamen, _dbContasOrcamen.IdContaOrcamen ],
                          [ _dbSaldoOrcado.IdPessoa,   _dbSaldoOrcado.IdPlanoOrcamen,   _dbSaldoOrcado.IdContaOrcamen ] );

      Msg    := _dbSaldoOrcado.MessageInfo;
      If ( Not Result ) Then Begin

        Raise Exception.Create(Msg);
      End;

      // itens Filhos
      Result := ApplyCds( FCdsTodoDet,
                          _dbCompContasOrcamen,
                          [ _dbContasOrcamen.IdPlanoOrcamen, _dbContasOrcamen.IdContaOrcamen ],
                          [ _dbCompContasOrcamen.IdPlanoOrcamen, _dbCompContasOrcamen.IdContaOrcamen ] );
      Msg    := _dbCompContasOrcamen.MessageInfo;
      If ( Not Result ) Then Begin

        Raise Exception.Create(Msg);
      End;

      // Pai
      Result := ApplyCds( FCds, _dbContasOrcamen, [], [] );
      Msg    := _dbContasOrcamen.MessageInfo;
      If ( Not Result ) Then Begin

        Raise Exception.Create(Msg);
      End;

      Commit;
    Except
      On E:Exception Do Begin
       Rollback;
       Result := False;
       MessageInfo := E.Message;
      End;
    End;
  End;
End;
//************************************************
Function TCtrlCadContasOrc.AplicaOperacaoCadContasOrcGravar: Boolean;

Var
  Msg : String;

Begin

  If ( ConnectionSide = cnsClient ) Then Begin

    Result := Connection.AppServer.AplicaOperacaoCadContasOrcGravar ( FCds.Data,
                                                                      FCdsDet.Data,
                                                                      FCdsDetContaOrc.Data,
                                                                      FCdsDetFluxo.Data,
                                                                      FCdsDetContaRea.Data,
                                                                      FCdsDetCond.Data,
                                                                      FCdsDataView.Data );
    If ( Not Result ) Then Begin

      MessageInfo := Connection.AppServer.MessageInfo;
    End;
  End Else Begin
    Try
      StartTransaction;

      // Pai
      Result := ApplyCds( FCds, _dbContasOrcamen, [], [] );
      Msg    := _dbContasOrcamen.MessageInfo;
      If ( Not Result ) Then Begin

        Raise Exception.Create(Msg);
      End;

      // itens Filhos
      Result := ApplyCds( FCdsDet, _dbDet, [ _dbContasOrcamen.IdPlanoOrcamen, _dbContasOrcamen.IdContaOrcamen ], [ _dbDet.IdPlanoOrcamen, _dbDet.IdContaOrcamen ] );
      Msg    := _dbCompContasOrcamen.MessageInfo;
      If ( Not Result ) Then Begin

        Raise Exception.Create(Msg);
      End;

      Result := ApplyCds( FCdsDetContaOrc, _dbDetContaOrc, [ _dbContasOrcamen.IdPlanoOrcamen, _dbContasOrcamen.IdContaOrcamen ], [ _dbDetContaOrc.IdPlanoOrcamen, _dbDetContaOrc.IdContaOrcamen ] );
      Msg    := _dbCompContasOrcamen.MessageInfo;
      If ( Not Result ) Then Begin

        Raise Exception.Create(Msg);
      End;

      Result := ApplyCds( FCdsDetFluxo, _dbDetFluxo, [ _dbContasOrcamen.IdPlanoOrcamen, _dbContasOrcamen.IdContaOrcamen ], [ _dbDetFluxo.IdPlanoOrcamen, _dbDetFluxo.IdContaOrcamen ] );
      Msg    := _dbCompContasOrcamen.MessageInfo;
      If ( Not Result ) Then Begin

        Raise Exception.Create(Msg);
      End;

      Result := ApplyCds( FCdsDetContaRea, _dbDetContaRea, [ _dbContasOrcamen.IdPlanoOrcamen, _dbContasOrcamen.IdContaOrcamen ], [ _dbDetContaRea.IdPlanoOrcamen, _dbDetContaRea.IdContaOrcamen ] );
      Msg    := _dbCompContasOrcamen.MessageInfo;
      If ( Not Result ) Then Begin

        Raise Exception.Create(Msg);
      End;

      Result := ApplyCds( FCdsDetCond, _dbDetCond, [ _dbContasOrcamen.IdPlanoOrcamen, _dbContasOrcamen.IdContaOrcamen ], [ _dbDetCond.IdPlanoOrcamen, _dbDetCond.IdContaOrcamen ] );
      Msg    := _dbCompContasOrcamen.MessageInfo;
      If ( Not Result ) Then Begin

        Raise Exception.Create(Msg);
      End;

      Result := ApplyCds( FCdsDataView, _dbDataView, [ ], [ ] );
      Msg    := _dbDataView.MessageInfo;
      If ( Not Result ) Then Begin

        Raise Exception.Create(Msg);
      End;

      Commit;
    Except
      On E:Exception Do Begin
       Rollback;
       Result := False;
       MessageInfo := E.Message;
      End;
    End;
  End;
End;
//************************************************
Procedure TCtrlCadContasOrc.pgbStatusAtualiza( pPos : Integer );
Begin

  pgbStatus.Visible  := True;
  pgbStatus.Position := pPos;
  pgbStatus.Repaint;
End;
//************************************************
Function TCtrlCadContasOrc.VerificaLinhaGrid( Cds                : TClientDataSet;
                                              iTagChave,
                                              iTagVazio          : Integer;
                                              sTabelaMensagem    : String;
                                              bPermiteChaveVazia : Boolean ) : Boolean;
Var
  X          : Integer;
  sChave     : String;
  ListaChave : TStrings;
Begin
   ListaChave := TStringList.Create;

   If Cds.IsEmpty Then
   Begin
      Result := True;
      Exit;
   End;

   Try
      Cds.First;
      While Not Cds.Eof Do
      Begin
          sChave := '';
          For X:=0 To Cds.FieldCount - 1 Do
              If (Cds.Fields[X].Tag = iTagChave) Or (Cds.Fields[X].Tag = iTagVazio) Then
              Begin
                 sChave  := sChave + Trim(Cds.Fields[X].AsString);
                 If (Not bPermiteChaveVazia) And (Cds.Fields[X].Tag <> iTagVazio) Then
                 Begin
                     If Cds.Fields[X].IsNull Then
                     Begin
                       MessageInfo := 'O Campo ' + Cds.Fields[X].DisPlayLabel + ' do Cadastro de ' + sTabelaMensagem + ' não foi informado';
                       Result := False;
                       Exit;
                     End;
                 End;
              End;
          If ListaChave.IndexOf(sChave) <> -1 Then
          Begin
               MessageInfo := 'O Cadastro de ' + sTabelaMensagem + ' contém um registro repetido';
               Result := False;
               Exit;
          End
          Else
            If sChave = '' Then
            Begin
               MessageInfo := 'O Cadastro de ' + sTabelaMensagem + ' contém um registro não preenchido';
               Result := False;
               Exit;
            End
            Else
               ListaChave.Add(sChave);
          Cds.Next;
      End;
      Cds.First;
      Result := True;
   Finally
      ListaChave.Free;
   End;
End;
//************************************************
End.
