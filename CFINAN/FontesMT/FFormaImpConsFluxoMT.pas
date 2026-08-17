unit FFormaImpConsFluxoMT;

{-----------------------------------------------------------------------------------------
Rotina......: propriedade Cancela
Nº SOL......: 136203
Nº KINTANA..: 813205
Data........: 16/06/2014
Responsável.: Edilaine Ferraresi
Descrição...: Nova funcionalidade para Fluxo de Caixa (incluir campo Grau)
-----------------------------------------------------------------------------------------}


interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, StdCtrls, ExtCtrls, IvDictio, IvMulti, IvEMulti, MAHlpBtn,
  Buttons, TB97Tlbr, TB97;

type
  TfrmFormaImpConsFluxoMT = class(TfrmOkCancelar)
    rgOrientacao: TRadioGroup;
    procedure bbtnCancelarClick(Sender: TObject);
    procedure bbtnSairClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);

  private
    FbCancel: boolean;

  public  { Public declarations }
    property Cancela : boolean read FbCancel write FbCancel;

  end;




var
  frmFormaImpConsFluxoMT: TfrmFormaImpConsFluxoMT;



implementation
{$R *.DFM}



procedure TfrmFormaImpConsFluxoMT.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  FbCancel := true;
end;

procedure TfrmFormaImpConsFluxoMT.bbtnSairClick(Sender: TObject);
begin
  FbCancel := true;
  Close;
end;

procedure TfrmFormaImpConsFluxoMT.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  FbCancel := false;
end;


end.
