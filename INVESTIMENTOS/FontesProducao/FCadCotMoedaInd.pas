unit FCadCotMoedaInd;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroCS, IvDictio, IvMulti, IvEMulti, MontaSelect, DBTables, Db,
  Wwdatsrc, Wwquery, TB97Ctls, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97,
  ExtCtrls, Mask, wwdblook, wwdbedit, TREdit, wwdbdatetimepicker,
  CMDateTimePicker, CmEventosCadastro, ImgList;

type
  TFrmCadCotMoedaInd = class(TfrmCadastroCS)
    edtDtIni: TCMDateTimePicker;
    Label3: TLabel;
    Label1: TLabel;
    qryMOECODIGO: TFloatField;
    qryCOTDATA: TDateTimeField;
    qryCOTVALOR: TFloatField;
    qryMOEDESC: TStringField;
    Label2: TLabel;
    DblkcMoeda: TwwDBLookupCombo;
    QryCotMoeda: TwwQuery;
    QryCotMoedaMOECODIGO: TFloatField;
    QryCotMoedaMOEDESC: TStringField;
    edtDtFim: TCMDateTimePicker;
    Label4: TLabel;
    DblkcMoedaB: TwwDBLookupCombo;
    RdgTpAtu: TRadioGroup;
    Label5: TLabel;
    EdtValor: TRealEdit;
    EdFator: TRealEdit;
    Procedure CmeCadastroBeforeConfirma(sender: TObject;  var Accept: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure sbtnProcurarClick(Sender: TObject);
    procedure DblkcMoedaBChange(Sender: TObject);
    procedure sbtnInserirClick(Sender: TObject);
    procedure RdgTpAtuClick(Sender: TObject);
    procedure DblkcMoedaChange(Sender: TObject);
  private
    { Private declarations }

  public
    { Public declarations }
  end;

var FrmCadCotMoedaInd: TFrmCadCotMoedaInd;
implementation
uses Math, UBibliotecaInvest, UMensErro,  DBaseDados, USistema, UDataBase, UOperacaoInvest, UDiasUteis,
     UOperComum, dOperComum ;
{$R *.DFM}

procedure TFrmCadCotMoedaInd.FormCreate(Sender: TObject);
begin
  inherited;
  QryCotMoeda.Open;
  qry.Open;
end;

procedure TFrmCadCotMoedaInd.CmeCadastroBeforeConfirma(sender: TObject;  var Accept: Boolean);
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
   If Trim(DblkcMoeda.Text) = '' Then
   Begin
     MsgDlg('Moeda deve ser informada. ','Erro',mtError,[mbOK],0);
     DblkcMoeda.SetFocus;
     Accept := False;
   End;
End;

procedure TFrmCadCotMoedaInd.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  QryCotMoeda.Close;
  qry.Close;
end;

procedure TFrmCadCotMoedaInd.bbtnConfirmarClick(Sender: TObject);
var QryMoeda : TwwQuery;
    DtInicial : TDateTime;
    wDec : char;
    wCotacaoMoedaA, wCotacaoMoedaB, wCotacao, wCalcAux : Double;
    wDataCotacao : TDateTime;
    wIdCotacaoMoeda :Integer;
begin
  QryMoeda := TwwQuery.Create(Application);
  QryMoeda.DataBaseName := 'BaseDados';

  wCotacaoMoedaA := 0;
  wCotacaoMoedaB := 0;

  DtInicial := StrToDate(edtDtIni.Text);
  wDec := DecimalSeparator;
  DecimalSeparator := '.';

// Buscar e guardar a última cotação da moeda A
  OperComum.BuscaCotacaoMoeda(StrToInt(DblkcMoeda.LookupValue),
                               StrToDateTime(edtDtIni.Text), '<=', wCotacaoMoedaA, wDataCotacao);
  If wCotacaoMoedaA = 0 Then Begin
     MsgDlg('Não existe cotação inicial para a moeda que está sendo atualizada',
            'Erro',mtError,[mbOK],0);
     Exit;
  End;

  DtmBaseDados.dbBaseDados.StartTransaction;
//  Inserir a cotação da moeda para o período
  While  DtInicial <= StrToDate(edtDtFim.Text) do
  Begin
// Para cada dia: buscar a cotação da moeda B na data em processo
// Caso encontre, guardar. Senão guardo (1)

    If RdgTpAtu.ItemIndex <> 4 Then Begin
      OperComum.BuscaCotacaoMoeda(StrToInt(DblkcMoedaB.LookupValue),
        DtInicial, '=', wCotacaoMoedaB, wDataCotacao);
    End;

    if wCotacaoMoedaB = 0 then  wCotacaoMoedaB := 1;
//  Gerar resultado

    Case rdgTpAtu.ItemIndex of
      0 : begin
        wCalcAux := StrToFloat(FormatFloat('#0.00000000',wCotacaoMoedaB));
        wCotacaoMoedaA := wCotacaoMoedaA * wCalcAux;
      end;
      1 : begin
        wCalcAux := StrToFloat(FormatFloat('#0.00000000', 1 + wCotacaoMoedaB));
        wCotacaoMoedaA := wCotacaoMoedaA * wCalcAux;
      end;
      2 : begin
        wCalcAux := StrToFloat(FormatFloat('#0.00000000', 1 + (wCotacaoMoedaB/100)));
        wCotacaoMoedaA := wCotacaoMoedaA * wCalcAux;
      end;
      3 : begin
        if (DtInicial <> StrToDate(edtDtIni.Text)) and
           DiasUteis.DiaUtil(DtInicial, -1, -1, '', True, False, False) then begin
           wCalcAux := StrToFloat(FormatFloat('#0.00000000', Power( 1 + (wCotacaoMoedaB/100), 1/252)));
           wCotacaoMoedaA := wCotacaoMoedaA * wCalcAux;
        end;
      end;
      4 : begin
        wCalcAux := EdFator.Value;
        wCotacaoMoedaA := wCotacaoMoedaA * wCalcAux;
      end;
     end;

// Verificar se o registro já existe
// Se já existir faz update, senão faz insert
     if FazQuery(QryMoeda, 'SELECT MOECODIGO FROM COTACAOMOEDA '+
                           'WHERE  MOECODIGO = '+QuotedStr(DblkcMoeda.LookupValue)+' AND '+
                           '       COTDATA   = TO_DATE('+QuotedStr(DateToStr(DtInicial))+', ''DD/MM/YYYY'')')
     then begin
         if not  ExecutaQuery(QryMoeda,
                '  UPDATE COTACAOMOEDA  '+
                '  SET MOECODIGO = '+ QuotedStr(DblkcMoeda.LookupValue)+', '+
                '      COTDATA   =  TO_DATE('+QuotedStr(DateToStr(DtInicial))+', ''DD/MM/YYYY''), '+
                '      IDUSUARIOINCLUSAO = '+IntToStr(Sistema.IdUsuario)+', '+
                '      COTVALOR  = '+FormatFloat('#0.000000000',wCotacaoMoedaA)+
                '  WHERE MOECODIGO = '+ QuotedStr(DblkcMoeda.LookupValue)+' AND '+
                '        COTDATA   =  TO_DATE('+QuotedStr(DateToStr(DtInicial))+', ''DD/MM/YYYY'') ')
       then begin

        DtmBaseDados.dbBaseDados.Rollback;
        Break;
      end;
     end
     else
     begin

       wIdCotacaoMoeda := LeUltRegistro(nil, 'COTACAOMOEDA');
       if not  ExecutaQuery(QryMoeda,
                'INSERT INTO COTACAOMOEDA  '+
                '  (IDCOTACAOMOEDA, MOECODIGO, COTDATA, IDUSUARIOINCLUSAO, COTVALOR) '+
                '   VALUES ('+QuotedStr(IntToStr(wIdCotacaoMoeda))+', '+
                '          '+QuotedStr(DbLkcMoeda.LookupValue)+', '+
                '          TO_DATE('+QuotedStr(DateToStr(DtInicial))+', ''DD/MM/YYYY''), '+
                '          '+IntToStr(Sistema.IdUsuario)+', '+
                '          '+FormatFloat('#0.00000000',wCotacaoMoedaA)+')') then begin

        DtmBaseDados.dbBaseDados.Rollback;
        Break;
      end;
     end;
     DtInicial := DtInicial + 1;
  End;
  DecimalSeparator := wDec;
  if  DtmBaseDados.dbBaseDados.InTransaction then
      DtmBaseDados.dbBaseDados.Commit;

  bbtnCancelarClick(Self);

  QryMoeda.Free;
end;

procedure TFrmCadCotMoedaInd.sbtnProcurarClick(Sender: TObject);
begin
   MontaSelect.Executar;
   If (MontaSelect.ValoresChave.Count > 0) And  (MontaSelect.ValoresChave[0] <> '') Then
   Begin
      Qry.Locate('MOECODIGO',MontaSelect.ValoresChave[0],[]);
      edtDtIni.Text := Qry.FieldByName('COTDATA').AsString;
      edtDtIni.Text := Qry.FieldByName('COTDATA').AsString;
      DblkcMoeda.LookupValue := Qry.FieldByName('MOECODIGO').AsString;
      edtValor.Value := Qry.FieldByName('COTVALOR').AsFloat;
   End;
   sbtnProcurar.Down := False;
end;

procedure TFrmCadCotMoedaInd.DblkcMoedaBChange(Sender: TObject);
begin
  inherited;
  if (DblkcMoeda.Text <> '') and (DblkcMoedaB.Text <> '') then
  begin
     RdgTpAtu.Items.Strings[0] := DblkcMoeda.Text + ' * ' + DblkcMoedaB.Text;
     RdgTpAtu.Items.Strings[1] := DblkcMoeda.Text + ' * (1 + ' + DblkcMoedaB.Text+')';
     RdgTpAtu.Items.Strings[2] := DblkcMoeda.Text + ' * (1 + (' + DblkcMoedaB.Text + ' /100))';
     RdgTpAtu.Items.Strings[3] := DblkcMoeda.Text + ' * (1 + (' + DblkcMoedaB.Text + ' /100)) ^ (1/252)';
  end;
end;

procedure TFrmCadCotMoedaInd.sbtnInserirClick(Sender: TObject);
begin
  edtDtIni.Text := '';
  edtDtFim.Text := '';
  edtValor.Text := '';
  DblkcMoeda.LookupValue  := '';
  DblkcMoedaB.LookupValue := '';
  inherited;

end;

procedure TFrmCadCotMoedaInd.RdgTpAtuClick(Sender: TObject);
begin
  inherited;
  If RdgTpAtu.ItemIndex = 4 Then Begin
    EdFator.Visible:=True;
    DblkcMoedaB.Clear;
  End Else Begin
    EdFator.Visible:=False;
  End;
end;

procedure TFrmCadCotMoedaInd.DblkcMoedaChange(Sender: TObject);
Var
  wCotacaoMoedaA:Double;
  wDataCotacao  :TDateTime;
begin
  inherited;
  If (Trim(EdtDtFim.Text) <> '') And (Trim(DblkcMoeda.LookupValue) <> '') Then Begin
    OperComum.BuscaCotacaoMoeda(StrToInt(DblkcMoeda.LookupValue),
      StrToDateTime(EdtDtFim.Text), '<=', wCotacaoMoedaA, wDataCotacao);
    EdtValor.Value := wCotacaoMoedaA;
  End;
end;

end.
