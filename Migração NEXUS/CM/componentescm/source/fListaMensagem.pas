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
unit fListaMensagem;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, wwQuery, TB97Ctls, IvDictio, IvMulti, IvEMulti, StdCtrls, Buttons,
  TB97Tlbr, TB97, ComCtrls, Grids, ExtCtrls, MAHlpBtn, ImgList, CmDock,
  DBClient, uCmSqlParams, fcOutlookList, fcButton, fcImgBtn, fcShapeBtn,
  fcClearPanel, fcButtonGroup, fcOutlookBar, ActnList, Wwdbigrd, Wwdbgrid,
  Wwdatsrc, uCMClientDataSet, wwriched;

type
  TfrmListaMensagem = class(TForm)
    ivTradutor: TIvExtendedTranslator;
    ImgListaMensagens: TImageList;
    CMOkCancelar1: TCMOkCancelar;
    CspDestinatario: TCMSqlParams;
    CdsDestinatario: TClientDataSet;
    ActListaMensagens: TActionList;
    ActAnterior: TAction;
    ActResponder: TAction;
    ActLida: TAction;
    ActNaoLida: TAction;
    ActImprimir: TAction;
    ActExcluir: TAction;
    ActEncaminhar: TAction;
    ActExcluirEnviados: TAction;
    PgMensagens: TPageControl;
    TbsCxEntrada: TTabSheet;
    TbsEnviados: TTabSheet;
    PnlRecebidos: TPanel;
    SplMensagem: TSplitter;
    PnlGridMensagem: TPanel;
    GridMensagem: TStringGrid;
    HcGridMensagem: THeaderControl;
    PnlMemoMensagemEntrada: TPanel;
    MemoMensagem: TRichEdit;
    PnlMemoMensagem: TPanel;
    Dock972: TDock97;
    Toolbar971: TToolbar97;
    sbtnResponder: TToolbarButton97;
    sbtnAnterior: TToolbarButton97;
    sbtnProximo: TToolbarButton97;
    btnExcluir: TToolbarButton97;
    ToolbarSep971: TToolbarSep97;
    sepResponder: TToolbarSep97;
    btnImprimir: TToolbarButton97;
    btnLida: TToolbarButton97;
    ToolbarSep973: TToolbarSep97;
    btnNaoLida: TToolbarButton97;
    PnlEnviados: TPanel;
    SplMensEnviados: TSplitter;
    PnlGrdEnviados: TPanel;
    PnlReMensagemEnviada: TPanel;
    PnlTitMensEnviada: TPanel;
    Dock971: TDock97;
    Toolbar972: TToolbar97;
    BtnEncaminharEnviados: TToolbarButton97;
    BtnAnteriorEnviados: TToolbarButton97;
    BtnProximoEnviados: TToolbarButton97;
    BtnExcluirEnviados: TToolbarButton97;
    ToolbarSep972: TToolbarSep97;
    ToolbarSep974: TToolbarSep97;
    ActProximo: TAction;
    ActProximoEnviado: TAction;
    ActAnteriorRecebido: TAction;
    GrdMensEnviadas: TwwDBGrid;
    SQLMensagensEnviadas: TCMSqlParams;
    CdsMensagensEnviadas: TCMClientDataSet;
    DsMensagensEnviadas: TwwDataSource;
    wwDBRichEdit1: TwwDBRichEdit;
    ToolbarButton971: TToolbarButton97;
    ActAtualizar: TAction;
    BtnAtualizarEntrada: TToolbarButton97;
    ActAtualizarEntrada: TAction;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure HcGridMensagemSectionResize(HeaderControl: THeaderControl;
      Section: THeaderSection);
    procedure ActProximoExecute(Sender: TObject);
    procedure ActAnteriorExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DsMensagensEnviadasDataChange(Sender: TObject;
      Field: TField);
    procedure ActAtualizarExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmListaMensagem: TfrmListaMensagem;

implementation

{$R *.DFM}
procedure TfrmListaMensagem.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     Action := caFree;
end;

procedure TfrmListaMensagem.HcGridMensagemSectionResize(
  HeaderControl: THeaderControl; Section: THeaderSection);
begin
  GridMensagem.ColWidths[Section.Index] := Section.Width;
end;

procedure TfrmListaMensagem.ActProximoExecute(Sender: TObject);
begin
  if PgMensagens.ActivePage = TbsCxEntrada then
  begin
    if GridMensagem.Row < GridMensagem.RowCount-1 then
       GridMensagem.Row := GridMensagem.Row+1;
  end
  else
    if not GrdMensEnviadas.DataSource.DataSet.Eof then GrdMensEnviadas.DataSource.DataSet.Next;
end;

procedure TfrmListaMensagem.ActAnteriorExecute(Sender: TObject);
begin
  if PgMensagens.ActivePage = TbsCxEntrada then
  begin
    if GridMensagem.Row > 0 then
       GridMensagem.Row := GridMensagem.Row-1;
  End
  else
    if not GrdMensEnviadas.DataSource.DataSet.Bof then GrdMensEnviadas.DataSource.DataSet.Prior;
end;

procedure TfrmListaMensagem.FormCreate(Sender: TObject);
begin
   PgMensagens.ActivePage := TbsCxEntrada;
end;

procedure TfrmListaMensagem.DsMensagensEnviadasDataChange(Sender: TObject;
  Field: TField);
begin
  BtnEncaminharEnviados.Enabled := Not CdsMensagensEnviadas.IsEmpty;
  BtnExcluirEnviados.Enabled := Not CdsMensagensEnviadas.IsEmpty;
end;

procedure TfrmListaMensagem.ActAtualizarExecute(Sender: TObject);
begin
   CdsMensagensEnviadas.Close;
   SQLMensagensEnviadas.Open;
end;

end.
