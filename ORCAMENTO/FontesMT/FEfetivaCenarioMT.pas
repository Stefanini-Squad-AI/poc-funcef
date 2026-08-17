Unit FEfetivaCenarioMT;

Interface

Uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, wwdblook, CMDBLookupCombo, Spin, Db, DBTables,
  Wwquery, ComCtrls, DBClient, uCMClientDataSet, uCmSqlParams, uCtrlEfetivaCenario,
  uCMTypes,
  uCtrlBlqEntDados;

Type
  TfrmEfetivaCenarioMT = class(TfrmSairAjuda)
    lblExercicio: TLabel;
    spnedExercicio: TSpinEdit;
    mmExplicacao: TMemo;
    bbtnEfetiva: TBitBtn;
    ToolbarSep971: TToolbarSep97;
    pbAguarde: TProgressBar;
    gbSalvar: TGroupBox;
    dblcSalvaCenario: TCMDBLookupCombo;
    gbCenarioEfet: TGroupBox;
    dblcCenario: TCMDBLookupCombo;
    Label4: TLabel;
    dblkPeriodoIni: TwwDBLookupCombo;
    Label6: TLabel;
    dblkPeriodoFim: TwwDBLookupCombo;
    cbSaldoAnterior: TCheckBox;
    bbtnCancelar: TBitBtn;
    EdtLegenda: TEdit;
    CdsPeriodo: TCMClientDataSet;
    CdsPeriodoIni: TCMClientDataSet;
    CdsTestaOrcAnt: TCMClientDataSet;
    CdsOrcado: TCMClientDataSet;
    CdsPeriodoFim: TCMClientDataSet;
    CdsOrcadoAnt: TCMClientDataSet;
    CdsCenario: TCMClientDataSet;
    CdsSaldoCenario: TCMClientDataSet;
    CdsSaldoCenarioAnt: TCMClientDataSet;
    CdsTestaOrc: TCMClientDataSet;
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure spnedExercicioExit(Sender: TObject);
    procedure bbtnEfetivaClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure EdtLegendaChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    CtrlEfetivaCenario: TCtrlEfetivaCenario;
    CtrlBlqEntDados: TCtrlBlqEntDados;

  public
    { Public declarations }
  end;

var
  frmEfetivaCenarioMT : TfrmEfetivaCenarioMT;

Implementation

{$R *.DFM}

Uses
  uMensErro, uDataBase, uSistema, dBaseDados;

Procedure TfrmEfetivaCenarioMT.FormCreate(Sender: TObject);
Begin
  Inherited;

  CtrlEfetivaCenario := TCtrlEfetivaCenario.Create;
  CtrlEfetivaCenario.Initialize( DtmBaseDados.dbBaseDados, True,
                                 Sistema.ConnectionType,   Sistema.ConnectionSide,
                                 Sistema.AppRemoteServer,  True, nil, nil, False );
  CtrlBlqEntDados := TCtrlBlqEntDados.Create;
  CtrlBlqEntDados.InitializeAs(CtrlEfetivaCenario);                               

  CtrlEfetivaCenario.pbAguarde         := pbAguarde;
  CtrlEfetivaCenario.EdtLegenda        := EdtLegenda;
  CtrlEfetivaCenario.cdsPeriodo        := cdsPeriodo;
  CtrlEfetivaCenario.cdsPeriodoIni     := cdsPeriodoIni;
  CtrlEfetivaCenario.cdsPeriodoFim     := cdsPeriodoFim;
  CtrlEfetivaCenario.cdsTestaOrcAnt    := cdsTestaOrcAnt;
  CtrlEfetivaCenario.cdsOrcado         := cdsOrcado;
  CtrlEfetivaCenario.cdsOrcadoAnt      := cdsOrcadoAnt;
  CtrlEfetivaCenario.cdsCenario        := cdsCenario;
  CtrlEfetivaCenario.cdsSaldoCenario   := cdsSaldoCenario;
  CtrlEfetivaCenario.cdsSaldoCenarioAnt:= cdsSaldoCenarioAnt;
  CtrlEfetivaCenario.cdsTestaOrc       := cdsTestaOrc;

End;

procedure TfrmEfetivaCenarioMT.FormActivate(Sender: TObject);
var sDataIni: string;
    iExercicio: integer;
