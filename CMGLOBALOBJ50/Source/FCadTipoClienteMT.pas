{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Analista Responsável: Marco Antonio Abreu             }
{ Atualizado Em: 30/01/2002                             }
{                                                       }
{*******************************************************}

unit FCadTipoClienteMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroMT, MontaSelect, Db, DBClient, uCMClientDataSet, wwdbedit,
  CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97Ctls, TB97, ExtCtrls, Mask,
  uCtrlTipoCliente
{$IFNDEF VERSAO0505}
  , uCmTypes
{$ENDIF}
;

type
  TfrmCadTipoCliente = class(TFrmCadastroMT)
    lblDescricao: TLabel;
    dbedDescricao: TwwDBEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CmeCadastroFind(Sender: TObject);
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroAbortConfirma(sender: TObject;
      OrigemAbortConfirma: TOrigemAbortConfirma);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure CmeCadastroEdit(Sender: TObject);
  private
    { Private declarations }
    TipoCliente: TCtrlTipoCliente;
    Procedure Seleciona( IdTipoCliente: Double = 0 );
  public
    { Public declarations }
  end;

var
  frmCadTipoCliente: TfrmCadTipoCliente;

implementation

{$R *.DFM}

Uses uMensErro, dBasedados, uSistema, uMidasUtil;

procedure TfrmCadTipoCliente.Seleciona( IdTipoCliente: Double );
begin
  Cds.Data := TipoCliente.ListaTipoCliente( IdTipoCliente );
end;

procedure TfrmCadTipoCliente.FormCreate(Sender: TObject);
begin
  inherited;
  TipoCliente := TCtrlTipoCliente.Create;
  TipoCliente.Initialize( DtmBaseDados.dbBaseDados, True, Sistema.ConnectionType,
                          Sistema.ConnectionSide, Sistema.AppRemoteServer, True );
  TipoCliente.cds := cds;
  Seleciona( -1 );
end;

procedure TfrmCadTipoCliente.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  TipoCliente.Free;
end;

procedure TfrmCadTipoCliente.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  IF MontaSelect.RetornouValor Then
     Seleciona( StrToFloat( MontaSelect.ValoresChave[ 0 ] ) );
end;

procedure TfrmCadTipoCliente.CmeCadastroApplyInsert(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := TipoCliente.Gravar;
end;

procedure TfrmCadTipoCliente.CmeCadastroApplyEdit(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := TipoCliente.Gravar;
end;

procedure TfrmCadTipoCliente.CmeCadastroApplyDelete(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := TipoCliente.Gravar;
end;

procedure TfrmCadTipoCliente.CmeCadastroAbortConfirma(sender: TObject;
  OrigemAbortConfirma: TOrigemAbortConfirma);
begin
  inherited;
  MsgDlg( TipoCliente.MessageInfo, 'Erro', mtError, [ mbOK ], 0 );
end;

procedure TfrmCadTipoCliente.CmeCadastroInsert(Sender: TObject);
begin
  inherited;
  dbedDescricao.SetFocus;
end;

procedure TfrmCadTipoCliente.CmeCadastroEdit(Sender: TObject);
begin
  inherited;
  dbedDescricao.SetFocus;
end;

end.

