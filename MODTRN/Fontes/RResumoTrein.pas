unit RResumoTrein;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  RSimples, Qrctrls, quickrpt, ExtCtrls, IvDictio, IvMulti, IvEMulti, Db,
  DBTables, Wwquery;

type
  TrelResumoTrein = class(TrelSimples)
    QRLabel7: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRDBText2: TQRDBText;
    QRBand3: TQRBand;
    qrlTot4: TQRLabel;
    qrlTot1: TQRLabel;
    qrlTot2: TQRLabel;
    qrlTot3: TQRLabel;
    QRLabel20: TQRLabel;
    qrlRes1: TQRLabel;
    qrlRes2: TQRLabel;
    qrlRes3: TQRLabel;
    qrlRes4: TQRLabel;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    qrlHor1: TQRLabel;
    qrlQ1: TQRLabel;
    qrlQ2: TQRLabel;
    qrlHor2: TQRLabel;
    qrlQ3: TQRLabel;
    qrlHor3: TQRLabel;
    qrlQ4: TQRLabel;
    qrlHor4: TQRLabel;
    qrlTQ1: TQRLabel;
    qrlTH1: TQRLabel;
    qrlTQ2: TQRLabel;
    qrlTH2: TQRLabel;
    qrlTQ3: TQRLabel;
    qrlTH3: TQRLabel;
    qrlTQ4: TQRLabel;
    qrlTH4: TQRLabel;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    QRShape7: TQRShape;
    QRShape8: TQRShape;
    QRShape9: TQRShape;
    QRShape10: TQRShape;
    QRShape11: TQRShape;
    QRShape12: TQRShape;
    qrlPeriodo: TQRLabel;
    qrlOrcado1: TQRLabel;
    qrlOrcado2: TQRLabel;
    qryOrcam: TwwQuery;
    qrlO1: TQRLabel;
    qrlHoc1: TQRLabel;
    qrlCor1: TQRLabel;
    qrlTQO: TQRLabel;
    qrlTHO: TQRLabel;
    qrlTotO: TQRLabel;
    qrlP1: TQRLabel;
    qrlS1: TQRLabel;
    qrlSal1: TQRLabel;
    qrlSa1: TQRLabel;
    qrlP2: TQRLabel;
    qrlS2: TQRLabel;
    qrlSa2: TQRLabel;
    qrlSal2: TQRLabel;
    qrlP3: TQRLabel;
    qrlS3: TQRLabel;
    qrlSa3: TQRLabel;
    qrlSal3: TQRLabel;
    qrlPT1: TQRLabel;
    qrlST1: TQRLabel;
    qrlSaT1: TQRLabel;
    qrlSalT1: TQRLabel;
    qrlPT2: TQRLabel;
    qrlST2: TQRLabel;
    qrlSaT2: TQRLabel;
    qrlSalT2: TQRLabel;
    qrlPT3: TQRLabel;
    qrlST3: TQRLabel;
    qrlSaT3: TQRLabel;
    qrlSalT3: TQRLabel;
    procedure DetailBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand3BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  relResumoTrein: TrelResumoTrein;
  TotCtOrc: real;
  FazOrcam: boolean;
  AnoOrcam, TotQtOrc, TotHrOrc: integer;
  TitColuna: array[0..3] of string[13] = ('Tipo de Curso','Centro Custo ','Tipo - CCusto','CCusto - Tipo');

implementation

uses fSelRelTrein;

{$R *.DFM}

procedure TrelResumoTrein.FormCreate(Sender: TObject);
begin
  inherited;
  qr.Dataset := frmSelRelTrein.tblTipCurso;
  FazOrcam   := Copy(frmSelRelTrein.EdData1.Text,7,4) = Copy(frmSelRelTrein.EdData2.Text,7,4);
  AnoOrcam   := StrToInt(copy(frmSelRelTrein.EdData1.Text,7,4));
  TotQtOrc   := 0;
  TotHrOrc   := 0;
  TotCtOrc   := 0;
end;

procedure TrelResumoTrein.FormShow(Sender: TObject);
begin
  inherited;
  qrlblTitRel.Caption := 'Resumo';
  qrlPeriodo.Caption  := msgTitulo;
  qr.Visible := false;
  if (Imprime) then
    qr.Print
  else
    qr.Preview;
end;

procedure TrelResumoTrein.DetailBand1BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
var
  Ind, TotOcOrc: integer;
