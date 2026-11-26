unit FConciliacao;

// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
//------------------------------------------------------------------------------
// Alteração..: (dfm)
// Nº ATENDER.: 4498-4676
// Data.......: 256/10/2023
// Responsável: Edilaine
// Descrição..: Remover filtro de TXT na seleção de arquivos
//------------------------------------------------------------------------------
// Nº ATENDER.: 1530-3615
// Data.......: 26/09/2023
// Responsável: Edilaine
// Descrição..: Importacao de arquivo apresenta erro "Tamanho excedido ou tipo nao permitido"
//------------------------------------------------------------------------------
// Nº SIG.....: 83696
// Data.......: 25/03/2019
// Responsável: Andre Imakawa
// Descrição..: Correção do insert na tabela HISTBENEFHABILITA
//------------------------------------------------------------------------------
// Nº SIG.....: 78688
// Data.......: 28/11/2018
// Responsável: Andre Imakawa
// Descrição..: Melhoria no Planus para adequação ao TIBERO.
//              Importar arquivo do INSS fracionado.
//------------------------------------------------------------------------------
// Nº SIG.....: SIG TIBERO
// Data.......: 02/03/2018
// Responsável: Everson Luiz Pereira da Cunha
// Descrição..: Melhoria no Planus para adequação ao TIBERO.
//              Inclusão de alias nas tabelas e campos.
//              Retirar INDEX, +rule etc
//------------------------------------------------------------------------------
//Pendência   : SIG63793
//Responsável : Darivaldo Alencar
//Data        : 28/02/2018
//Descrição   : Consulta não retorna resultado quando cliente não possui dados
//              na tabela PERFILINVEST
//--------------------------------------------------------------------------------
//Pendência   : SIG58556
//Responsável : Luiz Carlos
//Data        : 22/11/2017
//Descrição   : Ajuste no campo de plano contabil para segregacao contabil
//------------------------------------------------------------------------------
//Pendência   : SOL 229355 KTN 2063462
//Responsável : Fernando Xavier
//Data        : 14/05/2012
//Descrição   : Implementação de regra do cadastro de habilitação INSS
//------------------------------------------------------------------------------
//Pendência   : SOL 163044 Kintana 1388879
//Responsável : Fanuel Marinho
//Data        : 14/05/2012
//Descrição   : Implementação de regra do cadastro de habilitação INSS
//------------------------------------------------------------------------------
//Pendência   : SOL 171942 Kintana 1547064
//Responsável : Fanuel Junior
//Data        : 17/01/2012
//Descrição   : Erro importação arquivo INSS falecido / ex-participante
//------------------------------------------------------------------------------
//Pendência   : SOL 167460 KINTANA 1470597
//Responsável : BRUNO AZEVEDO
//Data        : 17/11/2011
//Descrição   : Ajuste ao carregar o plano correto.
//------------------------------------------------------------------------------
//Pendência   : SOL 137572 KINTANA 961108
//Responsável : BRUNO AZEVEDO
//Data        : 21/12/2010
//Descrição   : Implementação da validação do arquivo de INSS.
//------------------------------------------------------------------------------
//Pendência   : SOL 131786 KINTANA 753272
//Responsável : BRUNO AZEVEDO
//Data        : 03/03/2010
//Descrição   : Somente salvar o campo DIB (Nas tabelas TEMPCONCINSS e DETCONCINSS)
//              NULL ou com data válida.
//--------------------------------------------------------------------------------
// Autor(a)       :  Renato Visoni
// Data           :  25/02/2010
// Pendência      :  SOL 123118 Kintana 612606
// Descricao      :  Ajuste na importação do arquivo, passamos a importar os campos:
//                   CODSINONIMO, DTINICIOCRED, DTFIMCRED.
//------------------------------------------------------------------------------
// Autor(a)       :  Ádler Souza
// Data           :  24/11/2009
// Pendência      :  SOL 117458 KINTANA 678173
// Descricao      :  Selecionando os planos pelo IDSITBENEFICIO.
//------------------------------------------------------------------------------
// Autor(a)       :  Renato Visoni
// Data           :  27/08/2009
// Pendência      :  SOL 117458 KINTANA 609436
// Descricao      :  Alguns benefício estavam sendo desembolsado em um plano e
//                   reembolsados em outro plano Contábil.
//------------------------------------------------------------------------------
// Autor(a)       :  Jéssica Lana Nunes dos Santos
// Data           :  05/03/2009
// Pendência      :  SOL 109421 KINTANA 496332
// Descricao      :  Alteração de gravação de arquivos de log na raiz do disco C: .
//------------------------------------------------------------------------------
//----------------------------------------------------------------------------------------------------
// Rotina      : PegaSequencial, GravaDetConcINSS
// Autor(a)    : Paulo Ramos
// Data        : 25/06/2007
// Pendencia   : 25655 (reabertura da pendencia 25255)
// Alteração   : Correção da lógica de determinação do seqüencial para inserção
//               na DetConcINSS. Trata idpessoa como string, pois pode existir idpessoa nulo
//               na Detconcinss (casos Caixa seguros), e com isso a rotina deve permitir a busca
//               do próximo sequencial (qrySequencial) usando a NB (numero do beneficio no INSS).
//--------------------------------------------------------------------------------------------------
// Rotina      : PegaSequencial, GravaDetConcINSS
// Autor(a)    : André Pontes
// Data        : 23/05/2007
// Pendencia   : 25255 (reabertura)
// Alteração   : Correção da lógica de determinação do seqüencial para inserção na DetConcINSS
//--------------------------------------------------------------------------------------------------
// Rotina      : GravaDetConcINSS e Grava TempConcINSS
// Autor(a)    : André Pontes
// Data        : 25/09/2006
// Pendencia   : 25255
// Alteração   : for "i := 0 to 3" alterado para "i := 0 to 8", e ajustes subseqüentes decorrentes
//               da alteação
//--------------------------------------------------------------------------------------------------
// Rotina      : ImportaINSS e GravaDetConcINSS
// Autor(a)    : André Pontes
// Data        : 19/09/2006 a 25/09/2006
// Pendencia   : 23035
// Alteração   : Implementação de rateio por plano contábil na gravação da DetConc,
//               acompanhando o percentual de rateio definido pela HistRubSal
//               do mês selecionado
//--------------------------------------------------------------------------------------------------
// Rotina      : ImportaINSS
// Autor(a)    : Augusto
// Data        : 29/07/2005
// Pendencia   : 19849
// Alteração   : Alteração na pesquisa da BENEFBFCIARIO para buscar tbm o beneficio encerrados
//--------------------------------------------------------------------------------------------------
// Rotina      : Diversas
// Autor(a)    : Augusto
// Data        : 09/05/2005
// Pendencia   : 19171
// Alteração   : Novo tratamento para Contabilização
//--------------------------------------------------------------------------------------------------
// Rotina      : Diversas
// Autor(a)    : Augusto
// Data        : 28/01/2005
// Alteração   : Acertos diversos
//--------------------------------------------------------------------------------------------------
// Rotina      : Diversas
// Autor(a)    : Camille
// Data        : 05.08.2004
// Pendência   : 17269
// Alteração   : Aceitar como existente os processos pendentes de concessao
//               (idsitbeneficio = 4)
//--------------------------------------------------------------------------------------------------


interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls, Db,
  Wwdatsrc, DBTables, Wwquery, wwdblook, ComCtrls, Mask, Spin, IvDictio,
  IvMulti, IvEMulti, ShellApi, {DBCtrlt}
  DBLookup,  wwriched, Provider, DBClient, uCMClientDataSet, Gauges ;

type
   // ----------------------------------------------------------------------------------------------
   // Tipos Declarados para Manipular as Linhas do Arquivo INSS
   // ----------------------------------------------------------------------------------------------

   // Header 1 (Centralizador)
   THCentralizador = record
      Identificador  : String[1];
      Codigo         : Integer;
      Valor          : Double;
   end;

   // Header 2 (Orgao Pagador)
   THPagador = record
      Identificador  : String[1];
      DataCredito    : String[4];
      Codigo         : Integer;
     
   end;

   // 3 (Detalhe)
   TDetalhe = record
      Identificador     : String[1];
      NumeroBeneficio   : String[10];
      DataInicio        : String[6];
      DataFim           : String[6];
      Especie           : String[2];
      OrgaoMantenedor   : String[8];
      OrgaoConcessor    : String[8];
      TipoDetalhe       : String[1];   // 1-Credito Concessão, 2-Credito Manutencao, 3-PAB, 4-GLOSA
      QtdDepPensao      : String[2];
      QtdDepValidos     : String[2];
      QtdDepSalFam      : String[2];
      QtdDepImpRend     : String[2];
      VlrMensReaj       : Double;
      VlrAposReaj       : Double;
      FlgTemRubrica     : String[1];
      CodRubCred1       : String[4];
      VlrRubCred1       : Double;
      CodRubCred2       : String[4];
      VlrRubCred2       : Double;
      CodRubCred3       : String[4];
      VlrRubCred3       : Double;
      CodRubCred4       : String[4];
      VlrRubCred4       : Double;
      NomeRecebedor     : String[28];
      Sequencia         : String[2];
      MesCobranca       : String[7];
      MesReferencia     : String[7];

   end;

   // 4 (Rubricas)
   TRubrica = record
      Identificador:String[1];
      NumeroBeneficio   : String[10];
      DataFim           : String[6];
      DataInicio        : String[6];
      FlgTemRubrica     : String[1];
      CodRubCred1       : String[4];
      VlrRubCred1       : Double;
      CodRubCred2       : String[4];
      VlrRubCred2       : Double;
      CodRubCred3       : String[4];
      VlrRubCred3       : Double;
      CodRubCred4       : String[4];
      VlrRubCred4       : Double;
      CodRubCred5       : String[4];
      VlrRubCred5       : Double;
      CodRubCred6       : String[4];
      VlrRubCred6       : Double;
      CodRubCred7       : String[4];
      VlrRubCred7       : Double;
      CodRubCred8       : String[4];
      VlrRubCred8       : Double;
      CodRubCred9       : String[4];
      VlrRubCred9       : Double;
      Sequencia         : String[2];
   end;

   // Footer 5 (Orgao Pagador)
   TFPagador = record
      Identificador     : String[1];
      QtdRegDet         : Integer;
      QtdRegRub         : Integer;
      VlrLiqAtrz        : Double;
      VlrIRAtrz         : Double;
      VlrLiqManut       : Double;
      VlrIRManut        : Double;
      QtdCredAtrz       : Integer;
      QtdCredManut      : Integer;
      VlrLiqGlosas      : Double;
      VlrIRGlosas       : Double;
      QtdGlosas         : Integer;
   end;

   // Footer 6 (Centralizador)
   TFCentralizador = record
      Identificador     : String[1];
      QtdRegDet         : Integer;
      QtdRegRub         : Integer;
      VlrLiqAtrz        : Double;
      VlrIRAtrz         : Double;
      VlrLiqManut       : Double;
      VlrIRManut        : Double;
      QtdCredAtrz       : Integer;
      QtdCredManut      : Integer;
      VlrLiqGlosas      : Double;
      VlrIRGlosas       : Double;
      QtdGlosas         : Integer;
   end;

   // ----------------------------------------------------------------------------------------------
   // Tipos Declarados para Manipular as Linhas do Arquivo MANTENEDORA
   // ----------------------------------------------------------------------------------------------

   TMantenedora = record
      MesReferencia        : String[7];
      Matricula            : String[15];
      Nome                 : String[60];
      NumeroBeneficio      : String[10];
      DataInicioBeneficio  : String[10];
      CodigoBeneficio      : Integer;
      ValorBeneficio       : Double;
      Rubrica              : String[4];
   end;

   TRubricaINSS = record
      CodRubrica  : String[4];
      Valor       : Double;
   end;

   // ----------------------------------------------------------------------------------------------
   // ----------------------------------------------------------------------------------------------

   TFrmConciliacao = class(TfrmOkCancelar)
      lblPathArqProc: TLabel;
      edtArqProc: TEdit;
      SB1: TSpeedButton;
    OpenDialog: TOpenDialog;
      qryConcInss: TwwQuery;
      dsConcInss: TwwDataSource;
      qryProcuraRegistro: TwwQuery;
      DsProcuraRegistro: TwwDataSource;
      Animate1: TAnimate;
      lblBarraProgresso: TLabel;
      qrymantenedora: TwwQuery;
      dsMantenedora: TwwDataSource;
      rdgTipo: TRadioGroup;
      dblMantenedora: TwwDBLookupCombo;
      lblMantenedora: TLabel;
      dsAuxDadosPart: TwwDataSource;
      qryAuxDadosPart: TwwQuery;
      qryRetArqINSS: TwwQuery;
      qrymantenedoraCODMANTENEDORA: TStringField;
      qrymantenedoraNOME: TStringField;
      qrymantenedoraFLGFUNDACAO: TFloatField;
      qryPrisma: TwwQuery;
      qryDetConcInss: TwwQuery;
      qryAux: TwwQuery;
      qryRetPrisma: TwwQuery;
      lblAnoMes: TLabel;
      spnAno: TSpinEdit;
      lblMes: TLabel;
      cboMes: TComboBox;
      lblPathArqExc: TLabel;
      spedExcessao: TSpeedButton;
      edtArqExcecao: TEdit;
      grpMesAno: TGroupBox;
      chkReimporta: TCheckBox;
      qryHRSPessoa: TwwQuery;
      qryHRSPessoaIDPLANOCONTABIL: TFloatField;
      qryHRSPessoaIDPESSOA: TFloatField;
      qryHRSPessoaIDTITULAR: TFloatField;
      qryHRSPessoaVALOR: TFloatField;
      qryHRS: TwwQuery;
      qryHRSIDPESSOA: TFloatField;
      qryHRSIDTITULAR: TFloatField;
      qryHRSIDRUBRICA: TFloatField;
      qryHRSQUANT: TFloatField;
      dspHRS: TDataSetProvider;
      cdsHRS: TCMClientDataSet;
      cdsHRSIDPESSOA: TFloatField;
      cdsHRSIDTITULAR: TFloatField;
      cdsHRSIDRUBRICA: TFloatField;
      cdsHRSQUANT: TFloatField;
      qryInsertDetConc: TwwQuery;
      qrySequencial: TwwQuery;
      qrySequencialSEQUENCIAL: TFloatField;
    btnValidarArquivo: TButton;
    chkImportEtapas: TCheckBox; 

      procedure SB1Click(Sender: TObject);
      procedure FormShow(Sender: TObject);
      procedure FormClose(Sender: TObject; var Action: TCloseAction);
      procedure bbtnConfirmarClick(Sender: TObject);
      procedure BtResutClick(Sender: TObject);
      procedure rdgTipoClick(Sender: TObject);
      procedure bbtnCancelarClick(Sender: TObject);
      procedure spedExcessaoClick(Sender: TObject);
      procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnValidarArquivoClick(Sender: TObject);

   private  // Private declarations

      bImportouINSS        : Boolean;
      bReprocessaINSS      : Boolean;
      sAnoMesRef           : String;

      // Variaveis Declaradas para Manipular as Linhas do Arquivo INSS
      LHCentralizador      : THCentralizador;
      LHPagador            : THPagador;
      LDetalhe             : TDetalhe;
      LRubrica             : TRubrica;
      LFCentralizador      : TFCentralizador;
      LFPagador            : TFPagador;


      //Renato Visoni SOL 123118 Kintana 612606
      sCODSINONIMO        : String;
      sDTINICIOCRED       : String;
      sDTFIMCRED          : String;
      //Renato Visoni SOL 123118 Kintana 612606


      // Variaveis Declaradas para Manipular as Linhas do Arquivo Mantenedora
      LMantenedora         : TMantenedora;

      aRubGrupoTipo4       : array of TRubricaINSS;
      aRubGrupoTipo4Temp   : array of TRubricaINSS;
      aRubricaINSS         : array of TRubricaINSS;
      aRubricaINSSTemp     : array of TRubricaINSS;

      //Fanuel Marinho SOL163044
      procedure getPlanoPartPrevPlan(sIdPessoa: String; var sIdPlanoPrevPrev, sIdPlanoPrev, sCodMantenedora : String);///douglas.siqueira163044
      Function getTitular(sIdPessoa: String):String;///douglas.siqueira163044
      procedure habilitaBeneficio(sIdBenef : String);
      function  getParamFolhaHistBenef: String;
      procedure DeleteHistBenefHabilita(sIdBenef : String);
      //Fanuel Marinho SOL163044


      procedure ProcHCentralizador;
      procedure ProcHPagador;
      procedure ProcDetalhe;
      procedure ProcRubrica;
      procedure ProcFPagador;
      procedure ProcFCentralizador;
      procedure ProcMantenedora;

      procedure ImportaMantenedora;
      procedure ProcessaPrisma;
      procedure ImportaINSS;

      procedure ImportaFuncef;
      procedure ProcFuncef;

      function GravaDetConcINSS(sIdPlanoPrev       : String;
                                sMatricula         : String;
                                sNome              : String;
                                sIdPessoa          : String;
                                sIdTitular         : String;
                                sDIB               : String;
                                wTipoLinha         : String;
                                sCodMantenedora    : String;
                                sIdBeneficio       : String;
                                sIdPlanoPrevPrev   : String
                               ): Boolean;

      function GravaTempConcINSS(wTipoLinha: String): Boolean;

      function GravaTempConcINSSRubrica(sCodRub    : String;
                                        vRubrica   : Double;
                                        sMotivo    : String
                                       ): Boolean;

      function EncontraRegistro(NumeroProcesso  : String;
                                DataReferencia  : TDate
                               ): Boolean;

      function VerificaINSSImportado(AnoMes: String): Boolean;

      function ExisteHstBenefbfPP(qryAux           : TwwQuery;
                                 psMesAno          : String;
                                 psNumeroprocesso  : String;
                                 psIdBeneficio     : String;
                                 psIdPessoa        : String
                                ): Boolean;

      function ExisteDetConcINSS(qryAux      : TwwQuery;
                                 psMesAno    : String;
                                 psIdPessoa  : String;
                                 psIdRubrica : String
                                ): Boolean;

      function ERubricaDeProvento(qryAUx     : TwwQuery;
                                  pIdRubrica : String
                                 ): Boolean;

      function VerificaFLGAtivo: Boolean;

      procedure LimpaParametros(const qry: TwwQuery);

      function PegaSequencial(const psIDPessoa    : string;
                              const psMesCobranca : string;
                              psnumprocinss : string 
                             ): Integer;

      //BRUNO AZEVEDO SOL 137572 KINTANA 961108
      function MontaQryBeneficio(pNumeroBeneficio, pEspecie: String): String;
      function MontaQryRubrica(pRubrica: String): String;
      function CarregaCPF(pNomeRecebedor: String; pQry: TwwQuery): String;
      function CarregaPlanoPrev(pIdPlanoPrev: String; pQry: TwwQuery): String;
      function CarregaPlanoPrevContabil(pIdPlanoPrevContab: String; pQry: TwwQuery): String;
      function Formata(const I: String; const Casas: byte): string;
      //BRUNO AZEVEDO SOL 137572 KINTANA 961108
     
   public   // Public declarations

      procedure TrocaPlanoContabil(sIdPessoa: String; var sIdPlanoPrev : String);


   end;



var
  FrmConciliacao: TFrmConciliacao;



implementation
{$R *.DFM}
uses
   uDataBase, uMensErro, uAdmPrev, dBaseDados, uSistema, uFuncoesUteis;



var
  wArquivoImportacao : TextFile;
  wArquivoExcecao    : TextFile;
  wArquivoUltimoGrupo : TextFile;
  wLinha             : String;




function TFrmConciliacao.VerificaINSSImportado(AnoMes: String) : Boolean;
begin
   Result := False;

   with qryAux do
   begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT MESREFERENCIA FROM CONCINSS WHERE MESREFERENCIA = '''+AnoMes+'''');
      Open;
   end;

   // Se a query estiver vazia retorna TRUE.
   Result := not(qryAux.IsEmpty);
end;



// Busca Arquivo de Importação ..
procedure TFrmConciliacao.SB1Click(Sender: TObject);
begin
  inherited;

  if OpenDialog.Execute then
  begin
    edtArqProc.Text    := UpperCase(OpenDialog.FileName);
    edtArqExcecao.Text  := UpperCase(ExtractFilePath(OpenDialog.FileName) + 'CM_LOGREEMBOLSO.TXT');

     //edilaine WO1530-3615 : inicio
    if edtArqProc.Text <> '' then
      with TStringList.create do
       try
         LoadFromFile(edtArqProc.Text);
         SaveToFile(edtArqProc.Text);
       finally
         Free;
       end;
      //edilaine WO1530-3615 : fim

  end;
end;



procedure TFrmConciliacao.FormShow(Sender: TObject);
begin
   inherited;

   qrymantenedora.Open;

   lblMantenedora.Visible := False;
   dblMantenedora.Visible := False;
   chkImportEtapas.Visible := chkImportEtapas.Enabled; // Andre Imakawa - SIG 78688
end;



procedure TFrmConciliacao.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   inherited;
   qrymantenedora.Close;
end;



procedure TFrmConciliacao.rdgTipoClick(Sender: TObject);
begin
   inherited;

   case rdgTipo.ItemIndex of

      0:
      begin
         edtArqProc.Visible      := True;
         dblMantenedora.Visible  := False;
         lblMantenedora.Visible  := False;
         lblPathArqProc.Visible  := True;
         SB1.Visible             := True;
     end;

      1:
      begin
         lblPathArqProc.Visible  := True;
         lblPathArqProc.Caption  := 'Indique o Caminho do Arquivo a Processar';
         lblMantenedora.Visible  := True;
         dblMantenedora.Visible  := True;
         edtArqProc.Visible      := True;
         SB1.Visible             := True;
     end;

      2:
      begin
         lblMantenedora.Visible  := False;
         lblPathArqProc.Visible  := True;
         lblPathArqProc.Caption  := 'Indique o Caminho do Arquivo a Processar (Opcional)';
         dblMantenedora.Visible  := False;
         edtArqProc.Visible      := True;
         SB1.Visible             := true;
      end;

   end;  // case
end;



