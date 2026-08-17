Unit
  uCtrlEfetivaCenario;

Interface

Uses
  DB, uDataBase, uCmControlObject, dbclient, uMidasUtil, sysutils,wwQuery, provider,
  StdCtrls, ComCtrls, uCMTypes, uCtrlSaldoOrcado, uCtrlSaldoOrcadoAnt, uCtrlValoresCenario,
  uDtmEfetivaCenario;

Type
  TCtrlEfetivaCenario = class(TCmControlObject)

  Protected
    Procedure DoChangeDataBase;  Override;
    Procedure OnCreateAppServer; Override;
    Procedure AfterInitialize;   Override;
  Private
    DtmEfetivaCenario  : TDtmEfetivaCenario;
    CtrlSaldoOrcado    : TCtrlSaldoOrcado;
    CtrlSaldoOrcadoAnt : TCtrlSaldoOrcadoAnt;
    CtrlValoresCenario : TCtrlValoresCenario;

    FpbAguarde         : TProgressBar;
    FEdtLegenda        : TEdit;
    FcdsPeriodo        : TClientDataSet;
    FcdsPeriodoIni     : TClientDataSet;
    FcdsPeriodoFim     : TClientDataSet;
    FcdsTestaOrcAnt    : TClientDataSet;
    FcdsOrcado         : TClientDataSet;
    FcdsOrcadoAnt      : TClientDataSet;
    FcdsCenario        : TClientDataSet;
    FcdsSaldoCenario   : TClientDataSet;
    FcdsSaldoCenarioAnt: TClientDataSet;
    FcdsTestaOrc       : TClientDataSet;

    procedure SetcdsCenario        (const Value: TClientDataSet);
    procedure SetcdsOrcado         (const Value: TClientDataSet);
    procedure SetcdsOrcadoAnt      (const Value: TClientDataSet);
    procedure SetcdsPeriodo        (const Value: TClientDataSet);
    procedure SetcdsPeriodoFim     (const Value: TClientDataSet);
    procedure SetcdsPeriodoIni     (const Value: TClientDataSet);
    procedure SetcdsSaldoCenario   (const Value: TClientDataSet);
    procedure SetcdsSaldoCenarioAnt(const Value: TClientDataSet);
    procedure SetcdsTestaOrc       (const Value: TClientDataSet);
    procedure SetcdsTestaOrcAnt    (const Value: TClientDataSet);

  Public
    Constructor Create; Override;
    Destructor  Destroy;Override;

    Function EfetivaClick( pIdEmpresa,
                           pIdUsuario              : Integer;
                           pCenario,
                           pSalvaCenario           : Double;
                           pPeriodoIni,
                           pPeriodoFim             : Integer;
                           pcbSaldoAnteriorChecked : Boolean;
                           pspnedExercicioValue    : Double;
                           pdblcSalvaCenarioText   : String ) : Boolean;

    Procedure StartTransactionOrc;
    Procedure CommitOrc;
    Procedure RollBackOrc;

    Procedure AbreCenario;
    Procedure AbreQueries( pIdEmpresa,
                           pspnedExercicioValue : Double );
    Procedure AbrePeriodo( pIdEmpresa,
                           pspnedExercicioValue : Double );

    Property pbAguarde         : TProgressBar   Read FpbAguarde          Write FpbAguarde;
    Property EdtLegenda        : TEdit          Read FEdtLegenda         Write FEdtLegenda;
    Property cdsPeriodo        : TClientDataSet Read FcdsPeriodo         Write SetcdsPeriodo;
    Property cdsPeriodoIni     : TClientDataSet Read FcdsPeriodoIni      Write SetcdsPeriodoIni;
    Property cdsPeriodoFim     : TClientDataSet Read FcdsPeriodoFim      Write SetcdsPeriodoFim;
    Property cdsTestaOrcAnt    : TClientDataSet Read FcdsTestaOrcAnt     Write SetcdsTestaOrcAnt;
    Property cdsOrcado         : TClientDataSet Read FcdsOrcado          Write SetcdsOrcado;
    Property cdsOrcadoAnt      : TClientDataSet Read FcdsOrcadoAnt       Write SetcdsOrcadoAnt;
    Property cdsCenario        : TClientDataSet Read FcdsCenario         Write SetcdsCenario;
    Property cdsSaldoCenario   : TClientDataSet Read FcdsSaldoCenario    Write SetcdsSaldoCenario;
    Property cdsSaldoCenarioAnt: TClientDataSet Read FcdsSaldoCenarioAnt Write SetcdsSaldoCenarioAnt;
    Property cdsTestaOrc       : TClientDataSet Read FcdsTestaOrc        Write SetcdsTestaOrc;
  End;

