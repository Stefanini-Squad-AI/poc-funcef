{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Analista Responsável: Davi Ramos                      }
{ Atualizado Em: Julho/2002                             }
{                                                       }
{*******************************************************}
Unit
  uCtrlCopiaContaOrcamen;

Interface

Uses
  Classes, DB, uDataBase, uCmControlObject, dbclient, sysutils, wwQuery, provider, ComCtrls, uMidasUtil,
  uDMCopiaContaOrcamen, uDbCompContasOrcamen, uCtrlCompContasOrcamen, uDbContasOrcamen, uDbSaldoorcado,
  dialogs, uCMTypes, stdctrls;

Type
  TCtrlCopiaContaOrcamen = Class( TCmControlObject )

  Protected

    Procedure DoChangeDataBase; Override;
    Procedure OnCreateAppServer; Override;

    Procedure AfterInitialize; Override;

  Private
    dtmCopiaContaOrcamen  : TdtmCopiaContaOrcamen;
    _DbCompContasOrcamen  : TDbCompContasOrcamen;
    _DbContasOrcamen      : TDbContasOrcamen;
    _DbSaldoOrcado        : TDbSaldoOrcado;

    CtrlCompContasOrcamen : TCtrlCompContasOrcamen;

    FiPlanoOrc,
    FIdEmpresa,
    FiModalResult    : Integer;

    CdsSaldo         : TClientDataSet;
    CdsCompOri       : TClientDataSet;
    CdsContasOri     : TClientDataSet;
    CdsBuscaContaDes : TClientDataSet;

    FpgrStatusConta : TProgressBar;
    FpgrStatusComp  : TProgressBar;

    FMensagem        : TEdit;

    FCdsCCustoOri    : TClientDataSet;
    FCdsPatroOri     : TClientDataSet;
    FCdsPlanoPrevOri : TClientDataSet;
    FCdsAtivProjOri  : TClientDataSet;
    FCdsCRespOri     : TClientDataSet;

    FCdsCCustoDes    : TClientDataSet;
    FCdsPatroDes     : TClientDataSet;
    FCdsPlanoPrevDes : TClientDataSet;
    FCdsAtivProjDes  : TClientDataSet;
    FCdsCRespDes     : TClientDataSet;

    Function  SubstituiFormula( sFormulaOri,
                                sCodOri,
                                sCodDes         : String;
                                preNumDigFixInt : Integer ) : String;

    Function  SubstituiCodigo( sCodigo,
                               sCodOri,
                               sCodDes         : String;
                               preNumDigFixInt : Integer ) : String;

    Function  SubstituiNome( sNomeDest : String;
                             iLocal,
                             iTam      : Integer;
                             sCodDes   : String ) : String;

    Procedure DeletaCompContasOrcamen( pModulo : Integer;
                                       sCodigo : String );

    Procedure SetCdsCCustoOri( Const Value : TClientDataSet);
    Procedure SetCdsPatroOri( Const Value : TClientDataSet);
    Procedure SetCdsPlanoPrevOri( Const Value : TClientDataSet);
    Procedure SetCdsAtivProjOri( Const Value : TClientDataSet);
    Procedure SetCdsCRespOri( Const Value : TClientDataSet);

    Procedure SetCdsCCustoDes( Const Value : TClientDataSet);
    Procedure SetCdsPatroDes( Const Value : TClientDataSet);
    Procedure SetCdsPlanoPrevDes( Const Value : TClientDataSet);
    Procedure SetCdsAtivProjDes( Const Value : TClientDataSet);
    Procedure SetCdsCRespDes( Const Value : TClientDataSet);
    Procedure AtualizaSaldo( pContaDes  : String;
                             pContaOri  : String;
                             pPlanoOrc  : Integer;
                             pDataRefer : TDateTime );
  Public

    CdsInsCompDes    : TClientDataSet;
    CdsInsContasDes  : TClientDataSet;

    scodigo,
    snomeori,
    snomedes,
    sCodDes          : String;

    Constructor Create;  Override;
    Destructor  Destroy; Override;

    Function AplicaOperacaoContaOrcamen( Var pMensagem : String ) : Boolean;
    Function AplicaOperacaoCompDes : Boolean;

    Procedure AbreCds;
    Procedure TransfereContas( pedtIniOri,
                               pedtIniDes,
                               pedtIniConta,
                               pedtNomeOrigem,
                               pedtNomeDest,
                               pedtCCori,
                               pedtCCDes,
                               pdteData             : String;
                               pcbIniciais,
                               pcbTransfSaldo,
                               Pcbapartirdata       : Boolean;
                               pdblkCCustoDesStr    : String;
                               pdblkCCustoDesVal    : String;
                               pdblkAtivProjDesStr  : String;
                               pdblkAtivProjDesVal  : String;
                               pdblkPatroDesStr     : String;
                               pdblkPatroDesVal     : String;
                               pdblkPlanoPrevDesStr : String;
                               pdblkPlanoPrevDesVal : String;
                               pdblkCRespOriStr     : String;
                               pdblkCRespOriVal     : String;
                               pdblkCRespDesStr     : String;
                               pdblkCRespDesVal     : String;
                               pdblkAtivProjOriStr  : String;
                               pdblkAtivProjOriVal  : String;
                               pdblkCCustoOriStr    : String;
                               pdblkCCustoOriVal    : String;
                               pdblkPlanoPrevOriStr : String;
                               pdblkPlanoPrevOriVal : String;
                               pdblkPatroOriStr     : String;
                               pdblkPatroOriVal     : String;
                               preNumDigFixInt      : Integer;
                               Var pMensagem        : String );


    Property Mensagem         : TEdit          Read FMensagem         Write FMensagem;
    property IdEmpresa        : Integer        Read FIdEmpresa        Write FIdEmpresa;
    Property iModalResult     : Integer        Read FiModalResult     Write FiModalResult;
    Property iPlanoOrc        : Integer        Read FiPlanoOrc        Write FiPlanoOrc;

    Property pgrStatusConta   : TProgressBar   Read FpgrStatusConta   Write FPgrStatusConta;
    Property pgrStatusComp    : TProgressBar   Read FpgrStatusComp    Write FpgrStatusComp;

    Property CdsCCustoOri     : TClientDataSet Read FCdsCCustoOri     Write SetCdsCCustoOri;
    Property CdsPatroOri      : TClientDataSet Read FCdsPatroOri      Write SetCdsPatroOri;
    Property CdsPlanoPrevOri  : TClientDataSet Read FCdsPlanoPrevOri  Write SetCdsPlanoPrevOri;
    Property CdsAtivProjOri   : TClientDataSet Read FCdsAtivProjOri   Write SetCdsAtivProjOri;
    Property CdsCRespOri      : TClientDataSet Read FCdsCRespOri      Write SetCdsCRespOri;

    Property CdsCCustoDes     : TClientDataSet Read FCdsCCustoDes     Write SetCdsCCustoDes;
    Property CdsPatroDes      : TClientDataSet Read FCdsPatroDes      Write SetCdsPatroDes;
    Property CdsPlanoPrevDes  : TClientDataSet Read FCdsPlanoPrevDes  Write SetCdsPlanoPrevDes;
    Property CdsAtivProjDes   : TClientDataSet Read FCdsAtivProjDes   Write SetCdsAtivProjDes;
    Property CdsCRespDes      : TClientDataSet Read FCdsCRespDes      Write SetCdsCRespDes;
  End;

Implementation
//************************************************
Procedure TCtrlCopiaContaOrcamen.OnCreateAppServer;
Begin
  Inherited;

  pgrStatusConta  := TProgressBar.Create( Nil );
  pgrStatusComp   := TProgressBar.Create( Nil );

  CdsCCustoOri    := TClientDataSet.Create( Nil );
  CdsPatroOri     := TClientDataSet.Create( Nil );
  CdsPlanoPrevOri := TClientDataSet.Create( Nil );
  CdsAtivProjOri  := TClientDataSet.Create( Nil );
  CdsCRespOri     := TClientDataSet.Create( Nil );

  CdsCCustoDes    := TClientDataSet.Create( Nil );
  CdsPatroDes     := TClientDataSet.Create( Nil );
  CdsPlanoPrevDes := TClientDataSet.Create( Nil );
  CdsAtivProjDes  := TClientDataSet.Create( Nil );
  CdsCRespDes     := TClientDataSet.Create( Nil );
End;
//************************************************
Procedure TCtrlCopiaContaOrcamen.DoChangeDataBase;
Begin
  Inherited;

  _DbContasOrcamen.DatabaseName      := DataBaseName;
  _DbCompContasOrcamen.DatabaseName  := DataBaseName;
  _DbSaldoOrcado.DatabaseName        := DataBaseName;
