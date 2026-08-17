unit fLancaFalta;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, fSairAjuda,
  MAHlpBtn, StdCtrls, Buttons, TB97, ExtCtrls, Mask, wwdbedit, Db, DBTables, TREdit, Spin,
  wwdblook, TB97Tlbr, IvDictio, IvMulti, IvEMulti, DBClient, uCMClientDataSet, uCtrlProvDesc,
  uCtrlLancaHoras;

type
  TfrmLancaFalta = class(TfrmSairAjuda)
    bbtnConfirmar: TBitBtn;
    ToolbarSep971: TToolbarSep97;
    CdsRub: TCMClientDataSet;
    edNome: TEdit;
    grpMesRef: TGroupBox;
    cmbMes: TComboBox;
    spnedAno: TSpinEdit;
    Label5: TLabel;
    dblckFalta: TwwDBLookupCombo;
    redFalta: TRealEdit;
    Label4: TLabel;
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    CtrlProvDesc: TCtrlProvDesc;
    CtrlLancaFaltas: TCtrlLancaHoras;

    FIdPessoa: double;
  end;

function RegistraDiasFalta(Nome: string; IdPessoa: double; NumDiasLicenca: integer;
  DataRef: TDate; IdRubFalta: double): boolean;
  
var
  frmLancaFalta: TfrmLancaFalta;

implementation

uses uMensErro, uSistema, uCtrlPadroes, uCtrlFuncoesRH, fAguarde;

{$R *.DFM}

function RegistraDiasFalta(Nome: string; IdPessoa: double; NumDiasLicenca: integer;
  DataRef: TDate; IdRubFalta: double): boolean;
begin
  with TfrmLancaFalta.Create(Application) do
  begin
    redFalta.Value := NumDiasLicenca;
    cmbMes.ItemIndex := FU.ExtraiMes(DataRef) - 1;
    spnedAno.Value := FU.ExtraiAno(DataRef);
    edNome.Text := Nome;
    FIdPessoa := IdPessoa;

    dblckFalta.LookupValue := '';
    if (CdsRub.Locate('IDRUBRICA', IdRubFalta, [])) then
      dblckFalta.LookupValue := CdsRub.FieldByName('DESCRPROVDESC').asString;

    Result := (ShowModal = mrOk);
    Free;
  end;
end;

procedure TfrmLancaFalta.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlProvDesc := TCtrlProvDesc.Create;
  CtrlProvDesc.InitializeAs(Padroes);

  CtrlLancaFaltas := TCtrlLancaHoras.Create;
  CtrlLancaFaltas.InitializeAs(Padroes);

  CdsRub.Data := CtrlProvDesc.ListRubricaEmpresa(IntToStr(Sistema.IdEmpresa));
end;

procedure TfrmLancaFalta.FormDestroy(Sender: TObject);
begin
  FreeAndNil(CtrlLancaFaltas);
  FreeAndNil(CtrlProvDesc);
  inherited;
end;

procedure TfrmLancaFalta.bbtnConfirmarClick(Sender: TObject);
var
  bOk: boolean;
begin
  if (redFalta.Value > 0) and (Trim(dblckFalta.Text) <> '') then
  begin
    frmAguarde.Mostra('Incluindo Faltas...');
    frmAguarde.pbAguarde.Visible := false;
    frmAguarde.Update;

    bOk := CtrlLancaFaltas.Processar(Trim(spnedAno.Text) +'/'+ FU.PoeZero(cmbMes.ItemIndex+1),
      Sistema.IdEmpresa, FIdPessoa, CdsRub.FieldByName('IDPROVENTO').asFloat,
      CdsRub.FieldByName('IDREGRA').asFloat, redFalta.Value, 1);

    frmAguarde.Apaga;
    frmAguarde.pbAguarde.Visible := true;

    if (bOk) then
      MsgDlg('Lançamento realizado com sucesso.', 'Aviso', mtInformation, [mbOk,mbHelp], 0)
    else
      MsgDlg('O erro abaixo ocorreu ao Lançar as Faltas:' +CR_LF+ CtrlLancaFaltas.MessageInfo,
        'Erro', mtError, [mbOk,mbHelp], 0);
  end;
end;

end.
