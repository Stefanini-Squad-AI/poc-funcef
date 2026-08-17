{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Analista Responsável: Davi Ramos                      }
{ Atualizado Em: Novembro/2002                          }
{                                                       }
{*******************************************************}
Unit
  uCtrlEntCadDadosEspecial;

Interface

Uses
  DB, uDataBase, uCmControlObject, dbclient, sysutils, provider,
  uMidasUtil, uCMTypes, uString, uFuncoesOrcamento, udtmEntCadDadosEspecial;

Type
  TCtrlEntCadDadosEspecial = class(TCmControlObject)

  Protected

    Procedure DoChangeDataBase; Override;
    Procedure OnCreateAppServer; Override;

  Private
    FIdEmpresa: Double;
    FIdUsuario: Double;
    FcdsValorCCustAux: TClientDataSet;
    FcdsExercicio: TClientDataSet;
    FcdsDataView: TClientDataSet;
    FcdsPlanoPrevConta: TClientDataSet;
    FcdsGrupo: TClientDataSet;
    FcdsSaldoContabil: TClientDataSet;
    FCdsCadCenario: TClientDataSet;
    FcdsPlanoTrabalho: TClientDataSet;
    FcdsValorCentCust: TClientDataSet;
    FcdsPatroConta: TClientDataSet;
    FcdsPeriodo: TClientDataSet;
    FcdsCompOrcamen: TClientDataSet;
    FcdsSaldo: TClientDataSet;
    FcdsCriterio: TClientDataSet;
    FcdsContaSaldo: TClientDataSet;
    Function FazUpDateOuInsert( iPeriodo,
                                iFator                    : Integer;
                                pdblcCriterioLookupValue,
                                pdblcExercicioLookupValue : String ) : Boolean;
    Procedure SetCdsCadCenario(const Value: TClientDataSet);
    Procedure SetcdsCompOrcamen(const Value: TClientDataSet);
    Procedure SetcdsContaSaldo(const Value: TClientDataSet);
    Procedure SetcdsCriterio(const Value: TClientDataSet);
    Procedure SetcdsDataView(const Value: TClientDataSet);
    Procedure SetcdsExercicio(const Value: TClientDataSet);
    Procedure SetcdsGrupo(const Value: TClientDataSet);
    Procedure SetcdsPatroConta(const Value: TClientDataSet);
    Procedure SetcdsPeriodo(const Value: TClientDataSet);
    Procedure SetcdsPlanoPrevConta(const Value: TClientDataSet);
    Procedure SetcdsPlanoTrabalho(const Value: TClientDataSet);
    Procedure SetcdsSaldo(const Value: TClientDataSet);
    Procedure SetcdsSaldoContabil(const Value: TClientDataSet);
    Procedure SetcdsValorCCustAux(const Value: TClientDataSet);
    Procedure SetcdsValorCentCust(const Value: TClientDataSet);
  Public
    Constructor Create; Override;
    Destructor  Destroy;Override;

    Function  dblcCriterioCloseUp( pdblcPlanoParamContaText,
                                   pdblcPlanoParamContaLookupValue,
                                   pdblcPatroParamContaText,
                                   pdblcPatroParamContaLookupValue  : String;
                                   piGrupo                          : Integer ) : Boolean;
    Function  BtCalcClick( pdblcPeriodoText,
                           pdblcPeriodoLookupValue,
                           pdblcExercicioText,
                           pdblcExercicioLookupValue,
                           pdblcCriterioLookUpValue  : String;
                           predValorBaseValue        : Double ) : Boolean;
    Function bbtnConfirmarClick( pdblcPeriodoText,
                                 pdblcPeriodoLookupValue,
                                 pdblcCriterioLookupValue,
                                 pdblcExercicioLookupValue : String ) : Boolean;
    Function  AltEspecial( idcriterioratorc,
                           idplanoorcamen,
                           idpessoa         : Integer;
                           idcontaorcamen,
                           datareferencia   : String;
                           vlrorcado,
                           vlrrateioori,
                           vlrorcacum,
                           percutilrateio   : Double ) : Boolean;
    Function  InsereEspecial( idcriterioratorc,
                              idplanoorcamen,
                              exercicio,
                              periodo,
                              idpessoa          : Integer;
                              idcontaorcamen,
                              datareferencia    : String;
                              vlrrealizado,
                              vlrorcado,
                              vlrrateioori,
                              vlrrealacum,
                              vlrorcacum,
                              percutilrateio    : Double) : Boolean;
    Function  AbreSaldos( pdblcPeriodoText,
                          pdblcPeriodoLookupValue,
                          pdblcPlanoTrabalhoText,
                          pdblcPlanoParamContaText,
                          pdblcPlanoParamContaLookupValue,
                          pdblcPatroParamContaText,
                          pdblcPatroParamContaLookupValue,
                          pdblcExercicioText,
                          pdblcExercicioLookupValue       : String ) : Boolean;
    Procedure AbreQueries;
    Procedure AbrePeriodo( pdblcExercicioText,
                           pdblcExercicioLookupValue : String );


    Property pIdEmpresa       : Double         Read FIdEmpresa         Write FIdEmpresa;
    Property pIdUsuario       : Double         Read FIdUsuario         Write FIdUsuario;
    Property CdsCadCenario    : TClientDataSet Read FCdsCadCenario     Write SetCdsCadCenario;
    Property CdsSaldo         : TClientDataSet Read FcdsSaldo          Write SetcdsSaldo;
    Property CdsPeriodo       : TClientDataSet Read FcdsPeriodo        Write SetcdsPeriodo;
    Property CdsValorCCustAux : TClientDataSet Read FcdsValorCCustAux  Write SetcdsValorCCustAux ;
    Property CdsGrupo         : TClientDataSet Read FcdsGrupo          Write SetcdsGrupo;
    Property CdsCompOrcamen   : TClientDataSet Read FcdsCompOrcamen    Write SetcdsCompOrcamen;
    Property CdsValorCentCust : TClientDataSet Read FcdsValorCentCust  Write SetcdsValorCentCust ;
    Property CdsPlanoTrabalho : TClientDataSet Read FcdsPlanoTrabalho  Write SetcdsPlanoTrabalho ;
    Property CdsCriterio      : TClientDataSet Read FcdsCriterio       Write SetcdsCriterio;
    Property CdsSaldoContabil : TClientDataSet Read FcdsSaldoContabil  Write SetcdsSaldoContabil ;
    Property CdsPatroConta    : TClientDataSet Read FcdsPatroConta     Write SetcdsPatroConta;
    Property CdsDataView      : TClientDataSet Read FcdsDataView       Write SetcdsDataView;
    Property CdsPlanoPrevConta: TClientDataSet Read FcdsPlanoPrevConta Write SetcdsPlanoPrevConta;
    Property CdsExercicio     : TClientDataSet Read FcdsExercicio      Write SetcdsExercicio;
    Property CdsContaSaldo    : TClientDataSet Read FcdsContaSaldo     Write SetcdsContaSaldo;
  End;

