unit fCadCPMF;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroCS, wwdbdatetimepicker, CMDateTimePicker, StdCtrls, TREdit,
  CmEventosCadastro, ImgList, Db, Wwdatsrc, MontaSelect, DBTables,
  IvDictio, IvMulti, IvEMulti, Wwquery, MAHlpBtn, Buttons, TB97Tlbr,
  TB97Ctls, TB97, ExtCtrls;

type
  TfrmCadCPMF = class(TfrmCadastroCS)
    lblDataVigencia: TLabel;
    lblAliquota: TLabel;
    dbAliquota: TDBRealEdit;
    edDataVigencia: TCMDateTimePicker;
    qryIDTABELACPMF: TFloatField;
    qryDATAVIGENCIA: TDateTimeField;
    qryALIQUOTA: TFloatField;
    procedure CmeCadastroBeforeConfirma(sender: TObject;var Accept: Boolean);
    procedure CmeCadastroEdit(Sender: TObject);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure CmeCadastroFind(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Posiciona(fIDTabelaCPMF : Integer);
    procedure sbtnAlterarClick(Sender: TObject);
    procedure sbtnInserirClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadCPMF: TfrmCadCPMF;

implementation

uses UmensErro,UDataBase;

{$R *.DFM}

procedure TfrmCadCPMF.CmeCadastroBeforeConfirma(sender: TObject;
  var Accept: Boolean);
var x: Integer;
begin
  inherited;
   Accept := False;
   if Trim(edDataVigencia.Text) = '' then
      begin
        MsgDlg('Data de Vigência não preenchida.', 'Erro', mtError, [mbOk], 0);
        edDataVigencia.SetFocus;
      end
   else
   begin
      Accept := True;
      edDataVigencia.Text := FormatDateTime('DD/MM/YYYY', edDataVigencia.Date);
   end;
   if Trim(dbAliquota.Text) = '0,00' then
   begin
      MsgDlg('Aliquota não definida.', 'Atenção', mtWarning, [mbOk], 0);
      Accept := False;
   end;

end;

procedure TfrmCadCPMF.CmeCadastroEdit(Sender: TObject);
begin
  inherited;
   if edDataVigencia.CanFocus then
     edDataVigencia.SetFocus;
end;

procedure TfrmCadCPMF.CmeCadastroInsert(Sender: TObject);
begin
  inherited;
  If qry.State = dsInsert Then
     qry.FieldByName('IDTABELACPMF').asInteger := LeUltRegistro(nil,'TABELACPMF');

  if edDataVigencia.CanFocus then
     edDataVigencia.SetFocus;
end;

procedure TfrmCadCPMF.CmeCadastroFind(Sender: TObject);
begin
  inherited;
   If MontaSelect.RetornouValor Then
      Posiciona(StrToInt(MontaSelect.ValoresChave[2]))
   Else
      Posiciona(-1);
end;

procedure TfrmCadCPMF.FormCreate(Sender: TObject);
begin
  inherited;
  Posiciona(-1);
end;

Procedure TfrmCadCPMF.Posiciona(fIDTabelaCPMF : Integer);
Begin
   qry.Close;
   qry.ParamByName('pIDTABELACPMF').AsFloat := fIDTabelaCPMF;
   qry.Open;
End;

procedure TfrmCadCPMF.sbtnAlterarClick(Sender: TObject);
begin
  inherited;
   edDataVigencia.Enabled := False;
end;

procedure TfrmCadCPMF.sbtnInserirClick(Sender: TObject);
begin
  inherited;
   edDataVigencia.Enabled := True;
end;

end.