End;
//************************************************
Constructor TCtrlCopiaContaOrcamen.Create;
Begin
  Inherited;

  CdsSaldo         := TClientDataSet.Create( Nil );
  CdsCompOri       := TClientDataSet.Create( Nil );
  CdsContasOri     := TClientDataSet.Create( Nil );

  CdsInsCompDes    := TClientDataSet.Create( Nil );
  CdsInsContasDes  := TClientDataSet.Create( Nil );
  CdsBuscaContaDes := TClientDataSet.Create( Nil );

  dtmCopiaContaOrcamen := TdtmCopiaContaOrcamen.Create( Nil );

  CtrlCompContasOrcamen := TCtrlCompContasOrcamen.Create;

  _DbCompContasOrcamen := TDbCompContasOrcamen.Create( Self );
  _DbContasOrcamen     := TDbContasOrcamen.Create( Self );
  _DbSaldoOrcado       := TDbSaldoOrcado.Create( Self );
End;
//************************************************
Destructor TCtrlCopiaContaOrcamen.Destroy;
Begin
  Inherited;
  dtmCopiaContaOrcamen.Free;
  _DbCompContasOrcamen.Free;
  _DbContasOrcamen.Free;
  _DbSaldoOrcado.Free;

  CtrlCompContasOrcamen.Free;

  If ( isAppServer ) Then Begin

    FreeCds( [ CdsCCustoOri,
               CdsPatroOri,
               CdsPlanoPrevOri,
               CdsAtivProjOri,
               CdsCRespOri,
               CdsCCustoDes,
               CdsPatroDes,
               CdsPlanoPrevDes,
               CdsAtivProjDes,
               CdsCRespDes ] );
  End;
End;
//************************************************
Procedure TCtrlCopiaContaOrcamen.AbreCds;
Begin

  With dtmCopiaContaOrcamen.qryCCustoOri Do Begin
    Prepare;
    ParamByName( 'IDEMPRESA' ).asInteger := idEmpresa;
    CdsCCustoOri.Data := Data;
  End;

  With dtmCopiaContaOrcamen.qryPatroOri Do Begin
    Prepare;
    CdsPatroOri.Data := Data;
  End;

  With dtmCopiaContaOrcamen.qryPlanoPrevOri Do Begin
    Prepare;
    CdsPlanoPrevOri.Data := Data;
  End;

  With dtmCopiaContaOrcamen.qryAtivProjOri Do Begin
    Prepare;
    ParamByName( 'IDPESSOA' ).asInteger := idEmpresa;
    CdsAtivProjOri.Data := Data;
  End;

  With dtmCopiaContaOrcamen.qryCRespOri Do Begin
    Prepare;
    ParamByName( 'IDPESSOA' ).asInteger := idEmpresa;
    CdsCRespOri.Data := Data;
  End;

  With dtmCopiaContaOrcamen.qryCCustoDes Do Begin
    Prepare;
    ParamByName( 'IDEMPRESA' ).asInteger := idEmpresa;
    CdsCCustoDes.Data := Data;
  End;

  With dtmCopiaContaOrcamen.qryPatroDes Do Begin
    Prepare;
    CdsPatroDes.Data := Data;
  End;

  With dtmCopiaContaOrcamen.qryPlanoPrevDes Do Begin
    Prepare;
    CdsPlanoPrevDes.Data := Data;
  End;

  With dtmCopiaContaOrcamen.qryAtivProjDes Do Begin
    Prepare;
    ParamByName( 'IDPESSOA' ).asInteger := idEmpresa;
    CdsAtivProjDes.Data := Data;
  End;

  With dtmCopiaContaOrcamen.qryCRespDes Do Begin
    Prepare;
    ParamByName( 'IDPESSOA' ).asInteger := idEmpresa;
    CdsCRespDes.Data := Data;
  End;
End;
//************************************************
Procedure TCtrlCopiaContaOrcamen.TransfereContas( pedtIniOri,
                                                  pedtIniDes,
                                                  pedtIniConta,
                                                  pedtNomeOrigem,
                                                  pedtNomeDest,
                                                  pedtCCori,
                                                  pedtCCDes,
                                                  pdteData             : String;
                                                  pcbIniciais,
                                                  pcbTransfSaldo,
                                                  Pcbapartirdata       : Boolean;
                                                  pdblkCCustoDesStr    : String;
                                                  pdblkCCustoDesVal    : String;
                                                  pdblkAtivProjDesStr  : String;
                                                  pdblkAtivProjDesVal  : String;
                                                  pdblkPatroDesStr     : String;
                                                  pdblkPatroDesVal     : String;
                                                  pdblkPlanoPrevDesStr : String;
                                                  pdblkPlanoPrevDesVal : String;
                                                  pdblkCRespOriStr     : String;
                                                  pdblkCRespOriVal     : String;
                                                  pdblkCRespDesStr     : String;
                                                  pdblkCRespDesVal     : String;
                                                  pdblkAtivProjOriStr  : String;
                                                  pdblkAtivProjOriVal  : String;
                                                  pdblkCCustoOriStr    : String;
                                                  pdblkCCustoOriVal    : String;
                                                  pdblkPlanoPrevOriStr : String;
                                                  pdblkPlanoPrevOriVal : String;
                                                  pdblkPatroOriStr     : String;
                                                  pdblkPatroOriVal     : String;
                                                  preNumDigFixInt      : Integer;
                                                  Var pMensagem        : String );
Var
  sCCDest,
  sCodigoOri,
  sCodigoDes,
  sNomeDestino : String;

  i            : Integer;

  SqlInsCompDes : TStringList;
