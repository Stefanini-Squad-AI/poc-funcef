unit fParamCobrancaRegistradaUnibancoMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, TREdit, TB97, CmDock, ExtCtrls, DBCtrls, UmensErro, JCLStrings;

type
  TfrmParamCobrancaRegistradaUnibancoMT = class(TForm)
    CMOkCancelar1: TCMOkCancelar;
    Label4: TLabel;
    pnlFundo: TPanel;
    Label2: TLabel;
    Label10: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    cbxCarteira: TComboBox;
    rgAceite: TRadioGroup;
    cbxPrimeiraInstrucao: TComboBox;
    edtNumeroDias: TRealEdit;
    cbxSegundaInstrucao: TComboBox;
    edtMensagem: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure CMOkCancelar1OkClick(Sender: TObject);
    procedure CMOkCancelar1CancelarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmParamCobrancaRegistradaUnibancoMT: TfrmParamCobrancaRegistradaUnibancoMT;

implementation

Uses uString, uIntBancoManager;

{$R *.DFM}

procedure TfrmParamCobrancaRegistradaUnibancoMT.FormCreate(Sender: TObject);
Begin
  edtMensagem.Text := IntBancoManager.BuscaParamIntBanco('MENSAGEM','S');
  case strToIntDef(IntBancoManager.BuscaParamIntBanco('CARTEIRA','N'),1) of
    1: cbxCarteira.ItemIndex := 0;
    4: cbxCarteira.ItemIndex := 1;
    5: cbxCarteira.ItemIndex := 2;
    6: cbxCarteira.ItemIndex := 3;
    7: cbxCarteira.ItemIndex := 4;
  end;

  if StrIsNumber(IntBancoManager.BuscaParamIntBanco('DIAS','N')) then
    edtNumeroDias.Value     := StrToInt(IntBancoManager.BuscaParamIntBanco('DIAS','N'))
  else
    edtNumeroDias.Value     := 0;

  if trim(IntBancoManager.BuscaParamIntBanco('ACEITE','S')) = 'N' then
     rgAceite.ItemIndex := 1
  else
     rgAceite.ItemIndex := 0;
  cbxPrimeiraInstrucao.ItemIndex := StrToIntDef(IntBancoManager.BuscaParamIntBanco('PRIMEIRAINSTRUCAO','S'),0);
  cbxSegundaInstrucao.ItemIndex  := StrToIntDef(IntBancoManager.BuscaParamIntBanco('SEGUNDAINSTRUCAO','S'),0);
end;

procedure TfrmParamCobrancaRegistradaUnibancoMT.CMOkCancelar1OkClick(Sender: TObject);
var
CampoAceito,
CampoCarteira,
PrimeiraInstrucao,
SegundaInstrucao,
Dias :String;
begin
// -----------------------------------------------------------------------------
  if cbxPrimeiraInstrucao.ItemIndex <> 0 then
    if cbxPrimeiraInstrucao.ItemIndex = cbxSegundaInstrucao.ItemIndex then
    begin
      MsgDlg('A primeira instrução deve ser diferente da segunda instrução.','Aviso...',mtError,[mbOk],0);
      Exit;
    end;

  if rgAceite.ItemIndex = 0 then
     CampoAceito := 'A'
  else
  CampoAceito := 'N';

  case cbxCarteira.ItemIndex of
    0: CampoCarteira  := '1';
    1: CampoCarteira  := '4';
    2: CampoCarteira  := '5';
    3: CampoCarteira  := '6';
    4: CampoCarteira  := '7';
  end;

  if edtNumeroDias.Value = 0 then
     Dias           := ' '
  else
     Dias           := Trim(FloattoStr(edtNumeroDias.Value));

  PrimeiraInstrucao := ZD(Trim(IntToStr(cbxPrimeiraInstrucao.ItemIndex)),2);
  SegundaInstrucao  := ZD(Trim(IntToStr(cbxSegundaInstrucao.ItemIndex)),2);

  IntBancoManager.GravaParamIntBanco(['CARTEIRA',
                                 'DIAS',
                                 'PRIMEIRAINSTRUCAO',
                                 'SEGUNDAINSTRUCAO',
                                 'ACEITE',
                                 'MENSAGEM'],
                                 [CampoCarteira,
                                  Dias,
                                  PrimeiraInstrucao,
                                  SegundaInstrucao,
                                  CampoAceito,
                                  edtMensagem.Text]);
  ModalResult := MrOk;
end;

procedure TfrmParamCobrancaRegistradaUnibancoMT.CMOkCancelar1CancelarClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;


end.
