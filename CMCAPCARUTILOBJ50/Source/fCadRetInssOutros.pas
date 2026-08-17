unit fCadRetInssOutros;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroMestreDetMT, MontaSelect, Db, DBClient, uCMClientDataSet,
  CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, TB97Tlbr, StdCtrls, Buttons, TB97Ctls, TB97, Grids, Wwdbigrd,
  Wwdbgrid, ComCtrls, TabControlDetalhe, ExtCtrls, CMProcuraSubTipo,
  uCtrlRetInssOutros, uCmTypes, dBaseDados, uSistema, TREdit, Mask, DBCtrls,
  uCtrlParamIntegra;

type
  TfrmCadRetInssOutros = class(TFrmCadastroMestreDetMT)
    CdsIDPESSOA: TFloatField;
    CdsDet: TCMClientDataSet;
    CdsDetIDPESSOA: TFloatField;
    CdsDetANOMES: TStringField;
    CdsDetVLRETIDO: TFloatField;
    grpFornecedor: TGroupBox;
    lblFornecedor: TLabel;
    Label1: TLabel;
    dbedtMESANO: TDBEdit;
    Label2: TLabel;
    dbedtValorRetido: TDBRealEdit;
    CdsDetMESANO: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure CmeCadastroFind(Sender: TObject);
    procedure CmeDetalheBeforeConfirma(sender: TObject;
      var Accept: Boolean);
    procedure CmeDetalheEdit(Sender: TObject);
    procedure CmeDetalheInsert(Sender: TObject);
    procedure CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroAfterConfirma(Sender: TObject);
    procedure dbedtMESANOExit(Sender: TObject);
    procedure CmeCadastroCancel(Sender: TObject);
  private
    RetInssOutros : TCtrlRetInssOutros;

    iFornecedor : integer;

    procedure MsgErro ( sMsg : String );

    procedure ResetaFornecedor;

    function Salva : boolean;
  public
    { Public declarations }
  end;

var
  frmCadRetInssOutros: TfrmCadRetInssOutros;

implementation

{$R *.DFM}

{ TfrmCadRetInssOutros }

procedure TfrmCadRetInssOutros.MsgErro(sMsg: String);
begin
  ShowMessage( sMsg );
end;

procedure TfrmCadRetInssOutros.FormCreate(Sender: TObject);
begin
  inherited;
  RetInssOutros := TCtrlRetInssOutros.Create;
  RetInssOutros.Initialize( DtmBaseDados.DbBaseDados, True, Sistema.ConnectionType,
   Sistema.ConnectionSide, Sistema.AppRemoteServer, True, MsgErro );

  RetInssOutros.CdsRetInssOutros := CdsDet;

  MontaSelect.Filtro.Add( 'EMPRESAFORN.IDPESSOA = ' + IntToStr( Sistema.IdEmpresa ) );

  ResetaFornecedor;

  Cds.CreateDataSet;
  CdsDet.CreateDataSet;

// Daniel Simões - 25/01/2006 - Início------------------------------------------
  if ParamIntegra.Recpag = 'P' then
  begin
    HelpContext           := 30017;
    bbtnAjuda.HelpContext := 30017;
  end;
// Daniel Simões - 25/01/2006 - Fim---------------------------------------------

end;

procedure TfrmCadRetInssOutros.FormDestroy(Sender: TObject);
begin
  RetInssOutros.Free;
  inherited;
end;

procedure TfrmCadRetInssOutros.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  if ( MontaSelect.RetornouValor ) then
  begin
    iFornecedor           := StrToInt( MontaSelect.ValoresChave[0] );
    lblFornecedor.Caption := MontaSelect.ValoresChave[1];

    Cds.Close;
    CdsDet.Close;

    //Insere um registro no mestre (apenas para habilitar a tela).
    Cds.CreateDataSet; Cds.Insert; Cds.Post;

    CdsDet.Data := RetInssOutros.SelecionaPorFornec( iFornecedor );
  end;
end;

procedure TfrmCadRetInssOutros.ResetaFornecedor;
begin
  lblFornecedor.Caption := '';
  iFornecedor := 0;
end;

procedure TfrmCadRetInssOutros.CmeDetalheBeforeConfirma(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  if CdsDetANOMES.IsNull then
  begin
    ShowMessage( 'O campo "Mês/Ano" deve ser preenchido.' );
    CdsDetMESANO.FocusControl;
    Accept := False;
    exit;
  end;
end;

procedure TfrmCadRetInssOutros.CmeDetalheEdit(Sender: TObject);
begin
  inherited;
  dbedtMESANO.ReadOnly := True;
  CdsDetVLRETIDO.FocusControl;
end;

procedure TfrmCadRetInssOutros.CmeDetalheInsert(Sender: TObject);
begin
  inherited;
  dbedtMESANO.ReadOnly := False;          
  CdsDetIDPESSOA.AsInteger := iFornecedor;
  CdsDetMESANO.FocusControl; 
end;

function TfrmCadRetInssOutros.Salva: boolean;
begin
  Result := RetInssOutros.GravaRetInssOutros;
end;

procedure TfrmCadRetInssOutros.CmeCadastroApplyEdit(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := Salva;
end;

procedure TfrmCadRetInssOutros.CmeCadastroAfterConfirma(Sender: TObject);
begin
  inherited;
  CdsDet.Close;
  CdsDet.Data := RetInssOutros.SelecionaPorFornec( iFornecedor );
end;

procedure TfrmCadRetInssOutros.dbedtMESANOExit(Sender: TObject);
var
  i : integer;
begin
  inherited;
  if CmeDetalhe.Operacao = opInserir then
  begin

    if not CdsDetMESANO.IsNull then
    begin
      CdsDetMESANO.AsString := FormatFloat( '00', StrToIntDef( Copy( CdsDetMESANO.AsString, 1, 2 ), 0 ) ) +
       Copy( CdsDetMESANO.AsString, 3, 4 );
      i := StrToIntDef( Copy( CdsDetMESANO.AsString, 1, 2 ), 0 );
      if ( i < 1 ) or ( i > 12 ) then
      begin
        ShowMessage('Mês inválido.');
        dbedtMESANO.SetFocus;
        exit;
      end;

      i := StrToIntDef( Copy( CdsDetMESANO.AsString, 3, 4 ), 0 );
      if ( i < 100 ) then
      begin
        if i < 50 then
          CdsDetMESANO.AsString := Copy( CdsDetMESANO.AsString, 1, 2 ) + IntToStr( i + 2000 )
        else
          CdsDetMESANO.AsString := Copy( CdsDetMESANO.AsString, 1, 2 ) + IntToStr( i + 1900 );
      end;

      CdsDetANOMES.AsString := Copy( CdsDetMESANO.AsString, 3, 4 ) + Copy( CdsDetMESANO.AsString, 1, 2 );
    end;
  end;
end;

procedure TfrmCadRetInssOutros.CmeCadastroCancel(Sender: TObject);
begin
  inherited;
  ResetaFornecedor;

  Cds.Close;
  CdsDet.Close;
  Cds.CreateDataSet;
  CdsDet.CreateDataSet;
end;

end.
