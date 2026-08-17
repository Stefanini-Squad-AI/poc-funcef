unit fParamCobrancaEletronicaBBVMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, TREdit, TB97, CmDock, ExtCtrls, DBCtrls, UmensErro, JCLStrings;

type
  TfrmParamCobrancaEletronicaBBVMT = class(TForm)
    pnlFundo: TPanel;
    CMOkCancelar1: TCMOkCancelar;
    Label4: TLabel;
    Label2: TLabel;
    cbxCarteira: TComboBox;
    Label10: TLabel;
    cbxPrimeiraInstrucao: TComboBox;
    Label3: TLabel;
    Label5: TLabel;
    edtNumeroDias: TRealEdit;
    cbxSegundaInstrucao: TComboBox;
    edtMensagem: TEdit;
    Label6: TLabel;
    Label1: TLabel;
    edtTipo: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure CMOkCancelar1OkClick(Sender: TObject);
    procedure CMOkCancelar1CancelarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmParamCobrancaEletronicaBBVMT: TfrmParamCobrancaEletronicaBBVMT;

implementation

Uses uIntBancoManager;

{$R *.DFM}

procedure TfrmParamCobrancaEletronicaBBVMT.FormCreate(Sender: TObject);
Begin
  edtMensagem.Text := IntBancoManager.BuscaParamIntBanco('MENSAGEM','S');
  edtTIPO.Text := IntBancoManager.BuscaParamIntBanco('TIPOLAYOUT','S');

  case strToIntDef(IntBancoManager.BuscaParamIntBanco('CARTEIRA','N'),1) of
    1: cbxCarteira.ItemIndex := 0;
    2: cbxCarteira.ItemIndex := 1;
    7: cbxCarteira.ItemIndex := 2;
  end;


  if StrIsNumber(IntBancoManager.BuscaParamIntBanco('DIAS','N')) then
    edtNumeroDias.Value     := StrToInt(IntBancoManager.BuscaParamIntBanco('DIAS','N'))
  else
    edtNumeroDias.Value     := 0;

  Case StrToIntDef(IntBancoManager.BuscaParamIntBanco('PRIMEIRAINSTRUCAO','S'),0) of
    0:   cbxPrimeiraInstrucao.ItemIndex := 0;
    1:   cbxPrimeiraInstrucao.ItemIndex := 1;
    2:   cbxPrimeiraInstrucao.ItemIndex := 2;
    3:   cbxPrimeiraInstrucao.ItemIndex := 3;
    4:   cbxPrimeiraInstrucao.ItemIndex := 4;
    5:   cbxPrimeiraInstrucao.ItemIndex := 5;
    6:   cbxPrimeiraInstrucao.ItemIndex := 6;
    7:   cbxPrimeiraInstrucao.ItemIndex := 7;
    8:   cbxPrimeiraInstrucao.ItemIndex := 8;
    9:   cbxPrimeiraInstrucao.ItemIndex := 9;
    10:  cbxPrimeiraInstrucao.ItemIndex := 10;
    11:  cbxPrimeiraInstrucao.ItemIndex := 11;
    12:  cbxPrimeiraInstrucao.ItemIndex := 12;
    13:  cbxPrimeiraInstrucao.ItemIndex := 13;
    14:  cbxPrimeiraInstrucao.ItemIndex := 14;
    15:  cbxPrimeiraInstrucao.ItemIndex := 15;
    16:  cbxPrimeiraInstrucao.ItemIndex := 16;
    17:  cbxPrimeiraInstrucao.ItemIndex := 17;
    23:  cbxPrimeiraInstrucao.ItemIndex := 18;
    24:  cbxPrimeiraInstrucao.ItemIndex := 19;
    25:  cbxPrimeiraInstrucao.ItemIndex := 20;
    26:  cbxPrimeiraInstrucao.ItemIndex := 21;
  end;

  Case StrToIntDef(IntBancoManager.BuscaParamIntBanco('SEGUNDAINSTRUCAO','S'),0) of
    0:   cbxSegundaInstrucao.ItemIndex := 0;
    1:   cbxSegundaInstrucao.ItemIndex := 1;
    2:   cbxSegundaInstrucao.ItemIndex := 2;
    3:   cbxSegundaInstrucao.ItemIndex := 3;
    4:   cbxSegundaInstrucao.ItemIndex := 4;
    5:   cbxSegundaInstrucao.ItemIndex := 5;
    6:   cbxSegundaInstrucao.ItemIndex := 6;
    7:   cbxSegundaInstrucao.ItemIndex := 7;
    8:   cbxSegundaInstrucao.ItemIndex := 8;
    9:   cbxSegundaInstrucao.ItemIndex := 9;
    10:  cbxSegundaInstrucao.ItemIndex := 10;
    11:  cbxSegundaInstrucao.ItemIndex := 11;
    12:  cbxSegundaInstrucao.ItemIndex := 12;
    13:  cbxSegundaInstrucao.ItemIndex := 13;
    14:  cbxSegundaInstrucao.ItemIndex := 14;
    15:  cbxSegundaInstrucao.ItemIndex := 15;
    16:  cbxSegundaInstrucao.ItemIndex := 16;
    17:  cbxSegundaInstrucao.ItemIndex := 17;
    23:  cbxSegundaInstrucao.ItemIndex := 18;
    24:  cbxSegundaInstrucao.ItemIndex := 19;
    25:  cbxSegundaInstrucao.ItemIndex := 20;
    26:  cbxSegundaInstrucao.ItemIndex := 21;
  end;
