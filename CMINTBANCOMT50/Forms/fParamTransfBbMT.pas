{*******************************************************}
{                                                       }
{ CM Soluções Informática  - CMIntBanco50               }
{ ** Todos os Direitos Reservados                       }
{                                                       }
{ - Parâmetros do arquivo de remessa Banco Brasil Trans }
{   BANCO DO BRASIL TRANSF                              }
{   IDMODELOSCNAB = 19/P                                }
{                                                       }
{ Analista Responsável: Gustavo Viegas                  }
{ Atualizado Em: 27/06/2001                             }
{                                                       }
{*******************************************************}

unit fParamTransfBbMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls;

type
  TFrmParamTransfBbMT = class(TfrmOkCancelar)
    Label1: TLabel;
    Label2: TLabel;
    EdtAgeCentral: TEdit;
    EdtContaCentral: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmParamTransfBbMT: TFrmParamTransfBbMT;

implementation

Uses uIntBancoManager;

{$R *.DFM}

procedure TFrmParamTransfBbMT.FormCreate(Sender: TObject);
begin
  inherited;
  EdtAgeCentral.Text   := IntBancoManager.BuscaParamIntBanco('AGENCIACENTRALBB','S');
  EdtContaCentral.Text       := IntBancoManager.BuscaParamIntBanco('CONTACENTRALBB','S');
end;

procedure TFrmParamTransfBbMT.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  IntBancoManager.GravaParamIntBanco(['AGENCIACENTRALBB',
                                 'CONTACENTRALBB'],
                                 [EdtAgeCentral.Text,
                                  EdtContaCentral.Text]);
  ModalResult := mrOk;
end;

end.
