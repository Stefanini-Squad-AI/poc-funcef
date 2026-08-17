unit FSeparadorArqFinanc;

{-------------------------------------------------------------------------------
Autor(a)    :  Jéssica Lana
Data        :  20/02/2009
Pendência   :  SOL 109421 KINTANA 496332
Descricao   :  Alteração de gravação de arquivos de log na raiz do disco C:
--------------------------------------------------------------------------------
Autor(a)  : Hugo Luna
Data      : 24/03/2008
Pendência : 27338
Rotina    : Várias
Alteração : Acertando para poder tratar valores de rubricas negativos.
----------------------------------------------------------------------------------------------------
Autor(a)  : Hugo Luna
Data      : 27/02/2008
Pendência : 27481
Rotina    : ConversaoFinanc
Alteração : Truncar a linha de entrada do arquivo srh17.txt em 45 posições.
----------------------------------------------------------------------------------------------------
Autor(a)  : Gleyber
Data      : 02/07/2007
Pendência : 18990
Rotina    : ConversaoFinanc
Alteração : Alteração para gravar o valor '1A13' caso a rubrica de 13º vier negativa. 
----------------------------------------------------------------------------------------------------
Autor(a)  : André Pontes
Data      : 15/05/2007
Pendência : 23315
Rotina    : ConversaoFinanc
Alteração : Gravação da rubrica de margem mesmo que o valor seja igual a zero
----------------------------------------------------------------------------------------------------
Autor(a)  : Paulo Ramos
Data      : 09/11/2006
Pendência : 23354
Rotina    : ConversaoFinanc
Alteração : Tratar casos que o plano previdenciario ficou errado, pois
            a data de inscrição não segue uma ordem cronológica por erro operacional
            de cadastro. Estes casos não puderam ter a data de inscrição alterada,
            porque ficaria inconsistente com a documentação.
----------------------------------------------------------------------------------------------------
Autor(a)  : Leo
Data      : 18.01.2006
Pendência : sol(39693) 21228
Rotina    : ConversaoFinanc
Alteração : criação do arquivo para rubricas de empréstimo
----------------------------------------------------------------------------------------------------
Autor(a)  : Leo
Data      : 01.10.2005
Pendência : 20389
Rotina    : [críticas de funcionário da fundação]
Alteração : recoloquei a data de desligamento como parte da crítica sobre funcionário da Fundação
----------------------------------------------------------------------------------------------------
Autor(a)  : Leo
Data      : 01.06.2005
Pendência : 20101
Rotina    : DePara
Alteração : na gravação do arquivo wArquivoGravacaoPartCedidos, troquei a variável wlinhya por wlinhagrava
----------------------------------------------------------------------------------------------------
Autor(a)  : Leo
Data      : 01.06.2005
Pendência : 19383
Rotina    : DePara
Alteração : comentei a transformação dos valores negativos pois este processo deve ser feito na
            importação financeira do Interface, por não ter como incluir o valor
            já negativo no arquivo
----------------------------------------------------------------------------------------------------
Autor(a)  : Leo
Data      : 25.05.2005
Pendência : 18702
Rotina    : ConversaoFinanc
Alteração : verfiicar casos de rubricas de equiparação salarial, gravando coluna indicativa com valor '1'
----------------------------------------------------------------------------------------------------
Autor(a)  : Leo
Data      : 20.05.2005
Pendência : 19225
Rotina    : ConversaoFinanc
Alteração : separação dos participantes cedidos em arquivo específico
---------------------------------------------------------------------------------------------------}

{
INFORMAÇÕES PARA PROCESSAMENTO DO ARQUIVO DE BASE DE CÁLCULO E  FINANCEIRO

Lay-out e código externo (RUBRICAXPESS).

CAMPO SRH	TAMANHO	DESCRICAO	CODPROVDESC

NR-MATR-EMP	        PIC 9(06).	  NUMERO DA MATRICULA DO EMPREGADO
VR-REM-BASE	        PIC 9(10)V99.	VALOR DA REMUNERACAO BASE SALARIO PARTICIPACAO	RBAS
VR-BRUTO	          PIC 9(10)V99.	VALOR SALARIO BRUTO	BRUT
VR-LIQUIDO	        PIC 9(10)V99.	VALOR SALARIO LIQUIDO	LIQU
VR-MARG-30	        PIC 9(10)V99.	MARGEM CONSIGNAVEL 30%	MG30
VR-MARG-70	        PIC 9(10)V99.	MARGEM CONSIGNAVEL 70%	MG70
VR-BASE-INSS-CEF	  PIC 9(10)V99.	SALARIO DE CONTRIBUICAO INSS-CEF	SCIP
VR-BASE-INSS 	      PIC 9(10)V99.	SALARIO DE CONTRIBUICAO INSS	SCIE
VR-BASE-PPRIV-CEF	  PIC 9(10)V99.	SAL. DE CONTRIBUICAO PREV. PRIV-CEF	SCFP
VR-BASE-PPRIV	      PIC 9(10)V99.	SAL. DE CONTRIBUICAO PREV. PRIV-EMP	SCFE
VR-BASE-2019	      PIC 9(10)V99.	COMPONENTE PESSOAL ATS EX-BNH	Não será carregado
VR-BASE-2026	      PIC 9(10)V99.	VANTAGEM PESSOAL EX-BNH	Não será carregado
VR-FUNCEF-EMDOR	    PIC 9(10)V99.	VALOR BASE CONTRIBUICAO EMPREGADO	VCFP
VR-DESPESA-PREV-PR	PIC 9(10)V99.	DESPESA PREV. PRIV. 13.	Não será carregado
CD-TIP-ASSOC-PPREV	PIC 9(02).	  CODIGO TIPO ASOC. PREVIDENCIA.	Não será carregado

Além disso, o arquivo tem caracteres especiais que devem ser convertidos para valores numéricos, abaixo segue o DE/PARA dos mesmos:

'{' 	corresponde ao valor 0
'A' 	corresponde ao valor 1
'B' 	corresponde ao valor 2
'C' 	corresponde ao valor 3
'D' 	corresponde ao valor 4
'E' 	corresponde ao valor 5
'F' 	corresponde ao valor 6
'G' 	corresponde ao valor 7
'H' 	corresponde ao valor 8
'I' 	corresponde ao valor 9

----------------------------------------------------------------------------------------------------

LAY OUT  DO ARQUIVO FINANCEIRO (RUBRICAS SALARIAIS)

ARQUIVO: FINANCEIRO - UNLD78
TAM. REGISTRO: 45

NR-MATR-EMP 	  PIC 9(06). 	  MATRICULA DO EMPREGADO
CD-TIP-RUB 	    PIC 9(01). 	  CODIGO TIPO DA RUBRICA
CD-RUB 		      PIC 9(03). 	  CODIGO DA RUBRICA
SQ-RUB 	        PIC 9(02). 	  SEQUENCIAL DA RUBRICA
CD-SUREG-DEST 	PIC 9(03). 	  CODIGO DA SUREG DESTINO
NR-PAR-RUB 	    PIC 9(03). 	  NUMERO DA PARCELA DA RUBRICA
VR-RUB 		      PIC 9(10)V99. VALOR DA RUBRICA
CD-COSIG        PIC 9(02). 	  CODIGO DO CONSIGNATARIO ESPECIAL
ID-EXC-DEBITO 	PIC X(01). 	  INDICADOR DE EXCESSO DE DEBITO
NR-COMPLEMENTO 	PIC 9(10)V99. VALOR DO COMPLEMENTO

A união dos dois em vermelho formam o código externo da rubrica.
}


interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, ComCtrls, BfDialogs, BrowseFolder, uProcuraDir,
  Db, DBTables, Wwquery, Wwtable, Grids, DBClient, uCMClientDataSet,
  uCmSqlParams, Spin, uSistema;

type

