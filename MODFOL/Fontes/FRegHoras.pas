unit FRegHoras;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, fOkCancelar,
  StdCtrls, Mask, DBCtrls, Buttons, Db, DBTables, Wwtable, Wwdatsrc, MAHlpBtn, TB97, Grids,
  Math, Wwquery, TB97Tlbr, IvDictio, IvMulti, IvEMulti, MontaSelect, uGImp, ExtCtrls,
  wwdbdatetimepicker, CMDateTimePicker;

type
  TfrmRegHoras = class(TfrmOkCancelar)
    ds: TwwDataSource;
    Panel2: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    lblSituacao: TLabel;
    sbtnProcurar: TSpeedButton;
    dbedMatric: TDBEdit;
    dbedNome: TDBEdit;
    stgrHoras: TStringGrid;
    Data1: TCMDateTimePicker;
    Data2: TCMDateTimePicker;
    Label3: TLabel;
    Label4: TLabel;
    tblParam: TwwTable;
    tblHorario: TwwTable;
    tblTurnoSem: TwwTable;
    tblTurnoDia: TwwTable;
    dsTur: TwwDataSource;
    gbxApuracao: TGroupBox;
    Label5: TLabel;
    Label6: TLabel;
    edAtraso: TEdit;
    edHoraExtra: TEdit;
    qryEstab: TwwQuery;
    Bevel1: TBevel;
    edDiurna: TEdit;
    edNoturna: TEdit;
    edFolga: TEdit;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    bbtnLancar: TBitBtn;
    qryFuncio: TwwQuery;
    Label11: TLabel;
    edAdicNot: TEdit;
    Bevel2: TBevel;
    qryFeriado: TwwQuery;
    gbxOpcEscala: TGroupBox;
    cbxSabado: TCheckBox;
    cbxDomingo: TCheckBox;
    cbxFeriadoOrd: TCheckBox;
    cbxFeriadoExtra: TCheckBox;
    bbtnSalvar: TBitBtn;
    bbtnCarregar: TBitBtn;
    SaveDlg: TSaveDialog;
    OpenDlg: TOpenDialog;
    rgLimiteDiurnas: TRadioGroup;
    qryFerias: TwwQuery;
    bbtnImprimir: TBitBtn;
    GImp: TGImp;
    MontaSelect: TMontaSelect;
    procedure sbtnProcurarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure stgrHorasDrawCell(Sender: TObject; Col, Row: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure stgrHorasSelectCell(Sender: TObject; Col, Row: Integer;
      var CanSelect: Boolean);
    procedure stgrHorasSetEditText(Sender: TObject; ACol, ARow: Integer;
      const Value: String);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure bbtnLancarClick(Sender: TObject);
    procedure qryFuncioAfterScroll(DataSet: TDataSet);
    procedure Data1Change(Sender: TObject);
    procedure Data2Change(Sender: TObject);
    procedure bbtnSalvarClick(Sender: TObject);
    procedure bbtnCarregarClick(Sender: TObject);
    procedure bbtnImprimirClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    ListaHoras: TStringList;                
    DiaNormalTrb: boolean;
    sAdNotIni, sAdNotFim, sAdNotF24: string;
    ArrayFeriado, ArrayAlmoco, ArrayIniAlmoco, ArrayFimAlmoco: variant;

    procedure RefazGrid;
    procedure LimpaGrid;
  end;

var
  frmRegHoras: TfrmRegHoras;

  iUltEstab, iLimAntec, iLimAposE, iPont, LinSel, ColSel, TotAtraso, TotAdicNot,
  TotExtra, TotExtr2, TotDiurno, TotNoturno, TotFolga, QtdRepouso: integer;

  CodDiaSem  : array[1..7] of string = ('D','S','T','Q','Q','S','S');
  TituGrid   : array[1..4] of string = ('Entrada Real', 'Entrada Normal',
                                        'Saída Normal', 'Saída Real');

implementation

uses fTelaAut, uMensErro, uFuncoesUteis, fLancaHoras;

{$R *.DFM}

procedure TfrmRegHoras.FormCreate(Sender: TObject);
begin
  inherited;
  tblParam.Open;
  tblHorario.Open;
  tblTurnoSem.Open;
  tblTurnoDia.Open;
  Data1.Date     := tblParam.FieldByName('NORMALINI').Value;
  Data2.Date     := tblParam.FieldByName('NORMALFIM').Value;
  Data1.OnChange := Data1Change;
  Data2.OnChange := Data2Change;
end;

procedure TfrmRegHoras.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  qryFuncio.Close;
end;

procedure TfrmRegHoras.FormShow(Sender: TObject);
begin
  inherited;
  sbtnProcurarClick(Self);
  RefazGrid;
end;

procedure TfrmRegHoras.sbtnProcurarClick(Sender: TObject);
begin
  //inherited;
  stgrHoras.Visible := false;

  MontaSelect.Executar;

  if (MontaSelect.RetornouValor) then
  begin
    qryFuncio.Close;
    qryFuncio.ParamByName('IdPessoa').asString := MontaSelect.ValoresChave[0];
    qryFuncio.Open;
  end;

  sbtnProcurar.down    := false;
  stgrHoras.Visible    := true;
  gbxOpcEscala.Visible := (tblHorario.FieldByName('FLGTIPOHORARIO').Value = 1);
  RefazGrid;
end;

procedure TfrmRegHoras.RefazGrid;
var
  iCol, iLin, TotHoras, SvLin: integer;
  Hora1, Hora2{, Resto}: double;
  DataPesq: TDate;
begin
//  stgrHoras.OnDrawCell := Nil;

  qryFerias.Close;
  qryFerias.ParamByName('IdPessoa').asString := qryFuncio.FieldByName('IDPESSOA').asString;
  qryFerias.ParamByName('Data1').Value       := Data1.Date;
  qryFerias.ParamByName('Data2').Value       := Data2.Date;
  qryFerias.Open;

  with (qryFeriado) do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT DATAFERIADO, FLGTIPO');
    SQL.Add('FROM FERIADOS');
    SQL.Add('WHERE');
    SQL.Add('  (DATAFERIADO >= TO_DATE('+QuotedStr(Data1.Text)+',''DD/MM/YYYY'')) AND');
    SQL.Add('  (DATAFERIADO <= TO_DATE('+QuotedStr(Data2.Text)+',''DD/MM/YYYY'')) AND');
    SQL.Add('  (IDPAIS       = '+qryFuncio.FieldByName('IDPAIS').asString+') AND');
    SQL.Add('  (((FLGAMBITO  = ''M'') AND (IDCIDADES = '+qryFuncio.FieldByName('IDCIDADES').asString+')) OR');
    SQL.Add('   ((FLGAMBITO  = ''E'') AND (CODESTADO = '+QuotedStr(qryFuncio.FieldByName('UF').asString)+')) OR');
    SQL.Add('   (FLGAMBITO   = ''F''))');
    SQL.Add('ORDER BY');
    SQL.Add('  DATAFERIADO, FLGTIPO');
    Open;
  end;

  ArrayFeriado   := VarArrayCreate([0,Round(Data2.Date - Data1.Date)],varVariant);
  ArrayAlmoco    := VarArrayCreate([0,Round(Data2.Date - Data1.Date)],varVariant);
  ArrayIniAlmoco := VarArrayCreate([0,Round(Data2.Date - Data1.Date)],varVariant);
  ArrayFimAlmoco := VarArrayCreate([0,Round(Data2.Date - Data1.Date)],varVariant);

  iLin := 0;
  while (iLin <= Round(Data2.Date - Data1.Date)) do
  begin
    SvLin                 := iLin; // isto foi criado porque qryFeriado.Locate ferrava o iLin
    ArrayAlmoco[SvLin]    := 0;
    ArrayIniAlmoco[SvLin] := ' ';
    ArrayFimAlmoco[SvLin] := ' ';
    ArrayFeriado[SvLin]   := ' ';

    if (DayOfWeek(Data1.Date + SvLin) = 1) then
      ArrayFeriado[SvLin] := 'D';
    if (DayOfWeek(Data1.Date + SvLin) = 7) then
      ArrayFeriado[SvLin] := 'S';
    if (qryFeriado.Locate('DATAFERIADO',Data1.Date + SvLin,[])) then
      ArrayFeriado[SvLin] := qryFeriado.FieldByName('FLGTIPO').Value;

    iLin := SvLin;
    Inc(iLin);
  end;

//  Resto              := 0;
  stgrHoras.RowCount := Round(Data2.Date - Data1.Date + 2);

  // Coloca o Título nas Colunas
  for iCol:=1 to 4 do
    stgrHoras.Cells[iCol, 0] := TituGrid[iCol];

  // Coloca as Datas + a 1ª Letra do Dia da Semana nas Linhas
  for iLin:=1 to (stgrHoras.RowCount - 1) do
    stgrHoras.Cells[0, iLin] := DateToStr(Data1.Date + iLin - 1) +' '+
      CodDiaSem[DayOfWeek(Data1.Date + iLin - 1)];

  QtdRepouso:=0; iLin:=1;
  while (iLin <= (stgrHoras.RowCount - 1)) do
  begin
    SvLin := iLin; // isto foi criado porque qryFeriado.Locate ferrava o iLin

    for iCol:=2 to 3 do
    begin
      DataPesq := Data1.Date + SvLin - 1;
      if (tblHorario.EOF) then
      begin
        if ((DayOfWeek(Data1.Date + SvLin - 1) = 1) or
            (DayOfWeek(Data1.Date + SvLin - 1) = 7)) or
            (qryFeriado.Locate('DATAFERIADO',Data1.Date + SvLin - 1,[])) then
        begin
          stgrHoras.Cells[iCol, SvLin] := '';
          if (iCol = 2) and (DayOfWeek(Data1.Date + SvLin - 1) <> 7) then
          begin
            Inc(QtdRepouso);
            if (ArrayFeriado[SvLin - 1] = 'E') then
              Dec(QtdRepouso);
          end;
        end
        else
          stgrHoras.Cells[iCol, SvLin] :=  'Indefinido';
      end
      else
      begin
        if (tblHorario.FieldByName('FLGTIPOHORARIO').Value = 0) then
        begin
          if (not qryFeriado.Locate('DATAFERIADO',DataPesq,[])) and
             (tblTurnoSem.FindKey([DayOfWeek(DataPesq),
              qryFuncio.FieldByName('IDHORARIO').Value])) then
          begin
            if (iCol = 2) then
            begin
              stgrHoras.Cells[iCol, SvLin] := tblTurnoDia.FieldByName('INICIOEXPEDIENTE').Value;
              if (tblTurnoDia.FieldByName('INICIOALMOCO').asString <> '') then
              begin
                ArrayAlmoco[SvLin - 1] :=
                  (StrInt(Copy(tblTurnoDia.FieldByName('FINALALMOCO').asString,1,2)) -
                   StrInt(Copy(tblTurnoDia.FieldByName('INICIOALMOCO').asString,1,2))) * 60 +
                   (StrInt(Copy(tblTurnoDia.FieldByName('FINALALMOCO').asString,4,2)) -
                    StrInt(Copy(tblTurnoDia.FieldByName('INICIOALMOCO').asString,4,2)));
                ArrayIniAlmoco[SvLin - 1] :=
                  Trim(tblTurnoDia.FieldByName('INICIOALMOCO').asString);
                ArrayFimAlmoco[SvLin - 1] :=
                  Trim(tblTurnoDia.FieldByName('FINALALMOCO').asString);
              end;
            end
            else
              stgrHoras.Cells[iCol, SvLin] := tblTurnoDia.FieldByName('FINALEXPEDIENTE').Value;
          end
          else
          begin
            stgrHoras.Cells[iCol, SvLin] := '';
            if (iCol = 2) and (DayOfWeek(Data1.Date + SvLin - 1) <> 7) then
            begin
              Inc(QtdRepouso);
              if (ArrayFeriado[SvLin - 1] = 'E') then
                Dec(QtdRepouso);
            end;
          end;
        end
        else
        begin  // Escala Rotativa
          if (iCol = 2) and
             ((DayOfWeek(Data1.Date + SvLin - 1) = 1) or
              (qryFeriado.Locate('DATAFERIADO',Data1.Date + SvLin - 1,[])) and
              (qryFeriado.FieldByName('FLGTIPO').Value <> 'E')) then
            Inc(QtdRepouso);

          if (iCol = 2) then
            Continue;
          if (qryFuncio.FieldByName('DATAREFHORARIO').Value = Null) then
          begin
            stgrHoras.Visible := false;
            MsgDlg('Falta a Data Ref. do Horário da Pessoa !','Aviso', mtInformation,[mbOk,mbHelp],0);
            Exit;
          end
          else
          begin
            //TotHoras := 0;
            if (SvLin = 1) then
            begin
              TotHoras := tblHorario.FieldByName('HORASFOLGA1').Value +
                tblHorario.FieldByName('HORASSERVICO').Value +
                tblHorario.FieldByName('HORASFOLGA2').Value;
            end;
            Hora1 := ((Data1.Date + SvLin - 1 -
              qryFuncio.FieldByName('DATAREFHORARIO').Value) * 24 mod TotHoras) +
              tblHorario.FieldByName('HORASFOLGA1').Value;

            if (Hora1  < 24) then
            begin
              Hora2 := Hora1 + tblHorario.FieldByName('HORASSERVICO').Value;

              if (Hora2 > 24) then
                Hora2 := Hora2 - 24;

              stgrHoras.Cells[2, SvLin] :=
                ColocaZeros(IntToStr(Round(Hora1)), 2) + ':' +
                ColocaZeros(IntToStr(Round(frac(Hora1) * 60)), 2);
              stgrHoras.Cells[3, SvLin] :=
                ColocaZeros(IntToStr(Round(Hora2)), 2) + ':' +
                ColocaZeros(IntToStr(Round(frac(Hora2) * 60)), 2);

              // if  Hora2 = 24  then  Hora2 := 0;
              //Hora1 := 0;
            end
            else
            begin
              stgrHoras.Cells[2, SvLin] := '';
              stgrHoras.Cells[3, SvLin] := '';
            end;
          end;
        end;
      end;
      if (iCol = 3) and (not qryFerias.IsEmpty) and
         (Data1.Date + SvLin - 1 >= qryFerias.FieldByName('INIGOZOFERIAS').Value) and
         (Data1.Date + SvLin - 1 <= qryFerias.FieldByName('FIMGOZOFERIAS').Value) then
      begin
        stgrHoras.Cells[2, SvLin] :=  '';
        stgrHoras.Cells[3, SvLin] :=  '';
      end;
    end;
    iLin := SvLin;
    inc(iLin);
  end;
//  stgrHoras.OnDrawCell := stgrHorasDrawCell;
//  PrimVez := false;
  stgrHoras.SetFocus;
end;

procedure TfrmRegHoras.stgrHorasDrawCell(Sender: TObject; Col, Row: Integer; Rect: TRect;
  State: TGridDrawState);
{var
  LargTexto, Rw, Cl : Integer;
  Achei : Boolean;}
begin
  inherited;
{  Rw := Row;
  Cl := Col;
  LargTexto := stgrHoras.Canvas.TextWidth(stgrHoras.Cells[Cl,Rw]);
  if  (Rw > 0) and ((Cl = 2) or (Cl = 3))  then begin
      if  (tblHorario.EOF)  then begin
          if  ((DayOfWeek(Data1.Date + Rw - 1) = 1) or
               (DayOfWeek(Data1.Date + Rw - 1) = 7))
          then  stgrHoras.Cells[Cl, Rw] :=  ''
          else  stgrHoras.Cells[Cl, Rw] :=  'Indefinido';
      end
      else  begin
            if  (tblHorario.FieldByName('FLGTIPOHORARIO').Value = 0)  then begin
                if  (tblTurnoSem.FindKey([DayOfWeek(Data1.Date + Rw - 1),
                                         qryFuncio.FieldByName('IDHORARIO').Value]))
                then  begin
                    if  Cl = 2
                    then  stgrHoras.Cells[Cl, Rw] :=
                          tblTurnoDia.FieldByName('INICIOEXPEDIENTE').Value
                    else  stgrHoras.Cells[Cl, Rw] :=
                          tblTurnoDia.FieldByName('FINALEXPEDIENTE').Value;
                end
                else  stgrHoras.Cells[Cl, Rw] :=  '';
            end
            else  begin  // Escala Rotativa
            end;
      end;

  end; }
end;

procedure TfrmRegHoras.stgrHorasSelectCell(Sender: TObject; Col, Row: Integer; var CanSelect: Boolean);
begin
  inherited;
  CanSelect := ((Col = 1) or (Col = 4)) and (Row > 0);
end;

procedure TfrmRegHoras.stgrHorasSetEditText(Sender: TObject; ACol, ARow: Integer;
  const Value: String);
var
  Posic: byte;
begin
  inherited;
  if (Length(Trim(Value)) < 3) then
    exit;

  Posic := Pos(':',Value);

  if (Posic <> 3) or (Length(Trim(Value)) > 5) then
    MsgDlg('Informe Horário no Formato HH:MM','Aviso', mtInformation,[mbOk,mbHelp],0);
end;

procedure TfrmRegHoras.bbtnConfirmarClick(Sender: TObject);
var
  sDifer, sNormal, sSql, sEntra, sSaida: string;
  iCol, iLin, QtMin, iLimAnt, iLimApo, iLimite: integer;
begin
  inherited;
  TotAtraso:=0; TotAdicNot:=0; TotExtra:=0; TotExtr2:=0; TotDiurno:=0;
  TotNoturno:=0; TotFolga:= 0; iLimite:=0; 

  if (qryFuncio.FieldByName('IDESTAB').asInteger <> iUltEstab) then
  begin
    sSql := 'SELECT IDFILIALPESSOA, EXTRADIURNOINI, EXTRADIURNOFIM, '+
            '       ADICNOTURINI, ADICNOTURFIM ' +
            'FROM   FILIALPESSOA ' +
            'WHERE  IDFILIALPESSOA = ' +qryFuncio.FieldByName('IDESTAB').asString;
    qryEstab.SQL.Clear;
    qryEstab.SQL.Add(sSQL);
    qryEstab.Open;

    iUltEstab := qryFuncio.FieldByName('IDESTAB').asInteger;
    iLimAntec := qryEstab.FieldByName('EXTRADIURNOINI').asInteger;
    iLimAposE := qryEstab.FieldByName('EXTRADIURNOFIM').asInteger;
    sAdNotIni := qryEstab.FieldByName('ADICNOTURINI').asString;
    sAdNotFim := qryEstab.FieldByName('ADICNOTURFIM').asString;
    sAdNotF24 := IntToStr(StrInt(Copy(sAdNotFim,1,2)) + 24) + Copy(sAdNotFim,3,3);
    qryEstab.Close;
  end;

  for iLin:=1 to (stgrHoras.RowCount - 1) do
    for iCol:=2 to 3 do
    begin
      if (stgrHoras.Cells[iCol, iLin] = '') and
         (((stgrHoras.Cells[1, iLin]  = '') and (stgrHoras.Cells[4, iLin] <> '')) or
          ((stgrHoras.Cells[1, iLin] <> '') and (stgrHoras.Cells[4, iLin]  = ''))) then
      begin
        MsgDlg('Complete ou Limpe o Horário no Dia ' + stgrHoras.Cells[0, iLin],'Aviso',
               mtInformation,[mbOk,mbHelp],0);
        gbxApuracao.Visible := false;
        exit;
      end;

      if (iCol = 2) then
      begin
        case (rgLimiteDiurnas.ItemIndex) of
          0 : iLimite := iLimAntec;
          1 : iLimite := iLimAposE;
        end;

        sEntra := Trim(stgrHoras.Cells[2, iLin]);

        if (stgrHoras.Cells[1, iLin] <> '') then
          sEntra := Trim(stgrHoras.Cells[1, iLin]);

        sSaida := Trim(stgrHoras.Cells[3, iLin]);

        if (stgrHoras.Cells[4, iLin] <> '') then
          sSaida := Trim(stgrHoras.Cells[4, iLin]);

        if (sSaida = '') and (sEntra = '') then
          Continue;

        if (sEntra < sAdNotFim) then
          if (sSaida > sAdNotFim) then
            TotAdicNot := TotAdicNot +
              (StrInt(Copy(sAdNotFim,1,2)) - StrInt(Copy(sEntra,1,2))) * 60 +
              (StrInt(Copy(sAdNotFim,4,2)) - StrInt(Copy(sEntra,4,2)))
          else
            TotAdicNot := TotAdicNot +
              (StrInt(Copy(sSaida,1,2)) - StrInt(Copy(sEntra,1,2))) * 60 +
              (StrInt(Copy(sSaida,4,2)) - StrInt(Copy(sEntra,4,2)));

        if (sSaida < sEntra) then
          sSaida := IntToStr(StrInt(Copy(sSaida,1,2)) + 24) + Copy(sSaida,3,3);

        if (sEntra > sAdNotIni) then
          sAdNotIni := sEntra;

        if (sSaida > sAdNotIni) then
          if (sSaida < sAdNotF24) then
            TotAdicNot := TotAdicNot +
              (StrInt(Copy(sSaida,1,2)) - StrInt(Copy(sAdNotIni,1,2))) * 60 +
              (StrInt(Copy(sSaida,4,2)) - StrInt(Copy(sAdNotIni,4,2)))
          else
            TotAdicNot := TotAdicNot +
              (StrInt(Copy(sAdNotF24,1,2)) - StrInt(Copy(sAdNotIni,1,2))) * 60 +
              (StrInt(Copy(sAdNotF24,4,2)) - StrInt(Copy(sAdNotIni,4,2)));
      end;

      if (stgrHoras.Cells[1, iLin] = '') and (stgrHoras.Cells[4, iLin] = '') then
        Continue;

      if ((iCol = 2) and (stgrHoras.Cells[1, iLin] = '')) or
         ((iCol = 3) and (stgrHoras.Cells[4, iLin] = '')) then
        Continue;

      if ((iCol = 3) and (stgrHoras.Cells[3, iLin] = '')) then
        Continue;

      QtMin   := 0;
      sNormal := Trim(stgrHoras.Cells[iCol, iLin]);

      if (iCol = 2) and (stgrHoras.Cells[2, iLin] = '') then
        sNormal := Trim(stgrHoras.Cells[4, iLin]);

      if (iCol = 3) and (stgrHoras.Cells[3, iLin] <> '') and
        (stgrHoras.Cells[3, iLin] < stgrHoras.Cells[4, iLin]) and
        (stgrHoras.Cells[3, iLin] < stgrHoras.Cells[2, iLin]) then
        sNormal := IntToStr(StrInt(Copy(sNormal,1,2)) + 24) + Copy(sNormal,3,3);

      if (iCol = 2) and (stgrHoras.Cells[1, iLin] <> '') then
      begin
        sDifer := Trim(stgrHoras.Cells[1, iLin]);
        QtMin  := (StrInt(Copy(sNormal,1,2)) - StrInt(Copy(sDifer,1,2))) * 60 +
                  (StrInt(Copy(sNormal,4,2)) - StrInt(Copy(sDifer,4,2)));

        if (stgrHoras.Cells[3, iLin] = '') and (QtMin < 0) and
           (Trim(stgrHoras.Cells[4, iLin]) <  Trim(stgrHoras.Cells[1, iLin])) then
          if (MsgDlg('Confirma que a Saída no Dia ' + stgrHoras.Cells[0, iLin] +
                     ' é Hora Extra ?','Confirmação', mtConfirmation,[mbYes,mbNo,mbHelp],0) <> mrNo) then
            QtMin := 24*60 + QtMin;

      end;

      if (iCol = 3) and (stgrHoras.Cells[4, iLin] <> '') then
      begin
        sDifer := Trim(stgrHoras.Cells[4, iLin]);
        QtMin  := (- StrInt(Copy(sNormal,1,2)) + StrInt(Copy(sDifer,1,2))) * 60 +
                  (- StrInt(Copy(sNormal,4,2)) + StrInt(Copy(sDifer,4,2)));
        if (stgrHoras.Cells[3, iLin] <> '') and (QtMin < 0) and
           (Trim(stgrHoras.Cells[4, iLin]) <  Trim(stgrHoras.Cells[2, iLin])) then
          if (Trim(stgrHoras.Cells[4, iLin]) >  Trim(stgrHoras.Cells[3, iLin])) or
             (MsgDlg('Confirma que a Saída no Dia ' + stgrHoras.Cells[0, iLin] +
                      ' é Hora Extra ?','Confirmação', mtConfirmation,[mbYes,mbNo,mbHelp],0) <> mrNo) then
            QtMin := 24*60 + QtMin;

      end;

      if (stgrHoras.Cells[iCol, iLin] = '') and (QtMin <= 0) then
      begin
        MsgDlg('Horário Incompatível no Dia ' + stgrHoras.Cells[0, iLin],'Aviso',
               mtInformation,[mbOk,mbHelp],0);
        gbxApuracao.Visible := false;
        exit;
      end;

      iLimAnt := iLimAntec;
      iLimApo := iLimAposE;

      DiaNormalTrb := ((tblHorario.FieldByName('FLGTIPOHORARIO').Value = 0) and
                       (ArrayFeriado[iLin - 1] = 'E')) or
                      ((tblHorario.FieldByName('FLGTIPOHORARIO').Value = 1) and
                       (((not cbxSabado.Checked)       and (ArrayFeriado[iLin - 1] = 'S')) or
                        ((not cbxDomingo.Checked)      and (ArrayFeriado[iLin - 1] = 'D')) or
                        ((not cbxFeriadoOrd.Checked)   and (ArrayFeriado[iLin - 1] = 'O')) or
                        ((not cbxFeriadoExtra.Checked) and (ArrayFeriado[iLin - 1] = 'E')) or
                        (ArrayFeriado[iLin - 1] = ' ')));

      if (tblHorario.FieldByName('FLGTIPOHORARIO').Value = 1) and (not DiaNormalTrb) then
      begin
        iLimAnt := 0;
        iLimApo := 0;
        iLimite := 0;
      end;

      if (QtMin < 0) then
      begin
        TotAtraso := TotAtraso - QtMin;

        if ((iCol = 2) and (ArrayAlmoco[iLin-1] > 0) and (sDifer > ArrayFimAlmoco[iLin-1])) or
           ((iCol = 3) and (ArrayAlmoco[iLin-1] > 0) and (sDifer < ArrayIniAlmoco[iLin-1])) then
          TotAtraso := TotAtraso - ArrayAlmoco[iLin-1];
      end
      else
      begin
        TotExtr2 := TotExtr2 + QtMin;

        if (iCol = 2) and (stgrHoras.Cells[2, iLin] = '') and (not DiaNormalTrb) then
          TotFolga := TotFolga + QtMin;

        if (iCol = 2) and ((stgrHoras.Cells[2, iLin] <> '') or (DiaNormalTrb)) then
        begin
          if (rgLimiteDiurnas.ItemIndex = 2) then
          begin
            if (QtMin <= iLimAnt) then
              TotDiurno := TotDiurno + QtMin
            else
            begin
              TotDiurno  := TotDiurno + iLimAnt;
              TotNoturno := TotNoturno + QtMin - iLimAnt;
            end;
          end
          else
          begin
            if (QtMin <= iLimite) then
            begin
              TotDiurno := TotDiurno + QtMin;
              iLimite   := iLimite   - QtMin;
            end
            else
            begin
              TotDiurno  := TotDiurno  + iLimite;
              TotNoturno := TotNoturno + QtMin - iLimite;
              iLimite    := 0;
            end;
          end;
        end;

        if (iCol = 3) and (stgrHoras.Cells[3, iLin] <> '') then
        begin
          if (rgLimiteDiurnas.ItemIndex = 2) then
          begin
            if (QtMin <= iLimApo) then
              TotDiurno := TotDiurno + QtMin
            else
            begin
              TotDiurno  := TotDiurno + iLimApo;
              TotNoturno := TotNoturno + QtMin - iLimApo;
            end;
          end
          else
          begin
            if (QtMin <= iLimite) then
              TotDiurno := TotDiurno + QtMin
            else
            begin
              TotDiurno  := TotDiurno + iLimite;
              TotNoturno := TotNoturno + QtMin - iLimite;
            end;
          end;
        end;
      end;
  end;

  edAtraso.Text    := IntToStr(TotAtraso)  + ' min';
  edAdicNot.Text   := IntToStr(TotAdicNot) + ' min';
  edHoraExtra.Text := IntToStr(TotExtr2)   + ' min';
  edDiurna.Text    := IntToStr(TotDiurno)  + ' min';
  edNoturna.Text   := IntToStr(TotNoturno) + ' min';
  edFolga.Text     := IntToStr(TotFolga)   + ' min';
  gbxApuracao.Visible := true;
  bbtnLancar.Enabled  := true;
end;

procedure TfrmRegHoras.LimpaGrid;
var
  iLin: integer;
begin
  for iLin:=1 to (stgrHoras.RowCount - 1) do
  begin
    stgrHoras.Cells[1, iLin] := '';
    stgrHoras.Cells[4, iLin] := '';
    bbtnLancar.Enabled       := false;
  end;
end;

procedure TfrmRegHoras.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  LimpaGrid;
end;

procedure TfrmRegHoras.bbtnLancarClick(Sender: TObject);
begin
  inherited;
  AbrirFormModal(frmLancaHoras, TfrmLancaHoras);
end;

procedure TfrmRegHoras.qryFuncioAfterScroll(DataSet: TDataSet);
begin
  inherited;
  gbxApuracao.Visible := false;
  LimpaGrid;
  stgrHoras.Visible   := true;
  lblSituacao.Caption := '';

  if (qryFuncio.FieldByName('TIPOSIT').Value = 'D') then
  begin
    lblSituacao.Caption    := '(Demitid';
    lblSituacao.Font.Color := clRed;
  end
  else
  if (qryFuncio.FieldByName('TIPOSIT').Value = 'A') then
  begin
    lblSituacao.Caption    := '(Ativ';
    lblSituacao.Font.Color := clBlue;
  end
  else
  if (qryFuncio.FieldByName('TIPOSIT').Value = 'F') then
  begin
    lblSituacao.Caption    := '(Afastad';
    lblSituacao.Font.Color := clGreen;
  end;

  if (qryFuncio.FieldByName('SEXO').Value = 'M') then
    lblSituacao.Caption := lblSituacao.Caption + 'o)'
  else
    lblSituacao.Caption := lblSituacao.Caption + 'a)';
end;

procedure TfrmRegHoras.Data1Change(Sender: TObject);
begin
  inherited;
  RefazGrid;
end;

procedure TfrmRegHoras.Data2Change(Sender: TObject);
begin
  inherited;
  RefazGrid;
end;

procedure TfrmRegHoras.bbtnSalvarClick(Sender: TObject);
var
  iLin: integer;
begin
  inherited;
  if (SaveDlg.Execute) then
  begin
    ListaHoras := TStringList.Create;

    for iLin:=0 to (stgrHoras.RowCount - 1) do
      ListaHoras.Add(stgrHoras.Rows[iLin].Text);

    ListaHoras.SaveToFile(savedlg.FileName);
    ListaHoras.Free;
  end;
end;

procedure TfrmRegHoras.bbtnCarregarClick(Sender: TObject);
var
  iCol, iLin: integer;
begin
  inherited;
  if (OpenDlg.Execute) then
  begin
    ListaHoras := TStringList.Create;
    ListaHoras.LoadFromFile(OpenDlg.FileName);

    for iLin:=0 to (stgrHoras.RowCount - 1) do
      for iCol:=0 to 5 do
        if (iCol < 5) then
          stgrHoras.Cells[iCol,iLin] := ListaHoras.Strings[iLin*6 + iCol];

    ListaHoras.Free;
  end;
end;

procedure TfrmRegHoras.bbtnImprimirClick(Sender: TObject);
var
  iLin: integer;
begin
  inherited;
    GImp.ConfigurarImpressora;
    if (GImp.Inicializar) then
    begin
      GImp.EjetarPagina           := true;
      GImp.SaltodeLinhaCondensado := false;
      GImp.TipoFonte              := TfNormal;
      GImp.Condensado             := false;
      GImp.Sublinhado             := false;
      
      GImp.ImprimirTexto('      Matrícula: ' + dbedMatric.Text);
      GImp.ImprimirTexto('      Nome.....: ' + dbedNome.Text);
      GImp.ImprimirTexto('      Período..: ' + Data1.Text + ' a ' + Data2.Text);
      GImp.ImprimirTexto(' ');
      GImp.ImprimirTexto('          Data      Entrada Real  Entrada Normal' +
                         ' Saída Normal  Saída Real' );
      for iLin:=1 to (stgrHoras.RowCount - 1) do
        GImp.ImprimirTexto('      ' +
          Copy(stgrHoras.Cells[0,iLin] + Replicate(' ',15),1,15) +
          Copy(stgrHoras.Cells[1,iLin] + Replicate(' ',15),1,15) +
          Copy(stgrHoras.Cells[2,iLin] + Replicate(' ',15),1,15) +
          Copy(stgrHoras.Cells[3,iLin] + Replicate(' ',15),1,15) +
          Copy(stgrHoras.Cells[4,iLin] + Replicate(' ',15),1,15));
      GImp.Finalizar;
    end
    else
      MessageDlg('Verifique a Impressora.', mtWarning, [mbOk], 0);
end;

end.
