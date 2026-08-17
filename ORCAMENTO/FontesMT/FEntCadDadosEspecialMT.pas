// Atualizado em: 30/10/2003 - André Tavares - pendência 15026
// 17184 - FDias - 14.07.2004
Unit
  FEntCadDadosEspecialMT;

Interface

Uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls,
  wwdbedit, TREdit, Mask, Wwdbspin, Spin, Db, DBTables, Wwquery,
  MontaSelect, Wwdatsrc, Grids, Wwdbigrd, Wwdbgrid, FOkCancelar, DBCtrls,
  IvDictio, IvMulti, IvEMulti, wwdblook, CMDBLookupCombo, CMProcuraMask,
  DBClient, uCMClientDataSet, uCmSqlParams, uCMTypes, uCtrlEntCadDadosEspecial;

Type
  TOperacao = (opVazio, opIdle, opInserir, opAlterar, opProcurar, opApagar);

  TfrmEntCadDadosEspecialMT = class(TfrmOkCancelar)
    lblExercicio: TLabel;
    lblPeriodo: TLabel;
    dbgrdSaldo: TwwDBGrid;
    dsSaldo: TwwDataSource;
    redValorBase: TRealEdit;
    dblcCriterio: TCMDBLookupCombo;
    lblCriterio: TLabel;
    Label21: TLabel;
    dblcPlanoTrabalho: TwwDBLookupCombo;
    pnlPlanoPatroP: TPanel;
    Label22: TLabel;
    Label23: TLabel;
    dblcPlanoParamConta: TwwDBLookupCombo;
    dblcPatroParamConta: TwwDBLookupCombo;
    lblValBase: TLabel;
    BtCalc: TBitBtn;
    dblcExercicio: TwwDBLookupCombo;
    dblcPeriodo: TwwDBLookupCombo;
    pnlValores: TPanel;
    dblblNomeCentroCusto: TDBText;
    dblblCodCentroCusto: TDBText;
    dbreValorCentCust: TDBRealEdit;
    Label1: TLabel;
    sttAcumuladoOri: TStaticText;
    sttAcumulado: TStaticText;
    cdsSaldo: TCMClientDataSet;
    cdsPeriodo: TCMClientDataSet;
    cdsValorCCustAux: TCMClientDataSet;
    cdsGrupo: TCMClientDataSet;
    cdsCompOrcamen: TCMClientDataSet;
    cdsValorCentCust: TCMClientDataSet;
    cdsPlanoTrabalho: TCMClientDataSet;
    cdsCriterio: TCMClientDataSet;
    cdsSaldoContabil: TCMClientDataSet;
    cdsPatroConta: TCMClientDataSet;
    cdsDataView: TCMClientDataSet;
    cdsPlanoPrevConta: TCMClientDataSet;
    cdsExercicio: TCMClientDataSet;
    cdsContaSaldo: TCMClientDataSet;
    MontaSelectGrupo: TMontaSelect;
    cdsSaldoCODCENTROCUSTO: TStringField;
    cdsSaldoNOME: TStringField;
    cdsSaldoVLRRATEIOORI: TCurrencyField;
    cdsSaldoVLRORCADO: TCurrencyField;
    cdsSaldoIDCONTAORCAMEN: TStringField;
    cdsSaldoNOMECONTAORCAMEN: TStringField;
    cdsSaldoIDPLANOORCAMEN: TFloatField;
    cdsSaldoFLGSINALCONTA: TStringField;
    cdsSaldoFATORRATEIO: TFloatField;
    cdsSaldoVALORCC: TCurrencyField;
    bbtnZerar: TBitBtn;
    dbeGrupo: TCMProcuraMask;
    dtsGrupo: TDataSource;
    sqlGrupo: TCMSqlParams;
    procedure FormCreate(Sender: TObject);
    procedure cdsSaldoAfterPost(DataSet: TDataSet);
    procedure cdsSaldoBeforeEdit(DataSet: TDataSet);
    procedure dblcExercicioCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure dblcPeriodoCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure dblcPlanoTrabalhoCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure dblcPlanoParamContaCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure dblcPatroParamContaCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure dblcCriterioCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure BtCalcClick(Sender: TObject);
    procedure dbreValorCentCustEnter(Sender: TObject);
    procedure dbreValorCentCustExit(Sender: TObject);
    procedure dbgrdSaldoCalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont;
      ABrush: TBrush);
    procedure dbgrdSaldoTopRowChanged(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    function AbreSaldos(bMostraMsg:Boolean) : Boolean;
    procedure bbtnZerarClick(Sender: TObject);
    Procedure dbeGrupoExit(Sender: TObject);
  Private
    { Private declarations }
    CtrlEntCadDadosEspecial : TCtrlEntCadDadosEspecial;
    Acumulado,
    AcumuladoOri    : Currency;
    Procedure TotalizaAcumulado;
  Public
    { Public declarations }

  End;

Const
  ZERAR   = 0;
  RATEIAR = 1;
  NADA    = 2;

Var
  frmEntCadDadosEspecialMT : TfrmEntCadDadosEspecialMT;
  iGrupo                   : LongInt;
  UltimaOperacao           : Word;

Implementation

Uses
  UMensErro, uDatabase, DBaseDados, uAutorizacao, uSistema, uModulo, uString, fAguarde;

{$R *.DFM}
//************************************************
Procedure TfrmEntCadDadosEspecialMT.FormCreate(Sender: TObject);
Begin
  Inherited;

  UltimaOperacao          := NADA;
  dbeGrupo.Mascara        := Modulo.sMascaraGrupo;
  pnlPlanoPatroP.Enabled  := Sistema.UsaPlanoPatro;
  sttAcumulado.Caption    := '';
  sttAcumuladoOri.Caption := '';

  MontaSelectGrupo.Filtro.Add('IDPLANOORCAMEN = ' + IntToStr(Modulo.iPlanoOrc));

  cdsGrupo.Close;
  With sqlGrupo Do Begin
    If Not Prepared Then Prepare;
    ParamByName('CODGRUPOORC').AsString := '';
    ParamByName('IPLANOORC').AsInteger  := Modulo.iPlanoOrc;    // 17184 - FDias - 14.07.2004
    cdsGrupo.Data := Data;
  End;

  CtrlEntCadDadosEspecial := TCtrlEntCadDadosEspecial.Create;
  CtrlEntCadDadosEspecial.Initialize( DtmBaseDados.dbBaseDados, True,
                              Sistema.ConnectionType,   Sistema.ConnectionSide,
                              Sistema.AppRemoteServer,  True, nil, nil, False );

  CtrlEntCadDadosEspecial.pIdEmpresa := Sistema.IdEmpresa;
  CtrlEntCadDadosEspecial.pIdUsuario := Sistema.IdUsuario;

  CtrlEntCadDadosEspecial.CdsSaldo          := CdsSaldo;
  CtrlEntCadDadosEspecial.CdsPeriodo        := CdsPeriodo;
  CtrlEntCadDadosEspecial.CdsValorCCustAux  := CdsValorCCustAux;
  CtrlEntCadDadosEspecial.CdsGrupo          := CdsGrupo;
  CtrlEntCadDadosEspecial.CdsCompOrcamen    := CdsCompOrcamen;
  CtrlEntCadDadosEspecial.CdsValorCentCust  := CdsValorCentCust;
  CtrlEntCadDadosEspecial.CdsPlanoTrabalho  := CdsPlanoTrabalho;
  CtrlEntCadDadosEspecial.CdsCriterio       := CdsCriterio;
  CtrlEntCadDadosEspecial.CdsSaldoContabil  := CdsSaldoContabil;
  CtrlEntCadDadosEspecial.CdsPatroConta     := CdsPatroConta;
  CtrlEntCadDadosEspecial.CdsDataView       := CdsDataView;
  CtrlEntCadDadosEspecial.CdsPlanoPrevConta := CdsPlanoPrevConta;
  CtrlEntCadDadosEspecial.CdsExercicio      := CdsExercicio;
  CtrlEntCadDadosEspecial.CdsContaSaldo     := CdsContaSaldo;

  CtrlEntCadDadosEspecial.AbreQueries;
  AbreSaldos( False );
End;

procedure TfrmEntCadDadosEspecialMT.cdsSaldoAfterPost(DataSet: TDataSet);
begin
  Inherited;

  Acumulado               := Acumulado + cdsSaldo.FieldByName('VLRORCADO').AsFloat;
  AcumuladoOri            := AcumuladoOri + cdsSaldo.FieldByName('VLRRATEIOORI').AsFloat;
  sttAcumulado.Caption    := FormatCurr( '###,###,##0.00', Acumulado );
  sttAcumuladoOri.Caption := FormatCurr( '###,###,##0.00', AcumuladoOri );
end;

procedure TfrmEntCadDadosEspecialMT.cdsSaldoBeforeEdit(DataSet: TDataSet);
begin
  inherited;

  Acumulado    := Acumulado - cdsSaldo.FieldByName('VLRORCADO').AsFloat;
  AcumuladoOri := AcumuladoOri - cdsSaldo.FieldByName('VLRRATEIOORI').AsFloat;
end;
//************************************************
Procedure TfrmEntCadDadosEspecialMT.dblcExercicioCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
Begin
  Inherited;

  If ( Modified ) Then Begin
    CtrlEntCadDadosEspecial.AbrePeriodo( dblcExercicio.Text,
                                         dblcExercicio.LookupValue );
    AbreSaldos(False);
  End;
End;

procedure TfrmEntCadDadosEspecialMT.dblcPeriodoCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  if modified then
    AbreSaldos(False);
end;


procedure TfrmEntCadDadosEspecialMT.dblcPlanoTrabalhoCloseUp(
  Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  if modified then
    AbreSaldos(False);
end;

procedure TfrmEntCadDadosEspecialMT.dblcPlanoParamContaCloseUp(
  Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  if modified then
    AbreSaldos(False);
end;

procedure TfrmEntCadDadosEspecialMT.dblcPatroParamContaCloseUp(
  Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  if modified then
    AbreSaldos(False);
end;
//************************************************
Procedure TfrmEntCadDadosEspecialMT.dblcCriterioCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
Begin
  Inherited;
  If (redValorBase.Value = 0) and
     (not cdsCriterio.FieldByName('PERNUMERO').IsNull) then begin

    If ( CtrlEntCadDadosEspecial.dblcCriterioCloseUp( dblcPlanoParamConta.Text,
                                                      dblcPlanoParamConta.LookupValue,
                                                      dblcPatroParamConta.Text,
                                                      dblcPatroParamConta.LookupValue,
                                                      iGrupo ) ) Then Begin
      If ( CdsSaldoContabil.Active ) Then Begin

        If ( Trim( dblcPeriodo.Text ) = '' ) Or
           ( Trim( dblcPeriodo.Text ) = 'Anual' ) Then Begin

          redValorBase.Value := ( cdsSaldoContabil.FieldByName('SALDOCONTAB').AsFloat * 12 )
        End Else Begin
          redValorBase.Value := cdsSaldoContabil.FieldByName('SALDOCONTAB').AsFloat;
        End;
      End;
    End Else Begin

      MsgDlg( CtrlEntCadDadosEspecial.MessageInfo, 'Erro', mtError, [ mbOk ], 0 );
    End;
  End;
End;
//************************************************
Procedure TfrmEntCadDadosEspecialMT.BtCalcClick(Sender: TObject);
Begin
  Inherited;

  If trim(dblcCriterio.Text) = '' Then Begin
    MsgDlg('Obrigatório indicar o Critério', 'Erro', mtError, [mbOk], 0);
    dblcCriterio.SetFocus;
    Exit;
  End;

  If ( redValorBase.Value = 0 ) Then Begin
    MsgDlg( 'Valor para rateio não pode ser igual a zero', 'Erro', mtError, [mbOk], 0);
    redValorBase.SetFocus;
    Exit;
  End;

  If ( CtrlEntCadDadosEspecial.BtCalcClick( dblcPeriodo.Text,
                                            dblcPeriodo.LookupValue,
                                            dblcExercicio.Text,
                                            dblcExercicio.LookupValue,
                                            dblcCriterio.LookUpValue,
                                            redValorBase.Value ) ) Then Begin
    UltimaOperacao := RATEIAR;
  End Else Begin

    MsgDlg( CtrlEntCadDadosEspecial.MessageInfo, 'Erro', mtError, [ mbOk ], 0 );
  End;
End;

procedure TfrmEntCadDadosEspecialMT.dbreValorCentCustEnter(Sender: TObject);
begin
  inherited;
  cdsSaldo.Edit;
end;

procedure TfrmEntCadDadosEspecialMT.dbreValorCentCustExit(Sender: TObject);
begin
  inherited;
  cdsSaldo.Post;

end;

procedure TfrmEntCadDadosEspecialMT.dbgrdSaldoCalcCellColors(Sender: TObject;
  Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont;
  ABrush: TBrush);
begin
  inherited;
  //Faz com que as linhas do grid tenham cores alternadas
  if State <> [gdSelected] then begin
    if not Highlight then begin
      if ((Sender as TwwDBGrid).CalcCellRow mod 2) = 0 then begin
        ABrush.color := clwhite
      end else begin
        ABrush.Color := $00C0FFFF; //Amarelo Bebê
      end;
    end;
  end else begin
    ABrush.Color := clHighLight;
    AFont.Color  := clHighLightText;
  end;
end;

procedure TfrmEntCadDadosEspecialMT.dbgrdSaldoTopRowChanged(Sender: TObject);
begin
  inherited;
  //Acerta as cores quando muda a linha da grid
  dbgrdSaldo.invalidate;
end;
//************************************************
Procedure TfrmEntCadDadosEspecialMT.bbtnConfirmarClick(Sender: TObject);
Var
  rTotal : Double;
Begin
  Inherited;

  cdsSaldo.First;
  If ( cdsSaldo.Eof ) Then Begin

    Msgdlg( 'Não existem dados para serem gravados', 'Aviso', mtWarning, [ mbOk ], 0 );

  End Else Begin

    If ( UltimaOperacao <> ZERAR ) And
       ( Trim( dblcCriterio.Text ) = '' ) Then Begin

      MsgDlg('Obrigatório indicar o Critério', 'Erro', mtError, [mbOk], 0);
      dblcCriterio.SetFocus;
      Exit;
    End;

    cdsSaldo.DisableControls;
    rTotal := 0;
    cdsSaldo.First;
    While Not cdsSaldo.Eof Do Begin
      rTotal := rTotal + cdsSaldo.FieldByName('VLRORCADO').AsFloat;
      cdsSaldo.Next;
    End;
    cdsSaldo.First;
    cdsSaldo.EnableControls;
    If Format('%17.2f',[redValorBase.Value]) <> Format('%17.2f',[rTotal]) Then Begin
      If MsgDlg('Total dos Centros de Custo não bate com o Valor para Rateio.Confirma?',
                'Confirmação',mtConfirmation, [ mbYes, mbNo ], 0 ) = mrNo Then Begin
        redValorBase.SetFocus;
        Exit;
      End;
    End;
    Try
      screen.cursor := crSQLWait;
      If CtrlEntCadDadosEspecial.bbtnConfirmarClick( dblcPeriodo.Text,
                                                     dblcPeriodo.LookupValue,
                                                     dblcCriterio.LookupValue,
                                                     dblcExercicio.LookupValue ) Then Begin
        dblcPeriodo.SetFocus;
      End Else Begin
        dbreValorCentCust.SetFocus;
      End;
    Finally
      screen.cursor := crDefault;
      cdsSaldo.EnableControls;
      cdsSaldo.First;
      MsgDlg( CtrlEntCadDadosEspecial.MessageInfo,'Aviso', mtWarning, [ mbOk ], 0 );
    End;
  End;
// início - André Tavares - pendência 15026
  try
    Sistema.GravaLogOperacoes('Entrada de Dados Especial.');
  except
    Raise Exception.Create('Não foi possível Gravar o Log');
  end;
// fim - André Tavares - pendência 15026

End;
//************************************************
Function TfrmEntCadDadosEspecialMT.AbreSaldos( bMostraMsg:Boolean ) : Boolean;
Begin
  //Abre a query de Saldos de acordo com os parâmetros fornecidos
  redValorBase.Value := 0;
  cdsSaldo.Close;

  If ( CtrlEntCadDadosEspecial.AbreSaldos ( dblcPeriodo.Text,
                                            dblcPeriodo.LookupValue,
                                            dblcPlanoTrabalho.Text,
                                            dblcPlanoParamConta.Text,
                                            dblcPlanoParamConta.LookupValue,
                                            dblcPatroParamConta.Text,
                                            dblcPatroParamConta.LookupValue,
                                            dblcExercicio.Text,
                                            dblcExercicio.LookupValue ) ) Then Begin
    dbreValorCentCust.Enabled := ( Not CdsSaldo.IsEmpty );
    TotalizaAcumulado;
    Result := True;
    cdsSaldo.First;
  End Else Begin
    Result := False;
    MsgDlg( CtrlEntCadDadosEspecial.MessageInfo, 'Erro', mtError, [ mbOk ], 0 );
  End;
End;


Procedure TfrmEntCadDadosEspecialMT.TotalizaAcumulado;
Begin
  Acumulado    := 0;
  AcumuladoOri := 0;
  cdsSaldo.First;
  While not cdsSaldo.Eof do begin
    Acumulado := Acumulado + cdsSaldo.FieldByName('VLRORCADO').AsFloat;
    AcumuladoOri := AcumuladoOri + cdsSaldo.FieldByName('VLRRATEIOORI').AsFloat;
    cdsSaldo.Next;
  End;
  sttAcumulado.Caption := FormatCurr( '###,###,##0.00', Acumulado );
  sttAcumuladoOri.Caption := FormatCurr( '###,###,##0.00', AcumuladoOri );
  if redValorBase.Value = 0 then
    redValorBase.Value   := AcumuladoOri;
End;
//************************************************
Procedure TfrmEntCadDadosEspecialMT.bbtnZerarClick(Sender: TObject);
Begin

  If ( mrYes = MsgDlg('Deseja ZERAR TODOS os valores', 'Confirmação', mtConfirmation, [ mbNo, mbYes ], 0 ) ) Then Begin

    CdsSaldo.DisableControls;
    CdsSaldo.First;
    While ( Not CdsSaldo.Eof ) Do Begin

      CdsSaldo.Edit;
      CdsSaldoVLRORCADO.AsFloat    := 0;
      CdsSaldoVLRRATEIOORI.AsFloat := 0;
      CdsSaldo.Post;

      CdsSaldo.Next;
    End;
    
    CdsSaldo.First;
    CdsSaldo.EnableControls;
    redValorBase.Value := 0;
    UltimaOperacao     := ZERAR;
  End;
End;
//************************************************
Procedure TfrmEntCadDadosEspecialMT.dbeGrupoExit(Sender: TObject);
Begin
  Inherited;

  If ( ActiveControl.Tag <> 999 ) Then Begin
    If ( dbeGrupo.Valida <> VcOK ) Then Begin
      dbeGrupo.SetFocus
    End Else Begin
      If cdsGrupo.IsEmpty Then Begin
        iGrupo := -1;
        If dbeGrupo.CanFocus Then dbeGrupo.SetFocus;
      End Else Begin
        iGrupo := cdsGrupo.FieldByName('IDGRUPOORCAMEN').AsInteger;
      End;
    End;
  End;
End;
//************************************************
End.
