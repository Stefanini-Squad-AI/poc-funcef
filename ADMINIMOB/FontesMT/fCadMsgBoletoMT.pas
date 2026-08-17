{-------------------------------------------------------------------------------
--------------------------------------------------------------------------------

                 CADASTRO DE MENSAGENS DE BOLETO  ( MT )

      Módulo          :  AdminImob
      Autor           :  Vinícius Meyer Lana
      Data de Início  :  18/10/2002
      Data de Término :  18/10/2002

--------------------------------------------------------------------------------
ALTERAÇÕES / IMPLEMENTAÇÕES ----------------------------------------------------
--------------------------------------------------------------------------------
Pendência   : 27394
Responsável : Daniel Simões
Data        : 14/02/2008
Descrição   : Alteração/Implementação do número do Help Context...
--------------------------------------------------------------------------------
Pendência   : 25166
Responsável : Gustavo Mendes
Data        :
Descrição   : Adicionar a Tag <imovel>, na mensagem do boleto. Essa opção trará
              concatenado descrição dos imóveis para um contrato.
--------------------------------------------------------------------------------
-------------------------------------------------------------------------------}

unit fCadMsgBoletoMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroGridMTImob, MontaSelect, Db, DBClient, uCMClientDataSet,
  CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97Ctls, TB97, Grids, Wwdbigrd,
  Wwdbgrid, ExtCtrls, Mask, DBCtrls, uCtrlMsgBoleto, Provider, DBTables,
  Wwquery;

type
  TfrmCadMsgBoletoMT = class(TfrmCadastroGridMTImob)
    Label1: TLabel;
    Bevel1: TBevel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Bevel3: TBevel;
    Label23: TLabel;
    Label24: TLabel;
    Label49: TLabel;
    Label25: TLabel;
    Label11: TLabel;
    Label27: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    dbedDescricao: TDBEdit;
    DBedtLinha1: TDBEdit;
    DBedtLinha2: TDBEdit;
    DBedtLinha3: TDBEdit;
    DBedtLinha4: TDBEdit;
    DBedtLinha5: TDBEdit;
    DBedtLinha6: TDBEdit;
    DBedtLinha7: TDBEdit;
    DBedtLinha8: TDBEdit;
    DBedtLinha9: TDBEdit;
    CdsIDMSGBOLETO: TFloatField;
    CdsMSGDESCRICAO: TStringField;
    CdsTEXTOLINHA_1: TStringField;
    CdsTEXTOLINHA_2: TStringField;
    CdsTEXTOLINHA_3: TStringField;
    CdsTEXTOLINHA_4: TStringField;
    CdsTEXTOLINHA_5: TStringField;
    CdsTEXTOLINHA_6: TStringField;
    CdsTEXTOLINHA_7: TStringField;
    CdsTEXTOLINHA_8: TStringField;
    CdsTEXTOLINHA_9: TStringField;
    CdsIDMODULO: TFloatField;
    Label14: TLabel;
    Label15: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroEdit(Sender: TObject);
    procedure CmeCadastroBeforeConfirma(sender: TObject;
      var Accept: Boolean);
  private
    { Private declarations }
    CtrlMsgBoleto : TCtrlMsgBoleto;
    function VerificaPreenchimento : Boolean;
  public
    { Public declarations }
  protected
    procedure FazerRefresh; override;
  end;

var
  frmCadMsgBoletoMT: TfrmCadMsgBoletoMT;

implementation

uses dBaseDados, uSistema, uMensErro, UComunsImobiliario, uVerificaPreenchimento;

{$R *.DFM}

{ TfrmCadMsgBoletoMT }

procedure TfrmCadMsgBoletoMT.FormCreate(Sender: TObject);
begin
  inherited;
  // Cria e inicializa o CtrlObject do objeto Lojas
  CtrlMsgBoleto := TCtrlMsgBoleto.Create;
  CtrlMsgBoleto.Initialize(DtmBaseDados.DbBaseDados, True, Sistema.ConnectionType,
                           Sistema.ConnectionSide, Sistema.AppRemoteServer, True,
                           ComunsImobiliario.MensErroMT);

  // Associa o Cds do CtrlObject ao Cds local para as alterações locais refletirem
  // no CtrlObject
  CtrlMsgBoleto.CdsMsgBoleto := Cds;

  FazerRefresh;
end;


procedure TfrmCadMsgBoletoMT.FazerRefresh;
begin
  inherited;
  Cds.Data := CtrlMsgBoleto.LookupMsgBoletoComLinhas(-1, -1, Sistema.IdModulo);
end;


procedure TfrmCadMsgBoletoMT.CmeCadastroInsert(Sender: TObject);
begin
  inherited;
  CdsIDMODULO.AsInteger := Sistema.IdModulo;
  if dbedDescricao.CanFocus then dbedDescricao.SetFocus;
end;

procedure TfrmCadMsgBoletoMT.CmeCadastroApplyInsert(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := CtrlMsgBoleto.GravaMsgBoleto;
end;

procedure TfrmCadMsgBoletoMT.CmeCadastroEdit(Sender: TObject);
begin
  Cds.Data := CtrlMsgBoleto.LookupMsgBoletoComLinhas( CdsIDMSGBOLETO.AsInteger, -1, -1 );
  inherited;
  if dbedDescricao.CanFocus then dbedDescricao.SetFocus;
end;

procedure TfrmCadMsgBoletoMT.CmeCadastroBeforeConfirma(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := VerificaPreenchimento;
end;

function TfrmCadMsgBoletoMT.VerificaPreenchimento: Boolean;
begin
  Result := False;
  try
     if dbedDescricao.Text = '' then
        raise EValidacao.CreateVal('Informe o Descrição da Mensagem',dbedDescricao);
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
