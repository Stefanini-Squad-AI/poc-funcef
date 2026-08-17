unit FCadCotMoeda;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroCS, IvDictio, IvMulti, IvEMulti, MontaSelect, DBTables, Db,
  Wwdatsrc, Wwquery, TB97Ctls, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97,
  ExtCtrls, Mask, wwdblook, wwdbdatetimepicker, CMDateTimePicker,
  CmEventosCadastro, ImgList, wwdbedit, TREdit;

type
  TFrmCadCotMoeda = class(TfrmCadastroCS)
    edtDtIni: TCMDateTimePicker;
    Label3: TLabel;
    Label1: TLabel;
    qryMOECODIGO: TFloatField;
    qryCOTDATA: TDateTimeField;
    qryCOTVALOR: TFloatField;
    qryMOEDESC: TStringField;
    Label2: TLabel;
    Label4: TLabel;
    DbLkcMoeda: TwwDBLookupCombo;
    QryCotMoeda: TwwQuery;
    QryCotMoedaMOECODIGO: TFloatField;
    QryCotMoedaMOEDESC: TStringField;
    edtValor: TDBRealEdit;
    edtDtFim: TCMDateTimePicker;
    Procedure CmeCadastroBeforeConfirma(sender: TObject;  var Accept: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure sbtnProcurarClick(Sender: TObject);
  private
    { Private declarations }
  
  public
    { Public declarations }
  end;

var FrmCadCotMoeda: TFrmCadCotMoeda;

implementation
uses UBibliotecaInvest, UMensErro,  DBaseDados, USistema, UDataBase;
{$R *.DFM}

procedure TFrmCadCotMoeda.FormCreate(Sender: TObject);
begin
  inherited;
  QryCotMoeda.Open;
  qry.Open;
end;

procedure TFrmCadCotMoeda.CmeCadastroBeforeConfirma(sender: TObject;  var Accept: Boolean);
Begin
   Accept := True;
   If Trim(edtDtIni.Text) = '' then
   Begin
      MsgDlg('Data de Inicio não pode estar vazia.','Erro',mtError,[mbOK],0);
      edtDtIni.SetFocus;
      Accept := False;
   end
   Else
   If Trim(edtDtFim.text) = '' then
   Begin
      MsgDlg('Data Fim não pode estar vazia.','Erro',mtError,[mbOK],0);
      edtDtFim.SetFocus;
      Accept := False;
   end
   Else
   If Trim(DbLkcMoeda.Text) = '' Then
   Begin
     MsgDlg('Moeda deve ser informada. ','Erro',mtError,[mbOK],0);
     DbLkcMoeda.SetFocus;
     Accept := False;
   End
   Else
   If Trim(edtValor.text) = '' then
   Begin
     MsgDlg('Cotação deve ser informada. ','Erro',mtError,[mbOK],0);
     edtValor.SetFocus;
     Accept := False;
   End;
End;

procedure TFrmCadCotMoeda.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  QryCotMoeda.Close;
  qry.Close;
end;

procedure TFrmCadCotMoeda.bbtnConfirmarClick(Sender: TObject);
Var
  QryMoeda : TwwQuery;
  DtInicial : TDate;
  wDec : char;
  wIdCotacaoMoeda :Integer;
begin
  QryMoeda := TwwQuery.Create(Application);
  QryMoeda.DataBaseName := 'BaseDados';

  DtInicial := StrToDate(edtDtIni.Text);
  wDec := DecimalSeparator;
  DecimalSeparator := '.';

  DtmBaseDados.dbBaseDados.StartTransaction;
//  Insiro a cotação da moeda para o período
  While  DtInicial <= StrToDate(edtDtFim.Text) Do Begin
// Verificar se o registro já existe
// Se já existir faz update, senão faz insert
    If FazQuery(QryMoeda, 'SELECT MOECODIGO FROM COTACAOMOEDA '+
                           'WHERE  MOECODIGO = '+QuotedStr(DblkcMoeda.LookupValue)+' AND '+
                           '       COTDATA   = TO_DATE('+QuotedStr(DateToStr(DtInicial))+', ''DD/MM/YYYY'')')
    Then Begin
      If Not ExecutaQuery(QryMoeda,
                '  UPDATE COTACAOMOEDA  '+
                '  SET MOECODIGO = '+ QuotedStr(DblkcMoeda.LookupValue)+', '+
                '      COTDATA   =  TO_DATE('+QuotedStr(DateToStr(DtInicial))+', ''DD/MM/YYYY''), '+
                '      IDUSUARIOINCLUSAO = '+IntToStr(Sistema.IdUsuario)+', '+
                '      COTVALOR  = '+FloatToStr(edtValor.Value)+
                '  WHERE MOECODIGO = '+ QuotedStr(DbLkcMoeda.LookupValue)+' AND '+
                '        COTDATA   =  TO_DATE('+QuotedStr(DateToStr(DtInicial))+', ''DD/MM/YYYY'') ')
      Then Begin
        DtmBaseDados.dbBaseDados.Rollback;
        Break;
      End;
    End Else Begin
// Insere Registro no Arquivo
      wIdCotacaoMoeda := LeUltRegistro(nil, 'COTACAOMOEDA');
      If Not  ExecutaQuery(QryMoeda,
                 'INSERT INTO COTACAOMOEDA  '+
                 '  (IDCOTACAOMOEDA, MOECODIGO, COTDATA, IDUSUARIOINCLUSAO, COTVALOR) '+
                 '   VALUES ('+QuotedStr(IntToStr(wIdCotacaoMoeda))+', '+
                 '          '+QuotedStr(DbLkcMoeda.LookupValue)+', '+
                 '          TO_DATE('+QuotedStr(DateToStr(DtInicial))+', ''DD/MM/YYYY''), '+
                 '          '+IntToStr(Sistema.IdUsuario)+', '+
                 '          '+FloatToStr(edtValor.Value)+')') Then Begin
        DtmBaseDados.dbBaseDados.Rollback;
        Break;
      End;
    End;

    DtInicial := DtInicial + 1;
  End;

  DecimalSeparator := wDec;
  
  If DtmBaseDados.dbBaseDados.InTransaction Then
    DtmBaseDados.dbBaseDados.Commit;

  BbtnCancelarClick(Self);

  QryMoeda.Free;
end;

procedure TFrmCadCotMoeda.sbtnProcurarClick(Sender: TObject);
begin
   MontaSelect.Executar;

   If (MontaSelect.ValoresChave.Count > 0) And  (MontaSelect.ValoresChave[0] <> '') Then
      Qry.Locate('MOECODIGO',MontaSelect.ValoresChave[0],[]);

  sbtnProcurar.Down := False;
end;

end.
