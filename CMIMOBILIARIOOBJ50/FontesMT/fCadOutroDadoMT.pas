{-------------------------------------------------------------------------------
ALTERAÇÕES / IMPLEMENTAÇÕES ----------------------------------------------------
--------------------------------------------------------------------------------
Padrão      : 5.10.18
Pendência   :
Responsável : Daniel Simões
Data        : 07/01/2008
Descrição   : Criação da função 'GravaOutroDadoIndicadores' usada nesta tela
              para corrigir os problemas decorrentes desta tela...
--------------------------------------------------------------------------------
-------------------------------------------------------------------------------}

unit fCadOutroDadoMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroGridMTImob, MontaSelect, Db, DBClient, uCMClientDataSet,
  CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97Ctls, TB97, Grids, Wwdbigrd,
  Wwdbgrid, ExtCtrls, dBaseDados, uSistema, uMensErro, uMidasUtil, Mask,
  wwdbedit, uComunsImobiliario, uVerificaPreenchimento, uCtrlOutroDado;

type
  TfrmCadOutroDadoMT = class(TfrmCadastroGridMTImob)
    CdsIDOUTRODADO: TFloatField;
    CdsODODESCRICAO: TStringField;
    Label1: TLabel;
    DBEdDescricao: TwwDBEdit;
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure CmeCadastroEdit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CmeCadastroBeforeConfirma(sender: TObject;
      var Accept: Boolean);

  protected
    procedure FazerRefresh; override;

    function VerificaPreenchimento: Boolean;

  private
    { Private declarations }
    CtrlOutroDado: TCtrlOutroDado;

  public
    { Public declarations }
  end;

var
  frmCadOutroDadoMT: TfrmCadOutroDadoMT;

implementation

{$R *.DFM}

{ TfrmCadastroGridMTImob1 }

procedure TfrmCadOutroDadoMT.FazerRefresh;
begin
  inherited;
  Cds.Data := CtrlOutroDado.LookupOutroDado;
end;

procedure TfrmCadOutroDadoMT.CmeCadastroApplyInsert(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := CtrlOutroDado.GravaOutroDadoIndicadores;
end;

procedure TfrmCadOutroDadoMT.FormCreate(Sender: TObject);
begin
  CtrlOutroDado := TCtrlOutroDado.Create;
  CtrlOutroDado.Initialize (dtmBaseDados.dbBaseDados, true, Sistema.ConnectionType,
                            Sistema.ConnectionSide, Sistema.AppRemoteServer, true,
                            ComunsImobiliario.MensErroMT);

  CtrlOutroDado.CdsOutroDado := Cds;

  FazerRefresh ;
  inherited;
end;

procedure TfrmCadOutroDadoMT.CmeCadastroEdit(Sender: TObject);
begin
  Cds.Data := CtrlOutroDado.LookupOutroDado('', CdsIDOUTRODADO.AsInteger);
  inherited;
end;

procedure TfrmCadOutroDadoMT.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  FreeAndNil(CtrlOutroDado);
end;

function TfrmCadOutroDadoMT.VerificaPreenchimento: Boolean;
begin
  Result := False;

  try
    if (DBEdDescricao.Text='') then
      raise EValidacao.CreateVal('É necessário indicar a Descrição!',DBEdDescricao);
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

procedure TfrmCadOutroDadoMT.CmeCadastroBeforeConfirma(sender: TObject;
  var Accept: Boolean);
begin
  Accept := VerificaPreenchimento;

  inherited;
end;

end.
