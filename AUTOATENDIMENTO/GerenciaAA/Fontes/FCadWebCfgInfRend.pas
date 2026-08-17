unit FCadWebCfgInfRend;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroMT, StdCtrls, DBCtrls, MontaSelect, Db, DBClient,
  uCMClientDataSet, CmEventosCadastro, ImgList, Wwdatsrc, IvDictio,
  IvMulti, IvEMulti, MAHlpBtn, Buttons, TB97Tlbr, TB97Ctls, TB97, ExtCtrls,
  uCtrlWebCfgInfRend, FOkCancelar, uCmTypes, dBaseDados, uSistema,
  wwdbdatetimepicker, CMDateTimePicker;

type
  TfrmCadWebCfgInfRend = class(TfrmOkCancelar)
    Cds: TCMClientDataSet;
    rgSistema: TRadioGroup;
    gbRubrica13: TGroupBox;
    Label8: TLabel;
    edtRubrica: TEdit;
    GroupBox1: TGroupBox;
    Label4: TLabel;
    edtNome: TEdit;
    Label5: TLabel;
    dtdtData: TCMDateTimePicker;
    procedure FormCreate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure rgSistemaClick(Sender: TObject);
    procedure edtRubricaKeyPress(Sender: TObject; var Key: Char);
  private

    WebCfgInfRend : TCtrlWebCfgInfRend;

    bExiste : boolean;

    procedure MsgErro ( sMsg : String );
    procedure Carrega;
  public
    { Public declarations }
  end;

var
  frmCadWebCfgInfRend: TfrmCadWebCfgInfRend;

implementation

{$R *.DFM}

procedure TfrmCadWebCfgInfRend.FormCreate(Sender: TObject);
begin
  inherited;
  WebCfgInfRend := TCtrlWebCfgInfRend.Create;
  WebCfgInfRend.Initialize( DtmBaseDados.DbBaseDados, True, Sistema.ConnectionType,
   Sistema.ConnectionSide, Sistema.AppRemoteServer, True, MsgErro );

  Carrega;
end;

procedure TfrmCadWebCfgInfRend.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  inherited;
  WebCfgInfRend.Free;
end;

procedure TfrmCadWebCfgInfRend.MsgErro(sMsg: String);
begin
  ShowMessage( sMsg );
end;

procedure TfrmCadWebCfgInfRend.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  if WebCfgInfRend.GravaParams( rgSistema.ItemIndex + 1,
                                StrToIntDef( edtRubrica.Text, 0 ),
                                edtNome.Text,
                                dtdtData.Date,
                                bExiste ) then
  begin
    Carrega;
    ShowMessage('Configuração gravada com sucesso.');
  end;
end;

procedure TfrmCadWebCfgInfRend.Carrega;
begin
  cds.Close;
  cds.Data := WebCfgInfRend.BuscaParametrosInfRend;
  bExiste := not cds.IsEmpty;

  if bExiste then
  begin

    rgSistema.ItemIndex := cds.FieldByName('FLGORIGEM').AsInteger - 1;
    if cds.FieldByName('IDRUBRICA13').AsInteger > 0 then
      edtRubrica.Text := cds.FieldByName('IDRUBRICA13').AsString;
    edtNome.Text  := cds.FieldByName('NOMERESPON').AsString;
    dtdtData.Date := cds.FieldByName('DATAINFO').AsDateTime;
    rgSistemaClick( Self ); 
  end;
end;

procedure TfrmCadWebCfgInfRend.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  Carrega;
end;

procedure TfrmCadWebCfgInfRend.rgSistemaClick(Sender: TObject);
begin
  inherited;
  if rgSistema.ItemIndex = 1 then
    gbRubrica13.Visible := True
  else
    gbRubrica13.Visible := False;
end;

procedure TfrmCadWebCfgInfRend.edtRubricaKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if ( Pos( Key, '0123456789' ) = 0 ) and ( Ord( Key ) <> 8 ) then
    Key := Char(0);
end;

end.
