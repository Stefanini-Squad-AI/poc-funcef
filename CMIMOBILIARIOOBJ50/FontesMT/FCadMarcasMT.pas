{-------------------------------------------------------------------------------
--------------------------------------------------------------------------------

     CADASTRO DE MARCAS E FRANQUIAS  ( MT )

     Módulo          :  Comuns Imobiliário
     Autor           :  Vinícius Meyer Lana
     Data de Início  :  22/05/2002
     Data de Término :  22/05/2002

--------------------------------------------------------------------------------
ALTERAÇÕES / IMPLEMENTAÇÕES ----------------------------------------------------
--------------------------------------------------------------------------------
Pendência   : 27394
Responsável : Daniel Simões
Data        : 14/02/2008
Descrição   : Alteração/Implementação do número do Help Context...
--------------------------------------------------------------------------------
-------------------------------------------------------------------------------}

unit FCadMarcasMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroGridMTImob, MontaSelect, Db, DBClient, uCMClientDataSet,
  CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97Ctls, TB97, Grids, Wwdbigrd,
  Wwdbgrid, ExtCtrls, Mask, wwdbedit, uCtrlMarcas;

type
  TfrmCadMarcasMT = class(TfrmCadastroGridMTImob)
    CdsIDMARCA: TFloatField;
    CdsMRCNOME: TStringField;
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
    CtrlMarcas : TCtrlMarcas;
    function VerificaPreenchimento : Boolean;
  public
    { Public declarations }

  protected
    procedure FazerRefresh; override;

  end;

var
  frmCadMarcasMT: TfrmCadMarcasMT;

implementation

uses dBaseDados, uSistema, uMensErro, uComunsImobiliario, uVerificaPreenchimento;

{$R *.DFM}

{ TfrmCadMarcas }

procedure TfrmCadMarcasMT.FormCreate(Sender: TObject);
begin
  inherited;
  // Cria e inicializa o CtrlObject do objeto Lojas
  CtrlMarcas := TCtrlMarcas.Create;
  CtrlMarcas.Initialize(DtmBaseDados.DbBaseDados, True, Sistema.ConnectionType,
                        Sistema.ConnectionSide, Sistema.AppRemoteServer, True,
                        ComunsImobiliario.MensErroMT);

  // Associa o Cds do CtrlObject ao Cds local para as alterações locais refletirem
  // no CtrlObject
  CtrlMarcas.CdsMarcas := Cds;

  FazerRefresh;
end;

procedure TfrmCadMarcasMT.FazerRefresh;
begin
  inherited;
  Cds.Data := CtrlMarcas.LookupMarcas;
end;

procedure TfrmCadMarcasMT.CmeCadastroInsert(Sender: TObject);
begin
  inherited;
  if dbedtDesc.CanFocus then dbedtDesc.SetFocus;
end;

procedure TfrmCadMarcasMT.CmeCadastroApplyInsert(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := CtrlMarcas.GravaMarcas;
end;

procedure TfrmCadMarcasMT.CmeCadastroEdit(Sender: TObject);
begin
  Cds.Data := CtrlMarcas.LookupMarcas( CdsIDMARCA.AsInteger );
  inherited;
  if dbedtDesc.CanFocus then dbedtDesc.SetFocus;
end;

procedure TfrmCadMarcasMT.CmeCadastroBeforeConfirma(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := VerificaPreenchimento;
end;

function TfrmCadMarcasMT.VerificaPreenchimento: Boolean;
begin
  Result := False;
  try
     if dbedtDesc.Text = '' then
        raise EValidacao.CreateVal('Informe a Descrição da Marca',dbedtDesc);
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
