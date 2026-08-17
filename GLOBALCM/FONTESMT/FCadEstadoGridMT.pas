unit FCadEstadoGridMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroGridMT, MontaSelect, Db, DBClient, uCMClientDataSet,
  CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97Ctls, TB97, Grids, Wwdbigrd,
  Wwdbgrid, ExtCtrls, uCtrlEstadoTeste, wwdblook, Mask, DBCtrls, DBaseDados,
  uSistema,uMensErro, uCtrlPaisTeste;

type
  TfrmCadEstado = class(TFrmCadastroGridMT)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    wwDBLookupCombo1: TwwDBLookupCombo;
    CdsPais: TCMClientDataSet;
    DBEdit2: TDBEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroFind(Sender: TObject);
    procedure CmeCadastroConfirma(Sender: TObject);
    procedure CmeCadastroCancel(Sender: TObject);
    procedure sbtnProcurarClick(Sender: TObject);
  private
    { Private declarations }
    CtrlEstadoTeste: TCtrlEstadoTeste;
    CtrlPaisTeste: TCtrlPaisTeste;
    procedure AbreQuery(const idEstado: integer);
    procedure MensErroTela(sMsg: string);
  public
    { Public declarations }
  end;

var
  frmCadEstado: TfrmCadEstado;

implementation

{$R *.DFM}

procedure TfrmCadEstado.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlEstadoTeste := TCtrlEstadoTeste.Create;
  CtrlPaisTeste := TCtrlPaisTeste.Create;
  CtrlEstadoTeste.Initialize( DtmBaseDados.dbBaseDados, True, Sistema.ConnectionType,
                    Sistema.ConnectionSide, Sistema.AppRemoteServer, True );
  CtrlPaisTeste.InitializeAs(CtrlEstadoTeste);
  CtrlEstadoTeste.cds := cds;

  CtrlPaisTeste.cdsPais := cdsPais;
  cdsPais.Data := CtrlPaisTeste.ListaPais;

  AbreQuery(-1)
end;

procedure TfrmCadEstado.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FreeAndNil(CtrlEstadoTeste);
  FreeAndNil(CtrlPaisTeste);
  inherited;
end;

procedure TfrmCadEstado.AbreQuery(const idEstado: integer);
begin
  cds.Data := CtrlEstadoTeste.ListaEstadoTeste(idEstado);
end;

procedure TfrmCadEstado.MensErroTela(sMsg: string);
begin
  MsgDlg(sMsg, 'Aviso', mtWarning, [mbOK], 0)
end;

procedure TfrmCadEstado.CmeCadastroApplyInsert(sender: TObject;
  var Accept: Boolean);
begin
   Accept := CtrlEstadoTeste.Gravar;
   inherited;
end;

procedure TfrmCadEstado.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  if MontaSelect.RetornouValor then
     AbreQuery(StrToInt(MontaSelect.ValoresChave[0]));
end;

procedure TfrmCadEstado.CmeCadastroConfirma(Sender: TObject);
begin
  inherited;
  cmeCadastroFind(Sender)
end;

procedure TfrmCadEstado.CmeCadastroCancel(Sender: TObject);
begin
  inherited;
  AbreQuery(-1);
end;

procedure TfrmCadEstado.sbtnProcurarClick(Sender: TObject);
begin
  inherited;
  if (not MontaSelect.RetornouValor) then
     AbreQuery(-1);

end;

end.
