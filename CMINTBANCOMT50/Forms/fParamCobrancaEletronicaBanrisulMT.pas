unit fParamCobrancaEletronicaBanrisulMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, TREdit, TB97, CmDock, ExtCtrls, DBCtrls, UmensErro, JCLStrings;

type
  TfrmParamCobrancaEletronicaBanrisulMT = class(TForm)
    pnlFundo: TPanel;
    CMOkCancelar1: TCMOkCancelar;
    Label4: TLabel;
    Label2: TLabel;
    cbxCarteira: TComboBox;
    rgAceite: TRadioGroup;
    Label10: TLabel;
    cbxPrimeiraInstrucao: TComboBox;
    Label3: TLabel;
    Label5: TLabel;
    edtNumeroDias: TRealEdit;
    cbxSegundaInstrucao: TComboBox;
    cbxTipoDocumento: TComboBox;
    Label1: TLabel;
    edtMensagem: TEdit;
    Label6: TLabel;
    Label7: TLabel;
    edtMF: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure CMOkCancelar1OkClick(Sender: TObject);
    procedure CMOkCancelar1CancelarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmParamCobrancaEletronicaBanrisulMT: TfrmParamCobrancaEletronicaBanrisulMT;

implementation

Uses uIntBancoManager;

{$R *.DFM}

procedure TfrmParamCobrancaEletronicaBanrisulMT.FormCreate(Sender: TObject);
Begin
  edtMensagem.Text := IntBancoManager.BuscaParamIntBanco('MENSAGEMBLOQUETO','S');
  edtMF.Text       := IntBancoManager.BuscaParamIntBanco('MF','S');

  if Trim(IntBancoManager.BuscaParamIntBanco('CARTEIRA','N')) = '3' then
     cbxCarteira.ItemIndex := 1
  else
     cbxCarteira.ItemIndex := 0;

  if StrIsNumber(IntBancoManager.BuscaParamIntBanco('DIAS','N')) then
    edtNumeroDias.Value     := StrToInt(IntBancoManager.BuscaParamIntBanco('DIAS','N'))
  else
    edtNumeroDias.Value     := 0;

  if trim(IntBancoManager.BuscaParamIntBanco('ACEITE','S')) = 'N' then
     rgAceite.ItemIndex := 1
  else
     rgAceite.ItemIndex := 0;
  Try
    Case StrToInt(IntBancoManager.BuscaParamIntBanco('TIPODOCUMENTO','N')) of
      4:  cbxTipoDocumento.ItemIndex := 0;
      6:  cbxTipoDocumento.ItemIndex := 1;
      8:  cbxTipoDocumento.ItemIndex := 2;
      9:  cbxTipoDocumento.ItemIndex := 3;
    End;
  Except
    cbxTipoDocumento.ItemIndex := 0;
  End;

  Try
    Case StrToInt(IntBancoManager.BuscaParamIntBanco('PRIMEIRAINSTRUCAO','S')) of
      01:  cbxPrimeiraInstrucao.ItemIndex := 0;
      08: cbxPrimeiraInstrucao.ItemIndex  := 1;
      09: cbxPrimeiraInstrucao.ItemIndex  := 2;
      15: cbxPrimeiraInstrucao.ItemIndex  := 3;
      23: cbxPrimeiraInstrucao.ItemIndex  := 4;
    end;
  except
      cbxPrimeiraInstrucao.ItemIndex := 4;
  end;
  Try
    Case StrToInt(IntBancoManager.BuscaParamIntBanco('SEGUNDAINSTRUCAO','S')) of
      01:  cbxSegundaInstrucao.ItemIndex := 0;
      08: cbxSegundaInstrucao.ItemIndex  := 1;
      09: cbxSegundaInstrucao.ItemIndex  := 2;
      15: cbxSegundaInstrucao.ItemIndex  := 3;
      23: cbxSegundaInstrucao.ItemIndex  := 4;
    end;
  except
    cbxSegundaInstrucao.ItemIndex := 4;
  end;
end;






procedure TfrmParamCobrancaEletronicaBanrisulMT.CMOkCancelar1OkClick(Sender: TObject);
var
CampoAceito,
CampoCarteira,
PrimeiraInstrucao,
SegundaInstrucao,
TipoDocumento,
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

  if cbxCarteira.ItemIndex = 0 then
     CampoCarteira  := '1'
  else
     CampoCarteira  := '3';

  if edtNumeroDias.Value = 0 then
     Dias           := ' '
  else
     Dias           := Trim(FloattoStr(edtNumeroDias.Value));

  Case cbxTipoDocumento.ItemIndex of
    0: TipoDocumento := '04';
    1: TipoDocumento := '06';
    2: TipoDocumento := '08';
    3: TipoDocumento := '09';
  else
    TipoDocumento := '04';
  end;
  Case cbxPrimeiraInstrucao.ItemIndex of
    0:  PrimeiraInstrucao := '01';
    1:  PrimeiraInstrucao := '08';
    2:  PrimeiraInstrucao := '09';
    3:  PrimeiraInstrucao := '15';
    4:  PrimeiraInstrucao := '23';
  else
    PrimeiraInstrucao := '23';
  end;
  Case cbxSegundaInstrucao.ItemIndex of
    0:  SegundaInstrucao := '01';
    1:  SegundaInstrucao := '08';
    2:  SegundaInstrucao := '09';
    3:  SegundaInstrucao := '15';
    4:  SegundaInstrucao := '23';
  else
    SegundaInstrucao := '23';
  end;
  IntBancoManager.GravaParamIntBanco(['CARTEIRA',
                                 'DIAS',
                                 'PRIMEIRAINSTRUCAO',
                                 'SEGUNDAINSTRUCAO',
                                 'ACEITE',
                                 'TIPODOCUMENTO',
                                 'MF',
                                 'MENSAGEMBLOQUETO'],
                                 [CampoCarteira,
                                  Dias,
                                  PrimeiraInstrucao,
                                  SegundaInstrucao,
                                  CampoAceito,
                                  TipoDocumento,
                                  edtMF.Text,
                                  edtMensagem.Text]);
  ModalResult := MrOk;
end;

procedure TfrmParamCobrancaEletronicaBanrisulMT.CMOkCancelar1CancelarClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;


end.
