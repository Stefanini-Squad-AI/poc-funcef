unit FCadPlanoContabPatro;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroCS, CmEventosCadastro, ImgList, Db, Wwdatsrc, MontaSelect,
  DBTables, IvDictio, IvMulti, IvEMulti, Wwquery, MAHlpBtn, StdCtrls,
  Buttons, TB97Tlbr, TB97Ctls, TB97, ExtCtrls, wwdblook;

type
  TfrmCadPlanoContabPatro = class(TfrmCadastroCS)
    lblPlanoContabil: TLabel;
    dblPlanoContabil: TwwDBLookupCombo;
    lblPatrocinadora: TLabel;
    dblPatrocinadora: TwwDBLookupCombo;
    QryPlanoContabil: TwwQuery;
    QryPatrocinadora: TwwQuery;
    QryPlanoContabilIDPLANOPREV: TFloatField;
    QryPlanoContabilNOME: TStringField;
    QryPatrocinadoraIDPESSOA: TFloatField;
    QryPatrocinadoraNOME: TStringField;
    qryIDPLANPREVCTBPATR: TFloatField;
    qryIDPLANOPREV: TFloatField;
    qryIDPATRO: TFloatField;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure sbtnInserirClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CmeCadastroFind(Sender: TObject);
    procedure Posiciona(IDPLANPREVCTBPATR : Integer);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure CmeCadastroBeforeConfirma(sender: TObject;
      var Accept: Boolean);
    procedure sbtnApagarClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadPlanoContabPatro: TfrmCadPlanoContabPatro;

implementation

uses UmensErro,UDataBase, UBibliotecaInvest;

{$R *.DFM}

procedure TfrmCadPlanoContabPatro.FormCreate(Sender: TObject);
begin
  inherited;
   Posiciona(-1)
end;

procedure TfrmCadPlanoContabPatro.FormShow(Sender: TObject);
begin
  inherited;
   Qry.Open;
   QryPlanoContabil.Open;
   QryPatrocinadora.Open;

   if dblPlanoContabil.CanFocus then
      dblPlanoContabil.SetFocus;
end;

procedure TfrmCadPlanoContabPatro.sbtnInserirClick(Sender: TObject);
begin
  inherited;
   if dblPlanoContabil.CanFocus then
      dblPlanoContabil.SetFocus;
end;

procedure TfrmCadPlanoContabPatro.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
   Qry.Close;
   QryPlanoContabil.Close;
   QryPatrocinadora.Close;
end;

procedure TfrmCadPlanoContabPatro.CmeCadastroFind(Sender: TObject);
begin
  inherited;
   If MontaSelect.RetornouValor Then
      Posiciona(StrToInt(MontaSelect.ValoresChave[0]))
   Else
      Posiciona(-1);
end;

procedure TfrmCadPlanoContabPatro.Posiciona(IDPLANPREVCTBPATR : Integer);
begin
   qry.Close;
   qry.ParamByName('IDPLANPREVCTBPATR').AsFloat := IDPLANPREVCTBPATR;
   qry.Open;
end;


procedure TfrmCadPlanoContabPatro.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
   dblPlanoContabil.Text := '';
   dblPatrocinadora.Text := '';
end;

procedure TfrmCadPlanoContabPatro.CmeCadastroBeforeConfirma(
  sender: TObject; var Accept: Boolean);
begin
  inherited;
   Accept := True;

   qry.FieldByName('IDPLANPREVCTBPATR').AsInteger  := LeUltRegistro(nil,'PLANPREVCONTABPATRO');

   if Trim(dblPlanoContabil.Text) = '' then
   begin
      MsgDlg('Plano Contábil não informado.', 'Atenção', mtWarning, [mbOk], 0);
      Accept := False;
   end;

   if Trim(dblPlanoContabil.Text) = '' then
   begin
      MsgDlg('Patrocinadora não informada.', 'Atenção', mtWarning, [mbOk], 0);
      Accept := False;
   end;


end;

procedure TfrmCadPlanoContabPatro.sbtnApagarClick(Sender: TObject);
begin
   if iPlanPrevCtbPatro = qry.FieldByName('IDPLANPREVCTBPATR').AsInteger then
   begin
      MsgDlg('Plano Contábil por Patrocinadora em uso.', 'Atenção', mtWarning, [mbOk], 0);
      Exit;
   end
   else
      dblPlanoContabil.Text := '';
      dblPlanoContabil.Text := '';
  inherited;
end;

end.
