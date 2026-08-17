// *************************************************************************************************
//Pendência   : SIG87651
//Responsável : Taffarel Sevaybriker
//Data        : 26/07/2019
//Descrição   : Ajuste na query de busca para não filtrar com a data de inscrição no plano.
// *************************************************************************************************
//Pendência   : SIG85075
//Responsável : Taffarel Sevaybriker
//Data        : 15/05/2019
//Descrição   : Ajuste para não considerar as matrículas quando o campo não for preenchido.
// *************************************************************************************************
//Pendência   : SOL263416  PPM 1133273
//Responsável : Peterson Victor
//Data        : 28/10/2015
//Descrição   : Erro nos dados extrato dos institutos
// *************************************************************************************************
// *************************************************************************************************
//Pendência   : SOL 262541 PPM 1094219
//Responsável : Fernando Xavier
//Data        : 03/07/2015
//Descrição   : Erro nos dados extrato dos institutos
// *************************************************************************************************
//Pendência   : SOL 257614 PPM 963054
//Responsável : Wylliam Leite da Silva
//Data        : 03/07/2015
//Descrição   : Ao gerar relatório/extrato de institutos em execel o sistema está apresentando erro.
// *************************************************************************************************
//Pendência   : SOL 227909/16859 PPM 627826
//Responsável : Fernando Xavier
//Data        : 19/03/2015
//Descrição   : Alteração do Extrato de Institutos e Gerar Arquivo Excel
// *************************************************************************************************
unit uTipoExtratoInstitutos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  fParamReports_Padrao, CmParamReport, FSairAjuda, StdCtrls, IvDictio, IvMulti, IvEMulti, MAHlpBtn, Buttons,
  TB97Tlbr, TB97, ExtCtrls, MontaSelect, Db, Wwdatsrc, DBTables, Wwquery,
  Grids, Wwdbigrd, Wwdbgrid, TB97Ctls, ComCtrls, usistema, JclStrings, CommDlg, ComObj,
  QExport3, QExport3XLS,
  wwdbdatetimepicker, CMDateTimePicker, CheckLst, UctrlExtratoDesligamento
  , dbASEDADOS,  uCMClientDataSet;

