unit fBatimentoReservas;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, wwriched, AxCtrls, OleCtrls, Db, DBTables,
  Wwquery, AppEvnts, StdActns, ActnList, ComObj, USistema;

type
  TfrmBatimentoReservas = class(TfrmOkCancelar)
    OpenDialog: TOpenDialog;
    Panel1: TPanel;
    QryAux: TwwQuery;
    memo: TMemo;
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
  private
    { Private declarations }
  public
     bCancela : Boolean;
     procedure BatimentoReservas;
     function ClienteNumero(sNumero : string):string;
     function CompletaString(sEnt, sComp : String ; nTam : Integer ; bDireita : Boolean ) : String;
    { Public declarations }
  end;

var
  frmBatimentoReservas: TfrmBatimentoReservas;

implementation

uses dBaseDados, uMensErro;

{$R *.DFM}

procedure TfrmBatimentoReservas.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  BatimentoReservas;
end;


procedure TfrmBatimentoReservas.BatimentoReservas;
Type
  TRecImport = Record
                 Matricula  : String;
                 sMesRef    : String;
                 SDataAlimenta : String;
               End;

Var
  I, J, wTotCampos : Integer;
  wDecimal   : Char;
  sNomeArquivo, sArquivo, sLinhaCampos, sIdContrib1, sIdContrib2,
  sLinhaValores1, sLinhaValores2, sSQL, sIdPessoa, sIdPessjur, sIdPlanoPrev,
  sDataContribuicao, sAnoMesRef, sAnoMesCob, sValorPart, sValorPatro : String;
  ExcelApp, Sheet : Variant;
  RecImport : TRecImport;