Implementation
//************************************************
Procedure TCtrlEntCadDadosEspecial.OnCreateAppServer;
Begin
  Inherited;

End;
//************************************************
Procedure TCtrlEntCadDadosEspecial.DoChangeDataBase;
Begin
  Inherited;

End;
//************************************************
Constructor TCtrlEntCadDadosEspecial.Create;
Begin
  Inherited;
  dtmEntCadDadosEspecial := TdtmEntCadDadosEspecial.Create( Nil );
  CdsCadCenario    := TClientDataSet.Create( Nil );
  CdsSaldo         := TClientDataSet.Create( Nil );
  CdsPeriodo       := TClientDataSet.Create( Nil );
  CdsValorCCustAux := TClientDataSet.Create( Nil );
  CdsGrupo         := TClientDataSet.Create( Nil );
  CdsCompOrcamen   := TClientDataSet.Create( Nil );
  CdsValorCentCust := TClientDataSet.Create( Nil );
  CdsPlanoTrabalho := TClientDataSet.Create( Nil );
  CdsCriterio      := TClientDataSet.Create( Nil );
  CdsSaldoContabil := TClientDataSet.Create( Nil );
  CdsPatroConta    := TClientDataSet.Create( Nil );
  CdsDataView      := TClientDataSet.Create( Nil );
  CdsPlanoPrevConta:= TClientDataSet.Create( Nil );
  CdsExercicio     := TClientDataSet.Create( Nil );
  CdsContaSaldo    := TClientDataSet.Create( Nil );
End;                
//************************************************
Destructor TCtrlEntCadDadosEspecial.Destroy;
Begin
  Inherited;
  dtmEntCadDadosEspecial.Free;
  CdsCadCenario.Free;
  CdsSaldo.Free;
  CdsPeriodo.Free;
  CdsValorCCustAux.Free;
  CdsGrupo.Free;
  CdsCompOrcamen.Free;
  CdsValorCentCust.Free;
  CdsPlanoTrabalho.Free;
  CdsCriterio.Free;
  CdsSaldoContabil.Free;
  CdsPatroConta.Free;
  CdsDataView.Free;
  CdsPlanoPrevConta.Free;
  CdsExercicio.Free;
  CdsContaSaldo.Free;
End;
//************************************************
Procedure TCtrlEntCadDadosEspecial.SetCdsCadCenario( Const Value: TClientDataSet);
begin
  FCdsCadCenario := Value;
End;
//************************************************
Procedure TCtrlEntCadDadosEspecial.SetcdsCompOrcamen( Const Value: TClientDataSet);
begin
  FcdsCompOrcamen := Value;
