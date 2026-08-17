unit fBatimentoVlrContrib;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, Db, DBTables, Wwquery, StdCtrls, IvDictio, IvMulti,
  IvEMulti, MAHlpBtn, Buttons, TB97Tlbr, TB97, ExtCtrls, OleCtrls,
  AppEvnts, StdActns, ActnList, ComObj, Usistema;

type
  TfrmBatimentoVlrContrib = class(TfrmOkCancelar)
    memo: TMemo;
    Panel1: TPanel;
    QryAux: TwwQuery;
    OpenDialog: TOpenDialog;
    edmescob: TEdit;
    Label1: TLabel;
    procedure bbtnCancelarClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
     bCancela : Boolean;
     procedure BatimentoContrib;
     function ClienteNumero(sNumero : string):string;
     function CompletaString(sEnt, sComp : String ; nTam : Integer ; bDireita : Boolean ) : String;
    { Public declarations }
  end;

var
  frmBatimentoVlrContrib: TfrmBatimentoVlrContrib;

implementation



uses  dBaseDados, uMensErro;

{$R *.DFM}

procedure TfrmBatimentoVlrContrib.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
   bCancela := true;
end;


procedure TfrmBatimentoVlrContrib.BatimentoContrib;
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

    { Conecta com o Excel }
    ExcelApp:=IDispatch(ExcelApp);
    ExcelApp:=CreateOleObject('Excel.Application');
    ExcelApp.Visible:=True;

    { Abre o arquivo Excel, não atualizando os links caso tenha }
    ExcelApp.Workbooks.Open(sArquivo,0);
    sNomeArquivo := ExtractFileName(sArquivo); { Guarda o Nome do Arquivo }
    sNomeArquivo := Copy(sNomeArquivo,1, (Pos('.',sNomeArquivo)-1) );

    { LbProcesso.Caption:='Abrindo planilha.'; }
    Sheet := ExcelApp.Workbooks[1].WorkSheets['RESULTADO'];


    { Inicia Processamento }
    Sheet.Cells[1,14] := 'CONTRIBPART';
    Sheet.Cells[1,16] := 'CONTRIBPATRO';


    bCancela := false;

    { Leitura das linhas da planilha }
    For I := 2 To (Sheet.UsedRange.Rows.Count) Do Begin
      Panel1.Caption := 'IMPORTANDO LINHA -> '+IntToStr(I);
      frmBatimentoVlrContrib.update;

      Application.ProcessMessages;

      if bCancela then break;

      { Guarda imformacoes da planilha }
      RecImport.Matricula  := Trim(Sheet.Cells[I,1]);
      RecImport.sMesRef  := Trim(Sheet.Cells[I,2]);
      RecImport.sDataAlimenta := Trim(Sheet.Cells[I,3]);

      RecImport.Matricula  := CompletaString(RecImport.Matricula,'0',7,False);


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
      sSQL := ' SELECT /*rule*/ SUM(DECODE(FLGDEVOLUCAO,0,NVL(VALORRECEBIDO,0),NVL(VALORRECEBIDO,0)*-1)) VALOR  '+
              ' FROM  HSTCONTRIBPREV '+
              ' WHERE IDPESSJUR = '+sIdPessjur+' AND '+
              ' IDPESSOA = '+sIdPessoa+' AND '+
              ' IDPLANOPREV = '+sIdPlanoPrev+' AND '+
              ' MESCOBRANCA = '''+edmescob.text+''' AND '+
              ' MESREFERENCIA = '''+sAnoMesRef+'''  AND '+
              ' IDCONTRIBUICAO = 1   ';
      qryaux.close;
      qryaux.sql.text := ssql;
      qryaux.open;
      if not qryaux.isempty then sValorPart :=  clientenumero(qryaux.fieldbyname('VALOR').AsString);



      sValorPatro := '0';
      sSQL := ' SELECT /*rule*/ SUM(DECODE(FLGDEVOLUCAO,0,NVL(VALORRECEBIDO,0),NVL(VALORRECEBIDO,0)*-1)) VALOR  '+
              ' FROM  HSTCONTRIBPREV '+
              ' WHERE IDPESSJUR = '+sIdPessjur+' AND '+
              ' IDPESSOA = '+sIdPessoa+' AND '+
              ' IDPLANOPREV = '+sIdPlanoPrev+' AND '+
              ' MESCOBRANCA = '''+edmescob.text+''' AND '+
              ' MESREFERENCIA = '''+sAnoMesRef+'''  AND '+
              ' IDCONTRIBUICAO = 21   ';
      qryaux.close;
      qryaux.sql.text := ssql;
      qryaux.open;
      if not qryaux.isempty then sValorPatro :=  clientenumero(qryaux.fieldbyname('VALOR').AsString);

      Sheet.Cells[I,14] := sValorPart;
      Sheet.Cells[I,16] := sValorPatro;


    End; { For }


//    Memo.Lines.SaveToFile('C:\BATIMENTO_RESERVAS.LOG');
      Memo.Lines.SaveToFile( Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa) + 'BATIMENTO_RESERVAS.LOG');

    if MsgDlg('Importação terminada. Deseja salvar as alterações?','Mensagem', mtInformation, [mbYes, mbNo],0) = mrYes then
    ExcelApp.Workbooks[1].Close(True)
    else  ExcelApp.Workbooks[1].Close(False);


  Finally
    { Fecha o Arquivo Independente do resultado da Operacao }
    ExcelApp.Quit;
  End;

end; { BatimentoReservas }

procedure TfrmBatimentoVlrContrib.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
   BatimentoContrib;
end;

function TfrmBatimentoVlrContrib.ClienteNumero(sNumero : string):string;
var i : integer;
    sResult,
    sCliente : string;
    bPrimPonto : boolean;
begin
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


function TfrmBatimentoVlrContrib.CompletaString(sEnt, sComp : String ; nTam : Integer ; bDireita : Boolean ) : String;
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



procedure TfrmBatimentoVlrContrib.FormCreate(Sender: TObject);
begin
  inherited;
openDialog.InitialDir:=Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa);
end;

end.