//------------------------------------------------------------------------------
// Tipos Declarados para Manipular as Linhas do Arquivo Saída

  TFinanc = Record
    NR_MATR_EMP         : string[6];
    VR_REM_BASE         : string[12];
    VR_BRUTO            : string[12];
    VR_LIQUIDO          : string[12];
    VR_MARG_30          : string[12];
    VR_MARG_70          : string[12];
    VR_BASE_INSS_CEF    : string[12];
    VR_BASE_INSS        : string[12];
    VR_BASE_PPRIV_CEF   : string[12];
    VR_BASE_PPRIV       : string[12];
    VR_BASE_2019        : string[12];
    VR_BASE_2026        : string[12];
    VR_FUNCEF_EMDOR     : string[12];
    VR_DESPESA_PREV_PR  : string[14];
    CD_TIP_ASSOC_PPREV  : string[2];
  end;

  TPadv = Record
    NR_MATR_EMP         : string[6];
    ID_13_SALARIO       : string[1];
    AA_MM_COMP          : string[6];
    VR_PPRIV_EMP        : string[12];
    VR_PPRIV_EMDOR      : string[12];
    VR_BASE_PPRIV       : string[12];
  end;

  //------------------------------------------------------------------------------------------------

  TfrmSeparadorArqFinanc = class(TfrmOkCancelar)

    ProcuraDirDlg1: TProcuraDirDlg;
    GroupBox1: TGroupBox;
    lblPathArqProc: TLabel;
    grpArquivos: TGroupBox;
    lblArqGravar: TLabel;
    spedArqGravar: TSpeedButton;
    edArqGravar: TEdit;
    qryFilial: TwwQuery;
    lblBarraProgresso: TLabel;
    Label1: TLabel;
    pBar: TProgressBar;
    qryAgencia: TwwQuery;
    tblDepen: TwwTable;
    qryDBFDepen: TwwQuery;
    qryAux: TwwQuery;
    tblOcorr: TwwTable;
    odTxt: TOpenDialog;
    edTxt: TEdit;
    SpeedButton1: TSpeedButton;
    Label2: TLabel;
    SpeedButton2: TSpeedButton;
    Label3: TLabel;
    edtxtfinanc: TEdit;
    SpeedButton3: TSpeedButton;
    Label4: TLabel;
    edarqmat: TEdit;
    SpeedButton4: TSpeedButton;
    Label5: TLabel;
    edArqGravarEleg: TEdit;
    SpeedButton5: TSpeedButton;
    sqlParam: TCMSqlParams;
    cdsBuscaPessoa: TCMClientDataSet;
    GroupBox4: TGroupBox;
    chkAssistidos: TCheckBox;
    chkCancelados: TCheckBox;
    chkMantidos: TCheckBox;
    Label6: TLabel;
    SpeedButton6: TSpeedButton;
    edarqpadv: TEdit;
    memresult: TRichEdit;
    Panel1: TPanel;
    SpeedButton7: TSpeedButton;
    SpeedButton8: TSpeedButton;
    SaveDlg: TSaveDialog;
    chkAtivos: TCheckBox;
    Label7: TLabel;
    SpeedButton9: TSpeedButton;
    edArqGravarRejeitados: TEdit;
    cdsAux: TCMClientDataSet;
    grpMesAnoRef: TGroupBox;
    cmbMesCob: TComboBox;
    spedAnoCob: TSpinEdit;

    procedure bbtnConfirmarClick(Sender: TObject);
    procedure spedArqGravarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    procedure SpeedButton8Click(Sender: TObject);
    procedure SpeedButton9Click(Sender: TObject);
    procedure FormShow(Sender: TObject);


  private // Private declarations

    LRegFinanc  : TFinanc;
    LRegPadv    : TPadv;
    Ini         : TTime;
    Contador    : Integer;
    Gerados     : Integer;

    wArquivoImportacao                : TextFile;
    wArquivoGravacaoFinanc            : TextFile;
    wArquivoGravacaoBaseCalc          : TextFile;
    wArquivoGravacaoBaseCalcEleg      : TextFile;
    wArquivoGravacaoBaseCalcRejeit    : TextFile;
    wArquivoGravacaoExcessoDebRejeit  : TextFile; 
    wArquivoGravacaoPartCedidos       : TextFile;
    wArquivoGravacaoEmprestimo        : TextFile;
    wArquivoPadv                      : TextFile;
    wArquivoMat                       : TextFile;

    wLinha        : string;
    wLinhaGrava   : string;
    wLinhaMat     : string;


    function  VerificaTamArquivo: longint;
    procedure ConversaoFinanc;
    function  DePara(sLinha: string): string;


  public  // Public declarations

     bRejeitadoExcesso    : Boolean;  
     bRejeitado           : Boolean;
     sAnoMesCobrancaTela  : string;   


  end;



var
  frmSeparadorArqFinanc: TfrmSeparadorArqFinanc;

  function Completastring(sEnt, sComp: string; nTam: Integer; bDireita: Boolean ): string;





implementation
{$R *.DFM}
uses
  uDataBAse, UMensErro,  DBaseDados, UModuloFuncef;




procedure TfrmSeparadorArqFinanc.bbtnConfirmarClick(Sender: TObject);
//var sAnoMesCobrancaTela : string;
begin
  inherited;

  memResult.Lines.Clear;

  if Trim(cmbMesCob.Text) = '' then
  begin
    MsgDlg('Mês de Referência do Recebimento não preenchido. ','Erro',mtError,[mbOk,mbHelp],0);
    Repaint;
    cmbMesCob.SetFocus;
    Exit;
  end;

  if Trim(spedAnoCob.Text) = '' then
  begin
    MsgDlg('Ano de Referência do Recebimento não preenchido. ','Erro',mtError,[mbOk,mbHelp],0);
    Repaint;
    spedAnoCob.SetFocus;
    Exit;
  end;

  sAnoMesCobrancaTela       := Trim(spedAnoCob.Text) + '/';

  if cmbMesCob.ItemIndex <= 8
  then sAnoMesCobrancaTela  := sAnoMesCobrancaTela + '0' + IntToStr(cmbMesCob.ItemIndex + 1)
  else sAnoMesCobrancaTela  := sAnoMesCobrancaTela +       IntToStr(cmbMesCob.ItemIndex + 1);


  if (edarqpadv.text <> '') and (chkMantidos.Checked) then
  begin
    if MsgDlg('O comando para ignorar registros de mantidos está acionado, porém o arquivo'+
              ' de PADV foi selecionado. Deseja retirar o comando para ignorar mantidos?',
              'Confirmação', mtConfirmation, [Mbyes, mbno], 0) = mrno then
    begin
      Repaint;
      Exit;
    end
    else
    begin
      Repaint;
      chkMantidos.Checked := False;
    end;
  end;


  Contador:= 0;
  Gerados := 0;
  Ini     := Time;

  lblBarraProgresso.Visible := True;
  lblBarraProgresso.Caption := 'Separando arquivo Financeiro ... ';
  Application.ProcessMessages;

  ConversaoFinanc;

  // Mostra Tempo da Importação
  Application.ProcessMessages;
  MsgDlg('Inicio.:   '+TimeToStr(Ini) +#13+
         'Final .:   '+TimeToStr(Time)+#13+
         '             ---------------'+#13+
         'Tempo .: '+TimeToStr(Time-Ini)+#13#13+
         'Número de Registros Lidos: '+IntToStr(Contador)+#13#13+
         'Número de Registros Gerados: '+IntToStr(Gerados)+#13#13,
         'Importação OK',mtInformation,[MbOk],0);

end;

function  TfrmSeparadorArqFinanc.VerificaTamArquivo  : longint;
var iTam : longint;
    sAux : string;
begin
   Result := 0;
   iTam   := 0;

   if edTxt.text <> '' then
   begin
      while not Eof(wArquivoImportacao) do
      begin
         Readln(wArquivoImportacao, sAux);
         inc(iTam);
      end;
   end;

   if edtxtfinanc.text <> '' then
   begin
      while not Eof(wArquivoGravacaoFinanc) do
      begin
         Readln(wArquivoGravacaoFinanc, sAux);
         inc(iTam);
      end;
   end;   

   if edarqpadv.text <> '' then
   begin
      while not Eof(wArquivoPadv) do
      begin
         Readln(wArquivoPadv, sAux);
         inc(iTam);
      end;
   end;

   CloseFile(wArquivoImportacao);
   Reset(wArquivoImportacao);
   CloseFile(wArquivoGravacaoFinanc);
   Reset(wArquivoGravacaoFinanc);

   if edarqpadv.text <> '' then
   begin
      CloseFile(wArquivoPadv);
      Reset(wArquivoPadv);
   end;

   Result := iTam;
end;



Procedure TfrmSeparadorArqFinanc.ConversaoFinanc;
Var
  iTamArquivo                     : longint;
  NumWritten , NumRead, J : Integer;
  Buf: array[1..2048] of Char;
  bSeleciona : Boolean;
  sMatAux : string;

  bParticipante : Boolean;

  sMatriculaAnt, sIdPessoa , sIdPlanoPrev, sRubrica, sIdPessjurCedido  : string;
  sIdPessjur, ssql : string; 
  iPos : Integer;

  bRubNegativa : Boolean;