procedure TFrmConciliacao.bbtnConfirmarClick(Sender: TObject);
begin
   SetLength(aRubricaINSS, 9);
   SetLength(aRubricaINSSTemp, 9);  
   SetLength(aRubGrupoTipo4, 9);
   SetLength(aRubGrupoTipo4Temp, 9);

   // Verificar campos obrigatórios
   if cboMes.Text = '' then
   begin
      MsgDlg('Parâmetros Incompletos.', 'AdmPrev', mtWarning, [mbOk], 0);
      Repaint;
      cboMes.SetFocus;
      Exit;
   end;

   sAnoMesRef     := FormatFloat('0000', spnAno.Value) + '/' + FormatFloat('00', (cboMes.ItemIndex + 1));
   bImportouINSS  := VerificaINSSImportado(sAnoMesRef);

   // Andre Imakawa - SIG 78688 - Inicio
   if not(bImportouINSS) and chkImportEtapas.Checked then
   begin
     Repaint;
     MsgDlg('Para utilizar a opção "Importar mais de um arquivo para o mesmo mês" ' + #13 +
            ' necessário ja ter importado um arquivo para o mês: '+sAnoMesRef, 'AdmPrev', mtInformation, [mbOk], 0);
     Repaint;
     Exit;
   end;
   // Andre Imakawa - SIG 78688 - Fim

   // ----------------------------------------------------------------------------------------------
   // Testa se arquivo texto já foi importado
   bReprocessaINSS := False;

   if (rdgTipo.ItemIndex = 0) and (bImportouINSS) and not(chkReimporta.Checked) then
   begin  // and (not chkReimporta.Checked) 
      // -------------------------------------------------------------------------------------------

      if MsgDlg('O arquivo do INSS para o mês desejado já foi importado.' + #13 +
                'Deseja reprocessar este mês sem apagar o que foi importado?',
                'AdmPrev', mtConfirmation, [mbYes, mbNo], 0) = mrNo then
      begin
         Repaint;
         MsgDlg('Para apagar o arquivo já importado e seus acertos, seleciona a opção: ' + #13 +
                '"Apagar arquivo já importado....." ', 'AdmPrev', mtInformation, [mbOk], 0);
         Repaint;
         Exit;
      end;
      Repaint;

      // -------------------------------------------------------------------------------------------

      if MsgDlg('Confirma importação do arquivo sem apagar os dados existentes?',
                'AdmPrev', mtConfirmation, [mbYes, mbNo], 0) = mrNo then
      begin
         Repaint;
         Exit;
      end;
      Repaint;

      // -------------------------------------------------------------------------------------------

      // Apagar importacao já existente
      bReprocessaINSS := True;
   end;

   // ----------------------------------------------------------------------------------------------

   if (rdgTipo.ItemIndex <> 0) and not(bImportouINSS) then
   begin
      MsgDlg('O arquivo do INSS para o mês desejado ainda não foi importado. ',
             'AdmPrev', mtWarning, [mbOk], 0);
      Repaint;
      Exit;
   end;
   Repaint;

   // ----------------------------------------------------------------------------------------------

   // Chama ourtas funcoes sem ser a importacao do INSS
   case rdgTipo.ItemIndex of
      0: ImportaINSS;
      1: ImportaMantenedora;
      2: ProcessaPrisma;
   end;

   // ----------------------------------------------------------------------------------------------

   inherited;
end;



procedure TfrmConciliacao.ImportaINSS;
var
  wTipoLinha, Contador, QtdeBenefINSS : Integer;
  Ini                                 : TTime;
  sSQL                                : String;
  wPrismaVazio,   bGravaLog,
  bGravouFLGAtivo,  bOk               : Boolean;
  TotVlrMensReaj                      : Double;
  sIdBeneficio,  sIdPessoa, sMatricula,    sNumProcINSS,
  sCodConcessoINSS,  sSinonimo, sNome, sCodMantenedora,
  sIdRubrica,        sIdPlanoPrev, sIdTitular,
  sIdPlanoPrevPrev,
  sValorProvento,    sFlgGlosa, sDIB,
  sFlgAtivo,         sMsgErro         : String;
  iSequencial, i                      : Integer;
  sMotivo                             : String[30];
  
