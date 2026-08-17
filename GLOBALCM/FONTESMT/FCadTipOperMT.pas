{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
unit FCadTipOperMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroMT, MontaSelect, Db, DBClient, uCMClientDataSet, wwdbedit,
  CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97Ctls, TB97, ExtCtrls, Mask,
  uCtrlTipOper
{$IFNDEF VERSAO0505}
  , uCmTypes
{$ENDIF}
;

type
  TfrmCadTipOper = class(TFrmCadastroMT)
    Label1: TLabel;
    Label2: TLabel;
    dbedCodigo: TwwDBEdit;
    dbedDesc: TwwDBEdit;
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
    TipOper: TCtrlTipOper;
    Procedure Seleciona( IdTipOper: String = '' );
  public
    { Public declarations }
  end;

var
  frmCadTipOper: TfrmCadTipOper;

implementation

{$R *.DFM}

Uses uMensErro, dBasedados, uSistema, uMidasUtil;

procedure TfrmCadTipOper.Seleciona( IdTipOper: String );
begin
  Cds.Data := TipOper.ListaTipOper( IdTipOper );
end;

procedure TfrmCadTipOper.FormCreate(Sender: TObject);
begin
  inherited;
  TipOper := TCtrlTipOper.Create;
  TipOper.Initialize( DtmBaseDados.dbBaseDados, True, Sistema.ConnectionType,
                      Sistema.ConnectionSide, Sistema.AppRemoteServer, True );
  TipOper.cds := cds;
  Seleciona( '_'{ivlm} );
end;

procedure TfrmCadTipOper.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  TipOper.Free;
end;

procedure TfrmCadTipOper.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  IF MontaSelect.RetornouValor Then
     Seleciona( MontaSelect.ValoresChave[ 0 ] );
end;

procedure TfrmCadTipOper.CmeCadastroApplyInsert(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := TipOper.Gravar;
end;

procedure TfrmCadTipOper.CmeCadastroApplyEdit(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := TipOper.Gravar;
end;

procedure TfrmCadTipOper.CmeCadastroApplyDelete(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := TipOper.Gravar;
end;

procedure TfrmCadTipOper.CmeCadastroAbortConfirma(sender: TObject;
  OrigemAbortConfirma: TOrigemAbortConfirma);
begin
  inherited;
  MsgDlg( TipOper.MessageInfo, 'Erro', mtError, [ mbOK ], 0 );
end;

procedure TfrmCadTipOper.CmeCadastroInsert(Sender: TObject);
begin
  inherited;
  DbEdCodigo.Enabled := True;
  DbEdCodigo.SetFocus;
end;

procedure TfrmCadTipOper.CmeCadastroEdit(Sender: TObject);
begin
  inherited;
  DbEdCodigo.Enabled := False;
  DbEdDesc.SetFocus;
end;

end.

