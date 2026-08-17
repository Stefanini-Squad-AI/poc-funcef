unit FCadPaisMtTeste;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroMT, MontaSelect, Db, DBClient, uCMClientDataSet,
  CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97Ctls, TB97, ExtCtrls, uCtrlPaisTeste,
  uCtrlPadroes, uMensErro, Mask, DBCtrls, dBaseDados, uSistema;

type
  TFrmCadPaisMtTeste = class(TFrmCadastroMT)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    Label6: TLabel;
    DBEdit6: TDBEdit;
    procedure CmeCadastroFind(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure abrequery (const iIdPais: integer);
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
  private
    { Private declarations }
    CtrlPaisTeste: TCtrlPaisTeste;
    procedure MensErroTela(sMsg: string);
  public
    { Public declarations }
  end;

var
  FrmCadPaisMtTeste: TFrmCadPaisMtTeste;

implementation


{$R *.DFM}

procedure TFrmCadPaisMtTeste.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  if MontaSelect.RetornouValor then
     abrequery(StrToInt(MontaSelect.ValoresChave[0]));
end;

procedure TFrmCadPaisMtTeste.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlPaisTeste := TCtrlPaisTeste.Create;

  CtrlPaisTeste.Initialize (dtmBaseDados.dbBaseDados, true, Sistema.ConnectionType,
                       Sistema.ConnectionSide, Sistema.AppRemoteServer, true,
                       MensErroTela);


//  CtrlPaisTeste.InitializeAs(Padroes);
  CtrlPaisTeste.cdsPais := cds;
  abrequery (-1);
end;

procedure TFrmCadPaisMtTeste.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  FreeAndNil(CtrlPaisTeste);
end;

procedure TFrmCadPaisMtTeste.abrequery(const iIdPais: integer);
begin
  Cds.Data := CtrlPaisTeste.ListaPais(iIdPais);
end;

procedure TFrmCadPaisMtTeste.MensErroTela(sMsg: string);
begin
     MsgDlg(sMsg,'Aviso',mtWarning,[mbOK],0);
end;

procedure TFrmCadPaisMtTeste.CmeCadastroApplyInsert(sender: TObject;
  var Accept: Boolean);
begin
  Accept := CtrlPaisTeste.Gravar;

  inherited;

end;

end.