begin
   // processa arquivo INSS
   try
      if not(dtmBaseDados.dbBaseDados.InTransaction) then StartTransacao;

      //if (chkReimporta.Checked) then // Andre Imakawa - SIG 78688
      if (chkReimporta.Checked) and not(chkImportEtapas.Checked) then // Andre Imakawa - SIG 78688  
      begin
         with qryAux do
         begin
            Close;
            SQL.Clear;
            SQL.Text := 'DELETE FROM DETCONCINSS WHERE (MESCOBRANCA = '''+sAnoMesRef+''') and (FLGMANUAL IN (0,3,4))'; 
            try
               ExecSQL;
            except
               RollBackTransacao;
               MsgDlg('Erro ao excluir importação anterior.', 'AdmPrev', mtError, [mbOk], 0);
               Repaint;
               Exit;
            end;

            Close;
            SQL.Clear;
            SQL.Text := 'DELETE FROM CONCINSS WHERE MESREFERENCIA = ' + QuotedStr(sAnoMesRef);
            try
               ExecSQL;
            except
               RollBackTransacao;
               MsgDlg('Erro ao excluir importação anterior.', 'AdmPrev', mtError, [mbOk], 0);
               Repaint;
               Exit;
            end;

            Close;
            SQL.Clear;
            SQL.Text := 'DELETE FROM TEMPCONCINSS WHERE (MESPROCESSAMENTO = ' + QuotedStr(sAnoMesRef) + ') AND (FLGMANUAL = 0)';  
            try
               ExecSQL;
            except
               RollBackTransacao;
               MsgDlg('Erro ao excluir tabela temporária. Verifique.','Erro',mtError,[mbOk],0);
               Repaint;
               Exit;
            end;
         end;
      end;

      AssignFile(wArquivoImportacao, edtArqProc.Text);
      Reset(wArquivoImportacao);

      AssignFile(wArquivoExcecao, edtArqExcecao.Text);
      ReWrite(wArquivoExcecao);

      // Andre Imakawa - SIG 78688 - Inicio
      AssignFile(wArquivoUltimoGrupo,Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\ULTIMO_GRUPO.TXT');
      ReWrite(wArquivoUltimoGrupo);
      // Andre Imakawa - SIG 78688 - Fim

   except
      dtmBaseDados.dbBaseDados.RollBack;
      MsgDlg('Erro ao abrir Arquivo.','Erro',mtError,[mbOK],0);
      Exit;
   end;

   // Testa se Arquivo esta Vazio
   if EOF(wArquivoImportacao) then
   begin
      RollbackTransacao;

      MsgDlg('O arquivo informado está VAZIO.', 'Erro', mtError, [mbOK], 0);
      Repaint;

      edtArqProc.SetFocus;
      Exit;
   end;

   // Liga Animate
   lblBarraProgresso.Caption  := 'Aguarde ... ';
   lblBarraProgresso.Visible  := True;
   lblBarraProgresso.Update;

   Animate1.Visible  := True;
   Animate1.Active   := True;
   Contador          := 0;
   Ini               := Time;
   QtdeBenefINSS     := 0;
   TotVlrMensReaj    := 0;

   //Renato Visoni SOL 123118 Kintana 612606
   sCODSINONIMO  :='';
   sDTINICIOCRED :='';
   sDTFIMCRED    :='';
   //Renato Visoni SOL 123118 Kintana 612606

   try
      try
         //--------------------------------------------------------------------------------------------

         // Grava Header
         //if not(bReprocessaINSS) or (chkReimporta.Checked) then // Andre Imakawa - SIG 78688 - Inicio
         if (not(bReprocessaINSS) or (chkReimporta.Checked)) and not(chkImportEtapas.Checked) then // Andre Imakawa - SIG 78688 - Inicio
         begin
            // Insere registro na tabela Pai CONCINSS  caso seja INSS
            sSQL :=
            ' INSERT INTO CONCINSS (MESREFERENCIA, DATAPROCESSAMENTO, QTDEBENEFINSS, VALORTOTINSS) ' +
            ' VALUES ('+QuotedStr(sAnoMesRef)   +','+
            '        TO_DATE('''+DateToStr(Date)+''', ''DD/MM/YYYY'') ,'+
            '        NULL, '+
            '        NULL ) ';

            with qryDetConcInss do
            begin
               Close;
               SQL.Clear;
               SQL.Text := sSQL;

               try
                  ExecSQL;
               except
                  on E:EDBEngineError do
                  begin
                     RollbackTransacao;
                     MostrarErro(E);
                     Repaint;
                     Exit;
                  end;
               end;  // try..except
            end;  // with qryDetConcInss
         end;  // if not(bReprocessaINSS) or (chkReimporta.Checked)

         //--------------------------------------------------------------------------------------------

         // Procura na HistRubSal os casos que precisam ter rateio por plano
         // Posteriormente, a cada pessoa que for gerar insert na DetConcINSS, vefificar-se-á o total
         // por plano das rubricas que estiverem parametrizadas para ratear por plano e o percentual
         // por plano será aplicado nas rubricas a gravar na DetConcINSS

         with qryHRS do
         begin
            Close;
            if not(Prepared) then Prepare;
            ParamByname('PMESCOBRANCA').AsString := sAnoMesRef;
            Open;
         end;
         cdsHRS.Active := True;

         //--------------------------------------------------------------------------------------------

         // Inicia Processamento
         sNumProcINSS := '9999999999';
         bGravaLog    := False;

         while not(EOF(wArquivoImportacao)) do
         begin
            if (Contador mod 500) = 0 then
            begin
               CommitTransacao;
               StartTransacao;
            end;

            Application.ProcessMessages;

            // Lê a Linha
            Readln(wArquivoImportacao, wLinha);
//           if '6000000000002904400002000000000219868620000000000000000000000006651605906000000000000152810009528896000000000113386450000000000000000000053000000000000000000000' =wLinha then
//               showmessage('oi');
            // Caso Linha vazia pula
            if Trim(wLinha) = '' then Continue;

            // Guarda Tipo de Linha
            wTipoLinha := StrToInt(Copy(wLinha,1,1));

            // Executa Processamento de Acordo com o Tipo de Linha
            case wTipoLinha of
               1: ProcHCentralizador;  // Header Centralizadora
               2: ProcHPagador;        // Header Pagador
               3: ProcDetalhe;         // Detalhe
               4: ProcRubrica;         // Rubricas
               5: ProcFPagador;        // Footer Pagador
               6: ProcFCentralizador;  // Footer Centralizadora
            end;


            inc(Contador);
            lblBarraProgresso.Caption := 'Aguarde ... ' + IntToStr(Contador);

            // ----------------------------------------------------------------------------------------
            // ----------------------------------------------------------------------------------------


            //Renato Visoni SOL 123118 Kintana 612606
            if (wTipoLinha = 2) then begin
              sCODSINONIMO := Copy(wLinha,7,6);
            end;

            if (wTipoLinha = 3) or (wTipoLinha = 4) then begin
              sDTINICIOCRED := Copy(wLinha,12,6);
              sDTFIMCRED    := Copy(wLinha,18,6);
            end;

            //Renato Visoni SOL 123118 Kintana 612606
//             if Copy(wLinha, 02, 10)='1291462390' then
//            if //(LDETALHE.NUMEROBENEFICIO='1291462390') or
//               (LDETALHE.NUMEROBENEFICIO='1291731765') then
//               (LDETALHE.NUMEROBENEFICIO='1291731765') or
//               (LDETALHE.NUMEROBENEFICIO='1291731765') or
//               (LDETALHE.NUMEROBENEFICIO='1291799440') or
//               (LDETALHE.NUMEROBENEFICIO='1291799467') or
//               (LDETALHE.NUMEROBENEFICIO='1291799475') or
//               (LDETALHE.NUMEROBENEFICIO='1291919853') or
//               (LDETALHE.NUMEROBENEFICIO='1331288310') or
//               (LDETALHE.NUMEROBENEFICIO='1331288336')  then
//               showmessage('oi2');

            // Grava Registro caso detalhe
            if (wTipoLinha = 3) and (sNumProcINSS <> LDETALHE.NUMEROBENEFICIO) then
            begin
               bGravaLog        := False;
               sIdPlanoPrev     := '';
               sIdPlanoPrevPrev := '';
               sMatricula       := '';
               sNome            := '';
               sIdPessoa        := '';
               sIdTitular       := '';
               sDIB             := '';
               sCodMantenedora  := '';
               sIdBeneficio     := '';
               sNumProcINSS     := LDETALHE.NUMEROBENEFICIO;

               // 1º - Na primeira pesquisa, verifica se a pessoa esta na BENEFBFCIARIO com
               // o beneficio informado no Arquivo
               qryAuxDadosPart.Close;
               qryAuxDadosPart.SQL.Clear;
               qryAuxDadosPart.SQL.Text :=
               ' SELECT BF.IDSITBENEFICIO, BF.IDPESSJUR, BF.IDPLANOPREV, BF.IDPESSOA ,' +
               ' PI.IDPLANPREVCONTAB AS IDPLANPREVCONTAB, '+
               ' BF.IDTITULAR, BF.SEQPROPOSTA, BF.IDBENEFICIO, BEN.CODBENEFICIO,  DP.MATRICULA AS MATRICDEPEN, ' +
               ' NVL(EL.MATRICULA,DP.MATRICULA) AS MATRICULA, BF.DATAINICIOINSS AS DIB ' +
               ' FROM BENEFBFCIARIO BF,ELEGPATRO EL, BENEFICIO BEN, DEPENTIT DP , BENEFPLANPREV BFP, PERFILINVEST PI ' +
               ' WHERE BF.NUMPROCINSS   = ' + QuotedStr(LDETALHE.NUMEROBENEFICIO) +
               ' and BF.IDSITBENEFICIO <= 4  ' +
               ' and   BEN.CODBENEFICIO = ' + LDetalhe.Especie +
               ' and   EL.IDPESSJUR(+)   = BF.IDPESSJUR '+
               ' and   EL.IDPESSOA(+)    = BF.IDPESSOA '+
               ' and   PI.IDPERFILINVEST = BF.IDPERFILINVEST '+
               ' and   DP.IDTITULAR      =  BF.IDTITULAR ' +
               ' and   DP.IDPESSOA       =  BF.IDPESSOA  ' +
               ' and   BEN.IDBENEFICIO   = BF.IDBENEFICIO' +
               ' and   BF.IDBENEFICIO    = BFP.IDBENEFICIO(+)' +
               ' and   BF.IDPLANOPREV    = BFP.IDPLANOPREV(+)' +
               ' and   BFP.FLGREFERENCIA = 1 '+
               //BRUNO AZEVEDO SOL 167460 KINTANA 1470597
               ' ORDER BY NVL(BF.DATAFINAL, SYSDATE) DESC, BF.IDSITBENEFICIO ';   //edilaine - SIG63793

               qryAuxDadosPart.Open;
               if qryAuxDadosPart.IsEmpty then
               begin
                  // 2º - Procura somente o NB, sem a espécie
                  // Na segunda pesquisa, verifica se a pessoa esta na BENEFBFCIARIO mesmo
                  // sem o beneficio informado no Arquivo
                  qryAuxDadosPart.Close;
                  qryAuxDadosPart.SQL.Clear;
                  qryAuxDadosPart.SQL.Text :=
                  ' SELECT BF.IDPESSJUR, BF.IDPLANOPREV, BF.IDPESSOA ,' +
                  ' PI.IDPLANPREVCONTAB AS IDPLANPREVCONTAB, '+
                  ' BF.IDTITULAR, BF.SEQPROPOSTA, BF.IDBENEFICIO, BEN.CODBENEFICIO,DP.MATRICULA AS MATRICDEPEN,  ' +
                  ' NVL(EL.MATRICULA,DP.MATRICULA) AS MATRICULA, BF.DATAINICIOINSS AS DIB ' +
                  ' FROM BENEFBFCIARIO BF,ELEGPATRO EL, BENEFICIO BEN, DEPENTIT DP, BENEFPLANPREV BFP, PERFILINVEST PI ' +
                  ' WHERE BF.NUMPROCINSS   = '+ QuotedStr(LDETALHE.NUMEROBENEFICIO) +
                  ' and   ((BF.IDSITBENEFICIO < 3) OR (BF.IDSITBENEFICIO = 4) )   ' +
                  ' and   EL.IDPESSJUR(+) = BF.IDPESSJUR '+
                  ' and   EL.IDPESSOA(+)  = BF.IDPESSOA '+
                  ' and   PI.IDPERFILINVEST = BF.IDPERFILINVEST '+
                  ' and   DP.IDTITULAR     =  BF.IDTITULAR ' +
                  ' and   DP.IDPESSOA      =  BF.IDPESSOA  ' +
                  ' and   BEN.IDBENEFICIO  = BF.IDBENEFICIO' +
                  ' and   BF.IDBENEFICIO   = BFP.IDBENEFICIO(+)' +
                  ' and   BF.IDPLANOPREV   = BFP.IDPLANOPREV(+)' +
                  ' and   BFP.FLGREFERENCIA = 1'+
                  //BRUNO AZEVEDO SOL 167460 KINTANA 1470597
                  ' ORDER BY NVL(BF.DATAFINAL, SYSDATE) DESC, BF.IDSITBENEFICIO ';   //edilaine - SIG63793

                  qryAuxDadosPart.Open;
                  if not(qryAuxDadosPart.IsEmpty) then
                  begin
                     // Achou, porém com benefícios distintos
                     WriteLn(wArquivoExcecao,
                             ' Nº Benefício : '+ LDetalhe.NumeroBeneficio +
                             ' Espécie : '+Trim(LDetalhe.Especie) + ' diferente da Fundação (' +
                             qryAuxDadosPart.FieldByName('CODBENEFICIO').AsString + ')' +
                             ' Matrícula : ' + qryAuxDadosPart.FieldByName('MATRICULA').AsString
                            );

                     sIdPlanoPrev     := qryAuxDadosPart.FieldByName('IDPLANPREVCONTAB').AsString;
                     sIdPlanoPrevPrev := qryAuxDadosPart.FieldByName('IDPLANOPREV').AsString;

                     sMatricula       := qryAuxDadosPart.FieldByName('MATRICULA').AsString;
                     sIdPessoa        := qryAuxDadosPart.FieldByName('IDPESSOA').AsString;
                     sDIB             := DatetoStr(qryAuxDadosPart.FieldByName('DIB').AsDateTime);
                     sIdBeneficio     := qryAuxDadosPart.FieldByName('IDBENEFICIO').AsString;

                     sIdTitular       := qryAuxDadosPart.FieldByName('IDTITULAR').AsString;


///douglas.siqueira163044
                                  if (trim(sIdPlanoPrev) = '') or (trim(sIdPlanoPrevPrev)='') or (trim(sCodMantenedora)='') then
                                  begin
                                   if trim(sIdTitular)<>'' then
                                     getPlanoPartPrevPlan( sIdTitular,  sIdPlanoPrevPrev, sIdPlanoPrev,sCodMantenedora);
                                  end;
///douglas.siqueira                     




                     bGravaLog := True;

                     if qryAuxDadosPart.RecordCount > 1 then
                     begin
                        // Possivelmente mais de uma matrícula por NB
                        WriteLn(wArquivoExcecao,
                                ' Nº Benefício : '+ LDetalhe.NumeroBeneficio +
                                ' possivelmente com mais de uma matrícula vinculada : '
                               );

                        while not(qryAuxDadosPart.EOF) do
                        begin
                           WriteLn(wArquivoExcecao,
                                   '        Matrícula : ' + qryAuxDadosPart.FieldByName('MATRICDEPEN').AsString +
                                   ' | Plano Previdenciário : ' + qryAuxDadosPart.FieldByName('IDPLANOPREV').AsString
                                  );
                           qryAuxDadosPart.Next;
                        end;

                        qryAuxDadosPart.First;
                     end;

                  end
                  else  // if not(qryAuxDadosPart.IsEmpty)
                  begin
                     // 3º - Procurar na DETCONCINSS
                     // Na terceira pesquisa, verifica se a pessoa já esta na DETCONCINSS

                     qryAuxDadosPart.Close;
                     qryAuxDadosPart.SQL.Clear;
                     qryAuxDadosPart.SQL.Text :=
                     ' SELECT PI.IDPLANPREVCONTAB as IDPLANOPREVCONTAB , D.IDPLANOPREVPREV, D.MATRICULA, D.IDPESSOA ,' +
                     ' D.NOME, D.CODMANTENEDORA, D.DIB , D.IDBENEFICIO'+
                     ' FROM DETCONCINSS D, PERFILINVEST PI, (SELECT MAX(MESCOBRANCA) MESCOB FROM DETCONCINSS WHERE ' +
                     '                      NUMPROCINSS = '+ QuotedStr(LDETALHE.NUMEROBENEFICIO) +
                     '                      and FLGMANUAL = 0 ' +
                                            ') MAXDET' +
                     ' WHERE D.NUMPROCINSS = ' + QuotedStr(LDETALHE.NUMEROBENEFICIO)  +
//                     ' and FLGMANUAL = 0 ' + //Everson TIBERO
                     ' and D.FLGMANUAL = 0 ' + //Everson TIBERO
                     //edilaine - SIG63793 - inicio
                     //' and PI.idplanoprev = D.idplanoprev '+
                     ' AND PI.IDPLANOPREV = D.IDPLANOPREVPREV '+
                     ' AND PI.FLGPADRAOINSS = 1'+
                     ' AND PI.FLGATIVO = 1'+
                     //edilaine - SIG63793 - fim
                     ' and   D.MESCOBRANCA =  MAXDET.MESCOB';
                     qryAuxDadosPart.Open;

                     if not(qryAuxDadosPart.IsEmpty) then
                     begin
                        sIdPlanoPrev     := qryAuxDadosPart.FieldByName('IDPLANOPREVCONTAB').AsString;
                        sIdPlanoPrevPrev := qryAuxDadosPart.FieldByName('IDPLANOPREVPREV').AsString;


                        sMatricula       := qryAuxDadosPart.FieldByName('MATRICULA').AsString;
                        sNome            := qryAuxDadosPart.FieldByName('NOME').AsString;
                        sIdPessoa        := qryAuxDadosPart.FieldByName('IDPESSOA').AsString;
                        sDIB             := DatetoStr(qryAuxDadosPart.FieldByName('DIB').AsDateTime);
                        sCodMantenedora  := qryAuxDadosPart.FieldByName('CODMANTENEDORA').AsString;

///douglas.siqueira163044
                                  if (trim(sIdPlanoPrev) = '') or (trim(sIdPlanoPrevPrev)='') or (trim(sCodMantenedora)='') then
                                  begin
                                    if trim(sIdPessoa)<>'' then
                                       getPlanoPartPrevPlan(getTitular(sIdPessoa),  sIdPlanoPrevPrev, sIdPlanoPrev,sCodMantenedora);
                                  end;

///douglas.siqueira

                        sIdBeneficio     := qryAuxDadosPart.FieldByName('IDBENEFICIO').AsString;
                        bGravaLog        := True;
                     end
                     else   // if not(qryAuxDadosPart.IsEmpty)
                     begin
                        // 4º - Na quarta pesquisa, verifica se a pessoa já esta na RUBRICAINDIV
                        // pode ser uma Pensão Alimentícia
                        qryAuxDadosPart.Close;
                        qryAuxDadosPart.SQL.Clear;
                        qryAuxDadosPart.SQL.Text :=
                        ' SELECT IDPESSOA , IDTITULAR, IDFAVORECIDO ' +
                        ' FROM RUBRICAINDIV ' +
                        ' WHERE NUMPROCINSS = ' + QuotedStr(LDETALHE.NUMEROBENEFICIO);

                        qryAuxDadosPart.Open;
                        if not(qryAuxDadosPart.IsEmpty) then
                        begin
                           sIdTitular := InttoStr(qryAuxDadosPart.FieldByName('IDTITULAR').AsInteger);
                           sIdPessoa  := InttoStr(qryAuxDadosPart.FieldByName('IDPESSOA').AsInteger);

                           qryAuxDadosPart.Close;
                           qryAuxDadosPart.SQL.Clear;
                           qryAuxDadosPart.SQL.Text :=
                           ' SELECT BF.IDPESSJUR, BF.IDPLANOPREV, BF.IDPESSOA ,' +
                           ' PI.IDPLANPREVCONTAB AS IDPLANPREVCONTAB, '+
                           ' BF.IDTITULAR, BF.SEQPROPOSTA, BF.IDBENEFICIO, BEN.CODBENEFICIO,DP.MATRICULA AS MATRICDEPEN,  ' +
                           ' NVL(EL.MATRICULA,DP.MATRICULA) AS MATRICULA, BF.IDPLANOPREV, BF.DATAINICIOINSS AS DIB ' +
                           ' FROM BENEFBFCIARIO BF, ELEGPATRO EL, BENEFICIO BEN, DEPENTIT DP, BENEFPLANPREV BFP, '+
                           ' PERFILINVEST PI ' +
                           ' WHERE BF.IDTITULAR     = ' + sIdTitular  +
                           ' and   BF.IDPESSOA      = ' + sIdPessoa   +
                           ' and   ((BF.IDSITBENEFICIO < 3) OR (BF.IDSITBENEFICIO = 4) )   ' +
                           ' and   EL.IDPESSJUR(+)  = BF.IDPESSJUR '+
                           ' and   EL.IDPESSOA(+)   = BF.IDPESSOA '+
                           ' and   EL.IDPESSOA      =  BF.IDPESSOA ' +
                           ' and   DP.IDTITULAR     =  BF.IDTITULAR ' +
                           ' and   DP.IDPESSOA      =  BF.IDPESSOA  ' +
                           ' and   BEN.IDBENEFICIO  = BF.IDBENEFICIO' +
                           ' and   PI.IDPERFILINVEST = BF.Idperfilinvest '+
                           ' and   BF.IDBENEFICIO   = BFP.IDBENEFICIO(+)' +
                           ' and   BF.IDPLANOPREV   = BFP.IDPLANOPREV(+)' +
                           ' and   BFP.FLGREFERENCIA = 1';
                           qryAuxDadosPart.Open;

                           if not(qryAuxDadosPart.IsEmpty) then
                           begin
                              sIdPlanoPrev     := qryAuxDadosPart.FieldByName('IDPLANPREVCONTAB').AsString;
                              sIdPlanoPrevPrev := qryAuxDadosPart.FieldByName('IDPLANOPREV').AsString;

                              sMatricula       := '';
                              sDIB             := DatetoStr(qryAuxDadosPart.FieldByName('DIB').AsDateTime);
                              sIdBeneficio     := LDetalhe.Especie;

///douglas.siqueira163044
                                  if (trim(sIdPlanoPrev) = '') or (trim(sIdPlanoPrevPrev)='') or (trim(sCodMantenedora)='') then
                                  begin
                                   if trim(qryAuxDadosPart.FieldByName('IDTITULAR').AsString)<>'' then
                                     getPlanoPartPrevPlan( qryAuxDadosPart.FieldByName('IDTITULAR').AsString,  sIdPlanoPrevPrev, sIdPlanoPrev,sCodMantenedora);
                                  end;
///douglas.siqueira


                              bGravaLog := True;
                           end;  // if not(qryAuxDadosPart.IsEmpty)
                           //Se nao encontrar em nenhum dos casos, tentar uma
                           // ultima vez na BENEFHABILITA
                           //Fanuel Marinho SOL163044 - Inicio
                          { else
                           begin

                              qryAuxDadosPart.Close;
                              qryAuxDadosPart.SQL.Clear;
                              qryAuxDadosPart.SQL.Text :=
                              ' SELECT BH.IDPESSOA, BH.IDTITULAR, BF.IDPLANOPREV, BF.IDPLANPREVCONTAB, '+
                              ' BH.IDBENEFHABILITA, BH.FLGCONCESSAO, BH.FLGREQUERIMENTO, EL.MATRICULA, '+
                              ' BF.DATAINICIOINSS AS DIB, BF.IDBENEFICIO, DP.MATRICULA AS MATRICDEPEN, '+
                              ' SHB.FLGHABILITACAOINSS AS FLGINSS '+
                              ' FROM BENEFHABILITA BH, BENEFBFCIARIO BF, ELEGPATRO EL, DEPENTIT DP, '+
                              ' HISTBENEFHABILITA HBH, SITHABILITACAOINSS SHB '+
                              ' WHERE BH.NUMBENEFICIO = '+ QuotedStr(LDETALHE.NUMEROBENEFICIO)+
                              ' AND BH.NUMBENEFICIO = BF.NUMPROCINSS(+) '+
                              ' AND BH.IDPESSOA = EL.IDPESSOA(+) '+
                              ' AND BH.IDPESSOA = DP.IDPESSOA(+) '+
                              ' AND BH.IDTITULAR = DP.IDTITULAR(+) '+
                              ' AND BH.IDBENEFHABILITA = HBH.IDBENEFHABILITA '+
                              ' AND SHB.IDSITHABILITACAO = HBH.IDSITHABILITACAO ';
                               qryAuxDadosPart.Open;

                               if not(qryAuxDadosPart.IsEmpty) and (qryAuxDadosPart.FieldByName('IDTITULAR').AsInteger = 1) then
                               begin
                                  sIdPlanoPrev     := qryAuxDadosPart.FieldByName('IDPLANPREVCONTAB').AsString;
                                  sIdPlanoPrevPrev := qryAuxDadosPart.FieldByName('IDPLANOPREV').AsString;
                                  sMatricula       := qryAuxDadosPart.FieldByName('MATRICULA').AsString;
                                  sIdPessoa        := qryAuxDadosPart.FieldByName('IDPESSOA').AsString;
                                  sDIB             := DatetoStr(qryAuxDadosPart.FieldByName('DIB').AsDateTime);
                                  sIdBeneficio     := qryAuxDadosPart.FieldByName('IDBENEFICIO').AsString;
                                  sIdTitular       := qryAuxDadosPart.FieldByName('IDTITULAR').AsString;
                                  bGravaLog := True;

                                  if trim(sIdPlanoPrev) = '' then
                                  begin
                                     getPlanoPartPrevPlan( sIdPessoa,  sIdPlanoPrevPrev, sIdPlanoPrev);
                                  end;


                                  //////////////////////////////////////////////////////////////////////////////////////
                                   if qryAuxDadosPart.RecordCount > 1 then
                                   begin
                                    // Possivelmente mais de uma matrícula por NB
                                        WriteLn(wArquivoExcecao,
                                            ' Nº Benefício : '+ LDetalhe.NumeroBeneficio +
                                            ' possivelmente com mais de uma matrícula vinculada : '
                                            );

                                        while not(qryAuxDadosPart.EOF) do
                                          begin
                                              WriteLn(wArquivoExcecao,
                                                 '        Matrícula : ' + qryAuxDadosPart.FieldByName('MATRICDEPEN').AsString +
                                                 ' | Plano Previdenciário : ' + qryAuxDadosPart.FieldByName('IDPLANOPREV').AsString
                                               );
                                               qryAuxDadosPart.Next;
                                           end;
                                        qryAuxDadosPart.First;
                                   end;
                                 //////////////////////////////////////////////////////////////////////////////////////
                                 //Flgs para validação
                                 //iFlgInss := qryAuxDadosPart.FieldByName('IDTITULAR').AsInteger;
                                 //sIdBenefHabilita := qryAuxDadosPart.FieldByName('IDBENEFHABILITA').AsString;
                               end
                               else
                               begin

                               //Se a query não estiver vazia e o flg for igual a 0, fazer insert
                               //no historico de habilitação de beneficio
                                  if (qryAuxDadosPart.FieldByName('FLGINSS').AsInteger = 0) then
                                  begin
                                     habilitaBeneficio(qryAuxDadosPart.FieldByName('IDBENEFHABILITA').AsString);
                                  end;

                               end;  }

                          //end;
                       //end;  // if not(qryAuxDadosPart.IsEmpty) Fanuel Marinho
                       end
                       else
                       begin
                       //////////////////////////////////////////////////////////////////////////
                              qryAuxDadosPart.Close;
                              qryAuxDadosPart.SQL.Clear;
                              qryAuxDadosPart.SQL.Text :=
                              //Darivaldo Alencar SIG63793 -INICIO
                              //' SELECT BH.IDPESSOA, BH.IDTITULAR, '
                              //' BF.IDPLANOPREV, PI.IDPLANPREVCONTAB, '+
                              //' BH.IDBENEFHABILITA, BH.FLGCONCESSAO, BH.FLGREQUERIMENTO, EL.MATRICULA, '+
                              //' BF.DATAINICIOINSS AS DIB, BF.IDBENEFICIO, DP.MATRICULA AS MATRICDEPEN, '+
                              //' SHB.FLGHABILITACAOINSS AS FLGINSS '+
                              //' FROM BENEFHABILITA BH, BENEFBFCIARIO BF, ELEGPATRO EL, DEPENTIT DP, '+
                              //' PERFILINVEST PI, HISTBENEFHABILITA HBH, SITHABILITACAOINSS SHB '+
                              //' WHERE BH.NUMBENEFICIO = '+ QuotedStr(LDETALHE.NUMEROBENEFICIO)+
                              //' AND BH.NUMBENEFICIO = BF.NUMPROCINSS(+) '+
                              //' AND BH.IDPESSOA = EL.IDPESSOA(+) '+
                              //' AND BH.IDPESSOA = DP.IDPESSOA(+) '+
                              //' AND BH.IDTITULAR = DP.IDTITULAR(+) '+
                              //' and PI.IDPERFILINVEST = BF.IDPERFILINVEST '+
                              //' AND BH.IDBENEFHABILITA = HBH.IDBENEFHABILITA '+
                              //' AND SHB.IDSITHABILITACAO = HBH.IDSITHABILITACAO '+
                              //' ORDER BY HBH.DATAREGISTRO DESC ';

                              'SELECT BH.IDPESSOA,' + #13#10 +
                              '       BH.IDTITULAR,' + #13#10 +
                              '       NVL(PI.IDPLANOPREV,' + #13#10 +
                              '           (SELECT MIN(PPP.IDPLANOPREV)' + #13#10 +
                              '            FROM PARTPREVPLAN PPP' + #13#10 +
                              '           WHERE PPP.IDPESSOA = BH.IDTITULAR' + #13#10 +
                              '             AND (PPP.FLGDESATIVADO = 0 OR' + #13#10 +
                              '                  PPP.IDSITPLANOPREV IN (25,26,27,28,29)))) IDPLANOPREV,' + #13#10 +
                              '       NVL(PI.IDPLANPREVCONTAB,' + #13#10 +
                              '           (SELECT MAX(PI.IDPLANPREVCONTAB)' + #13#10 +
                              '            FROM (SELECT PPP.IDPESSOA, MIN(PPP.IDPLANOPREV) IDPLANOPREV' + #13#10 +
                              '                  FROM PARTPREVPLAN PPP' + #13#10 +
                              '                  WHERE (PPP.FLGDESATIVADO = 0 OR' + #13#10 +
                              '                         PPP.IDSITPLANOPREV IN (25,26,27,28,29))' + #13#10 +
                              '                  GROUP BY PPP.IDPESSOA) PPP' + #13#10 +
                              '                 JOIN PERFILINVEST PI ON PPP.IDPLANOPREV = PI.IDPLANOPREV' + #13#10 +
                              '                                     AND PI.FLGATIVO = 1' + #13#10 +
                              '                                     AND PI.FLGPADRAOINSS = 1' + #13#10 +
                              '            WHERE PPP.IDPESSOA = BH.IDTITULAR)) IDPLANPREVCONTAB,' + #13#10 +
                              '       BH.IDBENEFHABILITA,' + #13#10 +
                              '       BH.FLGCONCESSAO,' + #13#10 +
                              '       BH.FLGREQUERIMENTO,' + #13#10 +
                              '       EL.MATRICULA,' + #13#10 +
                              '       BF.DATAINICIOINSS AS DIB,' + #13#10 +
                              '       BF.IDBENEFICIO,' + #13#10 +
                              '       DP.MATRICULA AS MATRICDEPEN,' + #13#10 +
                              '       SHB.FLGHABILITACAOINSS AS FLGINSS' + #13#10 +
                              'FROM BENEFHABILITA BH' + #13#10 +
                              '     JOIN HISTBENEFHABILITA HBH ON BH.IDBENEFHABILITA = HBH.IDBENEFHABILITA' + #13#10 +
                              '     JOIN SITHABILITACAOINSS SHB ON SHB.IDSITHABILITACAO = HBH.IDSITHABILITACAO' + #13#10 +
                              '     LEFT JOIN DEPENTIT DP ON BH.IDPESSOA = DP.IDPESSOA AND' + #13#10 +
                              '                              BH.IDTITULAR = DP.IDTITULAR' + #13#10 +
                              '     LEFT JOIN ELEGPATRO EL ON BH.IDPESSOA = EL.IDPESSOA' + #13#10 +
                              '     LEFT JOIN BENEFBFCIARIO BF ON BH.NUMBENEFICIO = BF.NUMPROCINSS' + #13#10 +
                              '     LEFT JOIN PERFILINVEST PI ON PI.IDPERFILINVEST = BF.IDPERFILINVEST' + #13#10 +
                              'WHERE BH.NUMBENEFICIO = '+ QuotedStr(LDETALHE.NUMEROBENEFICIO) + #13#10 +
                              'ORDER BY HBH.DATAREGISTRO DESC';
                              //Darivaldo Alencar SIG63793 -FIM
                               qryAuxDadosPart.Open;

                               //if not(qryAuxDadosPart.IsEmpty) and (qryAuxDadosPart.FieldByName('FLGINSS').AsInteger = 1) then
                               if not(qryAuxDadosPart.IsEmpty) then
                               begin

                                  if chkReimporta.Checked then
                                     DeleteHistBenefHabilita(LDETALHE.NUMEROBENEFICIO);

                                  sIdPlanoPrev     := qryAuxDadosPart.FieldByName('IDPLANPREVCONTAB').AsString;
                                  sIdPlanoPrevPrev := qryAuxDadosPart.FieldByName('IDPLANOPREV').AsString;

                                  sMatricula       := qryAuxDadosPart.FieldByName('MATRICULA').AsString;
                                  sIdPessoa        := qryAuxDadosPart.FieldByName('IDPESSOA').AsString;
                                  sDIB             := DatetoStr(qryAuxDadosPart.FieldByName('DIB').AsDateTime);
                                  sIdBeneficio     := qryAuxDadosPart.FieldByName('IDBENEFICIO').AsString;
                                  sIdTitular       := qryAuxDadosPart.FieldByName('IDTITULAR').AsString;

                                  habilitaBeneficio(qryAuxDadosPart.FieldByName('IDBENEFHABILITA').AsString);
                                  bGravaLog := True;

                                  if trim(sIdPlanoPrev) = '' then
                                  begin
                                     getPlanoPartPrevPlan( sIdPessoa,  sIdPlanoPrevPrev, sIdPlanoPrev,sCodMantenedora);
                                  end;

///douglas.siqueira163044
                                  if (trim(sIdPlanoPrev) = '') or (trim(sIdPlanoPrevPrev)='') or (trim(sCodMantenedora)='') then
                                  begin
                                   if trim(sIdTitular)<>'' then
                                       getPlanoPartPrevPlan( sIdTitular,  sIdPlanoPrevPrev, sIdPlanoPrev,sCodMantenedora);
                                  end;
///douglas.siqueira


                                  //////////////////////////////////////////////////////////////////////////////////////
                                   if qryAuxDadosPart.RecordCount > 1 then
                                   begin
                                    // Possivelmente mais de uma matrícula por NB
                                        WriteLn(wArquivoExcecao,
                                            ' Nº Benefício : '+ LDetalhe.NumeroBeneficio +
                                            ' possivelmente com mais de uma matrícula vinculada : '
                                            );

                                        while not(qryAuxDadosPart.EOF) do
                                          begin
                                              WriteLn(wArquivoExcecao,
                                                 '        Matrícula : ' + qryAuxDadosPart.FieldByName('MATRICDEPEN').AsString +
                                                 ' | Plano Previdenciário : ' + qryAuxDadosPart.FieldByName('IDPLANOPREV').AsString
                                               );
                                               qryAuxDadosPart.Next;
                                           end;
                                        qryAuxDadosPart.First;
                                   end;
                                 //////////////////////////////////////////////////////////////////////////////////////
                                 //Flgs para validação
                                 //iFlgInss := qryAuxDadosPart.FieldByName('IDTITULAR').AsInteger;
                                 //sIdBenefHabilita := qryAuxDadosPart.FieldByName('IDBENEFHABILITA').AsString;
                               end;
                               //else
                               {begin

                               //Se a query não estiver vazia e o flg for igual a 0, fazer insert
                               //no historico de habilitação de beneficio
                                  if (trim(qryAuxDadosPart.FieldByName('FLGINSS').AsString) = '0') then
                                  begin
                                     habilitaBeneficio(qryAuxDadosPart.FieldByName('IDBENEFHABILITA').AsString);
                                  end;

                               end;  }

                          //end;
                       //end;  // if not(qryAuxDadosPart.IsEmpty) Fanuel Marinho



                       /////////////////////////////////////////////////////////////////////////

                       end;

                     end;  // if not(qryAuxDadosPart.IsEmpty)
                  end;  // if not(qryAuxDadosPart.IsEmpty)

               end
               else  // if qryAuxDadosPart.IsEmpty
               begin
                  sIdPlanoPrev     := qryAuxDadosPart.FieldByName('IDPLANPREVCONTAB').AsString;
                  sIdPlanoPrevPrev := qryAuxDadosPart.FieldByName('IDPLANOPREV').AsString;

                  sMatricula       := qryAuxDadosPart.FieldByName('MATRICULA').AsString;
                  sIdPessoa        := qryAuxDadosPart.FieldByName('IDPESSOA').AsString;
                  sDIB             := DatetoStr(qryAuxDadosPart.FieldByName('DIB').AsDateTime);
                  sIdBeneficio     := qryAuxDadosPart.FieldByName('IDBENEFICIO').AsString;

                  sIdTitular       := qryAuxDadosPart.FieldByName('IDTITULAR').AsString;


///douglas.siqueira163044
                                  if (trim(sIdPlanoPrev) = '') or (trim(sIdPlanoPrevPrev)='') or (trim(sCodMantenedora)='') then
                                  begin
                                   if trim(sIdTitular)<>'' then
                                     getPlanoPartPrevPlan( sIdTitular,  sIdPlanoPrevPrev, sIdPlanoPrev,sCodMantenedora);
                                  end;
///douglas.siqueira                  



                  bGravaLog := True;

                  if qryAuxDadosPart.RecordCount > 1 then
                  begin
                     // Possivelmente mais de uma matrícula por NB
                     WriteLn(wArquivoExcecao,
                             ' Nº Benefício : '+ LDetalhe.NumeroBeneficio +
                             ' possivelmente com mais de uma matrícula vinculada : '
                            );

                     while not(qryAuxDadosPart.EOF) do
                     begin
                        WriteLn(wArquivoExcecao,
                                '        Matrícula : ' + qryAuxDadosPart.FieldByName('MATRICDEPEN').AsString +
                                ' | Plano Previdenciário : ' + qryAuxDadosPart.FieldByName('IDPLANOPREV').AsString
                               );
                        qryAuxDadosPart.Next;
                     end;  // while not(qryAuxDadosPart.EOF)

                     qryAuxDadosPart.First;
                  end;  // if qryAuxDadosPart.RecordCount > 1

               end;  // if qryAuxDadosPart.IsEmpty
            end;  // if (wTipoLinha = 3) and (sNumProcINSS <> LDETALHE.NUMEROBENEFICIO)

            // ----------------------------------------------------------------------------------------
            // ----------------------------------------------------------------------------------------

            if (wTipoLinha = 3) or (wTipoLinha = 4) then
            begin
               if bGravaLog then
               begin

               //Fanuel Junior SOL171942 Kintana1547064 procedimento comentado
               //pois as variaveis que estavam sendo alteradas devem ser
               //alteradas apenas pela query do SOL167460 que foi alterada
               //justamente para isso

                 //Renato Visoni SOL 117458 KINTANA 609436
                  {if qryAuxDadosPart.Active then begin
                    if qryAuxDadosPart.Recordcount > 1 then begin
                      with TwwQuery.Create(dtmBaseDados) do
                      begin
                        DataBaseName := dtmBaseDados.dbBaseDados.DataBaseName;

                        //Ádler Souza - SOL 117458 KINTANA 678173
                        SQL.Add('SELECT ULTMESPREPARO, ');
                        SQL.Add('       IDPLANOPREV, ');
                        SQL.Add('       IDPLANPREVCONTAB, ');
                        SQL.Add('       B.DATAFINAL, ');
                        SQL.Add('       B.IDSITBENEFICIO ');
                        SQL.Add('  FROM BENEFBFCIARIO B ');
                        SQL.Add(' WHERE NUMPROCINSS = '+ QuotedStr(LDETALHE.NUMEROBENEFICIO));
                        SQL.Add('   AND FONTEPAGADORA = 2 ');
                        SQL.Add('   AND IDSITBENEFICIO IN (1,2,3,4) ');
                        SQL.Add(' ORDER BY IDSITBENEFICIO ASC, ULTMESPREPARO DESC ');
                        //Fim - Ádler Souza - SOL 117458 KINTANA 678173

                        Open;

                        First;


                        if FieldByname('IDPLANPREVCONTAB').Asstring <> '' then begin
                          sIdPlanoPrev := FieldByname('IDPLANPREVCONTAB').Asstring;
                        end;

                        if FieldByname('IDPLANOPREV').Asstring <> '' then begin
                          sIdPlanoPrevPrev := FieldByname('IDPLANOPREV').Asstring;
                        end;

                        Close;
                        Free;
                      end;                                
                    end;
                  end; }
                 //Renato Visoni SOL 117458 KINTANA 609436

                  GravaDetConcINSS(sIdPlanoPrev,
                                   sMatricula,
                                   sNome,
                                   sIdPessoa,
                                   sIdTitular,
                                   sDIB,
                                   IntToStr(wTipoLinha),
                                   sCodMantenedora,
                                   sIdBeneficio,
                                   sIdPlanoPrevPrev
                                  );
               end
               else  // if bGravaLog
               begin
                  GravaTempConcINSS(InttoStr(wTipoLinha));
                  WriteLn(wArquivoExcecao,
                          ' Nº Benefício : '+ LDetalhe.NumeroBeneficio +
                          ' não identificado'
                         );
               end;  // if bGravaLog
            end;  // if (wTipoLinha = 3) or (wTipoLinha = 4)

         end;  // while not(EOF(wArquivoImportacao))

      except
         RollbackTransacao;
         Raise;
      end;

   finally
      // Fecha o Arquivo
      CloseFile(wArquivoImportacao);
      CloseFile(wArquivoExcecao);
      CloseFile(wArquivoUltimoGrupo); // Andre Imakawa - SIG 78688
   end;

   // ----------------------------------------------------------------------------------------------

   if dtmBaseDados.dbBaseDados.InTransaction then CommitTransacao;

   // Desliga Animate
   lblBarraProgresso.Visible  := False;
   Animate1.Visible           := False;
   Animate1.Active            := False;

   // Mostra Tempo da Importação
   Application.ProcessMessages;

   // ----------------------------------------------------------------------------------------------

   MsgDlg('Inicio.:   '+TimeToStr(Ini)    + #13 +
          'Final .:   '+TimeToStr(Time)   + #13 +
          '             ---------------'  + #13 +
          'Tempo .: '+TimeToStr(Time-Ini) +
          '  (Numero de Registros.: '+IntToStr(Contador) + ')',
          'AdmPrev', mtInformation, [mbOk], 0);
   Repaint;

   // ----------------------------------------------------------------------------------------------
end;




// Processa Header da Centraliazdora
procedure TFrmConciliacao.ProcHCentralizador;
begin
   // Desmembra Linha
   LHCentralizador.Identificador := Copy(wLinha,01,01);
   LHCentralizador.Codigo        := StrToInt(Copy(wLinha,07,06));
   LHCentralizador.Valor         := StrToFloat(ClienteNumero(Copy(wLinha,13,9)+','+Copy(wLinha,22,2)));

   // Processa Linha
   Exit;
end;



// Processa Header do Orgao Pagador
procedure TFrmConciliacao.ProcHPagador;
begin
   // Desmembra Linha
   LHPagador.Identificador := Copy(wLinha,01,01);
   LHPagador.DataCredito   := Copy(wLinha,02,04);
   LHPagador.Codigo        := StrToInt(Copy(wLinha,07,06));

   // Processa Linha
   Exit;
end;



// Processa Detalhe
procedure TFrmConciliacao.ProcDetalhe;
var
   i                 : Integer;
   wDataReferencia   : TDate;
   wDataCobranca     : TDate;
   sAno, sMes, sDia  : Word;
begin
   // Desmembra Linha
   LDetalhe.Identificador     := Copy(wLinha, 01, 01);
   LDetalhe.NumeroBeneficio   := Copy(wLinha, 02, 10);
   LDetalhe.DataInicio        := Copy(wLinha, 12, 06);   //-> AAMMDD
   LDetalhe.DataFim           := Copy(wLinha, 18, 06);   //-> AAMMDD
   LDetalhe.Especie           := Copy(wLinha, 24, 02);
   LDetalhe.OrgaoMantenedor   := Copy(wLinha, 26, 08);
   LDetalhe.OrgaoConcessor    := Copy(wLinha, 34, 08);
   LDetalhe.TipoDetalhe       := Copy(wLinha, 42, 01);  // 1 - Crédito de Concessão, 2 - Crédito Mensal, 4 - PAB (Revisão), 9 - Glosa
   LDetalhe.QtdDepPensao      := Copy(wLinha, 43, 02);
   LDetalhe.QtdDepValidos     := Copy(wLinha, 45, 02);
   LDetalhe.QtdDepSalFam      := Copy(wLinha, 47, 02);
   LDetalhe.QtdDepImpRend     := Copy(wLinha, 49, 02);

   LDetalhe.VlrMensReaj       := StrToFloat(ClienteNumero(Copy(wLinha, 51, 9) + ',' + Copy(wLinha, 60, 2)));
   LDetalhe.VlrAposReaj       := StrToFloat(ClienteNumero(Copy(wLinha, 62, 9) + ',' + Copy(wLinha, 71, 2)));
   LDetalhe.FlgTemRubrica     := Copy(wLinha, 73, 73);   // o próximo registro é Identificador = 4

   LDetalhe.CodRubCred1       := LDetalhe.TipoDetalhe + Copy(wLinha,74,03);
   LDetalhe.VlrRubCred1       := StrToFloat(ClienteNumero(Copy(wLinha,77,9)+','+Copy(wLinha,86,2)));
   aRubricaINSS[0].CodRubrica := LDetalhe.TipoDetalhe + Copy(wLinha,74,03);
   aRubricaINSS[0].Valor      := StrToFloat(ClienteNumero(Copy(wLinha,77,9)+','+Copy(wLinha,86,2)));

   LDetalhe.CodRubCred2       := LDetalhe.TipoDetalhe + Copy(wLinha,88,03);
   LDetalhe.VlrRubCred2       := StrToFloat(ClienteNumero(Copy(wLinha,91,9)+','+Copy(wLinha,100,2)));
   aRubricaINSS[1].CodRubrica := LDetalhe.TipoDetalhe + Copy(wLinha,88,03);
   aRubricaINSS[1].Valor      := StrToFloat(ClienteNumero(Copy(wLinha,91,9)+','+Copy(wLinha,100,2)));

   LDetalhe.CodRubCred3       := LDetalhe.TipoDetalhe + Copy(wLinha,102,03);
   LDetalhe.VlrRubCred3       := StrToFloat(ClienteNumero(Copy(wLinha,105,9)+','+Copy(wLinha,114,2)));
   aRubricaINSS[2].CodRubrica := LDetalhe.TipoDetalhe + Copy(wLinha,102,03);
   aRubricaINSS[2].Valor      := StrToFloat(ClienteNumero(Copy(wLinha,105,9)+','+Copy(wLinha,114,2)));

   LDetalhe.CodRubCred4       := LDetalhe.TipoDetalhe + Copy(wLinha,116,03);
   LDetalhe.VlrRubCred4       := StrToFloat(ClienteNumero(Copy(wLinha,119,9)+','+Copy(wLinha,128,2)));
   aRubricaINSS[3].CodRubrica := LDetalhe.TipoDetalhe + Copy(wLinha,116,03);
   aRubricaINSS[3].Valor      := StrToFloat(ClienteNumero(Copy(wLinha,119,9)+','+Copy(wLinha,128,2)));

   aRubricaINSS[4].CodRubrica := '0';
   aRubricaINSS[4].Valor      := 0;

   aRubricaINSS[5].CodRubrica := '0';
   aRubricaINSS[5].Valor      := 0;

   aRubricaINSS[6].CodRubrica := '0';
   aRubricaINSS[6].Valor      := 0;

   aRubricaINSS[7].CodRubrica := '0';
   aRubricaINSS[7].Valor      := 0;

   aRubricaINSS[8].CodRubrica := '0';
   aRubricaINSS[8].Valor      := 0;

   LDetalhe.NomeRecebedor     := Copy(wLinha,130,27);
   LDetalhe.Sequencia         := Copy(wLinha,159,03);

   wDataCobranca   := EncodeDate( StrToInt( '20'+Copy(wLinha,18,02) ),
                                  StrToInt( Copy(wLinha,20,02) ),
                                  StrToInt( Copy(wLinha,22,02) ) );

   // Monta data de Referencia
   {alteração para suportar data com 6 dígitos - não vem 1999 e sim 99}
   wDataReferencia := EncodeDate( StrToInt( '20'+Copy(wLinha,12,02) ),
                                  StrToInt( Copy(wLinha,14,02) ),
                                  StrToInt( Copy(wLinha,16,02) ) );

   if (StrtoInt(Copy(wLinha,12,02)) > 70) and (spnAno.Value < 2070) then
   begin
      wDataReferencia := EncodeDate( StrToInt( '19'+Copy(wLinha,12,02) ),
                                     StrToInt( Copy(wLinha,14,02) ),
                                     StrToInt( Copy(wLinha,16,02) ) );
   end;
   DecodeDate(wDataReferencia,sAno,sMes,sDia);


   if Length(IntToStr(sMes)) = 1 then
     LDetalhe.MesReferencia := IntToStr(sAno)+'/0'+ IntToStr(sMes)
   else
     LDetalhe.MesReferencia := IntToStr(sAno)+'/'+ IntToStr(sMes);


   DecodeDate(wDataCobranca,sAno,sMes,sDia);

   if Length(IntToStr(sMes)) = 1 then
     LDetalhe.MesCobranca := IntToStr(sAno)+'/0'+ IntToStr(sMes)
   else
     LDetalhe.MesCobranca := IntToStr(sAno)+'/'+ IntToStr(sMes);

end;




// Processa Rubrica
procedure TFrmConciliacao.ProcRubrica;
begin
   // Desmembra Linha
   LRubrica.Identificador   := Copy(wLinha,01,01);

   LRubrica.NumeroBeneficio := Copy(wLinha,02,10);

   LRubrica.DataFim         := Copy(wLinha,12,06);
   LRubrica.DataInicio      := Copy(wLinha,18,06);

   LRubrica.FlgTemRubrica   := Copy(wLinha,24,01);

   LRubrica.CodRubCred1     := LDetalhe.TipoDetalhe + Copy(wLinha,25,03);
   LRubrica.VlrRubCred1     := StrToFloat(ClienteNumero(Copy(wLinha,28,9)+','+Copy(wLinha,37,2)));
   aRubGrupoTipo4[0].CodRubrica  := LDetalhe.TipoDetalhe + Copy(wLinha,25,03);;
   aRubGrupoTipo4[0].Valor       := StrToFloat(ClienteNumero(Copy(wLinha,28,9)+','+Copy(wLinha,37,2)));


   LRubrica.CodRubCred2     := LDetalhe.TipoDetalhe + Copy(wLinha,39,03);
   LRubrica.VlrRubCred2     := StrToFloat(ClienteNumero(Copy(wLinha,42,9)+','+Copy(wLinha,51,2)));
   aRubGrupoTipo4[1].CodRubrica  := LDetalhe.TipoDetalhe + Copy(wLinha,39,03);;
   aRubGrupoTipo4[1].Valor       := StrToFloat(ClienteNumero(Copy(wLinha,42,9)+','+Copy(wLinha,51,2)));


   LRubrica.CodRubCred3     := LDetalhe.TipoDetalhe + Copy(wLinha,53,03);
   LRubrica.VlrRubCred3     := StrToFloat(ClienteNumero(Copy(wLinha,56,9)+','+Copy(wLinha,65,2)));
   aRubGrupoTipo4[2].CodRubrica  := LDetalhe.TipoDetalhe + Copy(wLinha,53,03);;
   aRubGrupoTipo4[2].Valor       := StrToFloat(ClienteNumero(Copy(wLinha,56,9)+','+Copy(wLinha,65,2)));

   LRubrica.CodRubCred4     := LDetalhe.TipoDetalhe + Copy(wLinha,67,03);
   LRubrica.VlrRubCred4     := StrToFloat(ClienteNumero(Copy(wLinha,70,9)+','+Copy(wLinha,79,2)));
   aRubGrupoTipo4[3].CodRubrica  := LDetalhe.TipoDetalhe + Copy(wLinha,67,03);;
   aRubGrupoTipo4[3].Valor       := StrToFloat(ClienteNumero(Copy(wLinha,70,9)+','+Copy(wLinha,79,2)));

   LRubrica.CodRubCred5     := LDetalhe.TipoDetalhe + Copy(wLinha,81,03);
   LRubrica.VlrRubCred5     := StrToFloat(ClienteNumero(Copy(wLinha,84,9)+','+Copy(wLinha,93,2)));
   aRubGrupoTipo4[4].CodRubrica  := LDetalhe.TipoDetalhe + Copy(wLinha,81,03);;
   aRubGrupoTipo4[4].Valor       := StrToFloat(ClienteNumero(Copy(wLinha,84,9)+','+Copy(wLinha,93,2)));

   LRubrica.CodRubCred6     := LDetalhe.TipoDetalhe + Copy(wLinha,95,03);
   LRubrica.VlrRubCred6     := StrToFloat(ClienteNumero(Copy(wLinha,98,9)+','+Copy(wLinha,107,2)));
   aRubGrupoTipo4[5].CodRubrica  := LDetalhe.TipoDetalhe + Copy(wLinha,95,03);;
   aRubGrupoTipo4[5].Valor       := StrToFloat(ClienteNumero(Copy(wLinha,98,9)+','+Copy(wLinha,107,2)));

   LRubrica.CodRubCred7     := LDetalhe.TipoDetalhe + Copy(wLinha,109,03);
   LRubrica.VlrRubCred7     := StrToFloat(ClienteNumero(Copy(wLinha,112,9)+','+Copy(wLinha,121,2)));
   aRubGrupoTipo4[6].CodRubrica  := LDetalhe.TipoDetalhe + Copy(wLinha,109,03);;
   aRubGrupoTipo4[6].Valor       := StrToFloat(ClienteNumero(Copy(wLinha,112,9)+','+Copy(wLinha,121,2)));

   LRubrica.CodRubCred8     := LDetalhe.TipoDetalhe + Copy(wLinha,123,03);
   LRubrica.VlrRubCred8     := StrToFloat(ClienteNumero(Copy(wLinha,126,9)+','+Copy(wLinha,135,2)));
   aRubGrupoTipo4[7].CodRubrica  := LDetalhe.TipoDetalhe + Copy(wLinha,123,03);;
   aRubGrupoTipo4[7].Valor       := StrToFloat(ClienteNumero(Copy(wLinha,126,9)+','+Copy(wLinha,135,2)));

   LRubrica.CodRubCred9     := LDetalhe.TipoDetalhe + Copy(wLinha,137,03);
   LRubrica.VlrRubCred9     := StrToFloat(ClienteNumero(Copy(wLinha,140,9)+','+Copy(wLinha,149,2)));
   aRubGrupoTipo4[8].CodRubrica  := LDetalhe.TipoDetalhe + Copy(wLinha,137,03);;
   aRubGrupoTipo4[8].Valor       := StrToFloat(ClienteNumero(Copy(wLinha,140,9)+','+Copy(wLinha,149,2)));

   LRubrica.Sequencia       := Copy(wLinha,151,02);

   // Processa Linha
   Exit;
end;



//------------------------------------------------------------------------------
// Processa Footer do Orgao Pagador
procedure TFrmConciliacao.ProcFPagador;
begin
   // Desmembra Linha
   LFPagador.Identificador := Copy(wLinha,01,01);

   LFPagador.QtdRegDet     := StrToInt(Copy(wLinha,13,05));
   LFPagador.QtdRegRub     := StrToInt(Copy(wLinha,18,05));

   LFPagador.VlrLiqAtrz    := StrToFloat(ClienteNumero(Copy(wLinha,23,13)+','+Copy(wLinha,36,2)));
   LFPagador.VlrIRAtrz     := StrToFloat(ClienteNumero(Copy(wLinha,38,13)+','+Copy(wLinha,51,2)));

   LFPagador.VlrLiqManut   := StrToFloat(ClienteNumero(Copy(wLinha,53,13)+','+Copy(wLinha,66,2)));
   LFPagador.VlrIRManut    := StrToFloat(ClienteNumero(Copy(wLinha,68,13)+','+Copy(wLinha,81,2)));

   LFPagador.QtdCredAtrz   := StrToInt(Copy(wLinha,83,05));
   LFPagador.QtdCredManut  := StrToInt(Copy(wLinha,88,05));

   LFPagador.VlrLiqGlosas  := StrToFloat(ClienteNumero(Copy(wLinha,93,13)+','+Copy(wLinha,106,2)));
   LFPagador.VlrIRGlosas   := StrToFloat(ClienteNumero(Copy(wLinha,108,13)+','+Copy(wLinha,121,2)));

   LFPagador.QtdGlosas     := StrToInt(Copy(wLinha,123,05));

   WriteLn(wArquivoUltimoGrupo, wLinha ); // Andre Imakawa - SIG 78688

   // Processa Linha
   Exit;
end;




// Processa Footer do Centralizador
procedure TFrmConciliacao.ProcFCentralizador;
begin
   // Desmembra Linha
   LFCentralizador.Identificador := Copy(wLinha,01,01);

   LFCentralizador.QtdRegDet     := StrToInt(Copy(wLinha,13,05));
   LFCentralizador.QtdRegRub     := StrToInt(Copy(wLinha,18,05));

   LFCentralizador.VlrLiqAtrz    := StrToFloat(ClienteNumero(Copy(wLinha,23,15)+','+Copy(wLinha,38,2)));
   LFCentralizador.VlrIRAtrz     := StrToFloat(ClienteNumero(Copy(wLinha,40,15)+','+Copy(wLinha,55,2)));

   LFCentralizador.VlrLiqManut   := StrToFloat(ClienteNumero(Copy(wLinha,57,15)+','+Copy(wLinha,72,2)));
   LFCentralizador.VlrIRManut    := StrToFloat(ClienteNumero(Copy(wLinha,74,15)+','+Copy(wLinha,89,2)));

   LFCentralizador.QtdCredAtrz   := StrToInt(Copy(wLinha,91,05));
   LFCentralizador.QtdCredManut  := StrToInt(Copy(wLinha,96,05));

   LFCentralizador.VlrLiqGlosas  := StrToFloat(ClienteNumero(Copy(wLinha,101,15)+','+Copy(wLinha,116,2)));
   LFCentralizador.VlrIRGlosas   := StrToFloat(ClienteNumero(Copy(wLinha,118,15)+','+Copy(wLinha,133,2)));

   LFCentralizador.QtdGlosas     := StrToInt(Copy(wLinha,135,05));

   // Processa Linha
   Exit;
end;




// Procura Registro a ser Processado
function TFrmConciliacao.EncontraRegistro(NumeroProcesso:String;
                                          DataReferencia:TDate):Boolean;
begin
   Result := True;

   // Preenche Parametros da Consulta
   qryProcuraRegistro.Close;

   qryProcuraRegistro.ParamByName('NUMEROPROCESSO').AsString:=NumeroProcesso;
   qryProcuraRegistro.ParamByName('DATAPAGAMENTO').AsDate   :=DataReferencia;

   qryProcuraRegistro.Open;

   // Caso Não encotre o Registro altera retorno.
   if qryProcuraRegistro.IsEmpty then
   begin
      Result := False;
   end;
end;



procedure TFrmConciliacao.BtResutClick(Sender: TObject);
begin
   inherited;
end;




// Processa Linha do Arquivo Mantenedora
procedure TFrmConciliacao.ProcMantenedora;
begin
   // Desmembra Linha
   LMantenedora.MesReferencia        := Copy(wLinha,01,07);
   LMantenedora.Matricula            := Copy(wLinha,08,15);
   LMantenedora.Nome                 := Copy(wLinha,23,60);
   LMantenedora.DataInicioBeneficio  := Copy(wLinha,83,10);
   LMantenedora.ValorBeneficio       := StrToFloat(ClienteNumero(Copy(wLinha,103,20)));
   LMantenedora.Rubrica              := Trim(Copy(wLinha,123,4));
end;




// Processa Arquivo Mantenedora
procedure TFrmConciliacao.ImportaMantenedora;
var
  wTipoLinha,
  Contador,
  iSequencial,
  i               :Integer;
  Ini:TTime;
  sSQL:String;
  Matricula, CodMantendora : String;
  wArqVazio,
  bGravaLog       :Boolean;

  sIdBeneficio,
  sIdPessoa,
  sCodConcessoINSS,
  sSinonimo,
  sIdRubrica,
  sIdPlanoPrev,
  sValorProvento,
  sNumeroProcesso,
  sMsgErro                            : String;

  dTotalCalc                          : Double;

begin

  dTotalCalc := 0;

  // Testa se Arquivo Especificado Existe
  if not (FileExists(edtArqProc.Text)) then begin
    MsgDlg('O arquivo informado não existe.','Erro',mtError,[mbOK],0);
    edtArqProc.SetFocus;
    Exit;
  end;

  //------------------------------------------------------------------------------
  // Só processa arquivo Mantenedora

  // Tenta Abrir o Arquivo
  try
  // Inicia Transação no Banco
    if not dtmBaseDados.dbBaseDados.InTransaction then
       dtmBaseDados.dbBaseDados.StartTransaction;

    // Seta Arquivo, a Variavel ...
    AssignFile(wArquivoImportacao, edtArqProc.Text);
    // Abre Arquivo para Leitura
    Reset(wArquivoImportacao);
  except
    MsgDlg('Erro ao abrir Arquivo.','Erro',mtError,[mbOK],0);
    Exit;
  end;

  // Testa se Arquivo esta Vazio
  if EOF(wArquivoImportacao) then begin
    MsgDlg('O arquivo informado está VAZIO.','Erro',mtError,[mbOK],0);
    edtArqProc.SetFocus;
    Exit;
  end;

  lblBarraProgresso.Visible  :=True;
  lblBarraProgresso.Update;
  Animate1.Visible:=True;
  Animate1.Active :=True;

  Contador:=0;
  Ini :=Time;
  bGravaLog := False;

  try
  //------------------------------------------------------------------------------
  // Inicia Processamento
    while not EOF(wArquivoImportacao) do begin
      // Lê a Linha
      Readln(wArquivoImportacao,wLinha);
      // Caso Linha vazia pula
      if Trim(wLinha) = '' then Continue;

      // Executa Processamento da linha do arquivo
      Procmantenedora;

      CodMantendora := dblMantenedora.LookupValue;

      // Verifica se a pessoa existe no banco
      if not FazQuery(qryAux,'SELECT IDBENEFICIARIOPP AS IDPESSOA FROM BENEFICIARIOPP WHERE MATRICULA = '+
                          QuotedStr(Trim(LMantenedora.MATRICULA))) then
      begin
           // Achou pelo nome
         if FazQuery(qryAux,'SELECT IDPESSOA FROM ELEGPATRO WHERE MATRICULA = '+
                          QuotedStr(Trim(LMantenedora.MATRICULA))) then
         begin
           sIdPessoa := qryAux.FieldByName('IDPESSOA').AsString;
         end else
         begin
           // não achou - Log de erro.
           sMsgErro := 'Pessoa : '+Trim(LMantenedora.Nome) + ' não localizada!';
           bGravaLog := True;
         end
      end else
      begin
        // achou pela matrícula
        sIdPessoa := qryAux.FieldByName('IDPESSOA').AsString;

      end;


      if not bGravaLog then
      begin
        // Localiza Numeroprocesso
        if FazQuery(qryAux,' SELECT DISTINCT (NUMPROCINSS), IDBENEFICIO FROM BENEFBFPP ' +
                           ' WHERE IDBENEFICIARIOPP = ' + sIdPessoa ) then
        begin
          sNumeroProcesso := qryAux.FieldByName('NUMPROCINSS').AsString;
          SIdBeneficio := qryAux.FieldByName('IDBENEFICIO').AsString;
          end
        else
        begin
          sMsgErro :=  ' Benefício Nº'+Trim(LDetalhe.Especie) +
                       ' Nome : '   + LMantenedora.Nome  +
                       ' Número do Processo não localizado!';
          bGravaLog := True;
        end;
      end;

      // identificar meio de obter o sinonimo oriundo do TXT
      sSinonimo := 'NULL';

      // IDPLANOPREV
      if not bGravaLog then
      begin
        qryaux.SQL.Clear;
        qryaux.SQL.Add(' SELECT IDPLANOPREV FROM PARTPREVPLAN '+
                       ' WHERE  FLGDESATIVADO = 0 ' +
                       '   and  IDPESSOA  = ' + sIdPessoa );
        qryaux.Open;
        if qryAux.IsEmpty then
          sIdPlanoPrev := 'NULL'
        else sIdPlanoPrev := qryAux.fieldByname('IDPLANOPREV').AsString;
      end;


      if not bGravaLog then
      begin
          // IDRUBRICA
          qryaux.SQL.Clear;
          qryaux.SQL.Add( ' SELECT IDRUBRICA  FROM RUBRICAXINSS '+
                          ' WHERE RUBRICAINSS = (SELECT RUBRICAINSS '+
                          ' 			FROM RUBRICAXINSS '+
                          ' 			WHERE IDRUBRICA = (SELECT IDPROVENTO FROM PROVDESC '+
                          ' 					     WHERE CODPROVDESC =  ' + LMantenedora.Rubrica + '))' +
                          ' and FLGRUBCENTRAL = 1 ');
          qryaux.Open;
          if not qryAux.IsEmpty then
            sIdRubrica := qryAux.fieldByname('IDRUBRICA').AsString
          else // Rubrica não cadastrada!
          begin
            sMsgErro :=  ' Nome : '   + LMantenedora.Nome  +
                         ' Rubrica : '+LMantenedora.Rubrica + ' não cadastrada!';
            bGravaLog := True;
          end;
          if not bGravalog then
          begin
            if not(ExisteDetConcINSS(qryAux,sAnoMesRef, sIdPessoa, sIdRubrica)) then
            begin
              sSQL := 'INSERT INTO  DETCONCINSS ( '+
                      '   MESREFERENCIA, NUMPROCINSS, IDBENEFICIO, SEQUENCIAL, IDPLANOPREV, SINONIMO, '+
                      '   IDPESSOA, CODCONCESSORINSS, VALORINSS, CODMANTENEDORINSS, VALORMANT, IDRUBRICA )  '+
                      '   VALUES ('+QuotedStr(sAnoMesRef)                                          +','+
                                    sNumeroProcesso                                                +','+
                                    sIdBeneficio                                                   +','+
                                    '0'                                                            +','+
                                    sIdPlanoPrev                                                   +','+
                                    sSinonimo                                                      +','+
                                    sIdPessoa                                                      +','+
                                    'NULL'                                                         +','+
                                    '0'                                                            +','+
                                    'NULL'                                                         +','+
                                    OraNumero(FloatToStr(LMantenedora.ValorBeneficio))                                      +','+
                                    sIdRubrica                                                     +')';

              if not ExecutarQuery(qryAux,sSQL) then
              begin
                MsgDlg('Erro ao inserir registro na tabela de conciliação.','Erro',mtError,[mbOK],0);
                dtmBaseDados.dbBaseDados.Rollback;
                Exit;
              end;

              dTotalCalc := dTotalCalc + LMantenedora.ValorBeneficio;

              // verifica se é rubrica de provento E o valor é superior a R$ 10
              // caso NEGATIVO NÃO INSERIR NA HSTBENEFBFPP
              if (ERubricaDeProvento(qryAux,sIdRubrica)) and (LMantenedora.ValorBeneficio > 10) then
              begin
                // Verifica se existe na HSTBENEFBFPP
                if ExisteHstBenefbfPP(qryAux, QuotedStr(sAnoMesRef),sNumeroProcesso, sIdbeneficio, sIdPessoa) then
                begin // ATUALIZA

                  sSQL := 'UPDATE  HSTBENEFBFPP SET  ' +
                          ' VALORPAGO  = ' + OraNumero(FloatToStr(LMantenedora.ValorBeneficio)) +
                          'WHERE MESREFERENCIA = ' + QuotedStr(sAnoMesRef) +
                          '  and NUMPROCINSS = ' +  sNumeroProcesso +
                          '  and IDBENEFICIO = ' +  sIdBeneficio +
                          '  and IDBENEFICIARIOPP = ' + sIdPessoa ;

                  if not ExecutarQuery(qryAux,sSQL) then
                  begin
                    MsgDlg('Erro ao atualizar registro na tabela de conciliação. (HSTBENEFBFPP)','Erro',mtError,[mbOK],0);
                    dtmBaseDados.dbBaseDados.Rollback;
                    Exit;
                  end;
                end else
                begin

                  // Inseri na tabela HSTBENEFBFPP

                  sSQL := ' INSERT INTO HSTBENEFBFPP ( ' +
                          '  IDBENEFICIO, IDBENEFICIARIOPP, NUMPROCINSS, DATAPAGAMENTO, ' +
                          '  MESREFERENCIA, VALORPAGO ) VALUES (' +
                            sIdBeneficio                                        +','+
                            sIdPessoa                                           +','+
                            sNumeroProcesso                                     +','+
                            'TO_DATE(SYSDATE,''DD/MM/YYYY'')'                   +','+
                            QuotedStr(sAnoMesRef)                               +','+
                            OraNumero(FloatToStr(LMantenedora.ValorBeneficio))  +')';

                  try
                    ExecutarQuery(qryAux,sSQL)
                  except
                      sMsgErro :=  ' Nome : '   + LMantenedora.Nome  +
                                   ' Erro ao inserir registro na tabela de conciliação.(HSTBENEFBFPP)';
                  end;
                end;
              end; // if ERubricaDeProvento
            end else
            begin
              // Existe na DETCONCINSS
              sSQL := ' UPDATE DETCONCINSS SET '+
                      '  VALORMANT = ' +OraNumero(FloatToStr(LMantenedora.ValorBeneficio)) +
                      ' WHERE MESREFERENCIA = ' + QuotedStr(sAnoMesRef) +
                      '  and  IDPESSOA      = ' + sIdPessoa +
                      '  and  IDRUBRICA     = ' + sIdRubrica;
              if not ExecutarQuery(qryAux,sSQL) then
              begin
                MsgDlg('Erro ao atualizar registro na tabela de conciliação.(DETCONCINSS)','Erro',mtError,[mbOK],0);
                dtmBaseDados.dbBaseDados.Rollback;
                Exit;
              end;
              dTotalCalc := dTotalCalc + LMantenedora.ValorBeneficio;
            end;
          end;
      end else // if not bGravaLog then
      begin
        // grava log de erro
        bGravaLog := False;
      end;

      Inc(Contador);

      if (Contador mod 500) = 0 then
      begin
        dtmBaseDados.dbBaseDados.Commit;
        dtmBaseDados.dbBaseDados.StartTransaction;
      end;
    end;  // while not EOF


    // Atualiza Resultado na Tabela CONCINSS
    ExecutarQuery (qryAux,  'UPDATE CONCINSS SET '+
                            'QTDEBENEFINSS       = '+ IntToStr(Contador)       +','+
                            'VALORTOTINSS        = '+OraNumero(FloatToStrf(dTotalCalc,FFNUMBER,17,2)) +
                            'WHERE MESREFERENCIA = '+ QuotedStr(sAnoMesRef)   );


    try
      if not Sistema.GravaLogOperacoes(Self.Caption) then
        raise exception.Create('Erro ao gravar Log.')
    except
    end;

// Confirma as Alteracoes
    dtmBaseDados.dbBaseDados.Commit;
  finally
// Fecha o Arquivo
    CloseFile(wArquivoImportacao);
  end;

// Desliga Animate
  lblBarraProgresso.Visible  :=False;
  Animate1.Visible:=False;
  Animate1.Active :=False;

// Mostra Tempo da Importação
  Application.ProcessMessages;
  MsgDlg(
// 'Importação OK!' + #13 +

   'Inicio.:   '+TimeToStr(Ini) + #13 +
   'Final .:   '+TimeToStr(Time)+ #13 +
   '             ---------------' + #13 +
   'Tempo .: '+TimeToStr(Time-Ini)+
   '  (Numero de Registros.: '+IntToStr(Contador)+')',

   'Importação OK',MtInformation,[MbOk],0);
end;

//******************************************************************************
// Processa Dados do Prosto Prisma
procedure TFrmConciliacao.ProcessaPrisma;
var
  CodMantenedora, Matricula, sSQL, IdMotivoFolhaBen   :String;
  Ini:TTime;
  Contador : Integer;
begin
   // Liga Animate
   lblBarraProgresso.Visible  := True;
   lblBarraProgresso.Update;
   Animate1.Visible           := True;
   Animate1.Active            := True;

   Contador := 0;
   Ini      := Time;

   // se tiver arquivo selecionado rodar processo a parte
   if trim(edtArqProc.text) <> '' then
   begin
      ImportaFuncef;
      Exit;
   end;

  // Inicia Transação no Banco
  if not dtmBaseDados.dbBaseDados.InTransaction then
     dtmBaseDados.dbBaseDados.StartTransaction;

  try
// Verifica se existe mantenedora marcada como Fundacao
    if not FazQuery(qryAux,'SELECT CODMANTENEDORA FROM CM.MANTENEDORA '+
                           'WHERE FLGFUNDACAO = 1') then
    begin
       MsgDlg('Não existe nenhuma Mantenedora como Fundação. ','Erro ',mtError,[mbOk],0);
       Exit;
    end;

  // Guarda Codigo da Mantenedora
    CodMantenedora := qryAux.FieldByName('CODMANTENEDORA').AsString;

    with qryPrisma do begin

  //  Busca IdMotivo  Tabela PARAMPREV
      FazQuery(qryAux,'SELECT IDMOTIVOFOLHABEN FROM CM.PARAMAPREV');

      IdMotivoFolhaBen := IntToStr(qryAux.FieldByName('IDMOTIVOFOLHABEN').AsInteger);

      Close;
      SQL.Clear;
  // Busca os Dados dos beneficios pagos pela Fundacao
      SQL.Add(' SELECT BF.NUMPROCINSS, BF.NUMEROPROCESSO, BF.IDBENEFICIO, HST.MESREFERENCIA, '+
              '        EL.MATRICULA,    P.NOME,        HST.IDPESSJUR, HST.IDPLANOPREV,  ' +
              '        HST.IDTITULAR,   HST.IDPESSOA,  HST.SEQPROPOSTA, B.CODBENEFSPC,  ' +
              '        NVL(HST.VLBENEFPGTO,0) VLBENEFPGTO, BF.DATAINICIO, BF.DATAFINAL, BF.IDPLANOPREV,    ' +
              '        BP.IDRUBRICA                                                     ' +
              ' FROM  PESSOA P, ELEGPATRO EL, BENEFICIO B, BENEFPLANPREV BP,            ' +
              '       BENEFBFCIARIO BF, HSTBENEFBFCIARIO HST                            ' +
              ' WHERE       HST.MES            = ' + QuotedStr(sAnoMesRef)                +
              '       and   EL.IDPESSOA        = P.IDPESSOA                          ' +
              '       and   BF.IDPESSJUR       = EL.IDPESSJUR                        ' +
              '       and   BF.IDTITULAR       = EL.IDPESSOA                         ' +
              '       and   HST.IDBENEFICIO    = B.IDBENEFICIO                       ' +
              '       and   HST.NUMEROPROCESSO = BF.NUMEROPROCESSO                   ' +
              '       and   HST.IDPESSJUR      = BF.IDPESSJUR                        ' +
              '       and   HST.IDTITULAR      = BF.IDTITULAR                        ' +
              '       and   HST.IDPLANOPREV    = BF.IDPLANOPREV                      ' +
              '       and   HST.IDBENEFICIO    = BF.IDBENEFICIO                      ' +
              '       and   HST.MES            = ' + QuotedStr(sAnoMesRef)             +
              '       and   HST.IDMOTIVO       = ' +IdMotivoFolhaBen                   +
              '       and   HST.NUMEROPROCESSO = BF.NUMEROPROCESSO                   ' +
              '       and   HST.IDPESSOA       = BF.IDPESSOA                         ' +
              '       and   HST.MESREFERENCIA  = ' + QuotedStr(sAnoMesRef)             +
              '       and   BF.IDPLANOPREV     = BP.IDPLANOPREV                      ' +
              '       and   BF.IDBENEFICIO     = BP.IDBENEFICIO                      ' +
              '       and   BP.FLGREFERENCIA   = 1                                   ' +
              '       and   BP.FLGPAGAINSS     = 1                                   ' );

      Open;
      First;
  // Processa ate o final do Arquivo de Beneficios
      while not EOF do begin


// Busca na Tabela do INSS o Beneficio pago ao Segurado
        if FazQuery(qryAux,'SELECT IDPESSOA FROM DETCONCINSS '+
                           ' WHERE IDPESSOA = '+ FieldByName('IDTITULAR').AsString +
                           '   and MESREFERENCIA = ' + QuotedStr(FieldByName('MESREFERENCIA').AsString) +
                           '   and   IDRUBRICA   = ' + FieldByName('IDRUBRICA').AsString +
                           '   and   IDBENEFICIO = ' + FieldByName('IDBENEFICIO').AsString )
        then begin
          if not ExecutarQuery(qryAux,
                'UPDATE DETCONCINSS SET '+
                ' VALORMANT             = '+ OraNumero(FieldByName('VLBENEFPGTO').AsString)+
                ' WHERE IDPESSOA        = '+FieldByname('IDTITULAR').AsString +
                ' and   MESREFERENCIA   = '+ QuotedStr(FieldByName('MESREFERENCIA').AsString) +
                ' and   IDRUBRICA       =  '+ FieldByName('IDRUBRICA').AsString +
                ' and   IDBENEFICIO     = '+ FieldByName('IDBENEFICIO').AsString )
          then begin
            MsgDlg('Erro ao atualizar registro na tabela de conciliação.(DETCONCINSS)','Erro',mtError,[mbOK],0);
            dtmBaseDados.dbBaseDados.Rollback;
            // log de erro!!!
            Exit;
          end;
        end else begin

 // Caso nao encontre Insere registro
            sSQL := 'INSERT INTO  DETCONCINSS ( '+
                    '   MESREFERENCIA, NUMPROCINSS, IDBENEFICIO, SEQUENCIAL, IDPLANOPREV, SINONIMO, '+
                    '   IDPESSOA, CODCONCESSORINSS, VALORINSS, CODMANTENEDORINSS, VALORMANT, IDRUBRICA )  '+
                    '   VALUES ('+QuotedStr(FIeldByName('MESREFERENCIA').AsString)                        +','+
                                  FieldByName('NUMPROCINSS').AsString                                     +','+
                                  FieldByName('IDBENEFICIO').AsString                                     +','+
                                  IntToStr(1)                                                             +','+
                                  FieldByName('IDPLANOPREV').AsString                                     +','+
                                  'NULL'                                                                  +','+
                                  FieldByName('IDTITULAR').AsString                                       +','+
                                  'NULL'                                                                  +','+
                                  'NULL'                                                                  +','+
                                  'NULL'                                                                  +','+
                                  OraNumero(FieldByName('VLBENEFPGTO').AsString)                          +','+
                                  FieldByName('IDRUBRICA').AsString                                       +')';

          if not ExecutarQuery(qryAux,sSQL) then begin
            MsgDlg('Erro ao inserir registro na tabela de conciliação.(DETCONCINSS)','Erro',mtError,[mbOK],0);
            dtmBaseDados.dbBaseDados.Rollback;
            Exit;
          end;
        end;

  // Incrementa Contador
        Inc(Contador);
  // Proximo Registro
        Next;

      end;

    try
      if not Sistema.GravaLogOperacoes(Self.Caption) then
        raise exception.Create('Erro ao gravar Log.')
    except
    end;
      
      dtmBaseDados.dbBaseDados.Commit;
    end;
    except
      Raise;
      dtmBaseDados.dbBaseDados.Rollback;
    end;

    // Desliga Animate
  lblBarraProgresso.Visible  :=False;
  Animate1.Visible:=False;
  Animate1.Active :=False;

// Mostra Tempo da Importação
  Application.ProcessMessages;
  MsgDlg(
// 'Importação OK!' + #13 +

   'Inicio.:   '+TimeToStr(Ini) + #13 +
   'Final .:   '+TimeToStr(Time)+ #13 +
   '             ---------------' + #13 +
   'Tempo .: '+TimeToStr(Time-Ini)+
   '  (Numero de Registros.: '+IntToStr(Contador)+')',

   'Processamento OK',MtInformation,[MbOk],0);
end;



procedure TFrmConciliacao.bbtnCancelarClick(Sender: TObject);
begin
   inherited;

   spnAno.SetFocus;
   spnAno.Value := 2001;

   cboMes.Text := '';
   rdgTipo.ItemIndex := 0;

  if  rdgTipo.ItemIndex = 1 then
   begin
    lblMantenedora.Visible := True;
    dblMantenedora.Visible := True;
    dblMantenedora.LookupField :='';
   end
  else
    begin
    lblMantenedora.Visible := False;
    dblMantenedora.Visible := False;
   end ;
  lblPathArqProc.Visible := True;
  edtArqProc.Visible  := True;
  edtArqProc.Text := '';

  SB1.Visible := True;
end;



procedure TFrmConciliacao.spedExcessaoClick(Sender: TObject);
begin
  inherited;

   if OpenDialog.Execute then
   begin
      edtArqExcecao.Text := UpperCase(OpenDialog.FileName);
   end
   else
   begin
      edtArqExcecao.Text := '';
   end;
end;


procedure TFrmConciliacao.FormActivate(Sender: TObject);
var
  AYear, AMonth, ADay: Word;
begin
  inherited;
  DecodeDate(date, AYear, AMonth, ADay);
  if (AMonth >= 1) and (AMonth <= 12)
  then begin
     cboMes.ItemIndex := AMonth - 1;
     cboMes.Text      := cboMes.Items[cboMes.ItemIndex];
  end;
  spnAno.Text   := IntToStr(AYear);
end;

function TFrmConciliacao.ExisteDetConcINSS(qryAux      : TwwQuery;
                                           psMesAno    : String;
                                           psIdPessoa  : String;
                                           psIdRubrica : String
                                          ): Boolean;
begin
  with qryAux do
  begin
    SQL.Clear;
    SQL.Add( ' SELECT * FROM DETCONCINSS ' +
             ' WHERE MESREFERENCIA = ' + QuotedStr(psMesAno) +
             '  and  IDPESSOA      = ' + psIdPessoa +
             '  and  IDRUBRICA     = ' + psIdRubrica );
    Open;
    Result := not IsEmpty;
  end;
end;



function TFrmConciliacao.ExisteHstBenefbfPP(qryAux           : TwwQuery;
                                            psMesAno          : String;
                                            psNumeroprocesso  : String;
                                            psIdBeneficio     : String;
                                            psIdPessoa        : String
                                           ): Boolean;
begin
  with qryAux do
  begin
    SQL.Clear;
    SQL.Add(' SELECT 1 FROM HSTBENEFBFPP ' +
            ' WHERE MESREFERENCIA       = ' + PsMesAno +
            ' and   NUMPROCINSS         = ' + psNumeroProcesso    +
            ' and   IDBENEFICIO         = ' + psIdBeneficio       +
            ' and   IDBENEFICIARIOPP    = ' + psIdPessoa);
    Open;
    Result := not IsEmpty;
  end;
end;



function TFrmConciliacao.ERubricaDeProvento(qryAUx     : TwwQuery;
                                            pIdRubrica : String
                                           ): Boolean;
begin
   with qryAux do
   begin
      SQL.Clear;
      SQL.Add(' SELECT FLGDESCONTO FROM PROVDESC '+
            ' WHERE IDPROVENTO = ' + pIdRubrica );
      Open;
      Result := FieldByName('FLGDESCONTO').AsInteger = 0;
   end;
end;



procedure TFrmConciliacao.ImportaFuncef;
var
  wTipoLinha,
  Contador,
  iSequencial,
  i               :Integer;
  Ini:TTime;
  sSQL:String;
  Matricula, CodMantendora : String;
  wArqVazio,
  bGravaLog       :Boolean;

  sIdBeneficio,
  sIdPessoa,
  sIdTitular,
  sCodConcessoINSS,
  sSinonimo,
  sIdRubrica,
  sIdPlanoPrev,
  sValorProvento,
  sNumeroProcesso,
  sMsgErro                            : String;

begin
   // importa informações retiradas do legado para efetuar batimento com dados reais.

  try
    if not dtmBaseDados.dbBaseDados.InTransaction then
       dtmBaseDados.dbBaseDados.StartTransaction;

    AssignFile(wArquivoImportacao, edtArqProc.Text);
    Reset(wArquivoImportacao);
  except
    MsgDlg('Erro ao abrir Arquivo.','Erro',mtError,[mbOK],0);
    Exit;
  end;

  // Testa se Arquivo esta Vazio
  if EOF(wArquivoImportacao) then begin
    MsgDlg('O arquivo informado está VAZIO.','Erro',mtError,[mbOK],0);
    edtArqProc.SetFocus;
    Exit;
  end;

  lblBarraProgresso.Visible  :=True;

  lblBarraProgresso.Update;
  Animate1.Visible:=True;
  Animate1.Active :=True;

  Contador:=0;
  Ini :=Time;
  bGravaLog := False;

  try
    while not EOF(wArquivoImportacao) do begin
      Readln(wArquivoImportacao,wLinha);
      if Trim(wLinha) = '' then Continue;

      // Executa Processamento da linha do arquivo
      ProcFuncef;

      // Verifica se a pessoa existe no banco
      if FazQuery(qryAux,'SELECT IDTITULAR, IDPESSOA FROM DEPENTIT WHERE MATRICULA = '''+
                        Trim(LMantenedora.Matricula)+'''') then
      begin
        sIdPessoa := qryAux.FieldByName('IDPESSOA').AsString;
        sIdTitular := qryAux.FieldByName('IDTITULAR').AsString;
      end else
      begin
           // não achou - Log de erro.
           sMsgErro := 'Matrícula : '+Trim(LMantenedora.Matricula) + ' não localizada!';
           bGravaLog := True;
      end;

      // IDBENEFICIO
      if not bGravaLog then
      begin
        qryaux.SQL.Clear;
        qryaux.SQL.Add(' SELECT IDBENEFICIO FROM BENEFICIO '+
                       ' WHERE CODBENEFICIO = '+ IntToStr(LMantenedora.CodigoBeneficio));
        qryaux.Open;
        if not qryaux.IsEmpty then
          sIdBeneficio := qryAux.fieldByname('IDBENEFICIO').AsString
        else
        begin
          sMsgErro :=  ' Matrícula : '   + LMantenedora.Matricula  +
                       ' Benefício Nº : '+IntToStr(LMantenedora.CodigoBeneficio) + ' não localizado!';
          bGravaLog := True;
        end;
      end;

      if not bGravaLog then
        // Localiza Numeroprocesso
          sNumeroProcesso := LMantenedora.NumeroBeneficio;

      // identificar meio de obter o sinonimo oriundo do TXT
      sSinonimo := 'NULL';

      // IDPLANOPREV
      if not bGravaLog then
      begin
        qryaux.SQL.Clear;
        qryaux.SQL.Add(' SELECT IDPLANOPREV FROM PARTPREVPLAN '+
                       ' WHERE  FLGDESATIVADO = 0 ' +
                       '   and  IDPESSOA  = ' + sIdPessoa );
        qryaux.Open;
        if qryAux.IsEmpty then
          sIdPlanoPrev := 'NULL'
        else sIdPlanoPrev := qryAux.fieldByname('IDPLANOPREV').AsString;
      end;

      if not bGravaLog then
      begin
          // IDRUBRICA
          qryaux.SQL.Clear;
          qryaux.SQL.Add( ' SELECT IDRUBRICA  FROM RUBRICAXINSS '+
                          ' WHERE RUBRICAINSS = (SELECT RUBRICAINSS '+
                          ' 			FROM RUBRICAXINSS '+
                          ' 			WHERE IDRUBRICA = (SELECT IDPROVENTO FROM PROVDESC '+
                          ' 					     WHERE CODPROVDESC =  ' + trim(LMantenedora.Rubrica) + ')) '+
                          ' and FLGRUBCENTRAL = 1 ');

          qryaux.Open;
          if not qryAux.IsEmpty then
            sIdRubrica := qryAux.fieldByname('IDRUBRICA').AsString
          else // Rubrica não cadastrada!
          begin
            sMsgErro :=  ' Matricula : '   + LMantenedora.Matricula  +
                         ' Rubrica : '+LMantenedora.Rubrica + ' não cadastrada!';
            bGravaLog := True;
          end;

          if not ExisteDetConcINSS(qryAux,sAnoMesRef,sIdPessoa,sIdRubrica) then
          begin

            sSQL := 'INSERT INTO  DETCONCINSS ( '+
                    '   MESREFERENCIA, NUMPROCINSS, IDBENEFICIO, SEQUENCIAL, IDPLANOPREV, SINONIMO, '+
                    '   IDPESSOA, CODCONCESSORINSS, VALORINSS, CODMANTENEDORINSS, VALORMANT, IDRUBRICA )  '+
                    '   VALUES ('+QuotedStr(sAnoMesRef)                                          +','+
                                  sNumeroProcesso                                                +','+
                                  sIdBeneficio                                                   +','+
                                  '0'                                                            +','+
                                  sIdPlanoPrev                                                   +','+
                                  sSinonimo                                                      +','+
                                  sIdPessoa                                                      +','+
                                  'NULL'                                                         +','+
                                  '0'                                                            +','+
                                  'NULL'                                                         +','+
                                  OraNumero(FloatToStr(LMantenedora.ValorBeneficio))                                      +','+
                                  sIdRubrica                                                     +')';

            if not ExecutarQuery(qryAux,sSQL) then
            begin
              MsgDlg('Erro ao inserir registro na tabela de conciliação.','Erro',mtError,[mbOK],0);
              dtmBaseDados.dbBaseDados.Rollback;
              Exit;
            end;
          end else
          begin
            // Existe na DETCONCINSS
            sSQL := ' UPDATE DETCONCINSS SET '+
                    '  VALORMANT = ' +OraNumero(FloatToStr(LMantenedora.ValorBeneficio)) +
                    ' WHERE MESREFERENCIA = ' + QuotedStr(sAnoMesRef) +
                    '  and  IDPESSOA      = ' + sIdPessoa +
                    '  and  IDRUBRICA     = ' + sIdRubrica;
            if not ExecutarQuery(qryAux,sSQL) then
            begin
              MsgDlg('Erro ao atualizar registro na tabela de conciliação.','Erro',mtError,[mbOK],0);
              dtmBaseDados.dbBaseDados.Rollback;
              Exit;
            end;
          end;
      end else // if not bGravaLog then
      begin
        bGravaLog := False;
      end;
      Inc(Contador);
      if (Contador mod 500) = 0 then
      begin
        dtmBaseDados.dbBaseDados.Commit;
        dtmBaseDados.dbBaseDados.StartTransaction;
      end;

    end;  // while not EOF

    try
      if not Sistema.GravaLogOperacoes(Self.Caption) then
        raise exception.Create('Erro ao gravar Log.')
    except
    end;
    
    // Confirma as Alteracoes
    dtmBaseDados.dbBaseDados.Commit;
  finally
    // Fecha o Arquivo
    CloseFile(wArquivoImportacao);
  end;

  // Desliga Animate
  lblBarraProgresso.Visible  :=False;
  Animate1.Visible:=False;
  Animate1.Active :=False;

  // Mostra Tempo da Importação
  Application.ProcessMessages;
  MsgDlg(
   'Inicio.:   '+TimeToStr(Ini) + #13 +
   'Final .:   '+TimeToStr(Time)+ #13 +
   '             ---------------' + #13 +
   'Tempo .: '+TimeToStr(Time-Ini)+
   '  (Numero de Registros.: '+IntToStr(Contador)+')',

   'Importação OK',MtInformation,[MbOk],0);

end;

procedure TFrmConciliacao.ProcFuncef;
begin
   // Desmembra Linha
   LMantenedora.MesReferencia    := sAnoMesRef;
   LMantenedora.Matricula        := Copy(wLinha,2,7);
   LMantenedora.NumeroBeneficio  := Trim(Copy(wLinha,49,10));
   LMantenedora.CodigoBeneficio  := StrToInt(Trim(Copy(wLinha,59,2)));
   LMantenedora.ValorBeneficio   := StrToFloat(ClienteNumero(Copy(wLinha,65,12)))/100;
   LMantenedora.Rubrica          := Trim(Copy(wLinha,61,4));
end;



function TFrmConciliacao.VerificaFLGAtivo: Boolean;
  // ==>
  function MontaQuery(pqryAux: TwwQuery; Indice: Integer): Boolean;
  var
    sSQL: String;
  begin
    sSQL := 'INSERT INTO  DETCONCINSS ( '+
            '   MESREFERENCIA, MESCOBRANCA, NUMPROCINSS, IDBENEFICIO, SEQUENCIAL, IDPLANOPREV, SINONIMO, '+
            '   IDPESSOA, CODCONCESSORINSS, VALORINSS, CODMANTENEDORINSS, IDRUBRICA, FLGATIVO )  '+
            '   VALUES ('+QuotedStr(LDetalhe.MesReferencia)                      +','+
                          QuotedStr(LDetalhe.MesCobranca)                        +','+
                          pqryAux.FieldByName('NUMPROCINSS').AsString            +','+
                          pqryAux.FieldByName('IDBENEFICIO').AsString            +','+
                          '0'                                                    +','+
                          pqryAux.FieldByName('IDPLANOPREV').AsString            +','+
                          pqryAux.FieldByName('SINONIMO').AsString               +','+
                          pqryAux.FieldByName('IDPESSOA').AsString               +','+
                          pqryAux.FieldByName('CODCONCESSORINSS').AsString       +','+
                          OraNumero(FloatToStr(aRubricaINSS[Indice].Valor))      +','+
                          pqryAux.FieldByName('CODCONCESSORINSS').AsString       +','+
                          pqryAux.FieldByName('IDRUBRICA').AsString              +','+
                          '1)';
    pqryAux.SQL.Clear;
    pqryAux.SQL.Add(sSQL);
    try
      pqryAux.ExecSQL;
      Result := True;
    except
      Result := False;
    end;
  end;
  // <==
begin
  // Verifica se o partipante é ATIVO mas possui Sal. Maternidade ou Aux. Doença Prev.
  // através do FLGATIVO = 1 no mês anterior ao processado.

  // Testar com as 4 rubricas que vem no arquivo.
  qryAux.SQL.Clear;
  qryAux.SQL.Add (  ' SELECT  D.IDRUBRICA, D.NUMPROCINSS, D.IDPESSOA, ' +
                    '         D.IDBENEFICIO, D.CODCONCESSORINSS, ' +
                    ' 	      D.CODMANTENEDORINSS, D.SEQUENCIAL, D.IDPLANOPREV, ' +
                    '         D.SINONIMO ' +
                    ' FROM DETCONCINSS D, RUBRICAXINSS RXI, BENEFICIO B ' +
//                    ' WHERE MESCOBRANCA = ' + QuotedStr(SAnoMesAnterior(LDetalhe.MesCobranca)) + //Everson TIBERO
                    ' WHERE D.MESCOBRANCA = ' + QuotedStr(SAnoMesAnterior(LDetalhe.MesCobranca)) + //Everson TIBERO
                    '   and RXI.IDRUBRICA = D.IDRUBRICA ' +
                    '   and B.CODBENEFICIO = ' + LDetalhe.Especie +
                    '   and RXI.RUBRICAINSS = ' + LDetalhe.CodRubCred1 +
                    '   and B.IDBENEFICIO = D.IDBENEFICIO ' +
                    '   and D.FLGATIVO = 1 ');
  qryAux.Open;

  if qryAux.IsEmpty then
  begin //1
    qryAux.SQL.Clear;
    qryAux.SQL.Add (  ' SELECT  D.IDRUBRICA, D.NUMPROCINSS, D.IDPESSOA, ' +
                      '         D.IDBENEFICIO, D.CODCONCESSORINSS, ' +
                      ' 	      D.CODMANTENEDORINSS, D.SEQUENCIAL, D.IDPLANOPREV ' +
                      ' FROM DETCONCINSS D, RUBRICAXINSS RXI, BENEFICIO B ' +
//                      ' WHERE MESCOBRANCA = ' + QuotedStr(SAnoMesAnterior(LDetalhe.MesCobranca)) + //Everson TIBERO
                      ' WHERE D.MESCOBRANCA = ' + QuotedStr(SAnoMesAnterior(LDetalhe.MesCobranca)) + //Everson TIBERO
                      '   and RXI.IDRUBRICA = D.IDRUBRICA ' +
                      '   and B.CODBENEFICIO = ' + LDetalhe.Especie +
                      '   and RXI.RUBRICAINSS = ' + LDetalhe.CodRubCred2 +
                      '   and B.IDBENEFICIO = D.IDBENEFICIO ' +
                      '   and D.FLGATIVO = 1 ');
    qryAux.Open;
    if qryAux.IsEmpty then
    begin //2
      qryAux.SQL.Clear;
      qryAux.SQL.Add (  ' SELECT  D.IDRUBRICA, D.NUMPROCINSS, D.IDPESSOA, ' +
                        '         D.IDBENEFICIO, D.CODCONCESSORINSS, ' +
                        ' 	      D.CODMANTENEDORINSS, D.SEQUENCIAL, D.IDPLANOPREV ' +
                        ' FROM DETCONCINSS D, RUBRICAXINSS RXI, BENEFICIO B ' +
//                        ' WHERE MESCOBRANCA = ' + QuotedStr(SAnoMesAnterior(LDetalhe.MesCobranca)) + //Everson TIBERO
                        ' WHERE D.MESCOBRANCA = ' + QuotedStr(SAnoMesAnterior(LDetalhe.MesCobranca)) + //Everson TIBERO
                        '   and RXI.IDRUBRICA = D.IDRUBRICA ' +
                        '   and B.CODBENEFICIO = ' + LDetalhe.Especie +
                        '   and RXI.RUBRICAINSS = ' + LDetalhe.CodRubCred3 +
                        '   and B.IDBENEFICIO = D.IDBENEFICIO ' +
                        '   and D.FLGATIVO = 1 ');
      qryAux.Open;
      if qryAux.IsEmpty then
      begin //3
        qryAux.SQL.Clear;
        qryAux.SQL.Add (  ' SELECT  D.IDRUBRICA, D.NUMPROCINSS, D.IDPESSOA, ' +
                          '         D.IDBENEFICIO, D.CODCONCESSORINSS, ' +
                          ' 	      D.CODMANTENEDORINSS, D.SEQUENCIAL, D.IDPLANOPREV ' +
                          ' FROM DETCONCINSS D, RUBRICAXINSS RXI, BENEFICIO B ' +
//                          ' WHERE MESCOBRANCA = ' + QuotedStr(SAnoMesAnterior(LDetalhe.MesCobranca)) + //Everson TIBERO
                          ' WHERE D.MESCOBRANCA = ' + QuotedStr(SAnoMesAnterior(LDetalhe.MesCobranca)) + //Everson TIBERO
                          '   and RXI.IDRUBRICA = D.IDRUBRICA ' +
                          '   and B.CODBENEFICIO = ' + LDetalhe.Especie +
                          '   and RXI.RUBRICAINSS = ' + LDetalhe.CodRubCred4 +
                          '   and B.IDBENEFICIO = D.IDBENEFICIO ' +
                          '   and D.FLGATIVO = 1 ');
        qryAux.Open;
        if qryAux.IsEmpty then
        begin //4
          // NÃO ENCONTROU!
        end else //4
        begin
          // ENCONTROU!
          Result := MontaQuery(qryAux,4);
        end
        // ENCONTROU!
      end else // 3
      begin
        // ENCONTROU!
        Result := MontaQuery(qryAux,3);
      end
    end else //2
    begin
      // ENCONTROU!
      Result := MontaQuery(qryAux,2);
    end
  end else //1
  begin
    // ENCONTROU!
    Result := MontaQuery(qryAux,1);
  end;
end;



procedure TFrmConciliacao.TrocaPlanoContabil(sIdPessoa: String; var sIdPlanoPrev : String);
var
  qryAuxTrocaP : TwwQuery;
begin
  qryAuxTrocaP := TwwQuery.Create(Application);
  qryAuxTrocaP.DatabaseName := 'BaseDados';
  qryAuxTrocaP.Close;
  qryAuxTrocaP.SQL.Clear;
  qryAuxTrocaP.SQL.Add (  ' SELECT IDPARAM FROM PESSOAPARAM ' +
                    ' WHERE IDPESSOA = ' + sIdPessoa + ' and ' +
                    '       IDPARAM  =1 and VALOR = ' + QuotedStr('S') );
  qryAuxTrocaP.Open;
  if not qryAuxTrocaP.IsEmpty then begin
     if (sIdPlanoPrev = '66') and (qryAuxTrocaP.FieldByName('IDPARAM').AsInteger = 1)then
        sIdPlanoPrev := '1';
     if (sIdPlanoPrev = '2')  and (qryAuxTrocaP.FieldByName('IDPARAM').AsInteger = 1) then
        sIdPlanoPrev := '22';
  end;
  if sIdPlanoPrev = '66' then begin
     qryAuxTrocaP.Close;
     qryAuxTrocaP.SQL.Clear;
     qryAuxTrocaP.SQL.Add (  ' SELECT IDPARAM FROM PESSOAPARAM ' +
                       ' WHERE IDPESSOA = ' + sIdPessoa + ' and ' +
                       '       IDPARAM  = 9 and VALOR = ' + QuotedStr('S') );
     qryAuxTrocaP.Open;
     if qryAuxTrocaP.IsEmpty then
        sIdPlanoPrev := '25';
  end;
  qryAuxTrocaP.Close;
  qryAuxTrocaP.Free;
end;



function TFrmConciliacao.GravaDetConcINSS(sIdPlanoPrev      : String;
                                          sMatricula        : String;
                                          sNome             : String;
                                          sIdPessoa         : String;
                                          sIdTitular        : String;
                                          sDIB              : String;
                                          wTipoLinha        : String;
                                          sCodMantenedora   : String;
                                          sIdBeneficio      : String;
                                          sIdPlanoPrevPrev  : String
                                         ): Boolean;  
var
   i, j         : Integer;
   iSequencial  : Integer;
   iQuantRateio : Integer;
   sCodRub      : String;
   sSQL         : String;
   sIdRubrica   : String;
   vRubrica     : Double;
   fTotalRateio : Currency;
   fVlrRestante : Currency;
   fVlrLanc     : Currency;
   fFatorRateio : Currency;
   bRateioPlano : Boolean;
   bSemRateio   : Boolean;
begin
   //--------------------------------------------------------------------------------------------

   bRateioPlano := False;
   if (sIdPessoa <> '') and (sIdTitular <> '') then
   begin
      bRateioPlano := cdsHRS.Locate('IDPESSOA;IDTITULAR', VarArrayOf([sIdPessoa, sIdTitular]), []);
   end;

   //--------------------------------------------------------------------------------------------

   Result := True;

   // gravar as 4 rubricas do arquivo
   for i := 0 to 8 do
   begin
      iSequencial := (i + 10) * StrToInt(LDetalhe.Sequencia);

      qryaux.SQL.Clear;
      qryaux.SQL.Add('SELECT IDRUBRICA, FLGRATEIOPLANO FROM RUBRICAXINSS WHERE RUBRICAINSS = ');

      if wTipoLinha = '3' then
      begin
         try
         sCodRub  := aRubricaINSS[i].CodRubrica;
         vRubrica := aRubricaINSS[i].Valor;
         except
           sCodRub  := '0';
           vRubrica := 0;
         end
      end
      else
      begin
         sCodRub  := aRubGrupoTipo4[i].CodRubrica;
         vRubrica := aRubGrupoTipo4[i].Valor;
      end;

      if sCodRub = '' then sCodRub := '0';
      qryAux.SQL.Add(sCodRub);

      if (vRubrica > 0) and (sCodRub <> '0') then
      begin
         qryAux.Open;
         if not(qryAux.IsEmpty) then
         begin
            sIdRubrica := qryAux.FieldByName('IDRUBRICA').AsString;

            bSemRateio := False;

            if (qryAux.FieldByName('FLGRATEIOPLANO').AsInteger = 0) or not(bRateioPlano) then
            begin
               bSemRateio := True;
            end
            else  // if (qryAux.FieldByName('FLGRATEIOPLANO').AsInteger = 0) or not(bRateioPlano)
            begin
               //-----------------------------------------------------------------------------------
               // Aqui é preciso efetivamente calcular o percentual de rateio por plano

               // 1º - Abre a query
               with qryHRSPessoa do
               begin
                  LimpaParametros(qryHRSPessoa);
                  ParamByName('PMESCOBRANCA').AsString   := sAnoMesRef;
                  ParamByName('PIDPESSOA').AsString      := sIdPessoa;
                  ParamByName('PIDTITULAR').AsString     := sIdTitular;
                  Open;
               end;

               if not(qryHRSPessoa.IsEmpty) then
               begin
                  iQuantRateio := qryHRSPessoa.RecordCount;

                  // -------------------------------------------------------------------------------
                  // 2º - Verifica o total para poder posteriormente comparar com os registros
                  fTotalRateio := 0;

                  qryHRSPessoa.First;
                  while not(qryHRSPessoa.EOF) do
                  begin
                     fTotalRateio := fTotalRateio + qryHRSPessoaVALOR.AsCurrency;
                     qryHRSPessoa.Next;
                  end;

                  // -------------------------------------------------------------------------------
                  // 3º - Calcula e insere os valores rateados por plano
                  fVlrRestante := vRubrica;
                  j            := 0;

                  qryHRSPessoa.First;
                  while not(qryHRSPessoa.EOF) do
                  begin
                     inc(j);
                     iSequencial  := (i + 10) * StrToInt(LDetalhe.Sequencia) * j;
                     sIdPlanoPrev := qryHRSPessoaIDPLANOCONTABIL.AsString;

                     // ----------------------------------------------------------------------------
                     // Cálculo do rateio aqui
                     // ----------------------------------------------------------------------------
                     if j = qryHRSPessoa.RecordCount then
                     begin
                        fVlrLanc       := fVlrRestante;
                     end
                     else
                     begin
                        fFatorRateio   := qryHRSPessoaVALOR.AsCurrency / fTotalRateio;
                        fVlrLanc       := ArredondaValor((vRubrica * fFatorRateio), 2);
                     end;
                     // ----------------------------------------------------------------------------



                     // ----------------------------------------------------------------------------
                     // insert detconcinss
                     // ----------------------------------------------------------------------------
                     with qryInsertDetConc do
                     begin
                        Limpaparametros(qryInsertDetConc);
                        ParamByName('PMESREFERENCIA').AsString          := LDetalhe.MesReferencia;
                        ParamByName('PMESCOBRANCA').AsString            := sAnoMesRef;
                        ParamByName('PNUMPROCINSS').AsString            := LDetalhe.NumeroBeneficio;

                        if (sIdBeneficio <> '') and (sIdBeneficio <> 'NULL') then
                           ParamByName('PIDBENEFICIO').AsString         := sIdBeneficio;

                        ParamByName('PSEQUENCIAL').AsInteger            :=
                          PegaSequencial(
                            sIdPessoa,
                            sAnoMesRef,
                            LDetalhe.NumeroBeneficio);

                        ParamByName('PIDPLANOPREV').AsString            := sIdPlanoPrev;

                        if (sIdPessoa <> '') and (sIdPessoa <> 'NULL') then
                           ParamByName('PIDPESSOA').AsString            := sIdPessoa;

                        ParamByName('PCODCONCESSORINSS').AsString       := LDetalhe.OrgaoConcessor;
                        ParamByName('PVALORINSS').AsCurrency            := fVlrLanc;
                        ParamByName('PCODMANTENEDORINSS').AsString      := LDetalhe.OrgaoMantenedor;
                        ParamByName('PIDRUBRICA').AsString              := sIdRubrica;
                        ParamByName('PRUBRICAINSS').AsString            := sCodRub;

                        if (sCodMantenedora <> '') and (sCodMantenedora <> 'NULL') then
                           ParamByName('PCODMANTENEDORA').AsString      := sCodMantenedora;

                        if (sMatricula <> '') and (sMatricula <> 'NULL') then
                           ParamByName('PMATRICULA').AsString           := sMatricula;

                        ParamByName('PRMREAJ').AsCurrency               := LDetalhe.VlrMensReaj;
                        ParamByName('PAPREAJ').AsCurrency               := LDetalhe.VlrAposReaj;
                        ParamByName('PESPECIE').AsString                := LDetalhe.Especie;

                        //BRUNO AZEVEDO SOL 131786 KINTANA 753272
                        if sDIB <> '' then begin
                          if (StrToDate(sDIB) > 0) then begin
                            ParamByName('PDIB').AsDate                   := StrToDate(sDIB);
                          end else begin
                            ParamByName('PDIB').Clear;
                          end;
                        end;
                        //BRUNO AZEVEDO SOL 131786 KINTANA 753272

                        ParamByName('PFLGMANUAL').AsInteger             := 0;

                        if (sIdPlanoPrevPrev <> '') and (sIdPlanoPrevPrev <> 'NULL') then
                           ParamByName('PIDPLANOPREVPREV').AsString     := sIdPlanoPrevPrev;


                        //Renato Visoni SOL 123118 Kintana 612606
                        ParamByName('pCODSINONIMO').AsString    := sCODSINONIMO;
                        ParamByName('pDTINICIOCRED').AsString   := QuotedStr(sDTINICIOCRED);
                        ParamByName('pDTFIMCRED').AsString      := QuotedStr(sDTFIMCRED);
                        //Renato Visoni SOL 123118 Kintana 612606

                        try
                           ExecSQL;
                        except
                           on E:Exception do
                           begin
                              WriteLn(wArquivoExcecao, ' Erro Gravação DETCONCINSS ');
                              WriteLn(wArquivoExcecao, ' Mensagem de Erro          --> '+ E.Message );
                           end;
                        end;
                     end;  // with qryInsertDetConc
                     // ----------------------------------------------------------------------------
                     // ----------------------------------------------------------------------------

                     fVlrRestante := fVlrRestante - fVlrLanc;

                     qryHRSPessoa.Next;
                  end;  // while not(qryHRSPessoa.EOF)

                  // -------------------------------------------------------------------------------
               end
               else  // if not(qryHRSPessoa.IsEmpty)
               begin
                  // Vai gravar exatamente como se não houvesse rateio
                  bSemRateio := True;
               end;  // if not(qryHRSPessoa.IsEmpty)

               //-----------------------------------------------------------------------------------
            end;  // if (qryAux.FieldByName('FLGRATEIOPLANO').AsInteger = 0) or not(bRateioPlano)

            // -------------------------------------------------------------------------------------
            // insert detconcinss
            // -------------------------------------------------------------------------------------
            if bSemRateio then
            begin
               with qryInsertDetConc do
               begin
                  Limpaparametros(qryInsertDetConc);
                  ParamByName('PMESREFERENCIA').AsString          := LDetalhe.MesReferencia;
                  ParamByName('PMESCOBRANCA').AsString            := sAnoMesRef;
                  ParamByName('PNUMPROCINSS').AsString            := LDetalhe.NumeroBeneficio;

                  if (sIdBeneficio <> '') and (sIdBeneficio <> 'NULL') then
                     ParamByName('PIDBENEFICIO').AsString         := sIdBeneficio;

                  ParamByName('PSEQUENCIAL').AsInteger            :=
                    PegaSequencial(
                      sIdPessoa,
                      sAnoMesRef,
                      LDetalhe.NumeroBeneficio); 

                  if (sIdPlanoPrev <> '') and (sIdPlanoPrev <> 'NULL') then
                     ParamByName('PIDPLANOPREV').AsString         := sIdPlanoPrev;

                  if (sIdPessoa <> '') and (sIdPessoa <> 'NULL') then                                   
                     ParamByName('PIDPESSOA').AsString            := sIdPessoa;         

                  ParamByName('PCODCONCESSORINSS').AsString       := LDetalhe.OrgaoConcessor;
                  ParamByName('PVALORINSS').AsCurrency            := vRubrica;
                  ParamByName('PCODMANTENEDORINSS').AsString      := LDetalhe.OrgaoMantenedor;
                  ParamByName('PIDRUBRICA').AsString              := sIdRubrica;
                  ParamByName('PRUBRICAINSS').AsString            := sCodRub;

                  if (sCodMantenedora <> '') and (sCodMantenedora <> 'NULL') then
                     ParamByName('PCODMANTENEDORA').AsString      := sCodMantenedora;

                  if (sMatricula <> '') and (sMatricula <> 'NULL') then
                     ParamByName('PMATRICULA').AsString           := sMatricula;

                  ParamByName('PRMREAJ').AsCurrency               := LDetalhe.VlrMensReaj;
                  ParamByName('PAPREAJ').AsCurrency               := LDetalhe.VlrAposReaj;
                  ParamByName('PESPECIE').AsString                := LDetalhe.Especie;

                  //BRUNO AZEVEDO SOL 131786 KINTANA 753272
                  if sDIB <> '' then begin
                    if (StrToDate(sDIB) > 0) then begin
                      ParamByName('PDIB').AsDate                   := StrToDate(sDIB);
                    end else begin
                      ParamByName('PDIB').Clear;
                    end;
                  end;
                  //BRUNO AZEVEDO SOL 131786 KINTANA 753272

                  ParamByName('PFLGMANUAL').AsInteger             := 0;

                  //Renato Visoni SOL 123118 Kintana 612606
                  ParamByName('pCODSINONIMO').AsString    := sCODSINONIMO;
                  ParamByName('pDTINICIOCRED').AsString   := sDTINICIOCRED;
                  ParamByName('pDTFIMCRED').AsString      := sDTFIMCRED;
                  //Renato Visoni SOL 123118 Kintana 612606

                  if (sIdPlanoPrevPrev <> '') and (sIdPlanoPrevPrev <> 'NULL') then
                     ParamByName('PIDPLANOPREVPREV').AsString     := sIdPlanoPrevPrev;

                  try
                     ExecSQL;
                  except
                     on E:Exception do
                     begin
                        WriteLn(wArquivoExcecao, ' Erro Gravação DETCONCINSS ');
                        WriteLn(wArquivoExcecao, ' Mensagem de Erro          --> '+ E.Message );
                     end;
                  end;  // try..except
               end;  // with qryInsertDetConc
            end;  // if bSemRateio
            // -------------------------------------------------------------------------------------
            // -------------------------------------------------------------------------------------
         end
         else // Rubrica não cadastrada!
         begin                                                                                  
            WriteLn(wArquivoExcecao, ' Nº Benefício : '+ LDetalhe.NumeroBeneficio +
                    ' Rubrica : ' + sCodRub + ' não associada' );

            GravaTempConcINSSrubrica(sCodRub, vRubrica, 'NB OK! Rubrica não cadastrada');
         end;  // if not(qryAux.IsEmpty)
      end;  // if vRubrica > 0
   end;  // for i := 0 to 3
end;



function TFrmConciliacao.GravaTempConcINSS(wTipoLinha : String) : Boolean;
var
  i, iSequencial : Integer;
  sCodRub, sSQL, sIdRubrica  : String;
  vRubrica : Double;
begin
  Result := True;

  for i := 0 to 8 do 
  begin   // gravar as 4 rubricas do arquivo
    iSequencial := (i+1) * StrtoInt(LDetalhe.Sequencia);
    qryaux.Close;
    qryaux.SQL.Clear;
    qryaux.SQL.Add(' SELECT IDRUBRICA FROM RUBRICAXINSS WHERE RUBRICAINSS = ');

    if wTipoLinha = '3' then
    begin
      try
      sCodRub  := aRubricaINSS[i].CodRubrica;
      vRubrica := aRubricaINSS[i].Valor;
      except
        sCodRub  := '0';
        vRubrica := 0;
      end
    end
    else
    begin
      sCodRub  := aRubGrupoTipo4[i].CodRubrica;
      vRubrica := aRubGrupoTipo4[i].Valor;
    end;

    if sCodRub = '' then sCodRub := '0';  
    qryAux.SQL.Add(sCodRub);              

    if (vRubrica > 0) and (sCodRub <> '0') then 
    begin
       qryaux.Open;
       if qryAux.IsEmpty then
          WriteLn(wArquivoExcecao,' Nº Benefício : '+ LDetalhe.NumeroBeneficio +
                       ' Rubrica : '+ sCodRub + ' não associada' );

       GravaTempConcINSSrubrica(sCodRub,vRubrica,'NB não localizado');
    end;
  end;
end;



function TFrmConciliacao.GravaTempConcINSSRubrica(sCodRub    : String;
                                                  vRubrica   : Double;
                                                  sMotivo    : String
                                                 ): Boolean;
var
   sSQL : String;
begin
   sSQL :=
   'INSERT INTO  TEMPCONCINSS ( ' +
   '  MESPROCESSAMENTO, MESREFERENCIA, NUMPROCINSS, ESPECIE, CODCONCESSORINSS, ' +
   '  CODMANTENEDORINSS, NOME, MOTIVO, CODRUBRICA1, VLRRUBRICA1, ' +
   '  DATALEITURA, RMREAJ, APREAJ, FLGMANUAL '+
   '  , CODSINONIMO, DTINICIOCRED, DTFIMCRED '; //Renato Visoni SOL 123118 Kintana 612606
   //BRUNO AZEVEDO SOL 131786 KINTANA 753272
   if (Trim(LDetalhe.DataInicio) <> '') then begin
     if (StrToDate(DateToStr(Trunc(StrToInt(LDetalhe.DataInicio)))) > 0) then begin
       sSQL := sSQL + ', DIB ';
     end;
   end;
   sSQL := sSQL + '  ) VALUES ( '        +
   //BRUNO AZEVEDO SOL 131786 KINTANA 753272

   QuotedStr(sAnoMesRef)                           + ',' +
   QuotedStr(LDetalhe.MesReferencia)               + ',' +
   QuotedStr(LDetalhe.NumeroBeneficio)             + ',' +
   LDetalhe.Especie                                + ',' +
   LDetalhe.OrgaoConcessor                         + ',' +
   LDetalhe.OrgaoMantenedor                        + ',' +
   QuotedStr(trim(LDetalhe.NomeRecebedor))         + ',' +
   QuotedStr(trim(sMotivo))         + ',' +
   sCodRub + ',' + OraNumero(FloatToStr(vRubrica)) + ',' +
   'SYSDATE, ' +
   OraNumero(FloattoStr(LDetalhe.VlrMensReaj)) + ',' +
   OraNumero(FloattoStr(LDetalhe.VlrAposReaj)) + ', 0 ' +

   //Renato Visoni SOL 123118 Kintana 612606
   ', ' + sCODSINONIMO +
   ', TO_DATE(' + QuotedStr(sDTINICIOCRED) + ',' + QuotedStr('yymmdd') + ')' +
   ', TO_DATE(' + QuotedStr(sDTFIMCRED) + ',' + QuotedStr('yymmdd') + ')';
   //Renato Visoni SOL 123118 Kintana 612606

   //BRUNO AZEVEDO SOL 131786 KINTANA 753272
   if (Trim(LDetalhe.DataInicio) <> '') then begin
     if (StrToDate(DateToStr(Trunc(StrToInt(LDetalhe.DataInicio)))) > 0) then begin
       sSQL := sSQL + ', TO_DATE(' + QuotedStr(LDetalhe.DataInicio) + ',' + QuotedStr('yymmdd') + '))' ;
     end else begin
       sSQL := sSQL + ')';
     end;
   end else begin
     sSQL := sSQL + ')';
   end;
   //BRUNO AZEVEDO SOL 131786 KINTANA 753272

   with qryAux do
   begin
      Close;
      SQL.Clear;
      SQL.Add(sSQL);

      try
         ExecSQL;
      except
         WriteLn(wArquivoExcecao, 'Erro Gravação TEMPCONCINSS --> ' + sSQL );
      end; // try
   end;
end;



procedure TFrmConciliacao.LimpaParametros(const qry: TwwQuery);
var
   i: integer;
begin
   // fecha a query p/ evitar problemas
   qry.Close;

   // prepara a query se já não estiver preparada
   if not(qry.Prepared) then qry.Prepare;

   // zera os parâmetros
   for i := 0 to (qry.ParamCount - 1) do
   begin
      qry.Params[i].Bound := False;
      qry.Params[i].Clear;
      qry.Params[i].Bound := True;
   end;
end;




function TFrmConciliacao.PegaSequencial(const psIDPessoa    : string;
                                        const psMesCobranca : string;
                                        psnumprocinss : string 
                                       ): Integer;
begin
  with qrySequencial do
  begin
    LimpaParametros(qrySequencial);
    ParamByName('PIDPESSOA').AsString      := psIDPessoa;
    ParamByName('PMESCOBRANCA').AsString   := psMesCobranca;
    ParamByName('PNUMPROCINSS').AsString   := psNumProcINSS;

    Open;
    Result := qrySequencialSEQUENCIAL.AsInteger + 1;
    Close;
  end;
end;



procedure TFrmConciliacao.FormCreate(Sender: TObject);
begin
  inherited;
  //Jéssica Lana Nunes dos Santos SOL 109421 KINTANA 496332
  OpenDialog.InitialDir:= Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa);
end;

//BRUNO AZEVEDO SOL 137572 KINTANA 961108
procedure TFrmConciliacao.btnValidarArquivoClick(Sender: TObject);
var
  FArquivoValidacao: TextFile;
  FArquivoResultVal: TextFile;
  sLinha, sNumeroBeneficio, sEspecie, sNomeRecebedor, sCpf, sIdSitBeneficio, sBuffer, sTipoRubrica, sRubrica, sIdPlanoPrev, sIdPlanoPrevContabil, sValor: String;
  xPendConcessao, xEncerrados, xRetidos, xSemBenef, xRubricas: TStringList;
  i, iTipoLinha, iContador: Integer;
  xQryDados: TwwQuery;
begin
  inherited;
  if (Trim(cboMes.Text) = '') or (Trim(spnAno.Text) = '') then begin
    MsgDlg('É necessário selecionar o mês e ano para validação do arquivo.', 'Folha de Benefícios', mtWarning, [mbOk], 0);
    cboMes.SetFocus;
    Exit;
  end;

  try
    xPendConcessao := TStringList.Create();
    xEncerrados    := TStringList.Create();
    xRetidos       := TStringList.Create();
    xSemBenef      := TStringList.Create();
    xRubricas      := TStringList.Create();

    xQryDados := TwwQuery.Create(Self);
    xQryDados.DataBaseName := 'BaseDados';

    AssignFile(FArquivoValidacao, edtArqProc.Text);
    Reset(FArquivoValidacao);

    AssignFile(FArquivoResultVal, Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\CONCILIACAOINSS_'+FormatDateTime('ddmmyyyy',Date())+'.txt');
    Rewrite(FArquivoResultVal);

    WriteLn(FArquivoResultVal, 'RESULTADO DA VALIDAÇÃO DO ARQUIVO DO INSS:');
    WriteLn(FArquivoResultVal, '');

    lblBarraProgresso.Visible  := True;
    lblBarraProgresso.Update;
    iContador := 0;
    while not(Eof(FArquivoValidacao)) do begin
      Application.ProcessMessages();
      iContador := iContador + 1;
      lblBarraProgresso.Caption := 'Validando Arquivo... ' + IntToStr(iContador);

      Readln(FArquivoValidacao, sLinha);

      if (Trim(sLinha) = '') then begin
        Continue;
      end;

      iTipoLinha := StrToInt(Copy(sLinha,1,1));
      //DETALHE
      if (iTipoLinha = 3) then begin
        sNumeroBeneficio := Copy(sLinha,  02, 10);
        sEspecie         := Copy(sLinha,  24, 02);
        sNomeRecebedor   := Copy(sLinha, 130, 27);
        sTipoRubrica     := Copy(sLinha,  42, 01);
        
        xQryDados.Close;
        xQryDados.Sql.Clear();
        xQryDados.Sql.Add(MontaQryBeneficio(sNumeroBeneficio,sEspecie));
        xQryDados.Open;

        sIdPlanoPrev         := xQryDados.FieldByName('IDPLANOPREV').AsString;
        sIdPlanoPrevContabil := xQryDados.FieldByName('IDPLANPREVCONTAB').AsString;
        sIdSitBeneficio      := xQryDados.FieldByName('IDSITBENEFICIO').AsString;
        if not(xQryDados.IsEmpty) then begin
          sCpf := Formata(CarregaCPF(sNomeRecebedor, xQryDados), 14);
          sValor := sCpf + ' ' + sNomeRecebedor + ' ' + sNumeroBeneficio + ' ' + sEspecie + ' ' + CarregaPlanoPrev(sIdPlanoPrev, xQryDados) + ' ' + CarregaPlanoPrevContabil(sIdPlanoPrevContabil, xQryDados);
          if (sIdSitBeneficio <> '1') then begin
            if (sIdSitBeneficio = '4') then begin
              if (xPendConcessao.IndexOf(sValor) = -1) then begin
                xPendConcessao.Add(sValor);
              end;
            end else if (sIdSitBeneficio = '3') then begin
              if (xPendConcessao.IndexOf(sValor) = -1) then begin
                xPendConcessao.Add(sValor);
              end;
            end else if (sIdSitBeneficio = '2') then begin
              if (xRetidos.IndexOf(sValor) = -1) then begin
                xRetidos.Add(sValor);
              end;
            end;
          end;
        end else begin
          sCpf := Formata(CarregaCPF(sNomeRecebedor, xQryDados), 14);
          sValor := sCpf + ' ' + sNomeRecebedor + ' ' + sNumeroBeneficio + ' ' + sEspecie + ' ' + CarregaPlanoPrev(sIdPlanoPrev, xQryDados) + ' ' + CarregaPlanoPrevContabil(sIdPlanoPrevContabil, xQryDados);
          if (xSemBenef.IndexOf(sValor) = -1) then begin
            xSemBenef.Add(sValor);
          end;
        end;

        for i := 0 to 3 do begin
          case i of
            0: sRubrica := sTipoRubrica + Copy(sLinha,  74, 03);
            1: sRubrica := sTipoRubrica + Copy(sLinha,  88, 03);
            2: sRubrica := sTipoRubrica + Copy(sLinha, 102, 03);
            3: sRubrica := sTipoRubrica + Copy(sLinha, 116, 03);
          end;

          if (xRubricas.IndexOf(sRubrica) = -1) then begin
            xQryDados.Close;
            xQryDados.Sql.Clear();
            xQryDados.Sql.Add(MontaQryRubrica(sRubrica));
            xQryDados.Open;
            if (xQryDados.IsEmpty) then begin
              xRubricas.Add(sRubrica);
            end;
          end;
        end;
      //RUBRICA (CONTINUAÇÃO DO DETALHE ANTERIOR)
      end else if (iTipoLinha = 4) then begin
        for i := 0 to 8 do begin
          case i of
            0: sRubrica := sTipoRubrica + Copy(sLinha,  25, 03);
            1: sRubrica := sTipoRubrica + Copy(sLinha,  39, 03);
            2: sRubrica := sTipoRubrica + Copy(sLinha,  53, 03);
            3: sRubrica := sTipoRubrica + Copy(sLinha,  67, 03);
            4: sRubrica := sTipoRubrica + Copy(sLinha,  81, 03);
            5: sRubrica := sTipoRubrica + Copy(sLinha,  95, 03);
            6: sRubrica := sTipoRubrica + Copy(sLinha, 109, 03);
            7: sRubrica := sTipoRubrica + Copy(sLinha, 123, 03);
            8: sRubrica := sTipoRubrica + Copy(sLinha, 137, 03);
          end;

          if (xRubricas.IndexOf(sRubrica) = -1) then begin
            xQryDados.Close;
            xQryDados.Sql.Clear();
            xQryDados.Sql.Add(MontaQryRubrica(sRubrica));
            xQryDados.Open;
            if (xQryDados.IsEmpty) then begin
              xRubricas.Add(sRubrica);
            end;
          end;
        end;
      end;
    end;
    
    WriteLn(FArquivoResultVal, '1 - Participantes e/ou pensionistas que estão com os benefícios pendentes de concessão:');
    for i := 0 to xPendConcessao.Count - 1 do begin
      WriteLn(FArquivoResultVal, xPendConcessao[i]);
    end;
    WriteLn(FArquivoResultVal, '');

    WriteLn(FArquivoResultVal, '2 - Participantes e/ou pensionistas que estão com os benefícios encerrados:');
    for i := 0 to xEncerrados.Count - 1 do begin
      WriteLn(FArquivoResultVal, xEncerrados[i]);
    end;
    WriteLn(FArquivoResultVal, '');

    WriteLn(FArquivoResultVal, '3 - Participantes e/ou pensionistas que estão com os benefícios retidos:');
    for i := 0 to xRetidos.Count - 1 do begin
      WriteLn(FArquivoResultVal, xRetidos[i]);
    end;
    WriteLn(FArquivoResultVal, '');

    WriteLn(FArquivoResultVal, '4 - Participantes e/ou pensionistas que não possuem benefícios:');
    for i := 0 to xSemBenef.Count - 1 do begin
      WriteLn(FArquivoResultVal, xSemBenef[i]);
    end;
    WriteLn(FArquivoResultVal, '');

    WriteLn(FArquivoResultVal, '5 - Rubrica que não existe nas estruturas de dados:');
    for i := 0 to xRubricas.Count - 1 do begin
      WriteLn(FArquivoResultVal, xRubricas[i]);
    end;

    WriteLn(FArquivoResultVal, '');
    WriteLn(FArquivoResultVal, 'OBSERVAÇÃO: VERIFIQUE AS CRÍTICAS ANTES DA IMPORTAÇÃO DO ARQUIVO.');

    lblBarraProgresso.Visible  := False;
    lblBarraProgresso.Caption  := 'Aguarde ... ';
  finally
    CloseFile(FArquivoValidacao);
    CloseFile(FArquivoResultVal);
    FreeAndNil(xPendConcessao);
    FreeAndNil(xEncerrados);
    FreeAndNil(xRetidos);
    FreeAndNil(xSemBenef);
    FreeAndNil(xRubricas);
    FreeAndNil(xQryDados);
  end;                           

  MsgDlg('Validação Finalizada.', 'Folha de Benefícios', mtInformation, [mbOk], 0);

  sBuffer := Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\CONCILIACAOINSS_'+FormatDateTime('ddmmyyyy',Date())+'.txt';
  ShellExecute(Application.Handle, nil, PChar(sBuffer), nil, nil, SW_SHOWNORMAL);
end;
//BRUNO AZEVEDO SOL 137572 KINTANA 961108

//BRUNO AZEVEDO SOL 137572 KINTANA 961108
function TFrmConciliacao.MontaQryBeneficio(pNumeroBeneficio, pEspecie: String): String;
begin
  Result :=
  'SELECT BF.IDSITBENEFICIO, '+
  '       BF.IDPESSJUR, '+
  '       BF.IDPLANOPREV, '+
  '       PI.IDPLANPREVCONTAB, '+
  '       BF.IDPESSOA, '+
  '       BF.IDTITULAR, '+
  '       DP.MATRICULA AS MATRICDEPEN, '+
  '       NVL(EL.MATRICULA, DP.MATRICULA) AS MATRICULA '+
  '  FROM BENEFBFCIARIO BF, '+
  '       ELEGPATRO     EL, '+
  '       BENEFICIO     BEN, '+
  '       DEPENTIT      DP, '+
  '       BENEFPLANPREV BFP, '+
  '       PERFILINVEST  PI '+
  ' WHERE BF.NUMPROCINSS = '+ QuotedStr(pNumeroBeneficio) +
  '   AND BF.IDSITBENEFICIO <= 4 '+
  '   AND BEN.CODBENEFICIO = '+ pEspecie +
  '   AND EL.IDPESSJUR(+) = BF.IDPESSJUR '+
  '   AND EL.IDPESSOA(+) = BF.IDPESSOA '+
  '   AND DP.IDTITULAR = BF.IDTITULAR '+
  '   AND DP.IDPESSOA = BF.IDPESSOA '+
  '   and PI.IDPERFILINVEST = BF.IDPERFILINVEST '+
  '   AND BEN.IDBENEFICIO = BF.IDBENEFICIO '+
  '   AND BF.IDBENEFICIO = BFP.IDBENEFICIO(+) '+
  '   AND BF.IDPLANOPREV = BFP.IDPLANOPREV(+) '+
  '   AND BFP.FLGREFERENCIA = 1 '+
  ' ORDER BY BF.IDSITBENEFICIO ';
end;
//BRUNO AZEVEDO SOL 137572 KINTANA 961108

//BRUNO AZEVEDO SOL 137572 KINTANA 961108
function TFrmConciliacao.MontaQryRubrica(pRubrica: String): String;
begin
  Result :=
  'SELECT IDRUBRICA FROM RUBRICAXINSS '+
  ' WHERE RUBRICAINSS = ' + pRubrica;
end;
//BRUNO AZEVEDO SOL 137572 KINTANA 961108

//BRUNO AZEVEDO SOL 137572 KINTANA 961108
function TFrmConciliacao.CarregaCPF(pNomeRecebedor: String; pQry: TwwQuery): String;
begin
  pQry.Close;
  pQry.Sql.Clear();
  pQry.Sql.Add('SELECT NUMDOCUMENTO FROM PESSOA');
  pQry.Sql.Add(' WHERE NOME = ' + QuotedStr(Trim(pNomeRecebedor)));
  pQry.Open;
  if not(pQry.IsEmpty) then begin
    Result := pQry.FieldByName('NUMDOCUMENTO').AsString;
  end;
end;
//BRUNO AZEVEDO SOL 137572 KINTANA 961108

//BRUNO AZEVEDO SOL 137572 KINTANA 961108
function TFrmConciliacao.CarregaPlanoPrev(pIdPlanoPrev: String; pQry: TwwQuery): String;
begin
  pQry.Close;
  pQry.Sql.Clear();
  pQry.Sql.Add('SELECT NOME FROM PLANPREV');
  pQry.Sql.Add(' WHERE IDPLANOPREV = ' + QuotedStr(Trim(pIdPlanoPrev)));
  pQry.Open;
  if not(pQry.IsEmpty) then begin
    Result := pQry.FieldByName('NOME').AsString;
  end;
end;
//BRUNO AZEVEDO SOL 137572 KINTANA 961108

//BRUNO AZEVEDO SOL 137572 KINTANA 961108
function TFrmConciliacao.CarregaPlanoPrevContabil(pIdPlanoPrevContab: String; pQry: TwwQuery): String;
begin
  pQry.Close;
  pQry.Sql.Clear();
  pQry.Sql.Add('SELECT NOME FROM PLANPREVCONTABIL');
  pQry.Sql.Add(' WHERE IDPLANOPREV = ' + QuotedStr(Trim(pIdPlanoPrevContab)));
  pQry.Open;
  if not(pQry.IsEmpty) then begin
    Result := pQry.FieldByName('NOME').AsString;
  end;
end;

function TFrmConciliacao.Formata(const I: String; const Casas: byte): string;
var
  Ch: String;
begin
  Result := (I);
  Ch := ' ';
  while Length(Result) < Casas do begin
    Result := Ch + Result;
  end;
end;
//BRUNO AZEVEDO SOL 137572 KINTANA 961108


//Fanuel Marinho SOL163044 Kintana  - Inicio
procedure TFrmConciliacao.habilitaBeneficio(sIdBenef : String);
var
qryHistBenef : TwwQuery;
sIdBenefHist, sParamFolha : String;
begin

   qryHistBenef := TwwQuery.Create(nil);
   qryHistBenef.DataBaseName := 'BASEDADOS';
   qryHistBenef.Close;
   qryHistBenef.SQL.Clear;
   //qryHistBenef.SQL.Add(' SELECT NVL(MAX(IDHISTBENEFHABILITA),0) + 1 AS PROXID FROM HISTBENEFHABILITA ');  // SOL 229355 KTN 2063462
   qryHistBenef.SQL.Add(' SELECT SEQHSTBFHABIDHSTBFHAB.nextval AS PROXID FROM DUAL '); // SOL 229355 KTN 2063462
   qryHistBenef.Open;
   sIdBenefHist := qryHistBenef.FieldByName('PROXID').AsString;

   sParamFolha := getParamFolhaHistBenef;

   qryHistBenef.Close;
   qryHistBenef.SQL.Clear;
   qryHistBenef.SQL.Add(
   ' INSERT INTO HISTBENEFHABILITA (IDBENEFHABILITA , IDHISTBENEFHABILITA , DATAREGISTRO ,  IDSITHABILITACAO ,' +
   ' OBSERVACAO,DATAREFERENCIA ) VALUES ( '+sIdBenef+ ', '+sIdBenefHist+', TO_CHAR(SYSDATE,'+#39+'DD/MM/YYYY'+#39+') ,'+sParamFolha+' ,'+
   //' '' Habilitação do benefício feita através da importação do arquivo do INSS'','+#39+'01/'+cboMes.text+'/'+spnAno.text+#39+' )' );///douglas.siqueira163044  // Andre Imakawa - SIG 83696
   ' '' Habilitação do benefício feita através da importação do arquivo do INSS'','+#39+'01/'+FormatFloat('00', cboMes.ItemIndex + 1)+'/'+spnAno.text+#39+' )' ); // Andre Imakawa - SIG 83696
   qryHistBenef.ExecSQL;

   {qryHistBenef.Close;
   qryHistBenef.SQL.Clear;
   qryHistBenef.SQL.Add(
    ' UPDATE BENEFHABILITA  SET  FLGCONCESSAO = 1, FLGREQUERIMENTO = 1 '+
    ' WHERE IDBENEFHABILITA = '+sIdBenef);
   qryHistBenef.ExecSQL;}


end;

function TFrmConciliacao.getParamFolhaHistBenef: String;
var
qryParamFolha : TwwQuery;
sParam : String;
begin

   qryParamFolha := TwwQuery.Create(nil);
   qryParamFolha.DataBaseName := 'BASEDADOS';
   qryParamFolha.Close;
   qryParamFolha.SQL.Clear;
   qryParamFolha.SQL.Add('SELECT VALORPARAM FROM PARAMFOLHA WHERE NOMEPARAM = ''SITUACAOHABILITACAOINSS'' ');
   qryParamFolha.Open;
   sParam := qryParamFolha.FieldByName('VALORPARAM').AsString;
   qryParamFolha.Close;
   FreeAndNil(qryParamFolha);
   result := sParam;

end;


procedure TFrmConciliacao.getPlanoPartPrevPlan(sIdPessoa: String; var sIdPlanoPrevPrev, sIdPlanoPrev, sCodMantenedora : String);///douglas.siqueira163044
var
qryPlanoPatro : TwwQuery;
begin

   {
   //qryPlanoPatro.SQL.Add('SELECT IDPLANOPREV FROM PARTPREVPLAN WHERE IDPESSOA ='+sIdPessoa+'  AND FLGDESATIVADO = 0');
   qryPlanoPatro.Open;

   if qryPlanoPatro.IsEmpty then
   begin
      qryPlanoPatro.SQL.Clear;
      qryPlanoPatro.SQL.Add('SELECT IDPLANOPREV FROM PARTPREVPLAN WHERE IDPESSOA ='+sIdPessoa+' AND IDSITPLANOPREV IN (25,26,27,28,29)');
      qryPlanoPatro.Open;
      sIdPlanoPrevPrev := qryPlanoPatro.FieldByName('IDPLANOPREV').AsString;

   end
   else
   begin
      sIdPlanoPrevPrev := qryPlanoPatro.FieldByName('IDPLANOPREV').AsString;
   end;                                                                          

   if sIdPlanoPrevPrev <> '' then
   begin
      qryPlanoPatro.SQL.Clear;
      qryPlanoPatro.SQL.Add(' SELECT IDPLANOPREV FROM PLANPREVCONTABIL WHERE IDPLANOPREVPREV = '+sIdPlanoPrevPrev);
      qryPlanoPatro.Open;
      sIdPlanoPrev := qryPlanoPatro.FieldByName('IDPLANOPREV').AsString;
   end;  }


   qryPlanoPatro := TwwQuery.Create(nil);
   qryPlanoPatro.DataBaseName := 'BASEDADOS';
   qryPlanoPatro.Close;
   qryPlanoPatro.SQL.Clear;
   qryPlanoPatro.SQL.Add(
   ////////////////////////////////////////////////////////////////////////////////////////////
   ' SELECT D.IDPESSOA, D.IDTITULAR, P.NOME, P.NUMDOCUMENTO, PF.DATANASC,       ' +
   '    decode(D.MATRICULA,DT.MATRICULA, '' '',D.MATRICULA) MATRICULADEP, DT.MATRICULA AS MATRICULATITULAR,  ' +
   '    (SELECT nvl(bf.idplanoprev,PP.IDPLANOPREV)                            ' +
   '      FROM PARTPREVPLAN PP                                                ' +
   '          LEFT JOIN benefbfciario bf ON pp.idpessoa = bf.idtitular AND    ' +
   '                                        bf.idpessoa = '+sIdPessoa+' AND   ' +
   '                                        BF.IDTPPAGTOBENEFIC = 1 AND       ' +
   '                                        BF.FONTEPAGADORA = 1 AND          ' +
   '                                        BF.IDSITBENEFICIO = 1 AND         ' +
   '                                        (BF.IDPLANPREVCONTAB = 28 OR      ' +
   '                                         (BF.IDPLANPREVCONTAB <> 28 AND   ' +
   '                                          NOT EXISTS (SELECT 1            ' +
   '                                                      FROM BENEFBFCIARIO BF1                   ' +
   '                                                      WHERE BF1.IDTPPAGTOBENEFIC = 1 AND       ' +
   '                                                            BF1.FONTEPAGADORA = 1 AND          ' +
   '                                                            BF1.IDPLANPREVCONTAB = 28 AND      ' +
   '                                                            BF1.IDSITBENEFICIO = 1 AND         ' +
   '                                                            BF1.IDTITULAR = BF.IDTITULAR AND   ' +
   '                                                            BF1.IDPESSOA = BF.IDPESSOA)))      ' +
   '     WHERE PP.IDPESSOA = D.IDTITULAR AND                                       ' +
   '           (pp.idsitplanoprev IN (25,26,27,28,29) OR                           ' +
   '           (pp.idsitplanoprev NOT IN (25,26,27,28,29) AND                      ' +
   '            pp.flgdesativado = 0 AND                                           ' +
   '            NOT EXISTS (SELECT 1                                               ' +
   '                        FROM partprevplan ppp1                                 ' +
   '                        WHERE ppp1.idpessoa = pp.idpessoa                      ' +
   '                          AND ppp1.idsitplanoprev IN (25,26,27,28,29)))) AND   ' +
   '            rownum = 1) IDPLANOPREV,                                           ' +
   '    (SELECT nvl(bf.Idplanprevcontab,decode(pp.idsitplanoprev,25,28,26,28,27,28,28,28,29,28,PP.IDPLANOPREV))  ' +
   '     FROM PARTPREVPLAN PP                                                                     ' +
   '          LEFT JOIN benefbfciario bf ON pp.idpessoa = bf.idtitular  AND                       ' +
   '                                        bf.idpessoa = '+sIdPessoa+' AND                       ' +
   '                                        BF.IDTPPAGTOBENEFIC = 1 AND                           ' +
   '                                        BF.FONTEPAGADORA = 1 AND                              ' +
   '                                        BF.IDSITBENEFICIO = 1 AND                             ' +
   '                                        (BF.IDPLANPREVCONTAB = 28 OR                          ' +
   '                                         (BF.IDPLANPREVCONTAB <> 28 AND                       ' +
   '                                          NOT EXISTS (SELECT 1                                ' +
   '                                                      FROM BENEFBFCIARIO BF1                  ' +
   '                                                      WHERE BF1.IDTPPAGTOBENEFIC = 1 AND      ' +
   '                                                            BF1.FONTEPAGADORA = 1 AND         ' +
   '                                                            BF1.IDPLANPREVCONTAB = 28 AND     ' +
   '                                                            BF1.IDSITBENEFICIO = 1 AND        ' +
   '                                                            BF1.IDTITULAR = BF.IDTITULAR AND  ' +
   '                                                            BF1.IDPESSOA = BF.IDPESSOA)))     ' +
   '     WHERE PP.IDPESSOA = D.IDTITULAR AND                   ' +
   '           (pp.idsitplanoprev IN (25,26,27,28,29) OR       ' +
   '           (pp.idsitplanoprev NOT IN (25,26,27,28,29) AND  ' +
   '            pp.flgdesativado = 0 AND                       ' +
   '            NOT EXISTS (SELECT 1                           ' +
   '                        FROM partprevplan ppp1             ' +
   '                        WHERE ppp1.idpessoa = pp.idpessoa  ' +
   '                          AND ppp1.idsitplanoprev IN (25,26,27,28,29)))) AND  ' +
   '            rownum = 1) IDPLANPREVCONTAB,      ' +
//dgs CODMANTENEDORA

   '(SELECT PP.flgdesativado  ' +
   '      FROM PARTPREVPLAN PP  ' +
   '      LEFT JOIN benefbfciario bf  ' +
   '        ON pp.idpessoa = bf.idtitular  ' +
   '       AND bf.idpessoa = '+sIdPessoa+' '+
   '       AND BF.IDTPPAGTOBENEFIC = 1  ' +
   '       AND BF.FONTEPAGADORA = 1  ' +
   '       AND BF.IDSITBENEFICIO = 1  ' +
   '       AND (BF.IDPLANPREVCONTAB = 28 OR  ' +
   '           (BF.IDPLANPREVCONTAB <> 28 AND NOT EXISTS  ' +
   '            (SELECT 1  ' +
   '                FROM BENEFBFCIARIO BF1  ' +
   '               WHERE BF1.IDTPPAGTOBENEFIC = 1  ' +
   '                 AND BF1.FONTEPAGADORA = 1  ' +
   '                 AND BF1.IDPLANPREVCONTAB = 28  ' +
   '                 AND BF1.IDSITBENEFICIO = 1  ' +
   '                 AND BF1.IDTITULAR = BF.IDTITULAR ' +
   '                 AND BF1.IDPESSOA = BF.IDPESSOA)))  ' +
   '     WHERE PP.IDPESSOA = D.IDTITULAR  ' +
   '       AND (pp.idsitplanoprev IN (25, 26, 27, 28, 29) OR  ' +
   '           (pp.idsitplanoprev NOT IN (25, 26, 27, 28, 29) AND  ' +
   '           pp.flgdesativado = 0 AND NOT EXISTS  ' +
   '            (SELECT 1  ' +
   '                FROM partprevplan ppp1  ' +
   '               WHERE ppp1.idpessoa = pp.idpessoa  ' +
   '                 AND ppp1.idsitplanoprev IN (25, 26, 27, 28, 29))))  ' +
   '       AND rownum = 1) flgdesativado,  ' +

//dgs

   '    (SELECT (SELECT PPC.NOME                   ' +
   '             FROM PLANPREVCONTABIL PPC         ' +
   '             WHERE PPC.IDPLANOPREV = nvl(bf.Idplanprevcontab,decode(pp.idsitplanoprev,25,28,26,28,27,28,28,28,29,28,PP.IDPLANOPREV))) ' +
   '     FROM PARTPREVPLAN PP                                                  ' +
   '          LEFT JOIN benefbfciario bf ON pp.idpessoa = bf.idtitular  AND    ' +
   '                                        bf.idpessoa = '+sIdPessoa+' AND    ' +
   '                                        BF.IDTPPAGTOBENEFIC = 1 AND        ' +
   '                                        BF.FONTEPAGADORA = 1 AND           ' +
   '                                        BF.IDSITBENEFICIO = 1 AND          ' +
   '                                        (BF.IDPLANPREVCONTAB = 28 OR       ' +
   '                                         (BF.IDPLANPREVCONTAB <> 28 AND    ' +
   '                                          NOT EXISTS (SELECT 1             ' +
   '                                                      FROM BENEFBFCIARIO BF1                     ' +
   '                                                      WHERE BF1.IDTPPAGTOBENEFIC = 1 AND         ' +
   '                                                            BF1.FONTEPAGADORA = 1 AND            ' +
   '                                                            BF1.IDPLANPREVCONTAB = 28 AND        ' +
   '                                                            BF1.IDSITBENEFICIO = 1 AND           ' +
   '                                                            BF1.IDTITULAR = BF.IDTITULAR AND     ' +
   '                                                            BF1.IDPESSOA = BF.IDPESSOA)))        ' +
   '     WHERE PP.IDPESSOA = D.IDTITULAR AND    ' +
   '           (pp.idsitplanoprev IN (25,26,27,28,29) OR  ' +
   '           (pp.idsitplanoprev NOT IN (25,26,27,28,29) AND ' +
   '            pp.flgdesativado = 0 AND   ' +
   '            NOT EXISTS (SELECT 1   ' +
   '                        FROM partprevplan ppp1   ' +
   '                        WHERE ppp1.idpessoa = pp.idpessoa  ' +
   '                          AND ppp1.idsitplanoprev IN (25,26,27,28,29)))) AND  ' +
   '            rownum = 1) DESCRICAOPLANOCONTABIL  ' +
   '  FROM DEPENTIT D     ' +
   '  JOIN PESSOA P ON D.IDPESSOA = P.IDPESSOA   ' +
   '  JOIN PESSOAFISICA PF ON D.IDPESSOA = PF.IDPESSOA   ' +
   '  JOIN DEPENTIT DT ON D.IDTITULAR = DT.IDPESSOA AND  ' +
   '                      D.IDTITULAR = DT.IDTITULAR   ' +
   '    WHERE D.IDPESSOA  = '+sIdPessoa+'  ' +
   '     and D.IDTITULAR  = '+sIdPessoa+'  ' );
   ///////////////////////////////////////////////////////////////////////////////////////////
   qryPlanoPatro.Open;
   if trim(sIdPlanoPrevPrev)= '' then
      sIdPlanoPrevPrev := qryPlanoPatro.FieldByName('IDPLANOPREV').AsString;

   if trim(sIdPlanoPrev)='' then
      sIdPlanoPrev     := qryPlanoPatro.FieldByName('IDPLANPREVCONTAB').AsString;
///douglas.siqueira SOL163044
if trim(sCodMantenedora)= '' then
   begin
   if (qryPlanoPatro.FieldByName('flgdesativado').AsString = '0') or (qryPlanoPatro.FieldByName('flgdesativado').IsNull) then
       sCodMantenedora :='14';
   end;

///douglas.siqueira SOL163044   

   qryPlanoPatro.Close;
   FreeAndNil(qryPlanoPatro);
end;
//Fanuel Marinho SOL163044 Kintana  - Fim


procedure TFrmConciliacao.DeleteHistBenefHabilita(sIdBenef : String);
var
qryDeleteHistBenef : TwwQuery;
begin

   qryDeleteHistBenef := TwwQuery.Create(nil);
   qryDeleteHistBenef.DataBaseName := 'BASEDADOS';
   qryDeleteHistBenef.Close;
   qryDeleteHistBenef.SQL.Clear;
   qryDeleteHistBenef.SQL.Add(' DELETE FROM HISTBENEFHABILITA  ');
   qryDeleteHistBenef.SQL.Add(' WHERE TO_CHAR(DATAREFERENCIA, ''YYYY/MM'') = '+QuotedStr(sAnoMesRef)+' ');///douglas.siqueira163044
//   qryDeleteHistBenef.SQL.Add(' WHERE TO_CHAR(DATAREGISTRO, ''YYYY/MM'') = '+QuotedStr(sAnoMesRef)+' ');
   qryDeleteHistBenef.SQL.Add('   AND IDSITHABILITACAO = '+getParamFolhaHistBenef+' ');
   qryDeleteHistBenef.SQL.Add('   AND IDBENEFHABILITA IN        ');
   qryDeleteHistBenef.SQL.Add('    (SELECT DISTINCT IDBENEFHABILITA  ');
   qryDeleteHistBenef.SQL.Add('       FROM BENEFHABILITA             ');
   qryDeleteHistBenef.SQL.Add('      WHERE NUMBENEFICIO = '+QuotedStr(sIdBenef)+' ) ');

   qryDeleteHistBenef.ExecSQL;
   FreeAndNil(qryDeleteHistBenef);

end;

function TFrmConciliacao.getTitular(sIdPessoa: String): String; ///douglas.siqueira163044
var
qryTitular : TwwQuery;
begin

qryTitular := TwwQuery.Create(nil);
qryTitular.DataBaseName := 'BASEDADOS';
qryTitular.Close;
qryTitular.SQL.Clear;
qryTitular.SQL.Append('SELECT IDTITULAR FROM DEPENTIT ');
qryTitular.SQL.Append('WHERE IDPESSOA = '+#39+sIdPessoa+#39);
qryTitular.Open;

IF not  qryTitular.IsEmpty then
   result:=qryTitular.fieldbyname('IDTITULAR').AsString
else
   result:=sIdPessoa;

qryTitular.Close;
FreeAndNil(qryTitular);

end;

end.
