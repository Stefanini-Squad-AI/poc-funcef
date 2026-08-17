unit fLancaHoras;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, fSairAjuda,
  MAHlpBtn, StdCtrls, Buttons, TB97, ExtCtrls, Mask, wwdbedit, Db, DBTables, TREdit,
  wwdblook, Spin, Wwtable, TB97Tlbr, IvDictio, IvMulti, IvEMulti, DBClient, DBCtrls,
  uCMClientDataSet, ComCtrls, uCmSqlParams, uCtrlLancaHoras, uCtrlGlobalRH, uCtrlProvDesc;

type
  TfrmLancaHoras = class(TfrmSairAjuda)
    Label5: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    CdsRub1: TCMClientDataSet;
    CdsRub2: TCMClientDataSet;
    CdsRub4: TCMClientDataSet;
    CdsRub5: TCMClientDataSet;
    CdsRub3: TCMClientDataSet;
    CdsRub6: TCMClientDataSet;
    edNome: TEdit;
    grpMesRef: TGroupBox;
    cmbMes: TComboBox;
    spnedAno: TSpinEdit;
    redRub1: TRealEdit;
    redRub2: TRealEdit;
    redRub3: TRealEdit;
    redRub4: TRealEdit;
    redRub5: TRealEdit;
    redRub6: TRealEdit;
    pgbrRub: TProgressBar;
    bbtnConfirmar: TBitBtn;
    ToolbarSep971: TToolbarSep97;
    dblckRub2: TwwDBLookupCombo;
    dblckRub3: TwwDBLookupCombo;
    dblckRub4: TwwDBLookupCombo;
    dblckRub5: TwwDBLookupCombo;
    dblckRub6: TwwDBLookupCombo;
    dblckRub1: TwwDBLookupCombo;
    lblAdNotDSR1: TLabel;
    lblAdNotDSR2: TLabel;
    redRub7: TRealEdit;
    dblckRub7: TwwDBLookupCombo;
    CdsRub7: TCMClientDataSet;
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    CtrlLancaHoras: TCtrlLancaHoras;
    CtrlGlobalRH: TCtrlGlobalRH;
    CtrlProvDesc: TCtrlProvDesc;
  public
    IdPessoa: real;
  end;

var
  frmLancaHoras: TfrmLancaHoras;

implementation

uses uSistema, uMensErro, uCtrlPadroes, uCtrlFuncoesRH;

{$R *.DFM}

procedure TfrmLancaHoras.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlGlobalRH := TCtrlGlobalRH.Create;
  CtrlGlobalRH.InitializeAs(Padroes);

  CtrlProvDesc := TCtrlProvDesc.Create;
  CtrlProvDesc.InitializeAs(Padroes);

  CtrlLancaHoras := TCtrlLancaHoras.Create;
  CtrlLancaHoras.InitializeAs(Padroes);

  CdsRub1.Data := CtrlProvDesc.ListRubricaEmpresa(IntToStr(Sistema.IdEmpresa));
  CdsRub2.Data := CdsRub1.Data;
  CdsRub3.Data := CdsRub1.Data;
  CdsRub4.Data := CdsRub1.Data;
  CdsRub5.Data := CdsRub1.Data;
  CdsRub6.Data := CdsRub1.Data;
  CdsRub7.Data := CdsRub1.Data;

  dblckRub1.LookupValue := '';
  if CdsRub1.Locate('CODRUBCLT', '50002',[]) then
    dblckRub1.LookupValue := CdsRub1.FieldByName('IDPROVENTO').asString;

  dblckRub2.LookupValue := '';
  if cdsRub2.Locate('CODRUBCLT', '40520', []) then
    dblckRub2.LookupValue := CdsRub2.FieldByName('IDPROVENTO').asString;

  dblckRub3.LookupValue := '';
  if cdsRub3.Locate('CODRUBCLT', '40530', []) then
    dblckRub3.LookupValue := CdsRub3.FieldByName('IDPROVENTO').asString;

  dblckRub4.LookupValue := '';
  if cdsRub4.Locate('CODRUBCLT', '40540', []) then
    dblckRub4.LookupValue := CdsRub4.FieldByName('IDPROVENTO').asString;

  dblckRub5.LookupValue := '';
  if cdsRub5.Locate('CODRUBCLT', '40004', []) then
    dblckRub5.LookupValue := CdsRub5.FieldByName('IDPROVENTO').asString;

  dblckRub6.LookupValue := '';
  if cdsRub6.Locate('CODRUBCLT', '00003', []) then
    dblckRub6.LookupValue := CdsRub6.FieldByName('IDPROVENTO').asString;

  dblckRub7.LookupValue := '';
  if cdsRub7.Locate('CODRUBCLT', '40008', []) then
    dblckRub7.LookupValue := CdsRub7.FieldByName('IDPROVENTO').asString;

  CtrlGlobalRH.DbParamRH.LoadFromDb;
  cmbMes.ItemIndex := FU.ExtraiMes(CtrlGlobalRH.DbParamRH.NormalIni.asDateTime)-1;
  spnedAno.Value := FU.ExtraiAno(CtrlGlobalRH.DbParamRH.NormalIni.asDateTime);
end;

procedure TfrmLancaHoras.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(CtrlLancaHoras);
  FreeAndNil(CtrlProvDesc);
  FreeAndNil(CtrlGlobalRH);
  inherited;
end;

procedure TfrmLancaHoras.bbtnConfirmarClick(Sender: TObject);
const
  DescrPasso: array[1..7] of string = ('Atrasos','Extras Diurnas','Extras Noturnas',
    'Extraordinárias','Adicional Noturno','Repouso Remunerado','Adicional Noturno DSR');
var
  c: byte;
  bOk: boolean;
  IntUm: integer;
  Msg: string;
  cdsAux: TClientDataSet;
begin
  Msg := '';
  IntUm := 1;
  pgbrRub.Position := 0;
  for c:=1 to 7 do
  begin
    bOk := true;
    CdsAux := TCMClientDataSet(FindComponent('CdsRub'+IntToStr(c)));

    if (TwwDBLookupCombo(FindComponent('dblckRub'+IntToStr(c))).Text <> '') and
       (TRealEdit(FindComponent('redRub'+IntToStr(c))).Value > 0) then
      bOk := CtrlLancaHoras.Processar(
        Trim(spnedAno.Text) +'/'+ FU.PoeZero(cmbMes.ItemIndex+1),
        Sistema.IdEmpresa,
        IdPessoa,
        cdsAux.FieldByName('IDPROVENTO').asFloat,
        cdsAux.FieldByName('IDREGRA').asFloat,
        TRealEdit(FindComponent('redRub'+IntToStr(c))).Value,
        IntUm);

    if not(bOk) then
      Msg := Msg + CR_LF + DescrPasso[c];

    pgbrRub.StepIt;
  end;

  if (bOk) then
  begin
    MsgDlg('Todos os Lançamentos foram atualizados com sucesso.', 'Aviso', mtConfirmation,
      [mbOk], 0);
    inherited;
  end
  else
    MsgDlg('Não pude atualizar Lançamento para a(s) Rubrica(s) de:' + Msg,
      'Erro', mtError, [mbOk,mbHelp], 0);

  pgbrRub.Position := 0;
end;

end.
