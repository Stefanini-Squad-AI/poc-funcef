unit fCadGrpApuracaoMT;

// -----------------------------------------------------------------------------
//
//      CADASTRO DE GRUPO DE APURAÇÃO  ( MT )
//
//      Módulo          :  Indicadores
//      Autor           :  Vinícius Meyer Lana
//      Data de Início  :  20/05/2002
//      Data de Término :  20/05/2002
//
// -----------------------------------------------------------------------------


interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroMTImob, StdCtrls, Mask, wwdbedit, ExtCtrls, DBCtrls, MontaSelect,
  Db, DBClient, uCMClientDataSet, CmEventosCadastro, ImgList, Wwdatsrc,
  IvDictio, IvMulti, IvEMulti, MAHlpBtn, Buttons, TB97Tlbr, TB97Ctls, TB97,
  uCMTypes, uCtrlGrpApuracao, FCadastroMT;

type
  TfrmCadGrpApuracaoMT = class(TFrmCadastroMTImob)
    Label1: TLabel;
    dbrgTipoGrupo: TDBRadioGroup;
    dbedtDescricao: TwwDBEdit;
    CdsIDGRPAPURACAO: TFloatField;
    CdsDESCRICAO: TStringField;
    CdsTIPOGRUPO: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure CmeCadastroFind(Sender: TObject);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure CmeCadastroEdit(Sender: TObject);
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroBeforeConfirma(sender: TObject;
      var Accept: Boolean);
    procedure CmeCadastroAfterConfirma(Sender: TObject);
  private
    { Private declarations }
    CtrlGrpApuracao : TCtrlGrpApuracao;
    function VerificaPreenchimento : Boolean;
  public
    { Public declarations }
  end;

var
  frmCadGrpApuracaoMT: TfrmCadGrpApuracaoMT;

implementation

uses dBaseDados, uSistema, uMensErro, uComunsImobiliario, uVerificaPreenchimento;

{$R *.DFM}

procedure TfrmCadGrpApuracaoMT.FormCreate(Sender: TObject);
begin
  inherited;
  // Cria e inicializa o CtrlObject do objeto Grupo de Apuração
  CtrlGrpApuracao := TCtrlGrpApuracao.Create;
  CtrlGrpApuracao.Initialize(DtmBaseDados.DbBaseDados, True, Sistema.ConnectionType,
                             Sistema.ConnectionSide, Sistema.AppRemoteServer, True,
                             ComunsImobiliario.MensErroMT);

  // Associa o Cds do CtrlObject ao Cds local para as alterações locais refletirem
  // no CtrlObject
  CtrlGrpApuracao.CdsGrpApuracao := Cds;
end;

procedure TfrmCadGrpApuracaoMT.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  // carrega o pacote de dados do Cds local com os valores retornados do CtrlObject
  if MontaSelect.RetornouValor then
    Cds.Data := CtrlGrpApuracao.LookUpGrpApuracao( StrToInt(MontaSelect.ValoresChave[0]) );
end;

procedure TfrmCadGrpApuracaoMT.CmeCadastroInsert(Sender: TObject);
begin
  inherited;
  dbrgTipoGrupo.ItemIndex := 0;
  dbedtDescricao.SetFocus;
end;

procedure TfrmCadGrpApuracaoMT.CmeCadastroEdit(Sender: TObject);
begin
  inherited;
  dbedtDescricao.SetFocus;
end;

procedure TfrmCadGrpApuracaoMT.CmeCadastroApplyInsert(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := CtrlGrpApuracao.GravaGrpApuracao;
  if dbedtDescricao.CanFocus then dbedtDescricao.SetFocus;
end;

procedure TfrmCadGrpApuracaoMT.CmeCadastroBeforeConfirma(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := VerificaPreenchimento;
end;

function TfrmCadGrpApuracaoMT.VerificaPreenchimento: Boolean;
begin
  Result := False;
  try
     if dbedtDescricao.Text = '' then
        raise EValidacao.CreateVal('Informe o Descrição do Grupo de Apuração',dbedtDescricao);
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

procedure TfrmCadGrpApuracaoMT.CmeCadastroAfterConfirma(Sender: TObject);
begin
  inherited;
  // Recarrega o registro após a edição ( bug do padrão )
  if cmeCadastro.Operacao = opAlterar then
     Cds.Data := CtrlGrpApuracao.LookUpGrpApuracao( CdsIDGRPAPURACAO.AsInteger );
end;

end.
