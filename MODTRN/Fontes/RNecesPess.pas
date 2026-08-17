unit RNecesPess;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSelPessoal, DBTables, Wwquery, Db, Wwtable, Wwdatsrc, MAHlpBtn,
  StdCtrls, Buttons, TEdNum, Spin, wwdblook, ExtCtrls, Qrctrls, quickrpt,
  TB97, ComCtrls, TB97Tlbr, IvDictio, IvMulti, IvEMulti, wwdbdatetimepicker,
  CMDateTimePicker;

type
  TrelNecesPess = class(TfrmSelPessoal)
    qr: TQuickRep;
    PageFooterBand1: TQRBand;
    QRSysData1: TQRSysData;
    QRSysData2: TQRSysData;
    qrlblIdent: TQRLabel;
    PageHeaderBand1: TQRBand;
    qrlblNomeCli: TQRLabel;
    ColumnHeaderBand1: TQRBand;
    QRLabel4: TQRLabel;
    DetailBand1: TQRBand;
    qrsubdt: TQRSubDetail;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    ds2: TwwDataSource;
    tblCurca: TwwTable;
    tblHsttrn: TwwTable;
    tblCurso: TwwTable;
    ds4: TwwDataSource;
    tblCargo2: TwwTable;
    ds3: TwwDataSource;
    qrbCabDetal: TQRBand;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel3: TQRLabel;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    qrlObserv: TQRLabel;
    qrlDurTot: TQRLabel;
    qrbTotais: TQRBand;
    QRLabel5: TQRLabel;
    QRLabel16: TQRLabel;
    qrlTotPes: TQRLabel;
    qrlTotCur: TQRLabel;
    qrlTeor: TQRLabel;
    qrlPrat: TQRLabel;
    qrlTotHor: TQRLabel;
    qrlTotCus: TQRLabel;
    qrlblTitRel: TQRSysData;
    QRLabel1: TQRLabel;
    QRDBText8: TQRDBText;
    procedure FormCreate(Sender: TObject);
    procedure bbtnOutraVezClick(Sender: TObject);
    procedure qrsubdtBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure DetailBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrbTotaisBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure qrNeedData(Sender: TObject; var MoreData: Boolean);
    procedure qrBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  relNecesPess: TrelNecesPess;
  TotPes, TotCur, TotHor, TotTeo, TotPra : Integer;
  TotCus : Real;
  PrimVezSelPes : Boolean;
  
implementation

uses FSelRelNeces, uSistema;

{$R *.DFM}

procedure TrelNecesPess.FormCreate(Sender: TObject);
begin
  inherited;
  qrlblIdent.Caption := Sistema.NomeModulo;
  qrlblNomeCli.Caption := Sistema.NomeEmpresa;
  ColumnHeaderBand1.Enabled := (frmSelRelNeces.rgTipoRel.ItemIndex = 0);
  qrbCabDetal.Enabled := (frmSelRelNeces.rgTipoRel.ItemIndex = 0);
  //DetailBand1.Enabled := (frmSelRelNeces.rgTipoRel.ItemIndex = 0);
  //qrsubdt.Enabled := (frmSelRelNeces.rgTipoRel.ItemIndex = 0);
end;

procedure TrelNecesPess.bbtnOutraVezClick(Sender: TObject);
begin
  inherited;
  ModalResult := mrNone;
end;

procedure TrelNecesPess.qrsubdtBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  qrlDurTot.Caption := IntToStr(tblCurso.FieldByName('DUR_TEOR').Value +
                                tblCurso.FieldByName('DUR_PRAT').Value);
  PrintBand := True;
  qrlObserv.Caption := 'Não Fez';
  tblHsttrn.First;
  while not  tblHsttrn.Eof  do
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
     TotCur := TotCur + 1;
     TotTeo := TotTeo + tblCurso.FieldByName('DUR_TEOR').Value;
     TotPra := TotPra + tblCurso.FieldByName('DUR_PRAT').Value;
     TotHor := TotTeo + TotPra;
     TotCus := TotCus + tblCurso.FieldByName('VALOR').Value;
  end;
  PrintBand := (PrintBand) and (frmSelRelNeces.rgTipoRel.ItemIndex = 0);
end;

procedure TrelNecesPess.DetailBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  tblCurca.First;
  PrintBand := False;
  while  not tblCurca.Eof  do begin
    PrintBand := True;
    tblHsttrn.First;
    while not  tblHsttrn.Eof  do begin
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
    tblCurca.Next;
  end;
  tblCurca.First;
  if  PrintBand  then  TotPes := TotPes + 1;
  qrbCabDetal.Enabled := (PrintBand) and (frmSelRelNeces.rgTipoRel.ItemIndex = 0);
  qrSubDt.Enabled     := (PrintBand) and (frmSelRelNeces.rgTipoRel.ItemIndex = 0);
  PrintBand := (PrintBand) and (frmSelRelNeces.rgTipoRel.ItemIndex = 0);
end;


procedure TrelNecesPess.qrbTotaisBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  qrlTotPes.Caption := IntToStr(TotPes);
  qrlTeor.Caption   := IntToStr(TotTeo);
  qrlPrat.Caption   := IntToStr(TotPra);
  qrlTotCur.Caption := IntToStr(TotCur);
  qrlTotHor.Caption := IntToStr(TotHor);
  qrlTotCus.Caption := FloatToStrF(TotCus,ffFixed,12,2);
end;

procedure TrelNecesPess.bbtnConfirmarClick(Sender: TObject);
begin
  tblCargo2.Close;
  tblCurca.Close;
  tblCurso.Close;
  tblHsttrn.Close;
  inherited;
  if  (frmSelRelNeces.rgTipoCargo.ItemIndex = 0)
  then tblCargo2.MasterFields := 'IdCargo'
  else tblCargo2.MasterFields := 'IdFuncao';
  tblCargo2.Open;
  tblCurca.Open;
  tblCurso.Open;
  tblHsttrn.Open;
  ModalResult := mrNone;
  qr.Visible := False;
  if  Imprime  then  qr.Print  else  qr.Preview;
end;


procedure TrelNecesPess.qrBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  inherited;
  PrimVezSelPes := True;
  TotPes := 0;
  TotTeo := 0;
  TotPra := 0;
  TotCur := 0;
  TotHor := 0;
  TotCus := 0;
end;

procedure TrelNecesPess.qrNeedData(Sender: TObject; var MoreData: Boolean);
begin
  inherited;
  if  PrimVezSelPes  then begin
      PrimVezSelPes := False;
      ds.DataSet.First;
  end
  else ds.DataSet.Next;
  MoreData := not ds.DataSet.Eof;

end;

end.
