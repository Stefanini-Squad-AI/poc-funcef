unit FManipCenarioMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, wwdblook, CMDBLookupCombo, Spin, Db, DBTables,
  Wwquery, ComCtrls, Mask, wwdbedit, Wwdbspin, Wwdotdot, Wwdbcomb, TREdit,
  uCmSqlParams, DBClient, uCMClientDataSet, uCtrlValorescenario, uCMTypes,
  uCtrlBlqEntDados;

type
  TfrmManipCenarioMT = class(TfrmSairAjuda)
    lblExercicio: TLabel;
    spnedExercicio: TSpinEdit;
    bbtnEfetiva: TBitBtn;
    ToolbarSep971: TToolbarSep97;
    pbAguarde: TProgressBar;
    gbSalvar: TGroupBox;
    dblcCenarioOrigem: TCMDBLookupCombo;
    lblLegenda: TLabel;
    dblcCenarioDestino: TCMDBLookupCombo;
    lblDestino: TLabel;
    lblOrigem: TLabel;
    gbParametros: TGroupBox;
    Label2: TLabel;
    Label5: TLabel;
    Label7: TLabel;
    Label9: TLabel;
    sePosIni1: TwwDBSpinEdit;
    sePosFim1: TwwDBSpinEdit;
    edConteudo1: TEdit;
    sePosIni2: TwwDBSpinEdit;
    sePosFim2: TwwDBSpinEdit;
    edConteudo2: TEdit;
    sePosIni3: TwwDBSpinEdit;
    sePosFim3: TwwDBSpinEdit;
    edConteudo3: TEdit;
    sePosIni4: TwwDBSpinEdit;
    sePosFim4: TwwDBSpinEdit;
    edConteudo4: TEdit;
    dbcboCondicao: TwwDBComboBox;
    rePerc: TRealEdit;
    lblCond: TLabel;
    lblPercentual: TLabel;
    cdsSaldoCenario: TCMClientDataSet;
    sqlSaldoCenario: TCMSqlParams;
    sqlCenario: TCMSqlParams;
    cdsCenario: TCMClientDataSet;
    sqlTestaOrc: TCMSqlParams;
    cdsTestaOrc: TCMClientDataSet;
    sqlOrcado: TCMSqlParams;
    cdsOrcado: TCMClientDataSet;
    sqlPeriodo: TCMSqlParams;
    cdsPeriodo: TCMClientDataSet;
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure sqlSaldoCenarioFormartParam(sParamName, sOldValue: String;
      var sNewValue: String);
    procedure bbtnEfetivaClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    CtrlValorescenario: TCtrlValorescenario;
    CtrlBlqEntDados: TCtrlBlqEntDados;

  public
    { Public declarations }
  end;

var
  frmManipCenarioMT: TfrmManipCenarioMT;

implementation

{$R *.DFM}

Uses uMensErro, uDataBase, uSistema, dBaseDados;

procedure TfrmManipCenarioMT.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlValorescenario := TCtrlValorescenario.Create;
  CtrlValorescenario.Initialize( DtmBaseDados.dbBaseDados, True,
                                 Sistema.ConnectionType,   Sistema.ConnectionSide,
                                 Sistema.AppRemoteServer,  True, nil, nil, False );
 CtrlBlqEntDados := TCtrlBlqEntDados.Create;
 CtrlBlqEntDados.InitializeAs(CtrlValorescenario);
end;




procedure TfrmManipCenarioMT.FormActivate(Sender: TObject);
var sDataIni:String;
    iExercicio:Integer;
begin
  inherited;
  cdsCenario.Close;
  sqlCenario.Prepare;
  sqlCenario.Open;
  sDataini    := FormatDateTime ('dd/mm/yyyy',date);
  iExercicio  := StrToInt(copy(sDataini,7,4));
  spnedExercicio.value := iExercicio;
end;




procedure TfrmManipCenarioMT.sqlSaldoCenarioFormartParam(sParamName,
  sOldValue: String; var sNewValue: String);
begin
  inherited;
  if (sParamName = 'CONTEUDO1') or (sParamName = 'CONTEUDO2') or
     (sParamName = 'CONTEUDO3') or (sParamName = 'CONTEUDO4') then
    sNewValue := sOldValue;