begin


   bRejeitado := False;

   lblBarraProgresso.Visible  :=True;
   lblBarraProgresso.Update;

   lblBarraProgresso.Caption := 'Abrindo Arquivo ...';
   Application.ProcessMessages;


   Try
     if trim(edarqmat.Text) <> '' then
     begin
        AssignFile(wArquivoMat,edarqmat.Text);
     end;
   Except
      memResult.Lines.Add('Erro criar arquivo de Matrículas.');
      Exit;
   End;


   Try
     AssignFile(wArquivoImportacao, edTxt.Text);
     Reset(wArquivoImportacao);
   Except
     memResult.Lines.Add('Erro ao abrir o arquivo financeiro.');
     Exit;
   End;


   Try
     AssignFile(wArquivoGravacaoBaseCalc,edArqGravar.Text+'\Financeiro_part.txt');
     Rewrite(wArquivoGravacaoBaseCalc);
   Except
      memResult.Lines.Add('Erro criar arquivo de saída de Dados Financeiros - Participantes.');
   End;


   Try
     AssignFile(wArquivoGravacaoEmprestimo,edArqGravar.Text+'\Financeiro_Emprestimo.txt');
     Rewrite(wArquivoGravacaoEmprestimo);
   Except
      memResult.Lines.Add('Erro criar arquivo de saída de Dados Financeiros - Rubricas de emprestimo.');
   End;



   if  trim(edArqGravarEleg.text) <> '' then
   begin
      Try
        AssignFile(wArquivoGravacaoBaseCalcEleg,edArqGravarEleg.Text+'\Financeiro_eleg.txt');
        Rewrite(wArquivoGravacaoBaseCalcEleg);
      Except
         memResult.Lines.Add('Erro criar arquivo de saída de Dados Financeiros - Elegíveis.');
         //Exit;
      End;
   end;


   if  trim(edArqGravarRejeitados.text) <> '' then
   begin
      Try
        AssignFile(wArquivoGravacaoBaseCalcRejeit,edArqGravarRejeitados.Text+'\Financeiro_Rejeitados.txt');
        Rewrite(wArquivoGravacaoBaseCalcRejeit);
      Except
         memResult.Lines.Add('Erro ao criar arquivo de saída de Dados Financeiros - Rejeitados.');
      End;

      Try
        AssignFile(wArquivoGravacaoExcessoDebRejeit, edArqGravarRejeitados.Text+'\Financeiro_Rejeitados_por_Excesso_de_Debito.txt');
        Rewrite(wArquivoGravacaoExcessoDebRejeit);
      Except
         memResult.Lines.Add('Erro ao criar arquivo de saída de Dados Financeiros - Rejeitados por Excesso de Débito.');
      End;

      Try
        AssignFile(wArquivoGravacaoPartCedidos, edArqGravarRejeitados.Text+'\Financeiro_Part_Cedidos.txt');
        Rewrite(wArquivoGravacaoPartCedidos);
      Except
         memResult.Lines.Add('Erro ao criar arquivo de saída de Dados Financeiros - Participantes Cedidos.');
      End;
   end;


   Try
     if trim(edtxtfinanc.text) <> '' then
     begin
        AssignFile(wArquivoGravacaoFinanc, edtxtfinanc.Text);
        Reset(wArquivoGravacaoFinanc);
     end;
   Except
     memResult.Lines.Add('Erro ao abrir o arquivo financeiro.');
     Exit;
   End;

   Try
     if trim(edarqpadv.text) <> '' then
     begin
        AssignFile(wArquivoPadv, edarqpadv.Text);
        Reset(wArquivoPadv);
     end;
   Except
     memResult.Lines.Add('Erro ao abrir o arquivo PADV.');
     Exit;
   End;


   lblBarraProgresso.Caption := 'Processando Arquivo...';
   Application.ProcessMessages;

   iTamArquivo := VerificaTamArquivo;
   pBar.Min    := 0;
   pBar.position    := 0;
   pBar.Max    := iTamArquivo;


   sMatriculaAnt := '';

   if edTxt.text <> '' then
   begin
      while not Eof(wArquivoImportacao) do
      begin
         Readln(wArquivoImportacao,wLinha);
         pBar.Position := pBar.Position + 1;
         Inc(Contador);

         bRejeitado := False;


         wLinha := DePara(wLinha);

         with LRegFinanc do
         begin                                                           //CODPROVDESC
            NR_MATR_EMP          := Copy(wLinha,      1     ,         6);

            //se seleciona apenas algumas matrículas
            bSeleciona := True;
            if trim(edarqmat.Text) <> '' then
            begin
               reset( wArquivoMat);
               bSeleciona := False;
               while not Eof(wArquivoMat) do
               begin
                  Readln(wArquivoMat,wLinhaMat);
                  sMatAux := Trim(wLinhaMat);
                  if trim(NR_MATR_EMP) = sMatAux then
                     bSeleciona := True;
               end;
            end;

            if not  bSeleciona then
            begin
               continue;
            end;

            // SRH12
            VR_REM_BASE          := Copy(wLinha,      7     ,        12); //RBAS
            VR_BRUTO             := Copy(wLinha,      19    ,        12); //BRUT
            VR_LIQUIDO           := Copy(wLinha,      31    ,        12); //LIQU
            VR_MARG_30           := Copy(wLinha,      43    ,        12); //MG30
            VR_MARG_70           := Copy(wLinha,      55    ,        12); //MG70
            VR_BASE_INSS_CEF     := Copy(wLinha,      67    ,        12); //SCIP
            VR_BASE_INSS         := Copy(wLinha,      79    ,        12); //SCIE
            VR_BASE_PPRIV_CEF    := Copy(wLinha,      91    ,        12); //SCFP
            VR_BASE_PPRIV        := Copy(wLinha,      103   ,        12); //SCFE
            VR_BASE_2019         := Copy(wLinha,      115   ,        12); //NÃO SERÁ CARREGADO
            VR_BASE_2026         := Copy(wLinha,      127   ,        12); //NÃO SERÁ CARREGADO
            VR_FUNCEF_EMDOR      := Copy(wLinha,      139   ,        12); //VCFP
            VR_DESPESA_PREV_PR   := Copy(wLinha,      151   ,        12); //4A13 - PATRO DÉCIMO TERCEIRO   //Cprev - 19/03/2008
            CD_TIP_ASSOC_PPREV   := Copy(wLinha,      163   ,         2); //NÃO SERÁ CARREGADO

         end; // with

         if trim(LRegFinanc.NR_MATR_EMP)  <> trim(sMatriculaAnt) then
         begin

            sMatriculaAnt := LRegFinanc.NR_MATR_EMP;

            sqlParam.sql.text := ' SELECT EL.IDPESSOA , NVL(PP.IDPLANOPREV,0) IDPLANOPREV, '+
                   ' SIT.FLGINTERNO , SIT.DESCRICAO, PP.INSCRICAODATA , EL.IDPESSJURCEDIDO, '+
                   ' F.IDPESSOA IDFUNCIONARIO , F.DATADESLIGAMENTO, '+
                   ' EL.IDPESSJURCEDIDO '+ 
                   ' FROM PARTPREVPLAN PP, ELEGPATRO EL , SITPART SIT, FUNCIONARIO F '+
                   ' WHERE EL.IDPESSJUR = EL.IDPESSJUR  '+
                   ' AND EL.MATRICULA LIKE  '''+sMatriculaAnt+'%'' '+
                   ' AND EL.IDPESSOA = EL.IDPESSOA  '+
                   ' AND PP.IDPESSJUR(+) = EL.IDPESSJUR '+
                   ' AND PP.IDPESSOA(+) = EL.IDPESSOA   '+
                   ' AND F.IDPESSOA(+) = EL.IDPESSOA '+
                   ' AND SIT.IDSITPART(+) = PP.IDSITPART '+
                   ' ORDER BY PP.FLGDESATIVADO, PP.INSCRICAODATA DESC  ';

            cdsBuscaPessoa.data := sqlParam.data;


            if cdsBuscaPessoa.isempty then
            begin
               memResult.Lines.Add('Arq. Base Calc. - Matrícula: '+LRegFinanc.NR_MATR_EMP+' não encontrada no sistema.');
               bRejeitado := True;

               sIdPessoa := '0';
               sIdPlanoPrev := '0';
               sIdPessjurCedido := '';
            end
            else
            begin

               sIdPessoa := cdsBuscaPessoa.fieldbyname('idpessoa').Asstring;
               sIdPessjurCedido := cdsBuscaPessoa.fieldbyname('idpessjurcedido').Asstring;

               if trim(cdsBuscaPessoa.fieldbyname('idplanoprev').Asstring) = '0' then
               bParticipante := False
               else bParticipante := True;

               sIdPlanoPrev := cdsBuscaPessoa.fieldbyname('idplanoprev').Asstring;
            end;
         end
         else if ((trim(LRegFinanc.NR_MATR_EMP)  = trim(sMatriculaAnt))
              and (cdsBuscaPessoa.isempty)) then
         begin
            //continue;
            bRejeitado := True;
         end;


         if (chkAtivos.Checked) and (cdsBuscaPessoa.fieldbyname('FLGINTERNO').Asstring = 'AT') then
         begin
            memResult.Lines.Add('Arq. Base Calc. - Matrícula: '+LRegFinanc.NR_MATR_EMP+' - Situação: '+cdsBuscaPessoa.fieldbyname('descricao').Asstring+'.');
            bRejeitado := True;
            //continue;
         end;


         if (chkAssistidos.Checked) and (cdsBuscaPessoa.fieldbyname('FLGINTERNO').Asstring = 'AS')
         or (chkCancelados.Checked) and (cdsBuscaPessoa.fieldbyname('FLGINTERNO').Asstring = 'CA')
         or (chkMantidos.Checked) and (cdsBuscaPessoa.fieldbyname('FLGINTERNO').Asstring = 'MA') then
         begin
            memResult.Lines.Add('Arq. Base Calc. - Matrícula: '+LRegFinanc.NR_MATR_EMP+' - Situação: '+cdsBuscaPessoa.fieldbyname('descricao').Asstring+'.');
            bRejeitado := True;
         end;


         if (trim(cdsBuscaPessoa.fieldbyname('IDFUNCIONARIO').Asstring) <> '') and
            (trim(cdsBuscaPessoa.fieldbyname('DATADESLIGAMENTO').Asstring) = '') then
         begin
            memResult.Lines.Add('   Matrícula: '+LRegFinanc.NR_MATR_EMP+' - Funcionário Funcef.');
            bRejeitado := True;
         end;

         //teste específico para LEF'S
         if trim(cdsBuscaPessoa.fieldbyname('IDPESSJURCEDIDO').Asstring) <> '' then
         begin
            memResult.Lines.Add('Arq. Base Calc. - Matrícula: '+LRegFinanc.NR_MATR_EMP+' - Situação: '+cdsBuscaPessoa.fieldbyname('descricao').Asstring+'.');
            bRejeitado := True;
         end;

         sIdPessoa := Completastring(sIdPessoa,' ',15,False);
         sIdPlanoPrev := Completastring(sIdPlanoPrev,' ',5,False);

         //DESTINO
         {  NR_MATR_EMP(6), CD_TIP_RUB(1), CD_RUB(3), SQ_RUB(2),
           CD_SUREG_DEST(3), NR_PAR_RUB(3), VR_RUB(12), CD_COSIG(2),
           ID_EXC_DEBITO(1), NR_COMPLEMENTO(12)}

         //LINHAS
         //RBAS
         if LRegFinanc.VR_REM_BASE <> '000000000000' then
         begin
            wLinhaGrava := LRegFinanc.NR_MATR_EMP+'RBAS'+'01'+'   '+'   '+LRegFinanc.VR_REM_BASE+'  '+' '+'            '+sIdPessoa+sIdPlanoPrev;
            Inc(Gerados);

            if trim(sIdPessjurCedido) <> '' then WriteLn(wArquivoGravacaoPartCedidos, wLinhaGrava) //leofuncef - 20052005
            else if bRejeitado then  WriteLn(wArquivoGravacaoBaseCalcRejeit,wLinhaGrava)
            else
            begin
               if bParticipante then
               WriteLn(wArquivoGravacaoBaseCalc,wLinhaGrava)
               else if trim(edtxtfinanc.text) <> '' then   WriteLn(wArquivoGravacaoBaseCalcEleg,wLinhaGrava);
            end;
         end;

         //BRUT
         if LRegFinanc.VR_BRUTO <> '000000000000' then
         begin
            wLinhaGrava := LRegFinanc.NR_MATR_EMP+'BRUT'+'01'+'   '+'   '+LRegFinanc.VR_BRUTO+'  '+' '+'            '+sIdPessoa+sIdPlanoPrev;
            Inc(Gerados);

            if trim(sIdPessjurCedido) <> '' then WriteLn(wArquivoGravacaoPartCedidos, wLinhaGrava) //leofuncef - 20052005
            else if bRejeitado then  WriteLn(wArquivoGravacaoBaseCalcRejeit,wLinhaGrava)
            else
            begin
               if bParticipante then
               WriteLn(wArquivoGravacaoBaseCalc,wLinhaGrava)
               else if trim(edtxtfinanc.text) <> '' then   WriteLn(wArquivoGravacaoBaseCalcEleg,wLinhaGrava);
            end;
         end;

         //LIQU
         if LRegFinanc.VR_LIQUIDO <> '000000000000' then
         begin
            wLinhaGrava := LRegFinanc.NR_MATR_EMP+'LIQU'+'01'+'   '+'   '+LRegFinanc.VR_LIQUIDO+'  '+' '+'            '+sIdPessoa+sIdPlanoPrev;
            Inc(Gerados);

            if trim(sIdPessjurCedido) <> '' then WriteLn(wArquivoGravacaoPartCedidos, wLinhaGrava) //leofuncef - 20052005
            else if bRejeitado then  WriteLn(wArquivoGravacaoBaseCalcRejeit,wLinhaGrava)
            else
            begin
               if bParticipante then
               WriteLn(wArquivoGravacaoBaseCalc,wLinhaGrava)
               else if trim(edtxtfinanc.text) <> '' then   WriteLn(wArquivoGravacaoBaseCalcEleg,wLinhaGrava);
            end;
         end;


         //MG30
            wLinhaGrava := LRegFinanc.NR_MATR_EMP+'MG30'+'01'+'   '+'   '+LRegFinanc.VR_MARG_30+'  '+' '+'            '+sIdPessoa+sIdPlanoPrev;
            Inc(Gerados);

            if trim(sIdPessjurCedido) <> '' then WriteLn(wArquivoGravacaoPartCedidos, wLinhaGrava) //leofuncef - 20052005
            else if bRejeitado then  WriteLn(wArquivoGravacaoBaseCalcRejeit,wLinhaGrava)
            else
            begin
               if bParticipante then
               WriteLn(wArquivoGravacaoBaseCalc,wLinhaGrava)
               else if trim(edtxtfinanc.text) <> '' then   WriteLn(wArquivoGravacaoBaseCalcEleg,wLinhaGrava);
            end;

         //MG70
            wLinhaGrava := LRegFinanc.NR_MATR_EMP+'MG40'+'01'+'   '+'   '+LRegFinanc.VR_MARG_70+'  '+' '+'            '+sIdPessoa+sIdPlanoPrev;
            Inc(Gerados);

            if trim(sIdPessjurCedido) <> '' then WriteLn(wArquivoGravacaoPartCedidos, wLinhaGrava) //leofuncef - 20052005
            else if bRejeitado then  WriteLn(wArquivoGravacaoBaseCalcRejeit,wLinhaGrava)
            else
            begin
               if bParticipante then
               WriteLn(wArquivoGravacaoBaseCalc,wLinhaGrava)
               else if trim(edtxtfinanc.text) <> '' then   WriteLn(wArquivoGravacaoBaseCalcEleg,wLinhaGrava);
            end;


         //SCIP
         if LRegFinanc.VR_BASE_INSS_CEF <> '000000000000' then
         begin
            wLinhaGrava := LRegFinanc.NR_MATR_EMP+'SCIP'+'01'+'   '+'   '+LRegFinanc.VR_BASE_INSS_CEF+'  '+' '+'            '+sIdPessoa+sIdPlanoPrev;
            Inc(Gerados);


            if trim(sIdPessjurCedido) <> '' then WriteLn(wArquivoGravacaoPartCedidos, wLinhaGrava) //leofuncef - 20052005
            else if bRejeitado then  WriteLn(wArquivoGravacaoBaseCalcRejeit,wLinhaGrava)
            else
            begin
               if bParticipante then
               WriteLn(wArquivoGravacaoBaseCalc,wLinhaGrava)
               else if trim(edtxtfinanc.text) <> '' then   WriteLn(wArquivoGravacaoBaseCalcEleg,wLinhaGrava);
            end;
         end;

         //SCIE
         if LRegFinanc.VR_BASE_INSS <> '000000000000' then
         begin
            wLinhaGrava := LRegFinanc.NR_MATR_EMP+'SCIE'+'01'+'   '+'   '+LRegFinanc.VR_BASE_INSS+'  '+' '+'            '+sIdPessoa+sIdPlanoPrev;
            Inc(Gerados);

            if trim(sIdPessjurCedido) <> '' then WriteLn(wArquivoGravacaoPartCedidos, wLinhaGrava) //leofuncef - 20052005
            else if bRejeitado then  WriteLn(wArquivoGravacaoBaseCalcRejeit,wLinhaGrava)
            else
            begin
               if bParticipante then
               WriteLn(wArquivoGravacaoBaseCalc,wLinhaGrava)
               else if trim(edtxtfinanc.text) <> '' then   WriteLn(wArquivoGravacaoBaseCalcEleg,wLinhaGrava);
            end;
         end;

         //SCFP
         if LRegFinanc.VR_BASE_PPRIV_CEF <> '000000000000' then
         begin
            wLinhaGrava := LRegFinanc.NR_MATR_EMP+'SCFP'+'01'+'   '+'   '+LRegFinanc.VR_BASE_PPRIV_CEF+'  '+' '+'            '+sIdPessoa+sIdPlanoPrev;
            Inc(Gerados);


            if trim(sIdPessjurCedido) <> '' then WriteLn(wArquivoGravacaoPartCedidos, wLinhaGrava) //leofuncef - 20052005
            else if bRejeitado then  WriteLn(wArquivoGravacaoBaseCalcRejeit,wLinhaGrava)
            else
            begin
               if bParticipante then
               WriteLn(wArquivoGravacaoBaseCalc,wLinhaGrava)
               else if trim(edtxtfinanc.text) <> '' then   WriteLn(wArquivoGravacaoBaseCalcEleg,wLinhaGrava);
            end;

         end;

         //SCFE
         if LRegFinanc.VR_BASE_PPRIV <> '000000000000' then
         begin
            wLinhaGrava := LRegFinanc.NR_MATR_EMP+'SCFE'+'01'+'   '+'   '+LRegFinanc.VR_BASE_PPRIV+'  '+' '+'            '+sIdPessoa+sIdPlanoPrev;
            Inc(Gerados);


            if trim(sIdPessjurCedido) <> '' then WriteLn(wArquivoGravacaoPartCedidos, wLinhaGrava) //leofuncef - 20052005
            else if bRejeitado then  WriteLn(wArquivoGravacaoBaseCalcRejeit,wLinhaGrava)
            else
            begin
               if bParticipante then
               WriteLn(wArquivoGravacaoBaseCalc,wLinhaGrava)
               else if trim(edtxtfinanc.text) <> '' then   WriteLn(wArquivoGravacaoBaseCalcEleg,wLinhaGrava);
            end;
         end;


         //VCFP
         if LRegFinanc.VR_FUNCEF_EMDOR <> '000000000000' then
         begin
            wLinhaGrava := LRegFinanc.NR_MATR_EMP+'VCFP'+'01'+'   '+'   '+LRegFinanc.VR_FUNCEF_EMDOR+'  '+' '+'            '+sIdPessoa+sIdPlanoPrev;
            Inc(Gerados);


            if trim(sIdPessjurCedido) <> '' then WriteLn(wArquivoGravacaoPartCedidos, wLinhaGrava) //leofuncef - 20052005
            else if bRejeitado then  WriteLn(wArquivoGravacaoBaseCalcRejeit,wLinhaGrava)
            else
            begin
               if bParticipante then
               WriteLn(wArquivoGravacaoBaseCalc,wLinhaGrava)
               else if trim(edtxtfinanc.text) <> '' then   WriteLn(wArquivoGravacaoBaseCalcEleg,wLinhaGrava);
            end;
         end;


         //4A13
         if LRegFinanc.VR_DESPESA_PREV_PR <> '000000000000' then
         begin

            (*

            { Inicio Augusto 23/11/2007 Tratamento de valores negativos }

            iPos := Pos('*-', LRegFinanc.VR_DESPESA_PREV_PR);

            If ( iPos > 0 ) Then Begin

              bRubNegativa := True;

            End Else Begin

              bRubNegativa := False;

            End;
            LRegFinanc.VR_DESPESA_PREV_PR := Copy(LRegFinanc.VR_DESPESA_PREV_PR, 1, 12);

            { Fim Augusto 23/11/2007 }


            //If StrToFloat(LRegFinanc.VR_DESPESA_PREV_PR) >=0 Then
            If ( bRubNegativa = False ) Then
              wLinhaGrava := LRegFinanc.NR_MATR_EMP+'4A13'+'01'+'   '+'   '+LRegFinanc.VR_DESPESA_PREV_PR+'  '+' '+'            '+sIdPessoa+sIdPlanoPrev
            Else
              wLinhaGrava := LRegFinanc.NR_MATR_EMP+'1A13'+'01'+'   '+'   '+LRegFinanc.VR_DESPESA_PREV_PR+'  '+' '+'            '+sIdPessoa+sIdPlanoPrev;

            *)


            bRubNegativa := ( Pos( LRegFinanc.VR_DESPESA_PREV_PR[12], '}JKLMNOPQR') > 0 );

            If ( bRubNegativa = False ) Then
              wLinhaGrava := LRegFinanc.NR_MATR_EMP+'4A13'+'01'+'   '+'   '+LRegFinanc.VR_DESPESA_PREV_PR+'  '+' '+'            '+sIdPessoa+sIdPlanoPrev
            Else
              wLinhaGrava := LRegFinanc.NR_MATR_EMP+'1A13'+'01'+'   '+'   '+LRegFinanc.VR_DESPESA_PREV_PR+'  '+' '+'            '+sIdPessoa+sIdPlanoPrev;

            Inc(Gerados);


            if trim(sIdPessjurCedido) <> '' then WriteLn(wArquivoGravacaoPartCedidos, wLinhaGrava) //leofuncef - 20052005
            else if bRejeitado then  WriteLn(wArquivoGravacaoBaseCalcRejeit,wLinhaGrava)
            else
            begin
               if bParticipante then
               WriteLn(wArquivoGravacaoBaseCalc,wLinhaGrava)
               else if trim(edtxtfinanc.text) <> '' then   WriteLn(wArquivoGravacaoBaseCalcEleg,wLinhaGrava);
            end;
         end;



         Inc(Contador);
         Application.ProcessMessages;

      end; // while
   end;



   //separação do arquivo UNLDF4
   //arquivo de rubricas de manutenidos
   if  edarqpadv.text <> '' then
   begin

      //pega o identificador das rubricas de:
      //
      //de/para
      {IDCONTRIBUICAO      NOME                  IDRUBRICA     IDRUBRICA 13   CODPROVDESC    CODPROVDESC 13
       23              PADV TOTAL PATROCINADORA    32936         32932          4P99           4P13
       33              PADV TOTAL PARTICIPANTE     32925         32928          4P23           4P48}

      sMatriculaAnt := '';
      while not eof(wArquivoPadv) do
      begin

         Readln(wArquivoPadv,wLinha);
         pBar.Position := pBar.Position + 1;
         Inc(Contador);


         bRejeitado := False;

         with LRegPADV do
         begin                                                           //CODPROVDESC
            NR_MATR_EMP          := Copy(wLinha,      1     ,         6);


            //se seleciona apenas algumas matrículas
            bSeleciona := True;
            if trim(edarqmat.Text) <> '' then
            begin
               reset( wArquivoMat);
               bSeleciona := False;
               while not Eof(wArquivoMat) do
               begin
                  Readln(wArquivoMat,wLinhaMat);
                  sMatAux := Trim(wLinhaMat);
                  if trim(NR_MATR_EMP) = sMatAux then
                     bSeleciona := True;
               end;
            end;

            if not  bSeleciona then
            begin
               continue;
            end;


            ID_13_SALARIO          := Copy(wLinha,      7     ,        1);
            AA_MM_COMP             := Copy(wLinha,      8     ,        6);
            VR_PPRIV_EMP           := Copy(wLinha,      14    ,        12);
            VR_PPRIV_EMDOR         := Copy(wLinha,      26    ,        12);
            VR_BASE_PPRIV          := Copy(wLinha,      38    ,        12);
         end;//with


         if trim(LRegPadv.NR_MATR_EMP)  <> trim(sMatriculaAnt) then
         begin

            sMatriculaAnt := LRegPadv.NR_MATR_EMP;

            sqlParam.sql.text := ' SELECT EL.IDPESSOA , NVL(PP.IDPLANOPREV,0) IDPLANOPREV, '+
                ' SIT.FLGINTERNO , SIT.DESCRICAO , PP.INSCRICAODATA, '+
                ' F.IDPESSOA IDFUNCIONARIO , F.DATADESLIGAMENTO, '+
                ' EL.IDPESSJURCEDIDO '+ 
                ' FROM PARTPREVPLAN PP, ELEGPATRO EL , SITPART SIT, FUNCIONARIO F '+
                ' WHERE EL.IDPESSJUR = EL.IDPESSJUR  '+
                ' AND EL.MATRICULA LIKE  '''+sMatriculaAnt+'%'' '+
                ' AND EL.IDPESSOA = EL.IDPESSOA  '+
                ' AND PP.IDPESSJUR(+) = EL.IDPESSJUR '+
                ' AND PP.IDPESSOA(+) = EL.IDPESSOA   '+
                ' AND F.IDPESSOA(+) = EL.IDPESSOA '+
                ' AND SIT.IDSITPART(+) = PP.IDSITPART '+
                ' ORDER BY PP.FLGDESATIVADO, PP.INSCRICAODATA DESC  ';

            cdsBuscaPessoa.data := sqlParam.data;


            if cdsBuscaPessoa.isempty then
            begin
               memResult.Lines.Add('Arq. PADV - Matrícula: '+LRegPadv.NR_MATR_EMP+' não encontrada no sistema.');
               bRejeitado := True;

               sIdPessoa := '0';
               sIdPlanoPrev := '0';
               sIdPessjurCedido := '';
            end
            else
            begin


               sIdPessoa := cdsBuscaPessoa.fieldbyname('idpessoa').Asstring;
               sIdPessjurCedido := cdsBuscaPessoa.fieldbyname('idpessjurcedido').Asstring;

               if trim(cdsBuscaPessoa.fieldbyname('idplanoprev').Asstring) = '0' then
               bParticipante := False
               else bParticipante := True;

               sIdPlanoPrev := cdsBuscaPessoa.fieldbyname('idplanoprev').Asstring;
            end;
         end
         else if ((trim(LRegPadv.NR_MATR_EMP)  = trim(sMatriculaAnt))
              and (cdsBuscaPessoa.isempty)) then
         begin
            bRejeitado := True;
         end;


         if (chkAssistidos.Checked) and (cdsBuscaPessoa.fieldbyname('FLGINTERNO').Asstring = 'AS')
         or (chkCancelados.Checked) and (cdsBuscaPessoa.fieldbyname('FLGINTERNO').Asstring = 'CA')
         or (chkMantidos.Checked) and (cdsBuscaPessoa.fieldbyname('FLGINTERNO').Asstring = 'MA')
         or (chkAtivos.Checked) and (cdsBuscaPessoa.fieldbyname('FLGINTERNO').Asstring = 'AT') then
         begin
            memResult.Lines.Add('Arq. PADV - Matrícula: '+LRegFinanc.NR_MATR_EMP+' - Situação: '+cdsBuscaPessoa.fieldbyname('descricao').Asstring+'.');
            bRejeitado := True;
         end;

         if (trim(cdsBuscaPessoa.fieldbyname('IDFUNCIONARIO').Asstring) <> '') and
            (trim(cdsBuscaPessoa.fieldbyname('DATADESLIGAMENTO').Asstring) = '') then
         begin
            memResult.Lines.Add('   Matrícula: '+LRegFinanc.NR_MATR_EMP+' - Funcionário Funcef.');
            bRejeitado := True;
         end;


         sIdPessoa := Completastring(sIdPessoa,' ',15,False);
         sIdPlanoPrev := Completastring(sIdPlanoPrev,' ',5,False);


         if LRegPadv.VR_PPRIV_EMP <> '000000000000' then
         begin

            if LRegPadv.ID_13_SALARIO = 'S' then
            sRubrica := '4P48'
            else sRubrica := '4P23';

            wLinhaGrava := LRegPadv.NR_MATR_EMP+sRubrica+'01'+'   '+'   '+LRegPadv.VR_PPRIV_EMP+'  '+' '+'            '+sIdPessoa+sIdPlanoPrev+LRegPadv.AA_MM_COMP;
            Inc(Gerados);

            if trim(sIdPessjurCedido) <> '' then WriteLn(wArquivoGravacaoPartCedidos, wLinhaGrava) 
            else if bRejeitado then  WriteLn(wArquivoGravacaoBaseCalcRejeit,wLinhaGrava)
            else
            begin
               if bParticipante then
               WriteLn(wArquivoGravacaoBaseCalc,wLinhaGrava)
               else if trim(edtxtfinanc.text) <> '' then   WriteLn(wArquivoGravacaoBaseCalcEleg,wLinhaGrava);
            end;
         end;

         if LRegPadv.VR_PPRIV_EMDOR <> '000000000000' then
         begin

            if LRegPadv.ID_13_SALARIO = 'S' then
            sRubrica := '4P13'
            else sRubrica := '4P99';

            wLinhaGrava := LRegPadv.NR_MATR_EMP+sRubrica+'01'+'   '+'   '+LRegPadv.VR_PPRIV_EMDOR+'  '+' '+'            '+sIdPessoa+sIdPlanoPrev+LRegPadv.AA_MM_COMP;
            Inc(Gerados);


            if trim(sIdPessjurCedido) <> '' then WriteLn(wArquivoGravacaoPartCedidos, wLinhaGrava) 
            else if bRejeitado then  WriteLn(wArquivoGravacaoBaseCalcRejeit,wLinhaGrava)
            else
            begin
               if bParticipante then
               WriteLn(wArquivoGravacaoBaseCalc,wLinhaGrava)
               else if trim(edtxtfinanc.text) <> '' then   WriteLn(wArquivoGravacaoBaseCalcEleg,wLinhaGrava);
            end;
         end;


         //salário informado pela CAIXA, usado no cálculo dos PADV
         if LRegPadv.VR_BASE_PPRIV <> '000000000000' then
         begin
            sRubrica := 'SCFE';

            wLinhaGrava := LRegPadv.NR_MATR_EMP+sRubrica+'01'+'   '+'   '+LRegPadv.VR_BASE_PPRIV+'  '+' '+'            '+sIdPessoa+sIdPlanoPrev+LRegPadv.AA_MM_COMP;
            Inc(Gerados);


            if trim(sIdPessjurCedido) <> '' then WriteLn(wArquivoGravacaoPartCedidos, wLinhaGrava) 
            else if bRejeitado then  WriteLn(wArquivoGravacaoBaseCalcRejeit,wLinhaGrava)
            else
            begin
               if bParticipante then
               WriteLn(wArquivoGravacaoBaseCalc,wLinhaGrava)
               else if trim(edtxtfinanc.text) <> '' then   WriteLn(wArquivoGravacaoBaseCalcEleg,wLinhaGrava);
            end;
         end;

      end;

   end;
   //fim arquivo de manutenidos



   Inc(Contador);
   Application.ProcessMessages;


   sMatriculaAnt := '';
   while not Eof(wArquivoGravacaoFinanc) do
   begin
      Application.ProcessMessages;
      Readln(wArquivoGravacaoFinanc,wLinha);
      wlinha:= copy(wLinha,  1 ,  45);
      pBar.Position := pBar.Position + 1;
      Inc(Contador);

      bRejeitado        := False;
      bRejeitadoExcesso := False; 

      //testar excesso de débito
      //se for desconto de excesso de débito, não deve entrar
      if Copy(wLinha,  33 ,  1) = '1' then
      begin
         bRejeitadoExcesso := True; 
      end;

      LRegFinanc.NR_MATR_EMP := Copy(wLinha,  1 ,  6);

      sRubrica:=Copy(wLinha,  7 ,  4); 

      //se seleciona apenas algumas matrículas
      bSeleciona := True;
      if trim(edarqmat.Text) <> '' then
      begin
         reset(wArquivoMat);
         bSeleciona := False;
         while not Eof(wArquivoMat) do
         begin
            Readln(wArquivoMat,wLinhaMat);
            sMatAux := Trim(wLinhaMat);
            if trim(LRegFinanc.NR_MATR_EMP) = sMatAux then
               bSeleciona := True;
         end;
      end;

      if not  bSeleciona then
      begin
         continue;
      end;


      if trim(LRegFinanc.NR_MATR_EMP)  <> trim(sMatriculaAnt) then
      begin

         sMatriculaAnt := LRegFinanc.NR_MATR_EMP;

         sqlParam.sql.text := ' SELECT EL.IDPESSOA , NVL(PP.IDPLANOPREV,0) IDPLANOPREV, '+
                ' EL.IDPESSJUR, '+ //P.RAMOS-25.04.2005-PEND.18947
                ' SIT.FLGINTERNO , SIT.DESCRICAO, PP.INSCRICAODATA,  '+
                ' F.IDPESSOA IDFUNCIONARIO , F.DATADESLIGAMENTO, '+
                ' EL.IDPESSJURCEDIDO '+ 
                ' FROM PARTPREVPLAN PP, ELEGPATRO EL , SITPART SIT, FUNCIONARIO F '+
                ' WHERE EL.IDPESSJUR = EL.IDPESSJUR  '+
                ' AND EL.MATRICULA LIKE  '''+sMatriculaAnt+'%'' '+
                ' AND EL.IDPESSOA = EL.IDPESSOA  '+
                ' AND PP.IDPESSJUR(+) = EL.IDPESSJUR '+
                ' AND PP.IDPESSOA(+) = EL.IDPESSOA   '+
                ' AND F.IDPESSOA(+) = EL.IDPESSOA '+
                ' AND SIT.IDSITPART(+) = PP.IDSITPART '+
                ' ORDER BY PP.FLGDESATIVADO, PP.INSCRICAODATA DESC  ';


         cdsBuscaPessoa.data := sqlParam.data;


         if cdsBuscaPessoa.isempty then
         begin
            memResult.Lines.Add('Arq. Financ. - Matrícula: '+LRegFinanc.NR_MATR_EMP+' não encontrada no sistema.');
            bRejeitado := True;

            sIdPessoa := '0';
            sIdPlanoPrev := '0';
            sIdpessjur := '0'; 
            sIdPessjurCedido := '';
         end
         else
         begin


            sIdPessoa := cdsBuscaPessoa.fieldbyname('idpessoa').Asstring;
            sIdPessjurCedido := cdsBuscaPessoa.fieldbyname('idpessjurcedido').Asstring;

            if trim(cdsBuscaPessoa.fieldbyname('idplanoprev').Asstring) = '0' then
            bParticipante := False
            else bParticipante := True;

            sIdPlanoPrev := cdsBuscaPessoa.fieldbyname('idplanoprev').Asstring;
            sIdpessjur := cdsBuscaPessoa.fieldbyname('idpessjur').Asstring; 
         end;
      end
      else if ((trim(LRegFinanc.NR_MATR_EMP)  = trim(sMatriculaAnt))
           and (cdsBuscaPessoa.isempty)) then
      begin
         bRejeitado := True;
      end;


      if (chkAssistidos.Checked) and (cdsBuscaPessoa.fieldbyname('FLGINTERNO').Asstring = 'AS')
      or (chkCancelados.Checked) and (cdsBuscaPessoa.fieldbyname('FLGINTERNO').Asstring = 'CA')
      or (chkMantidos.Checked) and (cdsBuscaPessoa.fieldbyname('FLGINTERNO').Asstring = 'MA')
      or (chkAtivos.Checked) and (cdsBuscaPessoa.fieldbyname('FLGINTERNO').Asstring = 'AT') then
      begin
         memResult.Lines.Add('Arq. Financ. - Matrícula: '+LRegFinanc.NR_MATR_EMP+' - Situação: '+cdsBuscaPessoa.fieldbyname('descricao').Asstring+'.');
         bRejeitado := True;
         //continue;
      end;

      if (trim(cdsBuscaPessoa.fieldbyname('IDFUNCIONARIO').Asstring) <> '') and
         (trim(cdsBuscaPessoa.fieldbyname('DATADESLIGAMENTO').Asstring) = '') then
      begin
         memResult.Lines.Add('   Matrícula: '+LRegFinanc.NR_MATR_EMP+' - Funcionário Funcef.');
         bRejeitado := True;
         //continue;
      end;

      sIdPessoa := Completastring(sIdPessoa,' ',15,False);
      sIdPlanoPrev := Completastring(sIdPlanoPrev,' ',5,False);

      wlinha := wLinha + sIdPessoa+sIdPlanoPrev;


      //caso seja uma rubrica de equiparação salarial, gravar uma última coluna, de tamanho 1,
      //como valor '1'
      if ((sRubrica = '2019') or (sRubrica ='2023') or (sRubrica ='2026')) then
      wLinha := wLinha+'      1'; 

      if bRejeitadoExcesso then
      begin
        ssql:=
          'SELECT IDPROVENTO '+
          'FROM PROVDESC P, RUBRICAXPESS R '+
          'WHERE R.IDPESSOA = '+sIdpessjur+' '+
          'AND R.CODPROVDESC = '+quotedstr(sRubrica)+' '+
          'AND R.IDRUBRICA = P.IDPROVENTO '+
          'AND P.FLGTPRUBRICA LIKE ''%E%'' ';

        try
          qryAux.close;
          qryAux.sql.clear;
          qryAux.sql.add(ssql);
          qryAux.open;

          if not qryAux.isempty then
          begin
            sRubrica:=qryAux.fieldbyname('idprovento').asstring;
            if not dtmBaseDados.dbBaseDados.InTransaction then
              dtmBaseDados.dbBaseDados.StartTransaction;
            ssql:=
              'UPDATE TMPDESC '+
              'SET SITENVIO = ''1'', VALORRECEBIDO = NULL, '+
                'DATARECEBIMENTO = TO_DATE(''20/'+sAnoMesCobrancaTela+''',''DD/YYYY/MM'') '+
              'WHERE MESCOBRANCA = '+quotedstr(sAnoMesCobrancaTela)+' '+
              'AND IDPESSOA = '+sIdpessoa+' '+
              'AND IDPROVENTO = '+sRubrica+' '+
              'AND IDMODULO = 15 ';

            qryAux.close;
            qryAux.sql.clear;
            qryAux.sql.add(ssql);
            try
              qryAux.execsql;
            except
            end;
          end;
        except
        end;
      end;

      Inc(Gerados);

      if trim(sIdPessjurCedido) <> '' then WriteLn(wArquivoGravacaoPartCedidos, wlinha) 
      Else
        if bRejeitadoExcesso then WriteLn(wArquivoGravacaoExcessoDebRejeit, wlinha) 
        Else
          if bRejeitado then WriteLn(wArquivoGravacaoBaseCalcRejeit, wlinha)
          //caso sejam rubricas de financiamento ou empréstimo, colocar no arquivo de emprestimo para ser importado com prioridade
          Else if (copy(sRubrica,2,3) = '331') or//financiamento
                  (copy(sRubrica,2,3) = '441') or//empréstimo
                  (copy(sRubrica,2,3) = '470') or//empréstimo
                  (copy(sRubrica,2,3) = '480') or//empréstimo
                  (copy(sRubrica,2,3) = '490') or//empréstimo
                  (copy(sRubrica,2,3) = '449') or//empréstimo
                  (copy(sRubrica,2,3) = '463') or//empréstimo
                  (copy(sRubrica,2,3) = '464') or//empréstimo
                  (copy(sRubrica,2,3) = '465')//empréstimo
          then WriteLn(wArquivoGravacaoEmprestimo,wlinha)
             Else
               if bParticipante then WriteLn(wArquivoGravacaoBaseCalc,wlinha)
               Else
                 if trim(edtxtfinanc.text) <> '' then WriteLn(wArquivoGravacaoBaseCalcEleg,wlinha);
   end;

   if dtmBaseDados.dbBaseDados.InTransaction then
     dtmBaseDados.dbBaseDados.Commit;

   //  Fecha Arquivos
   CloseFile(wArquivoImportacao);
   CloseFile(wArquivoGravacaoBaseCalc);
   CloseFile(wArquivoGravacaoEmprestimo);   
   if trim(edtxtfinanc.text) <> '' then CloseFile(wArquivoGravacaoBaseCalcEleg);
   CloseFile(wArquivoGravacaoFinanc);
   CloseFile(wArquivoGravacaoBaseCalcRejeit);

   CloseFile(wArquivoGravacaoExcessoDebRejeit); 
   CloseFile(wArquivoGravacaoPartCedidos); 

   if   trim(memresult.text) = '' then
   begin
        memResult.Lines.Add('Arquivo '+#13+
                            ' '+edArqGravar.text+'\Financeiro_part.txt '+#13+
                            ' -  gerado com sucesso.');

       if trim(edArqGravarEleg.text) <> '' then
       begin
          memResult.Lines.Add('Arquivo '+#13+
                            ' '+edArqGravarEleg.text+'\Financeiro_eleg.txt '+#13+
                            ' -  gerado com sucesso.');
       end;

       if trim(edArqGravarRejeitados.text) <> '' then
       begin
          memResult.Lines.Add('Arquivo '+#13+
                            ' '+edArqGravarEleg.text+'\Financeiro_Rejeitados.txt '+#13+
                            ' -  gerado com sucesso.');
       end;
   end;

   lblBarraProgresso.Visible  := False;
   pBar.Position := pBar.Max ;
end;





procedure TfrmSeparadorArqFinanc.spedArqGravarClick(Sender: TObject);
begin
  inherited;
  // Abre a Gravação e Testa Retorno
  if (ProcuraDirDlg1.Execute)
  then
  begin
     edArqGravar.Text := UpperCase(ProcuraDirDlg1.Directory);
     edArqGravarEleg.Text := UpperCase(ProcuraDirDlg1.Directory);
     edArqGravarRejeitados.Text := UpperCase(ProcuraDirDlg1.Directory);
  end;
end;




procedure TfrmSeparadorArqFinanc.FormCreate(Sender: TObject);
begin
  inherited;

 //Jéssica Lana Nunes dos Santos SOL 109421 KINTANA 496332
 odTxt.InitialDir := Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa);
 SaveDlg.InitialDir := Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa);
 ProcuraDirDlg1.Directory := Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa);


  memResult.Lines.Clear;
end;



procedure TfrmSeparadorArqFinanc.SpeedButton1Click(Sender: TObject);
begin
  inherited;

  odTxt.Execute;

  edTxt.Text := odTxt.FileName;
  edTxt.Hint := edTxt.Text;

  if (edtxt.Font.Size * length(edtxt.text)) > edtxt.Width then
    edTxt.ShowHint := True
  else
    edTxt.ShowHint := False;
end;



function TfrmSeparadorArqFinanc.DePara(sLinha: string): string;
begin
  // -----------------------------------------------------------------------------------------------
  //   '{' 	  corresponde ao valor 0
  //   'A' 	  corresponde ao valor 1
  //   'B' 	  corresponde ao valor 2
  //   'C' 	  corresponde ao valor 3
  //   'D' 	  corresponde ao valor 4
  //   'E' 	  corresponde ao valor 5
  //   'F' 	  corresponde ao valor 6
  //   'G' 	  corresponde ao valor 7
  //   'H' 	  corresponde ao valor 8
  //   'I' 	  corresponde ao valor 9
  //   'J'    corresponde ao valor 1, E TRANF. EM NEGATIVO
  //   'K'    corresponde ao valor 2, E TRANF. EM NEGATIVO
  //   'L'    corresponde ao valor 3, E TRANF. EM NEGATIVO
  //   'M'    corresponde ao valor 4, E TRANF. EM NEGATIVO
  //   'N'    corresponde ao valor 5, E TRANF. EM NEGATIVO
  //   'O'    corresponde ao valor 6, E TRANF. EM NEGATIVO
  //   'P'    corresponde ao valor 7, E TRANF. EM NEGATIVO
  //   'Q'    corresponde ao valor 8, E TRANF. EM NEGATIVO
  //   'R'    corresponde ao valor 9, E TRANF. EM NEGATIVO
  //   '} {'  corresponde ao valor 0, E TRANF. EM NEGATIVO
  // -----------------------------------------------------------------------------------------------

  while Pos('{', sLinha) > 0 do
    sLinha := Copy(sLinha,1,Pos('{', sLinha ) -1) + '0' + Copy(sLinha,Pos('{', sLinha ) +1 ,  length(sLinha) - Pos('{', sLinha ));

  while Pos('A', sLinha) > 0 do
    sLinha := Copy(sLinha,1,Pos('A', sLinha ) -1) + '1' + Copy(sLinha,Pos('A', sLinha ) +1 ,length(sLinha) - Pos('A', sLinha ));

  while Pos('B', sLinha) > 0 do
    sLinha := Copy(sLinha,1,Pos('B', sLinha ) -1) + '2' + Copy(sLinha,Pos('B', sLinha ) +1 ,length(sLinha) - Pos('B', sLinha ));

  while Pos('C', sLinha) > 0 do
    sLinha := Copy(sLinha,1,Pos('C', sLinha ) -1) + '3' + Copy(sLinha,Pos('C', sLinha ) +1 ,length(sLinha) - Pos('C', sLinha ));

  while Pos('D', sLinha) > 0 do
    sLinha := Copy(sLinha,1,Pos('D', sLinha ) -1) + '4' + Copy(sLinha,Pos('D', sLinha ) +1 ,length(sLinha) - Pos('D', sLinha ));

  while Pos('E', sLinha) > 0 do
    sLinha := Copy(sLinha,1,Pos('E', sLinha ) -1) + '5' + Copy(sLinha,Pos('E', sLinha ) +1 ,length(sLinha) - Pos('E', sLinha ));

  while Pos('F', sLinha) > 0 do
    sLinha := Copy(sLinha,1,Pos('F', sLinha ) -1) + '6' + Copy(sLinha,Pos('F', sLinha ) +1 ,length(sLinha) - Pos('F', sLinha ));

  while Pos('G', sLinha) > 0 do
    sLinha := Copy(sLinha,1,Pos('G', sLinha ) -1) + '7' + Copy(sLinha,Pos('G', sLinha ) +1 ,length(sLinha) - Pos('G', sLinha ));

  while Pos('H', sLinha) > 0 do
    sLinha := Copy(sLinha,1,Pos('H', sLinha ) -1) + '8' + Copy(sLinha,Pos('H', sLinha ) +1 ,length(sLinha) - Pos('H', sLinha ));

  while Pos('I', sLinha) > 0 do
    sLinha := Copy(sLinha,1,Pos('I', sLinha ) -1) + '9' + Copy(sLinha,Pos('I', sLinha ) +1 ,length(sLinha) - Pos('I', sLinha ));

  // -----------------------------------------------------------------------------------------------

  (*

//{
  // negativos

  { Augusto 23/11/2007 - Inclusão do *- para tratamentos de valores negativos } 

  while Pos('}{', sLinha) > 0 do
    sLinha := Copy(sLinha,1,Pos('}{', sLinha ) -1) + '0' + Copy(sLinha,Pos('}{', sLinha ) +1 ,  length(sLinha) - Pos('}{', sLinha ));

  while Pos('}', sLinha) > 0 do
    sLinha := Copy(sLinha,1,Pos('}', sLinha ) -1) + '0*-' +  Copy(sLinha,Pos('}', sLinha ) +1 ,length(sLinha) - Pos('}', sLinha ));

  while Pos('J', sLinha) > 0 do
    sLinha := Copy(sLinha,1,Pos('J', sLinha ) -1) + '1*-' +  Copy(sLinha,Pos('J', sLinha ) +1 ,length(sLinha) - Pos('J', sLinha ));

  while Pos('K', sLinha) > 0 do
    sLinha := Copy(sLinha,1,Pos('K', sLinha ) -1) + '2*-' +  Copy(sLinha,Pos('K', sLinha ) +1 ,length(sLinha) - Pos('K', sLinha ));

  while Pos('L', sLinha) > 0 do
    sLinha := Copy(sLinha,1,Pos('L', sLinha ) -1) + '3*-' +  Copy(sLinha,Pos('L', sLinha ) +1 ,length(sLinha) - Pos('L', sLinha ));

  while Pos('M', sLinha) > 0 do
    sLinha := Copy(sLinha,1,Pos('M', sLinha ) -1) + '4*-' +  Copy(sLinha,Pos('M', sLinha ) +1 ,length(sLinha) - Pos('M', sLinha ));

  while Pos('N', sLinha) > 0 do
    sLinha := Copy(sLinha,1,Pos('N', sLinha ) -1) + '5*-' +  Copy(sLinha,Pos('N', sLinha ) +1 ,length(sLinha) - Pos('N', sLinha ));

  while Pos('O', sLinha) > 0 do
    sLinha := Copy(sLinha,1,Pos('O', sLinha ) -1) + '6*-' +  Copy(sLinha,Pos('O', sLinha ) +1 ,length(sLinha) - Pos('O', sLinha ));

  while Pos('P', sLinha) > 0 do
    sLinha := Copy(sLinha,1,Pos('P', sLinha ) -1) + '7*-' +  Copy(sLinha,Pos('P', sLinha ) +1 ,length(sLinha) - Pos('P', sLinha ));

  while Pos('Q', sLinha) > 0 do
    sLinha := Copy(sLinha,1,Pos('Q', sLinha ) -1) + '8*-' +  Copy(sLinha,Pos('Q', sLinha ) +1 ,length(sLinha) - Pos('Q', sLinha ));

  while Pos('R', sLinha) > 0 do
    sLinha := Copy(sLinha,1,Pos('R', sLinha ) -1) + '9*-' +  Copy(sLinha,Pos('R', sLinha ) +1 ,length(sLinha) - Pos('R', sLinha ));
//}

  *)

  // -----------------------------------------------------------------------------------------------

  Result := sLinha;
end;



procedure TfrmSeparadorArqFinanc.SpeedButton3Click(Sender: TObject);
begin
  inherited;

  odTxt.Execute;

  edTxtfinanc.Text := odTxt.FileName;
  edTxtfinanc.Hint := edTxt.Text;

  if (edtxtfinanc.Font.Size * length(edtxtfinanc.text)) > edtxtfinanc.Width then
    edTxtfinanc.ShowHint := True
  else
    edTxtfinanc.ShowHint := False;
end;



procedure TfrmSeparadorArqFinanc.SpeedButton4Click(Sender: TObject);
begin
  inherited;

  odTxt.Execute;

  edarqmat.Text := odTxt.FileName;
  edarqmat.Hint := edarqmat.Text;

  if (edarqmat.Font.Size * length(edarqmat.text)) > edarqmat.Width then
    edarqmat.ShowHint := True
  else
    edarqmat.ShowHint := False;
end;



function Completastring(sEnt, sComp : string ; nTam : Integer ; bDireita : Boolean ) : string;
var
  sResult : string;
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



procedure TfrmSeparadorArqFinanc.SpeedButton5Click(Sender: TObject);
begin
  inherited;
  // Abre a Gravação e Testa Retorno
  if (ProcuraDirDlg1.Execute)
  then edArqGravarEleg.Text := UpperCase(ProcuraDirDlg1.Directory);
end;



procedure TfrmSeparadorArqFinanc.SpeedButton6Click(Sender: TObject);
begin
  inherited;

  odTxt.Execute;

  edarqpadv.Text := odTxt.FileName;
  edarqpadv.Hint := edarqpadv.Text;

  if (edarqpadv.Font.Size * length(edarqpadv.text)) > edarqpadv.Width then
    edarqpadv.ShowHint := True
  else
    edarqpadv.ShowHint := False;
end;



procedure TfrmSeparadorArqFinanc.SpeedButton7Click(Sender: TObject);
begin
  inherited;

  if savedlg.Execute then
    memResult.Lines.SaveToFile(savedlg.filename);
end;



procedure TfrmSeparadorArqFinanc.SpeedButton8Click(Sender: TObject);
begin
  inherited;
  memresult.Print('Demonstrativo');
end;



procedure TfrmSeparadorArqFinanc.SpeedButton9Click(Sender: TObject);
begin
  inherited;

  // Abre a Gravação e Testa Retorno
  if (ProcuraDirDlg1.Execute) then
    edArqGravarRejeitados.Text := UpperCase(ProcuraDirDlg1.Directory);
end;



procedure TfrmSeparadorArqFinanc.FormShow(Sender: TObject);
var
  AYear, AMonth, ADay: Word;
begin
  inherited;

  DecodeDate(date, AYear, AMonth, ADay);

  if (AMonth >= 1) and (AMonth <= 12) then
  begin
     cmbMesCob.ItemIndex  := AMonth - 1;
     cmbMesCob.Text       := cmbMesCob.Items[cmbMesCob.ItemIndex];
     spedAnoCob.Text      := IntToStr(AYear);
  end;

  spedAnoCob.Text := IntToStr(AYear);
end;



end.