{*******************************************************}
{                                                       }
{ Padrões de Desenvolvimento                            }
{ Copyright © 1998,2002 - CM Soluções Informática       }
{                                                       }
{ - Atualização para o padrão MT (3 Camadas)            }
{                                                       }
{ Analista Responsável: Gustavo Viegas                  }
{ Atualizado Em: 10/04/2002                             }
{                                                       }
{*******************************************************}
unit fMensagem;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, wwQuery, TB97Ctls, IvDictio, IvMulti, IvEMulti, 
  StdCtrls, Buttons, TB97Tlbr, TB97, ComCtrls, ExtCtrls, MAHlpBtn, CmDock,
  DBClient, uCmSqlParams;

type
  TfrmMensagem = class(TForm)
    pnlFundo: TPanel;
    Splitter1: TSplitter;
    Panel2: TPanel;
    MemoMensagem: TRichEdit;
    Panel1: TPanel;
    ivTradutor: TIvExtendedTranslator;
    Dock972: TDock97;
    Toolbar971: TToolbar97;
    sbtnNova: TToolbarButton97;
    sbtnEnviar: TToolbarButton97;
    Panel4: TPanel;
    CMOkCancelar1: TCMOkCancelar;
    Cds: TClientDataSet;
    CdsDestinatario: TClientDataSet;
    CspDestinatario: TCMSqlParams;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMensagem: TfrmMensagem;

implementation

{$R *.DFM}

procedure TfrmMensagem.FormCreate(Sender: TObject);
begin
  CspDestinatario.Open;
end;

procedure TfrmMensagem.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

end.
