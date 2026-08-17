unit FCadAtividadeMT;

// -----------------------------------------------------------------------------
//
//      CADASTRO DE ATIVIDADES E SEGMENTOS  ( MT )
//
//      Módulo          :  Comuns Imobiliário
//      Autor           :  Vinícius Meyer Lana
//      Data de Início  :  22/05/2002
//      Data de Término :  22/05/2002
//
// -----------------------------------------------------------------------------

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroGridMTImob, MontaSelect, Db, DBClient, uCMClientDataSet,
  CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97Ctls, TB97, Grids, Wwdbigrd,
  Wwdbgrid, ExtCtrls, Provider, DBTables, Mask, wwdbedit, uCtrlAtividade;

type
  TfrmCadAtividadeMT = class(TfrmCadastroGridMTImob)
    CdsIDATIVIDADE: TFloatField;
    CdsATVDESCRICAO: TStringField;
    Label1: TLabel;
    dbedtDesc: TwwDBEdit;
    procedure FormCreate(Sender: TObject);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroEdit(Sender: TObject);
    procedure CmeCadastroBeforeConfirma(sender: TObject;
      var Accept: Boolean);
  private
    { Private declarations }
    CtrlAtividade : TCtrlAtividade;
    function VerificaPreenchimento : Boolean;
  public
    { Public declarations }

  protected
    procedure FazerRefresh; override;

  end;

var
  frmCadAtividadeMT: TfrmCadAtividadeMT;

implementation

uses dBaseDados, uSistema, uMensErro, uComunsImobiliario, uVerificaPreenchimento;

{$R *.DFM}

{ TfrmCadAtividadeMT }

procedure TfrmCadAtividadeMT.FormCreate(Sender: TObject);
begin
  inherited;
  // Cria e inicializa o CtrlObject do objeto Lojas
  CtrlAtividade := TCtrlAtividade.Create;
  CtrlAtividade.Initialize(DtmBaseDados.DbBaseDados, True, Sistema.ConnectionType,
                        Sistema.ConnectionSide, Sistema.AppRemoteServer, True,
                        ComunsImobiliario.MensErroMT);

  // Associa o Cds do CtrlObject ao Cds local para as alterações locais refletirem
  // no CtrlObject
  CtrlAtividade.CdsAtividade := Cds;

  FazerRefresh;
end;

procedure TfrmCadAtividadeMT.FazerRefresh;
begin
  inherited;
  Cds.Data := CtrlAtividade.LookupAtividade;
end;

procedure TfrmCadAtividadeMT.CmeCadastroInsert(Sender: TObject);
begin
  inherited;
  if dbedtDesc.CanFocus then dbedtDesc.SetFocus;
end;

procedure TfrmCadAtividadeMT.CmeCadastroApplyInsert(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := CtrlAtividade.GravaAtividade;
end;

procedure TfrmCadAtividadeMT.CmeCadastroEdit(Sender: TObject);
begin
  Cds.Data := CtrlAtividade.LookupAtividade( CdsIDATIVIDADE.AsInteger );
  inherited;
  if dbedtDesc.CanFocus then dbedtDesc.SetFocus;
end;

procedure TfrmCadAtividadeMT.CmeCadastroBeforeConfirma(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := VerificaPreenchimento;
end;

function TfrmCadAtividadeMT.VerificaPreenchimento: Boolean;
begin
  Result := False;
  try
     if dbedtDesc.Text = '' then
        raise EValidacao.CreateVal('Informe o Descrição da Atividade',dbedtDesc);
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
