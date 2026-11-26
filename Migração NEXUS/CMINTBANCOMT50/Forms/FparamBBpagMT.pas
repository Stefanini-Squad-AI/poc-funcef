{*******************************************************}
{                                                       }
{ CM Soluções Informática  - CMIntBanco50               }
{ ** Todos os Direitos Reservados                       }
{                                                       }
{ - Parâmetros do arquivo de remessa Banco Brasil       }
{   BANCO DO BRASIL PAGAMENTO                           }
{   IDMODELOSCNAB = 18/R                                }
{                                                       }
{ Analista Responsável: Gustavo Viegas                  }
{ Atualizado Em: 27/06/2001                             }
{                                                       }
{*******************************************************}

unit FparamBBpagMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Mask, TEdNum;

type
  TFrmparamBBpagMT = class(TfrmOkCancelar)
    Label1: TLabel;
    Label15: TLabel;
    medtMensagem1: TMaskEdit;
    Label2: TLabel;
    Label3: TLabel;
    edtcontrvan: TEditNum;
    chktpserv: TCheckBox;
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmparamBBpagMT: TFrmparamBBpagMT;

implementation

Uses uIntBancoManager, uString;

{$R *.DFM}

procedure TFrmparamBBpagMT.bbtnConfirmarClick(Sender: TObject);
var
tpserv:string[2];
begin
  inherited;
  tpserv:='00';
  if chktpserv.checked then tpserv:='02';
  IntBancoManager.GravaParamIntBanco(['MENSAGEM1','CONTROLEVAN','TIPOSERVICO'],[medtMensagem1.text,edtcontrvan.text,tpserv]);
  
  ModalResult:=mrOk;
end;

procedure TFrmparamBBpagMT.FormCreate(Sender: TObject);

begin
  inherited;
  chktpserv.checked:=false;
  With IntBancoManager do
  Begin
      medtMensagem1.Text:= BuscaParamIntBanco('MENSAGEM1','S');
      edtcontrvan.text  := BuscaParamIntBanco('CONTROLEVAN','S');
      chktpserv.checked := (BuscaParamIntBanco('TIPOSERVICO','S')='02');
  end;
end;

end.