Implementation
//************************************************
Constructor TCtrlEfetivaCenario.Create;
Begin
  Inherited;

  DtmEfetivaCenario  := TDtmEfetivaCenario.Create( Nil );
  CtrlSaldoOrcado    := TCtrlSaldoOrcado.Create;
  CtrlSaldoOrcadoAnt := TCtrlSaldoOrcadoAnt.Create;
  CtrlValoresCenario := TCtrlValoresCenario.Create;
End;
//************************************************
Procedure TCtrlEfetivaCenario.OnCreateAppServer;
Begin
  Inherited;

  EdtLegenda := TEdit.Create( Nil );
  pbAguarde  := TProgressBar.Create( Nil );
End;
//************************************************
Destructor TCtrlEfetivaCenario.Destroy;
Begin
  Inherited;

  DtmEfetivaCenario.Free;
  CtrlSaldoOrcado.Free;
  CtrlSaldoOrcadoAnt.Free;
  CtrlValoresCenario.Free;

  If isAppServer then begin

    EdtLegenda.Free;
    pbAguarde.Free;
  End;
End;
//************************************************
Procedure TCtrlEfetivaCenario.DoChangeDataBase;
Begin
  Inherited;

End;
//************************************************
Procedure TCtrlEfetivaCenario.AfterInitialize;
Begin
  Inherited;

  CtrlSaldoOrcado.InitializeAs( Self );
  CtrlSaldoOrcadoAnt.InitializeAs( Self );
  CtrlValoresCenario.InitializeAs( Self );
End;
//************************************************
Procedure TCtrlEfetivaCenario.StartTransactionOrc;
Begin

  If ( ConnectionSide = cnsClient ) Then Begin

    Connection.AppServer.StartTransactionOrc;

  End Else Begin

    StartTransaction;
  End;
End;
//************************************************
Procedure TCtrlEfetivaCenario.CommitOrc;
Begin

  If ( ConnectionSide = cnsClient ) Then Begin

    Connection.AppServer.CommitOrc;

  End Else Begin

    Commit;
  End;
End;
//************************************************
Procedure TCtrlEfetivaCenario.RollBackOrc;
Begin

  If ( ConnectionSide = cnsClient ) Then Begin

    Connection.AppServer.RollBackOrc;

  End Else Begin

    RollBack;
  End;
End;
//************************************************
Procedure TCtrlEfetivaCenario.SetcdsCenario(const Value: TClientDataSet);
Begin
  FcdsCenario := Value;
End;
//************************************************
Procedure TCtrlEfetivaCenario.SetcdsOrcado(const Value: TClientDataSet);
Begin
  FcdsOrcado := Value;
End;
//************************************************
Procedure TCtrlEfetivaCenario.SetcdsOrcadoAnt(const Value: TClientDataSet);
Begin
  FcdsOrcadoAnt := Value;
End;
//************************************************
Procedure TCtrlEfetivaCenario.SetcdsPeriodo(const Value: TClientDataSet);
Begin
  FcdsPeriodo := Value;
End;
//************************************************
Procedure TCtrlEfetivaCenario.SetcdsPeriodoFim( const Value: TClientDataSet);
Begin
  FcdsPeriodoFim := Value;
