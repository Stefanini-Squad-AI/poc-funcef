unit RNecesCurso;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  RMestreDet, quickrpt, Qrctrls, ExtCtrls, Db, Wwdatsrc, DBTables, Wwtable,
  MAHlpBtn, StdCtrls, Buttons, Wwquery, wwdblook, IvDictio, IvMulti,
  IvEMulti;

type
  TrelNecesCurso = class(TrelMestreDet)
    tblHsttrn: TwwTable;
    tblCurso: TwwTable;
    ds: TwwDataSource;
    tblPessoal: TwwTable;
    QRDBText1: TQRDBText;
    ds2: TwwDataSource;
    Panel1: TPanel;
    pnBotoes: TPanel;
    bbtnOk: TBitBtn;
    bbtnCancela: TBitBtn;
    bbtnAjuda: TmaHelpBitBtn;
    rgSelTudo: TRadioGroup;
    gbxCurso: TGroupBox;
    dblcCurso: TwwDBLookupCombo;
    lstCurso: TListBox;
    qryCurso: TwwQuery;
    lstCodCurso: TListBox;
    qrbSubTot: TQRBand;
    qrlSubCus: TQRLabel;
    qrlSubHor: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel6: TQRLabel;
    qrbTotais: TQRBand;
    QRLabel5: TQRLabel;
    QRLabel16: TQRLabel;
    qrlTotPes: TQRLabel;
    qrlTotCur: TQRLabel;
    qrlTeor: TQRLabel;
    qrlPrat: TQRLabel;
    qrlTotHor: TQRLabel;
    qrlTotCus: TQRLabel;
    tblCurca: TwwTable;
    tblCargo: TwwTable;
    ds3: TwwDataSource;
    tblFuncio: TwwTable;
    ds4: TwwDataSource;
    qrSubCargo: TQRSubDetail;
    qrlSubPra: TQRLabel;
    qrlSubTeo: TQRLabel;
    QRLabel7: TQRLabel;
    qrlSubPes: TQRLabel;
    qrsubdt: TQRSubDetail;
    QRDBText3: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    qrlDurTot: TQRLabel;
    QRDBText7: TQRDBText;
    qrlObserv: TQRLabel;
    QRDBText2: TQRDBText;
    tblSitFunc: TwwTable;
    procedure FormCreate(Sender: TObject);
    procedure qrsubdtBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure DetailBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure bbtnOkClick(Sender: TObject);
    procedure qrbTotaisBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure rgSelTudoClick(Sender: TObject);
    procedure dblcCursoCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure lstCursoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DetailBand1AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure qrbSubTotBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure bbtnCancelaClick(Sender: TObject);
    procedure qrBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  relNecesCurso: TrelNecesCurso;
  TotPes, TotCur, TotHor, TotTeo, TotPra, SvItem : Integer;
  CurPes, CurHor, CurTeo, CurPra : Integer;
  TotCus, CurCus : Real;

implementation

uses FSelRelNeces;

{$R *.DFM}


procedure TrelNecesCurso.FormCreate(Sender: TObject);
begin
  inherited;
  tblCurso.Open;
  qryCurso.Open;
  tblCurca.Open;
  if  (frmSelRelNeces.rgTipoCargo.ItemIndex = 0)
  then tblFuncio.IndexFieldNames := 'IdCargo'
  else tblFuncio.IndexFieldNames := 'IdFuncao';
  tblCargo.Open;
  tblFuncio.Open;
  tblSitFunc.Open;
  tblHsttrn.Open;
  tblPessoal.Open;
  qr.Visible := False;
  qrlblTitRel.Caption := qr.ReportTitle;
end;