End;
//************************************************
Procedure TCtrlEntCadDadosEspecial.SetcdsContaSaldo( Const Value: TClientDataSet);
begin
  FcdsContaSaldo := Value;
End;
//************************************************
Procedure TCtrlEntCadDadosEspecial.SetcdsCriterio( Const Value: TClientDataSet);
begin
  FcdsCriterio := Value;
End;
//************************************************
Procedure TCtrlEntCadDadosEspecial.SetcdsDataView( Const Value: TClientDataSet);
begin
  FcdsDataView := Value;
End;
//************************************************
Procedure TCtrlEntCadDadosEspecial.SetcdsExercicio( Const Value: TClientDataSet);
begin
  FcdsExercicio := Value;
End;
//************************************************
Procedure TCtrlEntCadDadosEspecial.SetcdsGrupo( Const Value: TClientDataSet);
begin
  FcdsGrupo := Value;
End;
//************************************************
Procedure TCtrlEntCadDadosEspecial.SetcdsPatroConta( Const Value: TClientDataSet);
begin
  FcdsPatroConta := Value;
End;
//************************************************
Procedure TCtrlEntCadDadosEspecial.SetcdsPeriodo( Const Value: TClientDataSet);
begin
  FcdsPeriodo := Value;
End;
//************************************************
Procedure TCtrlEntCadDadosEspecial.SetcdsPlanoPrevConta( Const Value: TClientDataSet);
begin
  FcdsPlanoPrevConta := Value;
End;
//************************************************
Procedure TCtrlEntCadDadosEspecial.SetcdsPlanoTrabalho( Const Value: TClientDataSet);
begin
  FcdsPlanoTrabalho := Value;
End;
//************************************************
Procedure TCtrlEntCadDadosEspecial.SetcdsSaldo( Const Value: TClientDataSet);
begin
  FcdsSaldo := Value;
End;
//************************************************
Procedure TCtrlEntCadDadosEspecial.SetcdsSaldoContabil( Const Value: TClientDataSet);
begin
  FcdsSaldoContabil := Value;
End;
//************************************************
Procedure TCtrlEntCadDadosEspecial.SetcdsValorCCustAux( Const Value: TClientDataSet);
begin
  FcdsValorCCustAux := Value;
End;
//************************************************
Procedure TCtrlEntCadDadosEspecial.SetcdsValorCentCust( Const Value: TClientDataSet);
begin
  FcdsValorCentCust := Value;
end;
//************************************************
Procedure TCtrlEntCadDadosEspecial.AbreQueries;
Begin
  //Seleciona os Grupos Orçamentários
  cdsPlanoTrabalho.Close;
  With dtmEntCadDadosEspecial.sqlPlanoTrabalho Do Begin
    Prepare;
    ParamByName('IDPESSOA').asInteger  := Trunc( pidEmpresa );
    ParamByName('IDUSUARIO').asInteger := Trunc( pIdUsuario );
    cdsPlanoTrabalho.Data := Data;
  End;

  cdsExercicio.Close;
  With dtmEntCadDadosEspecial.sqlExercicio Do Begin
    Prepare;
    ParamByName('IDPESSOA').asInteger := Trunc( pidEmpresa );
    cdsExercicio.Data := Data;
  End;
  cdsPeriodo.Close;

  cdsCriterio.Close;
  With dtmEntCadDadosEspecial.sqlCriterio Do Begin
    Prepare;
    ParamByName('IDPESSOA').asInteger := Trunc( pidEmpresa );
    cdsCriterio.Data := Data;
  End;

  cdsPlanoPrevConta.Close;
  With dtmEntCadDadosEspecial.sqlPlanoPrevConta Do Begin
    Prepare;
    cdsPlanoPrevConta.Data := Data;
  End;

  cdsPatroConta.Close;
  With dtmEntCadDadosEspecial.sqlPatroConta Do Begin
    Prepare;
    cdsPatroConta.Data := Data;
  End;
End;
//************************************************
Function  TCtrlEntCadDadosEspecial.AbreSaldos( pdblcPeriodoText,
                                               pdblcPeriodoLookupValue,
                                               pdblcPlanoTrabalhoText,
                                               pdblcPlanoParamContaText,
                                               pdblcPlanoParamContaLookupValue,
                                               pdblcPatroParamContaText,
                                               pdblcPatroParamContaLookupValue,
                                               pdblcExercicioText,
                                               pdblcExercicioLookupValue       : String ) : Boolean;
