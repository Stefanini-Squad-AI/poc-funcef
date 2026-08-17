unit fParamSafraRegistradaMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, TREdit, TB97, CmDock, ExtCtrls, DBCtrls, UmensErro;

type
  TfrmParamSafraRegistradaMT = class(TForm)
    pnlFundo: TPanel;
    CMOkCancelar1: TCMOkCancelar;
    Label5: TLabel;
    Label4: TLabel;
    Label2: TLabel;
    cbxCarteira: TComboBox;
    Label3: TLabel;
    cbxInstrucao1: TComboBox;
    Label7: TLabel;
    cbxInstrucao2: TComboBox;
    edtNumeroDias: TRealEdit;
    edtMensagem: TEdit;
    Label1: TLabel;
    dbrgAceito: TRadioGroup;
    procedure FormCreate(Sender: TObject);
    procedure CMOkCancelar1OkClick(Sender: TObject);
    procedure CMOkCancelar1CancelarClick(Sender: TObject);
    procedure cbxInstrucao1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmParamSafraRegistradaMT: TfrmParamSafraRegistradaMT;

implementation

uses uIntBancoManager;

{$R *.DFM}

procedure TfrmParamSafraRegistradaMT.FormCreate(Sender: TObject);
Begin
  if IntBancoManager.BuscaParamIntBanco('CARTEIRA','S') = '1' then cbxCarteira.ItemIndex := 0;
  if IntBancoManager.BuscaParamIntBanco('CARTEIRA','S') = '2' then cbxCarteira.ItemIndex := 1;
  if IntBancoManager.BuscaParamIntBanco('CARTEIRA','S') = '4' then cbxCarteira.ItemIndex := 2;
  if IntBancoManager.BuscaParamIntBanco('CARTEIRA','S') = '6' then cbxCarteira.ItemIndex := 3;

  Case StrToInt(IntBancoManager.BuscaParamIntBanco('INSTRUCAO1','N')) of
     1:  cbxInstrucao1.ItemIndex := 0;
     2:  cbxInstrucao1.ItemIndex := 1;
     3:  cbxInstrucao1.ItemIndex := 2;
     4:  cbxInstrucao1.ItemIndex := 3;
     6:  cbxInstrucao1.ItemIndex := 4;
     7:  cbxInstrucao1.ItemIndex := 5;
     8:  cbxInstrucao1.ItemIndex := 6;
     90: cbxInstrucao1.ItemIndex := 7;
  else
     cbxInstrucao1.ItemIndex := 0;
  end;

  Case StrToInt(IntBancoManager.BuscaParamIntBanco('INSTRUCAO2','N')) of
     1:  cbxInstrucao2.ItemIndex := 0;
     2:  cbxInstrucao2.ItemIndex := 1;
     3:  cbxInstrucao2.ItemIndex := 2;
     4:  cbxInstrucao2.ItemIndex := 3;
     6:  cbxInstrucao2.ItemIndex := 4;
     7:  cbxInstrucao2.ItemIndex := 5;
     8:  cbxInstrucao2.ItemIndex := 6;
  else
     cbxInstrucao2.ItemIndex := 0;
  end;
  if StrToInt(IntBancoManager.BuscaParamIntBanco('NUMDIASPROTESTO','N')) <> 0 then
  begin
    edtNumeroDias.Color := clWindow;
    edtNumeroDias.Enabled := True;
  end;
  edtNumeroDias.Text  := IntBancoManager.BuscaParamIntBanco('NUMDIASPROTESTO','N');
  edtMensagem.Text := IntBancoManager.BuscaParamIntBanco('MENSAGEM','S');

  if IntBancoManager.BuscaParamIntBanco('ACEITE','S') = 'N' then
     dbrgAceito.ItemIndex := 1
  else
     dbrgAceito.ItemIndex := 0;
end;






procedure TfrmParamSafraRegistradaMT.CMOkCancelar1OkClick(Sender: TObject);
var
carteira, instrucao1, instrucao2, CampoAceito :String;
begin
  if cbxInstrucao1.ItemIndex = cbxInstrucao2.ItemIndex then
  begin
    MsgDlg('A Instrução 1 deve ser diferente da Instrução 2.','Aviso...',mtError,[mbOk],0);
    Exit;
  end;

  if cbxCarteira.ItemIndex = 0 then
     carteira := '1'
  else
     carteira := '4';

  if cbxCarteira.ItemIndex = 0 then Carteira := '1';
  if cbxCarteira.ItemIndex = 1 then Carteira := '2';
  if cbxCarteira.ItemIndex = 2 then Carteira := '4';
  if cbxCarteira.ItemIndex = 3 then Carteira := '6';
  if dbrgAceito.Itemindex = 0 then
     CampoAceito := 'A'
  else
     CampoAceito := 'N';

  Case cbxInstrucao1.ItemIndex of
     0:  instrucao1 := '01';
     1:  instrucao1 := '02';
     2:  instrucao1 := '03';
     3:  instrucao1 := '04';
     4:  instrucao1 := '06';
     5:  instrucao1 := '07';
     6:  instrucao1 := '08';
     7:  instrucao1 := '90';
  end;
  Case cbxInstrucao2.ItemIndex of
     0:  instrucao2 := '01';
     1:  instrucao2 := '02';
     2:  instrucao2 := '03';
     3:  instrucao2 := '04';
     4:  instrucao2 := '06';
     5:  instrucao2 := '07';
     6:  instrucao2 := '08';
  end;
  IntBancoManager.GravaParamIntBanco(['CARTEIRA',
                                 'INSTRUCAO1',
                                 'INSTRUCAO2',
                                 'NUMDIASPROTESTO',
                                 'ACEITE',
                                 'MENSAGEM'],
                                 [carteira,
                                 instrucao1,
                                 instrucao2,
                                 edtNumeroDias.Text,
                                 CampoAceito,
                                 edtMensagem.Text]);
  ModalResult := MrOk;
end;

procedure TfrmParamSafraRegistradaMT.CMOkCancelar1CancelarClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;



procedure TfrmParamSafraRegistradaMT.cbxInstrucao1Click(Sender: TObject);
begin
  if cbxInstrucao1.ItemIndex <> 7 then
  begin
    edtNumeroDias.Enabled := False;
    edtNumeroDias.Color   := clMenu;
    edtNumeroDias.Text    := '0';
  end
  else
  begin
    edtNumeroDias.Enabled := True;
    edtNumeroDias.Color   := clWindow;
  end;
end;

end.
