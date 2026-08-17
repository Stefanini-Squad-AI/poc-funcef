unit fParamRegistradaHSBCMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, TREdit, TB97, CmDock, ExtCtrls, DBCtrls, UmensErro;

type
  TfrmParamRegistradaHSBCMT = class(TForm)
    pnlFundo: TPanel;
    CMOkCancelar1: TCMOkCancelar;
    Label4: TLabel;
    Label2: TLabel;
    cbxCarteira: TComboBox;
    rgAceite: TRadioGroup;
    Label10: TLabel;
    cbxPrimeiraInstrucao: TComboBox;
    cbxSegundaInstrucao: TComboBox;
    Label3: TLabel;
    Label5: TLabel;
    edtNumeroDias: TRealEdit;
    Label1: TLabel;
    cbxTipo: TComboBox;
    procedure FormCreate(Sender: TObject);
    procedure CMOkCancelar1OkClick(Sender: TObject);
    procedure CMOkCancelar1CancelarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmParamRegistradaHSBCMT: TfrmParamRegistradaHSBCMT;

implementation

Uses uIntBancoManager;

{$R *.DFM}

procedure TfrmParamRegistradaHSBCMT.FormCreate(Sender: TObject);
Begin
  if Trim(IntBancoManager.BuscaParamIntBanco('CARTEIRA','N')) = '3' then
     cbxCarteira.ItemIndex := 1
  else
     cbxCarteira.ItemIndex := 0;

  try
    edtNumeroDias.Value     := StrToInt(IntBancoManager.BuscaParamIntBanco('DIAS','N'));
  except
    edtNumeroDias.Value     := 0;
  end;

  try
    case StrToInt(IntBancoManager.BuscaParamIntBanco('TIPOCOBRANCA','N')) of
      1:  cbxTipo.ItemIndex := 0;
      8:  cbxTipo.ItemIndex := 1;
      9:  cbxTipo.ItemIndex := 2;
      98: cbxTipo.ItemIndex := 3;
    end
  except
    cbxTipo.ItemIndex       := 0;
  end;

  if trim(IntBancoManager.BuscaParamIntBanco('ACEITE','S')) = 'N' then
     rgAceite.ItemIndex := 1
  else
     rgAceite.ItemIndex := 0;
  Try
    Case StrToInt(IntBancoManager.BuscaParamIntBanco('PRIMEIRAINSTRUCAO','S')) of
      0:  cbxPrimeiraInstrucao.ItemIndex := 0;
      20: cbxPrimeiraInstrucao.ItemIndex := 1;
      23: cbxPrimeiraInstrucao.ItemIndex := 2;
      34: cbxPrimeiraInstrucao.ItemIndex := 3;
      36: cbxPrimeiraInstrucao.ItemIndex := 4;
      40: cbxPrimeiraInstrucao.ItemIndex := 5;
      42: cbxPrimeiraInstrucao.ItemIndex := 6;
      53: cbxPrimeiraInstrucao.ItemIndex := 7;
      56: cbxPrimeiraInstrucao.ItemIndex := 8;
      65: cbxPrimeiraInstrucao.ItemIndex := 9;
      67: cbxPrimeiraInstrucao.ItemIndex := 10;
      68: cbxPrimeiraInstrucao.ItemIndex := 11;
      75: cbxPrimeiraInstrucao.ItemIndex := 12;
      77: cbxPrimeiraInstrucao.ItemIndex := 13;
      76: cbxPrimeiraInstrucao.ItemIndex := 14;
      84: cbxPrimeiraInstrucao.ItemIndex := 15;
    end;
  except
      cbxPrimeiraInstrucao.ItemIndex := 0;
  end;


  Try
    Case StrToInt(IntBancoManager.BuscaParamIntBanco('SEGUNDAINSTRUCAO','S')) of
      0:  cbxSegundaInstrucao.ItemIndex := 0;
      20: cbxSegundaInstrucao.ItemIndex := 1;
      23: cbxSegundaInstrucao.ItemIndex := 2;
      34: cbxSegundaInstrucao.ItemIndex := 3;
      36: cbxSegundaInstrucao.ItemIndex := 4;
      40: cbxSegundaInstrucao.ItemIndex := 5;
      42: cbxSegundaInstrucao.ItemIndex := 6;
      53: cbxSegundaInstrucao.ItemIndex := 7;
      56: cbxSegundaInstrucao.ItemIndex := 8;
      65: cbxSegundaInstrucao.ItemIndex := 9;
      67: cbxSegundaInstrucao.ItemIndex := 10;
      68: cbxSegundaInstrucao.ItemIndex := 11;
      75: cbxSegundaInstrucao.ItemIndex := 12;
      77: cbxSegundaInstrucao.ItemIndex := 13;
      76: cbxSegundaInstrucao.ItemIndex := 14;
      84: cbxSegundaInstrucao.ItemIndex := 15;
    end;
  except
    cbxSegundaInstrucao.ItemIndex := 0;
  end;
