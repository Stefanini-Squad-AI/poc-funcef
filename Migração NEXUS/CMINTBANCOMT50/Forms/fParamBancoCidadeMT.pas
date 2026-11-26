unit fParamBancoCidadeMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, TREdit, TB97, CmDock, ExtCtrls, DBCtrls, UmensErro;

type
  TfrmParamBancoCidadeMT = class(TForm)
    pnlFundo: TPanel;
    CMOkCancelar1: TCMOkCancelar;
    Label4: TLabel;
    Label2: TLabel;
    cbxCarteira: TComboBox;
    rgAceite: TRadioGroup;
    cbxServico: TComboBox;
    Label7: TLabel;
    Label10: TLabel;
    cbxPrimeiraInstrucao: TComboBox;
    cbxSegundaInstrucao: TComboBox;
    Label3: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure CMOkCancelar1OkClick(Sender: TObject);
    procedure CMOkCancelar1CancelarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmParamBancoCidadeMT: TfrmParamBancoCidadeMT;

implementation

Uses uIntBancoManager;

{$R *.DFM}

procedure TfrmParamBancoCidadeMT.FormCreate(Sender: TObject);
Begin
  cbxCarteira.ItemIndex   := StrToInt(IntBancoManager.BuscaParamIntBanco('CARTEIRA','N'));
  cbxServico.ItemIndex    := StrToInt(IntBancoManager.BuscaParamIntBanco('SERVICO','N'));
  if trim(IntBancoManager.BuscaParamIntBanco('ACEITE','S')) = 'A' then
     rgAceite.ItemIndex := 0
  else
     rgAceite.ItemIndex := 1;
  if Trim(IntBancoManager.BuscaParamIntBanco('PRIMEIRAINSTRUCAO','S')) = '00' then cbxPrimeiraInstrucao.ItemIndex := 0;
  if Trim(IntBancoManager.BuscaParamIntBanco('PRIMEIRAINSTRUCAO','S')) = '01' then cbxPrimeiraInstrucao.ItemIndex := 1;
  if Trim(IntBancoManager.BuscaParamIntBanco('PRIMEIRAINSTRUCAO','S')) = '02' then cbxPrimeiraInstrucao.ItemIndex := 2;
  if Trim(IntBancoManager.BuscaParamIntBanco('PRIMEIRAINSTRUCAO','S')) = '03' then cbxPrimeiraInstrucao.ItemIndex := 3;
  if Trim(IntBancoManager.BuscaParamIntBanco('PRIMEIRAINSTRUCAO','S')) = '04' then cbxPrimeiraInstrucao.ItemIndex := 4;
  if Trim(IntBancoManager.BuscaParamIntBanco('PRIMEIRAINSTRUCAO','S')) = '05' then cbxPrimeiraInstrucao.ItemIndex := 5;
  if Trim(IntBancoManager.BuscaParamIntBanco('PRIMEIRAINSTRUCAO','S')) = '06' then cbxPrimeiraInstrucao.ItemIndex := 6;
  if Trim(IntBancoManager.BuscaParamIntBanco('PRIMEIRAINSTRUCAO','S')) = '07' then cbxPrimeiraInstrucao.ItemIndex := 7;
  if Trim(IntBancoManager.BuscaParamIntBanco('PRIMEIRAINSTRUCAO','S')) = '08' then cbxPrimeiraInstrucao.ItemIndex := 8;
  if Trim(IntBancoManager.BuscaParamIntBanco('PRIMEIRAINSTRUCAO','S')) = '10' then cbxPrimeiraInstrucao.ItemIndex := 9;
  if Trim(IntBancoManager.BuscaParamIntBanco('PRIMEIRAINSTRUCAO','S')) = '11' then cbxPrimeiraInstrucao.ItemIndex := 10;
  if Trim(IntBancoManager.BuscaParamIntBanco('PRIMEIRAINSTRUCAO','S')) = '12' then cbxPrimeiraInstrucao.ItemIndex := 11;
  if Trim(IntBancoManager.BuscaParamIntBanco('PRIMEIRAINSTRUCAO','S')) = '13' then cbxPrimeiraInstrucao.ItemIndex := 12;
  if Trim(IntBancoManager.BuscaParamIntBanco('PRIMEIRAINSTRUCAO','S')) = '14' then cbxPrimeiraInstrucao.ItemIndex := 13;
  if Trim(IntBancoManager.BuscaParamIntBanco('PRIMEIRAINSTRUCAO','S')) = '15' then cbxPrimeiraInstrucao.ItemIndex := 14;
  if Trim(IntBancoManager.BuscaParamIntBanco('PRIMEIRAINSTRUCAO','S')) = '16' then cbxPrimeiraInstrucao.ItemIndex := 15;
  if Trim(IntBancoManager.BuscaParamIntBanco('PRIMEIRAINSTRUCAO','S')) = '17' then cbxPrimeiraInstrucao.ItemIndex := 16;
  if Trim(IntBancoManager.BuscaParamIntBanco('PRIMEIRAINSTRUCAO','S')) = '18' then cbxPrimeiraInstrucao.ItemIndex := 17;
  if Trim(IntBancoManager.BuscaParamIntBanco('PRIMEIRAINSTRUCAO','S')) = '19' then cbxPrimeiraInstrucao.ItemIndex := 18;
  if Trim(IntBancoManager.BuscaParamIntBanco('PRIMEIRAINSTRUCAO','S')) = '20' then cbxPrimeiraInstrucao.ItemIndex := 19;
  if Trim(IntBancoManager.BuscaParamIntBanco('PRIMEIRAINSTRUCAO','S')) = '21' then cbxPrimeiraInstrucao.ItemIndex := 20;
  if Trim(IntBancoManager.BuscaParamIntBanco('PRIMEIRAINSTRUCAO','S')) = '22' then cbxPrimeiraInstrucao.ItemIndex := 21;

  if Trim(IntBancoManager.BuscaParamIntBanco('SEGUNDAINSTRUCAO','S')) = '00' then cbxSegundaInstrucao.ItemIndex := 0;
  if Trim(IntBancoManager.BuscaParamIntBanco('SEGUNDAINSTRUCAO','S')) = '01' then cbxSegundaInstrucao.ItemIndex := 1;
  if Trim(IntBancoManager.BuscaParamIntBanco('SEGUNDAINSTRUCAO','S')) = '02' then cbxSegundaInstrucao.ItemIndex := 2;
  if Trim(IntBancoManager.BuscaParamIntBanco('SEGUNDAINSTRUCAO','S')) = '03' then cbxSegundaInstrucao.ItemIndex := 3;
  if Trim(IntBancoManager.BuscaParamIntBanco('SEGUNDAINSTRUCAO','S')) = '04' then cbxSegundaInstrucao.ItemIndex := 4;
  if Trim(IntBancoManager.BuscaParamIntBanco('SEGUNDAINSTRUCAO','S')) = '05' then cbxSegundaInstrucao.ItemIndex := 5;
  if Trim(IntBancoManager.BuscaParamIntBanco('SEGUNDAINSTRUCAO','S')) = '06' then cbxSegundaInstrucao.ItemIndex := 6;
  if Trim(IntBancoManager.BuscaParamIntBanco('SEGUNDAINSTRUCAO','S')) = '07' then cbxSegundaInstrucao.ItemIndex := 7;
  if Trim(IntBancoManager.BuscaParamIntBanco('SEGUNDAINSTRUCAO','S')) = '08' then cbxSegundaInstrucao.ItemIndex := 8;
  if Trim(IntBancoManager.BuscaParamIntBanco('SEGUNDAINSTRUCAO','S')) = '10' then cbxSegundaInstrucao.ItemIndex := 9;
  if Trim(IntBancoManager.BuscaParamIntBanco('SEGUNDAINSTRUCAO','S')) = '11' then cbxSegundaInstrucao.ItemIndex := 10;
  if Trim(IntBancoManager.BuscaParamIntBanco('SEGUNDAINSTRUCAO','S')) = '12' then cbxSegundaInstrucao.ItemIndex := 11;
  if Trim(IntBancoManager.BuscaParamIntBanco('SEGUNDAINSTRUCAO','S')) = '13' then cbxSegundaInstrucao.ItemIndex := 12;
  if Trim(IntBancoManager.BuscaParamIntBanco('SEGUNDAINSTRUCAO','S')) = '14' then cbxSegundaInstrucao.ItemIndex := 13;
  if Trim(IntBancoManager.BuscaParamIntBanco('SEGUNDAINSTRUCAO','S')) = '15' then cbxSegundaInstrucao.ItemIndex := 14;
  if Trim(IntBancoManager.BuscaParamIntBanco('SEGUNDAINSTRUCAO','S')) = '16' then cbxSegundaInstrucao.ItemIndex := 15;
  if Trim(IntBancoManager.BuscaParamIntBanco('SEGUNDAINSTRUCAO','S')) = '17' then cbxSegundaInstrucao.ItemIndex := 16;
  if Trim(IntBancoManager.BuscaParamIntBanco('SEGUNDAINSTRUCAO','S')) = '18' then cbxSegundaInstrucao.ItemIndex := 17;
  if Trim(IntBancoManager.BuscaParamIntBanco('SEGUNDAINSTRUCAO','S')) = '19' then cbxSegundaInstrucao.ItemIndex := 18;
  if Trim(IntBancoManager.BuscaParamIntBanco('SEGUNDAINSTRUCAO','S')) = '20' then cbxSegundaInstrucao.ItemIndex := 19;
  if Trim(IntBancoManager.BuscaParamIntBanco('SEGUNDAINSTRUCAO','S')) = '21' then cbxSegundaInstrucao.ItemIndex := 20;
  if Trim(IntBancoManager.BuscaParamIntBanco('SEGUNDAINSTRUCAO','S')) = '22' then cbxSegundaInstrucao.ItemIndex := 21;
