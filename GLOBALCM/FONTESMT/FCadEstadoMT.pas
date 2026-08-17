{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Atualizado Em: 17/01/2002                             }
{                                                       }
{*******************************************************}

unit FCadEstadoMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroMT, wwdblook, StdCtrls, Mask, wwdbedit, MontaSelect, Db,
  DBClient, uCMClientDataSet, CmEventosCadastro, ImgList, Wwdatsrc,
  IvDictio, IvMulti, IvEMulti, MAHlpBtn, Buttons, TB97Tlbr, TB97Ctls, TB97,
  ExtCtrls, UCtrlEstado, uCtrlPais
{$IFNDEF VERSAO0505}
  , uCmTypes
{$ENDIF}
;

type
  TfrmCadUF = class(TFrmCadastroMT)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    dbedUF: TwwDBEdit;
    dbedestado: TwwDBEdit;
    CmbPais: TwwDBLookupCombo;
    CdsPais: TCMClientDataSet;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CmeCadastroFind(Sender: TObject);
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroAbortConfirma(sender: TObject;
      OrigemAbortConfirma: TOrigemAbortConfirma);
    procedure CmeCadastroEdit(Sender: TObject);
    procedure CmeCadastroInsert(Sender: TObject);
  private
    { Private declarations }
    Estado: TCtrlEstado;
    Pais: TCtrlPais;
    procedure Seleciona( IdEstado: Double = 0 );
  public
    { Public declarations }
  end;

var
  frmCadUF: TfrmCadUF;

implementation

{$R *.DFM}

Uses uMensErro, dBasedados, uSistema, uMidasUtil;

procedure TfrmCadUF.Seleciona( IdEstado: Double = 0 );
begin
  Cds.Data := Estado.ListaEstado( 0, IdEstado );
end;

procedure TfrmCadUF.FormCreate(Sender: TObject);
begin
  inherited;
  Pais   := TCtrlPais.Create;
  Pais.Initialize( DtmBaseDados.dbBaseDados, True, Sistema.ConnectionType,
                   Sistema.ConnectionSide, Sistema.AppRemoteServer, True );
  Estado := TCtrlEstado.Create;
  Estado.Initialize( DtmBaseDados.dbBaseDados, True, Sistema.ConnectionType,
                    Sistema.ConnectionSide, Sistema.AppRemoteServer, True );
  Estado.cds := cds;
  CdsPais.Data := Pais.ListaPais();
  Seleciona( -1 );
end;

procedure TfrmCadUF.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  Estado.Free;
  Pais.Free;
end;

procedure TfrmCadUF.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  IF MontaSelect.RetornouValor Then
     Seleciona( StrToFloat( MontaSelect.ValoresChave[ 0 ] ) );
end;

procedure TfrmCadUF.CmeCadastroApplyInsert(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := Estado.Gravar;
end;

procedure TfrmCadUF.CmeCadastroApplyEdit(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := Estado.Gravar;
end;

procedure TfrmCadUF.CmeCadastroApplyDelete(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := Estado.Gravar;
end;

procedure TfrmCadUF.CmeCadastroAbortConfirma(sender: TObject;
  OrigemAbortConfirma: TOrigemAbortConfirma);
begin
  inherited;
  MsgDlg( Estado.MessageInfo, 'Erro', mtError, [ mbOK ], 0 );
end;

procedure TfrmCadUF.CmeCadastroEdit(Sender: TObject);
begin
  inherited;
  dbedUf.SetFocus;
end;

procedure TfrmCadUF.CmeCadastroInsert(Sender: TObject);
begin
  inherited;
  cds.Close;
  Cds.CreateDataSet;
  dbedUf.SetFocus;
end;

end.