type
  TfrmTipoExtratoInstitutos = class(TfrmParamReports_Padrao)
    MontaConsultaIndiv: TMontaSelect;
    MontaConsulta: TMontaSelect;
    upd: TUpdateSQL;
    qryGrid: TwwQuery;
    dsGrid: TwwDataSource;
    NBKRelExtInstitutos: TNotebook;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    edtNomeIndiv: TEdit;
    edtMatriculaIndiv: TEdit;
    edtCpfIndiv: TEdit;
    edtDataNascimentoIndiv: TEdit;
    wwDBGrid1: TwwDBGrid;
    edtDataDemissao: TEdit;
    Label7: TLabel;
    pnlTipo: TPanel;
    lblTipo: TLabel;
    rdbTipoReal: TRadioButton;
    rdbTipoSimulacao: TRadioButton;
    pnlGeracao: TPanel;
    lblGeracao: TLabel;
    rdbGeracaoIndiv: TRadioButton;
    rdbGeracaoGrupo: TRadioButton;
    BitBtn2: TBitBtn;
    QryRelExtInstitutos: TwwQuery;
    Panel1: TPanel;
    Label4: TLabel;
    Label6: TLabel;
    MemoMatricula: TMemo;
    Panel2: TPanel;
    Label8: TLabel;
    chklstPlano: TCheckListBox;
    bbtnSelTudoPlano: TBitBtn;
    bbtnInvertePlano: TBitBtn;
    Panel3: TPanel;
    Label9: TLabel;
    chklstFund: TCheckListBox;
    bbtnInvertePatro: TBitBtn;
    bbtnSelTudoPatro: TBitBtn;
    Panel4: TPanel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    edtDataBase: TCMDateTimePicker;
    CMDateTimePicker1: TCMDateTimePicker;
    qryFund: TwwQuery;
    qryPlano: TwwQuery;
    qryElegPatro: TwwQuery;
    Label13: TLabel;
    edtDataDemissaoGrupo: TEdit;
    Dock972: TDock97;
    Toolbar971: TToolbar97;
    ToolbarButton971: TToolbarButton97;
    wwDBGrid2: TwwDBGrid;
    Dock973: TDock97;
    Toolbar972: TToolbar97;
    sbtnProcurar: TToolbarButton97;
    BtnGeralExcel: TBitBtn;
    BtnGeralTXT: TBitBtn;
    qryAux: TwwQuery;
    QExportXLS: TQExport3XLS;
    dsGridResultado: TwwDataSource;
    qryGridResultado: TwwQuery;
    updResultado: TUpdateSQL;
    SaveDlg: TSaveDialog;
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure sbtnProcurarClick(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure bbtnSelTudoPlanoClick(Sender: TObject);
    procedure bbtnInvertePlanoClick(Sender: TObject);
    procedure bbtnSelTudoPatroClick(Sender: TObject);
    procedure bbtnInvertePatroClick(Sender: TObject);
    procedure ToolbarButton972Click(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure BtnGeralTXTClick(Sender: TObject);
    procedure BtnGeralExcelClick(Sender: TObject);
    procedure bbtnSairClick(Sender: TObject);
  private
    { Private declarations }
    iHeigthIndiv : Integer;
    iWidthIndiv  : Integer;
    iHeigthGrupo : Integer;
    iWidthGrupo  : Integer;
    iHeigthTipo : Integer;
    iWidthTipo  : Integer;
    iHeigthGrupoResult : Integer;
    iWidthGrupoResult  : Integer;
    iContadorLinhas : Integer;
    iContadorParticipante : Integer;
    FSaida: text;
    sNomeArquivoTXT : String;
    ExcelApp : Variant;
    Sheet    : Variant;
    CtrlExtratoDesligamento :  TCtrlExtratoDesligamento;
    Procedure ExecutaProc(pIdPlanoPrev, pIdPessoa : String);
    procedure Cria(aNomeArquivo: string);
    procedure Encerra;
    Procedure MontaArquivoTxt(qry : TwwQuery);
    procedure MontaCabecalho;
    procedure MontaDadosParticipante(qry : TwwQuery);
    procedure MontaDadosOpcaoes(qry : TwwQuery);
    procedure MontaFechamento(qtdeLinhas, qtdeParticipantes: integer);
    Procedure MontaArquivoExcel;
    Procedure ApagaRelatorio(); 
    procedure CriaLista(chkListX : TCheckListBox; qryLista : TwwQuery);
  public
    { Public declarations }

  end;

var
  frmTipoExtratoInstitutos: TfrmTipoExtratoInstitutos;

implementation

uses dExtratoInstitutos;

{$R *.DFM}

function TrocaCaracter(aStr, aOld, aNew : String) : string;
begin
  Result := StringReplace(aStr, aOld, aNew, [rfReplaceAll]);
end;

procedure SplitString(sDelimitador, sTexto : string; var lstLista : TStringList);
var
  i : byte;
begin
  if copy(sTexto, length(sTexto),1) <> sDelimitador then
     sTexto := sTexto + sDelimitador;
  while length(sTexto) > 0 do
  begin
    i := pos(sDelimitador, sTexto);
    if i = 0 then
       i := length(sTexto);

    lstLista.Add( copy(sTexto, 1, i-1) );

    sTexto := StringReplace(sTexto, lstLista.Strings[lstLista.count-1]+sDelimitador, '', []);
  end;
end;

procedure TfrmTipoExtratoInstitutos.CriaLista(chkListX : TCheckListBox; qryLista : TwwQuery);
begin
  chkListX.Items.Clear;
  with qryLista do
  begin
     while not EOF do
     begin
        chkListX.Items.Add(FieldByName('Nome').AsString);
        Next;
     end;
  end;
end;

procedure TfrmTipoExtratoInstitutos.Cria(aNomeArquivo: string);
begin
  AssignFile(FSaida, aNomeArquivo);
  rewrite(FSaida);
end;

procedure TfrmTipoExtratoInstitutos.MontaArquivoTxt(
  qry: TwwQuery);
begin
     MontaCabecalho();
     // Quantidade Linhas, Quantidade Participante
     MontaDadosParticipante(qry);
     MontaDadosOpcaoes(qry);
     MontaFechamento(iContadorLinhas,iContadorParticipante);
     Encerra;
end;

procedure TfrmTipoExtratoInstitutos.MontaDadosParticipante(
  qry: TwwQuery);
var sTexto: string;
    iIdPessoa: Integer;
begin
   iContadorParticipante := 0;
   iContadorLinhas := 0;
   iIdPessoa := 0;
   //MATRÍCULA-CPF-NOME-SEXO-PATROCINADORA-PLANO-DATA DA RESCISÃO CONTRATUAL-DATA DE ADESÃO NO PLANO-IDADE-DATA ATUAL-FILLER-TOTAL
   qry.first;
   while not(qry.Eof) do
   begin
      if iIdPessoa <> qry.FieldbyName('IDPESSOA').AsInteger then
      begin
          inc(iContadorParticipante);

          sTexto := '1';
          sTexto := sTexto + StrPadRight(trim(qry.FieldbyName('MATRICULA').Asstring),9,' ');
          sTexto := sTexto + qry.FieldbyName('CPF').Asstring;
          sTexto := sTexto + StrPadRight(trim(qry.FieldbyName('NOME').Asstring),60,' ');
          sTexto := sTexto + qry.FieldbyName('SEXO').Asstring;
          sTexto := sTexto + StrPadRight(trim(qry.FieldbyName('PATRO').Asstring),60,' ');
          sTexto := sTexto + StrPadRight(trim(qry.FieldbyName('PLANO').Asstring),60,' ');
          sTexto := sTexto + qry.FieldbyName('DTDEMISSAO').Asstring;
          sTexto := sTexto + qry.FieldbyName('DTADPLANO').Asstring;
          sTexto := sTexto + StrPadRight(trim(qry.FieldbyName('IDADE').Asstring),3,' ');
          sTexto := sTexto + qry.FieldbyName('DTATUAL').Asstring;
          sTexto := StrPadRight(sTexto,265,' ');
          writeln(FSaida, sTexto);
      end;
      inc(iContadorLinhas);
      sTexto := '2';
      sTexto := sTexto + StrPadRight(trim(qry.FieldbyName('ELEGIVEL1').Asstring),12,' ');
      sTexto := sTexto + StrPadRight(trim(qry.FieldbyName('SALDOCONTA').Asstring),14,' ');
      sTexto := sTexto + StrPadRight(trim(qry.FieldbyName('RESPOUP').Asstring),14,' ');
      sTexto := sTexto + StrPadRight(trim(qry.FieldbyName('ELEGIVEL2').AsString),12,' ');
      sTexto := sTexto + StrPadRight(trim(qry.FieldbyName('VLRASERPORTADO').Asstring),14,' ');
      sTexto := sTexto + StrPadRight(trim(qry.FieldbyName('VLRPORTADO').Asstring),14,' ');
      sTexto := sTexto + StrPadRight(trim(qry.FieldbyName('TOTPORTADO').Asstring),14,' ');
      sTexto := sTexto + StrPadRight(trim(qry.FieldbyName('ELEGIVEL3').AsString),12,' ');
      sTexto := sTexto + StrPadRight(trim(qry.FieldbyName('VLRTRIB').Asstring),14,' ');
      sTexto := sTexto + StrPadRight(trim(qry.FieldbyName('VLRNAOTRIB').Asstring),14,' ');
      sTexto := sTexto + StrPadRight(trim(qry.FieldbyName('RESGBRUTO').Asstring),14,' ');
      sTexto := sTexto + StrPadRight(trim(qry.FieldbyName('ELEGIVEL4').Asstring),12,' ');
      sTexto := sTexto + StrPadRight(trim(qry.FieldbyName('SALPART').Asstring),14,' ');
      sTexto := sTexto + StrPadRight(trim(qry.FieldbyName('VLRINIPART').Asstring),14,' ');
      sTexto := sTexto + StrPadRight(trim(qry.FieldbyName('PERCPART').Asstring),7,' ');
      sTexto := sTexto + StrPadRight(trim(qry.FieldbyName('VLRINIPATRO').Asstring),14,' ');
      sTexto := sTexto + StrPadRight(trim(qry.FieldbyName('PERCPATRO').Asstring),7,' ');
      sTexto := sTexto + StrPadRight(trim(qry.FieldbyName('VLRINICADM').Asstring),14,' ');
      sTexto := sTexto + StrPadRight(trim(qry.FieldbyName('PERCCADM').Asstring),7,' ');
      sTexto := sTexto + StrPadRight(trim(qry.FieldbyName('VLRINICRISCO').Asstring),14,' ');
      sTexto := sTexto + StrPadRight(trim(qry.FieldbyName('PERCCRISCO').Asstring),7,' ');
      sTexto := StrPadRight(sTexto,265,' ');
      writeln(FSaida, sTexto);


      iIdPessoa := qry.FieldbyName('IDPESSOA').AsInteger;
      qry.Next;
   end;

 //  writeln(FSaida, sTexto);
end;

procedure TfrmTipoExtratoInstitutos.MontaDadosOpcaoes(
  qry: TwwQuery);
var sTexto: string;
begin
   //qry.First;
   //while not(qry.Eof) do
   //begin

  //    qry.next;
  // end;
end;

procedure TfrmTipoExtratoInstitutos.MontaCabecalho;
var sTexto: string;
begin
//1. TIPO DE REGISTRO 2. EMPRESA FUNCEF 3. FUNCIONALIDADE	EXTRATO INSTITUTOS 4.	DATA DE GERAÇÃO DO ARQUIVO 5.	HORA DE GERAÇÃO DO ARQUIVO 6.	RESPONSAVEL PELAS INFORMAÇÕES 7.	FILLER
   qryAux.Close;
   qryAux.Sql.Clear;
   qryAux.Sql.Add('select to_char(sysdate,''DDMMYYYY'') AS HOJEDIA, to_char(sysdate,''HH24MISS'') AS HOJEHORA  from dual');
   qryAux.Open;
   sNomeArquivoTXT := 'EXTRATO INSTITUTOS '+qryAux.FieldByName('HOJEDIA').AsString+qryAux.FieldByName('HOJEHORA').AsString;

  with SaveDlg do
     if Execute then
        sNomeArquivoTXT := FileName;

   Cria(sNomeArquivoTXT+'.Txt');

   sTexto := '0'+'FUNCEF'+sNomeArquivoTXT;
   sTexto := sTexto + StrPadRight(Sistema.NomeUsuario,40,' ');
   sTexto := StrPadRight(sTexto,265,' ');
   writeln(FSaida, sTexto);
end;

procedure TfrmTipoExtratoInstitutos.MontaFechamento(qtdeLinhas, qtdeParticipantes: integer);
var sTexto: string;
begin
// 1 TIPO DE REGISTRO	2.	QTDE LINHAS NO ARQUIVO 3.	QTDE PARTICIPANTE	4.	FILLER
   sTexto := '3';
   sTexto := sTexto + StrPadRight(inttostr(qtdeLinhas),12,' ');
   sTexto := sTexto + StrPadRight(inttostr(qtdeParticipantes),12,' ');
   sTexto := StrPadRight(sTexto,265,' ');
   writeln(FSaida, sTexto);
end;

procedure TfrmTipoExtratoInstitutos.Encerra;
var sCaminhoArquivo: string;
begin
  closefile(FSaida);
  MessageDlg('Arquivo gerado com sucesso!', mtInformation, [mbOK], 0);
end;

procedure TfrmTipoExtratoInstitutos.MontaArquivoExcel();
   procedure FormataColunas;
   begin
     Sheet.Columns[1].NumberFormat := '@';      //  cpf
     Sheet.Columns[6].NumberFormat := '@';      // data
     Sheet.Columns[7].NumberFormat := '@';      // data
     Sheet.Columns[9].NumberFormat := '@';      // data
  end;
var

  lstDados : TStringList;
  lstLinha : TStringList;
  lstCabec : TStringList;
  ind, col : byte;
  lin      : integer;
  sLinha   : string;
begin
   ApagaRelatorio();
   with SaveDlg do
       if Execute then
          sNomeArquivoTXT := FileName;

   try
      lstCabec := TStringList.create;
      lstLinha := TStringList.create;
      lstDados := TStringList.create;

      lstDados.Add('MATRICULA'+#59+'CPF'+#59+'NOME'+#59+'SEXO'+#59+'PATRO'+#59+'PLANO'+#59+'DTDEMISSAO'+#59+'DTADPLANO'+#59+'IDADE'+#59+'DTATUAL'+#59+'ELEGIVEL1'+#59+'SALDOCONTA'+#59+'RESPOUP'+#59+'ELEGIVEL2'+#59+'VLRASERPORTADO'+#59+'VLRPORTADO'+#59+'TOTPORTADO'+#59+'ELEGIVEL3'+#59+'VLRTRIB'+#59+'VLRNAOTRIB'+#59+'RESGBRUTO'+#59+'ELEGIVEL4'+#59+'SALPART'+#59+'VLRINIPART'+#59+'PERCPART'+#59+'VLRINIPATRO'+#59+'PERCPATRO'+#59+'VLRINICADM'+#59+'PERCCADM'+#59+'VLRINICRISCO'+#59+'PERCCRISCO');

      ExcelApp:=CreateOleObject('Excel.Application');
      ExcelApp.Visible:=false;
      ExcelApp.WorkBooks.Add(-4167);
      ExcelApp.WorkBooks[1].WorkSheets[1].Name:='Sheet1';
      sheet:=ExcelApp.WorkBooks[1].WorkSheets['Sheet1'];

     //Sheet := ExcelApp.ActiveWorkbook.WorkSheets['Plan1'];
     Application.ProcessMessages;
     FormataColunas();
     {* insere titulo colunas *}
     lstCabec.clear;
     SplitString(';', lstDados.Strings[0], lstCabec);
     for col := 0 to lstCabec.Count-1 do
        Sheet.Cells[1, col+1] := lstCabec.Strings[col];
     FormataColunas();
     lin := 2;
     QryRelExtInstitutos.first;
     while not(QryRelExtInstitutos.Eof) do
     begin
        lstLinha.clear;
        lstLinha.Add(QryRelExtInstitutos.FieldByName('MATRICULA').AsString);
        lstLinha.Add(QryRelExtInstitutos.FieldByName('CPF').AsString);
        lstLinha.Add(QryRelExtInstitutos.FieldByName('NOME').AsString);
        lstLinha.Add(QryRelExtInstitutos.FieldByName('SEXO').AsString);
        lstLinha.Add(QryRelExtInstitutos.FieldByName('PATRO').AsString);
        lstLinha.Add(QryRelExtInstitutos.FieldByName('PLANO').AsString);
        lstLinha.Add(QryRelExtInstitutos.FieldByName('DTDEMISSAO').AsString);
        lstLinha.Add(QryRelExtInstitutos.FieldByName('DTADPLANO').AsString);
        lstLinha.Add(QryRelExtInstitutos.FieldByName('IDADE').AsString);
        lstLinha.Add(QryRelExtInstitutos.FieldByName('DTATUAL').AsString);
        lstLinha.Add(QryRelExtInstitutos.FieldByName('ELEGIVEL1').AsString);
        lstLinha.Add(QryRelExtInstitutos.FieldByName('SALDOCONTA').AsString);
        lstLinha.Add(QryRelExtInstitutos.FieldByName('RESPOUP').AsString);
        lstLinha.Add(QryRelExtInstitutos.FieldByName('ELEGIVEL2').AsString);
        lstLinha.Add(QryRelExtInstitutos.FieldByName('VLRASERPORTADO').AsString);
        lstLinha.Add(QryRelExtInstitutos.FieldByName('VLRPORTADO').AsString);
        lstLinha.Add(QryRelExtInstitutos.FieldByName('TOTPORTADO').AsString);
        lstLinha.Add(QryRelExtInstitutos.FieldByName('ELEGIVEL3').AsString);
        lstLinha.Add(QryRelExtInstitutos.FieldByName('VLRTRIB').AsString);
        lstLinha.Add(QryRelExtInstitutos.FieldByName('VLRNAOTRIB').AsString);
        lstLinha.Add(QryRelExtInstitutos.FieldByName('RESGBRUTO').AsString);
        lstLinha.Add(QryRelExtInstitutos.FieldByName('ELEGIVEL4').AsString);
        lstLinha.Add(QryRelExtInstitutos.FieldByName('SALPART').AsString);
        lstLinha.Add(QryRelExtInstitutos.FieldByName('VLRINIPART').AsString);
        lstLinha.Add(QryRelExtInstitutos.FieldByName('PERCPART').AsString);
        lstLinha.Add(QryRelExtInstitutos.FieldByName('VLRINIPATRO').AsString);
        lstLinha.Add(QryRelExtInstitutos.FieldByName('PERCPATRO').AsString);
        lstLinha.Add(QryRelExtInstitutos.FieldByName('VLRINICADM').AsString);
        lstLinha.Add(QryRelExtInstitutos.FieldByName('PERCCADM').AsString);
        lstLinha.Add(QryRelExtInstitutos.FieldByName('VLRINICRISCO').AsString);
        lstLinha.Add(QryRelExtInstitutos.FieldByName('PERCCRISCO').AsString);

        for col := 0 to lstLinha.count-1 do
        begin
           slinha :=  TrocaCaracter(lstLinha.Strings[col], ';', '');
           Sheet.Cells[lin, col+1] := sLinha;
        end;
        inc(lin);

        QryRelExtInstitutos.next;
     end;


     (* Fecha o Arquivo Independente do resultado da Operação *)
     ExcelApp.ActiveWorkbook.SaveAs( sNomeArquivoTXT );
     ExcelApp.ActiveWorkbook.Close(False);
     ExcelApp.Quit;

     MessageDlg('Arquivo gerado com sucesso!', mtInformation, [mbOK], 0);
   finally

      FreeAndNil(lstCabec);
      FreeAndNil(lstLinha);
      FreeAndNil(lstDados);

   end;
end;

Procedure  TfrmTipoExtratoInstitutos.ExecutaProc(pIdPlanoPrev, pIdPessoa : String);
var SP_PROC : TStoredProc;
begin
      SP_PROC                := TStoredProc.Create(Application);
      SP_PROC.DatabaseName   := 'BaseDados';

      SP_PROC.StoredProcName := 'PCK_EXTRATO_INSTITUTOS.PR_RELATORIO';

      SP_PROC.Params.CreateParam(ftInteger,   'in_idplanoprev',         ptinput);
      SP_PROC.Params.CreateParam(ftInteger,   'in_idpessoa',          ptinput);

      SP_PROC.Params.CreateParam(ftInteger,   'in_idsessao',        ptinput);
      SP_PROC.Params.CreateParam(ftInteger,   'in_dtinclusao',               ptinput);
      SP_PROC.Params.CreateParam(ftInteger,   'in_userinclusao',         ptinput);

      SP_PROC.parambyName('in_idplanoprev').Asstring   := pIdPlanoPrev;
      SP_PROC.parambyName('in_idpessoa').Asstring      := pIdPessoa;
      SP_PROC.parambyName('in_idsessao').Asstring      := IntToStr(sistema.IdUsuario)+formatdatetime('ddmmyyyy',now);
      SP_PROC.parambyName('in_dtinclusao').asString    := DateToStr(Now);
      SP_PROC.parambyName('in_userinclusao').asString  := Sistema.NomeUsuario;

      SP_PROC.Prepare;
      if not dtmBaseDados.dbBaseDados.InTransaction then
      begin
         dtmBaseDados.dbBaseDados.StartTransaction;
      end;
      SP_PROC.ExecProc;

      dtmBaseDados.dbBaseDados.Commit;
end;

procedure TfrmTipoExtratoInstitutos.bbtnConfirmarClick(Sender: TObject);
var
    sIdPessoa, sIdPlanoPrev : string;
begin
   inherited;
   dtmRelExtratoInstitutos.cds.First;
   dtmRelExtratoInstitutos.bMostraRelatorio := true;
   ApagaRelatorio();



   while not(dtmRelExtratoInstitutos.cds.eof) do
   begin
      if dtmRelExtratoInstitutos.cds.FieldByName('IDPLANOPREV').AsString = '2' then
      begin
         dtmRelExtratoInstitutos.cds.next;
         continue;
      end;
      if dtmRelExtratoInstitutos.cds.FieldByName('IDPLANOPREV').AsString = '66' then
      begin
         CtrlExtratoDesligamento.MontaSQLPercCusteioRisco(sistema.IdUsuario, dtmRelExtratoInstitutos.cds.FieldByName('IDPLANOPREV').AsInteger, dtmRelExtratoInstitutos.csdPercCusteioAdmRisco);
         if  (dtmRelExtratoInstitutos.csdPercCusteioAdmRisco.RecordCount < 2)  then
         begin
            MessageDlg('Um dos percentuais de custeio administrativo e/ou de risco, não estão disponíveis na estrutura da tabela genérica.'+#13+' Os dados de autopatrocínio poderão não ser gerados.', mtInformation, [mbOK], 0);
            dtmRelExtratoInstitutos.cds.last;
            continue;
         end;
      end
      else
      if dtmRelExtratoInstitutos.cds.FieldByName('IDPLANOPREV').AsString = '74' then
      begin
         CtrlExtratoDesligamento.MontaSQLPercCusteioRisco(sistema.IdUsuario, dtmRelExtratoInstitutos.cds.FieldByName('IDPLANOPREV').AsInteger, dtmRelExtratoInstitutos.csdPercCusteioAdmRisco);
         if  (dtmRelExtratoInstitutos.csdPercCusteioAdmRisco.RecordCount < 2)  then
         begin
            MessageDlg('Um dos percentuais de custeio administrativo e/ou de risco, não estão disponíveis na estrutura da tabela genérica.'+#13+' Os dados de autopatrocínio poderão não ser gerados.', mtInformation, [mbOK], 0);
            dtmRelExtratoInstitutos.cds.last;
            continue;
         end;
      end;
      dtmRelExtratoInstitutos.cds.next;
   end;

   dtmRelExtratoInstitutos.cds.First;
  // if dtmRelExtratoInstitutos.cds.RecordCount <= 1 then
  //    if dtmRelExtratoInstitutos.cds.FieldByName('IDPLANOPREV').AsString = '2' then
   //      dtmRelExtratoInstitutos.ppRelExtratoInstitutos.DataPipeline := dtmRelExtratoInstitutos.ppRegReplan;

   Self.Close;

end;

procedure TfrmTipoExtratoInstitutos.FormShow(Sender: TObject);
begin
  inherited;
  NBKRelExtInstitutos.ActivePage := 'PgTipoRelatorio';
  BtnGeralExcel.Visible := (NBKRelExtInstitutos.ActivePage = 'RelatorioExtGrupoResultado');
  BtnGeralTXT.Visible   := (NBKRelExtInstitutos.ActivePage = 'RelatorioExtGrupoResultado');
  qryPlano.Close;   qryPlano.Open;
  CriaLista(chklstPlano,qryPlano);
  qryFund.Close;   qryFund.Open;
  CriaLista(chklstFund,qryFund);

  // RNG12 Na apresentação da tela, todos os planos do participante deverão vir marcados.
  bbtnSelTudoPlano.onclick(self);
  bbtnSelTudoPatro.onclick(self);
  // RNG12 Na apresentação da tela, todos os planos do participante deverão vir marcados.

  edtDataDemissaoGrupo.Text := FormatDateTime('DD/MM/YYYY', Now);
  edtDataDemissao.Text      := FormatDateTime('DD/MM/YYYY', Now);  
end;

procedure TfrmTipoExtratoInstitutos.FormCreate(Sender: TObject);
begin
  inherited;
  iHeigthIndiv       :=  420;
  iWidthIndiv        :=  1006;
  iHeigthGrupo       :=  537;
  iWidthGrupo        :=  825;
  iHeigthGrupoResult :=  420;
  iWidthGrupoResult  :=  1006;
  iHeigthTipo        := self.Height;
  iWidthTipo         := self.Width;

  CtrlExtratoDesligamento := TCtrlExtratoDesligamento.Create;

  CtrlExtratoDesligamento.Initialize(dtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,
  Sistema.ConnectionSide,Sistema.AppRemoteServer,True);
end;

procedure TfrmTipoExtratoInstitutos.sbtnProcurarClick(Sender: TObject);
var abreForm : boolean;
begin
   inherited;
   if (NBKRelExtInstitutos.ActivePage = 'RelatorioExtIndividual') or (NBKRelExtInstitutos.ActivePage = 'PgTipoRelatorio') then
   begin
      MontaConsulta.Executar;

      if (MontaConsulta.RetornouValor) then
      begin
          edtMatriculaIndiv.Text      := MontaConsulta.ValoresChave[0];
          edtCpfIndiv.Text            := MontaConsulta.ValoresChave[1];
          edtNomeIndiv.Text           := MontaConsulta.ValoresChave[2];
          edtDataNascimentoIndiv.Text := MontaConsulta.ValoresChave[3];


          QryGrid.Close;
          QryGrid.Parambyname('Idpessoa').asInteger := strToint(MontaConsulta.ValoresChave[4]);
          if (rdbTipoReal.Checked) then
             QryGrid.Parambyname('TIPO').asInteger := 1
          else
             QryGrid.Parambyname('TIPO').asInteger := 0;

          QryGrid.Open;

          if (rdbTipoReal.Checked) then
          begin
            if QryGrid.RecordCount < 1 then
              MessageDlg('O participante não possui data de demissão.', mtInformation, [mbOK], 0);
          end;

      end;
   end
   else
   begin
      Self.Height   := iHeigthGrupo;
      Self.Width    := iWidthGrupo;
      NBKRelExtInstitutos.ActivePage := 'RelatorioExtGrupo';
   end;
end;

procedure TfrmTipoExtratoInstitutos.BitBtn2Click(Sender: TObject);
var sPlanos, sSitpart, sMatricula, sMemoLines, sMatriculaIni, sMatriculaFim : String;
    c : integer;
    sIdPessoa, sIdPlanoPrev, sIdPlanoPrevReb, sIdPlanoPrevNovo, sIdPlanoPrevReg : string;
begin
   inherited;
   // Wylliam Leite da Silva - Sol: 257614 PPM: 963054 - Início
   if not dtmBaseDados.dbBaseDados.InTransaction then
      dtmBaseDados.dbBaseDados.StartTransaction;
   // Wylliam Leite da Silva - Sol: 257614 PPM: 963054 - Fim

   //REG REPLAN
   dtmRelExtratoInstitutos.bRegReplan  := false;
   //Novo Plano
   dtmRelExtratoInstitutos.bNovoPlano  := false;
   //REB
   dtmRelExtratoInstitutos.bReb        := false;
   //REG REPLAN SALDADO
   dtmRelExtratoInstitutos.bRegReplanSaldado := false;

   sIdPlanoPrevReb  := '';
   sIdPlanoPrevNovo := '';
   sIdPlanoPrevReg  := '';
   // mostrar botões de exportação
   BtnGeralExcel.Visible := (NBKRelExtInstitutos.ActivePage = 'RelatorioExtGrupoResultado');
   BtnGeralTXT.Visible   := (NBKRelExtInstitutos.ActivePage = 'RelatorioExtGrupoResultado');

   if  (NBKRelExtInstitutos.ActivePage = 'PgTipoRelatorio') then
   begin
      if (rdbGeracaoIndiv.checked) then
      begin
         sbtnProcurarClick(Sender);
         // mostrar botões de exportação
         BtnGeralExcel.Visible := (NBKRelExtInstitutos.ActivePage = 'RelatorioExtGrupoResultado');
         BtnGeralTXT.Visible   := (NBKRelExtInstitutos.ActivePage = 'RelatorioExtGrupoResultado');
         Self.Height := iHeigthIndiv;
         Self.Width  := iWidthIndiv;
         Self.Position := poScreenCenter ;
         NBKRelExtInstitutos.ActivePage := 'RelatorioExtIndividual';
      end
      else
      begin

         // mostrar botões de exportação
         BtnGeralExcel.Visible := (NBKRelExtInstitutos.ActivePage = 'RelatorioExtGrupoResultado');
         BtnGeralTXT.Visible   := (NBKRelExtInstitutos.ActivePage = 'RelatorioExtGrupoResultado');
         Self.Height   := iHeigthGrupo;
         Self.Width    := iWidthGrupo;
         Self.Position := poScreenCenter ;
         NBKRelExtInstitutos.ActivePage := 'RelatorioExtGrupo';       
      end;
   end
   else if (NBKRelExtInstitutos.ActivePage = 'RelatorioExtIndividual') then
   begin
       c := 0;
       qryGrid.Filter := 'SELECIONADO = 1';
       qryGrid.Filtered := true;
       begin
          while not(qryGrid.Eof) do
          begin
             //REG REPLAN
             if (qryGrid.FieldByName('IDPLANOPREV').asstring = '2') and (qryGrid.FieldByName('SELECIONADO').asstring = '1') then
             begin
                dtmRelExtratoInstitutos.bRegReplan := (qryGrid.FieldByName('IDPLANOPREV').asstring = '2');//bRegReplan;
                if qryGrid.FieldByName('IDSITPLANOPREV').asstring = '25' then
                begin
                   dtmRelExtratoInstitutos.bRegReplanSaldado := true;
                   dtmRelExtratoInstitutos.bRegReplan := false;
                end
                else
                begin
                   dtmRelExtratoInstitutos.bRegReplanSaldado := false;
                   dtmRelExtratoInstitutos.bRegReplan := true;
                end;
                sIdPlanoPrevReg := qryGrid.FieldByName('IDPLANOPREV').asstring;
             end;
             //Novo Plano
             if (qryGrid.FieldByName('IDPLANOPREV').asstring = '74') and (qryGrid.FieldByName('SELECIONADO').asstring = '1') then
             begin
                dtmRelExtratoInstitutos.bNovoPlano := (qryGrid.FieldByName('IDPLANOPREV').asstring = '74');//bNovoPlano;
                sIdPlanoPrevNovo := qryGrid.FieldByName('IDPLANOPREV').asstring;
             end;
             //REB
             if (qryGrid.FieldByName('IDPLANOPREV').asstring = '66') and (qryGrid.FieldByName('SELECIONADO').asstring = '1') then
             begin
                dtmRelExtratoInstitutos.bReb        := (qryGrid.FieldByName('IDPLANOPREV').asstring = '66'); //bReb;
                sIdPlanoPrevReb := qryGrid.FieldByName('IDPLANOPREV').asstring;
             end;

             if (qryGrid.FieldByName('SELECIONADO').asstring = '1') then
             begin
                sIdPessoa := sIdPessoa + ', '+ qryGrid.FieldByName('IDPESSOA').asstring;
                inc(c);
             end;

             // Wylliam Leite da Silva - SOL 257614 PPM 963054 - Início
             {if c mod 100 = 0 then // executa a procedure a cada 100 pessoas para não dar erro no in dentro da procedure
             begin
                sIdPessoa := copy(sIdPessoa,3,length(sIdPessoa)) ;
             if sIdPlanoPrevReg <> '' then
               if sIdPlanoPrev <> '' then
                  sIdPlanoPrev :=  sIdPlanoPrev +', ' + sIdPlanoPrevReg
               else
                  sIdPlanoPrev :=  sIdPlanoPrevReg;
             if sIdPlanoPrevNovo <> '' then
               if sIdPlanoPrev <> '' then
                  sIdPlanoPrev :=  sIdPlanoPrev +', ' + sIdPlanoPrevNovo
               else
                  sIdPlanoPrev :=  sIdPlanoPrevNovo;
             if sIdPlanoPrevReb <> '' then
               if sIdPlanoPrev <> '' then
                  sIdPlanoPrev :=  sIdPlanoPrev +', ' + sIdPlanoPrevReb
             else
                sIdPlanoPrev :=  sIdPlanoPrevReb;
                // Chama a procedure
                ExecutaProc(sIdPlanoPrev,sIdPessoa);
                // Fim da chamada da PROC
                sIdPlanoPrevReg  := '';
                sIdPlanoPrevNovo := '';
                sIdPlanoPrevReb  := '';
                sIdPessoa        := '';
             end;}

             qryAux.Close;
             qryAux.SQL.Clear;
             qryAux.SQL.Add(' INSERT INTO EXTRATOINSTREL VALUES(:prIDPESSOA, :prIDPLANO)');
             qryAux.ParamByName('prIDPESSOA').AsString:= qryGrid.FieldByName('IDPESSOA').AsString;
             qryAux.ParamByName('prIDPLANO').AsString := qryGrid.FieldByName('IDPLANOPREV').AsString;
             try    //SOL 262541 PPM 1094219
                qryAux.ExecSQL;   //SOL 262541 PPM 1094219
             except //SOL 262541 PPM 1094219
             end;  //SOL 262541 PPM 1094219
             // Wylliam Leite da Silva - SOL 257614 PPM 963054 - Fim
             qryGrid.next;
          end;
       end;
       sIdPessoa := copy(sIdPessoa,3,length(sIdPessoa)) ;

      if sIdPlanoPrevReg <> '' then
         if sIdPlanoPrev <> '' then
            sIdPlanoPrev :=  sIdPlanoPrev +', ' + sIdPlanoPrevReg
         else
            sIdPlanoPrev :=  sIdPlanoPrevReg;
      if sIdPlanoPrevNovo <> '' then
         if sIdPlanoPrev <> '' then
            sIdPlanoPrev :=  sIdPlanoPrev +', ' + sIdPlanoPrevNovo
         else
            sIdPlanoPrev :=  sIdPlanoPrevNovo;
      if sIdPlanoPrevReb <> '' then
         if sIdPlanoPrev <> '' then
            sIdPlanoPrev :=  sIdPlanoPrev +', ' + sIdPlanoPrevReb
         else
            sIdPlanoPrev :=  sIdPlanoPrevReb;

       if (trim(sIdPessoa) = '') then
       begin
          MessageDlg('Favor selecionar pelo menos um Plano.', mtInformation, [mbOK], 0);
          qryGrid.Filtered := false;
          exit;
       end;

      // Chama a procedure
      //if sIdPessoa <> '' then
         ExecutaProc('','');//(sIdPlanoPrev,sIdPessoa); // Wylliam Leite da Silva - SOL 257614 PPM 963054
      // Fim da chamada da PROC

      // Faz a select no resultado da proc
      {dtmRelExtratoInstitutos.Cds.close;
      dtmRelExtratoInstitutos.Cds.ParamByName('IDSESSAO').AsString :=  IntToStr(sistema.IdUsuario)+formatdatetime('ddmmyyyy',now);
      dtmRelExtratoInstitutos.Cds.open;}
      CtrlExtratoDesligamento.MontaSQLGeral(sistema.IdUsuario, dtmRelExtratoInstitutos.Cds);
      CtrlExtratoDesligamento.MontaSQLRegReplan(sistema.IdUsuario, dtmRelExtratoInstitutos.cdsRegReplan);
      CtrlExtratoDesligamento.MontaSQLRegReplanSaldado(sistema.IdUsuario, dtmRelExtratoInstitutos.cdsRegReplanSaldado);
      CtrlExtratoDesligamento.MontaSQLNovoPlano(sistema.IdUsuario, dtmRelExtratoInstitutos.cdsNovoPlano);
      CtrlExtratoDesligamento.MontaSQLReb(sistema.IdUsuario, dtmRelExtratoInstitutos.cdsReb);
      qryGrid.Filtered := false;
      bbtnConfirmarClick(Sender); // exibe relatorio
   end
   else  if (NBKRelExtInstitutos.ActivePage = 'RelatorioExtGrupo') then
   begin
      if (edtDataBase.Text <> '') then
      begin
         if (CMDateTimePicker1.text <> '' ) then
         begin
           if (CMDateTimePicker1.Date < edtDataBase.Date) then
           begin
             MessageDlg('A data fim Evento Prazo Opção informada é menor que a data início. Favor alterar.', mtInformation, [mbOK], 0);
             exit;
           end;
         end;
      end;

      for c:=0 to chklstPlano.Items.Count-1 do
      begin
         if chklstPlano.Checked[c] then
         begin
           if qryPlano.Locate('NOME',chklstPlano.Items.Strings[c],[]) then
           begin
             sPlanos := sPlanos + qryPlano.FieldByName('IDPLANOPREV').AsString+', ';
           end;
         end;
      end;
      sPlanos := copy(sPlanos,1,(length(sPlanos)-2 ));


      for c:=0 to chklstFund.Items.Count-1 do
      begin
         if chklstFund.Checked[c] then
         begin
           if qryFund.Locate('NOME',chklstFund.Items.Strings[c],[]) then
           begin
             sSitpart := sSitpart + qryFund.FieldByName('Idsitpart').AsString+', ';
           end;
         end;
      end;
      sSitpart := copy(sSitpart,1,(length(sSitpart)-2 ));

      sMemoLines := MemoMatricula.Lines.Text;

      if sMemoLines <> '' then //Taffarel - SIG85075
      begin

        if copy(sMemoLines,length(sMemoLines) - 1,length(sMemoLines)) <> ';' then
           sMemoLines := sMemoLines + ';';

        if  (not(pos(';',sMemoLines) > 0)) and (not(pos('-',sMemoLines) > 0)) then
        begin
           sMatricula :=  QuotedStr(sMemoLines)+', ';
        end;
        if  (pos('-',sMemoLines) < pos(';',sMemoLines)) and (pos('-',sMemoLines) > 0) then
        begin
           sMatriculaIni := copy(sMemoLines,1,(pos('-',sMemoLines)-1));
           sMatriculaFim := copy(sMemoLines,(pos('-',sMemoLines)+1),(length(sMemoLines)-2));
           sMemoLines  := copy(sMemoLines,(pos(';',sMemoLines)+1),length(sMemoLines));
           sMatriculaFim := copy(sMatriculaFim,1,(pos(';',sMatriculaFim)-1));
           qryElegPatro.close;
           qryElegPatro.ParamByName('MATRICULAINI').AsString := sMatriculaIni;
           qryElegPatro.ParamByName('MATRICULAFIN').AsString := sMatriculaFim;
           qryElegPatro.open;

           while not(qryElegPatro.Eof) do
           begin
              sMatricula := sMatricula + QuotedStr(qryElegPatro.FieldByName('MATRICULA').AsString)+', ';
              qryElegPatro.next;
           end;
        end;
        if  (pos(';',sMemoLines) > 0) and (not(pos('-',sMemoLines) > 0)) and (trim(copy(sMemoLines,(pos(';',sMemoLines)+1),length(sMemoLines))) = '' ) then
        begin
               sMatricula := sMatricula +  QuotedStr(copy(sMemoLines,1,(pos(';',sMemoLines)-1)))+', ';
        end;
        while ((pos(';',sMemoLines) > 0) or (pos('-',sMemoLines) > 0)) and (trim(copy(sMemoLines,(pos(';',sMemoLines)+1),length(sMemoLines))) <> '' ) do
        begin
            while  (pos(';',sMemoLines) > 0) and (not(pos('-',sMemoLines) > 0)) do
            begin
               sMatricula := sMatricula + QuotedStr(copy(sMemoLines,1,(pos(';',sMemoLines)-1)))+', ';
               sMemoLines := trim(copy(sMemoLines,(pos(';',sMemoLines)+1),length(sMemoLines)));
            end;
            if  (not(pos(';',sMemoLines) > 0)) and (not(pos('-',sMemoLines) > 0)) then
            begin
               sMatriculaIni := copy(sMemoLines,1,(pos('-',sMemoLines)-1));
               sMatriculaFim := copy(sMemoLines,(pos('-',sMemoLines)+1),(length(sMemoLines)-2));
               sMemoLines  := copy(sMemoLines,(pos(';',sMemoLines)+1),length(sMemoLines));
               sMatriculaFim := copy(sMatriculaFim,1,(pos(';',sMatriculaFim)-1));
               qryElegPatro.close;
               qryElegPatro.ParamByName('MATRICULAINI').AsString := sMatriculaIni;
               qryElegPatro.ParamByName('MATRICULAFIN').AsString := sMatriculaFim;
               qryElegPatro.open;

               while not(qryElegPatro.Eof) do
               begin
                  sMatricula := sMatricula + QuotedStr(qryElegPatro.FieldByName('MATRICULA').AsString)+', ';
                  qryElegPatro.next;
               end;

            end
            else
            if  ((pos(';',sMemoLines) > 0)) and ((pos('-',sMemoLines) > 0)) then
            begin
               if (pos(';',sMemoLines) > pos('-',sMemoLines)) then
               begin
                  sMatricula := sMatricula + QuotedStr(copy(sMemoLines,1,(pos(';',sMemoLines)-1)))+', ';
                  sMemoLines := copy(sMemoLines,(pos(';',sMemoLines)+1),length(sMemoLines));
               end
               else
               Begin
                   sMatriculaIni := copy(sMemoLines,1,(pos('-',sMemoLines)-1));
                   sMatriculaFim := copy(sMemoLines,(pos('-',sMemoLines)+1),(length(sMemoLines)-2));
                   sMemoLines  := copy(sMemoLines,(pos(';',sMemoLines)+1),length(sMemoLines));
                   sMatriculaFim := copy(sMatriculaFim,1,(pos(';',sMatriculaFim)-1));
                   qryElegPatro.close;
                   qryElegPatro.ParamByName('MATRICULAINI').AsString := sMatriculaIni;
                   qryElegPatro.ParamByName('MATRICULAFIN').AsString := sMatriculaFim;
                   qryElegPatro.open;

                   while not(qryElegPatro.Eof) do
                   begin
                      sMatricula := sMatricula + QuotedStr(qryElegPatro.FieldByName('MATRICULA').AsString)+', ';
                      qryElegPatro.next;
                   end;

               end;
            end;
        End;

        sMatricula := copy(sMatricula,1,(length(sMatricula)-2 ));

      end; //Taffarel - SIG85075

      if ((edtDataBase.Text = '') and (CMDateTimePicker1.text = '' )) and
         (sMatricula = '') and   (sSitpart = '') and     (sPlanos = '')  then
      begin
         if MessageDlg('Não foram selecionado(s) filtro(s) para a "Busca" '+#13+#10+'por isso a sua pesquisa pode demorar a ser exibida. Deseja continuar ?', mtWarning, [mbYes, mbNo], 0) = mrNo then
            exit;
      end;


      //Abrir query relatorio

      qryGridResultado.Close;
      qryGridResultado.SQL.Clear;
      qryGridResultado.SQL.Add(' '+
      // Wylliam Leite da Silva - Sol: 257614 PPM: 963054 - Início
      //'  SELECT 1 AS SELECIONADO, '+chr(13)+chr(10)+
      '  SELECT DISTINCT 1 AS SELECIONADO, '+chr(13)+chr(10)+
      // Wylliam Leite da Silva - Sol: 257614 PPM: 963054 - Fim
      '  P.NOME, '+chr(13)+chr(10)+
      '  E.MATRICULA, '+chr(13)+chr(10)+
      '  P.NUMDOCUMENTO,  '+chr(13)+chr(10)+
      '  PF.DATANASC,   '+chr(13)+chr(10)+
      '  PL.NOME AS PLANO, '+chr(13)+chr(10)+
      '  SITF.DESCRICAO SITPATRO, '+chr(13)+chr(10)+
      '  SITPT.DESCRICAO SITFUND, '+chr(13)+chr(10)+
      '  SITPP.DESCRICAO SITPLANO,  '+chr(13)+chr(10)+
      '  PPP.INSCRICAODATA , '+chr(13)+chr(10)+
      '  E.DATADEMISSAO, '+chr(13)+chr(10)+
      '  COUNT(DECODE(E.DATADEMISSAO,null,1,0)) over() QTDESEMDATADEMISSAO, '+chr(13)+chr(10)+
      '  E.IDPESSOA,  '+chr(13)+chr(10)+
      '  PL.IDPLANOPREV,  '+chr(13)+chr(10)+
      '  PPP.IDSITPLANOPREV  '+chr(13)+chr(10)+      
      '  FROM ELEGPATRO E '+chr(13)+chr(10)+
      '  INNER JOIN PESSOA P '+chr(13)+chr(10)+
      '  ON (E.IDPESSOA = P.IDPESSOA) '+chr(13)+chr(10)+
      '  INNER JOIN PESSOA PJ '+chr(13)+chr(10)+
      '  ON (E.IDPESSJUR  = PJ.IDPESSOA) '+chr(13)+chr(10)+
      '  INNER JOIN PESSOAFISICA PF '+chr(13)+chr(10)+
      '  ON (E.IDPESSOA = PF.IDPESSOA) '+chr(13)+chr(10)+
      '  INNER JOIN PARTPREVPLAN PPP  '+chr(13)+chr(10)+
      '  ON (PPP.IDPESSOA = E.IDPESSOA) '+chr(13)+chr(10)+
      '  INNER JOIN PLANPREV PL  '+chr(13)+chr(10)+
      '  ON (PL.IDPLANOPREV = PPP.IDPLANOPREV) '+chr(13)+chr(10)+
      '  INNER JOIN SITPLANOPREV SITPP '+chr(13)+chr(10)+
      '  ON (SITPP.IDSITPLANOPREV = PPP.IDSITPLANOPREV) '+chr(13)+chr(10)+
      '  INNER JOIN SITPART SITPT '+chr(13)+chr(10)+
      '  ON (SITPT.IDSITPART = PPP.IDSITPART) '+chr(13)+chr(10)+
      '  INNER JOIN SITFUNC SITF   '+chr(13)+chr(10)+
      '  ON (SITF.IDSITFUNC = E.IDSITFUNC) '+chr(13)+chr(10)+
      '  INNER JOIN EVENTOSPREV EP   '+chr(13)+chr(10)+
      //'  ON (EP.IDPESSJUR  =  PPP.IDPESSJUR AND  EP.IDPLANOPREV  =  PPP.IDPLANOPREV  AND  EP.IDPESSOA  =  PPP.IDPESSOA  AND  EP.SEQPROPOSTA  =  PPP.SEQPROPOSTA AND EP.DATAEVENTO  = PPP.INSCRICAODATA) '+chr(13)+chr(10)+ //SIG87651
      '  ON (EP.IDPESSJUR  =  PPP.IDPESSJUR AND  EP.IDPLANOPREV  =  PPP.IDPLANOPREV  AND  EP.IDPESSOA  =  PPP.IDPESSOA  AND  EP.SEQPROPOSTA  =  PPP.SEQPROPOSTA) '+chr(13)+chr(10)+ //SIG87651
      '  WHERE SITPT.FLGEXTINST <> 0  AND SITPP.FLGINTERNO = ''NO'' ');


      if sMatricula <> '' then
      begin
         qryGridResultado.SQL.Add( 'AND E.MATRICULA IN ('+(sMatricula)+' ) ');
      end;

      if sPlanos <> '' then
      begin
         qryGridResultado.SQL.Add( 'AND PL.IDPLANOPREV IN ('+sPlanos +') ');
      end;

      if sSitpart <> '' then
      begin
         qryGridResultado.SQL.Add( 'AND SITPT.IDSITPART IN ('+sSitpart +') ');
      end;


      if (edtDataBase.Text <> '') then
      begin
        if (CMDateTimePicker1.text = '' ) then
        begin
           qryGridResultado.SQL.Add( 'AND EP.DATAEVENTO >= '+QuotedStr(edtDataBase.Text));
        end
        else
        begin
           qryGridResultado.SQL.Add( 'AND EP.DATAEVENTO BETWEEN  '+QuotedStr(edtDataBase.Text)+'   AND '+QuotedStr(CMDateTimePicker1.text));
        end;
      end;

      qryGridResultado.SQL.Add( '  ORDER BY  E.IDPESSOA, PL.IDPLANOPREV');

      qryGridResultado.Open;
      // MSG01
      if rdbTipoReal.Checked then
      begin
         if qryGridResultado.FieldByName('QTDESEMDATADEMISSAO').AsInteger > 0 then
         begin
            MessageDlg('Existem participantes que não possuem data de demissão. Esses participantes não serão apresentados.', mtInformation, [mbOK], 0);
         end;
         qryGridResultado.Filter := '';
         qryGridResultado.Filter := 'DATADEMISSAO IS NOT NULL';
         qryGridResultado.Filtered := true;
      end
      else
      begin
          qryGridResultado.Filtered := false;
      end;

      Self.Height   := iHeigthGrupoResult;
      Self.Width    := iWidthGrupoResult;
      Self.Position := poScreenCenter ;
      NBKRelExtInstitutos.ActivePage := 'RelatorioExtGrupoResultado';
      // mostrar botões de exportação
      BtnGeralExcel.Visible := (NBKRelExtInstitutos.ActivePage = 'RelatorioExtGrupoResultado');
      BtnGeralTXT.Visible   := (NBKRelExtInstitutos.ActivePage = 'RelatorioExtGrupoResultado');

   end
   else if (NBKRelExtInstitutos.ActivePage = 'RelatorioExtGrupoResultado') then
   begin
      qryGridResultado.Filter := 'SELECIONADO = 1';
      qryGridResultado.Filtered := true;
      c := 0;
      while not(qryGridResultado.Eof) do
      begin
         //REG REPLAN
         if (qryGridResultado.FieldByName('IDPLANOPREV').asstring = '2') and (qryGridResultado.FieldByName('SELECIONADO').asstring = '1') then
         begin
            dtmRelExtratoInstitutos.bRegReplan := (qryGridResultado.FieldByName('IDPLANOPREV').asstring = '2');//bRegReplan;

            if qryGridResultado.FieldByName('IDSITPLANOPREV').asstring = '25' then
            begin
               dtmRelExtratoInstitutos.bRegReplanSaldado := true;
               dtmRelExtratoInstitutos.bRegReplan := false;
            end
            else
            begin
               dtmRelExtratoInstitutos.bRegReplanSaldado := false;
               dtmRelExtratoInstitutos.bRegReplan := true;
            end;

            sIdPlanoPrevReg := qryGridResultado.FieldByName('IDPLANOPREV').asstring;
         end;
         //Novo Plano
         if (qryGridResultado.FieldByName('IDPLANOPREV').asstring = '74') and (qryGridResultado.FieldByName('SELECIONADO').asstring = '1') then
         begin
            dtmRelExtratoInstitutos.bNovoPlano := (qryGridResultado.FieldByName('IDPLANOPREV').asstring = '74');//bNovoPlano;
            sIdPlanoPrevNovo := qryGridResultado.FieldByName('IDPLANOPREV').asstring;
         end;
         //REB
         if (qryGridResultado.FieldByName('IDPLANOPREV').asstring = '66') and (qryGridResultado.FieldByName('SELECIONADO').asstring = '1') then
         begin
            dtmRelExtratoInstitutos.bReb  := (qryGridResultado.FieldByName('IDPLANOPREV').asstring = '66'); //bReb;
            sIdPlanoPrevReb := qryGridResultado.FieldByName('IDPLANOPREV').asstring;
         end;

         if (qryGridResultado.FieldByName('SELECIONADO').asstring = '1') then
         begin
            sIdPessoa := sIdPessoa + ', '+ qryGridResultado.FieldByName('IDPESSOA').asstring;
            inc(c);
         end;
         //sIdPlanoPrev := sIdPlanoPrev + ', '+ qryGridResultado.FieldByName('IDPLANOPREV').asstring;

         // Wylliam Leite da Silva - Sol: 257614 PPM: 963054 - Início
         {if c mod 100 = 0 then // executa a procedure a cada 100 pessoas para não dar erro no in dentro da procedure
         begin
            sIdPessoa := copy(sIdPessoa,3,length(sIdPessoa)) ;
        if sIdPlanoPrevReg <> '' then
           if sIdPlanoPrev <> '' then
              sIdPlanoPrev :=  sIdPlanoPrev +', ' + sIdPlanoPrevReg
           else
              sIdPlanoPrev :=  sIdPlanoPrevReg;
        if sIdPlanoPrevNovo <> '' then
           if sIdPlanoPrev <> '' then
              sIdPlanoPrev :=  sIdPlanoPrev +', ' + sIdPlanoPrevNovo
           else
              sIdPlanoPrev :=  sIdPlanoPrevNovo;
        if sIdPlanoPrevReb <> '' then
           if sIdPlanoPrev <> '' then
              sIdPlanoPrev :=  sIdPlanoPrev +', ' + sIdPlanoPrevReb
         else
            sIdPlanoPrev :=  sIdPlanoPrevReb;
            // Chama a procedure
            ExecutaProc(sIdPlanoPrev,sIdPessoa);
            // Fim da chamada da PROC
            sIdPlanoPrevReg  := '';
            sIdPlanoPrevNovo := '';
            sIdPlanoPrevReb  := '';
            sIdPessoa        := '';
         end;}
         qryAux.Close;
         qryAux.SQL.Clear;
         qryAux.SQL.Add(' INSERT INTO EXTRATOINSTREL VALUES(:prIDPESSOA, :prIDPLANO)');
         qryAux.ParamByName('prIDPESSOA').AsString:= qryGridResultado.FieldByName('IDPESSOA').AsString;
         qryAux.ParamByName('prIDPLANO').AsString := qryGridResultado.FieldByName('IDPLANOPREV').AsString;

         try  //SOL 262541 PPM 1094219
            qryAux.ExecSQL; //SOL 262541 PPM 1094219
         except //SOL 262541 PPM 1094219
         end; //SOL 262541 PPM 1094219
         // Wylliam Leite da Silva - Sol: 257614 PPM: 963054 - Fim
         qryGridResultado.next;
      end;


      if sIdPlanoPrevReg <> '' then
         if sIdPlanoPrev <> '' then
            sIdPlanoPrev :=  sIdPlanoPrev +', ' + sIdPlanoPrevReg
         else
            sIdPlanoPrev :=  sIdPlanoPrevReg;
      if sIdPlanoPrevNovo <> '' then
         if sIdPlanoPrev <> '' then
            sIdPlanoPrev :=  sIdPlanoPrev +', ' + sIdPlanoPrevNovo
         else
            sIdPlanoPrev :=  sIdPlanoPrevNovo;
      if sIdPlanoPrevReb <> '' then
         if sIdPlanoPrev <> '' then
            sIdPlanoPrev :=  sIdPlanoPrev +', ' + sIdPlanoPrevReb
         else
            sIdPlanoPrev :=  sIdPlanoPrevReb;


      if (trim(sIdPessoa) = '') then
      begin
         MessageDlg('Favor selecionar pelo menos um Plano.', mtInformation, [mbOK], 0);
         qryGridResultado.Filtered := false;
         exit;
      end;

      sIdPessoa := copy(sIdPessoa,3,length(sIdPessoa)) ;
      //sIdPlanoPrev := copy(sIdPlanoPrev,3,length(sIdPlanoPrev));

      // Chama a procedure
      //if sIdPessoa <> '' then
         ExecutaProc('',''); //(sIdPlanoPrev,sIdPessoa); // Peterson Victor SOL263416  PPM 1133273
      // Fim da chamada da PROC


      CtrlExtratoDesligamento.MontaSQLGeral(sistema.IdUsuario, dtmRelExtratoInstitutos.cds);
      CtrlExtratoDesligamento.MontaSQLRegReplan(sistema.IdUsuario, dtmRelExtratoInstitutos.cdsRegReplan);
      CtrlExtratoDesligamento.MontaSQLRegReplanSaldado(sistema.IdUsuario, dtmRelExtratoInstitutos.cdsRegReplanSaldado);
      CtrlExtratoDesligamento.MontaSQLNovoPlano(sistema.IdUsuario, dtmRelExtratoInstitutos.cdsNovoPlano);
      CtrlExtratoDesligamento.MontaSQLReb(sistema.IdUsuario, dtmRelExtratoInstitutos.cdsReb);

      qryGridResultado.Filtered := false;
      bbtnConfirmarClick(Sender);//Exibe o relatorio e
   end;

end;

procedure TfrmTipoExtratoInstitutos.bbtnSelTudoPlanoClick(Sender: TObject);
var
  c: integer;
begin
  inherited;
  for c:=0 to chklstPlano.Items.Count-1 do
    chklstPlano.Checked[c] := true;
  chklstPlano.Repaint;
end;

procedure TfrmTipoExtratoInstitutos.bbtnInvertePlanoClick(Sender: TObject);
var
  c: integer;
begin
  inherited;
  for c:=0 to chklstPlano.Items.Count-1 do
    chklstPlano.Checked[c] := not(chklstPlano.Checked[c]);
  chklstPlano.Repaint;
end;

procedure TfrmTipoExtratoInstitutos.bbtnSelTudoPatroClick(Sender: TObject);
var
  c: integer;
begin
  inherited;
  for c:=0 to chklstFund.Items.Count-1 do
    chklstFund.Checked[c] := true;
  chklstFund.Repaint;
end;

procedure TfrmTipoExtratoInstitutos.bbtnInvertePatroClick(Sender: TObject);
var
  c: integer;
begin
  inherited;
  for c:=0 to chklstFund.Items.Count-1 do
    chklstFund.Checked[c] := not(chklstFund.Checked[c]);
  chklstFund.Repaint;
end;

procedure TfrmTipoExtratoInstitutos.ToolbarButton972Click(Sender: TObject);
var abreForm : boolean;
begin
  inherited;
  MontaConsulta.Executar;

  if (MontaConsulta.RetornouValor) then begin
    edtMatriculaIndiv.Text      := MontaConsulta.ValoresChave[0];
    edtCpfIndiv.Text            := MontaConsulta.ValoresChave[1];
    edtNomeIndiv.Text           := MontaConsulta.ValoresChave[2];
    edtDataNascimentoIndiv.Text := MontaConsulta.ValoresChave[3];


    QryGrid.Close;
    QryGrid.Parambyname('Idpessoa').asInteger := strToint(MontaConsulta.ValoresChave[4]);
    QryGrid.Open;

    if (rdbTipoReal.Checked) then
    begin
      QryGrid.Filter := ' DATADEMISSAO IS NOT NULL' ;
      QryGrid.Filtered := true;
      while not(QryGrid.eof) do
      begin
        if QryGrid.FieldByName('DATADEMISSAO').AsString <> '' then
        begin
          abreForm := true;
        end;
        QryGrid.next;
      end;
      if not(abreForm) then
      begin
        MessageDlg('O participante não possue data de demissão. Esse participante não será apresentado.', mtInformation, [mbOK], 0);
      end;
    end;

    If QryGrid.Fieldbyname('DATADEMISSAO').asstring <> '' then
       edtDataDemissao.Text       := QryGrid.Fieldbyname('DATADEMISSAO').asstring
    else
       edtDataDemissao.Text       := QryGrid.Fieldbyname('SEMDATADEMISSAO').asstring;

  end;
end;

procedure TfrmTipoExtratoInstitutos.bbtnCancelarClick(Sender: TObject);
begin
  //inherited;
  dtmRelExtratoInstitutos.bMostraRelatorio := false;
  NBKRelExtInstitutos.ActivePage := 'PgTipoRelatorio';
  self.Height    :=  iHeigthTipo;
  self.Width     :=  iWidthTipo;
  BtnGeralExcel.Visible := (NBKRelExtInstitutos.ActivePage = 'RelatorioExtGrupoResultado');
  BtnGeralTXT.Visible   := (NBKRelExtInstitutos.ActivePage = 'RelatorioExtGrupoResultado');
end;

procedure TfrmTipoExtratoInstitutos.BtnGeralTXTClick(Sender: TObject);
var sIdPessoa, sIdPlanoPrev : string;
qryAux: TwwQuery; // Wylliam Leite da Silva - Sol: 257614 PPM: 963054
begin
  inherited;
  if not dtmBaseDados.dbBaseDados.InTransaction then
     dtmBaseDados.dbBaseDados.StartTransaction; // Wylliam Leite da Silva - Sol: 257614 PPM: 963054
  dtmRelExtratoInstitutos.bMostraRelatorio := false;
  //MSG02

  qryGridResultado.Filter := 'SELECIONADO = 1';
  qryGridResultado.Filtered := true;

  if (qryGridResultado.Eof) then
  begin
     MessageDlg('Favor selecionar pelo menos um Plano.', mtInformation, [mbOK], 0);
     qryGridResultado.Filtered := false;
     exit;
  end
  else
  begin
    // Wylliam Leite da Silva - Sol: 257614 PPM: 963054 - Inicio
     qryAux := TwwQuery.Create(Nil);
     qryAux.DatabaseName:= 'BaseDados';
     // Wylliam Leite da Silva - Sol: 257614 PPM: 963054 - Fim
     sIdPessoa := '';
     sIdPlanoPrev := '';

     while not(qryGridResultado.Eof) do
     begin
        {if ((sIdPessoa <> qryGridResultado.FieldByName('IDPESSOA').AsString) and (qryGridResultado.FieldByName('IDPLANOPREV').AsString <> sIdPlanoPrev)) or
           ((sIdPessoa = qryGridResultado.FieldByName('IDPESSOA').AsString) and (qryGridResultado.FieldByName('IDPLANOPREV').AsString <> sIdPlanoPrev))
        then
        begin}
            // Wylliam Leite da Silva - Sol: 257614 PPM: 963054 - Inicio
            qryAux.Close;
            qryAux.SQL.Clear;
            qryAux.SQL.Add(' INSERT INTO EXTRATOINSTREL VALUES(:prIDPESSOA, :prIDPLANO)');
            qryAux.ParamByName('prIDPESSOA').AsString:= qryGridResultado.FieldByName('IDPESSOA').AsString;
            qryAux.ParamByName('prIDPLANO').AsString := qryGridResultado.FieldByName('IDPLANOPREV').AsString;
            try //SOL 262541 PPM 1094219
               qryAux.ExecSQL;
            except
            end; //SOL 262541 PPM 1094219

        //end;
        //sIdPessoa := sIdPessoa + ', '+ qryGridResultado.FieldByName('IDPESSOA').asstring;
        //sIdPlanoPrev := sIdPlanoPrev + ', '+ qryGridResultado.FieldByName('IDPLANOPREV').asstring;
        // Wylliam Leite da Silva - Sol: 257614 PPM: 963054 - Fim
        qryGridResultado.next;
        sIdPessoa    := qryGridResultado.FieldByName('IDPESSOA').AsString;
        sIdPlanoPrev := qryGridResultado.FieldByName('IDPLANOPREV').AsString;
     end;
  end;
  // Wylliam Leite da Silva - Sol: 257614 PPM: 963054 - Início
  //sIdPessoa := copy(sIdPessoa,3,length(sIdPessoa)) ;
  //sIdPlanoPrev := copy(sIdPlanoPrev,3,length(sIdPlanoPrev));

  sIdPessoa:= '';
  sIdPlanoPrev:= '';
  // Chama a procedure
  ExecutaProc('','');//(sIdPlanoPrev,sIdPessoa); //Peterson Victor SOL263416  PPM 1133273
  // Fim da chamada da PROC

  {qryAux.Close;
  qryAux.SQL.Clear;
  qryAux.SQL.Add(' DELETE FROM EXTRATOINSTREL');
  qryAux.ExecSQL;}

  FreeAndNil(qryAux);
  // Wylliam Leite da Silva - Sol: 257614 PPM: 963054 - Fim

  // Faz a select no resultado da proc
  QryRelExtInstitutos.close;
  QryRelExtInstitutos.ParamByName('IDSESSAO').AsString :=  IntToStr(sistema.IdUsuario)+formatdatetime('ddmmyyyy',now);
  QryRelExtInstitutos.open;

  if QryRelExtInstitutos.RecordCount > 0 then
  begin
     // Monta o arquivo
     MontaArquivoTxt(QryRelExtInstitutos);
  end;
  qryGridResultado.Filtered := false;
  ApagaRelatorio();
end;

procedure TfrmTipoExtratoInstitutos.ApagaRelatorio();
var
  sSql : string;
begin
  inherited;
   sSql := ' DELETE FROM RELEXTRATODOSINSTITUTOS EXT WHERE IDSESSAO = '+IntToStr(sistema.IdUsuario)+formatdatetime('ddmmyyyy',now);
   qryAux.Close;
   qryAux.Sql.Clear;
   qryAux.Sql.Add(sSql);
   if not dtmBaseDados.dbBaseDados.InTransaction then
   begin
      dtmBaseDados.dbBaseDados.StartTransaction;
   end;
   qryAux.ExecSQL;

   dtmBaseDados.dbBaseDados.Commit;

end;

procedure TfrmTipoExtratoInstitutos.BtnGeralExcelClick(Sender: TObject);
var sIdPessoa, sIdPlanoPrev : string;
qryAux: TwwQuery; // Wylliam Leite da Silva - Sol: 257614 PPM: 963054
begin
  inherited;
  if not dtmBaseDados.dbBaseDados.InTransaction then
     dtmBaseDados.dbBaseDados.StartTransaction; // Wylliam Leite da Silva - Sol: 257614 PPM: 963054
  dtmRelExtratoInstitutos.bMostraRelatorio := false;
  //MSG02
  sIdPessoa := '';
  qryGridResultado.Filter := 'SELECIONADO = 1';
  qryGridResultado.Filtered := true;
   if (qryGridResultado.Eof) then
  begin
     MessageDlg('Favor selecionar pelo menos um Plano.', mtInformation, [mbOK], 0);
     qryGridResultado.Filtered := false;
     exit;
  end
  else
  begin
     // Wylliam Leite da Silva - Sol: 257614 PPM: 963054 - Inicio
     qryAux := TwwQuery.Create(Nil);
     qryAux.DatabaseName:= 'BaseDados';
     // Wylliam Leite da Silva - Sol: 257614 PPM: 963054 - Fim
     sIdPessoa := '';
     sIdPlanoPrev := '';
     while not(qryGridResultado.Eof) do
     begin
        {if ((sIdPessoa <> qryGridResultado.FieldByName('IDPESSOA').AsString) and (qryGridResultado.FieldByName('IDPLANOPREV').AsString <> sIdPlanoPrev)) or
           ((sIdPessoa = qryGridResultado.FieldByName('IDPESSOA').AsString) and (qryGridResultado.FieldByName('IDPLANOPREV').AsString <> sIdPlanoPrev))
        then
        begin}
            // Wylliam Leite da Silva - Sol: 257614 PPM: 963054 - Inicio
            qryAux.Close;
            qryAux.SQL.Clear;
            qryAux.SQL.Add(' INSERT INTO EXTRATOINSTREL VALUES(:prIDPESSOA, :prIDPLANO)');
            qryAux.ParamByName('prIDPESSOA').AsString:= qryGridResultado.FieldByName('IDPESSOA').AsString;
            qryAux.ParamByName('prIDPLANO').AsString := qryGridResultado.FieldByName('IDPLANOPREV').AsString;
            try //SOL 262541 PPM 1094219
               qryAux.ExecSQL;
            except
            end; //SOL 262541 PPM 1094219
        //end;
        //sIdPessoa := sIdPessoa + ', '+ qryGridResultado.FieldByName('IDPESSOA').asstring;
        //sIdPlanoPrev := sIdPlanoPrev + ', '+ qryGridResultado.FieldByName('IDPLANOPREV').asstring;
        // Wylliam Leite da Silva - Sol: 257614 PPM: 963054 - Fim
        qryGridResultado.next;
        sIdPessoa    := qryGridResultado.FieldByName('IDPESSOA').AsString;
        sIdPlanoPrev := qryGridResultado.FieldByName('IDPLANOPREV').AsString;

     end;
  end;
  // Wylliam Leite da Silva - Sol: 257614 PPM: 963054 - Início
  //sIdPessoa := copy(sIdPessoa,3,length(sIdPessoa)) ;
  //sIdPlanoPrev := copy(sIdPlanoPrev,3,length(sIdPlanoPrev));

  sIdPessoa:= '';
  sIdPlanoPrev:= '';
  // Chama a procedure
  ExecutaProc('',''); //sIdPlanoPrev,sIdPessoa // Peterson Victor SOL263416  PPM 1133273
  // Fim da chamada da PROC

  {qryAux.Close;
  qryAux.SQL.Clear;
  qryAux.SQL.Add(' DELETE FROM EXTRATOINSTREL');
  qryAux.ExecSQL;}

  FreeAndNil(qryAux);
  // Wylliam Leite da Silva - Sol: 257614 PPM: 963054 - Fim

  // Faz a select no resultado da proc
  QryRelExtInstitutos.close;
  QryRelExtInstitutos.ParamByName('IDSESSAO').AsString :=  IntToStr(sistema.IdUsuario)+formatdatetime('ddmmyyyy',now);
  QryRelExtInstitutos.open;

  if QryRelExtInstitutos.RecordCount > 0 then
  begin
     // Monta o arquivo
     MontaArquivoExcel();
  end;
  qryGridResultado.Filtered := false;
  //ApagaRelatorio();
end;

procedure TfrmTipoExtratoInstitutos.bbtnSairClick(Sender: TObject);
begin
  dtmRelExtratoInstitutos.bMostraRelatorio := false;
  inherited;

end;

end.
