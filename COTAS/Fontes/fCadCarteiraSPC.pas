unit fCadCarteiraSPC;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  fCadastroGridMTCotas, MontaSelect, Db, DBClient, uCMClientDataSet,
  CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97Ctls, TB97, Grids, Wwdbigrd,
  Wwdbgrid, ExtCtrls, Mask, wwdbedit, uCtrlCarteiraSPC, dBaseDados, uSistema,
  uMensErro, uMidasUtil, DBTables, Wwquery, Provider,
  uCmSqlParams, uCmtypes, uVerificaPreenchimento, wwdblook;

type
  TfrmCadCarteiraSPC = class(TFrmCadastroGridMTCotas)
    Label1: TLabel;
    DBEdDescricao: TwwDBEdit;
    wwDBLookupCombo1: TwwDBLookupCombo;
    Label2: TLabel;
    Label3: TLabel;
    wwDBEdit1: TwwDBEdit;
    CMSqlParams1: TCMSqlParams;
    CdsIDCARTEIRASPC: TFloatField;
    CdsDESCARTEIRASPC: TStringField;
    CdsCODTIPOCART: TStringField;
    CdsCODSEGMENTO: TFloatField;
    CdsDESCRICAO: TStringField;
    cdsSegmento: TCMClientDataSet;
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
    procedure dbGrdTitleButtonClick(Sender: TObject; AFieldName: String);
    procedure CmeCadastroBeforeConfirma(sender: TObject;
      var Accept: Boolean);

  protected
    procedure FazerRefresh; override;

  private
    { Private declarations }
    CtrlCarteiraSPC : TCtrlCarteiraSPC;
    procedure MensErroMt( sMsgInfo: string );
    function VerificaPreenchimento : Boolean;

  public
    { Public declarations }
  end;

var
  frmCadCarteiraSPC: TfrmCadCarteiraSPC;

implementation

{$R *.DFM}

{ TfrmCastroPerfil }

procedure TfrmCadCarteiraSPC.FazerRefresh;
begin
  inherited;
  Cds.Data := CtrlCarteiraSPC.ListaCarteiraSPC;
end;

procedure TfrmCadCarteiraSPC.CmeCadastroApplyInsert(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := CtrlCarteiraSPC.GravaCarteiraSPC;
end;

procedure TfrmCadCarteiraSPC.FormCreate(Sender: TObject);
begin
  CtrlCarteiraSPC := TCtrlCarteiraSPC.Create;
  CtrlCarteiraSPC.Initialize (dtmBaseDados.dbBaseDados, true, Sistema.ConnectionType,
                       Sistema.ConnectionSide, Sistema.AppRemoteServer, true,
                       MensErroMT);

  CtrlCarteiraSPC.CdsCarteiraSPC := Cds;

  cdsSegmento.Data := CtrlCarteiraSPC.ListaSegmentoSPC;

  FazerRefresh ;
  inherited;
end;

procedure TfrmCadCarteiraSPC.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  FreeAndNil(CtrlCarteiraSPC);
end;

procedure TfrmCadCarteiraSPC.MensErroMt(sMsgInfo: string);
begin
  MsgDlg (sMsgInfo, Sistema.NomeAplicativo, mtWarning, [mbok], 0);
end;

procedure TfrmCadCarteiraSPC.CmeCadastroApplyDelete(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := CtrlCarteiraSPC.GravaCarteiraSPC;
end;

procedure TfrmCadCarteiraSPC.dbGrdTitleButtonClick(Sender: TObject;
  AFieldName: String);
begin
  inherited;
  Cds.IndexFieldNames := AFieldName;
end;

function TfrmCadCarteiraSPC.VerificaPreenchimento: Boolean;
var
iIdCarteira : integer;

begin
  try
    if CmeCadastro.Operacao = opInserir then iIdCarteira := -1 else
      iIdCarteira := Cds.FieldByName('IDCARTEIRASPC').AsInteger;

    if CtrlCarteiraSPC.VerificaCarteiraCadastrada(DBEdDescricao.Text,Cds.FieldByName('CODSEGMENTO').AsInteger,iIdCarteira) then
      raise EValidacao.CreateVal('Já existe uma carteira cadastrada com esta descrição!', DBEdDescricao);
 except
   on ev : EValidacao do begin
     if ev.Show then MsgDlg(ev.message, 'Aviso', mtWarning, [mbOk], 0);
     Repaint;
     if ev.Control.CanFocus then ev.Control.SetFocus;
     Exit;
   end;
 end;
 Result := True;



end;

procedure TfrmCadCarteiraSPC.CmeCadastroBeforeConfirma(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := VerificaPreenchimento;
end;

end.
