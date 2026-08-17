unit fRParamListaReservaPorGrupoMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  fParamReports_Padrao, CmParamReport, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls,
  wwdbdatetimepicker, CMDateTimePicker, MontaSelect, uMensErro, TREdit, uModulo; 

type
  TfrmRParamListaReservaPorGrupoMT = class(TfrmParamReports_Padrao)
    GroupBox1: TGroupBox;
    chkAguardando: TCheckBox;
    chkEfetivadas: TCheckBox;
    chkCanceladas: TCheckBox;
    MontaSelect: TMontaSelect;
    btBuscaGrupo: TSpeedButton;
    edtGrupo: TEdit;
    Label2: TLabel;
    GroupBox2: TGroupBox;
    cboPerIni: TComboBox;
    Label1: TLabel;
    Label3: TLabel;
    cboPerFim: TComboBox;
    Label4: TLabel;
    edtExercicio: TDBRealEdit;
    Label5: TLabel;
    Label6: TLabel;
    edtIdOperacao: TDBRealEdit;
    procedure btBuscaGrupoClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRParamListaReservaPorGrupoMT: TfrmRParamListaReservaPorGrupoMT;

implementation

{$R *.DFM}

procedure TfrmRParamListaReservaPorGrupoMT.btBuscaGrupoClick(
  Sender: TObject);
begin
  inherited;
   MontaSelect.Executar;
   if MontaSelect.RetornouValor then
      edtGrupo.Text := MontaSelect.ValoresChave[1] + '-' + MontaSelect.ValoresChave[2];
end;




procedure TfrmRParamListaReservaPorGrupoMT.bbtnConfirmarClick(
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
  Cmp_Padrao.ParamValues[7].AsString  := 'R';
  Cmp_Padrao.ParamValues[8].AsInteger := trunc(edtIdOperacao.Value);  
end;




procedure TfrmRParamListaReservaPorGrupoMT.FormCreate(Sender: TObject);
begin
  inherited;
  cboPerIni.ItemIndex := 0;
  cboPerFim.ItemIndex := 0;
  edtExercicio.Text   := FormatDateTime('yyyy',date);
  MontaSelect.Filtro.Add('GRUPOORCAMEN.IDPLANOORCAMEN = ' + IntToStr(Modulo.iPlanoOrc));  
end;

end.
