{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Analista Responsável: Davi Ramos                      }
{ Atualizado Em: Julho/2002                             }
//               30/10/2003 - André Tavares - pendência 15026
{                                                       }
{*******************************************************}
Unit FEntCadDadosEspecialCenarioMT;

Interface

Uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls,
  wwdbedit, TREdit, Mask, Wwdbspin, Spin, Db, DBTables, Wwquery,
  MontaSelect, Wwdatsrc, Grids, Wwdbigrd, Wwdbgrid, FOkCancelar, DBCtrls,
  IvDictio, IvMulti, IvEMulti, wwdblook, CMDBLookupCombo, CMProcuraMask,
  DBClient, uCMClientDataSet, uCmSqlParams, uCMTypes, uCtrlValorescenario,

  uCtrlBlqEntDados;


Type
  TOperacao = (opVazio, opIdle, opInserir, opAlterar, opProcurar, opApagar);

  TfrmEntCadDadosEspecialCenarioMT = class(TfrmOkCancelar)
    lblExercicio: TLabel;
    lblPeriodo: TLabel;
    dbgrdSaldo: TwwDBGrid;
    dsSaldo: TwwDataSource;
    redValorBase: TRealEdit;
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
    sqlSaldo: TCMSqlParams;
    cdsSaldo: TCMClientDataSet;
    sqlPeriodo: TCMSqlParams;
    cdsPeriodo: TCMClientDataSet;
    sqlValorCCustAux: TCMSqlParams;
    cdsValorCCustAux: TCMClientDataSet;
    sqlGrupo: TCMSqlParams;
    cdsGrupo: TCMClientDataSet;
    sqlCompOrcamen: TCMSqlParams;
    cdsCompOrcamen: TCMClientDataSet;
    sqlValorCentCust: TCMSqlParams;
    cdsValorCentCust: TCMClientDataSet;
    sqlPlanoTrabalho: TCMSqlParams;
    cdsPlanoTrabalho: TCMClientDataSet;
    sqlCriterio: TCMSqlParams;
    cdsCriterio: TCMClientDataSet;
    sqlSaldoContabil: TCMSqlParams;
    cdsSaldoContabil: TCMClientDataSet;
    sqlPatroConta: TCMSqlParams;
    cdsPatroConta: TCMClientDataSet;
    sqlDataView: TCMSqlParams;
    cdsDataView: TCMClientDataSet;
    sqlPlanoPrevConta: TCMSqlParams;
    cdsPlanoPrevConta: TCMClientDataSet;
    sqlExercicio: TCMSqlParams;
    cdsExercicio: TCMClientDataSet;
    sqlContaSaldo: TCMSqlParams;
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
    sqlCenario: TCMSqlParams;
    cdsCenario: TCMClientDataSet;
    dblcCenario: TCMDBLookupCombo;
    lblCenario: TLabel;
    dbeGrupo: TCMProcuraMask;
    dtsGrupo: TDataSource;
    cdsSaldoIDCRITERIORATORC: TFloatField;
    dtsCriterio: TDataSource;
    dblcCriterio1: TDBLookupComboBox;
    procedure FormCreate(Sender: TObject);
    procedure sqlSaldoFormartParam(sParamName, sOldValue: String;
      var sNewValue: String);
    procedure sqlCompOrcamenFormartParam(sParamName, sOldValue: String;
      var sNewValue: String);
    procedure sqlSaldoContabilFormartParam(sParamName, sOldValue: String;
      var sNewValue: String);
    procedure sqlValorCentCustFormartParam(sParamName, sOldValue: String;
      var sNewValue: String);
    procedure cdsSaldoAfterPost(DataSet: TDataSet);
    procedure cdsSaldoBeforeEdit(DataSet: TDataSet);
    procedure dblcPeriodoCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure dblcPlanoTrabalhoCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure dblcPlanoParamContaCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure dblcPatroParamContaCloseUp(Sender: TObject; LookupTable,
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
    procedure dbeGrupoExit(Sender: TObject);
    procedure dblcExercicioCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure dblcCriterio1CloseUp(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  Private
    { Private declarations }
    CtrlValorescenario: TCtrlValorescenario;
    CtrlBlqEntDados: TCtrlBlqEntDados;

    Acumulado, AcumuladoOri : Currency;
    Inicio : Boolean;

    Procedure TotalizaAcumulado;

  Public
    { Public declarations }
  End;

Const
  ZERAR   = 0;
  RATEIAR = 1;
  NADA    = 2;

Var
  frmEntCadDadosEspecialCenarioMT : TfrmEntCadDadosEspecialCenarioMT;
  iGrupo                          : LongInt;
  UltimaOperacao                  : Word;

Implementation

Uses
  UMensErro,  uDatabase, DBaseDados, uAutorizacao, uSistema, uModulo, uString;

{$R *.DFM}

Procedure TfrmEntCadDadosEspecialCenarioMT.FormCreate(Sender: TObject);
Begin
  Inherited;

  UltimaOperacao         := NADA;
  dbeGrupo.Mascara       := Modulo.sMascaraGrupo;
  pnlPlanoPatroP.Enabled := Sistema.UsaPlanoPatro;

  MontaSelectGrupo.Filtro.Add('IDPLANOORCAMEN = ' + IntToStr(Modulo.iPlanoOrc));
  
  CtrlValorescenario      := TCtrlValorescenario.Create;

  CtrlValorescenario.Initialize( DtmBaseDados.dbBaseDados, True,
                                 Sistema.ConnectionType,   Sistema.ConnectionSide,
                                 Sistema.AppRemoteServer,  True, nil, nil, False );

  CtrlBlqEntDados := TCtrlBlqEntDados.Create;
  CtrlBlqEntDados.InitializeAs(CtrlValorescenario);

  CtrlValorescenario.CdsSaldo      := CdsSaldo;
  CtrlValorescenario.CdsPeriodo    := CdsPeriodo;
  CtrlValorescenario.cdsContaSaldo := cdsContaSaldo;

  sttAcumulado.Caption    := '';
  sttAcumuladoOri.Caption := '';

  //Seleciona os Grupos Orçamentários
  cdsGrupo.Close;
  with sqlGrupo do begin
    if not Prepared then Prepare;
    ParamByName('CODGRUPOORC').AsString := '';
    ParamByName('IPLANOORC').AsInteger  := Modulo.iPlanoOrc;
    Open;
  end;

  cdsPlanoTrabalho.Close;
  with sqlPlanoTrabalho do begin
    Prepare;
    ParamByName('IDPESSOA').asInteger  := Sistema.idEmpresa;
    ParamByName('IDUSUARIO').asInteger := Sistema.IdUsuario;
    ParamByName('Data').AsDateTime     := Date;
    Open;
  end;

  cdsCriterio.Close;
  with sqlCriterio do begin
    Prepare;
    ParamByName('IDPESSOA').asInteger := Sistema.idEmpresa;
    Open;
  end;

  cdsPlanoPrevConta.Close;
  with sqlPlanoPrevConta do begin
    Prepare;
    Open;
  end;

  cdsPatroConta.Close;
  with sqlPatroConta do begin
    Prepare;
    Open;
  end;

  With sqlCenario Do Begin
    Open;
  End;

  CdsExercicio.Close;
  With sqlExercicio Do Begin
    Prepare;
    ParamByName('IDPESSOA').asInteger   := Sistema.idEmpresa;
    Open;
  End;

  Inicio := True;
  AbreSaldos(False);
  Inicio := False;
end;

procedure TfrmEntCadDadosEspecialCenarioMT.sqlSaldoFormartParam(sParamName,
  sOldValue: String; var sNewValue: String);
begin
  inherited;
  if (sParamName = 'PERIODO') or (sParamName = 'UNIDNEGOC') or
     (sParamName = 'IDPLANOPREV') or (sParamName = 'IDPATRO') then
    sNewValue := sOldValue;
end;

procedure TfrmEntCadDadosEspecialCenarioMT.sqlCompOrcamenFormartParam(sParamName,
  sOldValue: String; var sNewValue: String);
begin
  inherited;
  if (sParamName = 'UNIDNEGOC') or (sParamName = 'IDPLANOPREV') or
     (sParamName = 'IDPATRO') then
    sNewValue := sOldValue;
end;

procedure TfrmEntCadDadosEspecialCenarioMT.sqlSaldoContabilFormartParam(
  sParamName, sOldValue: String; var sNewValue: String);
begin
  inherited;
  if (sParamName = 'PLACONTA') then
    sNewValue := sOldValue;
end;

procedure TfrmEntCadDadosEspecialCenarioMT.sqlValorCentCustFormartParam(
  sParamName, sOldValue: String; var sNewValue: String);
begin
  inherited;
  if (sParamName = 'PERIODO') then
    sNewValue := sOldValue;
end;

procedure TfrmEntCadDadosEspecialCenarioMT.cdsSaldoAfterPost(DataSet: TDataSet);
begin
  Inherited;

  Acumulado               := Acumulado + cdsSaldo.FieldByName('VLRORCADO').AsFloat;
  AcumuladoOri            := AcumuladoOri + cdsSaldo.FieldByName('VLRRATEIOORI').AsFloat;
  sttAcumulado.Caption    := FormatCurr( '###,###,##0.00', Acumulado );
  sttAcumuladoOri.Caption := FormatCurr( '###,###,##0.00', AcumuladoOri );
end;

procedure TfrmEntCadDadosEspecialCenarioMT.cdsSaldoBeforeEdit(DataSet: TDataSet);
begin
  inherited;

  Acumulado    := Acumulado - cdsSaldo.FieldByName('VLRORCADO').AsFloat;
  AcumuladoOri := AcumuladoOri - cdsSaldo.FieldByName('VLRRATEIOORI').AsFloat;
end;


procedure TfrmEntCadDadosEspecialCenarioMT.dblcPlanoTrabalhoCloseUp(
  Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  if modified then
    AbreSaldos(False);
end;

procedure TfrmEntCadDadosEspecialCenarioMT.dblcPlanoParamContaCloseUp(
  Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  if modified then
    AbreSaldos(False);
end;

procedure TfrmEntCadDadosEspecialCenarioMT.dblcPatroParamContaCloseUp(
  Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  if modified then
    AbreSaldos(False);
end;

procedure TfrmEntCadDadosEspecialCenarioMT.BtCalcClick(Sender: TObject);
var rTotal: Double;
    bComLike, bComData, bComAnoMes: Boolean;
    iAno, iMes, iDia: Word;
    sAnoMes: String;
    dDataRef: TDateTime;
begin
  inherited;

  If ( Trim( dblcCenario.Text ) = '' ) Then Begin

    MsgDlg('Obrigatório indicar o Cenário', 'Erro', mtError, [mbOk], 0);
    dblcCenario.SetFocus;
    Exit;
  End;

  if trim( dblcCriterio1.Text ) = '' then begin
    MsgDlg('Obrigatório indicar o Critério', 'Erro', mtError, [mbOk], 0);
    dblcCriterio1.SetFocus;
    exit;
  end;

  If ( redValorBase.Value = 0 ) Then Begin

    MsgDlg( 'Valor para rateio não pode ser igual a zero', 'Erro', mtError, [mbOk], 0);
    redValorBase.SetFocus;
    exit;
  end;

  if cdsCriterio.FieldByName('TIPORATEIO').AsString = 'M' then begin
    rTotal :=0;
    cdsSaldo.DisableControls;
    cdsSaldo.First;
    while not cdsSaldo.Eof do begin
      cdsValorCentCust.Close;
      with sqlValorCentCust do begin
        Prepare;

        if ( Trim( dblcPeriodo.Text ) = '' ) Or
           ( Trim( dblcPeriodo.Text ) = 'Anual' ) then

          ParamByName('PERIODO').AsString := '(1 = 1)'
        else
          ParamByName('PERIODO').AsString := '(PERIODO = ' +
                                             dblcPeriodo.LookupValue + ')';
        ParamByName('CODCENTROCUSTO').asString :=
                     Espaco(cdsSaldo.FieldByName('CODCENTROCUSTO').AsString,10);
        ParamByName('IDEMPRESA').asFloat := Sistema.idEmpresa;
        if trim(dblcExercicio.Text) = '' then
          ParamByName('EXERCICIO').asInteger := -1
        else
          ParamByName('EXERCICIO').asInteger :=
                                            StrToInt(dblcExercicio.LookupValue);
        ParamByName('IDPESSOA').asInteger := Sistema.IdEmpresa;
        ParamByName('IDCRITERIORATORC').asInteger :=
                                             StrToInt(dblcCriterio1.KeyValue);
        Open;
      end;
      cdsSaldo.Edit;
      cdsSaldo.FieldByName('VALORCC').AsFloat :=
                           cdsValorCentCust.FieldByName('VLRCRIRATORC').AsFloat;
      cdsSaldo.Post;
      rTotal := rTotal + cdsValorCentCust.FieldByName('VLRCRIRATORC').AsFloat;
      cdsSaldo.Next;
    end;
    if rTotal <> 0 then begin
      cdsSaldo.First;
      while not cdsSaldo.Eof do begin
        cdsSaldo.Edit;
        cdsSaldo.FieldByName('VLRORCADO').AsFloat :=
          redValorBase.Value * (cdsSaldo.FieldByName('VALORCC').AsFloat/rTotal);
        cdsSaldo.FieldByName('VLRRATEIOORI').AsFloat :=
                                      cdsSaldo.FieldByName('VLRORCADO').AsFloat;
        cdsSaldo.FieldByName('FATORRATEIO').AsFloat  :=
                               (cdsSaldo.FieldByName('VALORCC').AsFloat/rTotal);

        cdsSaldo.FieldByName('IDCRITERIORATORC').AsInteger :=
                              cdsCriterio.FieldByName('IDCRITERIORATORC').AsInteger;
        cdsSaldo.Post;
        cdsSaldo.Next;
      end;
    end;
    cdsSaldo.First;
    cdsSaldo.EnableControls;
  end;
   if cdsCriterio.FieldByName('TIPORATEIO').AsString = 'G' then begin
    cdsDataView.Close;
    with sqlDataView do begin
      Prepare;
      ParamByName('IDDATAVIEW').AsInteger :=
                                cdsCriterio.FieldByName('IDDATAVIEW').AsInteger;
      Open;
    end;
    if not cdsDataView.FieldByName('TEMPLATE').isNull then begin
      cdsValorCCustAux.Close;
      with sqlValorCCustAux do begin
        SQL.Clear;
        SQL.Add(cdsDataView.FieldByName('TEMPLATE').AsString);
      end;
      if cdsCriterio.FieldByName('PERNUMERO').IsNull then
        dDataRef := Date
      else
        dDataRef := cdsCriterio.FieldByName('PERDATFIM').AsDatetime;
      if pos(':DATA',AnsiUpperCase(cdsDataView.FieldByName
         ('TEMPLATE').AsString)) = 0 then
        bComData := False
      else
        bComData := True;
      sAnoMes := '';
      if pos('LIKE :CODCENTROCUSTO',AnsiUpperCase(cdsDataView.FieldByName
         ('TEMPLATE').AsString)) = 0 then
        bComLike := False
      else
        bComLike := True;
      if pos(':ANOMES',AnsiUpperCase(cdsDataView.FieldByName
         ('TEMPLATE').AsString)) = 0 then begin
        bComAnoMes := False;
      end else begin
        bComAnoMes := True;
        DecodeDate(dDataRef,iAno,iMes,iDia);
        if iMes<10 then
          sAnoMes := IntToStr(iAno) + '0' + IntToStr(iMes)
        else
          sAnoMes := IntToStr(iAno) + IntToStr(iMes);
      end;
      rTotal  :=0;
      cdsSaldo.DisableControls;
      cdsSaldo.First;
      while not cdsSaldo.Eof do begin
        cdsValorCCustAux.Close;
        with sqlValorCCustAux do begin
          Prepare;
          if bComLike then
            ParamByName('CODCENTROCUSTO').asString :=
                    TRIM(cdsSaldo.FieldByName('CODCENTROCUSTO').AsString) + '%'
          else
            ParamByName('CODCENTROCUSTO').asString :=
                     Espaco(cdsSaldo.FieldByName('CODCENTROCUSTO').AsString,10);
          ParamByName('IDEMPRESA').asFloat := Sistema.idEmpresa;
          if bComData then
            ParamByName('DATA').asDateTime := dDataRef;
          if bComAnoMes then
            ParamByName('ANOMES').AsString := sAnoMes;
          Open;
        end;
        cdsSaldo.Edit;
        cdsSaldo.FieldByName('VALORCC').AsFloat :=
                                  cdsValorCCustAux.FieldByName('VALOR').AsFloat;
        cdsSaldo.Post;
        rTotal := rTotal + cdsValorCCustAux.FieldByName('VALOR').AsFloat;
        cdsSaldo.Next;
      end;
      if rTotal <> 0 then begin
        cdsSaldo.First;
        while not cdsSaldo.Eof do begin
          cdsSaldo.Edit;

          cdsSaldo.FieldByName('VLRORCADO').AsFloat := redValorBase.Value *
                               (cdsSaldo.FieldByName('VALORCC').AsFloat/rTotal);

          cdsSaldo.FieldByName('VLRRATEIOORI').AsFloat :=
                                      cdsSaldo.FieldByName('VLRORCADO').AsFloat;

          cdsSaldo.FieldByName('FATORRATEIO').AsFloat :=
                               (cdsSaldo.FieldByName('VALORCC').AsFloat/rTotal);

          cdsSaldo.FieldByName('IDCRITERIORATORC').AsInteger :=
                               cdsCriterio.FieldByName('IDCRITERIORATORC').AsInteger;

          cdsSaldo.Post;
          cdsSaldo.Next;
        end;
      end;
      cdsSaldo.First;
      cdsSaldo.EnableControls;
      UltimaOperacao := RATEIAR;
    end;
  end;
end;

procedure TfrmEntCadDadosEspecialCenarioMT.dbreValorCentCustEnter(Sender: TObject);
begin
  inherited;
  cdsSaldo.Edit;
end;

procedure TfrmEntCadDadosEspecialCenarioMT.dbreValorCentCustExit(Sender: TObject);
begin
  inherited;
  cdsSaldo.Post;
end;

procedure TfrmEntCadDadosEspecialCenarioMT.dbgrdSaldoCalcCellColors(Sender: TObject;
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

procedure TfrmEntCadDadosEspecialCenarioMT.dbgrdSaldoTopRowChanged(Sender: TObject);
begin
  inherited;
  //Acerta as cores quando muda a linha da grid
  dbgrdSaldo.invalidate;
end;

Procedure TfrmEntCadDadosEspecialCenarioMT.bbtnConfirmarClick(Sender: TObject);
Var
  rTotal        : Double;
  MensagemLocal : String;

Begin
  inherited;

  cdsSaldo.First;
  If ( cdsSaldo.Eof ) Then
  Begin
    Msgdlg( 'Não existem dados para serem gravados', 'Aviso', mtWarning, [ mbOk ], 0 );
  End
  Else
  Begin

    If ( Trim( dblcCenario.Text ) = '' ) Then
    Begin

      MsgDlg('Obrigatório indicar o Cenário', 'Erro', mtError, [mbOk], 0);
      dblcCenario.SetFocus;
      Exit;
    End;

    If ( UltimaOperacao <> ZERAR ) And
       ( Trim( dblcCriterio1.Text ) = '' ) Then Begin

      MsgDlg('Obrigatório indicar o Critério', 'Erro', mtError, [mbOk], 0);
      dblcCenario.SetFocus;
      Exit;
    End;

    cdsSaldo.DisableControls;
    rTotal := 0;

    While ( Not cdsSaldo.Eof ) Do Begin
      rTotal := rTotal + cdsSaldo.FieldByName('VLRORCADO').AsFloat;
      cdsSaldo.Next;
    End;

    cdsSaldo.First;
    cdsSaldo.EnableControls;

    if Format('%17.2f',[redValorBase.Value]) <> Format('%17.2f',[rTotal]) then
       begin
      if MsgDlg('Total dos Centros de Custo não bate com o Valor para ' +
                'Rateio.Confirma?','Confirmação',mtConfirmation,
                [mbYes,mbNo],0) = mrNo then begin
        redValorBase.SetFocus;
        exit;
      end;
    end;

    Screen.Cursor := crSQLWait;

    MensagemLocal := '';

    if not CtrlBlqEntDados.TestaEntDadosBlq(Sistema.IdUsuario,Sistema.IdEmpresa,
                                            StrToIntDef(dblcPeriodo.LookupValue,0),
                                            StrToIntDef(dblcExercicio.LookupValue,0),
                                            CdsCenario.FieldByName( 'IDCENARIOORCAMEN' ).AsInteger) then
    begin
       MsgDlg(CtrlBlqEntDados.MessageInfo,'Aviso',mtWarning,[mbOk],0);
       Exit;
    end;



    CtrlValoresCenario.ValoresCenarioProcedeGravacao( MensagemLocal,
                                                      dblcPeriodo.Text,
                                                      dblcPeriodo.LookupValue,
                                                      CdsCenario.FieldByName( 'IDCENARIOORCAMEN' ).AsInteger,
                                                      Sistema.idEmpresa,
                                                      dblcExercicio.LookupValue );
    If ( MensagemLocal <> '' ) Then Begin

      MsgDlg( MensagemLocal, 'Aviso', mtWarning, [mbOk], 0);
    End;
    Screen.Cursor := crDefault;
    cdsSaldo.EnableControls;
    cdsSaldo.First;
  End;

  try
    Sistema.GravaLogOperacoes('Entrada de Dados Especial com Cenário.');
  except
    Raise Exception.Create('Não foi possível Gravar o Log');
  end;

End;

function TfrmEntCadDadosEspecialCenarioMT.AbreSaldos(bMostraMsg:Boolean) : Boolean;
begin
  Result := False;
  //Abre a query de Saldos de acordo com os parâmetros fornecidos
  If ( Trim( dblcCenario.Text ) = '' ) And
     ( Not Inicio ) Then Begin

    MsgDlg( 'Selecione um cenário', 'Aviso', mtWarning, [ mbOk ], 0 );

  End Else Begin

    redValorBase.Value   := 0;
    cdsSaldo.Close;
    with sqlSaldo do begin
      Prepare;

      ParamByName('IDCENARIOORCAMEN').AsString := dblcCenario.LookupValue;

      if trim(dblcPlanoTrabalho.Text) = '' then
        ParamByName('UNIDNEGOC').AsString := '(C.UNIDNEGOC IS NULL) AND '
      else
        ParamByName('UNIDNEGOC').AsString := '(C.UNIDNEGOC = ' +
                             cdsPlanoTrabalho.FieldByName('UNIDNEGOC').AsString +
                             ') AND ';
      if trim(dblcPlanoParamConta.Text) = '' then
        ParamByName('IDPLANOPREV').AsString := '(C.IDPLANOPREV IS NULL) AND '
      else
        ParamByName('IDPLANOPREV').AsString := '(C.IDPLANOPREV = ' +
                                       dblcPlanoParamConta.LookupValue + ') AND ';
      if trim(dblcPatroParamConta.Text) = '' then
        ParamByName('IDPATRO').AsString := '(C.IDPATRO IS NULL) AND '
      else
        ParamByName('IDPATRO').AsString := '(C.IDPATRO = ' +
                                       dblcPatroParamConta.LookupValue + ') AND ';
      if trim(dblcExercicio.Text) = '' then
        ParamByName('EXERCICIO').asInteger := -1
      else
        ParamByName('EXERCICIO').asInteger := StrToInt(dblcExercicio.LookupValue);
      ParamByName('IDPESSOA').asInteger := Sistema.IdEmpresa;
      ParamByName('IDGRUPOORCAMEN').asInteger :=
                                 cdsGrupo.FieldByName('IDGRUPOORCAMEN').AsInteger;

      if ( Trim(dblcPeriodo.Text) = '' ) Or
         ( Trim( dblcPeriodo.Text ) = 'Anual' ) then
        ParamByName('PERIODO').AsString := '(1 = 1) '
      else
        ParamByName('PERIODO').AsString := '  ( V.PERIODO       (+) = ' + dblcPeriodo.LookupValue + ') ';

      Open;
    End;
    TotalizaAcumulado;
    Result := True;
    cdsSaldo.First;

    dblcCriterio1.KeyValue := CdsSaldo.FieldByName('IDCRITERIORATORC').AsInteger;
    dblcCriterio1.Refresh;
  End;
End;
//************************************************
Procedure TfrmEntCadDadosEspecialCenarioMT.TotalizaAcumulado;
Begin
  Acumulado    := 0;
  AcumuladoOri := 0;
  cdsSaldo.First;
  While not cdsSaldo.Eof do begin
    Acumulado := Acumulado + cdsSaldo.FieldByName('VLRORCADO').AsFloat;
    AcumuladoOri := AcumuladoOri + cdsSaldo.FieldByName('VLRRATEIOORI').AsFloat;
    cdsSaldo.Next;
  End;
  sttAcumulado.Caption    := FormatCurr( '###,###,##0.00', Acumulado );
  sttAcumuladoOri.Caption := FormatCurr( '###,###,##0.00', AcumuladoOri );
  if redValorBase.Value = 0 then
    redValorBase.Value   := AcumuladoOri;
End;
//************************************************
Procedure TfrmEntCadDadosEspecialCenarioMT.bbtnZerarClick(Sender: TObject);
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
Procedure TfrmEntCadDadosEspecialCenarioMT.dblcPeriodoCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
Begin
  Inherited;

  If modified Then
    AbreSaldos(False);
End;
//************************************************
Procedure TfrmEntCadDadosEspecialCenarioMT.dbeGrupoExit(Sender: TObject);
Begin
  Inherited;

  If ( ActiveControl.Tag <> 999 ) Then Begin
    If ( dbeGrupo.Valida <> VcOK ) Then Begin
      dbeGrupo.SetFocus;
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
Procedure TfrmEntCadDadosEspecialCenarioMT.dblcExercicioCloseUp(
  Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
Begin
  Inherited;

  If Modified Then Begin

    cdsPeriodo.Close;
    sqlPeriodo.Prepare;

    sqlPeriodo.Params[ 0 ].AsInteger := Sistema.idEmpresa;
    sqlPeriodo.Params[ 2 ].AsInteger := Sistema.idEmpresa;

    If ( Trim( dblcExercicio.Text ) = '' ) Then Begin

      sqlPeriodo.Params[ 1 ].AsInteger := -1;
      sqlPeriodo.Params[ 3 ].AsInteger := -1;
    End Else Begin

      sqlPeriodo.Params[ 1 ].AsInteger := StrToInt(dblcExercicio.LookupValue);
      sqlPeriodo.Params[ 3 ].AsInteger := StrToInt(dblcExercicio.LookupValue);
    End;

    sqlPeriodo.Open;
    AbreSaldos(False);
  End;
End;
//************************************************
procedure TfrmEntCadDadosEspecialCenarioMT.dblcCriterio1CloseUp(
  Sender: TObject);
var sPlaConta: String;
begin
  inherited;

  if (redValorBase.Value = 0) and
     (not cdsCriterio.FieldByName('PERNUMERO').IsNull) then begin
    sPlaConta := '';
    cdsCompOrcamen.Close;
    sqlCompOrcamen.Prepare;
    if not cdsPlanoTrabalho.FieldByName('UNIDNEGOC').IsNull then begin
      sqlCompOrcamen.ParamByName('UNIDNEGOC').AsString := '(CC.UNIDNEGOC = ' +
                  cdsPlanoTrabalho.FieldByName('UNIDNEGOC').AsString + ') AND ';
    end else begin
      sqlCompOrcamen.ParamByName('UNIDNEGOC').AsString := '(1 = 1) AND ';
    end;
    if trim(dblcPlanoParamConta.Text) <> '' then begin
      sqlCompOrcamen.ParamByName('IDPLANOPREV').AsString :=
              '(CC.IDPLANOPREV = ' + dblcPlanoParamConta.LookupValue + ') AND ';
    end else begin
      sqlCompOrcamen.ParamByName('IDPLANOPREV').AsString := '(1 = 1) AND ';
    end;
    if trim(dblcPatroParamConta.Text) <> '' then begin
      sqlCompOrcamen.ParamByName('IDPATRO').AsString := '(CC.IDPATRO = ' +
                                          dblcPatroParamConta.LookupValue + ')';
    end else begin
      sqlCompOrcamen.ParamByName('IDPATRO').AsString := '(1 = 1)';
    end;
    sqlCompOrcamen.ParamByName('IDGRUPOORCAMEN').asInteger := iGrupo;
    sqlCompOrcamen.Open;
    cdsCompOrcamen.First;
    while not cdsCompOrcamen.Eof do begin
      if sPlaConta = '' then
        sPlaConta := '''' +
              Espaco(cdsCompOrcamen.FieldByName('PLACONTA').AsString,18) + ''''
      else
        sPlaConta := sPlaConta + ',''' +
              Espaco(cdsCompOrcamen.FieldByName('PLACONTA').AsString,18) + '''';
      cdsCompOrcamen.Next;
    end;
    if trim(sPlaConta) <> '' then begin
      cdsSaldoContabil.Close;
      If Not sqlSaldoContabil.Prepared Then sqlSaldoContabil.Prepare;
      sqlSaldoContabil.ParamByName('PLACONTA').AsString      := '(PLACONTA IN (' + sPlaConta + ')) ';
      sqlSaldoContabil.ParamByName('PERNUMERO').AsInteger    := cdsCriterio.FieldByName('PERNUMERO').AsInteger;
      sqlSaldoContabil.ParamByName('PEREXERCICIO').AsInteger := cdsCriterio.FieldByName('PEREXERCICIO').AsInteger;
      sqlSaldoContabil.ParamByName('IDPESSOA').AsInteger     := Sistema.idEmpresa;
      sqlSaldoContabil.Open;

      if ( Trim( dblcPeriodo.Text ) = '' ) Or
         ( Trim( dblcPeriodo.Text ) = 'Anual' ) Then

        redValorBase.Value := (cdsSaldoContabil.FieldByName('SALDOCONTAB').AsFloat*12)

      else
        redValorBase.Value := cdsSaldoContabil.FieldByName('SALDOCONTAB').AsFloat;
    end;
  end;

end;




procedure TfrmEntCadDadosEspecialCenarioMT.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FreeAndNil(CtrlValorescenario);
  FreeAndNil(CtrlBlqEntDados);
  inherited;
end;

End.
