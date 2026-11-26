// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
//-------------------------------------------------------------------------------
//Alteração  : Alteração da Query. Trocar para ELEGPATRO para DEPENTIT
//Nº SIG.....: 97003
//Data.......: 29/01/2019
//Responsável: Rafael Vasconcelos
//Descrição..: Alteração da Query. Trocar para ELEGPATRO para DEPENTIT
//-------------------------------------------------------------------------------
//Alteração  : Criação da Funcionalidade
//Nº SIG.....: 26803
//Data.......: 08/03/2017
//Responsável: Andre.Imakawa
//Descrição..: Criado a funcionalidade devido problemas na exportação pelo
//             report builder.
//------------------------------------------------------------------------------

unit FParamContribPlano;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, TEdNum, MontaSelect, wwdblook, Db, DBTables,
  Wwquery, wwdbdatetimepicker, CMDateTimePicker, Mask, ppDB, ppDBPipe,
  ppComm, ppRelatv, ppProd, ppClass, ppReport, ppCtrls, ppBands, ppVar,
  ppPrnabl, ppCache, ppParameter, fPreview, Printers, DRelatAdmPREV2;

type
  TfrmParamContribPlano = class(TfrmOkCancelar)
    pnlParticipante: TPanel;
    Label3: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    cbbPatrocinadora: TComboBox;
    cbbPlano: TComboBox;
    edtMesCobr: TMaskEdit;
    btnImprimir: TButton;
    btnRel: TButton;
    btnRelTodo: TButton;
    btnImprTud: TButton;
    lblFormato: TLabel;
    rbPdf: TRadioButton;
    rbExcel: TRadioButton;
    rbTxt: TRadioButton;
    qryCount: TwwQuery;
    qryTot: TwwQuery;
    qryTotTOT_VALORESPERADO: TFloatField;
    qryTotTOT_VALORRECEBIDO: TFloatField;
    procedure AbreConsulta;
    procedure imprimeRelatPart(tipo: string);
    procedure btnRelClick(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
    procedure btnRelTodoClick(Sender: TObject);
    procedure btnImprTudClick(Sender: TObject);
    procedure rbPdfClick(Sender: TObject);
    procedure rbExcelClick(Sender: TObject);
    procedure rbTxtClick(Sender: TObject);
    procedure SaveToFile(DataSet: TDataSet; FileName, sTipo: String);
    procedure AbreConsultaTotal;

  private // Private declarations     

    numReg : Integer;
    sSQL : string;

  public  // Public declarations

  end;

  
 const NUM_CONT = 101968;
var
  frmParamContribPlano: TfrmParamContribPlano;

implementation
{$R *.DFM}
uses
  uSistema, UMensErro, UAdmPrev, fAguarde;


procedure TfrmParamContribPlano.AbreConsulta;
begin

    sSQL :=
    ' SELECT * FROM (' + #13#10 +
    ' SELECT ROWNUM LINHA, T.* FROM (' + #13#10 +
    ' SELECT DT.MATRICULA,' + #13#10 +  //Rafael SIG 97003
    '       H.IDPESSOA,' + #13#10 +
    '       H.NUMRECEBIMENTO,' + #13#10 +
    '       H.MESREFERENCIA,' + #13#10 +
    '       H.DATARECEBIMENTO,' + #13#10 +
    '       H.IDMOTIVO,' + #13#10 +
    '       H.VALOROP1,' + #13#10 +
    '       H.IDCONTRIBUICAO,' + #13#10 +
    '       PP.NOME PLANO,' + #13#10 +
    '       H.MESCOBRANCA,' + #13#10 +
    '       NVL(H.SALCONTRIB, 0),' + #13#10 +
    '       DECODE(H.FLGDEVOLUCAO, 0, H.VALORESPERADO, -H.VALORESPERADO) VALORESPERADO,' + #13#10 +
    '       DECODE(H.FLGDEVOLUCAO, 0, H.VALORRECEBIDO, -H.VALORRECEBIDO) VALORRECEBIDO,' + #13#10 +
    '       SUM(DECODE(HA.FLGTIPO, ''A'', HA.VALOR, -HA.VALOR)) ALTERADOR,' + #13#10 +
    '       C.NOME CONTRIBUICAO' + #13#10 +
    '  FROM HSTCONTRIBPREV H' + #13#10 +
    '  LEFT JOIN HSTATRASOCONTRIB HA' + #13#10 +
    '    ON HA.NUMRECEBIMENTO = H.NUMRECEBIMENTO' + #13#10 +
    '   AND HA.MESREFERENCIA = H.MESREFERENCIA' + #13#10 +
    '   AND HA.MESCOBRANCA = H.MESCOBRANCA' + #13#10 +
    '   AND HA.IDMOTIVO = H.IDMOTIVO' + #13#10 +
    '  JOIN DEPENTIT DT' + #13#10 +
    '    ON H.IDPESSOA = DT.IDPESSOA AND NVL(H.IDTITULAR,H.IDPESSOA) = DT.IDTITULAR' + #13#10 +  //Rafael SIG 97003
    '  JOIN CONTRIBUICAO C' + #13#10 +
    '    ON H.IDCONTRIBUICAO = C.IDCONTRIBUICAO' + #13#10 +
    '  LEFT JOIN PLANPREV PP' + #13#10 +
    '    ON H.IDPLANOPREV = PP.IDPLANOPREV' + #13#10 +
    ' WHERE DT.IDPESSOA = H.IDPESSOA' + #13#10 +
    '   AND C.IDCONTRIBUICAO = H.IDCONTRIBUICAO' + #13#10 +
    '   AND PP.IDPLANOPREV IN (66, 74, 2)' + #13#10 +
    '   AND H.IDPESSJUR IN (1, 91008)' + #13#10 +
    '   AND H.IDCONTRIBUICAO NOT IN (500, 259, 633, 697, 698, 702, 703, 733, 734, 738, 739) ' + #13#10 +
    '   AND H.VALORRECEBIDO > 0' + #13#10 +
    '   AND H.SITRECEBIMENTO IN (2, 3)' + #13#10 +
    //'   AND E.IDPESSJUR = H.IDPESSJUR' + #13#10 +  //Rafael SIG 97003
    '   AND H.MESCOBRANCA = '+ QuotedStr(copy(edtMesCobr.Text,0,4) +'/'+ copy(edtMesCobr.Text,5,2) )  + #13#10 +
    '   AND DECODE(H.IDPESSJUR, 1, ''FUNCEF'', 91008, ''CAIXA'') = UPPER('+QuotedStr(cbbPatrocinadora.Text) +')' + #13#10 +
    '   AND DECODE(PP.IDPLANOPREV, 66, ''REB'', 74, ''NOVO PLANO'', 2, ''REG/REPLAN'') = UPPER('+ QuotedStr(cbbPlano.Text) +')' + #13#10 +
    ' GROUP BY DT.MATRICULA,' + #13#10 +  //Rafael SIG 97003
    '       H.IDPESSOA,' + #13#10 +
    '       H.NUMRECEBIMENTO,' + #13#10 +
    '       H.MESREFERENCIA,' + #13#10 +
    '       H.DATARECEBIMENTO,' + #13#10 +
    '       H.IDMOTIVO,' + #13#10 +
    '       H.VALOROP1,' + #13#10 +
    '       H.IDCONTRIBUICAO,' + #13#10 +
    '       PP.NOME ,' + #13#10 +
    '       H.MESCOBRANCA,' + #13#10 +
    '       NVL(H.SALCONTRIB, 0),' + #13#10 +
    '       DECODE(H.FLGDEVOLUCAO, 0, H.VALORESPERADO, -H.VALORESPERADO) ,' + #13#10 +
    '       DECODE(H.FLGDEVOLUCAO, 0, H.VALORRECEBIDO, -H.VALORRECEBIDO) ,' + #13#10 +
    '       C.NOME'  + #13#10 +
    '     ) T ) ' ;


    qryCount.Close;
    qryCount.SQL.Clear;
    qryCount.SQL.Add('SELECT COUNT(1) NUMREG FROM ('+ sSQL +')');
    qryCount.Open;

    numReg := qryCount.FieldByName('NUMREG').AsInteger ;

    frmAguarde.Min := 0;
    frmAguarde.Max := numReg + 1;
    frmAguarde.Pos := 0;

    frmAguarde.Mostra('Relatório - Analítico de Contribuições por Plano');
end;

procedure TfrmParamContribPlano.imprimeRelatPart(tipo: string);
var
  ini, fim, x, c : Integer;
begin

  AbreConsulta;

  if numReg < NUM_CONT then
    x := 1
  else
    x := (numReg div NUM_CONT) + 1;

  ini := 0;
  fim := NUM_CONT;

  for c := 1 to x do
  begin
    with dtmRelatAdmPREV2 do
    begin
      qryContribPlano.Close;
      qryContribPlano.SQL.Clear;
      qryContribPlano.SQL.Add(sSQL);
      qryContribPlano.SQL.Add('WHERE LINHA BETWEEN '+ intToStr(ini) +' AND '+ intToStr(fim));
      qryContribPlano.Open;

      if tipo = 'PDF' then
      begin
        Screen.Cursor := crHourGlass;
        rpContribPlano.TextFileName := Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+ '\Relatório - parte '+intToStr(c)+' de '+intToStr(x)+'.pdf';
        rpContribPlano.AllowPrintToFile := True;
        rpContribPlano.ShowPrintDialog := False;
        rpContribPlano.DeviceType := 'PDFFile';
        rpContribPlano.Print;
      end
      else
      begin
        frmAguarde.Mostra('Relatório - parte '+intToStr(c)+' de '+intToStr(x));
       // TfrmPreview.CreateModalPreview( Application, rpContribPlano, 'Relatório - parte '+intToStr(c)+' de '+intToStr(x));
      end;
    end;
    ini := fim + 1;
    fim := fim + NUM_CONT;

  end;

end;

procedure TfrmParamContribPlano.btnRelClick(Sender: TObject);
begin
  inherited;
  imprimeRelatPart('tela');

  frmParamContribPlano.BringToFront;
end;

procedure TfrmParamContribPlano.btnImprimirClick(Sender: TObject);
begin
  inherited;
  imprimeRelatPart('PDF');

  MessageDlg('Sucesso', mtInformation, [mbok], 0);
end;

procedure TfrmParamContribPlano.btnRelTodoClick(Sender: TObject);
begin
  inherited;
  AbreConsulta;

  with dtmRelatAdmPREV2 do
  begin
    qryContribPlano.Close;
    qryContribPlano.SQL.Clear;
    qryContribPlano.SQL.Add(sSQL);
    qryContribPlano.Open;
    //TfrmPreview.CreateModalPreview( Application, rpContribPlano, 'Relatório');

  end;
   self.ModalResult := mrOK;
   
end;

procedure TfrmParamContribPlano.btnImprTudClick(Sender: TObject);
var
  caminho : string;
begin
  inherited;
  AbreConsulta;

  with dtmRelatAdmPREV2 do
  begin
    qryContribPlano.Close;
    qryContribPlano.SQL.Clear;
    qryContribPlano.SQL.Add(sSQL);
    qryContribPlano.Open;

    Screen.Cursor := crHourGlass;
    rpContribPlano.AllowPrintToFile := True;
    rpContribPlano.ShowPrintDialog := False;

    if (rbPdf.checked) then
    begin
      rpContribPlano.TextFileName := Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+ '\Relatório.pdf';
      rpContribPlano.DeviceType := 'PDFFile';

      rpContribPlano.Print;

    end
    else if (rbExcel.checked) or (rbTxt.checked)then
    begin
      if (rbExcel.checked) then
        SaveToFile(qryContribPlano, Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+ '\Relatório.csv','CSV')
      else
        SaveToFile(qryContribPlano, Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+ '\Relatório.txt','TXT')
    end;

  end;
  frmAguarde.Apaga;
  MessageDlg('O relatório foi gravado em '+Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa), mtInformation, [mbok], 0);

