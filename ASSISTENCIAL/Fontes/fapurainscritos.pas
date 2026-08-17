unit fapurainscritos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, Grids, Wwdbigrd, Wwdbgrid, StdCtrls, Spin, IvDictio,
  IvMulti, IvEMulti, MAHlpBtn, Buttons, TB97Tlbr, TB97, ExtCtrls, Db,
  DBTables, Wwquery, Wwdatsrc, ComCtrls, checklst, UAdmAss, uDataBase;



type
  Tfrmapurainscritos = class(TfrmOkCancelar)
    GroupBox3: TGroupBox;
    Label6: TLabel;
    Label7: TLabel;
    GroupBox12: TGroupBox;
    dsplano: TwwDataSource;
    qryplano: TwwQuery;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    chkplano: TCheckListBox;
    cmbiniciomes: TComboBox;
    cmbfimmes: TComboBox;
    radiomensal: TRadioButton;
    radioanual: TRadioButton;
    inicioano: TSpinEdit;
    fimano: TSpinEdit;
    qryfaixas: TwwQuery;
    procedure FormShow(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure radioanualClick(Sender: TObject);
    procedure radiomensalClick(Sender: TObject);
  private

  public
    { Public declarations }

end;

var
  frmapurainscritos: Tfrmapurainscritos;
  contador,sequence :  integer;
  mes : boolean;


implementation

uses drelassistencial;

{$R *.DFM}



procedure Tfrmapurainscritos.FormShow(Sender: TObject);
var
  i : integer;
  dia, mes, ano : word;
begin
  inherited;
  decodedate(date, ano, mes, dia);
  radiomensal.Checked := true;
  cmbiniciomes.Text := cmbiniciomes.Items.Strings[0];
  cmbiniciomes.ItemIndex := 0;
  cmbfimmes.Text := cmbfimmes.Items.Strings[0];
  cmbfimmes.itemindex := 0;
  inicioano.text := inttostr(ano);
  fimano.text := inttostr(ano);
  sequence := 0;

  qryfaixas.open;
  qryplano.open;
  qryplano.first;
  for i:=0 to qryplano.recordcount-1 do
  begin
    chkplano.Items.Add(qryplano.fieldbyname('nome').asstring);
    qryplano.next;
  end;
end;

procedure Tfrmapurainscritos.bbtnConfirmarClick(Sender: TObject);
var
   fimes, iniciomes, anoinicio, anofim, i : integer;
   ssql, smesanoinicial, smesanofinal : string;
   fim, algunsplanos : boolean;
begin
  inherited;
  smesanoinicial := '';

  iniciomes := cmbiniciomes.ItemIndex + 1;
  fimes := cmbfimmes.itemindex + 1;
  anoinicio := inicioano.Value;
  anofim := fimano.Value;
  algunsplanos := false;
  for i:=0 to chkplano.items.count-1 do
  begin
    if chkplano.checked[i] then
    begin
       algunsplanos := true;
       break;
    end;
  end;

  if anoFim < anoInicio then
  begin
    messagedlg('Período Final menor que Perído Inicial!', mtInformation, [mbOK], 0);
    exit;
  end
  else
  begin
    if mes then
    begin
      sMesAnoInicial := intToStr(anoInicio);
      if iniciomes <= 9 then
         smesanoinicial := smesanoinicial + '/' + inttostr(0) + inttostr(iniciomes)
      else
         smesanoinicial := smesanoinicial + inttostr(anoinicio);

      smesanofinal:=inttostr(anofim);
      if fimes <= 9 then
         smesanofinal := smesanofinal + '/' + inttostr(0) + inttostr(fimes)
      else
         smesanofinal := smesanofinal + '/' + inttostr(fimes);

      fim := false;

      with qryfaixas do
      begin
        close;
        sql.clear;
        sql.add('Delete from faixas2');
        execsql;
      end;

      sequence := 0;
      repeat
        for i:=0 to chkplano.Items.Count-1 do
        begin
          if algunsplanos then
            if not (chkplano.Checked[i]) then
              continue;
          qryplano.Locate('nome',chkplano.Items.Strings[i],[]);

          with qryfaixas do
          begin
            inc(sequence);
            ssql := 'insert into Faixas2(idfaixas,mesano, idplanass) values ('+inttostr(sequence)+','+
                    quotedstr(smesanoinicial)+','+inttostr(qryplano.fieldbyname('idplanass').asinteger)+')';
            close;
            sql.clear;
            sql.Text:=ssql;
            execsql;
          end;
        end;

        if smesanoinicial = smesanofinal then
               fim := true
        else
               smesanoinicial := SanomesPosterior(smesanoinicial);

      until fim;
    end
    else
    if not mes then
    begin
      with qryfaixas do
      begin
        close;
        sql.clear;
        sql.add('Delete from Faixas2');
        execsql;
      end;
      sequence := 0;
      while anoinicio <= anofim do
      begin
        for i:=0 to chkplano.Items.Count-1 do
        begin
           if algunsplanos then
             if not (chkplano.checked[i]) then
               continue;
           qryplano.Locate('nome',chkplano.Items.Strings[i],[]);
           with qryfaixas do
           begin
              inc(sequence);
              ssql := 'insert into Faixas2(idfaixas,mesano, idplanass) values ('+
                    inttostr(sequence)+','+quotedstr(inttostr(anoinicio))+','+
                    inttostr(qryplano.fieldbyname('idplanass').asinteger)+')';
              close;
              sql.clear;
              sql.text := ssql;
              execsql;
           end;
        end;
        inc(anoinicio);
      end;
    end;
  end;
  contador := 0;
  ssql := 'SELECT PLANASS.NOME    PLAN, '+
                 'FAIXAS2.MESANO  PERIODO, '+
                 'INCTIT.QUANT    INCTIT, '+
                 'INCDEP.QUANT    INCDEP, '+
                 'NVL(INCTIT.QUANT, 0) + NVL(INCDEP.QUANT, 0) AS TOTALINC, '+
                 'INCTIT.QUANT + INCDEP.QUANT AS TOTALINC, '+
                 'EXCTIT.QUANT    EXCTIT, '+
                 'EXCDEP.QUANT    EXCDEP, '+
                 'NVL(EXCTIT.QUANT, 0) + NVL(EXCDEP.QUANT, 0) AS TOTALDEP, '+
                 'EXCTIT.QUANT + EXCDEP.QUANT AS TOTALDEP, '+
                 'NVL(TOTAL.QUANT,0)     TOTALINIC '+
        'FROM PLANASS, FAIXAS2, ' +
             '(SELECT F.IDFAIXAS, COUNT(*) QUANT '+
               ' FROM BENEFASS B, '+
                    ' PLANASS  PA, '+
                    ' FAIXAS2   F ';
  if mes then
    ssql := ssql + ' WHERE (TO_CHAR(B.DATAENTRADA,''YYYY/MM'') = RTRIM(F.MESANO))'+
                     ' AND (B.IDPLANASS = F.IDPLANASS)'+
                     ' AND (B.IDPLANASS = PA.IDPLANASS)'+
                     ' AND (B.IDTITULAR = B.IDDEPENDENTE)'+
                     ' GROUP BY  PA.IDPLANASS, F.IDFAIXAS) INCTIT,'+
                         ' (SELECT F.IDFAIXAS, PA.IDPLANASS, COUNT(*) QUANT'+
                            ' FROM BENEFASS B,'+
                                 ' PLANASS PA,'+
                                 ' FAIXAS2 F'+
                           ' WHERE (TO_CHAR(B.DATAENTRADA,''YYYY/MM'') = RTRIM(F.MESANO))'+
                             ' AND (B.IDPLANASS =  F.IDPLANASS)'+
                             ' AND (B.IDPLANASS =  PA.IDPLANASS)'+
                             ' AND (B.IDTITULAR <> B.IDDEPENDENTE)'+
                           ' GROUP BY PA.IDPLANASS, F.IDFAIXAS) INCDEP,'+
                         ' (SELECT PA.IDPLANASS, F.IDFAIXAS,'+
                                 ' COUNT(*) QUANT'+
                            ' FROM BENEFASS B,'+
                                 ' PLANASS PA, '+
                                 ' FAIXAS2 F ' +
                           ' WHERE (TO_CHAR(B.DATAENTRADA, ''YYYY/MM'') <= RTRIM(F.MESANO))'+
                             ' AND (TO_CHAR(DTCANCELAMENTO,''YYYY/MM'') = RTRIM(F.MESANO))'+
                             ' AND (B.IDPLANASS = F.IDPLANASS)'+
                             ' AND (B.IDPLANASS = PA.IDPLANASS)'+
                             ' AND (B.IDTITULAR = B.IDDEPENDENTE)'+
                           ' GROUP BY PA.IDPLANASS, F.IDFAIXAS) EXCTIT,'+
                         ' (SELECT PA.IDPLANASS, F.IDFAIXAS, COUNT(*) QUANT'+
                            ' FROM BENEFASS  B,'+
                                 ' PLANASS PA,'+
                                 ' FAIXAS2 F'+
                           ' WHERE (TO_CHAR(B.DATAENTRADA, ''YYYY/MM'') <= RTRIM(F.MESANO))'+
                             ' AND (TO_CHAR(B.DTCANCELAMENTO, ''YYYY/MM'') = RTRIM(F.MESANO))'+
                             ' AND (B.IDPLANASS  =   F.IDPLANASS)'+
                             ' AND (B.IDTITULAR  =  PA.IDPLANASS)'+
                             ' AND (B.IDTITULAR  <>  B.IDDEPENDENTE)'+
                           ' GROUP BY PA.IDPLANASS,  F.IDFAIXAS)  EXCDEP,'+
                         ' (SELECT IDPLANASS, COUNT(*) QUANT'+
                            ' FROM BENEFASS  B'+
                           ' WHERE (TO_CHAR(B.DATAENTRADA,''YYYY/MM'') < '+QUOTEDSTR(SMESANOINICIAL)+')' +
                             ' AND ((B.DTCANCELAMENTO IS NULL)'+
                                 ' OR (TO_CHAR(B.DTCANCELAMENTO,''YYYY/MM'')'+
                                       ' BETWEEN TO_CHAR(B.DATAENTRADA,''YYYY/MM'')'+
                                       ' AND '+QUOTEDSTR(SMESANOINICIAL)+'))'+
                           ' GROUP BY IDPLANASS) TOTAL'+
                         ' WHERE (FAIXAS2.IDFAIXAS  = INCTIT.IDFAIXAS(+))'+
                           ' AND (FAIXAS2.IDFAIXAS  = INCDEP.IDFAIXAS(+))'+
                           ' AND (FAIXAS2.IDFAIXAS  = EXCTIT.IDFAIXAS(+))'+
                           ' AND (FAIXAS2.IDFAIXAS  = EXCDEP.IDFAIXAS(+))'+
                           ' AND (FAIXAS2.IDPLANASS = PLANASS.IDPLANASS)'+
                           ' AND (FAIXAS2.IDPLANASS = TOTAL.IDPLANASS)'+
                         ' ORDER BY PLANASS.NOME, FAIXAS2.MESANO'
  else
    ssql := ssql + 'WHERE   TO_CHAR(B.DATAENTRADA,''YYYY'') = RTRIM(F.MESANO) '+
        '                  AND     (B.IDPLANASS  =  F.IDPLANASS) '+
        '                  AND     (B.IDPLANASS =  PA.IDPLANASS) '+
        '                  AND     (B.IDTITULAR  =  B.IDDEPENDENTE) '+
        '                  GROUP    BY  PA.IDPLANASS, F.IDFAIXAS) INCTIT, '+
        '        (SELECT  F.IDFAIXAS, PA.IDPLANASS, COUNT(*) QUANT '+
        '         FROM    BENEFASS      B, '+
        '                 PLANASS      PA, '+
        '                 FAIXAS2       F '+
        '         WHERE   TO_CHAR(B.DATAENTRADA,''YYYY'') = RTRIM(F.MESANO) '+
        '         AND     (B.IDPLANASS  =  F.IDPLANASS) '+
        '         AND     (B.IDPLANASS  =  PA.IDPLANASS) '+
        '         AND     (B.IDTITULAR  <> B.IDDEPENDENTE) '+
        '         GROUP   BY PA.IDPLANASS, F.IDFAIXAS) INCDEP, '+
        '        (SELECT  PA.IDPLANASS, F.IDFAIXAS, '+
        '                 COUNT(*)    QUANT '+
        '         FROM    BENEFASS    B, '+
        '                 PLANASS    PA, '+
        '                 FAIXAS2     F ' +
        '         WHERE   (TO_CHAR(B.DATAENTRADA, ''YYYY'') <= RTRIM(F.MESANO)) '+
        '         AND     (TO_CHAR(DTCANCELAMENTO,''YYYY'') = RTRIM(F.MESANO)) '+
        '         AND     (B.IDPLANASS = F.IDPLANASS) '+
        '         AND     (B.IDPLANASS = PA.IDPLANASS) '+
        '         AND     (B.IDTITULAR = B.IDDEPENDENTE) '+
        '         GROUP   BY PA.IDPLANASS, F.IDFAIXAS) EXCTIT, '+
        '        (SELECT  PA.IDPLANASS,  F.IDFAIXAS,  COUNT(*) QUANT '+
        '         FROM    BENEFASS  B, '+
        '                 PLANASS  PA, '+
        '                 FAIXAS2   F  '+
        '         WHERE TO_CHAR(B.DATAENTRADA, ''YYYY'') <= RTRIM(F.MESANO) '+
        '         AND   (TO_CHAR(B.DTCANCELAMENTO, ''YYYY'') = RTRIM(F.MESANO)) '+
        '         AND   (B.IDPLANASS  =   F.IDPLANASS) '+
        '         AND   (B.IDTITULAR  =  PA.IDPLANASS) '+
        '         AND   (B.IDTITULAR  <>  B.IDDEPENDENTE) '+
        '         GROUP  BY  PA.IDPLANASS,  F.IDFAIXAS)  EXCDEP, '+
        '         (SELECT IDPLANASS, COUNT(*)   QUANT '+
        '         FROM   BENEFASS  B '+
        '         WHERE  (TO_CHAR(B.DATAENTRADA,''yyyy'') < '+QUOTEDSTR(INTTOSTR(ANOINICIO))+')'+
        '         AND    ((B.DTCANCELAMENTO IS NULL) '+
        '         OR     (TO_CHAR(B.DTCANCELAMENTO,''YYYY'') '+
        '         BETWEEN TO_CHAR(B.DATAENTRADA,''YYYY'') '+
        '         AND    '+QUOTEDSTR(INTTOSTR(ANOINICIO))+')) '+
        '         GROUP  BY IDPLANASS) TOTAL '+
        ' WHERE    (FAIXAS2.IDFAIXAS  = INCTIT.IDFAIXAS(+)) '+
        ' AND      (FAIXAS2.IDFAIXAS  = INCDEP.IDFAIXAS(+)) '+
        ' AND      (FAIXAS2.IDFAIXAS  = EXCTIT.IDFAIXAS(+)) '+
        ' AND      (FAIXAS2.IDFAIXAS  = EXCDEP.IDFAIXAS(+)) '+
        ' AND      (FAIXAS2.IDPLANASS = PLANASS.IDPLANASS) '+
        ' AND      (FAIXAS2.IDPLANASS = PLANASS.IDPLANASS) '+
        ' AND      (FAIXAS2.IDPLANASS = TOTAL.IDPLANASS) '+
        ' ORDER    BY PLANASS.NOME, FAIXAS2.MESANO';
  with dtmrelassistencial.qryapurainscritos do
  begin
     close;
     sql.clear;
     sql.text := ssql;
     open;
  end;
  drelassistencial.acumulando := 0;
  dtmrelassistencial.rpapurainscritos.print;
end;

procedure Tfrmapurainscritos.radioanualClick(Sender: TObject);
begin
  inherited;
  cmbiniciomes.Enabled := false;
  cmbfimmes.Enabled := false;
  mes := false;
end;

procedure Tfrmapurainscritos.radiomensalClick(Sender: TObject);
begin
  inherited;
  cmbiniciomes.Enabled := true;
  cmbfimmes.Enabled := true;
  inicioano.Enabled := true;
  fimano.Enabled := true;
  mes := true;
end;

end.