End;
//************************************************
Procedure TCtrlEfetivaCenario.SetcdsPeriodoIni( const Value: TClientDataSet);
Begin
  FcdsPeriodoIni := Value;
End;
//************************************************
Procedure TCtrlEfetivaCenario.SetcdsSaldoCenario( const Value: TClientDataSet);
Begin
  FcdsSaldoCenario := Value;
End;
//************************************************
Procedure TCtrlEfetivaCenario.SetcdsSaldoCenarioAnt( const Value: TClientDataSet);
Begin
  FcdsSaldoCenarioAnt := Value;
End;
//************************************************
Procedure TCtrlEfetivaCenario.SetcdsTestaOrc(const Value: TClientDataSet);
Begin
  FcdsTestaOrc := Value;
End;
//************************************************
Procedure TCtrlEfetivaCenario.SetcdsTestaOrcAnt( const Value: TClientDataSet);
Begin
  FcdsTestaOrcAnt := Value;
End;
//************************************************   
Function TCtrlEfetivaCenario.EfetivaClick( pIdEmpresa,
                                           pIdUsuario              : Integer;
                                           pCenario,
                                           pSalvaCenario           : Double;
                                           pPeriodoIni,
                                           pPeriodoFim             : Integer;
                                           pcbSaldoAnteriorChecked : Boolean;
                                           pspnedExercicioValue    : Double;
                                           pdblcSalvaCenarioText   : String ) : Boolean;
Var
  pPeriodo,
  SalvoAnterior : String;
