unit fCadPerfil;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  fCadastroGridMTCotas, MontaSelect, Db, DBClient, uCMClientDataSet,
  CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97Ctls, TB97, Grids, Wwdbigrd,
  Wwdbgrid, ExtCtrls, Mask, wwdbedit, uCtrlCota, dBaseDados, uSistema,
  uMensErro, uMidasUtil, DBTables, Wwquery, Provider;

type
  TfrmCadPerfil = class(TFrmCadastroGridMTCotas)
    Label1: TLabel;
    DBEdDescricao: TwwDBEdit;
    CdsIDCOTAPERFIL: TFloatField;
    CdsDESCRICAO: TStringField;
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure CmeCadastroEdit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);

  protected
    procedure FazerRefresh; override;

  private
    { Private declarations }
    CtrlCota : TCtrlCota;
    procedure MensErroMT(sMsgInfo: string);

  public
    { Public declarations }
  end;

var
  frmCadPerfil: TfrmCadPerfil;

implementation

{$R *.DFM}

{ TfrmCastroPerfil }

procedure TfrmCadPerfil.FazerRefresh;
begin
  inherited;
  Cds.Data := CtrlCota.ListaCotaPerfil;
end;



procedure TfrmCadPerfil.CmeCadastroApplyInsert(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := CtrlCota.GravaCotaPerfil;
end;



procedure TfrmCadPerfil.FormCreate(Sender: TObject);
begin
  CtrlCota := TCtrlCota.Create;
  CtrlCota.Initialize (dtmBaseDados.dbBaseDados, true, Sistema.ConnectionType,
                       Sistema.ConnectionSide, Sistema.AppRemoteServer, true,
                       MensErroMT);

  CtrlCota.CdsCotaPerfil := Cds;

  FazerRefresh ;
  inherited;
end;



procedure TfrmCadPerfil.CmeCadastroEdit(Sender: TObject);
begin
  Cds.Data := CtrlCota.ListaCotaPerfil(CdsIDCOTAPERFIL.AsInteger);
  inherited;
end;



procedure TfrmCadPerfil.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  FreeAndNil(CtrlCota);
end;



procedure TfrmCadPerfil.MensErroMT(sMsgInfo: string);
begin
 //forma a mensagem de erro
  MsgDlg(sMsgInfo, Sistema.NomeAplicativo, mtWarning,[mbOk],0);
end;

end.