end;

procedure TfrmParamContribPlano.rbPdfClick(Sender: TObject);
begin
  inherited;
  rbExcel.checked := False;
  rbTxt.checked   := False;
  btnImprTud.caption := 'Imprimir PDF'
end;

procedure TfrmParamContribPlano.rbExcelClick(Sender: TObject);
begin
  inherited;
  rbPdf.checked := False;
  rbTxt.checked := False;
  btnImprTud.caption := 'Imprimir EXCEL'
end;

procedure TfrmParamContribPlano.rbTxtClick(Sender: TObject);
begin
  inherited;
  rbExcel.checked := False;
  rbPdf.checked   := False;
  btnImprTud.caption := 'Imprimir TXT'
end;
procedure TfrmParamContribPlano.SaveToFile(DataSet: TDataSet; FileName, sTipo: String);
var
  List: TStringList;
  S: String;
  I: Integer;
  Delimiter: Char;
  Enclosure: Char;
  function EscapeString(s: string): string;
  var
    i: Integer;
  begin
    Result := StringReplace(s,Enclosure,Enclosure+Enclosure,[rfReplaceAll]);
    if (Pos(Delimiter,s) > 0) OR (Pos(Enclosure,s) > 0) then  // Comment this line for enclosure in every fields
        Result := Enclosure+Result+Enclosure;
  end;
  function RPad(S: string; Ch: Char; Len: Integer): string;
  var   RestLen: Integer;
  begin   Result  := S;
    RestLen := Len - Length(s);
    if RestLen < 1 then Exit;
    Result := S + StringOfChar(Ch, RestLen);
  end;
  procedure AddHeader;
  var
    I: Integer;
  begin
    S := '';
    IF (sTipo = 'TXT') THEN
    begin
      List.Add('FUNDAÇÃO DOS ECONOMIÁRIOS FEDERAIS');
      List.Add('SCN, Quadra 2, Bloco A Edifício Corporate Financial Center 12º e 13º Andares');
      List.Add('Brasília  DF CEP 70.712-900 - (61) 3329-1700 - www.funcef.com.br');
      List.Add('RELATÓRIO - ANALÍTICO DE CONTRIBUIÇÕES POR PLANO');
      List.Add('');
    end;

    for I := 0 to DataSet.FieldCount - 1 do begin
      if S > '' then
        S := S + Delimiter;
        if (sTipo = 'TXT') then
        begin
          if (I = 10) then
            S := S + 'SAL CONTRIB     '
          else if (I = 14) then
            S := S + RPad(EscapeString(DataSet.Fields[I].FieldName),' ',40)
          else
            S := S + RPad(EscapeString(DataSet.Fields[I].FieldName),' ',16);
        end
        else
        begin
          if (I = 10) then
            S := S + EscapeString('SAL CONTRIB')
          else
            S := S + EscapeString(DataSet.Fields[I].FieldName);
        end;
    end;
    List.Add(S);
  end;
  procedure AddFooter;
  var
    I, X: Integer;

  begin
    S := '';
    AbreConsultaTotal;
    if (sTipo = 'TXT') then
    begin
      S := RPad('Total:',' ',187)+ qryTot.FieldByName('TOT_VALORESPERADO').AsString;
      X := (Length(S) + 17 - Length(qryTot.FieldByName('TOT_VALORESPERADO').AsString));
      S := RPad(S,' ', X) +  qryTot.FieldByName('TOT_VALORRECEBIDO').AsString;
    end
    else
    begin
      S := 'Total' + Delimiter + Delimiter + Delimiter + Delimiter + Delimiter + Delimiter + Delimiter + Delimiter + Delimiter + Delimiter + Delimiter;
      S := S + qryTot.FieldByName('TOT_VALORESPERADO').AsString;
      S := S + Delimiter + qryTot.FieldByName('TOT_VALORRECEBIDO').AsString;
    end;

    List.Add(S);
  end;
  procedure AddRecord;
  var
    I: Integer;
  begin
    S := '';
    for I := 0 to DataSet.FieldCount - 1 do begin
      if S > '' then
        S := S + Delimiter;
      if (sTipo = 'TXT') then
      begin
        if (I = 8) then
          S := S + RPad(DataSet.Fields[I].AsString,' ',16)
        else if (I = 14) then
          S := S + RPad(DataSet.Fields[I].AsString,' ',40)
        else
          S := S + RPad(EscapeString(DataSet.Fields[I].AsString),' ',16);
      end
      else
      begin
        if (I = 0) and (sTipo = 'CSV') then
          S := S +'="'+EscapeString(DataSet.Fields[I].AsString)+'"'
        else
          S := S + EscapeString(DataSet.Fields[I].AsString);
      end;
    end;
    List.Add(S);
  end;