Begin

  Try
    With DtmEfetivaCenario Do Begin
      StartTransactionOrc;
      
      EdtLegenda.Tag     := 0;
      EdtLegenda.Text    := '';
      EdtLegenda.Visible := True;

      If ( pSalvaCenario <> 0 ) Then Begin

        EdtLegenda.Text := 'Excluindo Valores do Cenário para Salvar Orçado';
        If ( pcbSaldoAnteriorChecked ) Then Begin
          pperiodo := '(PERIODO IS NULL) OR ';
        End Else Begin
          pperiodo := '';
        End;

        CtrlValoresCenario.DeleteValor(  pSalvaCenario,
                                         Trunc( pspnedExercicioValue ),
                                         pPeriodoIni,
                                         pPeriodoFim,
                                         pIdEmpresa,
                                         pPeriodo );

        EdtLegenda.Text := 'Salvando o Orçamento Atual para o Cenário ' + pdblcSalvaCenarioText;

        If ( edtLegenda.Tag = -1 ) Then Abort;

        cdsOrcado.Close;
        sqlOrcado.Prepare;
        sqlOrcado.ParamByName('EXERCICIO').AsFloat  := pspnedExercicioValue;
        sqlOrcado.ParamByName('PERIODOINI').AsFloat := pPeriodoIni;
        sqlOrcado.ParamByName('PERIODOFIM').AsFloat := pPeriodoFim;
        sqlOrcado.ParamByName('IDPESSOA').AsFloat   := pIdEmpresa;
        CdsOrcado.Data := sqlOrcado.Data;

        If ( edtLegenda.Tag = -1 ) Then Abort;

        pbAguarde.Position := 0;
        pbAguarde.Max      := cdsOrcado.RecordCount;
        cdsOrcado.First;
        While ( Not cdsOrcado.Eof ) And
              ( Not edtLegenda.Tag = -1 )    Do Begin
          pbAguarde.Position := pbAguarde.Position + 1;

          If ( Not ( CtrlValoresCenario.InsereValor( CtrlValoresCenario.LerSequencia,
                                                     pSalvaCenario,
                                                     cdsOrcado.FieldByName('IDPLANOORCAMEN').AsFloat,
                                                     cdsOrcado.FieldByName('EXERCICIO').AsInteger,
                                                     cdsOrcado.FieldByName('PERIODO').AsInteger,
                                                     cdsOrcado.FieldByName('IDPESSOA').AsFloat,
                                                     cdsOrcado.FieldByName('IDCONTAORCAMEN').AsString,
                                                     cdsOrcado.FieldByName('VLRORCADO').AsFloat) ) ) Then Begin
            edtLegenda.Tag := -1;
          End;
          cdsOrcado.Next;
        End;

        If ( edtLegenda.Tag = -1 ) Then Abort;

        If pcbSaldoAnteriorChecked Then Begin
          cdsOrcadoAnt.Close;
          sqlOrcadoAnt.Prepare;
          sqlOrcadoAnt.ParamByName('EXERCICIO').AsFloat  := pspnedExercicioValue;
          sqlOrcadoAnt.ParamByName('IDPESSOA').AsFloat   := pIdEmpresa;
          cdsOrcadoAnt.Data := sqlOrcadoAnt.Data;

          pbAguarde.Position := 0;
          pbAguarde.Max      := cdsOrcadoAnt.RecordCount;
          cdsOrcadoAnt.First;
          While ( Not cdsOrcadoAnt.Eof )    And
                ( Not edtLegenda.Tag = -1 ) Do Begin

            pbAguarde.Position := pbAguarde.Position + 1;
            CtrlValoresCenario.InsereValor( CtrlValoresCenario.LerSequencia,
                                            pSalvaCenario,
                                            cdsOrcadoAnt.FieldByName('IDPLANOORCAMEN').AsFloat,
                                            cdsOrcadoAnt.FieldByName('EXERCICIO').AsInteger,
                                            null, cdsOrcadoAnt.FieldByName('IDPESSOA').AsFloat,
                                            cdsOrcadoAnt.FieldByName('IDCONTAORCAMEN').AsString,
                                            cdsOrcadoAnt.FieldByName('VLRORCADO').AsFloat);
            cdsOrcadoAnt.Next;
          End;
        End;
      End;

      EdtLegenda.Text := 'Excluindo Orçamento Atual';

      If ( edtLegenda.Tag = -1 ) Then Abort;

      CtrlSaldoOrcado.AltSaldos3( pIdEmpresa,
                                  Trunc( pspnedExercicioValue ),
                                  pPeriodoIni,
                                  pPeriodoFim, 0, 0 );


      If ( edtLegenda.Tag = -1 ) Then Abort;

      If pcbSaldoAnteriorChecked then begin
        CtrlSaldoOrcadoAnt.ZeraValorOrcado( pIdEmpresa,
                                            Trunc( pspnedExercicioValue ) );
      End;

      If ( edtLegenda.Tag = -1 ) Then Abort;

      cdsSaldoCenario.Close;
      with sqlSaldoCenario do begin
        Prepare;
        ParamByName('EXERCICIO').AsFloat        := pspnedExercicioValue;
        ParamByName('PERIODOINI').AsFloat       := pPeriodoIni;
        ParamByName('PERIODOFIM').AsFloat       := pPeriodoFim;
        ParamByName('IDPESSOA').AsFloat         := pIdEmpresa;
        ParamByName('IDCENARIOORCAMEN').AsFloat := pCenario;
        cdsSaldoCenario.Data := Data;
      end;

      EdtLegenda.Text := 'Atualizando o Novo Orçamento';

      If ( edtLegenda.Tag = -1 ) Then Abort;

      pbAguarde.Position := 0;
      pbAguarde.Max      := cdsSaldoCenario.RecordCount;
      cdsSaldoCenario.First;
      While ( Not cdsSaldoCenario.Eof ) And
            ( Not edtLegenda.Tag = -1 ) Do Begin

        pbAguarde.Position := pbAguarde.Position + 1;
        cdsTestaOrc.Close;
        sqlTestaOrc.Prepare;
        sqlTestaOrc.ParamByName('DATAREFERENCIA').AsDateTime := cdsSaldoCenario.FieldByName('DATAFIMPERIODO').AsDateTime;
        sqlTestaOrc.ParamByName('IDCONTAORCAMEN').AsString   := cdsSaldoCenario.FieldByName('IDCONTAORCAMEN').AsString;
        sqlTestaOrc.ParamByName('IDPLANOORCAMEN').AsFloat    := cdsSaldoCenario.FieldByName('IDPLANOORCAMEN').AsFloat;
        sqlTestaOrc.ParamByName('IDPESSOA').AsFloat          := cdsSaldoCenario.FieldByName('IDPESSOA').AsFloat;
        cdsTestaOrc.Data := sqlTestaOrc.Data;

        If cdsTestaOrc.IsEmpty Then Begin
          //Insere registro
          CtrlSaldoOrcado.InsereSaldo( cdsSaldoCenario.FieldByName('EXERCICIO').AsInteger,
                        cdsSaldoCenario.FieldByName('PERIODO').AsInteger,
                        cdsSaldoCenario.FieldByName('IDPLANOORCAMEN').AsFloat,
                        pIdEmpresa,
                        cdsSaldoCenario.FieldByName('IDCONTAORCAMEN').asString,
                        FormatDateTime('dd/mm/yyyy', cdsSaldoCenario.FieldByName('DATAFIMPERIODO').AsDateTime),
                        cdsSaldoCenario.FieldByName('VLRORCCENARIO').AsFloat,0,0,
                        0,cdsSaldoCenario.FieldByName('VLRORCCENARIO').AsFloat,0);
        End Else Begin
          //Altera registro
          CtrlSaldoOrcado.AltSaldos4( PidEmpresa,
                        cdsSaldoCenario.FieldByName('IDPLANOORCAMEN').AsFloat,
                        cdsSaldoCenario.FieldByName('IDCONTAORCAMEN').AsString,
                        FormatDateTime('dd/mm/yyyy', cdsSaldoCenario.FieldByName('DATAFIMPERIODO').AsDateTime),
                        cdsSaldoCenario.FieldByName('VLRORCCENARIO').AsFloat,
                        cdsSaldoCenario.FieldByName('VLRORCCENARIO').AsFloat);
        End;
        cdsSaldoCenario.Next;
      End;

      If pcbSaldoAnteriorChecked Then Begin
        cdsSaldoCenarioAnt.Close;
        With sqlSaldoCenarioAnt Do Begin
          Prepare;
          ParamByName('EXERCICIO').AsFloat        := pspnedExercicioValue;
          ParamByName('IDPESSOA').AsFloat         := pIdEmpresa;
          ParamByName('IDCENARIOORCAMEN').AsFloat := pCenario;
          cdsSaldoCenarioAnt.Data := Data;
        end;

        EdtLegenda.Text := 'Atualizando o Novo Orçamento - Saldo Anterior';

        If ( edtLegenda.Tag = -1 ) Then Abort;

        pbAguarde.Position := 0;
        pbAguarde.Max      := cdsSaldoCenarioAnt.RecordCount;
        cdsSaldoCenarioAnt.First;
        While ( not cdsSaldoCenarioAnt.Eof ) And
              ( Not edtLegenda.Tag = -1 )    Do Begin

          pbAguarde.Position := pbAguarde.Position + 1;
          cdsTestaOrcAnt.Close;
          sqlTestaOrcAnt.Prepare;
          sqlTestaOrcAnt.ParamByName('EXERCICIO').AsFloat       := pspnedExercicioValue;
          sqlTestaOrcAnt.ParamByName('IDCONTAORCAMEN').AsString := cdsSaldoCenarioAnt.FieldByName('IDCONTAORCAMEN').AsString;
          sqlTestaOrcAnt.ParamByName('IDPLANOORCAMEN').AsFloat  := cdsSaldoCenarioAnt.FieldByName('IDPLANOORCAMEN').AsFloat;
          sqlTestaOrcAnt.ParamByName('IDPESSOA').AsFloat        := cdsSaldoCenarioAnt.FieldByName('IDPESSOA').AsFloat;
          cdsTestaOrcAnt.Data := sqlTestaOrcAnt.Data;
          if cdsTestaOrcAnt.IsEmpty then begin
            //Insere registro
            CtrlSaldoOrcadoAnt.InsereSaldoAnt(
                       cdsSaldoCenarioAnt.FieldByName('IDPLANOORCAMEN').AsFloat,
                       cdsSaldoCenarioAnt.FieldByName('EXERCICIO').AsInteger,
                       pIdEmpresa,
                       cdsSaldoCenarioAnt.FieldByName('IDCONTAORCAMEN').asString,
                       0,cdsSaldoCenarioAnt.FieldByName('VLRORCCENARIO').AsFloat);
          End Else Begin
            //Altera registro
            CtrlSaldoOrcadoAnt.AltSaldoAnt(
                       cdsSaldoCenarioAnt.FieldByName('IDPLANOORCAMEN').AsFloat,
                       cdsSaldoCenarioAnt.FieldByName('EXERCICIO').AsInteger,
                       pIdEmpresa,
                       cdsSaldoCenarioAnt.FieldByName('IDCONTAORCAMEN').asString,
                       cdsSaldoCenarioAnt.FieldByName('VLRORCCENARIO').AsFloat);
          End;
          cdsSaldoCenarioAnt.Next;
        End;
      End;
    End;
    If ( edtLegenda.Tag = -1 ) Then Abort;

    If ( pcbSaldoAnteriorChecked ) Then Begin

      SalvoAnterior := 'S';
    End Else Begin

      SalvoAnterior := 'N';
    End;

    CtrlValoresCenario.GravaLogCenario( pSalvaCenario,
                                        pPeriodoIni,
                                        pPeriodoFim,
                                        pspnedExercicioValue,
                                        pCenario,
                                        pIdEmpresa,
                                        pIdUsuario,
                                        SalvoAnterior );
    CommitOrc;
    Result := True;

  Except
    Result := False;
    RollBackOrc;
  End;