end;




procedure TfrmManipCenarioMT.bbtnEfetivaClick(Sender: TObject);
var rValorMani, rValor : Double;
 iMes: integer;
begin
  inherited;
  cdsPeriodo.Close;
  with sqlPeriodo do begin
    Prepare;
    ParamByName('EXERCICIO').AsFloat := spnedExercicio.Value;
    ParamByName('PESSOA').AsFloat    := Sistema.IdEmpresa;
    Open;
  end;
  if cdsPeriodo.IsEmpty then begin
    MsgDlg('Não existe nenhum período neste exercício.','Aviso',mtWarning,
           [mbOk],0);
    spnedExercicio.SetFocus;
    Exit;
  end;
  if trim(dblcCenarioDestino.Text) = '' then begin
    MsgDlg('Obrigatório preencher o Cenário de Destino.','Aviso',mtWarning,
           [mbOk],0);
    dblcCenarioDestino.SetFocus;
    Exit;
  end;
  if (rePerc.Value <> 0) and (trim(dbcboCondicao.Text) = '') then begin
    MsgDlg('Caso seja indicado o Percentual, é obrigatório indicar a condição',
           'Aviso',mtWarning,[mbOk],0);
    dbcboCondicao.SetFocus;
    Exit;
  end;
  if dblcCenarioDestino.LookupValue = dblcCenarioOrigem.LookupValue then begin
    MsgDlg('O Cenário de Origem não pode ser o mesmo de Destino.','Aviso',
           mtWarning,[mbOk],0);
    dblcCenarioOrigem.SetFocus;
    Exit;
  end;

  for iMes := 1 to 12 do
  begin
     if not CtrlBlqEntDados.TestaEntDadosBlq(Sistema.IdUsuario,Sistema.IdEmpresa,
                                             iMes,(spnedExercicio.value),
                                             StrToIntDef(dblcCenarioDestino.LookupValue,0)) then
     begin
        MsgDlg(CtrlBlqEntDados.MessageInfo,'Aviso',mtWarning,[mbOk],0);
        Exit;
     end;
  end;



  try
    CtrlValorescenario.StartTransactionOrc;
    lblLegenda.Caption := '';
    lblLegenda.Visible := True;
    if trim(dblcCenarioOrigem.Text) <> '' then begin
      lblLegenda.Caption := 'Excluindo Valores do Cenário de Destino';
      Application.ProcessMessages;
      CtrlValorescenario.DeleteValor2(
                         StrToInt(dblcCenarioDestino.LookupValue),
                         Trunc(spnedExercicio.Value), Sistema.IdEmpresa);
      lblLegenda.Caption := 'Copiando Valores do Cenário de Origem para o ' +
                            'de Destino';
      Application.ProcessMessages;
      cdsOrcado.Close;
      sqlOrcado.Prepare;
      sqlOrcado.ParamByName('EXERCICIO').AsFloat        := spnedExercicio.Value;
      sqlOrcado.ParamByName('IDPESSOA').AsFloat         := Sistema.IdEmpresa;
      sqlOrcado.ParamByName('IDCENARIOORCAMEN').AsFloat := StrToFloat(dblcCenarioOrigem.LookupValue);
      sqlOrcado.Open;
      pbAguarde.Position := 0;
      pbAguarde.Max      := cdsOrcado.RecordCount;
      cdsOrcado.First;
      while not cdsOrcado.Eof do begin
        pbAguarde.Position := pbAguarde.Position + 1;
        CtrlValorescenario.InsereValor( CtrlValorescenario.LerSequencia,
                           StrToInt(dblcCenarioDestino.LookUpValue),
                           cdsOrcado.FieldByName('IDPLANOORCAMEN').AsFloat,
                           cdsOrcado.FieldByName('EXERCICIO').AsInteger,
                           cdsOrcado.FieldByName('PERIODO').AsInteger,
                           cdsOrcado.FieldByName('IDPESSOA').AsFloat,
                           cdsOrcado.FieldByName('IDCONTAORCAMEN').AsString,
                           cdsOrcado.FieldByName('VLRORCADO').AsFloat);
        cdsOrcado.Next;
      end;
    end;
    if rePerc.Value <> 0 then begin
      cdsSaldoCenario.Close;
      with sqlSaldoCenario do begin
        Prepare;
        ParamByName('IDPESSOA').AsFloat         := Sistema.IdEmpresa;
        ParamByName('EXERCICIO').AsFloat        := spnedExercicio.Value;
        ParamByName('IDCENARIOORCAMEN').AsFloat := StrToInt(dblcCenarioDestino.LookUpValue);
        if Trim(edConteudo1.Text) <> '' then begin
          ParamByName('CONTEUDO1').AsString := ' AND (SUBSTR(IDCONTAORCAMEN,' +
                                   FloatToStr(sePosIni1.Value) + ',' +
                                   FloatToStr(sePosFim1.Value) + ') IN (' +
                                   trim(edConteudo1.Text) + ')) ';
        end else begin
          ParamByName('CONTEUDO1').AsString := ' AND (1 = 1)';
        end;
        if Trim(edConteudo2.Text) <> '' then begin
          ParamByName('CONTEUDO2').AsString := ' AND (SUBSTR(IDCONTAORCAMEN,' +
                                   FloatToStr(sePosIni2.Value) + ',' +
                                   FloatToStr(sePosFim2.Value) + ') IN (' +
                                   trim(edConteudo2.Text) + ')) ';
        end else begin
          ParamByName('CONTEUDO2').AsString := ' AND (1 = 1)';
        end;
        if Trim(edConteudo3.Text) <> '' then begin
          ParamByName('CONTEUDO3').AsString := ' AND (SUBSTR(IDCONTAORCAMEN,' +
                                   FloatToStr(sePosIni3.Value) + ',' +
                                   FloatToStr(sePosFim3.Value) + ') IN (' +
                                   trim(edConteudo3.Text) + ')) ';
        end else begin
          ParamByName('CONTEUDO3').AsString := ' AND (1 = 1)';
        end;
        if Trim(edConteudo4.Text) <> '' then begin
          ParamByName('CONTEUDO4').AsString := ' AND (SUBSTR(IDCONTAORCAMEN,' +
                                   FloatToStr(sePosIni4.Value) + ',' +
                                   FloatToStr(sePosFim4.Value) + ') IN (' +
                                   trim(edConteudo4.Text) + ')) ';
        end else begin
          ParamByName('CONTEUDO4').AsString := ' AND (1 = 1)';
        end;
        Open;
      end;
      lblLegenda.Caption := 'Atualizando o Cenário de Destino';
      Application.ProcessMessages;
      pbAguarde.Position := 0;
      pbAguarde.Max      := cdsSaldoCenario.RecordCount;
      cdsSaldoCenario.First;
      While not cdsSaldoCenario.Eof do begin
        pbAguarde.Position := pbAguarde.Position + 1;
        rValorMani := cdsSaldoCenario.FieldByName('VLRORCCENARIO').AsFloat * (rePerc.Value/100);
        if dbcboCondicao.ItemIndex = 0 then
          rValor := cdsSaldoCenario.FieldByName('VLRORCCENARIO').AsFloat + rValorMani
        else
          rValor := cdsSaldoCenario.FieldByName('VLRORCCENARIO').AsFloat - rValorMani;
          CtrlValorescenario.AltValor( cdsSaldoCenario.FieldByName('IDVALORESCENARIO').AsFloat, rValor );
        cdsSaldoCenario.Next;
      end;
    end;
    CtrlValorescenario.CommitOrc;
    MsgDlg('Atualizações Efetuadas com Sucesso', 'Aviso', mtWarning, [mbOk], 0);
  except
    CtrlValorescenario.RollBackOrc;
    MsgDlg('Atualizações Não Efetuadas', 'Erro', mtError, [mbOk], 0);
    Raise;
  end;
end;

procedure TfrmManipCenarioMT.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FreeAndNil(CtrlValorescenario);
  FreeAndNil(CtrlBlqEntDados);
  
  inherited;
end;

end.
