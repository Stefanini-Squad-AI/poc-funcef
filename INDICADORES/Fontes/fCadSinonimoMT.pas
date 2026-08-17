{--------------------------------------------------------------------------------
ALTERAÇÕES / IMPLEMENTAÇÕES ----------------------------------------------------
--------------------------------------------------------------------------------
Padrão      : 5.10.18 em diante...
Pendência   : 27596
Responsável : Daniel Simões
Data        : 14/03/2008
Descrição   : Ajuste do Help Context...
--------------------------------------------------------------------------------
-------------------------------------------------------------------------------}

unit fCadSinonimoMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  fCadastroMtImob, MontaSelect, Db, DBClient, uCMClientDataSet,
  CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97Ctls, TB97, ExtCtrls,
  mIndicador, Mask, DBCtrls, uCmSqlParams, uCtrlIndSinonimo, uCMTypes;

type
  TfrmCadSinonimoMT = class(TfrmCadastroMtImob)
    molIndicador1: TmolIndicador;
    CMSqlParams1: TCMSqlParams;
    CdsIDSINONIMO: TFloatField;
    CdsSINONIMO: TStringField;
    CdsIDINDICADOR: TFloatField;
    Label1: TLabel;
    DBEdtSinonimo: TDBEdit;
    CdsDESCRICAO: TStringField;
    procedure CmeCadastroAfterConfirma(Sender: TObject);
    procedure CmeCadastroBeforeConfirma(sender: TObject;
      var Accept: Boolean);
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure CmeCadastroFind(Sender: TObject);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure molIndicador1btnBuscaIndicadorClick(Sender: TObject);

  private
    CtrlIndSinonimo : TCtrlIndSinonimo;
    function VerificaPreenchimento : Boolean;

  public
    { Public declarations }
  end;

var
  frmCadSinonimoMT: TfrmCadSinonimoMT;

implementation

uses
  dBaseDados, uSistema, uMensErro, uComunsImobiliario, uVerificaPreenchimento;

{$R *.DFM}

procedure TfrmCadSinonimoMT.FormCreate(Sender: TObject);
begin
  inherited;
  // Cria e inicializa o CtrlObject do objeto de LayOut de Importação
  CtrlIndSinonimo := TCtrlIndSinonimo.Create;
  CtrlIndSinonimo.Initialize(DtmBaseDados.DbBaseDados, True, Sistema.ConnectionType,
                           Sistema.ConnectionSide, Sistema.AppRemoteServer, True,
                           ComunsImobiliario.MensErroMT);

  // Associa o Cds do CtrlObject ao Cds local para as alterações locais refletirem
  // no CtrlObject
  CtrlIndSinonimo.CdsIndSinonimo := Cds;
end;

procedure TfrmCadSinonimoMT.CmeCadastroAfterConfirma(Sender: TObject);
begin
  inherited;
  // Recarrega o registro após a edição ( bug do padrão )
  if cmeCadastro.Operacao = opAlterar then
     Cds.Data := CtrlIndSinonimo.LookUpIndSinonimo(CdsIDSINONIMO.AsInteger );
end;

procedure TfrmCadSinonimoMT.CmeCadastroBeforeConfirma(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := VerificaPreenchimento;

  if molIndicador1.iIndicador > 0 then
    cdsIDINDICADOR.AsFloat := molIndicador1.iIndicador;
end;

procedure TfrmCadSinonimoMT.CmeCadastroApplyInsert(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := CtrlIndSinonimo.GravaIndSinonimo;

  if DBEdtSinonimo.CanFocus then DBEdtSinonimo.SetFocus;
end;


function TfrmCadSinonimoMT.VerificaPreenchimento: Boolean;
begin
  Result := False;
  try
     if (molIndicador1.edtIndicador.Text = '') then
       raise EValidacao.CreateVal('Informe o indicador.',molIndicador1.edtIndicador);

     if dbedtSinonimo.Text = '' then
        raise EValidacao.CreateVal('Informe o Sinônimo do Indicador.',dbedtSinonimo);

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


procedure TfrmCadSinonimoMT.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  // carrega o pacote de dados do Cds local com os valores retornados do CtrlObject
  if MontaSelect.RetornouValor then begin
    Cds.Data := CtrlIndSinonimo.LookupIndSinonimo(StrToInt(MontaSelect.ValoresChave[0]));
    molIndicador1.edtIndicador.Text := CdsDESCRICAO.AsString;
    molIndicador1.iIndicador := CdsIDINDICADOR.AsInteger;
  end;
end;

procedure TfrmCadSinonimoMT.CmeCadastroInsert(Sender: TObject);
begin
  inherited;
  molIndicador1.btnBuscaIndicador.SetFocus;
end;

procedure TfrmCadSinonimoMT.molIndicador1btnBuscaIndicadorClick(
  Sender: TObject);
begin
  inherited;
  molIndicador1.btnBuscaIndicadorClick(Sender);
end;

end.