end;






procedure TfrmParamRegistradaHSBCMT.CMOkCancelar1OkClick(Sender: TObject);
var
  CampoAceito, CampoCarteira, PrimeiraInstrucao, SegundaInstrucao, Dias, Tipo : String;
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

  if cbxCarteira.ItemIndex = 0 then
     CampoCarteira  := '1'
  else
     CampoCarteira  := '3';

  if edtNumeroDias.Value = 0 then
     Dias           := ' '
  else
     Dias           := Trim(FloattoStr(edtNumeroDias.Value));
  Case cbxPrimeiraInstrucao.ItemIndex of
    0:  PrimeiraInstrucao := '00';
    1:  PrimeiraInstrucao := '20';
    2:  PrimeiraInstrucao := '23';
    3:  PrimeiraInstrucao := '34';
    4:  PrimeiraInstrucao := '36';
    5:  PrimeiraInstrucao := '40';
    6:  PrimeiraInstrucao := '42';
    7:  PrimeiraInstrucao := '53';
    8:  PrimeiraInstrucao := '56';
    9:  PrimeiraInstrucao := '65';
    10: PrimeiraInstrucao := '67';
    11: PrimeiraInstrucao := '68';
    12: PrimeiraInstrucao := '75';
    13: PrimeiraInstrucao := '77';
    14: PrimeiraInstrucao := '76';
    15: PrimeiraInstrucao := '84';
  end;
  Case cbxSegundaInstrucao.ItemIndex of
    0:  SegundaInstrucao := '00';
    1:  SegundaInstrucao := '20';
    2:  SegundaInstrucao := '23';
    3:  SegundaInstrucao := '34';
    4:  SegundaInstrucao := '36';
    5:  SegundaInstrucao := '40';
    6:  SegundaInstrucao := '42';
    7:  SegundaInstrucao := '53';
    8:  SegundaInstrucao := '56';
    9:  SegundaInstrucao := '65';
    10: SegundaInstrucao := '67';
    11: SegundaInstrucao := '68';
    12: SegundaInstrucao := '75';
    13: SegundaInstrucao := '77';
    14: SegundaInstrucao := '76';
    15: SegundaInstrucao := '84';
  end;

  Case cbxTipo.ItemIndex of
    0:  Tipo := '01';
    1:  Tipo := '08';
    2:  Tipo := '09';
    3:  Tipo := '98';
  end;

  IntBancoManager.GravaParamIntBanco(['CARTEIRA',
                                 'DIAS',
                                 'PRIMEIRAINSTRUCAO',
                                 'SEGUNDAINSTRUCAO',
                                 'ACEITE',
                                 'TIPOCOBRANCA'],
                                 [CampoCarteira,
                                  Dias,
                                  PrimeiraInstrucao,
                                  SegundaInstrucao,
                                  CampoAceito,
                                  Tipo]);
  ModalResult := MrOk;
end;

procedure TfrmParamRegistradaHSBCMT.CMOkCancelar1CancelarClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;
end.
