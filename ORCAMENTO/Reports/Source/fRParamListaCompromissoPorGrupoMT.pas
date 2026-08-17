unit fRParamListaCompromissoPorGrupoMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  fParamReports_Padrao, CmParamReport, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls, TREdit,
  MontaSelect,uMensErro, uModulo;

type
  TfrmRParamListaCompromissoPorGrupoMT = class(TfrmParamReports_Padrao)
    GroupBox2: TGroupBox;
    Label1: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    cboPerIni: TComboBox;
    edtExercicio: TDBRealEdit;
    cboPerFim: TComboBox;
    Label2: TLabel;
    edtGrupo: TEdit;
    btBuscaGrupo: TSpeedButton;
    GroupBox1: TGroupBox;
    chkAguardando: TCheckBox;
    chkEfetivadas: TCheckBox;
    chkCanceladas: TCheckBox;
    MontaSelect: TMontaSelect;
    edtIdOperacao: TDBRealEdit;
    Label3: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure btBuscaGrupoClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRParamListaCompromissoPorGrupoMT: TfrmRParamListaCompromissoPorGrupoMT;

implementation



{$R *.DFM}

procedure TfrmRParamListaCompromissoPorGrupoMT.FormCreate(Sender: TObject);
begin
  inherited;
  cboPerIni.ItemIndex := 0;
  cboPerFim.ItemIndex := 0;
  edtExercicio.Text   := FormatDateTime('yyyy',date);
  MontaSelect.Filtro.Add('GRUPOORCAMEN.IDPLANOORCAMEN = ' + IntToStr(Modulo.iPlanoOrc));
end;



procedure TfrmRParamListaCompromissoPorGrupoMT.btBuscaGrupoClick(
  Sender: TObject);
begin
  inherited;
   MontaSelect.Executar;
   if MontaSelect.RetornouValor then
      edtGrupo.Text := MontaSelect.ValoresChave[1] + '-' + MontaSelect.ValoresChave[2];
end;



procedure TfrmRParamListaCompromissoPorGrupoMT.bbtnConfirmarClick(
  Sender: TObject);
begin
  inherited;

  Cmp_Padrao.ParamValues[0].AsInteger := (cboPerIni.ItemIndex + 1);
  Cmp_Padrao.ParamValues[1].AsInteger := (cboPerFim.ItemIndex + 1);
  Cmp_Padrao.ParamValues[2].AsInteger := StrToInt(edtExercicio.Text);
  
  if edtGrupo.Text <> '' then
     Cmp_Padrao.ParamValues[3].AsInteger := StrToIntDef(MontaSelect.ValoresChave[0],0)
  else
     Cmp_Padrao.ParamValues[3].AsInteger := 0;

  Cmp_Padrao.ParamValues[4].AsBoolean := chkAguardando.Checked;
  Cmp_Padrao.ParamValues[5].AsBoolean := chkEfetivadas.Checked;
  Cmp_Padrao.ParamValues[6].AsBoolean := chkCanceladas.Checked;
  Cmp_Padrao.ParamValues[7].AsString  := 'C';
  Cmp_Padrao.ParamValues[8].AsInteger := trunc(edtIdOperacao.Value);
end;

end.