procedure TrelNecesCurso.qrsubdtBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  qrlDurTot.Caption := IntToStr(tblCurso.FieldByName('DUR_TEOR').Value +
                                tblCurso.FieldByName('DUR_PRAT').Value);
  PrintBand := (tblSitFunc.FieldByName('TIPOSIT').AsString <> 'D');
  qrlObserv.Caption := 'Não Fez';
  tblHsttrn.First;
  while (not tblHsttrn.Eof) and (PrintBand)  do
     begin
       if (tblHsttrn.FieldByName('IDCURSO').Value =
           tblCurca.FieldByName('IDCURSO').Value) then
         begin
         if ((tblHsttrn.FieldByName('DATREFIM').Value <> Null) and
             ((tblCurso.FieldByName('TEMAVAL').Value = 0) or
              (tblHsttrn.FieldByName('FLGAVALTEOR').Value = 0) or
              ((tblHsttrn.FieldByName('FLGAVALTEOR').Value = 1) and
               (tblCurso.FieldByName('TEMAVAL').Value = 1) and
               (tblHsttrn.FieldByName('AVALTEOR').Value >=
                tblCurso.FieldByName('AVALIACAO').Value)))  and
             ((tblCurso.FieldByName('TEMAVPR').Value = 0) or
              (tblHsttrn.FieldByName('FLGAVALPRAT').Value = 0) or
              ((tblHsttrn.FieldByName('FLGAVALPRAT').Value = 1) and
               (tblCurso.FieldByName('TEMAVPR').Value = 1) and
               (tblHsttrn.FieldByName('AVALPRAT').Value >=
                tblCurso.FieldByName('AVALPRAT').Value))))  or
            ((tblHsttrn.FieldByName('DATREFIM').Value = Null) and
              ((tblHsttrn.FieldByName('DATPLINI').Value <> Null) or
               (tblHsttrn.FieldByName('DATREINI').Value <> Null)) and
             (frmSelRelNeces.rgPrograma.ItemIndex = 1))   then
           begin
              PrintBand := False;
              break;
           end;
           if (tblHsttrn.FieldByName('DATREFIM').Value <> Null) then
              qrlObserv.Caption := 'Reprovado'  else
              if (tblHsttrn.FieldByName('DATREINI').Value <> Null) then
                 qrlObserv.Caption := DateToStr(
                   tblHsttrn.FieldByName('DATREINI').Value) else
              if (tblHsttrn.FieldByName('DATPLINI').Value <> Null) then
                 qrlObserv.Caption := DateToStr(
                   tblHsttrn.FieldByName('DATPLINI').Value) else
                 qrlObserv.Caption := 'A Programar';
         end;
        tblHsttrn.Next;
     end;
  tblHsttrn.First;
  if PrintBand  then begin
     TotPes := TotPes + 1;
     CurPes := CurPes + 1;
     TotTeo := TotTeo + tblCurso.FieldByName('DUR_TEOR').Value;
     TotPra := TotPra + tblCurso.FieldByName('DUR_PRAT').Value;
     TotHor := TotTeo + TotPra;
     TotCus := TotCus + tblCurso.FieldByName('VALOR').Value;
     CurTeo := CurTeo + tblCurso.FieldByName('DUR_TEOR').Value;
     CurPra := CurPra + tblCurso.FieldByName('DUR_PRAT').Value;
     CurHor := CurTeo + CurPra;
     CurCus := CurCus + tblCurso.FieldByName('VALOR').Value;
  end;
  PrintBand := (PrintBand) and (frmSelRelNeces.rgTipoRel.ItemIndex = 0);
end;

