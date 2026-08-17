// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
//// Autor(a)    :  Jéssica Lana
// Data        :  20/02/2009
// Pendência   :  SOL 109421 KINTANA 496332
// Descricao   :  Alteração de gravação de arquivos de log na raiz do disco C:
//------------------------------------------------------------------------------
//Autor(a)    : Leo
// Data        : 03/04/2006
// Pendência   : 21242
// Rotina      : criação da tela
// Alteração   :
//------------------------------------------------------------------------------

unit FInscricaoNovoPlano;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, ComCtrls, BfDialogs, BrowseFolder, uProcuraDir,
  Db, DBTables, Wwquery, Wwtable, DBClient, uCMClientDataSet, uCmSqlParams, usistema,
  Spin;

type

     TNovoPlano     = Record
                      MATRICULA               : String[7];
                      NOME                    : String[40];
                      CPF                     : String[11];
                      SEXO                    : String[1];
                      DT_NASC                 : String[10];
                      PERCENTUAL              : String[4];
                  End;



  TfrmInscricaoNovoPlano = class(TfrmOkCancelar)
    ProcuraDirDlg1: TProcuraDirDlg;
    GroupBox1: TGroupBox;
    lblPathArqProc: TLabel;
    edCaminhoEntrada: TEdit;
    Label1: TLabel;
    qryAux: TwwQuery;
    GroupBox3: TGroupBox;
    lblBarraProgresso: TLabel;
    pBar: TProgressBar;
    sqlParam: TCMSqlParams;
    cdsBuscaPessoa: TCMClientDataSet;
    cdsAux: TCMClientDataSet;
    Panel1: TPanel;
    memresult: TRichEdit;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SaveDlg: TSaveDialog;
    odTxt: TOpenDialog;
    GroupBox2: TGroupBox;
    memdesc: TMemo;
    GroupBox4: TGroupBox;
    lblArqGravar: TLabel;
    spedArqGravar: TSpeedButton;
    edArqGravar: TEdit;
    lblregcheck: TLabel;
    lblrejeitadoscheck: TLabel;
    SpeedButton3: TSpeedButton;
    lblregprocesso: TLabel;
    lblrejeitadosproc: TLabel;
    lblregerro: TLabel;
    sbtnTabCargos: TSpeedButton;
    ednomearq: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    qryupdate: TwwQuery;
    Memo1: TMemo;
    BitBtn1: TBitBtn;
    ToolbarSep972: TToolbarSep97;
    Spin: TSpinEdit;

    procedure bbtnConfirmarClick(Sender: TObject);
    procedure btnArqProcessarClick(Sender: TObject);
    procedure spedArqGravarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure sbtnTabCargosClick(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure bbtnSairClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure SpinChange(Sender: TObject);

  private
    { Private declarations }

    LRegNovoPlano                   : TNovoPlano;
    Ini                             : TTime;
    Contador                        : Integer;


    wArquivoImportacao,
    wArquivoImportacaoAux,
    wArquivoBad : TextFile;

    wLinha,
    wLinhaGrava , wLinhaMat       : String;

    bcancela : boolean;

    function  VerificaArquivo       ( Arquivo    : String )             : boolean;
    function  VerificaTamArquivo               : longint;
    function  Critica(wLinha, sLinha : String; bDesfaz : Boolean) : Boolean;

    Procedure ImportacaoNovoPlano;
    Procedure DesfazNovoPlano;


    Function BuscaPessoa(sMat : String ; var sIdPessjur, sIdPessoa, sIdPlanoPrev, sFlgInterno,
                         sIdSitPart, sIdSitFunc , sIdSitPlanoPrev , sIdPessjurCedido, sInscricaoData, sNumInsc :String ; slinha : String;
                         var ierro : integer; bDesfaz : Boolean) : Boolean;


  public
    function TrataData(var sEntrada : String) : String;
    function TrataNumero(var sEntrada : String; nDec : Integer) : String;
    { Public declarations }
  end;

var
  frmInscricaoNovoPlano: TfrmInscricaoNovoPlano;


  sIdPessjur, sMatriculaAnt, sIdPessoa , sIdPlanoPrev,
  sFlgInterno,  sAux ,
  sIdSitPart, sIdSitFunc , sIdSitPlanoPrev, sIdPessjurCedido,
  sInscricaoData : String;
  iTamArquivo : Integer;



implementation

Uses uDataBAse, UMensErro,  DBaseDados, UModuloFuncef, uCmControlObject,
  FSeparadorArqFinanc;


{$R *.DFM}


Function TfrmInscricaoNovoPlano.VerificaArquivo(Arquivo : String):Boolean;
begin
  Result := True;
   // Testa se Arquivo Especificado Existe
  If (Not (FileExists(Arquivo)))
  Then Begin
    MsgDlg('O arquivo '+Arquivo+ ' não foi encontrado no caminho especificado. Verifique. ', 'Erro', mtError, [mbOk],0);
    edCaminhoEntrada.SetFocus;
    Result := False;
  End;
end;

procedure TfrmInscricaoNovoPlano.bbtnConfirmarClick(Sender: TObject);
var bFaltaArq : Boolean;
begin
  inherited;
  memResult.Lines.Clear;

  Contador:= 0;
  Ini     := Time;
  pBar.Position := 0;

  lblBarraProgresso.Visible := True;
  lblBarraProgresso.Caption := 'Importando arquivo de inscrições Novo Plano.';
  Application.ProcessMessages;

  bcancela := false;

  ImportacaoNovoPlano;


  // Mostra Tempo da Importação
  Application.ProcessMessages;
  MsgDlg('Inicio.:   '+TimeToStr(Ini) +#13+
         'Final .:   '+TimeToStr(Time)+#13+
         '             ---------------'+#13+
         'Tempo .: '+TimeToStr(Time-Ini)+#13#13+
         'Número de Registros.: '+IntToStr(Contador)+#13#13,
         'Importação OK',mtInformation,[MbOk],0);

end;

function  TfrmInscricaoNovoPlano.VerificaTamArquivo  : longint;
var iTam : longint;
    sAux : string;
begin
   Result := 0;
   iTam   := 0;

   while not Eof(wArquivoImportacao) do
   begin
      Readln(wArquivoImportacao, sAux);
      inc(iTam);
   end;


   // Voltar arquivo para o inicio
   CloseFile(wArquivoImportacao);
   Reset(wArquivoImportacao);

   Result := iTam;
end;



Function TfrmInscricaoNovoPlano.Critica(wLinha, sLinha : String; bDesfaz : Boolean) : Boolean;
var berro: boolean;
sConteudo : String;
begin
   berro := false;

   LRegNovoPlano.MATRICULA    := Copy(wLinha,       1    ,        7);
   LRegNovoPlano.NOME         := Copy(wLinha,       8    ,       40);
   LRegNovoPlano.CPF          := Copy(wLinha,      48    ,       11);
   LRegNovoPlano.SEXO         := Copy(wLinha,      59    ,        1);
   LRegNovoPlano.DT_NASC      := Copy(wLinha,      60    ,       10);
   LRegNovoPlano.PERCENTUAL   := Copy(wLinha,      70    ,        4);

   sConteudo := '';

   if trim(LRegNovoPlano.MATRICULA) = '' then
   begin
      sConteudo := ',Matrícula em branco';
      berro := true;
   end;

   if bDesfaz then result := not berro;


   if trim(LRegNovoPlano.NOME) = '' then
   begin
      sConteudo := sConteudo + ',Nome em branco';
      berro := true;
   end;

   if trim(LRegNovoPlano.CPF) = '' then
   begin
      sConteudo := sConteudo + ',CPF em branco';
      berro := true;
   end;

   if trim(LRegNovoPlano.SEXO) = '' then
   begin
      sConteudo := sConteudo + ',Sexo em branco';
      berro := true;
   end;

   if (trim(LRegNovoPlano.SEXO) <> '')  and
      (trim(uppercase(LRegNovoPlano.SEXO)) <> 'M') and
      (trim(uppercase(LRegNovoPlano.SEXO)) <> 'F')  then
   begin
      sConteudo := sConteudo + ',Sexo inválido '''+LRegNovoPlano.SEXO+''' ';
      berro := true;
   end;

   if (trim(LRegNovoPlano.DT_NASC) = '') or (copy(LRegNovoPlano.DT_NASC,1,2)='00') then
   begin
      sConteudo := sConteudo + ',Data de nascimento em branco';
      berro := true;
   end;

   if trim(LRegNovoPlano.PERCENTUAL) = '' then
   begin
      sConteudo := sConteudo + ',Percentual em branco';
      berro := true;
   end;


   if berro then
   begin
      memresult.lines.add('Linha '+slinha+', Matrícula '+LRegNovoPlano.MATRICULA+' - ( '+copy(sconteudo,2,length(sconteudo))+' )');
      WriteLn(wArquivoBad,wlinha);
   end;



   result := not berro;
end;


Procedure TfrmInscricaoNovoPlano.ImportacaoNovoPlano;
var
  iTamArquivo, irejeitados, ierro, icontaux      : longint;
  bSeleciona : Boolean;
  sMatAux, sIdEventosPrev, sNumInsc , sTaxa: String;
begin

   memResult.Lines.Clear;
   memResult.Lines.add('FUNCEF '+sistema.Versao+'                                     '+datetostr(date));
   memResult.Lines.add('                   Importação de Inscrições Novo Plano                        ');
   memResult.Lines.add('                               Log de Erros                                   ');
   memResult.Lines.add('Arquivo de entrada: '+edCaminhoEntrada.text);
   memResult.Lines.add('Arquivo de saída  : '+ednomearq.text+'.bad');
   memResult.Lines.add('Usuário: '+sistema.NomeUsuario );
   memResult.Lines.add('------------------------------------------------------------------------------');
   memResult.Lines.add('');


   lblBarraProgresso.Visible  :=True;
   lblBarraProgresso.Update;

   Application.ProcessMessages;

   Try
     AssignFile(wArquivoImportacao, edCaminhoEntrada.Text);
     Reset(wArquivoImportacao);
   Except
     memResult.Lines.Add('   Erro ao abrir o arquivo de inscrições do Novo Plano.');
     Exit;
   End;


   Try
     AssignFile(wArquivoBad,edArqGravar.Text+ednomearq.text+'.bad');
     Rewrite(wArquivoBad);
   Except
      CloseFile(wArquivoImportacao);
      memResult.Lines.Add('   Erro criar arquivo BAD.');
      Exit;
   End;


   //lblBarraProgresso.Caption := 'Processando Arquivo de Empregados ...';
   Application.ProcessMessages;

   iTamArquivo := VerificaTamArquivo;
   pBar.Min    := 0;
   pBar.Max    := iTamArquivo;

   irejeitados := 0;
   ierro := 0;
   icontaux := 0;


   If dtmBaseDados.dbBaseDados.InTransaction
   then dtmBaseDados.dbBaseDados.Commit;
   StartTransacao;

   while not Eof(wArquivoImportacao) do
   begin
      Readln(wArquivoImportacao,wLinha);
      pBar.Position := pBar.Position + 1;
      Inc(Contador);

      inc(icontaux);
      if icontaux >= spin.Value then
      begin
         if dtmBaseDados.dbBaseDados.InTransaction
         then dtmBaseDados.dbBaseDados.Commit;
         StartTransacao;

         icontaux := 0;
      end;


      if not Critica(wLinha,inttostr(Contador), False) then
      begin
         inc(irejeitados);
      end
      else
      begin

         if (BuscaPessoa(LRegNovoPlano.MATRICULA, sIdPessjur, sIdPessoa, sIdPlanoPrev, sFlgInterno,
                        sIdSitPart, sIdSitFunc , sIdSitPlanoPrev, sIdPessjurCedido,
                        sInscricaoData,sNumInsc, inttostr(contador), ierro, false))
         then
         begin
            //participante já existente no Replan
            if sIdPlanoPrev = '2' then
            begin
               qryaux.close;
               qryaux.sql.text := ' SELECT SEQEVENTOSPREV.NEXTVAL ID FROM DUAL ';
               qryaux.open;

               sIdEventosPrev := qryaux.fieldbyname('ID').AsString;

               //grava evento de saldamento
               qryAux.close;
               qryAux.sql.text := ' INSERT INTO EVENTOSPREV( IDEVENTOSPREV, IDSITPLANOATUAL, '+
                                  ' IDPESSOA, IDSITFUNCATUAL,IDEVENTOGERADOR, IDPESSJUR, IDSITPARTATUAL, '+
                                  ' IDPLANOPREV, IDSITPLANONOVO, IDSITFUNCNOVO, IDSITPARTNOVO, '+
                                  ' DATAREGISTRO, DATAEVENTO, '+
                                  ' FLGEFETIVADO, SEQPROPOSTA, INSCRICAONUMERO, FLGMIGRADO) '+
                                  ' VALUES '+
                                  ' ( '''+sIdEventosPrev+''', '+
                                  ' '''+sIdSitPlanoPrev+''', '+
                                  ' '''+sIdPessoa+''' , '+
                                  ' '''+sIdSitfunc+''', '+
                                  ' 334, '+ //saldamento
                                  ' 91008, '+
                                  ' '''+sIdSitpart+''', '+
                                  ' 2, '+ //plano
                                  ' '''+sIdSitPlanoPrev+''', '+
                                  ' '''+sIdSitfunc+''', '+
                                  ' 50, '+ //sitpart - saldado
                                  ' TRUNC(SYSDATE), TRUNC(SYSDATE), '+
                                  ' 0, 1, '''+sNumInsc+''', '+
                                  ' 0 ) ';
               try
                  qryAux.ExecSQL;
               except
                  memresult.lines.add('Linha '+inttostr(Contador)+', Matrícula '+LRegNovoPlano.MATRICULA+' - Erro ao inserir evento de saldamento.');
                  WriteLn(wArquivoBad,wlinha);
                  inc(ierro);
                  continue;
               end;



               //suspende contribuições
               qryAux.Close;
               qryAux.Sql.text := ' UPDATE CONTRIBPREVPARTP SET FLGCOBRA = 0 , DATAFINAL = TRUNC(SYSDATE) '+
                               ' WHERE IDPESSJUR = 91008 AND '+
                               ' IDPESSOA = '''+sIdPessoa+''' AND '+
                               ' IDPLANOPREV = 2 ';
               try
                  qryAux.ExecSQL;
               except
                 memresult.lines.add('Linha '+inttostr(Contador)+', Matrícula '+LRegNovoPlano.MATRICULA+' - Erro ao suspender contribuições.');
                 WriteLn(wArquivoBad,wlinha);              
                 inc(ierro);
                 continue;
               end;



               //atualiza sitpart
               qryAux.close;
               qryAux.sql.text := ' UPDATE PARTPREVPLAN SET IDSITPART = 50, FLGDESATIVADO = 1 '+
                                  ' WHERE IDPESSJUR = 91008 AND '+
                                  ' IDPESSOA = '''+sIdPessoa+''' AND '+
                                  ' IDPLANOPREV = 2 ';
               try
                  qryAux.ExecSQL;
               except
                 memresult.lines.add('Linha '+inttostr(Contador)+', Matrícula '+LRegNovoPlano.MATRICULA+' - Erro ao atualizar registro Replan.');
                 WriteLn(wArquivoBad,wlinha);              
                 inc(ierro);
                 continue;
               end;
            end
            else //nova pessoa
            begin

               //insere pessoa
               qryAux.close;
               qryAux.sql.text := ' INSERT INTO PESSOA (IDPESSOA,NOME,NUMDOCUMENTO,IDDOCUMENTO, TIPO) '+
                                  ' VALUES('''+sIdPessoa+''','''+lregnovoplano.NOME+''','''+lregnovoplano.CPF+''' '+
                                  ' 2,''F'') ';
               try
                  qryAux.ExecSQL;
               except
                 memresult.lines.add('Linha '+inttostr(Contador)+', Matrícula '+LRegNovoPlano.MATRICULA+' - Erro ao atualizar registro Replan.');
                 WriteLn(wArquivoBad,wlinha);
                 inc(ierro);
                 continue;
               end;


               qryAux.close;
               qryAux.sql.text := ' INSERT INTO DEPENDENTE( IDPESSOA ) '+
                                  ' VALUES ( '''+sidPessoa+''' )  ';
               try
                  qryAux.ExecSQL;
               except
                 memresult.lines.add('Linha '+inttostr(Contador)+', Matrícula '+LRegNovoPlano.MATRICULA+' - Erro ao inserir como dependente.');
                 WriteLn(wArquivoBad,wlinha);
                 inc(ierro);
                 continue;
               end;


               qryAux.close;
               qryAux.sql.text := ' INSERT INTO DEPENTIT( IDTITULAR, IDPESSOA, IDDEPENDENCIA,  '+
                                  '    NUMSEQUENCIA, FLGCONTAIMPOSTOR, FLGBENEFICIARIO, MATRICULA) '+
                                  ' VALUES '+
                                  ' (  '''+sidPessoa+''', '''+sidPessoa+''' , ''PRP'', '+
                                  ' 0, 0, 0,'''+lregnovoplano.MATRICULA+''' )  ';
               try
                  qryAux.ExecSQL;
               except
                 memresult.lines.add('Linha '+inttostr(Contador)+', Matrícula '+LRegNovoPlano.MATRICULA+' - Erro ao inserir Depentit.');
                 WriteLn(wArquivoBad,wlinha);
                 inc(ierro);
                 continue;
               end;


               qryAux.close;
               qryAux.sql.text := ' INSERT INTO PESSOAFISICA (IDPESSOA,SEXO, DATANASC) '+
                                  ' VALUES '+
                                  ' (  '''+sidPessoa+''', '''+lregnovoplano.SEXO+''' , '+
                                  ' TO_DATE('''+lregnovoplano.DT_NASC+''',''DD/MM/YYYY'')  ) ';
               try
                  qryAux.ExecSQL;
               except
                 memresult.lines.add('Linha '+inttostr(Contador)+', Matrícula '+LRegNovoPlano.MATRICULA+' - Erro ao inserir PessoaFisica.');
                 WriteLn(wArquivoBad,wlinha);
                 inc(ierro);
                 continue;
               end;

            end;




            //PARTE GERAL
            qryAux.Close;
            qryAux.SQL.Clear;
            qryAux.SQL.Add(' SELECT NVL(MAX(INSCRICAONUMERO),0) + 1 AS PROXINSC FROM PARTPREVPLAN '+
                          ' WHERE IDPLANOPREV = 74 ');
            qryAux.Open;
            sNumInsc := qryaux.fieldbyname('PROXINSC').AsString;


            qryaux.close;
            qryaux.sql.text := ' INSERT INTO PARTPREVPLAN( IDPESSJUR, IDPESSOA, IDPLANOPREV, IDSITPART,  '+
                               '   SEQPROPOSTA, IDSITPLANOPREV, INSCRICAONUMERO, INSCRICAODATA, '+
                               '   DTINICIOINSC, FLGDESATIVADO) '+
                               ' VALUES '+
                               ' ( 91008, '''+sIdPessoa+''' , 74, '+
                               ' 1,1,1, '''+sNumInsc+''', TRUNC(SYSDATE), TRUNC(SYSDATE), 0)  ';
            try
               qryaux.ExecSQL;
            except
               memresult.lines.add('Linha '+inttostr(Contador)+', Matrícula '+LRegNovoPlano.MATRICULA+' - Erro ao inserir Participante.');
               WriteLn(wArquivoBad,wlinha);
               inc(ierro);
               continue;
            end;



            qryaux.close;
            qryaux.sql.text := ' SELECT SEQEVENTOSPREV.NEXTVAL ID FROM DUAL ';
            qryaux.open;
            sIdEventosPrev := qryaux.fieldbyname('ID').AsString;

            qryAux.close;
            qryAux.sql.text := ' INSERT INTO EVENTOSPREV( IDEVENTOSPREV, IDSITPLANOATUAL, '+
                               ' IDPESSOA, IDSITFUNCATUAL,IDEVENTOGERADOR, IDPESSJUR, IDSITPARTATUAL, '+
                               ' IDPLANOPREV, IDSITPLANONOVO, IDSITFUNCNOVO, IDSITPARTNOVO, '+
                               ' DATAREGISTRO, DATAEVENTO, '+
                               ' FLGEFETIVADO, SEQPROPOSTA, INSCRICAONUMERO, FLGMIGRADO) '+
                               ' VALUES '+
                               ' ( '''+sIdEventosPrev+''', '+
                               ' NULL,'''+sIdPessoa+''' , '+
                               ' '''+sIdSitFunc+''', '+
                               ' NULL, '+
                               ' 91008, '+
                               ' 8, '+
                               ' 74, '+
                               ' 1, '+
                               ' '''+sIdSitfunc+''', '+
                               ' 1, '+
                               ' TRUNC(SYSDATE), TRUNC(SYSDATE), '+
                               ' 0, 1, '+
                               ' '''+sNumInsc+''', '+ //inscricaonumero
                               ' 0 ) ';
            try
               qryAux.ExecSQL;
            except
               memresult.lines.add('Linha '+inttostr(Contador)+', Matrícula '+LRegNovoPlano.MATRICULA+' - Erro ao inserir evento de inscrição.');
               WriteLn(wArquivoBad,wlinha);
               inc(ierro);
               continue;
            end;



            //associa contribuições
            qryAux.Close;
            qryAux.Sql.Clear;
            qryAux.Sql.text := ' SELECT CT.IDCONTRIBUICAO, C.IDTPPERIODICIDADE '+
                           ' FROM CONTPREVEVENTO CT, CONTRIBUICAO C ' +
                           ' WHERE CT.IDPLANOPREV     = 74  AND ' +
                           '       CT.IDEVENTOGERADOR = 1  AND '+
                           '       C.IDCONTRIBUICAO = CT.IDCONTRIBUICAO ';
            qryAux.Open;
            qryAux.First;
            while not qryAux.EOF do
            begin

               sTaxa := '0';
               if trim(lregnovoplano.PERCENTUAL) <> '' then
                  sTaxa := lregnovoplano.PERCENTUAL ;


               qryupdate.close;
               qryupdate.sql.text := ' INSERT INTO CONTRIBPREVPARTP(IDPESSJUR, IDPESSOA, IDPLANOPREV, IDCONTRIBUICAO, SEQPROPOSTA, ' +
                          '                                 FLGRETROATIVO, FLGCOBRA, DATAINICIO, DATAFINAL, IDTPPERIODICIDADE, ' +
                          '                                 FLGDESCFOLHA, CODPORTFORMA, VALORBASE1 ) ' +
                          ' VALUES( 91008,'''+sIdPessoa+''','+
                          ' 74 ,'+
                          qryAux.FieldByName('IDCONTRIBUICAO').AsString+ ',1,' +
                          ' 0, 1 , TRUNC(SYSDATE),' +
                          ' NULL , 1 , 1 , NULL, '+
                          ' '+sTaxa+'/100 ) ';
               try
                  qryupdate.ExecSQL;
               except
                  memresult.lines.add('Linha '+inttostr(Contador)+', Matrícula '+LRegNovoPlano.MATRICULA+' - Erro ao inserir contribuições.');
                  WriteLn(wArquivoBad,wlinha);
                  inc(ierro);
                  continue;
               end;

               qryaux.next;
            end;



            qryAux.close;
            qryAux.sql.text := ' INSERT INTO RESERVAPART '+
                                  ' (IDTIPORESERVA, IDPLANOPREV, IDPESSOA , IDPESSJUR, DATAREFERENCIASA, '+
                                  ' SEQPROPOSTA, VALORRESERVA, FLGATIVO, FLGINCONSISTENCIA) '+
                                  ' SELECT RP.IDTIPORESERVA , RP.IDPLANOPREV, P.IDPESSOA, P.IDPESSJUR, '+
                                  ' TRUNC(SYSDATE), 1, 0, 1, 0 '+
                                  ' FROM PARTPREVPLAN P, RESERVAXPLANO RP, RESERVAXCONTRIB RC, CONTRIBPREVPARTP CP '+
                                  ' WHERE P.IDPESSOA = '''+sIdPessoa+''' AND'+
                                  ' P.IDPESSJUR = CP.IDPESSJUR AND '+
                                  ' P.IDPLANOPREV = CP.IDPLANOPREV AND '+
                                  ' P.IDPLANOPREV = 74 AND '+
                                  ' P.IDPESSJUR = 91008  AND '+
                                  ' P.IDPESSOA = CP.IDPESSOA AND '+
                                  ' RP.IDPLANOPREV = P.IDPLANOPREV AND '+
                                  ' RP.ANALITICOSINTETI = ''A'' AND '+
                                  ' NVL(RP.FLGCOLETIVA,0) = 0 AND '+
                                  ' RC.IDPLANOPREV = RP.IDPLANOPREV  AND '+
                                  ' RC.IDTIPORESERVA = RP.IDTIPORESERVA AND '+
                                  ' CP.IDCONTRIBUICAO = RC.IDCONTRIBUICAO AND '+
                                  ' NOT EXISTS '+
                                  ' (SELECT 1 FROM RESERVAPART R '+
                                  ' WHERE R.IDPESSJUR = P.IDPESSJUR AND '+
                                  ' R.IDPLANOPREV = P.IDPLANOPREV AND '+
                                  ' R.IDPESSOA = P.IDPESSOA) ';
            try
               qryAux.ExecSQL;
            except
               memresult.lines.add('Linha '+inttostr(Contador)+', Matrícula '+LRegNovoPlano.MATRICULA+' - Erro ao inserir reservas.');
               WriteLn(wArquivoBad,wlinha);
               inc(ierro);
               continue;
            end;
         end;

      end; //while


      lblregprocesso.Caption := 'Registros processados: '+inttostr(Contador);
      lblrejeitadosproc.Caption := 'Registros rejeitados no processo: '+inttostr(irejeitados);
      lblregerro.caption := 'Registros com erro: '+inttostr(ierro);
      Application.ProcessMessages;


      if bcancela then
      begin
         If dtmBaseDados.dbBaseDados.InTransaction
         then dtmBaseDados.dbBaseDados.Rollback;

         memResult.Lines.add('------------------------------------------------------------------------------');
         memResult.Lines.add('PROCESSO CANCELADO PELO USUÁRIO');
         memResult.Lines.add('------------------------------------------------------------------------------');
         break;
      end;


  end; // while


  Try
    If not Sistema.GravaLogOperacoes('Importação de inscrições Novo Plano.') Then
       Raise Exception.Create('Erro ao gravar Log.');
  Except
  End;

  If dtmBaseDados.dbBaseDados.InTransaction
  then dtmBaseDados.dbBaseDados.Commit;

  if (ierro > 0) or (irejeitados > 0) then
  begin
     MsgDlg('Ocorreram alguns erros durante o processo.','Aviso',mtError,[mbOk],0);
     memResult.Lines.add('------------------------------------------------------------------------------');
     memResult.Lines.add('Ocorreram '+inttostr(ierro)+' erros e '+inttostr(irejeitados)+' rejeições no processo.');
     memResult.Lines.add('Arquivo com '+inttostr(Contador)+' registros.');
     memResult.Lines.add('------------------------------------------------------------------------------');
  end   
  else
  begin
     MsgDlg('Processado com sucesso.','Aviso',mtInformation,[mbOk],0);
     memResult.Lines.add('------------------------------------------------------------------------------');
     memResult.Lines.add('Processo efetuado com sucesso. Arquivo com '+inttostr(Contador)+' registros.');
     memResult.Lines.add('------------------------------------------------------------------------------');
  end;


  CloseFile(wArquivoImportacao);
  CloseFile(wArquivoBad);
  lblBarraProgresso.Visible  := False;
end;


procedure TfrmInscricaoNovoPlano.btnArqProcessarClick(Sender: TObject);
begin
  inherited;
  // Abre a Gravação e Testa Retorno
  if (ProcuraDirDlg1.Execute)
  then begin
     edCaminhoEntrada.Text := UpperCase(ProcuraDirDlg1.Directory);
     if Trim(edArqGravar.Text) = ''
     then edArqGravar.Text := edCaminhoEntrada.Text;
  end;
end;

procedure TfrmInscricaoNovoPlano.spedArqGravarClick(Sender: TObject);
var snomearq : String;
begin
  inherited;
  // Abre a Gravação e Testa Retorno
  if (ProcuraDirDlg1.Execute)
  then edArqGravar.Text := UpperCase(ProcuraDirDlg1.Directory);

  snomearq := copy(edCaminhoEntrada.text,0,length(edCaminhoEntrada.text) - (length(edCaminhoEntrada.text)  - pos('.txt',edCaminhoEntrada.text)) -1);

  while pos('\',snomearq) > 0 do
  begin
     snomearq :=  copy(snomearq, pos('\',snomearq)+1, length(snomearq));
  end;

  ednomearq.text := snomearq;

end;



procedure TfrmInscricaoNovoPlano.FormCreate(Sender: TObject);
begin
  inherited;

  //Jéssica Lana Nunes dos Santos SOL 109421 KINTANA 499332
  SaveDlg.InitialDir := Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa);
  odTxt.InitialDir := Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa);
  ProcuraDirDlg1.Directory :=Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa);

  memResult.Lines.Clear;

end;




function TfrmInscricaoNovoPlano.BuscaPessoa(sMat : String ; var sIdPessjur, sIdPessoa, sIdPlanoPrev, sFlgInterno,
                                            sIdSitPart, sIdSitFunc , sIdSitPlanoPrev, sIdPessjurCedido, sInscricaoData, sNumInsc : String; slinha : String;
                                            var ierro : Integer; bDesfaz : Boolean) : Boolean;
begin

   Result := false;

   sIdPessjur := '';
   sIdPessoa := '';
   sIdPlanoPrev := '';
   sFlgInterno := '';
   sIdSitPart := '';
   sIdSitFunc:= '';
   sIdSitPlanoPrev := '';
   sIdPessjurCedido := '';
   sInscricaoData   := '';
   sNumInsc  := '';


   sqlParam.sql.text := ' SELECT EL.IDPESSJUR, EL.IDPESSOA , NVL(PP.IDPLANOPREV,0) IDPLANOPREV , '+
            ' SIT.FLGINTERNO, SIT.DESCRICAO ,  PP.INSCRICAODATA, PP.INSCRICAONUMERO, '+
            ' SIT.IDSITPART , EL.IDSITFUNC, PP.IDSITPLANOPREV, EL.IDPESSJURCEDIDO, '+
            ' F.IDPESSOA IDFUNCIONARIO, F.DATADESLIGAMENTO, SIT.FLGINTERNO '+
            ' FROM PARTPREVPLAN PP, ELEGPATRO EL, SITPART SIT, FUNCIONARIO F  '+
            ' WHERE EL.IDPESSJUR = EL.IDPESSJUR  '+
            ' AND EL.MATRICULA LIKE  '''+sMat+'%'' '+
            ' AND EL.IDPESSOA = EL.IDPESSOA  '+
            ' AND PP.IDPESSJUR(+) = EL.IDPESSJUR '+
            ' AND PP.IDPESSOA(+) = EL.IDPESSOA   '+
            ' AND SIT.IDSITPART(+) = PP.IDSITPART '+
            ' AND F.IDPESSOA(+) = EL.IDPESSOA '+
            ' ORDER BY PP.INSCRICAODATA DESC  ';

   cdsBuscaPessoa.data := sqlParam.data;


   if cdsBuscaPessoa.isempty then
   begin
      result := true;
      exit;
   end;

   sIdPessoa := cdsBuscaPessoa.fieldbyname('idpessoa').AsString;
   sIdPessjur := cdsBuscaPessoa.fieldbyname('idpessjur').AsString;

   if (trim(cdsBuscaPessoa.fieldbyname('idplanoprev').AsString) = '0') or
      (trim(cdsBuscaPessoa.fieldbyname('idplanoprev').AsString) = '') then
   begin
      result := true;
      exit;
   end;

   sIdPlanoPrev := cdsBuscaPessoa.fieldbyname('idplanoprev').AsString;
   sIdSitPart := trim(cdsBuscaPessoa.fieldbyname('idsitpart').AsString);
   sIdSitFunc:= trim(cdsBuscaPessoa.fieldbyname('idsitfunc').AsString);
   sIdSitPlanoPrev := trim(cdsBuscaPessoa.fieldbyname('idsitplanoprev').AsString);
   sFlgInterno   := trim(cdsBuscaPessoa.fieldbyname('flginterno').AsString);
   sInscricaoData  := trim(cdsBuscaPessoa.fieldbyname('inscricaodata').AsString);
   sNumInsc := trim(cdsBuscaPessoa.fieldbyname('inscricaonumero').AsString);


   if (sIdPlanoPrev <> '2') and (not bDesfaz) then
   begin
      memresult.lines.add('Linha '+slinha+', Matrícula '+LRegNovoPlano.MATRICULA+' - É participante do plano '+sIdPlanoPrev+', não do Replan(2).');
      WriteLn(wArquivoBad,wlinha);
      inc(ierro);
      exit;
   end
   else if (sIdPlanoPrev <> '74') and (bDesfaz) then
   begin
      memresult.lines.add('Linha '+slinha+', Matrícula '+LRegNovoPlano.MATRICULA+' - É participante do plano '+sIdPlanoPrev+', não do NovoPlano(74).');
      WriteLn(wArquivoBad,wlinha);
      inc(ierro);
      exit;
   end;


   if (cdsBuscaPessoa.fieldbyname('FLGINTERNO').AsString = 'AS') then
   begin
      memresult.lines.add('Linha '+slinha+', Matrícula '+LRegNovoPlano.MATRICULA+' - Participante Assistido.');
      WriteLn(wArquivoBad,wlinha);
      inc(ierro);
      exit;
   end;

   if (trim(cdsBuscaPessoa.fieldbyname('IDFUNCIONARIO').AsString) <> '') and
      (trim(cdsBuscaPessoa.fieldbyname('DATADESLIGAMENTO').AsString) = '') then
   begin
      memresult.lines.add('Linha '+slinha+', Matrícula '+LRegNovoPlano.MATRICULA+' - Funcionário Funcef.');
      WriteLn(wArquivoBad,wlinha);
      inc(ierro);
      exit;
   end;


   //verificação de titular de dependentes assistidos
   //não pode atualizar
   sqlParam.sql.text := ' SELECT 1 FROM BENEFBFCIARIO WHERE IDPESSJUR = '+sIdPessjur+' AND IDTITULAR = '+sIdPessoa+'  ';
   cdsBuscaPessoa.data := sqlParam.data;
   if (not cdsBuscaPessoa.isempty) then
   begin
      memresult.lines.add('Linha '+slinha+', Matrícula '+LRegNovoPlano.MATRICULA+' - Titular de Dependente Assistido.');
      WriteLn(wArquivoBad,wlinha);
      inc(ierro);
      exit;
   end;


   result := true;

end;

function TfrmInscricaoNovoPlano.TrataData(var sEntrada : String) : String;
begin


   if sEntrada = '01.01.0001' then
   begin
      sEntrada := '          ';
      result := sEntrada;
      exit;
   end;

   while pos('.',sEntrada) > 0 do
   begin
      sEntrada[pos('.',sEntrada)] := '/';
   end;
   result := sEntrada;
end;

function TfrmInscricaoNovoPlano.TrataNumero(var sEntrada : String; nDec : Integer) : String;
begin

   try
      if  StrToFloat(sEntrada) <= 0
      then
      begin
         Result := '0';
         exit;
      end;

   except
      result := '0';
      exit;
   end;

   Result := copy(sEntrada,1,length(sEntrada) - nDec) + '.' + copy(sEntrada,nDec + 1,4);

end;



procedure TfrmInscricaoNovoPlano.SpeedButton1Click(Sender: TObject);
begin
  inherited;
  if savedlg.Execute
  then memResult.Lines.SaveToFile(savedlg.filename);
end;

procedure TfrmInscricaoNovoPlano.SpeedButton2Click(Sender: TObject);
begin
  inherited;
  memresult.Print('Log de importação');
end;

procedure TfrmInscricaoNovoPlano.sbtnTabCargosClick(Sender: TObject);
var snomearq : String;
begin
  inherited;
  odTxt.Execute;
  edCaminhoEntrada.Text := odTxt.FileName;
  edCaminhoEntrada.Hint := edCaminhoEntrada.Text;
  if (edCaminhoEntrada.Font.Size * length(edCaminhoEntrada.text)) > edCaminhoEntrada.Width then
     edCaminhoEntrada.ShowHint := true
  else
  edCaminhoEntrada.ShowHint := false;


  snomearq := copy(edCaminhoEntrada.text,0,length(edCaminhoEntrada.text) - (length(edCaminhoEntrada.text)  - pos('.txt',edCaminhoEntrada.text)) -1);

  while pos('\',snomearq) > 0 do
  begin
     snomearq :=  copy(snomearq, pos('\',snomearq)+1, length(snomearq));
  end;

  ednomearq.text := snomearq;

  edArqGravar.Text := copy(edCaminhoEntrada.text,0,length(edCaminhoEntrada.text) - (length(edCaminhoEntrada.text)  - pos(snomearq+'.txt',edCaminhoEntrada.text)) -1)
end;

procedure TfrmInscricaoNovoPlano.SpeedButton3Click(Sender: TObject);
var iTam, iRejeitados : longint;
    sAux : string;
begin
   memResult.Lines.Clear;
   memResult.Lines.add('FUNCEF '+sistema.Versao+'                                     '+datetostr(date));
   memResult.Lines.add('                   CHECK - Importação de Inscrições Novo Plano                ');
   memResult.Lines.add('                               Log de Erros                                   ');
   memResult.Lines.add('Arquivo de entrada: '+edCaminhoEntrada.text);
   memResult.Lines.add('Arquivo de saída  : '+ednomearq.text+'.bad');
   memResult.Lines.add('Usuário: '+sistema.NomeUsuario );
   memResult.Lines.add('------------------------------------------------------------------------------');
   memResult.Lines.add('');

   bcancela := false;

   Try
     AssignFile(wArquivoImportacao, edCaminhoEntrada.Text);
     Reset(wArquivoImportacao);
   Except
     memResult.Lines.Add('   Erro ao abrir o arquivo de inscrições do Novo Plano.');
     Exit;
   End;


   iTam   := 0;
   irejeitados := 0;
   while not Eof(wArquivoImportacao) do
   begin
      Readln(wArquivoImportacao, sAux);
      inc(iTam);

      if not Critica(sAux,inttostr(iTam), false) then inc(irejeitados);

      lblregcheck.Caption := 'Registros no arquivo de entrada: '+inttostr(itam);
      lblrejeitadoscheck.Caption := 'Registros rejeitados na seleção: '+inttostr(irejeitados);

      Application.ProcessMessages;

      if bcancela then
      begin
         memResult.Lines.add('------------------------------------------------------------------------------');
         memResult.Lines.add('PROCESSO CANCELADO PELO USUÁRIO');
         memResult.Lines.add('------------------------------------------------------------------------------');
         break;
      end;

   end;

   // Voltar arquivo para o inicio
   CloseFile(wArquivoImportacao);
   Reset(wArquivoImportacao);

end;

procedure TfrmInscricaoNovoPlano.FormShow(Sender: TObject);
begin
  inherited;
  spin.value := 1;
end;

procedure TfrmInscricaoNovoPlano.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  bcancela := true;
end;

procedure TfrmInscricaoNovoPlano.bbtnSairClick(Sender: TObject);
begin
  inherited;

  If dtmBaseDados.dbBaseDados.InTransaction
  then dtmBaseDados.dbBaseDados.Rollback;

end;

procedure TfrmInscricaoNovoPlano.BitBtn1Click(Sender: TObject);
begin
  inherited;
  memResult.Lines.Clear;

  Contador:= 0;
  Ini     := Time;
  pBar.Position := 0;  

  lblBarraProgresso.Visible := True;
  lblBarraProgresso.Caption := 'Importando arquivo de inscrições Novo Plano.';
  Application.ProcessMessages;

  bcancela := false;

  DesfazNovoPlano;


  // Mostra Tempo da Importação
  Application.ProcessMessages;
  MsgDlg('Inicio.:   '+TimeToStr(Ini) +#13+
         'Final .:   '+TimeToStr(Time)+#13+
         '             ---------------'+#13+
         'Tempo .: '+TimeToStr(Time-Ini)+#13#13+
         'Número de Registros.: '+IntToStr(Contador)+#13#13,
         'Importação OK',mtInformation,[MbOk],0);
end;


Procedure TfrmInscricaoNovoPlano.DesfazNovoPlano;
var
  iTamArquivo, irejeitados, ierro, icontaux      : longint;
  bSeleciona : Boolean;
  sMatAux, sIdEventosPrev, sNumInsc , sTaxa: String;
  bExcluirDepen : Boolean;
begin

   memResult.Lines.Clear;
   memResult.Lines.add('FUNCEF '+sistema.Versao+'                                     '+datetostr(date));
   memResult.Lines.add('                   Desfazer Importação de Inscrições Novo Plano               ');
   memResult.Lines.add('                               Log de Erros                                   ');
   memResult.Lines.add('Arquivo de entrada: '+edCaminhoEntrada.text);
   memResult.Lines.add('Arquivo de saída  : '+ednomearq.text+'.bad');
   memResult.Lines.add('Usuário: '+sistema.NomeUsuario );
   memResult.Lines.add('------------------------------------------------------------------------------');
   memResult.Lines.add('');


   lblBarraProgresso.Visible  :=True;
   lblBarraProgresso.Update;

   Application.ProcessMessages;

   Try
     AssignFile(wArquivoImportacao, edCaminhoEntrada.Text);
     Reset(wArquivoImportacao);
   Except
     memResult.Lines.Add('   Erro ao abrir o arquivo de inscrições do Novo Plano.');
     Exit;
   End;


   Try
     AssignFile(wArquivoBad,edArqGravar.Text+ednomearq.text+'.bad');
     Rewrite(wArquivoBad);
   Except
      CloseFile(wArquivoImportacao);
      memResult.Lines.Add('   Erro criar arquivo BAD.');
      Exit;
   End;

   Application.ProcessMessages;

   iTamArquivo := VerificaTamArquivo;
   pBar.Min    := 0;
   pBar.Max    := iTamArquivo;

   irejeitados := 0;
   ierro := 0;
   icontaux := 0;


   If dtmBaseDados.dbBaseDados.InTransaction
   then dtmBaseDados.dbBaseDados.Commit;
   StartTransacao;

   while not Eof(wArquivoImportacao) do
   begin
      Readln(wArquivoImportacao,wLinha);
      pBar.Position := pBar.Position + 1;
      Inc(Contador);

      inc(icontaux);
      if icontaux >= spin.Value then
      begin
         if dtmBaseDados.dbBaseDados.InTransaction
         then dtmBaseDados.dbBaseDados.Commit;
         StartTransacao;

         icontaux := 0;
      end;


      if not Critica(wLinha,inttostr(Contador),True) then
      begin
         inc(irejeitados);
      end
      else
      begin

         if (BuscaPessoa(LRegNovoPlano.MATRICULA, sIdPessjur, sIdPessoa, sIdPlanoPrev, sFlgInterno,
                        sIdSitPart, sIdSitFunc , sIdSitPlanoPrev, sIdPessjurCedido,
                        sInscricaoData,sNumInsc, inttostr(contador), ierro, True))
         then
         begin

            qryAux.close;
            qryAux.sql.text := ' SELECT IDSITPARTATUAL '+
                               ' FROM EVENTOSPREV '+
                               ' WHERE IDPESSJUR = 91008 AND '+
                               ' IDPESSOA = '''+sIdPessoa+''' AND '+
                               ' IDPLANOPREV = 2 AND '+
                               ' IDEVENTOGERADOR = 334 ';
            qryAux.open;
            if not qryaux.isempty then  sIdSitPart := qryAux.fieldbyname('IDSITPARTATUAL').AsString;


            //grava evento de saldamento
            qryAux.close;
            qryAux.sql.text := ' DELETE EVENTOSPREV '+
                               ' WHERE IDPESSJUR = 91008 AND '+
                               ' IDPESSOA = '''+sIdPessoa+''' AND '+
                               ' IDPLANOPREV = 2 AND '+
                               ' IDEVENTOGERADOR = 334 ';
            try
               qryAux.ExecSQL;
            except
               memresult.lines.add('Linha '+inttostr(Contador)+', Matrícula '+LRegNovoPlano.MATRICULA+' - Erro ao excluir evento de saldamento.');
               WriteLn(wArquivoBad,wlinha);
               inc(ierro);
               continue;
            end;



            //suspende contribuições
            qryAux.Close;
            qryAux.Sql.text := ' UPDATE CONTRIBPREVPARTP SET FLGCOBRA = 1, DATAFINAL = NULL '+
                            ' WHERE IDPESSJUR = 91008 AND '+
                            ' IDPESSOA = '''+sIdPessoa+''' AND '+
                            ' IDPLANOPREV = 2 AND '+
                            ' TO_CHAR(DATAFINAL,''DD/MM/YYYY'') = TO_DATE('''+sInscricaoData+''',''DD/MM/YYYY'') ';
            try
               qryAux.ExecSQL;
            except
              memresult.lines.add('Linha '+inttostr(Contador)+', Matrícula '+LRegNovoPlano.MATRICULA+' - Erro ao reativar contribuições.');
              WriteLn(wArquivoBad,wlinha);
              inc(ierro);
              continue;
            end;



            //atualiza sitpart
            bExcluirDepen := true;
            qryAux.close;
            qryAux.sql.text := ' UPDATE PARTPREVPLAN SET IDSITPART = '''+sIdSitPart+''', FLGDESATIVADO = 0 '+
                               ' WHERE IDPESSJUR = 91008 AND '+
                               ' IDPESSOA = '''+sIdPessoa+''' AND '+
                               ' IDPLANOPREV = 2 ';
            try
               qryAux.ExecSQL;

               if qryAux.rowsaffected >=1 then bExcluirDepen := false;

            except
              memresult.lines.add('Linha '+inttostr(Contador)+', Matrícula '+LRegNovoPlano.MATRICULA+' - Erro ao atualizar registro Replan.');
              WriteLn(wArquivoBad,wlinha);
              inc(ierro);
              continue;
            end;



            qryAux.close;
            qryAux.sql.text := ' DELETE RESERVAPART '+
                               ' WHERE IDPESSOA = '''+sIdPessoa+''' AND'+
                               ' IDPLANOPREV = 74 AND '+
                               ' IDPESSJUR = 91008   ';
            try
               qryAux.ExecSQL;
            except
               memresult.lines.add('Linha '+inttostr(Contador)+', Matrícula '+LRegNovoPlano.MATRICULA+' - Erro ao excluir reservas.');
               WriteLn(wArquivoBad,wlinha);
               inc(ierro);
               continue;
            end;



            qryAux.close;
            qryAux.sql.text := ' DELETE CONTRIBPREVPARTP '+
                       ' WHERE IDPESSJUR = 91008 AND '+
                       ' IDPLANOPREV = 74 AND '+
                       ' IDPESSOA = '''+sIdPessoa+''' ';
            try
               qryAux.ExecSQL;
            except
               memresult.lines.add('Linha '+inttostr(Contador)+', Matrícula '+LRegNovoPlano.MATRICULA+' - Erro ao excluir contribuições.');
               WriteLn(wArquivoBad,wlinha);
               inc(ierro);
               continue;
            end;


            qryAux.close;
            qryAux.sql.text := ' DELETE EVENTOSPREV '+
                               ' WHERE IDPESSJUR = 91008 AND '+
                               ' IDPLANOPREV = 74 AND '+
                               ' IDPESSOA = '''+sIdPessoa+''' ';
            try
               qryAux.ExecSQL;
            except
               memresult.lines.add('Linha '+inttostr(Contador)+', Matrícula '+LRegNovoPlano.MATRICULA+' - Erro ao excluir evento de inscrição.');
               WriteLn(wArquivoBad,wlinha);
               inc(ierro);
               continue;
            end;



            qryaux.close;
            qryaux.sql.text := ' DELETE PARTPREVPLAN '+
                               ' WHERE IDPESSJUR = 91008 AND '+
                               ' IDPLANOPREV = 74 AND '+
                               ' IDPESSOA = '''+sIdPessoa+''' ';
            try
               qryaux.ExecSQL;
            except
               memresult.lines.add('Linha '+inttostr(Contador)+', Matrícula '+LRegNovoPlano.MATRICULA+' - Erro ao excluir Participante.');
               WriteLn(wArquivoBad,wlinha);
               inc(ierro);
               continue;
            end;



            if bExcluirDepen then
            begin

               qryAux.close;
               qryAux.sql.text := ' DELETE PESSOAFISICA WHERE IDPESSOA = '''+sidPessoa+''' ';
               try
                  qryAux.ExecSQL;
               except
                 memresult.lines.add('Linha '+inttostr(Contador)+', Matrícula '+LRegNovoPlano.MATRICULA+' - Erro ao excluir PessoaFisica.');
                 WriteLn(wArquivoBad,wlinha);
                 inc(ierro);
                 continue;
               end;



               qryAux.close;
               qryAux.sql.text := ' DELETE DEPENTIT WHERE IDTITULAR = '''+sidPessoa+''' ';

               try
                  qryAux.ExecSQL;
               except
                 memresult.lines.add('Linha '+inttostr(Contador)+', Matrícula '+LRegNovoPlano.MATRICULA+' - Erro ao excluir Depentit.');
                 WriteLn(wArquivoBad,wlinha);
                 inc(ierro);
                 continue;
               end;



               qryAux.close;
               qryAux.sql.text := ' DELETE DEPENDENTE WHERE IDPESSOA = '''+sidPessoa+'''   ';
               try
                  qryAux.ExecSQL;
               except
                 memresult.lines.add('Linha '+inttostr(Contador)+', Matrícula '+LRegNovoPlano.MATRICULA+' - Erro ao excluir como dependente.');
                 WriteLn(wArquivoBad,wlinha);
                 inc(ierro);
                 continue;
               end;



               //insere pessoa
               qryAux.close;
               qryAux.sql.text := ' DELETE PESSOA WHERE IDPESSOA = '''+sIdPessoa+'''  ';
               try
                  qryAux.ExecSQL;
               except
                 memresult.lines.add('Linha '+inttostr(Contador)+', Matrícula '+LRegNovoPlano.MATRICULA+' - Erro ao excluir registro Replan.');
                 WriteLn(wArquivoBad,wlinha);
                 inc(ierro);
                 continue;
               end;
            end;



         end;

      end; //while


      lblregprocesso.Caption := 'Registros processados: '+inttostr(Contador);
      lblrejeitadosproc.Caption := 'Registros rejeitados no processo: '+inttostr(irejeitados);
      lblregerro.caption := 'Registros com erro: '+inttostr(ierro);
      Application.ProcessMessages;


      if bcancela then
      begin
         If dtmBaseDados.dbBaseDados.InTransaction
         then dtmBaseDados.dbBaseDados.Rollback;

         memResult.Lines.add('------------------------------------------------------------------------------');
         memResult.Lines.add('PROCESSO CANCELADO PELO USUÁRIO');
         memResult.Lines.add('------------------------------------------------------------------------------');
         break;
      end;


  end; // while


  Try
    If not Sistema.GravaLogOperacoes('Desfazer importação de inscrições Novo Plano.') Then
       Raise Exception.Create('Erro ao gravar Log.');
  Except
  End;

  If dtmBaseDados.dbBaseDados.InTransaction
  then dtmBaseDados.dbBaseDados.Commit;

  if (ierro > 0) or (irejeitados > 0) then
  begin
     MsgDlg('Ocorreram alguns erros durante o processo.','Aviso',mtError,[mbOk],0);
     memResult.Lines.add('------------------------------------------------------------------------------');
     memResult.Lines.add('Ocorreram '+inttostr(ierro)+' erros e '+inttostr(irejeitados)+' rejeições no processo.');
     memResult.Lines.add('Arquivo com '+inttostr(Contador)+' registros.');
     memResult.Lines.add('------------------------------------------------------------------------------');
  end
  else
  begin
     MsgDlg('Processado com sucesso.','Aviso',mtInformation,[mbOk],0);
     memResult.Lines.add('------------------------------------------------------------------------------');
     memResult.Lines.add('Processo efetuado com sucesso. Arquivo com '+inttostr(Contador)+' registros.');
     memResult.Lines.add('------------------------------------------------------------------------------');
  end;


  CloseFile(wArquivoImportacao);
  CloseFile(wArquivoBad);
  lblBarraProgresso.Visible  := False;
end;


procedure TfrmInscricaoNovoPlano.SpinChange(Sender: TObject);
begin
  inherited;
  if spin.value <= 0 then spin.value := 1;
end;



end.