unit fParamCobRegRealMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, TREdit, TB97, CmDock, ExtCtrls, uMensErro, Mask;

type
  TfrmParamCobRegRealMT = class(TForm)
    CMOkCancelar1: TCMOkCancelar;
    GroupBox1: TGroupBox;
    Label3: TLabel;
    edtNumeroDias: TRealEdit;
    Label1: TLabel;
    cbxEspecieTitulo: TComboBox;
    GroupBox2: TGroupBox;
    Label5: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    Label6: TLabel;
    edtProtesto: TMaskEdit;
    procedure FormCreate(Sender: TObject);
    procedure CMOkCancelar1OkClick(Sender: TObject);
    procedure CMOkCancelar1CancelarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmParamCobRegRealMT: TfrmParamCobRegRealMT;

implementation

uses uIntBancoManager;

{$R *.DFM}

procedure TfrmParamCobRegRealMT.FormCreate(Sender: TObject);
Begin
  edtProtesto.Text           := IntBancoManager.BuscaParamIntBanco('PROTESTO','N');
  edtNumeroDias.Text         := IntBancoManager.BuscaParamIntBanco('NUMDIASPROTESTO','N');
  cbxEspecieTitulo.ItemIndex := StrToIntDef(IntBancoManager.BuscaParamIntBanco('ESPECIETITULO','N'),1);
end;

procedure TfrmParamCobRegRealMT.CMOkCancelar1OkClick(Sender: TObject);
begin
  if cbxEspecieTitulo.ItemIndex = 0 then
  begin
    MsgDlg('Informe a Espécie do Titulo', 'Erro', mtError, [mbOk], 0);
    Exit;
  end;
  IntBancoManager.GravaParamIntBanco(['NUMDIASPROTESTO',
                                 'ESPECIETITULO',
                                 'PROTESTO'],
                                 [edtNumeroDias.Text,
                                  IntToStr(cbxEspecieTitulo.ItemIndex),
                                  edtProtesto.Text
                                 ]);
  ModalResult := MrOk;
end;

procedure TfrmParamCobRegRealMT.CMOkCancelar1CancelarClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

end.