End;
//************************************************
Procedure TCtrlEfetivaCenario.AbreCenario;
Begin

  DtmEfetivaCenario.sqlCenario.Prepare;
  CdsCenario.Data := DtmEfetivaCenario.sqlCenario.Data;
End;
//************************************************
Procedure TCtrlEfetivaCenario.AbreQueries( pIdEmpresa,
                                           pspnedExercicioValue : Double );
Begin

  With DtmEfetivaCenario Do Begin
    cdsPeriodoIni.Close;
    sqlPeriodoIni.Prepare;
    sqlPeriodoIni.ParamByName('IDPESSOA').AsFloat    := pidEmpresa;
    sqlPeriodoIni.ParamByName('EXERCICIO').AsInteger := Trunc( pspnedExercicioValue );
    cdsPeriodoIni.Data := sqlPeriodoIni.Data;
    cdsPeriodoIni.First;

    cdsPeriodoFim.Close;
    sqlPeriodoFim.Prepare;
    sqlPeriodoFim.ParamByName('IDPESSOA').AsFloat    := pidEmpresa;
    sqlPeriodoFim.ParamByName('EXERCICIO').AsInteger := Trunc( pspnedExercicioValue );
    cdsPeriodoFim.Data := sqlPeriodoFim.Data;
    cdsPeriodoFim.Last;
  End;
End;
//************************************************
Procedure TCtrlEfetivaCenario.AbrePeriodo( pIdEmpresa,
                                           pspnedExercicioValue : Double );
Begin
  cdsPeriodo.Close;
  With dtmEfetivaCenario.sqlPeriodo Do Begin
    Prepare;
    ParamByName('PESSOA').AsFloat    := pIdEmpresa;
    ParamByName('EXERCICIO').AsFloat := pspnedExercicioValue;
    cdsPeriodo.Data := Data;
  End;
End;
//************************************************
End.