Begin
  SqlInsCompDes := TStringList.Create;

  If ( pedtIniOri = '' ) Then Begin

    If ( pcbIniciais ) Then Begin

      pMensagem := 'Inicial da Conta de Origem não preenchida.';
    End Else Begin

      pMensagem := 'Final da Conta de Origem não preenchida.';
    End;

    Exit;
  End;

  If ( pedtIniDes = '' ) Then Begin

    If ( pcbIniciais ) Then Begin

      pMensagem := 'Inicial da Conta de Destino não preenchida.'
    End Else Begin

      pMensagem := 'Final da Conta de Destino não preenchida.';
    End;

    Exit;
  End;

  If ( pcbTransfSaldo ) And ( pcbaPartirData ) Then Begin

    If ( pdteData = '' ) Then Begin

      pMensagem := 'Apartir da Data da Copia não preenchida.';
      Exit;
    End;
  End;

  dtmCopiaContaOrcamen.qryContasOri.Prepare;

  If ( pcbIniciais ) Then
    dtmCopiaContaOrcamen.qryContasOri.ParamByName( 'IDCONTAORCAMEN' ).asString  := pedtIniOri + '%'
  Else
    dtmCopiaContaOrcamen.qryContasOri.ParamByName( 'IDCONTAORCAMEN' ).asString  := '%' + pedtIniOri;

  If ( Trim( pedtIniConta ) = '' ) Then Begin

    If ( pcbIniciais ) Then
      dtmCopiaContaOrcamen.qryContasOri.ParamByName( 'IDCONTAORCAMENI' ).asString  := pedtIniOri + '%'
    Else
      dtmCopiaContaOrcamen.qryContasOri.ParamByName( 'IDCONTAORCAMENI' ).asString  := '%' + pedtIniOri;

  End Else Begin

    dtmCopiaContaOrcamen.qryContasOri.ParamByName( 'IDCONTAORCAMENI' ).asString := Trim( pedtIniConta ) + '%';
  End;

  dtmCopiaContaOrcamen.qryContasOri.ParamByName( 'IDPLANOORCAMEN' ).asInteger := iPlanoOrc;

  CdsContasOri.Data := dtmCopiaContaOrcamen.qryContasOri.Data;
  {
    CdsContasOri.Data := GETDATAPACKET(
    'SELECT' + #13 +
    '   IDCONTAORCAMEN, IDPLANOORCAMEN,' + #13 +
    '   IDGRUPOORCAMEN, NOMECONTAORCAMEN,' + #13 +
    '   TIPOCALCREALIZADO, TIPOCALCORCADO,' + #13 +
    '   FORMULAREALIZADO, FORMULAORCADO,' + #13 +
    '   OBSERVACAO, VLRINFORMADOREAL,' + #13 +
    '   VLRINFORMADOORC, FLGCONTAMONETARIA, IDPESSOA,' + #13 +
    '   FLGSINALCONTA, FLGCALCORCADO,' + #13 +
    '   FLGCALCREAL, CODCENTRORESPON, FLGINFDIAMES,' + #13 +
    '   IDDATAVIEW, ORIGEMCMDV, FLGACUMULADO, FLGTRANSFSALDO,' + #13 +
    '   FLGATIVA, TO_CHAR(DATAATIVA,''DD/MM/YYYY'') AS DATAATIVA, TO_CHAR(DATAINATIVA,''DD/MM/YYYY'') AS DATAINATIVA,' + #13 +
    '   CODCENTROCUSTO, IDEMPRESA, UNIDNEGOC, IDPATRO, IDPLANOPREV' + #13 +
    'FROM' + #13 +
    '   CONTASORCAMEN' + #13 +
    'WHERE' + #13 +
    '   ( IDCONTAORCAMEN LIKE ''5555%'' ) AND' + #13 +
    '   ( IDCONTAORCAMEN LIKE ''5555%'' ) AND' + #13 +
    '   ( IDPLANOORCAMEN = 2 )' + #13 +
    'ORDER BY' + #13 +
    '   IDCONTAORCAMEN' );
  }
  If ( CdsContasOri.IsEmpty ) Then Begin

    If ( pcbIniciais ) Then
      pMensageM := 'Não foi encontrada nenhuma Conta Orçamentária com estas iniciais de Origem.'
    Else
      pMensageM := 'Não foi encontrada nenhuma Conta Orçamentária com este final de Origem.';

    Exit;
  End;

  pgrStatusConta.Position := 0;
  pgrStatusConta.Max      := CdsContasOri.RecordCount;
  pgrStatusComp.Position  := 0;

  CdsContasOri.First;
  imodalResult := 0;

  Try
    //Varre as contas orçamentárias
    While ( Not CdsContasOri.EOF ) Do Begin

      sNomeDestino := Trim( CdsContasOri.FieldByName( 'NOMECONTAORCAMEN' ).AsString );
      i := Pos( Trim( pedtNomeOrigem), sNomeDestino );

      If ( i <> 0 ) Then Begin

        sNomeDestino := SubstituiNome( sNomeDestino, i, Length( Trim( pedtNomeOrigem ) ), Trim( pedtNomeDest ) );
      End;

      sCodigoOri := CdsContasOri.FieldByName( 'IDCONTAORCAMEN' ).AsString;
      sCodigoDes := SubstituiCodigo( CdsContasOri.FieldByName( 'IDCONTAORCAMEN' ).AsString, pedtIniOri, pedtIniDes, preNumDigFixInt );

      dtmCopiaContaOrcamen.qryBuscaContaDes.Prepare;
      dtmCopiaContaOrcamen.qryBuscaContaDes.ParamByName( 'IDPLANOORCAMEN' ).asInteger := iPlanoOrc;
      dtmCopiaContaOrcamen.qryBuscaContaDes.ParamByName( 'IDCONTAORCAMEN' ).asString  := sCodigoDes;

      CdsBuscaContaDes.Data := dtmCopiaContaOrcamen.qryBuscaContaDes.Data;

      If ( Not CdsBuscaContaDes.isEmpty ) and ( imodalResult < 3 ) Then Begin
         scodigo  := sCodigoOri;
         snomeori := CdsContasOri.FieldByName( 'NOMECONTAORCAMEN' ).AsString;
         snomedes := CdsBuscaContaDes.FieldByName( 'NOMECONTAORCAMEN' ).AsString;
         sCoddes  := CdsBuscaContaDes.FieldByName( 'IDCONTAORCAMEN' ).AsString;

         // Ao atualizar a propriedade 'Mensagem', é chamado um método na tela principal
         // e esta atualiza a propriedade 'imodalResult'
         Mensagem.Text := 'Existe conta destino';
         Mensagem.Text := '';                       // Retiro o conteúdo anterior para forçar o onchange 
      End;

      If ( CdsBuscaContaDes.isEmpty ) Or
         ( iModalResult = 1 ) or
         ( iModalResult = 3 ) Then Begin

        // Alterar Conta e Excluir a Composicao se Existir
        If ( Not CdsBuscaContaDes.isEmpty ) Then Begin

          DeletaCompContasOrcamen( iPlanoOrc, sCodigoDes );
        End;

        //Insere a nova conta com as novas iniciais
        // Chave
        dtmCopiaContaOrcamen.qryInsContasDes.Prepare;
        dtmCopiaContaOrcamen.qryInsContasDes.ParamByName( 'IDCONTAORCAMEN' ).asString  := sCodigoDes;
        dtmCopiaContaOrcamen.qryInsContasDes.ParamByName( 'IDPLANOORCAMEN' ).asInteger := CdsContasOri.FieldByName( 'IDPLANOORCAMEN' ).asInteger;

        CdsInsContasDes.Data := dtmCopiaContaOrcamen.qryInsContasDes.Data;

        If ( CdsInsContasDes.IsEmpty ) Then Begin

          CdsInsContasDes.Insert;

        End Else Begin

          CdsInsContasDes.Edit;
        End;

        CdsInsContasDes.FieldByName( 'IDCONTAORCAMEN' ).asString    := sCodigoDes;
        CdsInsContasDes.FieldByName( 'IDPLANOORCAMEN' ).asInteger   := CdsContasOri.FieldByName( 'IDPLANOORCAMEN' ).asInteger;

        // Dados
        CdsInsContasDes.FieldByName( 'NOMECONTAORCAMEN' ).asString  := sNomeDestino;
        CdsInsContasDes.FieldByName( 'TIPOCALCREALIZADO' ).asString := CdsContasOri.FieldByName( 'TIPOCALCREALIZADO' ).asString;
        CdsInsContasDes.FieldByName( 'TIPOCALCORCADO' ).asString    := CdsContasOri.FieldByName( 'TIPOCALCORCADO' ).asString;

        If ( CdsContasOri.FieldByName( 'IDGRUPOORCAMEN' ).isNull ) Then Begin

          CdsInsContasDes.FieldByName( 'IDGRUPOORCAMEN' ).clear;
        End Else Begin

          CdsInsContasDes.FieldByName( 'IDGRUPOORCAMEN' ).asInteger := CdsContasOri.FieldByName('IDGRUPOORCAMEN' ).asInteger;
        End;

        If ( CdsContasOri.FieldByName( 'IDDATAVIEW' ).isNull ) Then Begin

          CdsInsContasDes.FieldByName( 'IDDATAVIEW' ).clear;
        End Else Begin

          CdsInsContasDes.FieldByName( 'IDDATAVIEW' ).asInteger := CdsContasOri.FieldByName( 'IDDATAVIEW' ).asInteger;
        end;

        If ( CdsContasOri.FieldByName( 'ORIGEMCMDV' ).isNull ) then begin

          CdsInsContasDes.FieldByName( 'ORIGEMCMDV' ).clear;
        end else begin

          CdsInsContasDes.FieldByName( 'ORIGEMCMDV' ).asInteger := CdsContasOri.FieldByName( 'ORIGEMCMDV' ).asInteger;
        end;

        if ( CdsContasOri.FieldByName( 'CODCENTRORESPON' ).isNull ) then begin

          CdsInsContasDes.FieldByName( 'CODCENTRORESPON' ).clear;
        end else begin

          CdsInsContasDes.FieldByName( 'CODCENTRORESPON' ).asString := CdsContasOri.FieldByName( 'CODCENTRORESPON' ).asString;
        end;

        if ( CdsContasOri.FieldByName( 'CODCENTROCUSTO' ).isNull ) then begin

          CdsInsContasDes.FieldByName( 'CODCENTROCUSTO' ).clear;
        end else begin

          if ( trim( pdblkCCustoDesStr ) <> '' ) then begin

            CdsInsContasDes.FieldByName( 'CODCENTROCUSTO' ).asString := pdblkCCustoDesStr;
          end else begin

            CdsInsContasDes.FieldByName( 'CODCENTROCUSTO' ).asString := CdsContasOri.FieldByName( 'CODCENTROCUSTO' ).asString;
          end;
        end;

        if ( CdsContasOri.FieldByName( 'UNIDNEGOC' ).isNull ) then begin

           CdsInsContasDes.FieldByName( 'UNIDNEGOC' ).clear;
        end else begin

          if ( trim( pdblkAtivProjDesStr ) <> '' ) then begin

            CdsInsContasDes.FieldByName( 'UNIDNEGOC' ).asInteger := StrToInt( pdblkAtivProjDesVal );
          end else begin

            CdsInsContasDes.FieldByName( 'UNIDNEGOC' ).asInteger := CdsContasOri.FieldByName( 'UNIDNEGOC' ).asInteger;
          end;
        end;

        if ( CdsContasOri.FieldByName( 'IDPATRO' ).isNull ) then begin

          CdsInsContasDes.FieldByName( 'IDPATRO' ).clear;
        end else begin

          if ( trim( pdblkPatroDesStr ) <> '' ) then begin

            CdsInsContasDes.FieldByName( 'IDPATRO' ).asInteger := StrToInt( pdblkPatroDesVal );
          end else begin

            CdsInsContasDes.FieldByName( 'IDPATRO' ).asInteger := CdsContasOri.FieldByName( 'IDPATRO' ).asInteger;
          end;
        end;

        if ( CdsContasOri.FieldByName( 'IDPLANOPREV' ).isNull ) then begin

           CdsInsContasDes.FieldByName( 'IDPLANOPREV' ).clear;
        end else begin

          if ( trim( pdblkPlanoPrevDesStr ) <> '' ) then begin

            CdsInsContasDes.FieldByName( 'IDPLANOPREV' ).asInteger := StrToInt( pdblkPlanoPrevDesVal );
          end else begin

            CdsInsContasDes.FieldByName( 'IDPLANOPREV' ).asInteger := CdsContasOri.FieldByName( 'IDPLANOPREV' ).asInteger;
          end;
        end;

        if ( CdsContasOri.FieldByName( 'IDEMPRESA' ).isNull ) then begin

          CdsInsContasDes.FieldByName( 'IDEMPRESA' ).clear;
        end else begin

          CdsInsContasDes.FieldByName( 'IDEMPRESA' ).asInteger := CdsContasOri.FieldByName( 'IDEMPRESA' ).asInteger;
        end;

        if ( CdsContasOri.FieldByName( 'IDPESSOA' ).isNull ) Then Begin

          CdsInsContasDes.FieldByName( 'IDPESSOA' ).clear;
        end else begin

          Try
            CdsInsContasDes.FieldByName( 'IDPESSOA' ).AsInteger := CdsContasOri.FieldByName( 'IDPESSOA' ).AsInteger;
          Except
            CdsInsContasDes.FieldByName( 'IDPESSOA' ).clear;
          End;
        end;

        if ( CdsContasOri.FieldByName( 'FORMULAREALIZADO' ).isNull ) then begin

          CdsInsContasDes.FieldByName( 'FORMULAREALIZADO' ).clear;
        end else begin

          CdsInsContasDes.FieldByName( 'FORMULAREALIZADO' ).asString := SubstituiFormula( CdsContasOri.FieldByName( 'FORMULAREALIZADO' ).asString, pedtIniOri, pedtIniDes, pReNumDigFixInt );
        end;

        if ( CdsContasOri.FieldByName( 'FORMULAORCADO' ).isNull ) then begin

          CdsInsContasDes.FieldByName( 'FORMULAORCADO' ).clear;
        end else begin

          CdsInsContasDes.FieldByName( 'FORMULAORCADO' ).asString := SubstituiFormula( CdsContasOri.FieldByName( 'FORMULAORCADO' ).asString, pedtIniOri, pedtIniDes, pReNumdigFixInt );
        end;

        if ( CdsContasOri.FieldByName( 'OBSERVACAO' ).isNull ) then begin

          CdsInsContasDes.FieldByName( 'OBSERVACAO' ).clear;
        end else begin

          CdsInsContasDes.FieldByName( 'OBSERVACAO' ).asString := CdsContasOri.FieldByName( 'OBSERVACAO' ).asString;
        end;

        if ( CdsContasOri.FieldByName( 'VLRINFORMADOREAL' ).isNull ) then begin

           CdsInsContasDes.FieldByName( 'VLRINFORMADOREAL' ).clear;
        end else begin

           CdsInsContasDes.FieldByName( 'VLRINFORMADOREAL' ).AsCurrency := CdsContasOri.FieldByName( 'VLRINFORMADOREAL' ).AsCurrency;
        end;

        if ( CdsContasOri.FieldByName( 'VLRINFORMADOORC' ).isNull ) then begin

           CdsInsContasDes.FieldByName( 'VLRINFORMADOORC' ).clear;
        end else begin

           CdsInsContasDes.FieldByName( 'VLRINFORMADOORC' ).AsCurrency := CdsContasOri.FieldByName( 'VLRINFORMADOORC' ).AsCurrency;
        end;

        if ( CdsContasOri.FieldByName( 'FLGCONTAMONETARIA' ).isNull ) then begin

          CdsInsContasDes.FieldByName( 'FLGCONTAMONETARIA' ).clear;
        end else begin

          CdsInsContasDes.FieldByName( 'FLGCONTAMONETARIA' ).asString := CdsContasOri.FieldByName( 'FLGCONTAMONETARIA' ).asString;
        end;

        if ( CdsContasOri.FieldByName( 'FLGSINALCONTA' ).isNull ) then begin

          CdsInsContasDes.FieldByName( 'FLGSINALCONTA' ).clear;
        end else begin

          CdsInsContasDes.FieldByName( 'FLGSINALCONTA' ).asString := CdsContasOri.FieldByName( 'FLGSINALCONTA' ).asString;
        end;

        if ( CdsContasOri.FieldByName( 'FLGCALCORCADO' ).isNull ) then begin

          CdsInsContasDes.FieldByName( 'FLGCALCORCADO' ).clear;
        end else begin

          CdsInsContasDes.FieldByName( 'FLGCALCORCADO' ).asString := CdsContasOri.FieldByName( 'FLGCALCORCADO' ).asString;
        end;

        if ( CdsContasOri.FieldByName( 'FLGCALCREAL' ).isNull ) then begin

          CdsInsContasDes.FieldByName( 'FLGCALCREAL' ).clear;
        end else begin

          CdsInsContasDes.FieldByName( 'FLGCALCREAL' ).asString := CdsContasOri.FieldByName( 'FLGCALCREAL' ).asString;
        end;

        if ( CdsContasOri.FieldByName( 'FLGINFDIAMES' ).isNull ) then begin

          CdsInsContasDes.FieldByName( 'FLGINFDIAMES' ).clear;
        end else begin

          CdsInsContasDes.FieldByName( 'FLGINFDIAMES' ).asString := CdsContasOri.FieldByName( 'FLGINFDIAMES' ).asString;
        end;

        if ( CdsContasOri.FieldByName( 'FLGACUMULADO' ).isNull ) then begin

          CdsInsContasDes.FieldByName( 'FLGACUMULADO' ).clear;
        end else begin

          CdsInsContasDes.FieldByName( 'FLGACUMULADO' ).asString := CdsContasOri.FieldByName( 'FLGACUMULADO' ).asString;
        end;

        if ( CdsContasOri.FieldByName( 'FLGTRANSFSALDO' ).isNull ) then begin

          CdsInsContasDes.FieldByName( 'FLGTRANSFSALDO' ).clear;
        end else begin

          CdsInsContasDes.FieldByName( 'FLGTRANSFSALDO' ).asString := CdsContasOri.FieldByName( 'FLGTRANSFSALDO' ).asString;
        end;

        if ( CdsContasOri.FieldByName( 'FLGATIVA' ).isNull ) then begin

          CdsInsContasDes.FieldByName( 'FLGATIVA' ).clear;
        end else begin

          CdsInsContasDes.FieldByName( 'FLGATIVA' ).asString := CdsContasOri.FieldByName( 'FLGATIVA' ).asString;
        end;

        if ( CdsContasOri.FieldByName( 'DATAATIVA' ).isNull ) then begin

          CdsInsContasDes.FieldByName( 'DATAATIVA' ).clear;
        end else begin

          Try
            CdsInsContasDes.FieldByName( 'DATAATIVA' ).asDateTime := CdsContasOri.FieldByName( 'DATAATIVA' ).asDateTime;
          Except
            CdsInsContasDes.FieldByName( 'DATAATIVA' ).clear;
          End;
        End;

        if ( CdsContasOri.FieldByName( 'DATAINATIVA' ).isNull ) then begin

          CdsInsContasDes.FieldByName( 'DATAINATIVA' ).clear;
        end else begin

          Try
            CdsInsContasDes.FieldByName( 'DATAINATIVA' ).asDateTime := CdsContasOri.FieldByName( 'DATAINATIVA' ).asDateTime;
          Except
            CdsInsContasDes.FieldByName( 'DATAINATIVA' ).clear;
          End;
        end;

        CdsInsContasDes.Post;

        If ( AplicaOperacaoContaOrcamen( pMensagem ) ) Then Begin

          If ( pcbTransfSaldo ) Then Begin

            //Transfere o Saldo
            AtualizaSaldo( sCodigoDes,
                           CdsContasOri.FieldByName( 'IDCONTAORCAMEN' ).AsString,
                           CdsContasOri.FieldByName( 'IDPLANOORCAMEN' ).asInteger,
                           StrToDateTime( pdteData + ' 00:00:00' ) );
          End;

          dtmCopiaContaOrcamen.qryCompOri.Prepare;
          dtmCopiaContaOrcamen.qryCompOri.ParamByName( 'IDCONTAORCAMEN' ).asString  := CdsContasOri.FieldByName( 'IDCONTAORCAMEN' ).asString;
          dtmCopiaContaOrcamen.qryCompOri.ParamByName( 'IDPLANOORCAMEN' ).asInteger := CdsContasOri.FieldByName( 'IDPLANOORCAMEN' ).asInteger;
          CdsCompOri.Data := dtmCopiaContaOrcamen.qryCompOri.Data;

          pgrStatusComp.Position := 0;
          pgrStatusComp.Max      := CdsCompOri.RecordCount;

          CdsCompOri.First;

          //Varre a composição da conta orçamentária corrente
          While ( Not CdsCompOri.EOF ) Do Begin

            {
            SqlInsCompDes.Clear;
            SqlInsCompDes.Add( 'INSERT INTO' );
            SqlInsCompDes.Add( '  COMPCONTASORCAMEN' );
            SqlInsCompDes.Add( '  ( IDCOMPCONTASORC, IDCONTACONDRES, IDCONTACONDFIM, IDCONTACONDINI,   IDCONTAREFREAL,' );
            SqlInsCompDes.Add( '    PERCCONTAREFREA, IDPLANOORCAMEN, IDCONTAORCAMEN, IDPESSOA,         PLACONTA,' );
            SqlInsCompDes.Add( '    PLANO,           CODTIPRECDES,   RECPAG,         IDCONTAREFORCADO, PERCCONTAREFORC,' );
            SqlInsCompDes.Add( '    CONDICAO,        TIPOCONDINI,    TIPOCONDRES,    VLRCONDINI,       VLRCONDRES,' );
            SqlInsCompDes.Add( '    CODCENTRORESPON, UNIDNEGOC,      CODCENTROCUSTO, IDEMPRESA,        IDPLANOPREV,' );
            SqlInsCompDes.Add( '    IDPATRO )' );
            SqlInsCompDes.Add( 'VALUES (' );

            SqlInsCompDes.Add( IntToStr( GetSequence('COMPCONTASORCAMEN') ) + ', ' );

            If CdsCompOri.FieldByName( 'IDCONTACONDRES' ).isNull Then Begin

              SqlInsCompDes.Add( 'Null, ' );
            End Else Begin

              SqlInsCompDes.Add( QuotedStr( SubstituiCodigo( CdsCompOri.FieldByName( 'IDCONTACONDRES' ).asString, pedtIniOri, pedtIniDes, preNumDigFixInt ) ) + ',' );
            End;

            if CdsCompOri.FieldByName( 'IDCONTACONDFIM' ).isNull Then begin

              SqlInsCompDes.Add( 'Null, ' );
            end else begin

              SqlInsCompDes.Add( QuotedStr( SubstituiCodigo(CdsCompOri.FieldByName( 'IDCONTACONDFIM' ).asString, pedtIniOri, pedtIniDes, preNumDigFixInt ) ) + ',' );
            end;

            if CdsCompOri.FieldByName( 'IDCONTACONDINI' ).isNull Then begin

              SqlInsCompDes.Add( 'Null, ' );
            end else begin

              SqlInsCompDes.Add( QuotedStr( SubstituiCodigo(CdsCompOri.FieldByName( 'IDCONTACONDINI' ).asString, pedtIniOri, pedtIniDes, preNumDigFixInt ) ) + ',' );
            end;

            if CdsCompOri.FieldByName( 'IDCONTAREFREAL' ).isNull Then begin

              SqlInsCompDes.Add( 'Null, ' );
              SqlInsCompDes.Add( 'Null, ' );
            end else begin

              SqlInsCompDes.Add( QuotedStr( SubstituiCodigo( CdsCompOri.FieldByName( 'IDCONTAREFREAL' ).asString, pedtIniOri, pedtIniDes, preNumDigFixInt ) ) + ',' );
              SqlInsCompDes.Add( FloatToStr( CdsCompOri.FieldByName( 'PERCCONTAREFREA' ).asFloat ) + ',' );
            end;

            SqlInsCompDes.Add( IntToStr( CdsCompOri.FieldByName( 'IDPLANOORCAMEN' ).asInteger ) + ',' );
            SqlInsCompDes.Add( QuotedStr( sCodigoDes ) + ',' );

            if CdsCompOri.FieldByName( 'IDPESSOA' ).isNull Then begin

              SqlInsCompDes.Add( 'Null, ' );
            end else begin

              SqlInsCompDes.Add( IntToStr( CdsCompOri.FieldByName( 'IDPESSOA' ).asInteger ) + ',' );
            end;

            if CdsCompOri.FieldByName( 'PLACONTA' ).isNull Then begin

              SqlInsCompDes.Add( 'Null, ' );
              SqlInsCompDes.Add( 'Null, ' );
            end else begin
               if ( trim( pedtCCOri ) <> '' ) and ( trim( pedtCCDes ) <> '' ) Then begin

                  sCCDest := trim( CdsCompOri.FieldByName( 'PLACONTA' ).asString);
                  i:= Pos(trim( pedtCCOri ), sCCDest );

                  If i <> 0 Then begin
                     sCCDest := SubstituiNome(sCCDest, i, length(trim( pedtCCOri )), trim( pedtCCDes ));
                  end;

                  SqlInsCompDes.Add( QuotedStr( sCCDest ) + ',' );       //                     placonta
               end else begin

                 SqlInsCompDes.Add( QuotedStr( CdsCompOri.FieldByName( 'PLACONTA' ).asString ) + ',' ); //        placonta
               end;

              SqlInsCompDes.Add( IntToStr( CdsCompOri.FieldByName( 'PLANO' ).asInteger ) + ',' );
            end;

            if CdsCompOri.FieldByName( 'CODTIPRECDES' ).isNull Then begin

              SqlInsCompDes.Add( 'Null, ' );
            end else begin

              SqlInsCompDes.Add( QuotedStr( CdsCompOri.FieldByName( 'CODTIPRECDES' ).asString ) + ',' );
            end;

            if CdsCompOri.FieldByName( 'RECPAG' ).isNull Then begin

              SqlInsCompDes.Add( 'Null, ' );
            end else begin

              SqlInsCompDes.Add( QuotedStr( CdsCompOri.FieldByName( 'RECPAG' ).asString ) + ',' );
            end;

            if CdsCompOri.FieldByName( 'IDCONTAREFORCADO' ).isNull Then begin

              SqlInsCompDes.Add( 'Null, ' );
              SqlInsCompDes.Add( 'Null, ' );
            end else begin

              SqlInsCompDes.Add( QuotedStr( SubstituiCodigo( CdsCompOri.FieldByName( 'IDCONTAREFORCADO' ).asString, pedtIniOri, pedtIniDes, preNumDigFixInt ) ) + ',' );
              SqlInsCompDes.Add( FloatToStr( CdsCompOri.FieldByName( 'PERCCONTAREFORC' ).asFloat ) + ',' );
            end;

            if CdsCompOri.FieldByName( 'CONDICAO' ).isNull Then begin

              SqlInsCompDes.Add( 'Null, ' );
            end else begin

              SqlInsCompDes.Add( QuotedStr( CdsCompOri.FieldByName( 'CONDICAO' ).asString ) + ',' );
            end;

            if CdsCompOri.FieldByName( 'TIPOCONDINI' ).isNull Then begin

              SqlInsCompDes.Add( 'Null, ' );
            end else begin

              SqlInsCompDes.Add( QuotedStr( StringReplace( CdsCompOri.FieldByName( 'TIPOCONDINI' ).asString, #13, '', [rfReplaceAll, rfIgnoreCase]) ) + ',' );
            end;

            if CdsCompOri.FieldByName( 'TIPOCONDRES' ).isNull Then begin

              SqlInsCompDes.Add( 'Null, ' );
            end else begin

              SqlInsCompDes.Add( QuotedStr( StringReplace( CdsCompOri.FieldByName( 'TIPOCONDRES' ).asString, #13, '', [rfReplaceAll, rfIgnoreCase]) ) + ',' );
            end;

            if CdsCompOri.FieldByName( 'VLRCONDINI' ).isNull Then begin

              SqlInsCompDes.Add( 'Null, ' );
            end else begin

              SqlInsCompDes.Add( FloatToStr( CdsCompOri.FieldByName( 'VLRCONDINI' ).asFloat ) + ',' );
            end;

            if CdsCompOri.FieldByName( 'VLRCONDRES' ).isNull Then begin

              SqlInsCompDes.Add( 'Null, ' );
            end else begin

              SqlInsCompDes.Add( FloatToStr( CdsCompOri.FieldByName( 'VLRCONDRES' ).asFloat ) + ',' );
            end;

            //Campos do Filtro
            if CdsCompOri.FieldByName( 'CODCENTRORESPON' ).isNull Then begin

              SqlInsCompDes.Add( 'Null, ' );
            end else begin
               if ( pdblkCRespOriStr <> '' ) Then begin
                  if CdsCompOri.FieldByName( 'CODCENTRORESPON' ).asString = pdblkCRespOriVal Then begin

                     if ( pdblkCRespDesStr <> '' ) Then begin

                       SqlInsCompDes.Add( QuotedStr( pdblkCRespDesVal ) + ',' );
                     end else begin

                       SqlInsCompDes.Add( QuotedStr( CdsCompOri.FieldByName( 'CODCENTRORESPON' ).asString ) + ',' );
                     end;
                  end else begin

                    SqlInsCompDes.Add( QuotedStr( CdsCompOri.FieldByName( 'CODCENTRORESPON' ).asString ) + ',' );
                  end;
               end else begin

                 SqlInsCompDes.Add( QuotedStr( CdsCompOri.FieldByName( 'CODCENTRORESPON' ).asString ) + ',' );
               end;
            end;

            if CdsCompOri.FieldByName( 'UNIDNEGOC' ).isNull Then begin

              SqlInsCompDes.Add( 'Null, ' );
            end else begin
               if ( pdblkAtivProjOriStr <> '' ) Then begin

                  if CdsCompOri.FieldByName( 'UNIDNEGOC' ).asInteger = StrToInt( pdblkAtivProjOriVal ) Then begin

                     if ( pdblkAtivProjDesStr <> '' ) Then begin

                       SqlInsCompDes.Add( pdblkAtivProjDesVal + ',' );
                     end;
                  end else begin

                    SqlInsCompDes.Add( IntToStr( CdsCompOri.FieldByName( 'UNIDNEGOC' ).asInteger ) + ',' );
                  end;
               end else begin

                 SqlInsCompDes.Add( IntToStr( CdsCompOri.FieldByName( 'UNIDNEGOC' ).asInteger ) + ',' );
               end;
            end;

            if CdsCompOri.FieldByName( 'CODCENTROCUSTO' ).isNull Then begin

              SqlInsCompDes.Add( 'Null, ' );
              SqlInsCompDes.Add( 'Null, ' );
            end else begin
               if ( pdblkCCustoOriStr <> '' ) Then begin
                  if CdsCompOri.FieldByName( 'CODCENTROCUSTO' ).asString = pdblkCCustoOriVal Then begin
                     if ( pdblkCCustoDesStr <> '' ) Then begin

                        SqlInsCompDes.Add( QuotedStr( pdblkCCustoDesVal ) + ',' );
                        SqlInsCompDes.Add( IntToStr( sistema.idEmpresa ) + ',' );
                     end;
                  end else begin
                     SqlInsCompDes.Add( QuotedStr( CdsCompOri.FieldByName( 'CODCENTROCUSTO' ).asString ) + ',' );
                     SqlInsCompDes.Add( IntToStr( sistema.idEmpresa ) + ',' );
                  end;
               end else begin

                 SqlInsCompDes.Add( QuotedStr( CdsCompOri.FieldByName( 'CODCENTROCUSTO' ).asString ) + ',' );
                 SqlInsCompDes.Add( IntToStr( sistema.idEmpresa ) + ',' );
               end;
            end;

            if CdsCompOri.FieldByName( 'IDPLANOPREV' ).isNull Then begin

              SqlInsCompDes.Add( 'Null, ' );
            end else begin
              if ( pdblkPlanoPrevOriStr <> '' ) Then begin
                if CdsCompOri.FieldByName( 'IDPLANOPREV' ).asInteger = StrToInt( pdblkPlanoPrevOriVal ) Then begin
                  if ( pdblkPlanoPrevDesStr <> '' )Then begin

                    SqlInsCompDes.Add( pdblkPlanoPrevDesVal + ',' );
                  end;
                end else begin

                  SqlInsCompDes.Add( IntToStr( CdsCompOri.FieldByName( 'IDPLANOPREV' ).asInteger ) + ',' );
                end;
              end else begin

                SqlInsCompDes.Add( IntToStr( CdsCompOri.FieldByName( 'IDPLANOPREV' ).asInteger ) + ',' );
              end;
            end;

            if CdsCompOri.FieldByName( 'IDPATRO' ).isNull Then begin

              SqlInsCompDes.Add( 'Null' );
            end else begin
              if ( pdblkPatroOriStr <> '' ) Then begin
                if CdsCompOri.FieldByName( 'IDPATRO' ).asInteger = StrToInt( pdblkPatroOriVal ) Then begin
                  if ( pdblkPatroDesStr <> '' ) Then begin

                    SqlInsCompDes.Add( pdblkPatroDesVal );
                  end;
                end else begin

                  SqlInsCompDes.Add( IntToStr( CdsCompOri.FieldByName( 'IDPATRO' ).asInteger ) );
                end;
              end else begin

                SqlInsCompDes.Add( IntToStr( CdsCompOri.FieldByName( 'IDPATRO' ).asInteger ) );
              end;
            end;

            SqlInsCompDes.Add( '  )' );
            SqlInsCompDes.savetofile('c:\SqlInsCompDes' + FormatCurr( '000', pgrStatusComp.Position ) + '.sql');

            ExecSQL( SqlInsCompDes.Text );
            }

            //Insere a Composição da Conta orçamentária corrente
            _DbCompContasOrcamen.IDCOMPCONTASORC.AsFloat := -1;
            CdsInsCompDes.Data := GetDataPacket( _DbCompContasOrcamen.SSqlSelect );

            If ( CdsInsCompDes.IsEmpty ) Then Begin

              CdsInsCompDes.Insert;
            End Else Begin

              CdsInsCompDes.Edit;
            End;

            CdsInsCompDes.FieldByName( 'IDPLANOORCAMEN' ).asInteger  := CdsCompOri.FieldByName( 'IDPLANOORCAMEN' ).asInteger;
            CdsInsCompDes.FieldByName( 'IDCONTAORCAMEN' ).asString   := sCodigoDes;

            if CdsCompOri.FieldByName( 'IDPESSOA' ).isNull Then begin
               CdsInsCompDes.FieldByName( 'IDPESSOA' ).clear;
            end else begin
               CdsInsCompDes.FieldByName( 'IDPESSOA' ).asInteger := CdsCompOri.FieldByName( 'IDPESSOA' ).asInteger;
            end;

            if CdsCompOri.FieldByName( 'IDCONTACONDRES' ).isNull Then begin
               CdsInsCompDes.FieldByName( 'IDCONTACONDRES' ).clear;
            end else begin
               CdsInsCompDes.FieldByName( 'IDCONTACONDRES' ).asString := SubstituiCodigo( CdsCompOri.FieldByName( 'IDCONTACONDRES' ).asString, pedtIniOri, pedtIniDes, preNumDigFixInt );

            end;

            if CdsCompOri.FieldByName( 'IDCONTACONDFIM' ).isNull Then begin
               CdsInsCompDes.FieldByName( 'IDCONTACONDFIM' ).clear;
            end else begin
               CdsInsCompDes.FieldByName( 'IDCONTACONDFIM' ).asString := SubstituiCodigo(CdsCompOri.FieldByName( 'IDCONTACONDFIM' ).asString, pedtIniOri, pedtIniDes, preNumDigFixInt );
            end;

            if CdsCompOri.FieldByName( 'IDCONTACONDINI' ).isNull Then begin
               CdsInsCompDes.FieldByName( 'IDCONTACONDINI' ).clear;
            end else begin
               CdsInsCompDes.FieldByName( 'IDCONTACONDINI' ).asString := SubstituiCodigo(CdsCompOri.FieldByName( 'IDCONTACONDINI' ).asString, pedtIniOri, pedtIniDes, preNumDigFixInt );
            end;

            if CdsCompOri.FieldByName( 'PLACONTA' ).isNull Then begin
               CdsInsCompDes.FieldByName( 'PLACONTA' ).clear;
               CdsInsCompDes.FieldByName( 'PLANO' ).clear;
            end else begin
               if ( trim( pedtCCOri ) <> '' ) and ( trim( pedtCCDes ) <> '' ) Then begin
                  sCCDest := trim( CdsCompOri.FieldByName( 'PLACONTA' ).asString);
                  i:= Pos(trim( pedtCCOri ), sCCDest );
                  If i <> 0 Then begin
                     sCCDest := SubstituiNome(sCCDest, i, length(trim( pedtCCOri )), trim( pedtCCDes ));
                  end;
                  CdsInsCompDes.FieldByName( 'PLACONTA' ).asString := sCCDest;
               end else begin
                  CdsInsCompDes.FieldByName( 'PLACONTA' ).asString := CdsCompOri.FieldByName( 'PLACONTA' ).asString;
               end;
               CdsInsCompDes.FieldByName( 'PLANO' ).asInteger   := CdsCompOri.FieldByName( 'PLANO' ).asInteger;
            end;

            if CdsCompOri.FieldByName( 'CODTIPRECDES' ).isNull Then begin
               CdsInsCompDes.FieldByName( 'CODTIPRECDES' ).clear;
            end else begin
               CdsInsCompDes.FieldByName( 'CODTIPRECDES' ).asString := CdsCompOri.FieldByName( 'CODTIPRECDES' ).asString;
            end;

            if CdsCompOri.FieldByName( 'RECPAG' ).isNull Then begin
               CdsInsCompDes.FieldByName( 'RECPAG' ).clear;
            end else begin
               CdsInsCompDes.FieldByName( 'RECPAG' ).asString := CdsCompOri.FieldByName( 'RECPAG' ).asString;
            end;

            if CdsCompOri.FieldByName( 'IDCONTAREFORCADO' ).isNull Then begin
               CdsInsCompDes.FieldByName( 'IDCONTAREFORCADO' ).clear;
               CdsInsCompDes.FieldByName( 'PERCCONTAREFORC' ).clear;
            end else begin
               CdsInsCompDes.FieldByName( 'IDCONTAREFORCADO' ).asString := SubstituiCodigo( CdsCompOri.FieldByName( 'IDCONTAREFORCADO' ).asString, pedtIniOri, pedtIniDes, preNumDigFixInt );
               CdsInsCompDes.FieldByName( 'PERCCONTAREFORC' ).AsCurrency   := CdsCompOri.FieldByName( 'PERCCONTAREFORC' ).AsCurrency;
            end;

            if CdsCompOri.FieldByName( 'IDCONTAREFREAL' ).isNull Then begin
               CdsInsCompDes.FieldByName( 'IDCONTAREFREAL' ).clear;
               CdsInsCompDes.FieldByName( 'PERCCONTAREFREA' ).clear;
            end else begin
               CdsInsCompDes.FieldByName( 'IDCONTAREFREAL' ).asString  := SubstituiCodigo( CdsCompOri.FieldByName( 'IDCONTAREFREAL' ).asString, pedtIniOri, pedtIniDes, preNumDigFixInt );
               CdsInsCompDes.FieldByName( 'PERCCONTAREFREA' ).AsCurrency  := CdsCompOri.FieldByName( 'PERCCONTAREFREA' ).AsCurrency;
            end;

            if CdsCompOri.FieldByName( 'CONDICAO' ).isNull Then begin
               CdsInsCompDes.FieldByName( 'CONDICAO' ).clear;
            end else begin
               CdsInsCompDes.FieldByName( 'CONDICAO' ).asString :=   StringReplace( CdsCompOri.FieldByName( 'CONDICAO' ).asString, #39, '', [rfReplaceAll, rfIgnoreCase] );
            end;

            if CdsCompOri.FieldByName( 'TIPOCONDINI' ).isNull Then begin
               CdsInsCompDes.FieldByName( 'TIPOCONDINI' ).clear;
            end else begin

              CdsInsCompDes.FieldByName( 'TIPOCONDINI' ).asString := StringReplace( CdsCompOri.FieldByName( 'TIPOCONDINI' ).asString, #13, '', [rfReplaceAll, rfIgnoreCase]);
            end;

            if CdsCompOri.FieldByName( 'TIPOCONDRES' ).isNull Then begin

               CdsInsCompDes.FieldByName( 'TIPOCONDRES' ).clear;
            end else begin

               CdsInsCompDes.FieldByName( 'TIPOCONDRES' ).asString := StringReplace( CdsCompOri.FieldByName( 'TIPOCONDRES' ).asString, #13, '', [rfReplaceAll, rfIgnoreCase]);
            end;

            if CdsCompOri.FieldByName( 'VLRCONDINI' ).isNull Then begin
               CdsInsCompDes.FieldByName( 'VLRCONDINI' ).clear;
            end else begin
               CdsInsCompDes.FieldByName( 'VLRCONDINI' ).AsCurrency := CdsCompOri.FieldByName( 'VLRCONDINI' ).AsCurrency;
            end;

            if CdsCompOri.FieldByName( 'VLRCONDRES' ).isNull Then begin
               CdsInsCompDes.FieldByName( 'VLRCONDRES' ).clear;
            end else begin
               CdsInsCompDes.FieldByName( 'VLRCONDRES' ).AsCurrency := CdsCompOri.FieldByName( 'VLRCONDRES' ).AsCurrency;
            end;

            //Campos do Filtro
            if CdsCompOri.FieldByName( 'CODCENTRORESPON' ).isNull Then begin
               CdsInsCompDes.FieldByName( 'CODCENTRORESPON' ).clear;
            end else begin
               if ( pdblkCRespOriStr <> '' ) Then begin
                  if CdsCompOri.FieldByName( 'CODCENTRORESPON' ).asString = pdblkCRespOriVal Then begin
                     if ( pdblkCRespDesStr <> '' ) Then begin
                        CdsInsCompDes.FieldByName( 'CODCENTRORESPON' ).asString := pdblkCRespDesVal;
                     end else begin
                        CdsInsCompDes.FieldByName( 'CODCENTRORESPON' ).asString := CdsCompOri.FieldByName( 'CODCENTRORESPON' ).asString;
                     end;
                  end else begin
                     CdsInsCompDes.FieldByName( 'CODCENTRORESPON' ).asString := CdsCompOri.FieldByName( 'CODCENTRORESPON' ).asString;
                  end;
               end else begin
                  CdsInsCompDes.FieldByName( 'CODCENTRORESPON' ).asString := CdsCompOri.FieldByName( 'CODCENTRORESPON' ).asString;
               end;
            end;

            if CdsCompOri.FieldByName( 'UNIDNEGOC' ).isNull Then begin
               CdsInsCompDes.FieldByName( 'UNIDNEGOC' ).clear;
            end else begin
               if ( pdblkAtivProjOriStr <> '' ) Then begin

                  if CdsCompOri.FieldByName( 'UNIDNEGOC' ).asInteger = StrToInt( pdblkAtivProjOriVal ) Then begin

                     if ( pdblkAtivProjDesStr <> '' ) Then begin

                        CdsInsCompDes.FieldByName( 'UNIDNEGOC' ).asInteger := StrToInt( pdblkAtivProjDesVal );
                     end;
                  end else begin
                     CdsInsCompDes.FieldByName( 'UNIDNEGOC' ).asInteger := CdsCompOri.FieldByName( 'UNIDNEGOC' ).asInteger;
                  end;
               end else begin
                  CdsInsCompDes.FieldByName( 'UNIDNEGOC' ).asInteger := CdsCompOri.FieldByName( 'UNIDNEGOC' ).asInteger;
               end;
            end;

            if CdsCompOri.FieldByName( 'CODCENTROCUSTO' ).isNull Then begin
               CdsInsCompDes.FieldByName( 'CODCENTROCUSTO' ).clear;
               CdsInsCompDes.FieldByName( 'IDEMPRESA' ).clear;
            end else begin
               if ( pdblkCCustoOriStr <> '' ) Then begin
                  if CdsCompOri.FieldByName( 'CODCENTROCUSTO' ).asString = pdblkCCustoOriVal Then begin
                     if ( pdblkCCustoDesStr <> '' ) Then begin
                        CdsInsCompDes.FieldByName( 'CODCENTROCUSTO' ).asString := pdblkCCustoDesVal;
                        CdsInsCompDes.FieldByName( 'IDEMPRESA' ).asInteger     := idEmpresa;
                     end;
                  end else begin
                     CdsInsCompDes.FieldByName( 'CODCENTROCUSTO' ).asString := CdsCompOri.FieldByName( 'CODCENTROCUSTO' ).asString;
                     CdsInsCompDes.FieldByName( 'IDEMPRESA' ).asInteger     := idEmpresa;
                  end;
               end else begin
                  CdsInsCompDes.FieldByName( 'CODCENTROCUSTO' ).asString := CdsCompOri.FieldByName( 'CODCENTROCUSTO' ).asString;
                  CdsInsCompDes.FieldByName( 'IDEMPRESA' ).asInteger     := idEmpresa;
               end;
            end;

            if CdsCompOri.FieldByName( 'IDPLANOPREV' ).isNull Then begin
               CdsInsCompDes.FieldByName( 'IDPLANOPREV' ).clear;
            end else begin
               if ( pdblkPlanoPrevOriStr <> '' ) Then begin
                  if CdsCompOri.FieldByName( 'IDPLANOPREV' ).asInteger = StrToInt( pdblkPlanoPrevOriVal ) Then begin
                     if ( pdblkPlanoPrevDesStr <> '' )Then begin
                        CdsInsCompDes.FieldByName( 'IDPLANOPREV' ).asInteger := StrToInt( pdblkPlanoPrevDesVal );
                     end;
                  end else begin
                     CdsInsCompDes.FieldByName( 'IDPLANOPREV' ).asInteger := CdsCompOri.FieldByName( 'IDPLANOPREV' ).asInteger;
                  end;
               end else begin
                  CdsInsCompDes.FieldByName( 'IDPLANOPREV' ).asInteger := CdsCompOri.FieldByName( 'IDPLANOPREV' ).asInteger;
               end;
            end;

            if CdsCompOri.FieldByName( 'IDPATRO' ).isNull Then begin
               CdsInsCompDes.FieldByName( 'IDPATRO' ).clear;
            end else begin
               if ( pdblkPatroOriStr <> '' ) Then begin
                  if CdsCompOri.FieldByName( 'IDPATRO' ).asInteger = StrToInt( pdblkPatroOriVal ) Then begin
                     if ( pdblkPatroDesStr <> '' ) Then begin
                        CdsInsCompDes.FieldByName( 'IDPATRO' ).asInteger := StrToInt( pdblkPatroDesVal );
                     end;
                  end else begin
                     CdsInsCompDes.FieldByName( 'IDPATRO' ).asInteger := CdsCompOri.FieldByName( 'IDPATRO' ).asInteger;
                  end;
               end else begin
                  CdsInsCompDes.FieldByName( 'IDPATRO' ).asInteger := CdsCompOri.FieldByName( 'IDPATRO' ).asInteger;
               end;
            end;

            CdsInsCompDes.Post;

            AplicaOperacaoCompDes;

            CdsCompOri.Next;
            pgrStatusComp.Position := pgrStatusComp.Position + 1;
          End;
        End;

        If ( pMensagem <> '' ) Then Begin

          Abort;
        End;
      end;

      CdsContasOri.Next;
      pgrStatusConta.Position := pgrStatusConta.Position + 1;
    end;

    pMensagem := 'Cópia das Contas Orçamentárias realizada com sucesso.'
  Except
    On E : Exception Do Begin
      Rollback;
      pMensagem := 'Foram detectados problemas na cópia das Contas Orçamentárias.' + #13 + #10 +
                   pMensagem + #13 + #10 +
                   E.Message;
    End;
  End;

  SqlInsCompDes.Free;
End;
//************************************************
Function TCtrlCopiaContaOrcamen.SubstituiFormula(sFormulaOri,
                                                 sCodOri,
                                                 sCodDes         : String;
                                                 preNumDigFixInt : Integer ) : String;
var
  i,
  iFinal,
  iRef   : integer;
begin

  sFormulaOri := trim(sFormulaOri);
  if pos(sCodOri,sFormulaOri) <> 0 Then begin
    iFinal   := length(sFormulaOri);
    for i := 1 to iFinal do begin
      //iRef := (StrToInt(FloatToStr(reNumDigFix.Value)) + i);
      iRef := preNumDigFixInt + i;
      if (Copy(sFormulaOri, iRef, length(sCodOri)) = sCodOri) and
        (Copy(sFormulaOri, (i-1), 1) = 'C' ) and ((i-1) > 0) Then begin
        Delete(sFormulaOri, iRef, length(sCodOri));
        Insert(sCodDes, sFormulaOri, iRef);
      end;
    end;
  end;
  result := sFormulaOri;
end;
//************************************************
Function TCtrlCopiaContaOrcamen.SubstituiCodigo( sCodigo,
                                                 sCodOri,
                                                 sCodDes          : String;
                                                 pReNumdigFixInt  : Integer ) : String;
Var
  i : Integer;

Begin

  If pos(sCodOri,sCodigo) <> 0 Then begin
    i := preNumDigFixInt + 1;
    Delete(sCodigo, i, length(sCodOri));
    Insert(sCodDes, sCodigo, i);
  end;

  Result := sCodigo;
end;
//************************************************
Function TCtrlCopiaContaOrcamen.SubstituiNome(sNomeDest : String; iLocal, iTam : Integer; sCodDes: string):string;
begin
  Delete(sNomeDest, iLocal, iTam);
  Insert(sCodDes, sNomeDest, iLocal);
  Result := sNomeDest;
end;
//************************************************
Procedure TCtrlCopiaContaOrcamen.SetCdsAtivProjDes( Const Value: TClientDataSet );
begin

  FCdsAtivProjDes := Value;
end;
//************************************************
Procedure TCtrlCopiaContaOrcamen.SetCdsAtivProjOri( Const Value: TClientDataSet );
begin

  FCdsAtivProjOri := Value;
end;
//************************************************
Procedure TCtrlCopiaContaOrcamen.SetCdsCCustoDes( Const Value: TClientDataSet );
begin

  FCdsCCustoDes := Value;
end;
//************************************************
Procedure TCtrlCopiaContaOrcamen.SetCdsCCustoOri( Const Value: TClientDataSet );
begin

  FCdsCCustoOri := Value;
end;
//************************************************
Procedure TCtrlCopiaContaOrcamen.SetCdsCRespDes( Const Value: TClientDataSet );
begin

  FCdsCRespDes := Value;
end;
//************************************************
Procedure TCtrlCopiaContaOrcamen.SetCdsCRespOri( Const Value: TClientDataSet );
begin

  FCdsCRespOri := Value;
end;
//************************************************
Procedure TCtrlCopiaContaOrcamen.SetCdsPatroDes( Const Value: TClientDataSet );
begin

  FCdsPatroDes := Value;
end;
//************************************************
Procedure TCtrlCopiaContaOrcamen.SetCdsPatroOri( Const Value: TClientDataSet );
begin

  FCdsPatroOri := Value;
end;
//************************************************
Procedure TCtrlCopiaContaOrcamen.SetCdsPlanoPrevDes( Const Value: TClientDataSet );
begin

  FCdsPlanoPrevDes := Value;
end;
//************************************************
Procedure TCtrlCopiaContaOrcamen.SetCdsPlanoPrevOri( Const Value: TClientDataSet );
begin

  FCdsPlanoPrevOri := Value;
end;
//************************************************
Procedure TCtrlCopiaContaOrcamen.DeletaCompContasOrcamen( pModulo : Integer;
                                                          sCodigo : String );
Var
  SqlLocal : TStringList;

Begin

  SqlLocal := TStringList.Create;
  Try
    SqlLocal.Add( 'SELECT' );
    SqlLocal.Add( '  IDCOMPCONTASORC' );
    SqlLocal.Add( 'FROM' );
    SqlLocal.Add( '  COMPCONTASORCAMEN' );
    SqlLocal.Add( 'WHERE' );
    SqlLocal.Add( '  ( IDCONTAORCAMEN = ' + IntToStr( pModulo ) + ' ) AND' );
    SqlLocal.Add( '  ( IDPLANOORCAMEN = ' + QuotedStr( sCodigo ) + ' )' );

    CtrlCompContasOrcamen.CdsCompContasOrcamen.Data := GetDataPacket( SqlLocal.Text );


    While( Not CtrlCompContasOrcamen.CdsCompContasOrcamen.EOF ) Do Begin

      CtrlCompContasOrcamen.CdsCompContasOrcamen.Delete;
    End;

    CtrlCompContasOrcamen.AplicaOperacaoCompContasOrcamen;
  Finally

    SqlLocal.Free;
  End;
End;
//************************************************
Procedure TCtrlCopiaContaOrcamen.AfterInitialize;
Begin
  Inherited;
  CtrlCompContasOrcamen.InitializeAs(self);
End;
//************************************************
Function TCtrlCopiaContaOrcamen.AplicaOperacaoContaOrcamen( Var pMensagem : String ): Boolean;
Begin

  If ( ConnectionSide = cnsClient ) Then Begin

    Result := Connection.AppServer.AplicaOperacaoContaOrcamen( CdsInsContasDes.Data );

    If ( Not Result ) Then Begin

      MessageInfo := Connection.AppServer.MessageInfo;
    End;
  End Else Begin

    MessageInfo := '';
    Try
      StartTransaction;

      Result := ApplyCDS( CdsInsContasDes, _DbContasOrcamen, [ ], [ ] );
      If Not Result Then Begin
        MessageInfo := _DbContasOrcamen.MessageInfo;
        Abort;
      End Else
        Commit;
    Except
      On E:Exception Do Begin
        Result := False;
        Rollback;
        pMensagem   := MessageInfo + E.Message;
        MessageInfo := MessageInfo + E.Message;
      End;
    End;
  End;
End;
//************************************************
Function TCtrlCopiaContaOrcamen.AplicaOperacaoCompDes: Boolean;
begin
  If ( ConnectionSide = cnsClient ) Then Begin

    Result := Connection.AppServer.AplicaOperacaoCompDes( CdsInsCompDes.Data );

    If ( Not Result ) Then Begin

      MessageInfo := Connection.AppServer.MessageInfo;
    End;
  End Else Begin

    MessageInfo := '';
    Try
      StartTransaction;

      Result := ApplyCDS( CdsInsCompDes, _DbCompContasOrcamen, [ ], [ ] );
      If Not Result Then Begin
        MessageInfo := _DbCompContasOrcamen.MessageInfo;
        Abort;
      End Else
        Commit;
    Except
      On E:Exception Do Begin
        Result := False;
        Rollback;
        MessageInfo := MessageInfo + E.Message;
      End;
    End;
  End;
end;
//************************************************
Procedure TCtrlCopiaContaOrcamen.AtualizaSaldo( pContaDes  : String;
                                                pContaOri  : String;
                                                pPlanoOrc  : Integer;
                                                pDataRefer : TDateTime );
Var
  SqlLocal : TStringList;

Begin

  SqlLocal := TStringList.Create;
  Try
    SqlLocal.Add( 'UPDATE' );
    SqlLocal.Add( '  SALDOORCADO' );
    SqlLocal.Add( 'SET' );
    SqlLocal.Add( '  IDCONTAORCAMEN = ' + pContaDes );
    SqlLocal.Add( 'WHERE' );
    SqlLocal.Add( '  ( IDCONTAORCAMEN  = ' + QuotedStr( pContaOri ) + ' ) AND' );
    SqlLocal.Add( '  ( IDPLANOORCAMEN  = ' + IntToStr( pPlanoOrc ) + ' ) AND' );
    SqlLocal.Add( '  ( DATAREFERENCIA >= ' + QuotedStr( DateToStr( pDataRefer ) ) + ' )' );

    ExecSQL( SqlLocal.Text );
  Finally

    SqlLocal.Free;
  End;
End;
//************************************************
End.