begin
  inherited;
  cdsCenario.Close;

  CtrlEfetivaCenario.AbreCenario;

  sDataini    := FormatDateTime ('dd/mm/yyyy',date);
  iExercicio  := StrToInt(copy(sDataini,7,4));
  spnedExercicio.value := iExercicio;
  spnedExercicioExit(Sender);
end;




procedure TfrmEfetivaCenarioMT.spnedExercicioExit(Sender: TObject);
begin
  inherited;

  CtrlEfetivaCenario.AbreQueries( Sistema.IdEmpresa,
                                  spnedExercicio.Value );

  dblkPeriodoIni.LookupValue := cdsPeriodoIni.FieldByName('PERIODO').AsString;
  dblkPeriodoFim.LookupValue := cdsPeriodoFim.FieldByName('PERIODO').AsString;
end;




Procedure TfrmEfetivaCenarioMT.bbtnEfetivaClick(Sender: TObject);
Var
  PeriodoIni,
  PeriodoFim    : Integer;
  Cenario,
  SalvaCenario  : Double;

  iMes: integer;

Begin
  Inherited;

  CtrlEfetivaCenario.AbrePeriodo( Sistema.IdEmpresa,
                                  spnedExercicio.Value );

  if cdsPeriodo.IsEmpty then begin
    MsgDlg('Não existe nenhum período neste exercício.','Aviso',mtWarning,
           [mbOk],0);
    spnedExercicio.SetFocus;
    Exit;
  end;
  if trim(dblcCenario.Text) = '' then begin
    MsgDlg('Obrigatório preencher o Cenário.','Aviso',mtWarning,[mbOk],0);
    dblcCenario.SetFocus;
    Exit;
  end;
  if dblcSalvaCenario.LookupValue = dblcCenario.LookupValue then begin
    MsgDlg('O Cenário para Salvar o Orçamento não pode ser o mesmo de Origem.', 'Aviso',mtWarning,[mbOk],0);
    dblcSalvaCenario.SetFocus;
    Exit;
  end;

  Try
    Cenario := StrToFloat( dblcCenario.LookUpValue );
  Except
    Cenario := 0;
  End;

  Try
    SalvaCenario := StrToFloat( dblcSalvaCenario.LookupValue );
  Except
    SalvaCenario := 0;
  End;

  Try
    PeriodoIni := Trunc( StrToFloat( dblkPeriodoIni.LookupValue ) );
  Except
    PeriodoIni := 0;
  End;

  Try
    PeriodoFim := Trunc( StrToFloat( dblkPeriodoFim.LookupValue ) );
  Except
    PeriodoFim := 0;
  End;

  for iMes := PeriodoIni to PeriodoFim do
  begin
     if not CtrlBlqEntDados.TestaEntDadosBlq(Sistema.IdUsuario,Sistema.IdEmpresa,
                                             iMes,trunc(spnedExercicio.Value),trunc(Cenario)) then
     begin
        MsgDlg(CtrlBlqEntDados.MessageInfo,'Aviso',mtWarning,[mbOk],0);
        Exit;
     end;
  end;



  If ( CtrlEfetivaCenario.EfetivaClick( Sistema.IdEmpresa,
                                        Sistema.IdUsuario,
                                        Cenario,
                                        SalvaCenario,
                                        PeriodoIni,
                                        PeriodoFim,
                                        cbSaldoAnterior.Checked,
                                        spnedExercicio.Value,
                                        dblcSalvaCenario.Text ) ) Then Begin

    MsgDlg('Efetivação Realizada com Sucesso', 'Aviso', mtWarning, [mbOk], 0);
  End Else Begin

    MsgDlg('Efetivação Não Realizada', 'Erro', mtError, [mbOk], 0);
  End;
End;




procedure TfrmEfetivaCenarioMT.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  edtLegenda.Tag := -1;
end;




procedure TfrmEfetivaCenarioMT.EdtLegendaChange(Sender: TObject);
begin
  inherited;

  Application.ProcessMessages;
end;

procedure TfrmEfetivaCenarioMT.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin

  FreeAndNil(CtrlEfetivaCenario);
  FreeAndNil(CtrlBlqEntDados);
  inherited;
end;

end.