begin
  PrintBand := false;
  TotOcOrc  := 0;
  if (FazOrcam) then
  begin
    qryOrcam.Close;
    qryOrcam.SQL.Clear;
    qryOrcam.SQL.Add('Select sum(o.ocorrencias) as TotOcor,    ' +
                     'sum(o.ocorrencias*c.valor) as TotValor,  ' +
                     'sum(c.dur_prat + c.dur_teor) as TotHoras ' +
                     'from orcamtrein o, curso c               ' +
                     'where o.idcurso = c.idcurso              ' +
                     ' and o.ano            = ' + IntToStr(AnoOrcam));

    if (sTipo <> '') then
    begin
      if (iSelCurso = 1) then
        qryOrcam.Sql.Add(' and  o.idcurso in ' + sTipo);
      if (iSelCurso = 2) then
        qryOrcam.Sql.Add(' and  c.idtipocurso in ' + sTipo);
      if (iSelCurso = 3) then
        qryOrcam.Sql.Add(' and  c.CODGRPTREIN in ' + sTipo);
    end;

    if (frmSelRelTrein.cmbResumo.ItemIndex <> 0) then
      qryOrcam.SQL.Add(' and O.CODCENTROCUSTO = ' +
        QuotedStr(frmSelRelTrein.tblTipCurso.FieldByName('CODCENTROCUSTO').AsString));

    if frmSelRelTrein.cmbResumo.ItemIndex <> 1 then
      qryOrcam.SQL.Add(' and c.idtipocurso = ' +
        frmSelRelTrein.tblTipCurso.FieldByName('IdTipoCurso').AsString);

    qryOrcam.Open;
    TotOcOrc := qryOrcam.FieldByName('TotOcor').asInteger;
  end;

  for Ind:=1 to TamRes do
    if (CodRes2[Ind] = frmSelRelTrein.tblTipCurso.FieldByName('CodTipo').asString) then
    begin
      PrintBand := QtdRes[Ind,1] + QtdRes[Ind,2] + QtdRes[Ind,3] + QtdRes[Ind,4] + TotOcOrc>0;
      if (PrintBand) then
      begin
        qrlQ1.Caption := IntToStr(QtdRes[Ind,1]);
        qrlQ2.Caption := IntToStr(QtdRes[Ind,2]);
        qrlQ3.Caption := IntToStr(QtdRes[Ind,3]);
        qrlQ4.Caption := IntToStr(QtdRes[Ind,4]);

        qrlHor1.Caption := IntToStr(HorRes[Ind,1]);
        qrlHor2.Caption := IntToStr(HorRes[Ind,2]);
        qrlHor3.Caption := IntToStr(HorRes[Ind,3]);
        qrlHor4.Caption := IntToStr(HorRes[Ind,4]);

        qrlRes1.Caption := FloatToStrF(AcuRes[Ind,1],ffFixed,10,0);
        qrlRes2.Caption := FloatToStrF(AcuRes[Ind,2],ffFixed,10,0);
        qrlRes3.Caption := FloatToStrF(AcuRes[Ind,3],ffFixed,10,0);
        qrlRes4.Caption := FloatToStrF(AcuRes[Ind,4],ffFixed,10,0);
      end;
      Break;
    end;

  if (PrintBand) then
  begin
    qrlOrcado1.Caption := '';
    qrlO1.Caption := '';
    qrlHoc1.Caption := '';
    qrlCor1.Caption := '';
    qrlP1.Caption := '';
    qrlS1.Caption := '';
    qrlSa1.Caption := '';
    qrlSal1.Caption := '';
    qrlP2.Caption := '';
    qrlS2.Caption := '';
    qrlSa2.Caption := '';
    qrlSal2.Caption := '';
    qrlP3.Caption := '';
    qrlS3.Caption := '';
    qrlSa3.Caption := '';
    qrlSal3.Caption := '';

    if (FazOrcam) and (qryOrcam.FieldByName('TotOcor').asInteger > 0)  then
    begin
      qrlOrcado1.Caption := 'Orçamento';
      qrlO1.Caption      := qryOrcam.FieldByName('TotOcor').asString;
      qrlHoc1.Caption    := qryOrcam.FieldByName('TotHoras').asString;
      qrlCor1.Caption    := FloatToStrF(qryOrcam.FieldByName('TotValor').asFloat,ffFixed,10,0);

      TotQtOrc := TotQtOrc + qryOrcam.FieldByName('TotOcor').asInteger;
      TotHrOrc := TotHrOrc + qryOrcam.FieldByName('TotHoras').asInteger;
      TotCtOrc := TotCtOrc + qryOrcam.FieldByName('TotValor').asFloat;

      if (qryOrcam.FieldByName('TotValor').asFloat > 0) then
      begin
        qrlP1.Caption := FloatToStrF((AcuRes[Ind,1] + AcuRes[Ind,2]) * 100 /
          qryOrcam.FieldByName('TotValor').asFloat,ffFixed,4,0);
        qrlS1.Caption := '%';
      end;

      qrlSa1.Caption  := 'Saldo';
      qrlSal1.Caption := FloatToStrF(- (AcuRes[Ind,1] + AcuRes[Ind,2]) +
        qryOrcam.FieldByName('TotValor').asFloat,ffFixed,10,0);

      if (qryOrcam.FieldByName('TotValor').asFloat > 0) then
      begin
        qrlP2.Caption := FloatToStrF((AcuRes[Ind,1] + AcuRes[Ind,2] + AcuRes[Ind,3]) * 100 /
          qryOrcam.FieldByName('TotValor').asFloat,ffFixed,4,0);
        qrlS2.Caption := '%';
      end;

      qrlSa2.Caption := 'Saldo';
      qrlSal2.Caption := FloatToStrF(- (AcuRes[Ind,1] + AcuRes[Ind,2] + AcuRes[Ind,3]) +
        qryOrcam.FieldByName('TotValor').asFloat,ffFixed,10,0);

      if (qryOrcam.FieldByName('TotValor').asFloat > 0) then
      begin
        qrlP3.Caption := FloatToStrF((AcuRes[Ind,1] + AcuRes[Ind,2] + AcuRes[Ind,3] +
          AcuRes[Ind,4]) * 100 / qryOrcam.FieldByName('TotValor').asFloat,ffFixed,4,0);
        qrlS3.Caption := '%';
      end;

      qrlSa3.Caption := 'Saldo';
      qrlSal3.Caption := FloatToStrF(- (AcuRes[Ind,1] + AcuRes[Ind,2] + AcuRes[Ind,3] +
        AcuRes[Ind,4]) + qryOrcam.FieldByName('TotValor').asFloat,ffFixed,10,0);
    end;
  end;