Begin
  Try
    CdsSaldo.Close;
    With dtmEntCadDadosEspecial.sqlSaldo Do Begin
      Prepare;

      If ( Trim( pdblcPeriodoText ) = '' ) Or
         ( Trim( pdblcPeriodoText ) = 'Anual' ) Then Begin

        ParamByName('PERIODO').AsString := '(1 = 1) AND ';
      End Else Begin

        ParamByName('PERIODO').AsString := '(S.PERIODO(+) = ' + pdblcPeriodoLookupValue + ') AND ';
      End;

      If trim( pdblcPlanoTrabalhoText ) = '' Then Begin
        ParamByName('UNIDNEGOC').AsString := '(C.UNIDNEGOC IS NULL) AND ';

      End Else Begin

        ParamByName('UNIDNEGOC').AsString := '(C.UNIDNEGOC = ' + cdsPlanoTrabalho.FieldByName('UNIDNEGOC').AsString + ') AND ';
      End;

      If Trim( pdblcPlanoParamContaText ) = '' Then Begin
        ParamByName('IDPLANOPREV').AsString := '(C.IDPLANOPREV IS NULL) AND ';

      End Else Begin

        ParamByName('IDPLANOPREV').AsString := '(C.IDPLANOPREV = ' + pdblcPlanoParamContaLookupValue + ') AND ';
      End;

      If trim( pdblcPatroParamContaText ) = '' Then Begin
        ParamByName('IDPATRO').AsString := '(C.IDPATRO IS NULL) AND '

      End Else Begin

        ParamByName('IDPATRO').AsString := '(C.IDPATRO = ' + pdblcPatroParamContaLookupValue + ') AND ';
      End;

      If trim( pdblcExercicioText ) = '' Then Begin
        ParamByName('EXERCICIO').asInteger := -1

      End Else Begin

        ParamByName('EXERCICIO').asInteger := StrToInt( pdblcExercicioLookupValue );
      End;

      ParamByName('IDPESSOA').asInteger       := Trunc( pIdEmpresa );
      ParamByName('IDGRUPOORCAMEN').asInteger := cdsGrupo.FieldByName('IDGRUPOORCAMEN').AsInteger;
      CdsSaldo.Data := Data;
    End;
    Result := True;
  Except
    On E : Exception Do Begin
      Result := False;
      MessageInfo := E.Message;
    End;
  End;
End;
//************************************************
Procedure TCtrlEntCadDadosEspecial.AbrePeriodo( pdblcExercicioText,
                                                pdblcExercicioLookupValue : String );
Begin
  cdsPeriodo.Close;
  With dtmEntCadDadosEspecial.sqlPeriodo Do Begin
    Prepare;
    Params[ 0 ].AsInteger := Trunc( pidEmpresa );
    Params[ 2 ].AsInteger := trunc( pidEmpresa );

    If ( Trim( pdblcExercicioText ) = '' ) Then Begin

      Params[ 1 ].AsInteger := -1;
      Params[ 3 ].AsInteger := -1;
    End Else Begin

      Params[ 1 ].AsInteger := StrToInt( pdblcExercicioLookupValue );
      Params[ 3 ].AsInteger := StrToInt( pdblcExercicioLookupValue );
    End;
    CdsPeriodo.Data := Data;
  End;
End;
//************************************************
Function  TCtrlEntCadDadosEspecial.dblcCriterioCloseUp( pdblcPlanoParamContaText,
                                                        pdblcPlanoParamContaLookupValue,
                                                        pdblcPatroParamContaText,
                                                        pdblcPatroParamContaLookupValue  : String;
                                                        piGrupo                          : Integer ) : Boolean;
Var
  sPlaConta: String;