end;






procedure TfrmParamBancoCidadeMT.CMOkCancelar1OkClick(Sender: TObject);
var
CampoAceito,
CampoServico,
CampoCarteira,
PrimeiraInstrucao,
SegundaInstrucao :String;
begin
// -----------------------------------------------------------------------------
  if trim(cbxCarteira.Text) = ''  then
  begin
    MsgDlg('Informe o Tipo de Carteira.','Aviso...',mtError,[mbOk],0);
    Exit;
  end;
  if trim(cbxServico.Text) = ''  then
  begin
    MsgDlg('Informe o Tipo de Serviço.','Aviso...',mtError,[mbOk],0);
    Exit;
  end;
// -----------------------------------------------------------------------------

  if rgAceite.ItemIndex = 0 then
     CampoAceito := 'A'
  else
     CampoAceito := 'N';

  CampoCarteira        := Trim(IntToStr(cbxCarteira.ItemIndex));
  CampoServico         := Trim(IntToStr(cbxServico.ItemIndex));

  Case cbxPrimeiraInstrucao.ItemIndex of
     0:  PrimeiraInstrucao := '00';
     1:  PrimeiraInstrucao := '01';
     2:  PrimeiraInstrucao := '02';
     3:  PrimeiraInstrucao := '03';
     4:  PrimeiraInstrucao := '04';
     5:  PrimeiraInstrucao := '05';
     6:  PrimeiraInstrucao := '06';
     7:  PrimeiraInstrucao := '07';
     8:  PrimeiraInstrucao := '08';
     9:  PrimeiraInstrucao := '10';
     10: PrimeiraInstrucao := '11';
     11: PrimeiraInstrucao := '12';
     12: PrimeiraInstrucao := '13';
     13: PrimeiraInstrucao := '14';
     14: PrimeiraInstrucao := '15';
     15: PrimeiraInstrucao := '16';
     16: PrimeiraInstrucao := '17';
     17: PrimeiraInstrucao := '18';
     18: PrimeiraInstrucao := '19';
     19: PrimeiraInstrucao := '20';
     20: PrimeiraInstrucao := '21';
     21: PrimeiraInstrucao := '22';
  else
     PrimeiraInstrucao := '00';
  end;

  Case cbxSegundaInstrucao.ItemIndex of
     0:  SegundaInstrucao := '00';
     1:  SegundaInstrucao := '01';
     2:  SegundaInstrucao := '02';
     3:  SegundaInstrucao := '03';
     4:  SegundaInstrucao := '04';
     5:  SegundaInstrucao := '05';
     6:  SegundaInstrucao := '06';
     7:  SegundaInstrucao := '07';
     8:  SegundaInstrucao := '08';
     9:  SegundaInstrucao := '10';
     10: SegundaInstrucao := '11';
     11: SegundaInstrucao := '12';
     12: SegundaInstrucao := '13';
     13: SegundaInstrucao := '14';
     14: SegundaInstrucao := '15';
     15: SegundaInstrucao := '16';
     16: SegundaInstrucao := '17';
     17: SegundaInstrucao := '18';
     18: SegundaInstrucao := '19';
     19: SegundaInstrucao := '20';
     20: SegundaInstrucao := '21';
     21: SegundaInstrucao := '22';
  else
     SegundaInstrucao := '00';
  end;
  IntBancoManager.GravaParamIntBanco(['CARTEIRA',
                                 'SERVICO',
                                 'PRIMEIRAINSTRUCAO',
                                 'SEGUNDAINSTRUCAO',
                                 'ACEITE'],
                                 [CampoCarteira,
                                  CampoServico,
                                  PrimeiraInstrucao,
                                  SegundaInstrucao,
                                  CampoAceito]);
  ModalResult := MrOk;
end;

procedure TfrmParamBancoCidadeMT.CMOkCancelar1CancelarClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;


end.
