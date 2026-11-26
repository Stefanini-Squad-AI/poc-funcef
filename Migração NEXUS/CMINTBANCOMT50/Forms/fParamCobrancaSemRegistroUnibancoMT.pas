unit fParamCobrancaSemRegistroUnibancoMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, TREdit, TB97, CmDock, ExtCtrls, DBCtrls, UmensErro, JCLStrings;

type
  TfrmParamCobrancaSemRegistroUnibancoMT = class(TForm)
    CMOkCancelar1: TCMOkCancelar;
    Label4: TLabel;
    pnlFundo: TPanel;
    Label5: TLabel;
    rgAceite: TRadioGroup;
    edtNumeroDias: TRealEdit;
    Label2: TLabel;
    cbxFormulario: TComboBox;
    procedure FormCreate(Sender: TObject);
    procedure CMOkCancelar1OkClick(Sender: TObject);
    procedure CMOkCancelar1CancelarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmParamCobrancaSemRegistroUnibancoMT: TfrmParamCobrancaSemRegistroUnibancoMT;

implementation

Uses uIntBancoManager;

{$R *.DFM}

procedure TfrmParamCobrancaSemRegistroUnibancoMT.FormCreate(Sender: TObject);
Begin
  if StrIsNumber(IntBancoManager.BuscaParamIntBanco('DIAS','N')) then
    edtNumeroDias.Value     := StrToInt(IntBancoManager.BuscaParamIntBanco('DIAS','N'))
  else
    edtNumeroDias.Value     := 0;

  if trim(IntBancoManager.BuscaParamIntBanco('ACEITE','S')) = 'N' then
     rgAceite.ItemIndex := 1
  else
     rgAceite.ItemIndex := 0;

  cbxFormulario.ItemIndex := StrToIntDef(IntBancoManager.BuscaParamIntBanco('FORMULARIO','S'),6);
end;

procedure TfrmParamCobrancaSemRegistroUnibancoMT.CMOkCancelar1OkClick(Sender: TObject);
var
  CampoAceito, sFormulario,
  Dias :String;
begin
  if rgAceite.ItemIndex = 0 then
     CampoAceito := 'A'
  else
     CampoAceito := 'N';

  if edtNumeroDias.Value = 0 then
     Dias           := ' '
  else
     Dias           := Trim(FloattoStr(edtNumeroDias.Value));

  if cbxFormulario.ItemIndex = 0 then
    sFormulario  := '6'
  else
    sFormulario  := Trim(IntToStr(cbxFormulario.ItemIndex));

  IntBancoManager.GravaParamIntBanco(['ACEITE',
                                 'FORMULARIO',
                                 'DIAS'],
                                 [CampoAceito,
                                  sFormulario,
                                  Dias]);
  ModalResult := MrOk;
end;

procedure TfrmParamCobrancaSemRegistroUnibancoMT.CMOkCancelar1CancelarClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;
end.