begin

  if sTipo = 'CSV' then
  begin
    Delimiter := ';';
    Enclosure := '"';
  end
  else
  begin
    Delimiter := ' ';
  end;


  List := TStringList.Create;
  try
    DataSet.DisableControls;
    DataSet.First;
    AddHeader;  // Comment if header not required
    while not DataSet.Eof do begin
      AddRecord;
      DataSet.Next;
    end;
  finally
    AddFooter;
    List.SaveToFile(FileName);
    DataSet.First;
    DataSet.EnableControls;
    List.Free;
  end;
end;
procedure TfrmParamContribPlano.AbreConsultaTotal;
begin

    sSQL :=

    ' SELECT SUM(VALORESPERADO) TOT_VALORESPERADO, SUM(VALORRECEBIDO) TOT_VALORRECEBIDO FROM ' + #13#10 +
    ' (SELECT DECODE(H.FLGDEVOLUCAO, 0, H.VALORESPERADO, -H.VALORESPERADO) VALORESPERADO,' + #13#10 +
    '        DECODE(H.FLGDEVOLUCAO, 0, H.VALORRECEBIDO, -H.VALORRECEBIDO) VALORRECEBIDO' + #13#10 +
    '  FROM HSTCONTRIBPREV H' + #13#10 +
    '  LEFT JOIN HSTATRASOCONTRIB HA' + #13#10 +
    '    ON HA.NUMRECEBIMENTO = H.NUMRECEBIMENTO' + #13#10 +
    '   AND HA.MESREFERENCIA = H.MESREFERENCIA' + #13#10 +
    '   AND HA.MESCOBRANCA = H.MESCOBRANCA' + #13#10 +
    '   AND HA.IDMOTIVO = H.IDMOTIVO' + #13#10 +
    '  JOIN DEPENTIT DT' + #13#10 + //Rafael SIG 97003
    '    ON H.IDPESSOA = DT.IDPESSOA AND NVL(H.IDTITULAR,H.IDPESSOA) = DT.IDTITULAR' + #13#10 + //Rafael SIG 97003
    '  JOIN CONTRIBUICAO C' + #13#10 +
    '    ON H.IDCONTRIBUICAO = C.IDCONTRIBUICAO' + #13#10 +
    '  LEFT JOIN PLANPREV PP' + #13#10 +
    '    ON H.IDPLANOPREV = PP.IDPLANOPREV' + #13#10 +
    ' WHERE DT.IDPESSOA = H.IDPESSOA' + #13#10 + //Rafael SIG 97003
    '   AND C.IDCONTRIBUICAO = H.IDCONTRIBUICAO' + #13#10 +
    '   AND PP.IDPLANOPREV IN (66, 74, 2)' + #13#10 +
    '   AND H.IDPESSJUR IN (1, 91008)' + #13#10 +
    '   AND H.IDCONTRIBUICAO NOT IN (500, 259, 633, 697, 698, 702, 703, 733, 734, 738, 739) ' + #13#10 +
    '   AND H.VALORRECEBIDO > 0' + #13#10 +
    '   AND H.SITRECEBIMENTO IN (2, 3)' + #13#10 +
  //  '   AND E.IDPESSJUR = H.IDPESSJUR' + #13#10 + //Rafael SIG 97003
    '   AND H.MESCOBRANCA = '+ QuotedStr(copy(edtMesCobr.Text,0,4) +'/'+ copy(edtMesCobr.Text,5,2) )  + #13#10 +
    '   AND DECODE(H.IDPESSJUR, 1, ''FUNCEF'', 91008, ''CAIXA'') = UPPER('+QuotedStr(cbbPatrocinadora.Text) +')' + #13#10 +
    '   AND DECODE(PP.IDPLANOPREV, 66, ''REB'', 74, ''NOVO PLANO'', 2, ''REG/REPLAN'') = UPPER('+ QuotedStr(cbbPlano.Text) +')' + #13#10 +
    ' GROUP BY DT.MATRICULA,' + #13#10 + //Rafael SIG 97003
    '       H.IDPESSOA,' + #13#10 +
    '       H.NUMRECEBIMENTO,' + #13#10 +
    '       H.MESREFERENCIA,' + #13#10 +
    '       H.DATARECEBIMENTO,' + #13#10 +
    '       H.IDMOTIVO,' + #13#10 +
    '       H.VALOROP1,' + #13#10 +
    '       H.IDCONTRIBUICAO,' + #13#10 +
    '       PP.NOME ,' + #13#10 +
    '       H.MESCOBRANCA,' + #13#10 +
    '       NVL(H.SALCONTRIB, 0),' + #13#10 +
    '       DECODE(H.FLGDEVOLUCAO, 0, H.VALORESPERADO, -H.VALORESPERADO) ,' + #13#10 +
    '       DECODE(H.FLGDEVOLUCAO, 0, H.VALORRECEBIDO, -H.VALORRECEBIDO) ,' + #13#10 +
    '       C.NOME'  + #13#10 +
    '     ) T  ' ;
        
    qryTot.Close;
    qryTot.SQL.Clear;
    qryTot.SQL.Add( sSQL );
    qryTot.Open;

end;



end.