procedure TrelNecesCurso.DetailBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  I : Integer;
begin
  inherited;
  tblCurca.First;
  PrintBand := not tblCurca.Eof;
  if  (PrintBand) and (rgSelTudo.ItemIndex = 1)  then begin
      PrintBand := False;
      for  I := 0 to (lstCurso.Items.Count - 1) do begin
           if lstCurso.Items[I] = ''  then  break;
           if lstCodCurso.Items[I] =
              tblCurso.FieldByName('IDCURSO').AsString  then begin
              PrintBand := True;
              break;
           end;
      end;
  end;
  if  PrintBand then begin
   tblCurca.First;
   while  not tblCurca.Eof  do begin
     tblFuncio.First;
     while not  tblFuncio.Eof  do begin
       PrintBand := (tblSitFunc.FieldByName('TIPOSIT').AsString <> 'D');
       tblHsttrn.First;
       while (not tblHsttrn.Eof) and (PrintBand)  do begin
         if (tblHsttrn.FieldByName('IDCURSO').Value =
           tblCurca.FieldByName('IDCURSO').Value) then begin

         if ((tblHsttrn.FieldByName('DATREFIM').Value <> Null) and
             ((tblCurso.FieldByName('TEMAVAL').Value = 0) or
              (tblHsttrn.FieldByName('FLGAVALTEOR').Value = 0) or
              ((tblHsttrn.FieldByName('FLGAVALTEOR').Value = 1) and
               (tblCurso.FieldByName('TEMAVAL').Value = 1) and
               (tblHsttrn.FieldByName('AVALTEOR').Value >=
                tblCurso.FieldByName('AVALIACAO').Value)))  and
             ((tblCurso.FieldByName('TEMAVPR').Value = 0) or
              (tblHsttrn.FieldByName('FLGAVALPRAT').Value = 0) or
              ((tblHsttrn.FieldByName('FLGAVALPRAT').Value = 1) and
               (tblCurso.FieldByName('TEMAVPR').Value = 1) and
               (tblHsttrn.FieldByName('AVALPRAT').Value >=
                tblCurso.FieldByName('AVALPRAT').Value))))  or

            ((tblHsttrn.FieldByName('DATREFIM').Value = Null) and
              ((tblHsttrn.FieldByName('DATPLINI').Value <> Null) or
               (tblHsttrn.FieldByName('DATREINI').Value <> Null)) and
             (frmSelRelNeces.rgPrograma.ItemIndex = 1))   then
           begin
              PrintBand := False;
              break;
           end;
           PrintBand := True;
         end;
         tblHsttrn.Next;
       end;
       tblHsttrn.First;
       if  PrintBand  then break;
       tblFuncio.Next;
     end;
     tblFuncio.First;
     if  PrintBand  then break;
     tblCurca.Next;
   end;
   tblCurca.First;
  end;
  if  PrintBand  then  TotCur := TotCur + 1;
  qrSubDt.Enabled   := (PrintBand);
  qrbSubTot.Enabled := (PrintBand);

end;




procedure TrelNecesCurso.bbtnOkClick(Sender: TObject);
begin
  inherited;
  //tblCurso.Filtered := False;
  //tblCurso.First;
  //tblCurso.Filtered := True;
  ModalResult := mrNone;
  if  Imprime  then  qr.Print  else  qr.Preview;
end;

procedure TrelNecesCurso.qrbTotaisBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  PrintBand := (TotCur > 1);
  qrlTotPes.Caption := IntToStr(TotPes);
  qrlTeor.Caption   := IntToStr(TotTeo);
  qrlPrat.Caption   := IntToStr(TotPra);
  qrlTotCur.Caption := IntToStr(TotCur);
  qrlTotHor.Caption := IntToStr(TotHor);
  qrlTotCus.Caption := FloatToStrF(TotCus,ffFixed,12,2);
end;


procedure TrelNecesCurso.rgSelTudoClick(Sender: TObject);
begin
  inherited;
  gbxCurso.Visible := (rgSelTudo.ItemIndex = 1);
end;

procedure TrelNecesCurso.dblcCursoCloseUp(Sender: TObject; LookupTable,
  FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  if modified then begin
     lstCurso.Items.Add(qryCurso.FieldByName('DESCRICAO').Value);
     lstCodCurso.Items.Add(qryCurso.FieldByName('IDCURSO').AsString);
  end;
end;


procedure TrelNecesCurso.lstCursoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if  (Key = vk_Delete) and (lstCurso.Items.Count > 0)  then begin
      SvItem := lstCurso.ItemIndex;
      lstCurso.Items.Delete(SvItem);
      lstCodCurso.Items.Delete(SvItem);
  end;
end;

procedure TrelNecesCurso.DetailBand1AfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
  inherited;
  CurPes := 0;
  CurHor := 0;
  CurCus := 0;
  CurTeo := 0;
  CurPra := 0;
end;

procedure TrelNecesCurso.qrbSubTotBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  qrlSubPes.Caption := IntToStr(CurPes);
  qrlSubHor.Caption := IntToStr(CurHor);
  qrlSubCus.Caption := FloatToStrF(CurCus,ffFixed,12,2);
  qrlSubTeo.Caption := IntToStr(CurTeo);
  qrlSubPra.Caption := IntToStr(CurPra);
end;
      
procedure TrelNecesCurso.qrBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  inherited;
  TotPes := 0;
  TotTeo := 0;
  TotPra := 0;
  TotCur := 0;
  TotHor := 0;
  TotCus := 0;
  CurPes := 0;
  CurTeo := 0;
  CurPra := 0;
  CurHor := 0;
  CurCus := 0;
end;

procedure TrelNecesCurso.bbtnCancelaClick(Sender: TObject);
begin
  inherited;
  Close;
end;

end.
