{*******************************************************}
{                                                       }
{ CM Soluções Informática  - CMIntBanco50               }
{ ** Todos os Direitos Reservados                       }
{                                                       }
{ - Parâmetros do arquivo de remessa Banco do Brasil    }
{   BANCO DO BRASIL CÓDIGO DE BARRAS                    }
{   IDMODELOSCNAB = 4/R                                 }
{                                                       }
{ Analista Responsável: Gustavo Viegas                  }
{ Atualizado Em: 27/06/2001                             }
{                                                       }
{*******************************************************}

unit fParamBarrasBbMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls;

type
  TFrmParamBarrasBbMT = class(TfrmOkCancelar)
    Label25: TLabel;
    EdtEspecie: TEdit;
    Label1: TLabel;
    EdtCarteiraDoc: TEdit;
    RgAceite: TRadioGroup;
    procedure FormCreate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmParamBarrasBbMT: TFrmParamBarrasBbMT;

implementation

Uses uIntBancoManager;

{$R *.DFM}

procedure TFrmParamBarrasBbMT.FormCreate(Sender: TObject);
begin
  inherited;
  EdtCarteiraDoc.Text   := IntBancoManager.BuscaParamIntBanco('CARTEIRA','S');
  EdtEspecie.Text       := IntBancoManager.BuscaParamIntBanco('ESPECIEDOC','S');
  RgAceite.ItemIndex    := RgAceite.Items.IndexOf(IntBancoManager.BuscaParamIntBanco('ACEITE','S'));
  If RgAceite.ItemIndex = -1 Then RgAceite.ItemIndex := 0;
end;

procedure TFrmParamBarrasBbMT.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  IntBancoManager.GravaParamIntBanco(['CARTEIRA',
                                 'ESPECIEDOC',
                                 'ACEITE'],
                                 [EdtCarteiraDoc.Text,
                                  EdtEspecie.Text,
                                  RgAceite.Items[RgAceite.ItemIndex]]);
  ModalResult := mrOk;
end;

end.
