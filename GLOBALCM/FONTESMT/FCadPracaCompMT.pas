unit FCadPracaCompMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroMT, MontaSelect, Db, DBClient, uCMClientDataSet, wwdbedit, 
  CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97Ctls, TB97, ExtCtrls, Mask,
  uCtrlPracaComp
{$IFNDEF VERSAO0505}
  , uCmTypes
{$ENDIF}
;

type
  TFrmCadPracaComp = class(TFrmCadastroMT)
    DbEdNome: TwwDBEdit;
    Label1: TLabel;
    DbEdCodigo: TwwDBEdit;
    Label4: TLabel;
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
  public
    { Public declarations }
    PracaComp: TCtrlPracaComp;
    procedure Seleciona( IdPracaComp: Double = 0 );
  end;

var
  FrmCadPracaComp: TFrmCadPracaComp;

implementation

{$R *.DFM}

Uses uMensErro, dBasedados, uSistema, uMidasUtil;

procedure TFrmCadPracaComp.Seleciona( IdPracaComp: Double );
begin
  cds.Data := PracaComp.ListaPracaComp( IdPracaComp );
end;

procedure TFrmCadPracaComp.FormCreate(Sender: TObject);
begin
  inherited;
  PracaComp := TCtrlPracaComp.Create;
  PracaComp.Initialize( DtmBaseDados.dbBaseDados, True, Sistema.ConnectionType,
                        Sistema.ConnectionSide, Sistema.AppRemoteServer, True );
  PracaComp.cds := cds;
  Seleciona( -1 );
end;

procedure TFrmCadPracaComp.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  PracaComp.Free;
end;

procedure TFrmCadPracaComp.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  If MontaSelect.RetornouValor Then
     Seleciona( StrToFloat( MontaSelect.ValoresChave[ 0 ] ) );
end;

procedure TFrmCadPracaComp.CmeCadastroApplyInsert(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := PracaComp.Gravar;
end;

procedure TFrmCadPracaComp.CmeCadastroApplyEdit(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := PracaComp.Gravar;
end;

procedure TFrmCadPracaComp.CmeCadastroApplyDelete(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := PracaComp.Gravar;
end;

procedure TFrmCadPracaComp.CmeCadastroAbortConfirma(sender: TObject;
  OrigemAbortConfirma: TOrigemAbortConfirma);
begin
  inherited;
  MsgDlg( PracaComp.MessageInfo, 'Erro', mtError, [ mbOK ], 0 );
end;

procedure TFrmCadPracaComp.CmeCadastroEdit(Sender: TObject);
begin
  inherited;
  DbEdCodigo.SetFocus;
end;

procedure TFrmCadPracaComp.CmeCadastroInsert(Sender: TObject);
begin
  inherited;
  DbEdCodigo.SetFocus;
end;

end.
