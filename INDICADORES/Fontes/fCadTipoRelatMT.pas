unit fCadTipoRelatMT;

// -----------------------------------------------------------------------------
//
//      CADASTRO DE TIPO DE RELATÓRO  ( MT )
//
//      Módulo          :  Indicadores
//      Autor           :  Vinícius Meyer Lana
//      Data de Início  :  13/05/2002
//      Data de Término :  15/05/2002
//
// -----------------------------------------------------------------------------

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroGridMTImob, MontaSelect, Db, DBClient, uCMClientDataSet,
  CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97Ctls, TB97, Grids, Wwdbigrd,
  Wwdbgrid, ExtCtrls, Provider, DBTables, Mask, wwdbedit, uCtrlTipoIndicador;

type
  TfrmCadTipoRelatMT = class(TfrmCadastroGridMTImob)
    CdsIDTIPO: TFloatField;
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
    CtrlTipoIndicador : TCtrlTipoIndicador;
    function VerificaPreenchimento : boolean;
  public
    { Public declarations }

  protected
    procedure FazerRefresh; override;
    
  end;

var
  frmCadTipoRelatMT: TfrmCadTipoRelatMT;

implementation

uses dBaseDados, uSistema, uMensErro, uComunsImobiliario, uVerificaPreenchimento;

{$R *.DFM}

procedure TfrmCadTipoRelatMT.FormCreate(Sender: TObject);
begin
  inherited;
  // Cria e inicializa o CtrlObject do objeto Tipo de Indicadores
  CtrlTipoIndicador := TCtrlTipoIndicador.Create;
  CtrlTipoIndicador.Initialize(DtmBaseDados.DbBaseDados, True, Sistema.ConnectionType,
                               Sistema.ConnectionSide, Sistema.AppRemoteServer, True,
                               ComunsImobiliario.MensErroMT);

  // Associa o Cds do CtrlObject ao Cds local para as alterações locais refletirem
  // no CtrlObject
  CtrlTipoIndicador.CdsTipoIndicador := Cds;

  FazerRefresh;
end;

procedure TfrmCadTipoRelatMT.FazerRefresh;
begin
  inherited;
  Cds.Data := CtrlTipoIndicador.LookupTipoIndicador;
end;

procedure TfrmCadTipoRelatMT.CmeCadastroInsert(Sender: TObject);
begin
  inherited;
  if dbedtDescricao.CanFocus then dbedtDescricao.SetFocus;
end;

procedure TfrmCadTipoRelatMT.CmeCadastroEdit(Sender: TObject);
begin
  Cds.Data := CtrlTipoIndicador.LookupTipoIndicador( CdsIDTIPO.AsInteger );
  inherited;
  if dbedtDescricao.CanFocus then dbedtDescricao.SetFocus;
end;

procedure TfrmCadTipoRelatMT.CmeCadastroApplyInsert(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := CtrlTipoIndicador.GravaTipoIndicador;
end;

procedure TfrmCadTipoRelatMT.CmeCadastroBeforeConfirma(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := VerificaPreenchimento;
end;

function TfrmCadTipoRelatMT.VerificaPreenchimento: boolean;
begin
  Result := False;
  try
     if dbedtDescricao.Text = '' then
        raise EValidacao.CreateVal('Informe a Descrição do Relatório',dbedtDescricao);
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
