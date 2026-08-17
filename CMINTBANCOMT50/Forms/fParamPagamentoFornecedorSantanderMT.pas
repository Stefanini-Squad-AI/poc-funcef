unit fParamPagamentoFornecedorSantanderMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, StdCtrls, ExtCtrls, IvDictio, IvMulti, IvEMulti, MAHlpBtn,
  Buttons, TB97Tlbr, TB97;

type
  TfrmParamPagamentoFornecedorSantanderMT = class(TfrmOkCancelar)
    rgTipoDocumento: TRadioGroup;
    cbxFinalidade: TComboBox;
    Label1: TLabel;
    Label2: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmParamPagamentoFornecedorSantanderMT: TfrmParamPagamentoFornecedorSantanderMT;

implementation

Uses uIntBancoManager, uString;

{$R *.DFM}

procedure TfrmParamPagamentoFornecedorSantanderMT.FormCreate(
  Sender: TObject);
begin
  inherited;
  if IntBancoManager.BuscaParamIntBanco('TIPODOCUMENTO','S') = 'DUP' then RgTipoDocumento.ItemIndex := 0;
  if IntBancoManager.BuscaParamIntBanco('TIPODOCUMENTO','S') = 'NF '  then RgTipoDocumento.ItemIndex := 1;
  if IntBancoManager.BuscaParamIntBanco('TIPODOCUMENTO','S') = 'ND '  then RgTipoDocumento.ItemIndex := 2;
  if IntBancoManager.BuscaParamIntBanco('TIPODOCUMENTO','S') = 'NP '  then RgTipoDocumento.ItemIndex := 3;

  if IntBancoManager.BuscaParamIntBanco('FINALIDADE','S') <> '99' then
  begin
    if trim(IntBancoManager.BuscaParamIntBanco('FINALIDADE','S')) <> '' then
      cbxFinalidade.ItemIndex := StrToInt(IntBancoManager.BuscaParamIntBanco('FINALIDADE','S'));
  end
  else
    cbxFinalidade.ItemIndex := 16;
end;

procedure TfrmParamPagamentoFornecedorSantanderMT.bbtnConfirmarClick(
  Sender: TObject);
var sTipoDocumento,
    sFinalidade : String;
begin
 try
  case rgTipoDocumento.ItemIndex of
  0: sTipoDocumento  := 'DUP';
  1: sTipoDocumento  := 'NF ';
  2: sTipoDocumento  := 'ND ';
  3: sTipoDocumento  := 'NP ';
  end;
  sFinalidade := ZD(IntToStr(cbxFinalidade.ItemIndex),2);
  if sFinalidade = '16' then sFinalidade := '99';
  IntBancoManager.GravaParamIntBanco(['TIPODOCUMENTO',
                                 'FINALIDADE'],
                                 [sTipoDocumento,
                                  sFinalidade]);
  inherited;
//  ModalResult := mrOK;

  except
    raise
  end;
end;

end.
