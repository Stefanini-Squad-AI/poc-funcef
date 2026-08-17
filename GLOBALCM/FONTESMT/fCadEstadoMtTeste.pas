unit fCadEstadoMtTeste;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroMT, MontaSelect, Db, DBClient, uCMClientDataSet,
  CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97Ctls, TB97, ExtCtrls, uCtrlPaisTeste,
  uCtrlEstadoTeste, uCtrlPadroes, uMensErro, Mask, DBCtrls, dBaseDados, uSistema,
  uCmSqlParams, wwdblook, CMDBLookupCombo;

type
  TfrmCadEstadoMtTeste = class(TFrmCadastroMT)
    cdsPais: TCMClientDataSet;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    wwDBLookupCombo1: TwwDBLookupCombo;
    procedure FormCreate(Sender: TObject);
    procedure CmeCadastroFind(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
  private
    { Private declarations }
    CtrlPaisTeste : TCtrlPaisTeste;
    CtrlEstadoTeste: TCtrlEstadoTeste;
    procedure AbreQuery(const idEstado: integer);
    procedure MensErroTela(sMsg: string);
  public
    { Public declarations }
  end;

var
  frmCadEstadoMtTeste: TfrmCadEstadoMtTeste;

implementation

{$R *.DFM}

{ TfrmCadEstadoMtTeste }

procedure TfrmCadEstadoMtTeste.MensErroTela(sMsg: string);
begin
  MsgDlg(sMsg, 'Aviso', mtWarning, [mbOK], 0)
end;

procedure TfrmCadEstadoMtTeste.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlPaisTeste := TCtrlPaisTeste.Create;
  CtrlEstadoTeste := TCtrlEstadoTeste.Create;

  CtrlEstadoTeste.Initialize (dtmBaseDados.dbBaseDados, true, Sistema.ConnectionType,
                       Sistema.ConnectionSide, Sistema.AppRemoteServer, true,
                       MensErroTela);

  CtrlEstadoTeste.cds := cds;

  CtrlPaisTeste.Initialize (dtmBaseDados.dbBaseDados, true, Sistema.ConnectionType,
                       Sistema.ConnectionSide, Sistema.AppRemoteServer, true,
                       MensErroTela);

   cdsPais.Data := CtrlPaisTeste.ListaPais(-1);
   AbreQuery(-1);
end;

procedure TfrmCadEstadoMtTeste.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  if MontaSelect.RetornouValor then
     AbreQuery(StrToInt(MontaSelect.ValoresChave[0]));
end;

procedure TfrmCadEstadoMtTeste.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  FreeAndNil(CtrlPaisTeste);
  FreeAndNil(CtrlEstadoTeste)
end;

procedure TfrmCadEstadoMtTeste.CmeCadastroApplyInsert(sender: TObject;
  var Accept: Boolean);
begin
  Accept := CtrlEstadoTeste.Gravar;
  inherited;
end;

procedure TfrmCadEstadoMtTeste.AbreQuery(const IdEstado: integer);
begin
   cds.Data := CtrlEstadoTeste.ListaEstadoTeste(IdEstado);
end;

end.