Begin
  sPlaConta := '';
  Try
    cdsCompOrcamen.Close;
    With dtmEntCadDadosEspecial.sqlCompOrcamen Do Begin
      If Not Prepared Then Prepare;
      If not cdsPlanoTrabalho.FieldByName('UNIDNEGOC').IsNull Then Begin

        ParamByName('UNIDNEGOC').AsString := '(CC.UNIDNEGOC = ' + cdsPlanoTrabalho.FieldByName('UNIDNEGOC').AsString + ') AND ';
      End Else Begin

        ParamByName('UNIDNEGOC').AsString := '(1 = 1) AND ';
      End;

      If Trim( pdblcPlanoParamContaText ) <> '' Then Begin

        ParamByName('IDPLANOPREV').AsString := '(CC.IDPLANOPREV = ' + pdblcPlanoParamContaLookupValue + ') AND ';
      End Else Begin

        ParamByName('IDPLANOPREV').AsString := '(1 = 1) AND ';
      End;

      If Trim( pdblcPatroParamContaText ) <> '' Then Begin

        ParamByName('IDPATRO').AsString := '(CC.IDPATRO = ' + pdblcPatroParamContaLookupValue + ')';
      End Else Begin

        ParamByName('IDPATRO').AsString := '(1 = 1)';
      End;

      ParamByName('IDGRUPOORCAMEN').asInteger := piGrupo;
      cdsCompOrcamen.Data := Data;
    End;

    cdsCompOrcamen.First;
    While Not cdsCompOrcamen.Eof Do Begin
      If sPlaConta = '' Then Begin
        sPlaConta := '''' + Espaco(cdsCompOrcamen.FieldByName('PLACONTA').AsString,18) + ''''
      End Else Begin
        sPlaConta := sPlaConta + ',''' + Espaco(cdsCompOrcamen.FieldByName('PLACONTA').AsString,18) + '''';
      End;
      cdsCompOrcamen.Next;
    End;

    If Trim( sPlaConta ) <> '' Then Begin

      cdsSaldoContabil.Close;
      With dtmEntCadDadosEspecial.sqlSaldoContabil Do Begin
        If Not Prepared Then Prepare;
        ParamByName('PLACONTA').AsString      := '(PLACONTA IN (' + sPlaConta + ')) ';
        ParamByName('PERNUMERO').AsInteger    := cdsCriterio.FieldByName('PERNUMERO').AsInteger;
        ParamByName('PEREXERCICIO').AsInteger := cdsCriterio.FieldByName('PEREXERCICIO').AsInteger;
        ParamByName('IDPESSOA').AsInteger     := Trunc( pidEmpresa );
        cdsSaldoContabil.Data := Data;
      End;
    End;
    Result := True;
  Except
    On E : Exception Do Begin
      Result      := False;
      MessageInfo := E.Message;
    End;
  End
End;
//************************************************
Function TCtrlEntCadDadosEspecial.BtCalcClick( pdblcPeriodoText,
                                               pdblcPeriodoLookupValue,
                                               pdblcExercicioText,
                                               pdblcExercicioLookupValue,
                                               pdblcCriterioLookUpValue  : String;
                                               predValorBaseValue        : Double  ) : Boolean;
Var
  rTotal     : Double;
  bComLike,
  bComData,
  bComAnoMes : Boolean;
  iAno,
  iMes,
  iDia       : Word;
  sAnoMes    : String;
  dDataRef   : TDateTime;
Begin
  Try
    If cdsCriterio.FieldByName('TIPORATEIO').AsString = 'M' Then Begin
      rTotal :=0;
      cdsSaldo.DisableControls;
      cdsSaldo.First;
      While Not cdsSaldo.Eof Do Begin
        cdsValorCentCust.Close;
        With dtmEntCadDadosEspecial.sqlValorCentCust Do Begin
          Prepare;
          If ( Trim( pdblcPeriodoText ) = '' ) Or
             ( Trim( pdblcPeriodoText ) = 'Anual' ) Then Begin

            ParamByName('PERIODO').AsString := '(1 = 1)'
          End Else Begin

            ParamByName('PERIODO').AsString := '(PERIODO = ' + pdblcPeriodoLookupValue + ')';
          End;

          ParamByName('CODCENTROCUSTO').asString := Espaco(cdsSaldo.FieldByName('CODCENTROCUSTO').AsString,10);
          ParamByName('IDEMPRESA').asFloat       := pidEmpresa;
          If trim( pdblcExercicioText ) = '' Then Begin
            ParamByName('EXERCICIO').asInteger := -1
          End Else Begin
            ParamByName('EXERCICIO').asInteger := StrToInt( pdblcExercicioLookupValue );
          End;
          ParamByName('IDPESSOA').asInteger         := Trunc( pIdEmpresa );
          ParamByName('IDCRITERIORATORC').asInteger := StrToInt( pdblcCriterioLookUpValue );
          cdsValorCentCust.Data := Data;
        End;
        cdsSaldo.Edit;
        cdsSaldo.FieldByName('VALORCC').AsFloat     := cdsValorCentCust.FieldByName('VLRCRIRATORC').AsFloat;
        cdsSaldo.Post;
        rTotal := rTotal + cdsValorCentCust.FieldByName('VLRCRIRATORC').AsFloat;
        cdsSaldo.Next;
      End;
      If rTotal <> 0 Then Begin
        cdsSaldo.First;
        While Not cdsSaldo.Eof Do Begin
          cdsSaldo.Edit;
          cdsSaldo.FieldByName('VLRORCADO').AsFloat    := predValorBaseValue * (cdsSaldo.FieldByName('VALORCC').AsFloat/rTotal);
          cdsSaldo.FieldByName('VLRRATEIOORI').AsFloat := cdsSaldo.FieldByName('VLRORCADO').AsFloat;
          cdsSaldo.FieldByName('FATORRATEIO').AsFloat  := (cdsSaldo.FieldByName('VALORCC').AsFloat/rTotal);
          cdsSaldo.Post;
          cdsSaldo.Next;
        End;
      End;
      cdsSaldo.First;
      cdsSaldo.EnableControls;
    End;
    If cdsCriterio.FieldByName('TIPORATEIO').AsString = 'G' Then Begin
      cdsDataView.Close;
      With dtmEntCadDadosEspecial.sqlDataView Do Begin
        Prepare;
        ParamByName('IDDATAVIEW').AsInteger := cdsCriterio.FieldByName('IDDATAVIEW').AsInteger;
        cdsDataView.Data := Data;
      End;
      If Not cdsDataView.FieldByName('TEMPLATE').isNull Then Begin
        cdsValorCCustAux.Close;
        With dtmEntCadDadosEspecial.sqlValorCCustAux Do Begin
          SQL.Clear;
          SQL.Add(cdsDataView.FieldByName('TEMPLATE').AsString);
        End;
        If cdsCriterio.FieldByName('PERNUMERO').IsNull Then Begin
          dDataRef := Date
        End Else Begin
          dDataRef := cdsCriterio.FieldByName('PERDATFIM').AsDatetime;
        End;
        If Pos(':DATA', AnsiUpperCase(cdsDataView.FieldByName('TEMPLATE').AsString)) = 0 Then Begin
          bComData := False
        End Else Begin
          bComData := True;
        End;
        sAnoMes := '';
        If pos('LIKE :CODCENTROCUSTO',AnsiUpperCase(cdsDataView.FieldByName('TEMPLATE').AsString)) = 0 Then Begin
          bComLike := False
        End Else Begin
          bComLike := True;
        End;
        If pos(':ANOMES',AnsiUpperCase(cdsDataView.FieldByName('TEMPLATE').AsString)) = 0 Then Begin
          bComAnoMes := False;
        End Else Begin
          bComAnoMes := True;
          DecodeDate(dDataRef,iAno,iMes,iDia);
          If iMes<10 Then Begin
            sAnoMes := IntToStr(iAno) + '0' + IntToStr(iMes);
          End Else Begin
            sAnoMes := IntToStr(iAno) + IntToStr(iMes);
          End;
        End;
        rTotal  :=0;
        cdsSaldo.DisableControls;
        cdsSaldo.First;
        While Not cdsSaldo.Eof Do Begin
          cdsValorCCustAux.Close;
          With dtmEntCadDadosEspecial.sqlValorCCustAux Do Begin
            Prepare;
            if bComLike then
              ParamByName('CODCENTROCUSTO').asString := TRIM(cdsSaldo.FieldByName('CODCENTROCUSTO').AsString) + '%'
            else
              ParamByName('CODCENTROCUSTO').asString := Espaco(cdsSaldo.FieldByName('CODCENTROCUSTO').AsString,10);
            ParamByName('IDEMPRESA').asFloat := pidEmpresa;
            if bComData then
              ParamByName('DATA').asDateTime := dDataRef;
            if bComAnoMes then
              ParamByName('ANOMES').AsString := sAnoMes;
            cdsValorCCustAux.Data := Data;
          End;
          cdsSaldo.Edit;
          cdsSaldo.FieldByName('VALORCC').AsFloat := cdsValorCCustAux.FieldByName('VALOR').AsFloat;
          cdsSaldo.Post;
          rTotal := rTotal + cdsValorCCustAux.FieldByName('VALOR').AsFloat;
          cdsSaldo.Next;
        End;
        If rTotal <> 0 then begin
          cdsSaldo.First;
          While Not cdsSaldo.Eof Do Begin
            cdsSaldo.Edit;
            cdsSaldo.FieldByName('VLRORCADO').AsFloat    := predValorBaseValue * (cdsSaldo.FieldByName('VALORCC').AsFloat/rTotal);
            cdsSaldo.FieldByName('VLRRATEIOORI').AsFloat := cdsSaldo.FieldByName('VLRORCADO').AsFloat;
            cdsSaldo.FieldByName('FATORRATEIO').AsFloat  := (cdsSaldo.FieldByName('VALORCC').AsFloat/rTotal);
            cdsSaldo.Post;
            cdsSaldo.Next;
          End;
        End;
        cdsSaldo.First;
        cdsSaldo.EnableControls;
      End;
    End;
    Result := True;
  Except
    On E : Exception Do Begin
      Result := False;
      MessageInfo := E.Message;
    End;
  End;
End;
//************************************************
Function TCtrlEntCadDadosEspecial.bbtnConfirmarClick( pdblcPeriodoText,
                                                      pdblcPeriodoLookupValue,
                                                      pdblcCriterioLookupValue,
                                                      pdblcExercicioLookupValue : String ) : Boolean;
Var
  iFator : Integer;
Begin
  Try
    StartTransaction;
    cdsSaldo.DisableControls;
    cdsSaldo.First;
    While Not cdsSaldo.Eof do begin

      if ( Trim( pdblcPeriodoText ) = '' ) Or
         ( Trim( pdblcPeriodoText ) = 'Anual' ) Then Begin

        iFator := cdsPeriodo.RecordCount - 1;
        cdsPeriodo.First;

        While not cdsPeriodo.Eof do begin

          If ( CdsPeriodo.FieldbyName( 'PERIODO' ).AsInteger <> 0 ) Then Begin

            FazUpDateOuInsert( cdsPeriodo.FieldByName('PERIODO').AsInteger,
                               iFator,
                               pdblcCriterioLookupValue,
                               pdblcExercicioLookupValue );
          End;
          cdsPeriodo.Next;
        End;
      End Else Begin

        FazUpDateOuInsert( StrToInt( pdblcPeriodoLookupValue ),
                           1,
                           pdblcCriterioLookupValue,
                           pdblcExercicioLookupValue );
      End;
      cdsSaldo.Next;
    End;
    Commit;
    MessageInfo := 'Gravação Efetuada com Sucesso';
    Result := True;
  Except
    On E : Exception Do Begin
      Result := False;
      MessageInfo := 'Gravação Não Efetuada' + #13 + #10 + E.Message;
      RollBack;
    End;
  End;
End;
//************************************************
Function TCtrlEntCadDadosEspecial.FazUpDateOuInsert( iPeriodo,
                                                     iFator                    : Integer;
                                                     pdblcCriterioLookupValue,
                                                     pdblcExercicioLookupValue : String ) : Boolean;
Var
  pdblcCriterioLookupValue2 : Double;
Begin
  Try
    cdsContaSaldo.Close;
    With dtmEntCadDadosEspecial.sqlContaSaldo do begin
      Prepare;
      ParamByName('IDPLANOORCAMEN').AsInteger  := cdsSaldo.FieldByName('IDPLANOORCAMEN').AsInteger;
      ParamByName('IDCONTAORCAMEN').AsString   := cdsSaldo.FieldByName('IDCONTAORCAMEN').AsString;
      ParamByName('DATAREFERENCIA').AsDateTime := cdsPeriodo.FieldByName('DATAFIMPERIODO').AsDateTime;
      ParamByName('IDPESSOA').AsInteger        := Trunc( pidEmpresa );
      cdsContaSaldo.Data := Data;
    End;

    Try
      pdblcCriterioLookupValue2 := StrToInt( pdblcCriterioLookupValue );
    Except
      pdblcCriterioLookupValue2 := 0;
    End;

    If cdsContaSaldo.RecordCount > 0 Then Begin
      // Atualiza Saldo
      AltEspecial( Trunc( pdblcCriterioLookupValue2 ),
                   cdsSaldo.FieldByName('IDPLANOORCAMEN').AsInteger,
                   Trunc( pidEmpresa ),
                   cdsSaldo.FieldByName('IDCONTAORCAMEN').AsString,
                   FormatDateTime('dd/mm/yyyy', cdsPeriodo.FieldByName('DATAFIMPERIODO').AsDateTime),
                   cdsSaldo.FieldByName('VLRORCADO').AsFloat / iFator,
                   cdsSaldo.FieldByName('VLRRATEIOORI').AsFloat / iFator,
                   cdsSaldo.FieldByName('VLRORCADO').AsFloat / iFator,
                   cdsSaldo.FieldByName('FATORRATEIO').AsFloat);
    End Else Begin
      If (cdsSaldo.FieldByName('VLRORCADO').AsFloat <> 0) Then Begin
        // Insere Saldo
        InsereEspecial( Trunc( pdblcCriterioLookupValue2 ),
                        cdsSaldo.FieldByName('IDPLANOORCAMEN').asInteger,
                        StrToInt( pdblcExercicioLookupValue ), iPeriodo,
                        Trunc( pIdEmpresa ),
                        cdsSaldo.FieldByName('IDCONTAORCAMEN').asString,
                        FormatDateTime('dd/mm/yyyy', cdsPeriodo.FieldByName('DATAFIMPERIODO').AsDateTime),
                        0, cdsSaldo.FieldByName('VLRORCADO').AsFloat / iFator,
                        cdsSaldo.FieldByName('VLRRATEIOORI').AsFloat / iFator,
                        0, cdsSaldo.FieldByName('VLRORCADO').AsFloat / iFator,
                        cdsSaldo.FieldByName('FATORRATEIO').AsFloat);
      End;
    End;
    Result := True;
  Except
    On E : Exception Do Begin
      Result := False;
      MessageInfo := E.Message;
    End;
  End;
End;
//************************************************
Function  TCtrlEntCadDadosEspecial.AltEspecial( idcriterioratorc,
                                                idplanoorcamen,
                                                idpessoa         : Integer;
                                                idcontaorcamen,
                                                datareferencia   : String;
                                                vlrorcado,
                                                vlrrateioori,
                                                vlrorcacum,
                                                percutilrateio   : Double ) : Boolean;
Var
  sSQl,
  pCriterioLocal : String;
Begin
  If ConnectionSide = cnsClient Then Begin
    Result := Connection.AppServer.EntCadDadosEspecialAltEspecial( idcriterioratorc,
                                                idplanoorcamen,
                                                idpessoa,
                                                idcontaorcamen,
                                                datareferencia,
                                                vlrorcado,
                                                vlrrateioori,
                                                vlrorcacum,
                                                percutilrateio );

    If Not Result Then MessageInfo := Connection.AppServer.MessageInfo;
  End Else Begin
    Try
      MessageInfo := '';

      If ( idcriterioratorc = 0 ) Then Begin

        pCriterioLocal := ' NULL ';
      End Else Begin

        pCriterioLocal := FloatToStr(idcriterioratorc);
      End;

      sSql := 'UPDATE SALDOORCADO SET VLRORCADO = ' +
              TrocaVPP(FloatToStr(vlrorcado)) + ', VLRRATEIOORI = ' +
              TrocaVPP(FloatToStr(vlrrateioori)) + ', VLRORCACUM = ' +
              TrocaVPP(FloatToStr(vlrorcacum)) + ', PERCUTILRATEIO = ' +
              TrocaVPP(FloatToStr(percutilrateio)) + ', IDCRITERIORATORC = ' +
              pCriterioLocal + ' WHERE (IDPLANOORCAMEN = ' +
              FloatToStr(idplanoorcamen) + ') AND (IDCONTAORCAMEN = ''' +
              Trim(idcontaorcamen) + ''') AND (DATAREFERENCIA = TO_DATE(''' +
              Trim(datareferencia) + ''',''DD/MM/YYYY'')) AND (IDPESSOA = ' +
              IntToStr(idpessoa) + ')';
      ExecSQL(sSql);
      Result := True;
    Except
      On E : Exception Do Begin
        Result := False;
        MessageInfo := E.Message;
      End;
    End;
  End;
End;
//************************************************
Function  TCtrlEntCadDadosEspecial.InsereEspecial( idcriterioratorc,
                                                   idplanoorcamen,
                                                   exercicio,
                                                   periodo,
                                                   idpessoa          : Integer;
                                                   idcontaorcamen,
                                                   datareferencia    : String;
                                                   vlrrealizado,
                                                   vlrorcado,
                                                   vlrrateioori,
                                                   vlrrealacum,
                                                   vlrorcacum,
                                                   percutilrateio    : Double) : Boolean;
Var
  sSQl,
  pCriterioLocal : String;
Begin
  If ConnectionSide = cnsClient Then Begin
    Result := Connection.AppServer.EntCadDadosEspecialInsereEspecial( idcriterioratorc,
                                                   idplanoorcamen,
                                                   exercicio,
                                                   periodo,
                                                   idpessoa,
                                                   idcontaorcamen,
                                                   datareferencia,
                                                   vlrrealizado,
                                                   vlrorcado,
                                                   vlrrateioori,
                                                   vlrrealacum,
                                                   vlrorcacum,
                                                   percutilrateio );
    If Not Result Then MessageInfo := Connection.AppServer.MessageInfo;
  End Else Begin
    Try
      MessageInfo := '';

      If ( idcriterioratorc = 0 ) Then Begin

        pCriterioLocal := ' NULL ';
      End Else Begin

        pCriterioLocal := FloatToStr(idcriterioratorc);
      End;

      sSql := 'INSERT INTO SALDOORCADO (IDCRITERIORATORC, IDCONTAORCAMEN, ' +
              'IDPLANOORCAMEN, DATAREFERENCIA, EXERCICIO, PERIODO, IDPESSOA, ' +
              'VLRREALIZADO, VLRORCADO, VLRRATEIOORI, VLRREALACUM, VLRORCACUM, ' +
              'PERCUTILRATEIO) VALUES (' + pCriterioLocal + ', ''' +
              Trim(idcontaorcamen) + ''', ' + FloatToStr(idplanoorcamen) +
              ', TO_DATE(''' + datareferencia + ''',''DD/MM/YYYY''), ' +
              IntToStr(exercicio) + ', ' + IntToStr(periodo) + ', ' +
              IntToStr(idpessoa) + ', ' + TrocaVPP(FloatToStr(vlrrealizado)) +
              ', ' + TrocaVPP(FloatToStr(vlrorcado)) + ', ' +
              TrocaVPP(FloatToStr(vlrrateioori)) + ', ' +
              TrocaVPP(FloatToStr(vlrrealacum)) + ', ' +
              TrocaVPP(FloatToStr(vlrorcacum)) + ', ' +
              TrocaVPP(FloatToStr(percutilrateio)) + ')';
      ExecSQL(sSql);
      Result := True;
    Except
      On E : Exception Do Begin
        Result := False;
        MessageInfo := E.Message;
      End;
    End;
  End;
End;
//************************************************
End.