end;

procedure TrelResumoTrein.QRBand3BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  qrlTQ1.Caption := IntToStr(TotQtd[1]);
  qrlTQ2.Caption := IntToStr(TotQtd[2]);
  qrlTQ3.Caption := IntToStr(TotQtd[3]);
  qrlTQ4.Caption := IntToStr(TotQtd[4]);

  qrlTH1.Caption := IntToStr(TotHor[1]);
  qrlTH2.Caption := IntToStr(TotHor[2]);
  qrlTH3.Caption := IntToStr(TotHor[3]);
  qrlTH4.Caption := IntToStr(TotHor[4]);

  qrlTot1.Caption := FloatToStrF(TotRes[1],ffFixed,12,0);
  qrlTot2.Caption := FloatToStrF(TotRes[2],ffFixed,12,0);
  qrlTot3.Caption := FloatToStrF(TotRes[3],ffFixed,12,0);
  qrlTot4.Caption := FloatToStrF(TotRes[4],ffFixed,12,0);

  qrlOrcado2.Caption := '';
  qrlTQO.Caption     := '';
  qrlTHO.Caption     := '';
  qrlTotO.Caption    := '';
  qrlPT1.Caption     := '';
  qrlST1.Caption     := '';
  qrlSaT1.Caption    := '';
  qrlSalT1.Caption   := '';
  qrlPT2.Caption     := '';
  qrlST2.Caption     := '';
  qrlSaT2.Caption    := '';
  qrlSalT2.Caption   := '';
  qrlPT3.Caption     := '';
  qrlST3.Caption     := '';
  qrlSaT3.Caption    := '';
  qrlSalT3.Caption   := '';

  if (FazOrcam) and (TotQtOrc > 0) then
  begin
    qrlOrcado2.Caption := 'Total Orçado';
    qrlTQO.Caption     := IntToStr(TotQtOrc);
    qrlTHO.Caption     := IntToStr(TotHrOrc);
    qrlTotO.Caption    := FloatToStrF(TotCtOrc,ffFixed,12,0);

    if (TotCtOrc > 0) then
    begin
      qrlPT1.Caption := FloatToStrF((TotRes[1] + TotRes[2]) * 100 / TotCtOrc,ffFixed,4,0);
      qrlST1.Caption := '%';
    end;

    qrlSaT1.Caption  := 'Saldo';
    qrlSalT1.Caption := FloatToStrF(- (TotRes[1] + TotRes[2]) + TotCtOrc,ffFixed,12,0);

    if (TotCtOrc > 0) then
    begin
      qrlPT2.Caption := FloatToStrF((TotRes[1] + TotRes[2] + TotRes[3]) * 100 / TotCtOrc,ffFixed,4,0);
      qrlST2.Caption := '%';
    end;

    qrlSaT2.Caption  := 'Saldo';
    qrlSalT2.Caption := FloatToStrF(- (TotRes[1] + TotRes[2] + TotRes[3]) + TotCtOrc,ffFixed,12,0);

    if (TotCtOrc > 0) then
    begin
      qrlPT3.Caption := FloatToStrF((TotRes[1] + TotRes[2] + TotRes[3] + TotRes[4]) *
        100 / TotCtOrc,ffFixed,4,0);
      qrlST3.Caption := '%';
    end;

    qrlSaT3.Caption  := 'Saldo';
    qrlSalT3.Caption := FloatToStrF(- (TotRes[1] + TotRes[2] + TotRes[3] + TotRes[4]) +
      TotCtOrc,ffFixed,12,0);
  end;
  TotQtOrc := 0;
  TotHrOrc := 0;
  TotCtOrc := 0;
end;

procedure TrelResumoTrein.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
//  inherited;

end;

end.