end;






procedure TfrmParamCobrancaEletronicaBBVMT.CMOkCancelar1OkClick(Sender: TObject);
var
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

  case cbxCarteira.ItemIndex of
    0: CampoCarteira  := '1';
    1: CampoCarteira  := '2';
    2: CampoCarteira  := '7';
  end;

  if edtNumeroDias.Value = 0 then
     Dias           := ' '
  else
     Dias           := Trim(FloattoStr(edtNumeroDias.Value));

  Case cbxPrimeiraInstrucao.ItemIndex of
    0:   PrimeiraInstrucao := '00';
    1:   PrimeiraInstrucao := '01';
    2:   PrimeiraInstrucao := '02';
    3:   PrimeiraInstrucao := '03';
    4:   PrimeiraInstrucao := '04';
    5:   PrimeiraInstrucao := '05';
    6:   PrimeiraInstrucao := '06';
    7:   PrimeiraInstrucao := '07';
    8:   PrimeiraInstrucao := '08';
    9:   PrimeiraInstrucao := '09';
    10:  PrimeiraInstrucao := '10';
    11:  PrimeiraInstrucao := '11';
    12:  PrimeiraInstrucao := '12';
    13:  PrimeiraInstrucao := '13';
    14:  PrimeiraInstrucao := '14';
    15:  PrimeiraInstrucao := '15';
    16:  PrimeiraInstrucao := '16';
    17:  PrimeiraInstrucao := '17';
    18:  PrimeiraInstrucao := '23';
    19:  PrimeiraInstrucao := '24';
    20:  PrimeiraInstrucao := '25';
    21:  PrimeiraInstrucao := '26';
  else
    PrimeiraInstrucao := '00';
  end;
  Case cbxSegundaInstrucao.ItemIndex of
    0:   SegundaInstrucao := '00';
    1:   SegundaInstrucao := '01';
    2:   SegundaInstrucao := '02';
    3:   SegundaInstrucao := '03';
    4:   SegundaInstrucao := '04';
    5:   SegundaInstrucao := '05';
    6:   SegundaInstrucao := '06';
    7:   SegundaInstrucao := '07';
    8:   SegundaInstrucao := '08';
    9:   SegundaInstrucao := '09';
    10:  SegundaInstrucao := '10';
    11:  SegundaInstrucao := '11';
    12:  SegundaInstrucao := '12';
    13:  SegundaInstrucao := '13';
    14:  SegundaInstrucao := '14';
    15:  SegundaInstrucao := '15';
    16:  SegundaInstrucao := '16';
    17:  SegundaInstrucao := '17';
    18:  SegundaInstrucao := '23';
    19:  SegundaInstrucao := '24';
    20:  SegundaInstrucao := '25';
    21:  SegundaInstrucao := '26';
  else
    SegundaInstrucao := '00';
  end;
  IntBancoManager.GravaParamIntBanco(['CARTEIRA',
                                 'DIAS',
                                 'PRIMEIRAINSTRUCAO',
                                 'SEGUNDAINSTRUCAO',
                                 'TIPOLAYOUT',
                                 'MENSAGEM'],
                                 [CampoCarteira,
                                  Dias,
                                  PrimeiraInstrucao,
                                  SegundaInstrucao,
                                  edtTipo.Text,
                                  edtMensagem.Text]);
  ModalResult := MrOk;
end;

procedure TfrmParamCobrancaEletronicaBBVMT.CMOkCancelar1CancelarClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;


end.
