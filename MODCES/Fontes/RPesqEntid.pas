unit RPesqEntid;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  RMestreDet, quickrpt, Qrctrls, ExtCtrls, Db, DBTables, Wwtable, Wwdatsrc,
  IvDictio, IvMulti, IvEMulti;

type
  TrelPesqEntid = class(TrelMestreDet)
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    tblTendencia: TwwTable;
    tblCargo: TwwTable;
    QRDBText3: TQRDBText;
    QRLabel3: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRDBText4: TQRDBText;
    tblTend2: TwwTable;
    dsEnt: TwwDataSource;
    tblEntid: TwwTable;
    dsTend: TwwDataSource;
    QRDBText19: TQRDBText;
    tblAjuste: TwwTable;
    qrlMenor: TQRLabel;
    qrlPrQua: TQRLabel;
    qrlModa: TQRLabel;
    qrlMedia: TQRLabel;
    qrlMediana: TQRLabel;
    qrlTrQua: TQRLabel;
    qrlMaior: TQRLabel;
    qrlMenorR: TQRLabel;
    qrlPrQuaR: TQRLabel;
    qrlModaR: TQRLabel;
    qrlMediaR: TQRLabel;
    qrlMedianaR: TQRLabel;
    qrlTrQuaR: TQRLabel;
    qrlMaiorR: TQRLabel;
    qrbSumDetalhe: TQRBand;
    QRLabel7: TQRLabel;
    qrlTotFreq: TQRLabel;
    qrlTotMed: TQRLabel;
    qrlTotMai: TQRLabel;
    qrlTotMen: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    qrlTotMenR: TQRLabel;
    qrlTotMedR: TQRLabel;
    qrlTotMaiR: TQRLabel;
    procedure FormCreate(Sender: TObject);
    procedure qrsubdtBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrbSumDetalheBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrbSumDetalheAfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure tblEntidFilterRecord(DataSet: TDataSet; var Accept: Boolean);
    procedure tblTendenciaFilterRecord(DataSet: TDataSet;
      var Accept: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  relPesqEntid: TrelPesqEntid;
  IndLst, TotFreq: integer;
  TotMenor, TotMedia, TotMaior, TotMenorR, TotMediaR, TotMaiorR: real;
  FlgExclui: boolean;

implementation

uses uSistema, fSelRelPesq;

{$R *.DFM}

procedure TrelPesqEntid.FormCreate(Sender: TObject);
begin
  inherited;
  tblTend2.Open;
  tblEntid.Open;
  tblTendencia.Open;
  tblCargo.Open;
  tblAjuste.Open;
  TotFreq   := 0;
  TotMenor  := 9999*9999;
  TotMedia  := 0;
  TotMaior  := 0;
  TotMenorR := 9999*9999;
  TotMediaR := 0;
  TotMaiorR := 0;
end;

procedure TrelPesqEntid.tblEntidFilterRecord(DataSet: TDataSet; var Accept: Boolean);
begin
  inherited;
  Accept := false;
  tblTend2.First;
  while not(tblTend2.EOF) do
  begin
    Accept := (tblTend2.FieldByName('IDEMPRESAPARTIC').asFloat =
      tblEntid.FieldByName('IDPESSOA').asFloat);
    if (Accept) then
      break;
    tblTend2.Next;
  end;
end;

procedure TrelPesqEntid.tblTendenciaFilterRecord(DataSet: TDataSet; var Accept: Boolean);
begin
  inherited;
  Accept := (tblTendencia.FieldByName('IDPESQSALAR').asFloat =
    frmSelRelPesq.qryPesqui.FieldByName('IDPESQSALAR').asFloat);
end;

procedure TrelPesqEntid.qrsubdtBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
var
  FatAjus: real;
begin
  inherited;
  FatAjus := 1;
  if (tblTendencia.FieldByName('IDEMPRESAPARTIC').asFloat <> Sistema.IdEmpresa) and
     not(tblAjuste.EOF) then
    FatAjus := tblAjuste.FieldByName('FATOR').asFloat;

  qrlMenor.Caption  := IntToStr(Round(FatAjus * tblTendencia.FieldByName('MENOR').asFloat));

  qrlMenorR.Caption := IntToStr(Round(FatAjus * tblTendencia.FieldByName('MENOR_R').asFloat));
  qrlMaior.Caption  := IntToStr(Round(FatAjus * tblTendencia.FieldByName('MAIOR').asFloat));

  qrlMaiorR.Caption   := IntToStr(Round(FatAjus * tblTendencia.FieldByName('MAIOR_R').asFloat));
  qrlMedia.Caption    := IntToStr(Round(FatAjus * tblTendencia.FieldByName('MEDIA').asFloat));
  qrlMediaR.Caption   := IntToStr(Round(FatAjus * tblTendencia.FieldByName('MEDIA_R').asFloat));
  qrlModa.Caption     := IntToStr(Round(FatAjus * tblTendencia.FieldByName('MODA').asFloat));
  qrlModaR.Caption    := IntToStr(Round(FatAjus * tblTendencia.FieldByName('MODA_R').asFloat));
  qrlMediana.Caption  := IntToStr(Round(FatAjus * tblTendencia.FieldByName('MEDIANA').asFloat));
  qrlMedianaR.Caption := IntToStr(Round(FatAjus * tblTendencia.FieldByName('MEDIANA_R').asFloat));
  qrlPrQua.Caption    := IntToStr(Round(FatAjus * tblTendencia.FieldByName('PRIMQUA').asFloat));
  qrlPrQuaR.Caption   := IntToStr(Round(FatAjus * tblTendencia.FieldByName('PRIMQUA_R').asFloat));
  qrlTrQua.Caption    := IntToStr(Round(FatAjus * tblTendencia.FieldByName('TERCQUA').asFloat));
  qrlTrQuaR.Caption   := IntToStr(Round(FatAjus * tblTendencia.FieldByName('TERCQUA_R').asFloat));

  TotFreq := TotFreq + tblTendencia.FieldByName('FREQ').asInteger;
  if (StrToInt(qrlMenor.Caption) < TotMenor) then
    TotMenor := StrToInt(qrlMenor.Caption);

  TotMedia := TotMedia + tblTendencia.FieldByName('FREQ').asFloat * StrToInt(qrlMedia.Caption);
  if (StrToInt(qrlMaior.Caption) > TotMaior) then
    TotMaior := StrToInt(qrlMaior.Caption);

  if (StrToInt(qrlMenorR.Caption) < TotMenorR) then
    TotMenorR := StrToInt(qrlMenorR.Caption);

  TotMediaR := TotMediaR + tblTendencia.FieldByName('FREQ').asFloat * StrToInt(qrlMediaR.Caption);
  if (StrToInt(qrlMaiorR.Caption) > TotMaiorR) then
    TotMaiorR := StrToInt(qrlMaiorR.Caption);
end;

procedure TrelPesqEntid.qrbSumDetalheBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  inherited;
  if (TotFreq = 0) then
    TotMenor := 0;

  if (TotFreq = 0) then
    TotMenorR := 0;

  qrlTotFreq.Caption := IntToStr(TotFreq);
  qrlTotMen.Caption  := FloatToStrF(TotMenor,ffFixed,12,0);
  qrlTotMai.Caption  := FloatToStrF(TotMaior,ffFixed,12,0);

  if (TotFreq > 0) then
    qrlTotMed.Caption := FloatToStrF(TotMedia/TotFreq,ffFixed,12,0)
  else
    qrlTotMed.Caption := '0';

  qrlTotMenR.Caption := FloatToStrF(TotMenorR,ffFixed,12,0);
  qrlTotMaiR.Caption := FloatToStrF(TotMaiorR,ffFixed,12,0);

  if (TotFreq > 0) then
    qrlTotMedR.Caption := FloatToStrF(TotMediaR/TotFreq,ffFixed,12,0)
  else
    qrlTotMedR.Caption := '0';
end;

procedure TrelPesqEntid.qrbSumDetalheAfterPrint(Sender: TQRCustomBand; BandPrinted: Boolean);
begin
  inherited;
  TotFreq   := 0;
  TotMenor  := 9999*9999;
  TotMedia  := 0;
  TotMaior  := 0;
  TotMenorR := 9999*9999;
  TotMediaR := 0;
  TotMaiorR := 0;
end;

end.