begin
  { Executa Dialogo de procura do Arquivo }
  If (OpenDialog.Execute) Then Begin
    sArquivo := UpperCase(OpenDialog.FileName);
  End Else Begin
    Exit;
  End;



  { Testa se Arquivo Especificado Existe }
  If Not (FileExists(sArquivo)) Then Begin
    ShowMessage('Arquivo não Existe ou Inválido ...');
    Exit;
  End;

  {----------------------------------------------------------------------------}
  { Tenta Abrir o Arquivo e Importar dados                                     }
  { conseguindo ou não Fecha o Arquivo                                         }
  Try
    { LbProcesso.Caption:='Conectando com o Excell.'; }

    { Conecta com o Excel }
    ExcelApp:=IDispatch(ExcelApp);
    ExcelApp:=CreateOleObject('Excel.Application');
    ExcelApp.Visible:=True;

    { Abre o arquivo Excel, não atualizando os links caso tenha }
    ExcelApp.Workbooks.Open(sArquivo,0);
    sNomeArquivo := ExtractFileName(sArquivo); { Guarda o Nome do Arquivo }
    sNomeArquivo := Copy(sNomeArquivo,1, (Pos('.',sNomeArquivo)-1) );

    { LbProcesso.Caption:='Abrindo planilha.'; }
    //Sheet := ExcelApp.Workbooks[1].WorkSheets['RESULTADO'];
    Sheet := ExcelApp.Workbooks[1].WorkSheets['Plan1'];


    { Inicia Processamento }
    Sheet.Cells[1,7] := 'IDPESSOA';
    Sheet.Cells[1,8] := 'VALORPART';
    Sheet.Cells[1,10] := 'VALORPATRO';


    bCancela := false;

    { Leitura das linhas da planilha }
    For I := 2 To (Sheet.UsedRange.Rows.Count) Do Begin
      Panel1.Caption := 'IMPORTANDO LINHA -> '+IntToStr(I);
      frmBatimentoReservas.update;

      Application.ProcessMessages;

      if bCancela then break;

      { Guarda imformacoes da planilha }
      RecImport.Matricula  := Trim(Sheet.Cells[I,1]);
      RecImport.sMesRef  := Trim(Sheet.Cells[I,2]);
      RecImport.sDataAlimenta := Trim(Sheet.Cells[I,3]);

      { Busca dados da matricula }
      sSQL := 'SELECT PP.IDPESSOA, PP.IDPESSJUR, PP.IDPLANOPREV, PP.IDSITPART ' +
              'FROM PARTPREVPLAN PP '+
              'WHERE IDPESSOA = (SELECT IDPESSOA FROM ELEGPATRO WHERE MATRICULA = '+
              ' '''+RecImport.Matricula+''' )  AND PP.FLGDESATIVADO = 0';

      qryaux.close;
      qryaux.sql.text := ssql;
      qryaux.open;


      { Não achando mostra e vai para o próximo }
      If qryaux.isempty Then Begin
        Memo.Lines.Add(' MATRICULA -> '+QuotedStr(RecImport.Matricula)+' NÃO ENCONTRADA!');
        Continue;
      End;

      { processa informações lidas }
      sIdPessoa     := QryAux.FieldByName('IDPESSOA').AsString;
      sIdPessjur    := QryAux.FieldByName('IDPESSJUR').AsString;
      sIdPlanoPrev  := QryAux.FieldByName('IDPLANOPREV').AsString;
      sAnoMesRef    := RecImport.sMesRef;

      sValorPart := '0';
      sSQL := ' SELECT /*RULE*/ SUM(DECODE(FLGENTRADA,1,NVL(VLRREAL,0),NVL(VLRREAL,0)*-1)) VALOR '+
              ' FROM HISTMOVRESERVA '+
              ' WHERE IDPESSJUR = '+sIdPessjur+' AND '+
              ' IDPESSOA = '+sIdPessoa+' AND '+
              ' MESREFERENCIA = '''+sAnoMesRef+'''  AND '+
              ' TO_CHAR(DATAALIMENTACAO,''DD/MM/YYYY'') = '''+RecImport.sDataAlimenta+''' AND '+
              ' IDCONTRIBUICAO IS NOT NULL AND '+
              ' IDTIPORESERVA IN (51,52,53,54,23)     ';
      qryaux.close;
      qryaux.sql.text := ssql;
      qryaux.open;
      if not qryaux.isempty then sValorPart :=  clientenumero(qryaux.fieldbyname('VALOR').AsString);



      sValorPatro := '0';
      sSQL := ' SELECT /*RULE*/ SUM(DECODE(FLGENTRADA,1,NVL(VLRREAL,0),NVL(VLRREAL,0)*-1)) VALOR '+
              ' FROM HISTMOVRESERVA '+
              ' WHERE IDPESSJUR = '+sIdPessjur+' AND '+
              ' IDPESSOA = '+sIdPessoa+' AND '+
              ' MESREFERENCIA = '''+sAnoMesRef+'''  AND '+
              ' TO_CHAR(DATAALIMENTACAO,''DD/MM/YYYY'') = '''+RecImport.sDataAlimenta+''' AND '+
              ' IDCONTRIBUICAO IS NOT NULL AND '+
              ' IDTIPORESERVA IN (59,60,61,33)     ';
      qryaux.close;
      qryaux.sql.text := ssql;
      qryaux.open;
      if not qryaux.isempty then sValorPatro :=  clientenumero(qryaux.fieldbyname('VALOR').AsString);


      if  abs(strtofloat(Trim(Sheet.Cells[I,4])) - strtofloat(sValorPart)) > 0.01 then sValorPart := Trim(Sheet.Cells[I,4]);
      if  abs(strtofloat(Trim(Sheet.Cells[I,5])) - strtofloat(sValorPatro)) > 0.01 then sValorPatro := Trim(Sheet.Cells[I,5]);

      Sheet.Cells[I,7] := sIdPessoa;
      Sheet.Cells[I,8] := sValorPart;

      if strtofloat(Trim(Sheet.Cells[I,4])) <> strtofloat(sValorPart)
      then  Sheet.Cells[I,9] := 'DIFPART';

      Sheet.Cells[I,10] := sValorPatro;

      if strtofloat(Trim(Sheet.Cells[I,5])) <> strtofloat(sValorPatro)
      then  Sheet.Cells[I,11] := 'DIFPATRO';


    End; { For }


     //Henrique Massão
     //Memo.Lines.SaveToFile('C:\BATIMENTO_RESERVAS.LOG');
     Memo.Lines.SaveToFile(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa) +'\batimento_reservas.log');
  
    if MsgDlg('Importação terminada. Deseja salvar as alterações?','Mensagem', mtInformation, [mbYes, mbNo],0) = mrYes then
    ExcelApp.Workbooks[1].Close(True)
    else  ExcelApp.Workbooks[1].Close(False);


  Finally
    { Fecha o Arquivo Independente do resultado da Operacao }
    ExcelApp.Quit;
  End;

end; { BatimentoReservas }

function TfrmBatimentoReservas.ClienteNumero(sNumero : string):string;
var i : integer;
    sResult,
    sCliente : string;
    bPrimPonto : boolean;
begin
   // CAMILLE - REFER - 23.08.1999
   if Trim(sNumero)  = ''
   then begin
      Result := '0';
      exit;
   end;

   sCliente := '';
   bPrimPonto := False;
   for i := length(Trim(sNumero)) downto 1
   do begin
     if sNumero[i] = '.'
     then begin
        if not bPrimPonto
        then begin
           sCliente := sCliente + DecimalSeparator;
           bPrimPonto := True;
        end
        else sCliente := sCliente;
     end
     else begin
        if sNumero[i] <> DecimalSeparator
        then sCliente := sCliente + sNumero[i]
        else begin
           if not bPrimPonto
           then begin
              sCliente := sCliente+DecimalSeparator;
              bPrimPonto := True;
           end
           else sCliente := sCliente;
        end;
     end;
   end;
   sResult := '';
   for i := length(sCliente) downto 1
   do begin
      sResult := sResult + sCliente[i];
   end;
   Result := sResult;
end;


function TfrmBatimentoReservas.CompletaString(sEnt, sComp : String ; nTam : Integer ; bDireita : Boolean ) : String;
var sResult : String;
    i ,iDif : Integer;
begin

   if  Length(trim(sEnt)) > nTam then
       sResult := copy(trim(sEnt),1,nTam)
   else
   begin
       iDif := abs(Length(trim(sEnt)) - nTam);
       sResult := trim(sEnt);

       if bDireita   then
       begin
          for i := 1 to iDif do
          sResult := sResult + sComp;
       end
       else
       begin
          for i := 1 to iDif do
          sResult := sComp + sResult;
       end;
   end;

   Result := sResult;

end;



procedure TfrmBatimentoReservas.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
   bCancela := true;
end;



end.