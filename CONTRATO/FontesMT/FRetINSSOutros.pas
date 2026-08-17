{*******************************************************************************
  Alterações:
********************************************************************************
{-------------------------------------------------------------------------------
 Rotinas   : Várias
 Data      : 04/08/2004
 Autor     : David Ayrolla
 Pendências: 16832 e 17232
 Descrição : Limitar a retenção de INSS de autônomos ao teto.
-------------------------------------------------------------------------------}

unit FRetINSSOutros;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, TREdit;

type
  TfrmRetINSSOutros = class(TfrmOkCancelar)
    Label1: TLabel;
    Label2: TLabel;
    edtFornecedor: TEdit;
    edtMes: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    edtValor: TDBRealEdit;
    procedure FormShow(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
  private
    { Private declarations }
  public
    VlOutros : Double
  end;

  function RetINSSOutrasEmpresas( NomeFornec : string; DataRetencao : TDateTime; var VlOutros : Double ) : boolean;

var
  frmRetINSSOutros: TfrmRetINSSOutros;

implementation

{$R *.DFM}

function RetINSSOutrasEmpresas( NomeFornec : string; DataRetencao : TDateTime; var VlOutros : Double ) : boolean;
begin
  Result := False;
  //Cria a janela de retenção do INSS
  frmRetINSSOutros := TfrmRetINSSOutros.Create( nil );
  try
    //Informa o valor de outras empresas
    frmRetINSSOutros.VlOutros := VlOutros;

    frmRetINSSOutros.edtFornecedor.Text := NomeFornec;
    frmRetINSSOutros.edtMes.Text := FormatDateTime( 'mm/yyyy', DataRetencao );

    //Abre a janela e testa o seu retorno
    if frmRetINSSOutros.ShowModal = mrOk then
    begin
      VlOutros  := frmRetINSSOutros.VlOutros;
      Result   := True;
    end;
  finally
    frmRetINSSOutros.Free;
  end;
end;


procedure TfrmRetINSSOutros.FormShow(Sender: TObject);
begin
  inherited;
  edtValor.Value := VlOutros;
end;

procedure TfrmRetINSSOutros.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  if trim( edtValor.Text ) = '' then
    edtValor.Text := '0';

  VlOutros := edtValor.Value;
end;

end.
