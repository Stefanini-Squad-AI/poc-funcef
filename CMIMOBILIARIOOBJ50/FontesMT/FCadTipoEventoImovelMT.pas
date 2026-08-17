{-------------------------------------------------------------------------------
--------------------------------------------------------------------------------

                           CM Soluções Informática

                Todos os Direitos Reservados
                Gerada pelo "CM Bussines Object Builder"

       Analista Responsável: Gustavo Mendes
       Atualizado Em: 09/11/2007
       Pendência: 26794

--------------------------------------------------------------------------------
ALTERAÇÕES / IMPLEMENTAÇÕES ----------------------------------------------------
--------------------------------------------------------------------------------
Pendência   : 27394
Responsável : Daniel Simões
Data        : 14/02/2008
Descrição   : Alteração/Implementação do número do Help Context...
--------------------------------------------------------------------------------
-------------------------------------------------------------------------------}

unit FCadTipoEventoImovelMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroGridMTImob, MontaSelect, Db, DBClient, uCMClientDataSet,
  CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97Ctls, TB97, Grids, Wwdbigrd,
  Wwdbgrid, ExtCtrls, Mask, wwdbedit, Wwdotdot, Wwdbcomb, DBCtrls,
  uCmSqlParams, uCtrlTipoEventoImovel;

type
  TfrmCadTipoEventoImovelMT = class(TfrmCadastroGridMTImob)
    Label52: TLabel;
    DBedtDescTpoEvento: TDBEdit;
    Label1: TLabel;
    dbcbTpoProcesso: TwwDBComboBox;
    DBchkFlgRAD: TDBCheckBox;
    CMSqlParams1: TCMSqlParams;
    CdsDESCRICAO: TStringField;
    CdsFLGRAD: TFloatField;
    CdsDESCTIPOINTERNO: TStringField;
    CdsFLGTIPOEVENTO: TStringField;
    CdsIDTIPOEVENTOIMOB: TFloatField;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroBeforeConfirma(sender: TObject;
      var Accept: Boolean);
    procedure CmeCadastroInsert(Sender: TObject);
  private
    CtrlTipoEventoImovel : TCtrlTipoEventoImovel;
    F_CdsTipoEventoImob: TCMClientDataSet;

    function VerificaDadosGravacao: Boolean;
    { Private declarations }
  protected
    procedure FazerRefresh; override;
  public
    bCadastroImovel : Boolean;  // indica se o form foi chamado pelo cadastro de imóvel
    sFlgTipoEvento  : String;   // Carrega o tipo de flag do evento ( pelo cadastro é VM )
    { Public declarations }
  end;

var
  frmCadTipoEventoImovelMT: TfrmCadTipoEventoImovelMT;

implementation

uses dBaseDados, uMensErro, uComunsImobiliario, uVerificaPreenchimento,
     uSistema,   uModuloImobiliario;

{$R *.DFM}

procedure TfrmCadTipoEventoImovelMT.FormCreate(Sender: TObject);
begin
  inherited;
  // Cria e inicializa o CtrlObject do objeto Lojas
  CtrlTipoEventoImovel := TCtrlTipoEventoImovel.Create;
  CtrlTipoEventoImovel.Initialize(dtmBaseDados.dbBaseDados, true, Sistema.ConnectionType,
                            Sistema.ConnectionSide, Sistema.AppRemoteServer, true,
                            ComunsImobiliario.MensErroMT);

  // Associa o Cds do CtrlObject ao Cds local para as alterações locais refletirem
  // no CtrlObject
  CtrlTipoEventoImovel.CdsTipoEventoImovel := Cds;

  // Carrega default da origem de abertura da tela
  bCadastroImovel := False;

  F_CdsTipoEventoImob := TCMClientDataSet.Create(nil);

  // Abre a grid vazia
  FazerRefresh;

end;

procedure TfrmCadTipoEventoImovelMT.FormDestroy(Sender: TObject);
begin
  FreeAndNil(CtrlTipoEventoImovel);
  inherited;
end;

procedure TfrmCadTipoEventoImovelMT.CmeCadastroApplyInsert(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := CtrlTipoEventoImovel.GravaTipoEventoImovel;
end;

procedure TfrmCadTipoEventoImovelMT.FazerRefresh;
begin
  Cds.Data := CtrlTipoEventoImovel.LookupTipoEventoImovel;

  //Carrega todos os dados da tabela em um ClientDataSet.
  F_CdsTipoEventoImob.Data := cds.Data;

  inherited;
end;

function TfrmCadTipoEventoImovelMT.VerificaDadosGravacao: Boolean;
begin
  Result := True;
  F_CdsTipoEventoImob.First;

  while not F_CdsTipoEventoImob.Eof do
  begin
    if ( (dbcbTpoProcesso.Value <> 'US') and
         (dbcbTpoProcesso.Value = F_CdsTipoEventoImob.FieldByName('FLGTIPOEVENTO').AsString) and
         (cds.FieldByName('IDTIPOEVENTOIMOB').AsInteger <> F_CdsTipoEventoImob.FieldByName('IDTIPOEVENTOIMOB').AsInteger) ) then
    begin
       Result := False;
       Exit;
    end;
    F_CdsTipoEventoImob.Next;
  end;
end;


procedure TfrmCadTipoEventoImovelMT.CmeCadastroBeforeConfirma(
  sender: TObject; var Accept: Boolean);
begin
   inherited;
   try
      Accept := True;
      if DBedtDescTpoEvento.Text = '' then
         raise EValidacao.CreateVal('Informe a descrição do evento', DBedtDescTpoEvento);

      if dbcbTpoProcesso.Text = '' then
         raise EValidacao.CreateVal('Informe o tipo de processo', dbcbTpoProcesso);

      if not VerificaDadosGravacao then
         raise EValidacao.CreateVal('Já existe tipo de evento definido!', dbcbTpoProcesso);

   except
      on ev : EValidacao do begin
         if ev.Show then MsgDlg(ev.message, 'Aviso', mtWarning, [mbOk], 0);
         Repaint;
         if ev.Control.CanFocus then ev.Control.SetFocus;
         Accept := False;
      end;
   end;

end;

procedure TfrmCadTipoEventoImovelMT.CmeCadastroInsert(Sender: TObject);
begin
  inherited;
  cds.FieldByName('FLGRAD').AsInteger := 0;
end;

end.
