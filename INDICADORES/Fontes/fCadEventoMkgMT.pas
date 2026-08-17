{-------------------------------------------------------------------------------
--------------------------------------------------------------------------------

     CADASTRO DE EVENTOS DE MARKETING  ( MT )

     Módulo          :  Indicadores
     Autor           :  Vinícius Meyer Lana
     Data de Início  :  21/05/2002
     Data de Término :  21/05/2002

--------------------------------------------------------------------------------
ALTERAÇÕES / IMPLEMENTAÇÕES ----------------------------------------------------
--------------------------------------------------------------------------------
Padrão      : 5.10.18 em diante...
Pendência   : 27596
Responsável : Daniel Simões
Data        : 14/03/2008
Descrição   : Ajuste do Help Context...
--------------------------------------------------------------------------------
-------------------------------------------------------------------------------}

unit fCadEventoMkgMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroGridMTImob, MontaSelect, Db, DBClient, uCMClientDataSet,
  CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97Ctls, TB97, Grids, Wwdbigrd,
  Wwdbgrid, ExtCtrls, Provider, DBTables, Mask, wwdbedit, uCtrlEventoMkg;

type
  TfrmCadEventoMkgMT = class(TfrmCadastroGridMTImob)
    CdsIDEVENTO: TFloatField;
    CdsDESCRICAO: TStringField;
    Label1: TLabel;
    dbedtDescricao: TwwDBEdit;
    procedure FormCreate(Sender: TObject);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure CmeCadastroEdit(Sender: TObject);
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroBeforeConfirma(sender: TObject;
      var Accept: Boolean);
  private
    { Private declarations }
    CtrlEventoMkg : TCtrlEventoMkg;
    function VerificaPreenchimento : Boolean;
  public
    { Public declarations }

  protected
    procedure FazerRefresh; override;

  end;

var
  frmCadEventoMkgMT: TfrmCadEventoMkgMT;

implementation

uses dBaseDados, uSistema, uMensErro, uComunsImobiliario, uVerificaPreenchimento;

{$R *.DFM}

{ TfrmCadEventoMkgMT }

procedure TfrmCadEventoMkgMT.FormCreate(Sender: TObject);
begin
  inherited;
  // Cria e inicializa o CtrlObject do objeto Tipo de Indicadores
  CtrlEventoMkg := TCtrlEventoMkg.Create;
  CtrlEventoMkg.Initialize(DtmBaseDados.DbBaseDados, True, Sistema.ConnectionType,
                           Sistema.ConnectionSide, Sistema.AppRemoteServer, True,
                           ComunsImobiliario.MensErroMT);

  // Associa o Cds do CtrlObject ao Cds local para as alterações locais refletirem
  // no CtrlObject
  CtrlEventoMkg.CdsEventoMkg := Cds;

  FazerRefresh;
end;

procedure TfrmCadEventoMkgMT.FazerRefresh;
begin
  inherited;
  Cds.Data := CtrlEventoMkg.LookupEventoMkg;
end;


procedure TfrmCadEventoMkgMT.CmeCadastroInsert(Sender: TObject);
begin
  inherited;
  if dbedtDescricao.CanFocus then dbedtDescricao.SetFocus;
end;

procedure TfrmCadEventoMkgMT.CmeCadastroEdit(Sender: TObject);
begin
  Cds.Data := CtrlEventoMkg.LookupEventoMkg( CdsIDEVENTO.AsInteger );
  inherited;
  if dbedtDescricao.CanFocus then dbedtDescricao.SetFocus;
end;

procedure TfrmCadEventoMkgMT.CmeCadastroApplyInsert(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := CtrlEventoMkg.GravaEventoMkg;
end;

procedure TfrmCadEventoMkgMT.CmeCadastroBeforeConfirma(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := VerificaPreenchimento;
end;

function TfrmCadEventoMkgMT.VerificaPreenchimento: Boolean;
begin
  Result := False;
  try
     if dbedtDescricao.Text = '' then
        raise EValidacao.CreateVal('Informe o Descrição do Evento',dbedtDescricao);
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

end.
