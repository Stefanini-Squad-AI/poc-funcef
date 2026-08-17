//*******************************************************************************************************
//N. Sol..........: 177621/8961
//N. Kintana......: 1629308
//Data............: 02/04/2012
//Responsável.....: Paulo Nobre
//Descrição.......: Acerto na função "VerificaExistenciaContrato" para colocar o nome da tabela certa
//*******************************************************************************************************
//N. Sol..........: 171022
//N. Kintana......: 1528923
//Data............: 26/12/2011
//Responsável.....: Paulo Nobre
//Descrição.......: Refeita a lógica da Função VerificaCorretoras
//******************************************************************************
//N. Sol..........: 170766
//N. Kintana......: 1522260
//Data............: 16/11/2011
//Responsável.....: Paulo Nobre
//Descrição.......: Incluso um campo/qry para mostrar a data da última atualização
//*******************************************************************************************************
//N. Sol..........: 170566
//N. Kintana......: 1519133
//Data............: 14/11/2011
//Responsável.....: Paulo Nobre
//Descrição.......: Implementação de uma nova função para a identificação do saldo atual (soma do campo VLRJUROSIMPORTA).
//                  Agora, o ajuste será baseado na soma aritmética dos valores importados e não mais
//                  sobre o campo SLDJUROSIMPORTA.
//*******************************************************************************************************
//Rotina..........: FImportaEmpAcoes
//N. Sol..........: 164140
//N. Kintana......: 1407348
//Data............: 30/08/2011
//Responsável.....: Paulo Nobre
//Descrição.......: Acerto na rotina de Buscar o Saldo
//*******************************************************************************************************
//Rotina..........: FImportaEmpAcoes
//N. Sol..........: 162187
//N. Kintana......: 1376428
//Data............: 28/07/2011
//Responsável.....: Paulo Nobre
//Descrição.......: Implementado:
//	            > Inclusão de função para evitar a importação de Reversão e juros (5,3,2 ou 6 e 7)
//                    no mesmo dia e mesmo contrato
//*******************************************************************************************************
//Rotina..........: FImportaEmpAcoes
//N. Sol..........: 161791
//N. Kintana......: 1369052
//Data............: 21/07/2011
//Responsável.....: Paulo Nobre
//Descrição.......: Implementado:
//	            > Inclusão de 2 novos tipo de movimento:
//	            > 6 - Reversão na inadimplência, somente financeiro
//                  > 7 - Inadimplência - semelhante a uma concessão
//*******************************************************************************************************
//Rotina..........: FImportaEmpAcoes
//N. Sol..........: 161791
//N. Kintana......: 1369052
//Data............: 21/07/2011
//Responsável.....: Paulo Nobre
//Descrição.......: Implementado:
//	            > Renomeada a função BuscaSaldoJuros para BuscaSaldoFinanceiro
//	            > Na Função GravaJuros, foi acertado os valores na gravção dos campos quando o tipo for = 'J'
//*******************************************************************************************************
//Rotina..........: FImportaEmpAcoes
//N. Sol..........: 158530
//N. Kintana......: 1288010
//Data............: 01/06/2011
//Responsável.....: Paulo Nobre
//Descrição.......: Implementado:
//	            > Juros cobrados no dia da reversão;
//	            > Identificação se Reversão Total, Tipo = 3 no PLANUS;
//	            > Juros de Ajuste para apuração consistente entre os cálculos de juros diários x valores das Reversões
//                  > Rotinas de contabilização de juros e reversões
//******************************************************************************************************
//Rotina..........: FImportaEmpAcoes
//N. Sol..........: 84432
//N. Kintana......: 523253
//Data............: 09/11/2010
//Responsável.....: Paulo Nobre/ Ricardo Cristiano / Renan Cristiano
//Descrição.......: Importação de Emprestimo de Ações
//***********************************************************************************************
Unit FImportaEmpAcoes;

Interface

Uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
   TB97Tlbr, TB97, ExtCtrls, wwdbdatetimepicker, CMDateTimePicker, Db,
   DBTables, Wwquery, wwdblook, ComObj, USistema, FOkCancelarInv,
   faMensagem, fcLabel, uCtrlParamInvest, uCtrlPadroes,
   DBClient, uCMClientDataSet, UBibliotecaInvest, UOperComum,
   Grids, DBGrids, Menus, ComCtrls, Wwdbigrd, Wwdbgrid, jpeg, MATH,
   uCMMath, Mask, DBCtrls;

Type
   TFrmImportaEmpAcoes = Class(TfrmOkCancelarInv)
      Label1: TLabel;
      SB1: TSpeedButton;
      edtArquivo: TEdit;
      OpenDialog1: TOpenDialog;
      Qry: TQuery;
      Ds: TDataSource;
      QryDATAOPERACAO: TDateTimeField;
      QryDATAVENCOPER: TDateTimeField;
      QryDATAREVERSAO: TDateTimeField;
      QryDESCINVESTIMENTO: TStringField;
      QryPLANPRVCONTABPATRO: TStringField;
      QryDESCCARTINVEST: TStringField;
      QrySGLCORRETVALORES: TStringField;
      QrySGLCUSTODIANTE: TStringField;
      QryPUOPERACAO: TFloatField;
      QryQTDOPERACAO: TFloatField;
      QryTAXAOPERACAO: TFloatField;
      QryVLROPERACAO: TFloatField;
      QryVLRJUROS: TFloatField;
      QryVLRRECEITABRUTA: TFloatField;
      QryNUMCONTRATOCUSTODIA: TStringField;
      QryTIPOMOVIMENTO: TStringField;
      lblMensagem: TfcLabel;
      PageControl: TPageControl;
      TabSheet1: TTabSheet;
      TabSheet2: TTabSheet;
      mmErro: TMemo;
      QryDESCOBSERVACAO: TStringField;
      dtpUltMovImport: TCMDateTimePicker;
      Label2: TLabel;
      QryFLGSITUACAOIMPORT: TFloatField;
      prbReproc: TProgressBar;
      dbgImporta: TwwDBGrid;
      QryIDOPEREMPACOESIMPORTA: TFloatField;
      spbLocalizaUltMov: TSpeedButton;
      QryIDCUSTODIANTE: TFloatField;
      QryIDCARTEIRAINVEST: TFloatField;
      QryIDINVESTIMENTO: TFloatField;
      QryIDPLANPREVCTBPATR: TFloatField;
      QryIDTIPOMOVIMENTO: TStringField;
      QryIDCORRETVALORES: TFloatField;
      QryIDEMISSOR: TFloatField;
      QryCarteira: TQuery;
      QryDESCTIPOCONTA: TStringField;
      QryFLGTIPOCONTA: TFloatField;
      Query1: TQuery;
      Query2: TQuery;
      Query2IDHISTEMPACOES: TFloatField;
      Query2IDEMPRESAPROP: TFloatField;
      Query2IDMODULO: TFloatField;
      Query2IDPLANPREVCTBPATR: TFloatField;
      Query2PLANO: TFloatField;
      Query2PLNCODIGO: TFloatField;
      Query2CODDOCUMENTO: TFloatField;
      Query2IDCUSTODIANTE: TFloatField;
      Query2IDCARTEIRAINVEST: TFloatField;
      Query2IDINVESTIMENTO: TFloatField;
      Query2IDTIPOINVEST: TFloatField;
      Query2IDTIPOOPERACAO: TFloatField;
      Query2IDOPEREMPACOES: TFloatField;
      Query2DATAHISTEMPACOES: TDateTimeField;
      Query2VLRHISTEMPACOES: TFloatField;
      Query2SLDHISTEMPACOES: TFloatField;
      Query2QTDHISTEMPACOES: TFloatField;
      Query2NATURMOV: TStringField;
      Query2TRGDTINCLUSAO: TDateTimeField;
      Query2TRGUSERINCLUSAO: TStringField;
      Query2SLDQTDHISTEMPACOE: TFloatField;
      Query2IDOPEREMPACOESAP: TFloatField;
      Query2FLGRECALC: TStringField;
      Query2VLRJUROS: TFloatField;
      Query2SLDJUROS: TFloatField;
      Query2VLRFINAL: TFloatField;
      Query2SLDFINAL: TFloatField;
      Query2VLRPRINCIPAL: TFloatField;
      Query2SLDPRINCIPAL: TFloatField;
      Query2VLRJUROSEST: TFloatField;
      Query2NUMCONTRATOCUSTODIA: TStringField;
      Query2TIPOLANCAMENTO: TStringField;
      Query2IDCORRETVALORES: TFloatField;
      Query2SLDJUROSIMPORTA: TFloatField;
      Query2VLRJUROSIMPORTA: TFloatField;
      Query2IDCARTEIRACUSTODIANTE: TFloatField;
      Query2TIPOMOVIMENTO: TStringField;
      Query2VJUR: TFloatField;
      Query2SJUR: TFloatField;
      Query3: TQuery;
      Query3IDHISTEMPACOES: TFloatField;
      Query3IDEMPRESAPROP: TFloatField;
      Query3IDMODULO: TFloatField;
      Query3IDPLANPREVCTBPATR: TFloatField;
      Query3PLANO: TFloatField;
      Query3PLNCODIGO: TFloatField;
      Query3CODDOCUMENTO: TFloatField;
      Query3IDCUSTODIANTE: TFloatField;
      Query3IDCARTEIRAINVEST: TFloatField;
      Query3IDINVESTIMENTO: TFloatField;
      Query3IDTIPOINVEST: TFloatField;
      Query3IDTIPOOPERACAO: TFloatField;
      Query3IDOPEREMPACOES: TFloatField;
      Query3DATAHISTEMPACOES: TDateTimeField;
      Query3VLRHISTEMPACOES: TFloatField;
      Query3SLDHISTEMPACOES: TFloatField;
      Query3QTDHISTEMPACOES: TFloatField;
      Query3NATURMOV: TStringField;
      Query3TRGDTINCLUSAO: TDateTimeField;
      Query3TRGUSERINCLUSAO: TStringField;
      Query3SLDQTDHISTEMPACOE: TFloatField;
      Query3IDOPEREMPACOESAP: TFloatField;
      Query3FLGRECALC: TStringField;
      Query3VLRJUROS: TFloatField;
      Query3SLDJUROS: TFloatField;
      Query3VLRFINAL: TFloatField;
      Query3SLDFINAL: TFloatField;
      Query3VLRPRINCIPAL: TFloatField;
      Query3SLDPRINCIPAL: TFloatField;
      Query3VLRJUROSEST: TFloatField;
      Query3NUMCONTRATOCUSTODIA: TStringField;
      Query3TIPOLANCAMENTO: TStringField;
      Query3IDCORRETVALORES: TFloatField;
      Query3SLDJUROSIMPORTA: TFloatField;
      Query3VLRJUROSIMPORTA: TFloatField;
      Query3IDCARTEIRACUSTODIANTE: TFloatField;
      Query3TIPOMOVIMENTO: TStringField;
      Query3VJUR: TFloatField;
      Query3SJUR: TFloatField;
      Query4: TQuery;
      Qry01: TQuery;
      Button1: TButton;
      Button2: TButton;
      //Ricardo Cristiano 28/11/2011 - SOL 169307 - Kintana 1501822
      TabSheet3: TTabSheet;
      mmInvest: TMemo;
      Toolbar971: TToolbar97;
      ToolbarSep972: TToolbarSep97;
      bBtnImportar: TBitBtn;
      bbtExcluir: TBitBtn;
      qryAux2: TQuery;
      qryImp: TQuery;
      qryImpNUMSEQ: TFloatField;
      qryDataUltimaAtualizacao: TQuery;
      qryDataUltimaAtualizacaoULTIMADATA: TDateTimeField;
      dsDataUltimaAtualizacao: TDataSource;
      DBEdit1: TDBEdit;
      Label3: TLabel;
      Procedure SB1Click(Sender: TObject);
      Procedure bBtnImportarClick(Sender: TObject);
      Procedure FormShow(Sender: TObject);
      Procedure dbgImportaDrawDataCell(Sender: TObject; Const Rect: TRect;
         Field: TField; State: TGridDrawState);
      Procedure spbLocalizaUltMovClick(Sender: TObject);
      Procedure dbgImportaCalcCellColors(Sender: TObject; Field: TField;
         State: TGridDrawState; Highlight: Boolean; AFont: TFont;
         ABrush: TBrush);
      Procedure bbtnConfirmarClick(Sender: TObject);
      Procedure bbtnCancelarClick(Sender: TObject);
      Procedure FormCreate(Sender: TObject);
      Procedure FormDestroy(Sender: TObject);
      Procedure bbtExcluirClick(Sender: TObject);
      Procedure Button1Click(Sender: TObject);
      Procedure Button2Click(Sender: TObject);
   Private
      Procedure ExcluiMovimento;
      Procedure AtuUltimaDataImportacao;
      Function TestaPeriodo(sData: String): Boolean;
      Function MovimentoComProblema: Boolean;
      Function ValidaImportacao: Boolean;
      Function ImportaOrdens: Boolean;
      Function ExtraiTexto(Var Linha, sDelimitador: String): String;
      Function RetornaIdInvestimento(CodigoAcaoBolsa: String): integer;
      Function RetornaCorretora(sCorretora: String): Integer;
      Function RetornaTipoMovimento(iTipo: Integer): String;
      Function RetornaTipoConta(iCodContaInvestimento, iCodCustodiantePlano: integer): String;
      Function LocalizaDePara(sCampo, CarteiraCustodiante, iCodContaInvestimento: String; IdCustodiante: integer): integer;
      Function VerificaExistenciaContrato(sNumContratoCustodiante: String): Boolean;
      Function DiaImportado(Sit: Integer): Boolean;
      Function BuscaSaldoQtd(iNumContrato: Integer): Double;
      Function CalculaJurosDiario(fVlOperacao, fTaxa: Double; iQtdDias: Integer): Double;
      Function VenctoReversaoAR(DataVencto: TDateTime): TDateTime;

      // Paulo Nobre 14/11/2011 - SOL 170566 Kintana 1519133
      Function BuscaSaldoFinanceiroAtual(iNumContrato: Integer): Double;

      Procedure GravaJuros(Tipo, NumContrato: String; idcustodiante, idcartempacoes, idcartinvest,
         idinvest, idplanopatro, idcorret: Integer; valor, sldvalor, qtd, sldqtd, DifAjuste: Double; DataOper, DataVencto: TDateTime);

      Procedure TransferenciaEntreCarteiras(TipoMov, idcustodiante, idcartinvest, idinvest, idplanopatro, tipoconta, emissor: Integer;
         DataOper, DataRever: Tdatetime; qtd: Double; descinvest: String);

      Procedure IntegraContabCapCarImporta(invest, tipooper, cartempacoes, planopatro, custodiante: Integer;
         fVlrJurosImporta: Double; DataOper, DataVencto: TDateTime; NumContrato: String);

      //Paulo Nobre 16/08/2011 - SOL 163239 - Kintana 1392476
      //Paulo Nobre 28/07/2011 - SOL 162187 - Kintana 1376428
      Function VerificaExistenciaDeReversao(sNumContratoCustodiante, sDataOper: String): Boolean;

   Public
      RegEmpAcoes: Record
         iSequencia: integer;
         sDataOperacao: String;
         sDataVencimento: String;
         sDataReversao: String;
         iPlano: integer;
         iCarteira: Integer;
         CodCarteira: String;
         CodContaInv: String;
         iCorretora: Integer;
         iInvestimento: Integer;
         fQuantidade: Double;
         fPreco: Double;
         fValor: Double;
         fTaxa: Double;
         fReceita: Double;
         fJuros: Double;
         sContratoCustodiante: String;
         iCustodiante: Integer;
         iFlgTipo: Integer;
         iFlgImporta: Integer;
         sLinhaObs: String;
      End;
   End;

Var
   FrmImportaEmpAcoes: TFrmImportaEmpAcoes;
   sNomeLog: String;
   iIdEmpAcoes: Integer;
   fSaldoJuros, jJurosDia, fSaldoQtd, fDiferencaAjuste: Double;
   QryOper, QryImp, QryImpHist: TwwQuery;
   FPlano, FPlanilha: Integer;

Implementation

Uses UDiasUteisInv, fAguarde, DBaseDados, UMensErro, UDataBase, uCtrlEmpAcoes,
   //Ricardo Cristiano 28/11/2011 - SOL 169307 - Kintana 1501822
   uRendaVariavel;

{$R *.DFM}

Function TFrmImportaEmpAcoes.VenctoReversaoAR(DataVencto: TDateTime): TDateTime;
Begin
   While Not DiasUteisInv.DiaUtil(DataVencto, -1, 1, '', True, False, False) Do
      DataVencto := DataVencto + 1; // Achar o próximo dia útil

   VenctoReversaoAR := DataVencto;
End;

Function TFrmImportaEmpAcoes.VerificaExistenciaContrato(sNumContratoCustodiante: String): Boolean;
Var QryAux: TwwQuery;
Begin
   Screen.Cursor := crSQLWait;
   QryAux := TwwQuery.Create(Nil);
   QryAux.DatabaseName := 'BaseDados';
   QryAux.Close;
   QryAux.SQL.Clear;
   QryAux.SQL.Add('SELECT O.NUMCONTRATOCUSTODIA   ');
   // Paulo Nobre 02/04/2011 - Sol 177621/8961 Kintana 1629308
   QryAux.SQL.Add('FROM OPEREMPACOESIMPORTA O             ');
   QryAux.SQL.Add('WHERE TRIM(O.NUMCONTRATOCUSTODIA) = ' + QuotedStr(Trim(sNumContratoCustodiante)));
   // Paulo Nobre 06/10/2011 - SOL 166163 - Kintana 1445211
   QryAux.SQL.Add('  AND O.TIPOMOVIMENTO IN (1,4,7,8) '); // Registro Pai (Concessão ou Repactuação ou Inadimplência ou Contrato pré)
   QryAux.Open;
   result := QryAux.RecordCount > 0;

   QryAux.Close;
   Screen.Cursor := crDefault;

   FreeAndNil(QryAux);
End;

Procedure TFrmImportaEmpAcoes.SB1Click(Sender: TObject);
Begin
   Inherited;
   If (OpenDialog1.Execute) Then
      edtArquivo.Text := UpperCase(OpenDialog1.FileName);
End;

Function TFrmImportaEmpAcoes.ValidaImportacao: Boolean;
Begin
   Result := True;
   //Paulo Nobre 05/07/2011 - SOL 160038 - Kintana 1331763
   If Trim(RegEmpAcoes.sDataOperacao) = '//' Then
      RegEmpAcoes.sDataOperacao := '';

   //Paulo Nobre - 27/07/2011 - N. Sol 161867 -  N. Kintana 1371009
   If (Not RegEmpAcoes.iFlgTipo In [1, 2, 3, 4, 5, 6, 7, 8]) Then // Tipos Válidos
      Begin
         RegEmpAcoes.sLinhaObs := RegEmpAcoes.sLinhaObs + 'Tipo de Operação Inválido -> ' + inttostr(RegEmpAcoes.iFlgTipo) + '; ' + #13#10;
         Result := False;
      End
   Else
      Begin
         If Trim(RegEmpAcoes.sDataOperacao) = '//' Then
            RegEmpAcoes.sDataOperacao := '';

         If Trim(RegEmpAcoes.sDataVencimento) = '//' Then
            RegEmpAcoes.sDataVencimento := '';

         If Trim(RegEmpAcoes.sDataReversao) = '//' Then
            RegEmpAcoes.sDataReversao := '';

         RegEmpAcoes.sLinhaObs := '';

         If Trim(RegEmpAcoes.sDataOperacao) = '' Then
            Begin
               RegEmpAcoes.sLinhaObs := RegEmpAcoes.sLinhaObs + 'Data de Operação em branco; ' + #13#10;
               Result := False;
            End;

         //Testa periodo contabil antes da importação.
         If Not TestaPeriodo(RegEmpAcoes.sDataOperacao) Then
            Begin
               RegEmpAcoes.sLinhaObs := RegEmpAcoes.sLinhaObs + 'Data de Operação inválida ' + RegEmpAcoes.sDataOperacao + '; ' + #13#10;
               RegEmpAcoes.sDataOperacao := ''; //Grava nulo
               Result := False;
            End;

         If Trim(RegEmpAcoes.sDataVencimento) = '' Then
            Begin
               RegEmpAcoes.sLinhaObs := RegEmpAcoes.sLinhaObs + 'Data de Vencimento em branco; ' + #13#10;
               Result := False;
            End;

         //Testa periodo contabil antes da importação.
         If Not TestaPeriodo(RegEmpAcoes.sDataVencimento) Then
            Begin
               RegEmpAcoes.sLinhaObs := RegEmpAcoes.sLinhaObs + 'Data de Vencimento inválida ' + RegEmpAcoes.sDataVencimento + '; ' + #13#10;
               RegEmpAcoes.sDataVencimento := ''; //Grava nulo
               Result := False;
            End;

         If (Trim(RegEmpAcoes.sDataReversao) = '') And (Not (RegEmpAcoes.iFlgTipo In [1, 4, 8, 5])) Then
            Begin
               RegEmpAcoes.sLinhaObs := RegEmpAcoes.sLinhaObs + 'Data de Reversão em branco para o Tipo de Movimento = REVERSÃO; ' + #13#10;
               Result := False;
            End;

         //Testa periodo contabil antes da importação.
         If (Not TestaPeriodo(RegEmpAcoes.sDataReversao)) And (RegEmpAcoes.sDataReversao <> '') Then
            Begin
               RegEmpAcoes.sLinhaObs := RegEmpAcoes.sLinhaObs + 'Data de Reversão inválida ' + RegEmpAcoes.sDataReversao + '; ' + #13#10;
               RegEmpAcoes.sDataReversao := ''; //Grava nulo
               Result := False;
            End;

         If RegEmpAcoes.iPlano = 0 Then
            Begin
               RegEmpAcoes.sLinhaObs := RegEmpAcoes.sLinhaObs + 'Plano não encontrado; ' + #13#10;
               Result := False;
            End;

         If RegEmpAcoes.iCarteira = 0 Then
            Begin
               RegEmpAcoes.sLinhaObs := RegEmpAcoes.sLinhaObs + 'Carteira não encontrada; ' + #13#10;
               Result := False;
            End;

         If RegEmpAcoes.iCorretora = 0 Then
            Begin
               RegEmpAcoes.sLinhaObs := RegEmpAcoes.sLinhaObs + 'Corretora não encontrada; ' + #13#10;
               Result := False;
            End;

         If RegEmpAcoes.iInvestimento = 0 Then
            Begin
               RegEmpAcoes.sLinhaObs := RegEmpAcoes.sLinhaObs + 'Investimento não encontrado;' + #13#10;
               Result := False;
            End;

         If RegEmpAcoes.iCustodiante = 0 Then
            Begin
               RegEmpAcoes.sLinhaObs := RegEmpAcoes.sLinhaObs + 'Custodiante não encontrado; ' + #13#10;
               Result := False;
            End;

         If RegEmpAcoes.fQuantidade <= 0 Then
            Begin
               RegEmpAcoes.sLinhaObs := RegEmpAcoes.sLinhaObs + 'Quantidade menor ou igual a zero; ' + #13#10;
               Result := False;
            End;

         If RegEmpAcoes.fPreco <= 0 Then
            Begin
               RegEmpAcoes.sLinhaObs := RegEmpAcoes.sLinhaObs + 'Preço menor ou igual a zero; ' + #13#10;
               Result := False;
            End;

         If RegEmpAcoes.fValor <= 0 Then
            Begin
               RegEmpAcoes.sLinhaObs := RegEmpAcoes.sLinhaObs + 'Valor menor ou igual a zero; ' + #13#10;
               Result := False;
            End;

         If RegEmpAcoes.fTaxa <= 0 Then
            Begin
               RegEmpAcoes.sLinhaObs := RegEmpAcoes.sLinhaObs + 'Taxa menor ou igual a zero; ' + #13#10;
               Result := False;
            End;

         //Paulo Nobre - 27/07/2011 - N. Sol 161867 -  N. Kintana 1371009
         //Se Receita for <= a 0 e Tipo de Operacao = Reversões
         If ((RegEmpAcoes.fReceita <= 0) And (RegEmpAcoes.iFlgTipo In [2, 3, 6])) Then
            Begin
               RegEmpAcoes.sLinhaObs := RegEmpAcoes.sLinhaObs + 'Receita menor ou igual a zero para o Tipo de Movimento = REVERSÃO; ' + #13#10;
               Result := False;
            End;

         //Se Juros for <= a 0 e Tipo de Operacao = Juros Diários
         If ((RegEmpAcoes.fJuros <= 0) And (RegEmpAcoes.iFlgTipo = 5)) Then
            Begin
               RegEmpAcoes.sLinhaObs := RegEmpAcoes.sLinhaObs + 'Juros menor ou igual a zero para o Tipo de Movimento = JUROS; ' + #13#10;
               Result := False;
            End;

         If Trim(RegEmpAcoes.sContratoCustodiante) = '' Then
            Begin
               RegEmpAcoes.sLinhaObs := RegEmpAcoes.sLinhaObs + 'Nº do Contrato do Empréstimo em branco ; ' + #13#10;
               Result := False;
            End
         Else
            Begin
               //Paulo Nobre - 27/07/2011 - N. Sol 161867 -  N. Kintana 1371009
               If RegEmpAcoes.iFlgTipo In [2, 3, 5, 6, 7] Then // Se for um desse tipo tem que existir um mesmo contrato anterior
                  Begin
                     If Not VerificaExistenciaContrato(RegEmpAcoes.sContratoCustodiante) Then
                        Begin
                           RegEmpAcoes.sLinhaObs := RegEmpAcoes.sLinhaObs + 'Não encontrado a CONCESSÃO para este Nº de Contrato ' + RegEmpAcoes.sContratoCustodiante + ';' + #13#10;
                           Result := False;
                        End;
                  End
               Else
                  //Paulo Nobre - 27/07/2011 - N. Sol 161867 -  N. Kintana 1371009
                  If RegEmpAcoes.iFlgTipo In [1, 4, 8] Then // Concessão e repactuação e Contrato pré-datado
                     Begin
                        If VerificaExistenciaContrato(RegEmpAcoes.sContratoCustodiante) Then
                           Begin
                              RegEmpAcoes.sLinhaObs := RegEmpAcoes.sLinhaObs + 'CONCESSÃO para este Nº de Contrato ' + RegEmpAcoes.sContratoCustodiante + ', já foi Importada;' + #13#10;
                              Result := False;
                           End;
                     End;
            End;
      End;

   //Paulo Nobre - 27/07/2011 - N. Sol 161867 -  N. Kintana 1371009
   If (Result) Then //0 = OK
      RegEmpAcoes.iFlgImporta := 0
   Else
      Begin //1 = Não OK
         RegEmpAcoes.sLinhaObs := 'Linha ' + IntToStr(RegEmpAcoes.iSequencia) + ': ' + #13#10 + RegEmpAcoes.sLinhaObs + #13#10;
         RegEmpAcoes.iFlgImporta := 1;
      End;
End;

Function TFrmImportaEmpAcoes.ImportaOrdens: Boolean;
Begin
   //Paulo Nobre - 28/11/2011 - SOL 169307 - Kintana 1501822  - Inicio
   qryImp.Close;
   qryImp.Open;

   // Inserir os dados na tabela OperEmpAcoesImporta
   qryAux2.Close;
   qryAux2.SQL.Clear;
   qryAux2.SQL.Add('INSERT INTO OPEREMPACOESIMPORTA (  ');
   qryAux2.SQL.Add('IDOPEREMPACOESIMPORTA, DATAOPERACAO, DATAVENCOPER, DATAREVERSAO,          ');
   If Not (RegEmpAcoes.iPlano = 0) Then
      qryAux2.SQL.Add('IDPLANPREVCTBPATR,     ');
   If Not (RegEmpAcoes.iCarteira = 0) Then
      qryAux2.SQL.Add('IDCARTEIRAINVEST,      ');
   If Not (RegEmpAcoes.iCorretora = 0) Then
      qryAux2.SQL.Add('IDCORRETVALORES,       ');
   If Not (RegEmpAcoes.iInvestimento = 0) Then
      qryAux2.SQL.Add('IDINVESTIMENTO,        ');
   If Not (RegEmpAcoes.iCustodiante = 0) Then
      qryAux2.SQL.Add('IDCUSTODIANTE,         ');
   qryAux2.SQL.Add('FLGTIPOCONTA, PUOPERACAO, QTDOPERACAO, TAXAOPERACAO,          ');
   qryAux2.SQL.Add('VLROPERACAO, VLRJUROS, VLRRECEITABRUTA, NUMCONTRATOCUSTODIA,   ');
   qryAux2.SQL.Add('TIPOMOVIMENTO, DESCOBSERVACAO, FLGSITUACAOIMPORT     )');
   qryAux2.Sql.Add('VALUES (:p1, :p2, :p3, :p4, ');
   If Not (RegEmpAcoes.iPlano = 0) Then
      qryAux2.Sql.Add(':p5, ');
   If Not (RegEmpAcoes.iCarteira = 0) Then
      qryAux2.Sql.Add(':p6, ');
   If Not (RegEmpAcoes.iCorretora = 0) Then
      qryAux2.Sql.Add(':p7, ');
   If Not (RegEmpAcoes.iInvestimento = 0) Then
      qryAux2.Sql.Add(':p8, ');
   If Not (RegEmpAcoes.iCustodiante = 0) Then
      qryAux2.Sql.Add(':p9, ');
   qryAux2.Sql.Add(':p10, :p11, :p12, :p13, :p14, :p15, :p16, :p17, :p18, :p19, :p20 ) ');
   qryAux2.parambyname('p1').asInteger := qryImp.fieldbyname('NUMSEQ').asInteger;
   qryAux2.parambyname('p2').asString := RegEmpAcoes.sDataOperacao;
   qryAux2.parambyname('p3').asString := RegEmpAcoes.sDataVencimento;
   qryAux2.parambyname('p4').asString := RegEmpAcoes.sDataReversao;
   If Not (RegEmpAcoes.iPlano = 0) Then
      qryAux2.parambyname('p5').asInteger := RegEmpAcoes.iPlano;
   If Not (RegEmpAcoes.iCarteira = 0) Then
      qryAux2.parambyname('p6').asInteger := RegEmpAcoes.iCarteira;
   If Not (RegEmpAcoes.iCorretora = 0) Then
      qryAux2.parambyname('p7').asInteger := RegEmpAcoes.iCorretora;
   If Not (RegEmpAcoes.iInvestimento = 0) Then
      qryAux2.parambyname('p8').asInteger := RegEmpAcoes.iInvestimento;
   If Not (RegEmpAcoes.iCustodiante = 0) Then
      qryAux2.parambyname('p9').asInteger := RegEmpAcoes.iCustodiante;
   qryAux2.parambyname('p10').asString := RetornaTipoConta(StrToInt(RegEmpAcoes.CodContaInv), StrToInt(RegEmpAcoes.CodCarteira));
   qryAux2.parambyname('p11').asFloat := RegEmpAcoes.fPreco;
   qryAux2.parambyname('p12').asFloat := RegEmpAcoes.fQuantidade;
   qryAux2.parambyname('p13').asFloat := RegEmpAcoes.fTaxa;
   qryAux2.parambyname('p14').asFloat := RegEmpAcoes.fValor;
   qryAux2.parambyname('p15').asFloat := RegEmpAcoes.fJuros;
   qryAux2.parambyname('p16').asFloat := RegEmpAcoes.fReceita;
   qryAux2.parambyname('p17').asString := RegEmpAcoes.sContratoCustodiante;
   qryAux2.parambyname('p18').asInteger := RegEmpAcoes.iFlgTipo;
   qryAux2.parambyname('p19').asString := StringReplace(RegEmpAcoes.sLinhaObs, #13 + #10, '', [rfReplaceAll]);
   qryAux2.parambyname('p20').asInteger := RegEmpAcoes.iFlgImporta;
   If Not qryAux2.Prepared Then
      qryAux2.Prepare;
   qryAux2.ExecSQL;
   qryAux2.Close;
   qryImp.Close;
End;

Function TFrmImportaEmpAcoes.ExtraiTexto(Var Linha, sDelimitador: String): String;
Begin
   If pos(sDelimitador, Linha) > 0 Then
      Result := Trim(copy(Linha, 1, pos(sDelimitador, Linha) - 1))
   Else
      Result := Trim(copy(Linha, 1, Length(Linha))); // Ultimo Campo 'ITipo'

   Linha := copy(Linha, Pos(sDelimitador, Linha) + 1, Length(Linha));
End;

Function TFrmImportaEmpAcoes.RetornaIdInvestimento(CodigoAcaoBolsa: String): integer;
Var
   QryBuscaInv: TwwQuery;
   sSQL: String;
Begin
   QryBuscaInv := TwwQuery.Create(Nil);
   QryBuscaInv.DatabaseName := 'BaseDados';
   sSQL := 'SELECT ACAO.IdAcao FROM ACOESXBOLSA ACAO';
   sSQL := sSQL + '  WHERE ACAO.siglaacaobolsa = ' + QuotedStr(Trim(CodigoAcaoBolsa));

   FazQuery(QryBuscaInv, sSQL);

   If QryBuscaInv.RecordCount > 0 Then
      result := QryBuscaInv.FieldByName('IdAcao').Asinteger
   Else
      result := 0;

   QryBuscaInv.Close;

   FreeAndNil(QryBuscaInv);
End;

Function TFrmImportaEmpAcoes.RetornaCorretora(sCorretora: String): Integer;
Var QryAux: TwwQuery;
Begin
   QryAux := TwwQuery.Create(Nil);
   QryAux.DatabaseName := 'BaseDados';
   QryAux.Close;
   QryAux.SQL.Clear;
   QryAux.SQL.Add('SELECT C.IdCorretValores FROM CORRETVALORES C WHERE C.SglCorretCustodiante = ' + QuotedStr(Trim(sCorretora)));
   QryAux.Open;
   If QryAux.RecordCount > 0 Then
      result := QryAux.FieldByName('IdCorretValores').AsInteger
   Else
      result := 0;
   QryAux.Close;
   FreeAndNil(QryAux);
End;

Function TFrmImportaEmpAcoes.LocalizaDePara(sCampo, CarteiraCustodiante, iCodContaInvestimento: String; IdCustodiante: integer): integer;
Var QryAux: TwwQuery;
Begin
   // De Custodiante para Funcef
   QryAux := TwwQuery.Create(Nil);
   QryAux.DatabaseName := 'BaseDados';
   FazQuery(QryAux, 'SELECT C.idplanprevctbpatr, C.idcarteirainvest FROM custodianteplano C WHERE C.idcustodiante = ' + IntToStr(idcustodiante) + ' AND C.CodigoCustodiante = ' + QuotedStr(CarteiraCustodiante) + ' AND C.CodigoContaInvestimento = ' + QuotedStr(iCodContaInvestimento));
   If QryAux.RecordCount > 0 Then
      Begin
         If sCampo = 'P' Then // Plano/Patro
            result := QryAux.FieldByName('idplanprevctbpatr').AsInteger
         Else // 'C' - Carteira
            result := QryAux.FieldByName('idcarteirainvest').AsInteger;
      End
   Else
      result := 0;
   QryAux.Close;
   FreeAndNil(QryAux);
End;

Procedure TFrmImportaEmpAcoes.ExcluiMovimento;
Var QryDuplicado: TwwQuery;
Begin
   Try
      QryDuplicado := TwwQuery.Create(Nil);
      QryDuplicado.DataBaseName := 'BaseDados';
      QryDuplicado.Close;
      QryDuplicado.sql.Clear;
      QryDuplicado.sql.Add('SELECT O.DATAOPERACAO FROM OPEREMPACOESIMPORTA O');
      QryDuplicado.sql.Add('WHERE  O.DATAOPERACAO =:DATAOPERACAO OR O.DATAOPERACAO IS NULL');
      QryDuplicado.sql.Add('  AND  O.FLGSITUACAOIMPORT <> 2');
      QryDuplicado.ParamByName('DATAOPERACAO').DataType := ftString;
      QryDuplicado.ParamByName('DATAOPERACAO').AsString := RegEmpAcoes.sDataOperacao;
      QryDuplicado.Open;
      // Se data de operacao ja foi importado, exclui e importa novamente.
      If Not (QryDuplicado.IsEmpty) Then Begin
            QryDuplicado.Close;
            QryDuplicado.sql.Clear;
            QryDuplicado.sql.Add('DELETE FROM OPEREMPACOESIMPORTA');
            QryDuplicado.sql.Add('WHERE DATAOPERACAO =:DATAOPERACAO OR DATAOPERACAO IS NULL');
            QryDuplicado.ParamByName('DATAOPERACAO').DataType := ftString;
            QryDuplicado.ParamByName('DATAOPERACAO').AsString := RegEmpAcoes.sDataOperacao;
            QryDuplicado.ExecSQL;
         End;
      QryDuplicado.Close;
   Finally
      FreeAndNil(QryDuplicado);
   End;
End;

Procedure TFrmImportaEmpAcoes.bBtnImportarClick(Sender: TObject);
Var
   QryDadosTemp: TwwQuery;
   Arquivo: TStringList;
   i: integer;
   sDelimitador: String;
   //Ricardo Cristiano 28/11/2011 - SOL 169307 - Kintana 1501822
   sInvestReproc, sArquivoObs: TStringList;
   iCabecalho: Integer;
   sLinha: String;
   bDataValida: Boolean;
Begin
   Try
      //Ricardo Cristiano 28/11/2011 - SOL 169307 - Kintana 1501822
      PageControl.Pages[2].TabVisible := False;
      bDataValida := False;
      PageControl.ActivePageIndex := 0;
      sDelimitador := ';';
      iCabecalho := 1;
      // Zera barra de tarefas
      prbReproc.Max := 0;
      prbReproc.StepIt;

      Arquivo := TStringList.Create();
      sArquivoObs := TStringList.Create();
      //Ricardo Cristiano 28/11/2011 - SOL 169307 - Kintana 1501822
      sInvestReproc := TStringList.Create();
      // Valida Existencia do Arquivo
      If Trim(edtArquivo.Text) = '' Then
         Begin
            MsgDlg('Arquivo não Informado !', 'Atenção', MtWarning, [mbok], 0);
            abort;
         End;

      // Testa se Arquivo Especificado Existe
      If Not (FileExists(edtArquivo.Text)) Then
         Begin
            MsgDlg('O Arquivo Inexistente ou Inválido !', 'Atenção', mtWarning, [mbOk], 0);
            Abort;
         End;

      // Carrega o Arquivo em Memória
      Arquivo.LoadFromFile(edtArquivo.Text);
      If (Trim(sDelimitador) = '') Or ((Pos(sDelimitador, Arquivo.Strings[iCabecalho])) = 0) Then
         Begin
            MsgDlg('Delimitador de campo não Informado ou Inválido !', 'Atenção', MtWarning, [mbok], 0);
            abort;
         End;

      If (MsgDlg('Deseja Importar o Movimento ?', 'Atenção', mtConfirmation, [mbYes, mbNo], 0) = mrNo) Then
         Abort;

      Screen.Cursor := crSQLWait;
      Qry.Close;

      QryDadosTemp := TwwQuery.Create(Nil);
      QryDadosTemp.DatabaseName := 'BaseDados';
      QryDadosTemp.Close;
      QryDadosTemp.SQL.Clear;

      prbReproc.Position := 0;
      prbReproc.Max := Arquivo.Count - iCabecalho;

      // Verifica duplicados em todas as datas do aqruivo e deleta.
      For i := iCabecalho To Arquivo.Count - 1 Do
         Begin
            sLinha := Arquivo.Strings[i];
            If sLinha[1] = sDelimitador[1] Then
               Begin // Se começar com delimitador, deleta;
                  sLinha := Arquivo.Strings[i];
                  Delete(sLinha, 1, 1);
               End;

            // Procura uma data valida.
            RegEmpAcoes.sDataOperacao := ExtraiTexto(sLinha, sDelimitador);

            // Se encontrou uma data válida, sai do loop.
            If TestaPeriodo(RegEmpAcoes.sDataOperacao) Then
               Begin
                  bDataValida := True;
                  Break;
               End;

            prbReproc.StepIt;
         End;
      Screen.Cursor := crDefault;

      If Not (bDataValida) Then
         Begin // Se Nenhuma Data de Operação for válida
            MsgDlg('Impossível a Importação pois nenhuma Data de Operação é válida. Verifique !', 'Atenção', mtWarning, [mbOk], 0);
            AtuUltimaDataImportacao;
            spbLocalizaUltMovClick(Self);
            Exit;
         End;

      If DiaImportado(1) Then
         Begin
            MsgDlg('Movimento já Atualizado para esta dia de Movimento - ' + RegEmpAcoes.sDataOperacao, 'Atenção', mtWarning, [mbOk], 0);
            AtuUltimaDataImportacao;
            spbLocalizaUltMovClick(Self);
            Exit;
         End;

      Screen.Cursor := crSQLWait;

      //Ricardo Cristiano 28/11/2011 - SOL 169307 - Kintana 1501822
      If Not dtmbasedados.dbBaseDados.InTransaction Then
         dtmbasedados.dbBaseDados.StartTransaction;

      ExcluiMovimento;

      dtmbasedados.dbBaseDados.Commit;

      prbReproc.Position := 0;
      prbReproc.Max := Arquivo.Count - iCabecalho;

      //Ricardo Cristiano 28/11/2011 - SOL 169307 - Kintana 1501822
      If Not dtmbasedados.dbBaseDados.InTransaction Then
         dtmbasedados.dbBaseDados.StartTransaction;

      // Loop Principal da Importacao
      For i := iCabecalho To Arquivo.Count - 1 Do
         Begin
            // Mapea os campos do arquivo
            If ((Pos(sDelimitador, Arquivo.Strings[i])) = 0) Then //Se for o rodape sai do loop (não tem delimitador)
               break;

            sLinha := Arquivo.Strings[i];
            If sLinha[1] = sDelimitador[1] Then
               Begin // Se começar com delimitador, deleta;
                  sLinha := sLinha;
                  Delete(sLinha, 1, 1);
               End;

            RegEmpAcoes.iSequencia := i;

            //Data da Operacao
            RegEmpAcoes.sDataOperacao := ExtraiTexto(sLinha, sDelimitador);
            //Data do Vencimento
            RegEmpAcoes.sDataVencimento := ExtraiTexto(sLinha, sDelimitador);
            //Data Reversão
            RegEmpAcoes.sDataReversao := ExtraiTexto(sLinha, sDelimitador);
            //CodCarteira
            RegEmpAcoes.CodCarteira := ExtraiTexto(sLinha, sDelimitador); //Não Grava
            //CodContaInvestimento
            RegEmpAcoes.CodContaInv := ExtraiTexto(sLinha, sDelimitador); //Não Grava
            //Corretora
            RegEmpAcoes.iCorretora := RetornaCorretora(ExtraiTexto(sLinha, sDelimitador));
            //Investimento
            RegEmpAcoes.iInvestimento := RetornaIdInvestimento(ExtraiTexto(sLinha, sDelimitador));
            //Quantidade
            RegEmpAcoes.fQuantidade := StrToFloat(ExtraiTexto(sLinha, sDelimitador));
            //Preço
            RegEmpAcoes.fPreco := StrToFloat(TrocaPontoVirgula(ExtraiTexto(sLinha, sDelimitador)));
            //Valor Operacao
            RegEmpAcoes.fValor := StrToFloat(TrocaPontoVirgula(ExtraiTexto(sLinha, sDelimitador)));
            //Taxa
            RegEmpAcoes.fTaxa := StrToFloat(TrocaPontoVirgula(ExtraiTexto(sLinha, sDelimitador)));
            //Receita Bruta
            RegEmpAcoes.fReceita := StrToFloat(TrocaPontoVirgula(ExtraiTexto(sLinha, sDelimitador)));
            //Valor Juros
            RegEmpAcoes.fJuros := StrToFloat(TrocaPontoVirgula(ExtraiTexto(sLinha, sDelimitador)));
            //Numero contrato custodiante
            RegEmpAcoes.sContratoCustodiante := ExtraiTexto(sLinha, sDelimitador);
            //Tipo de Operacao
            RegEmpAcoes.iFlgTipo := StrToInt(ExtraiTexto(sLinha, sDelimitador));
            //Plano/Patro
            RegEmpAcoes.iPlano := LocalizaDePara('P', RegEmpAcoes.CodCarteira, RegEmpAcoes.CodContaInv, CtrlPInv.IdCustoDiaRenFix);
            //Carteira
            RegEmpAcoes.iCarteira := LocalizaDePara('C', RegEmpAcoes.CodCarteira, RegEmpAcoes.CodContaInv, CtrlPInv.IdCustoDiaRenFix);
            //Custodiante
            RegEmpAcoes.iCustodiante := CtrlPInv.IdCustoDiaRenFix;

            //Paulo Nobre 28/07/2011 - SOL 162187 - Kintana 1376428
            If RegEmpAcoes.iFlgTipo = 5 Then // Não pode haver Reversão total e Juros para o mesmo Contrato no Mesmo dia
               Begin
                  If VerificaExistenciaDeReversao(RegEmpAcoes.sContratoCustodiante, RegEmpAcoes.sDataOperacao) Then
                     Continue;
               End;

            lblMensagem.Caption := 'Importando Movimento de ' + RetornaTipoMovimento(RegEmpAcoes.iFlgTipo) + #13 + ' ';
            Application.ProcessMessages;
            If Not (ValidaImportacao) Then
               sArquivoObs.Add(RegEmpAcoes.sLinhaObs);

            //Ricardo Cristiano 28/11/2011 - SOL 169307 - Kintana 1501822
            If RegEmpAcoes.iFlgTipo In [1, 4, 8, 2, 3] Then // Somente para o que for importado
               Begin
                  If RendaVariavel.VerificaMarcado(RegEmpAcoes.iPlano,
                     RegEmpAcoes.iCarteira,
                     RegEmpAcoes.iInvestimento) Then
                     Begin
                        FazQuery(QryDadosTemp, 'SELECT I.DESCINVESTIMENTO FROM INVESTIMENTO I ' + #13 +
                           ' WHERE I.IDTIPOINVEST = 2 ' + #13 +
                           '   AND I.IDINVESTIMENTO = ' + IntToStr(RegEmpAcoes.iInvestimento));
                        sInvestReproc.Add(QryDadosTemp.FieldByName('DESCINVESTIMENTO').AsString);
                        QryDadosTemp.Close;
                     End;
               End;

            ImportaOrdens;

            prbReproc.StepIt;
         End; //Fim do Loop

      //Ricardo Cristiano 28/11/2011 - SOL 169307 - Kintana 1501822
      dtmbasedados.dbBaseDados.Commit;

      Qry.Close;
      Qry.ParamByName('DATAOPERACAO').AsString := RegEmpAcoes.sDataOperacao;
      Qry.Open;
      Screen.Cursor := crDefault;

      //Ricardo Cristiano 28/11/2011 - SOL 169307 - Kintana 1501822
      If sInvestReproc.Count > 0 Then
         Begin
            sNomeLog := Sistema.RetornaCaminhoArquivos(Sistema.idEmpresa) + '\RV_LogErroImportacaoEmpAcoes_' + FormatDateTime('ddmmyyyy', (now)) + '.txt';
            sInvestReproc.SaveToFile(sNomeLog);
            mmInvest.Lines.LoadFromFile(sNomeLog);
            PageControl.Pages[2].TabVisible := True;
         End;

      If sArquivoObs.Count > 0 Then
         Begin // Se houve erro em algum registro gera o log
            sNomeLog := Sistema.RetornaCaminhoArquivos(Sistema.idEmpresa) + '\RV_LogErroImportacaoEmpAcoes_' + FormatDateTime('ddmmyyyy', (now)) + '.txt';
            sArquivoObs.SaveToFile(sNomeLog);
            mmErro.Lines.LoadFromFile(sNomeLog);
            bbtnConfirmar.Enabled := False;
            PageControl.Pages[1].TabVisible := True;
            lblMensagem.Caption := 'Importação com inconsistências nos dados.' + #13 + ' ';
            MsgDlg('Foram encontradas inconsistências nos dados !' + #13 +
               'Estes deverão ser  acertados  no  arquivo  de' + #13 +
               'Importação e depois importados novamente.',
               'Atenção', mtWarning, [mbOk], 0);
         End
      Else
         Begin
            bbtnConfirmar.Enabled := True;
            PageControl.Pages[1].TabVisible := False;
            lblMensagem.Caption := 'Importação Realizada com Sucesso.' + #13 + ' ';
            MsgDlg('Importação Realizada com Sucesso !', 'Atenção', mtWarning, [mbOk], 0);
            // Excluindo o arquivo de Log se tudo estiver OK
            sNomeLog := Sistema.RetornaCaminhoArquivos(Sistema.idEmpresa) + '\RV_LogErroImportacaoEmpAcoes_' + FormatDateTime('ddmmyyyy', (now)) + '.txt';
            If fileexists(sNomeLog) Then
               deletefile(sNomeLog);
         End;

      AtuUltimaDataImportacao;
      bbtExcluir.Enabled := True;

   Finally
      prbReproc.Position := 0;
      edtArquivo.text := '';
      bbtnCancelar.Enabled := Not (Qry.IsEmpty);
      FreeAndNil(QryDadosTemp);
      FreeAndNil(Arquivo);
      FreeAndNil(sArquivoObs);
   End;
End;

Procedure TFrmImportaEmpAcoes.FormShow(Sender: TObject);
Begin
   Inherited;
   //Ricardo Cristiano 28/11/2011 - SOL 169307 - Kintana 1501822
   PageControl.Pages[2].TabVisible := False;

   Screen.Cursor := crSQLWait;
   AtuUltimaDataImportacao;
   qryDataUltimaAtualizacao.Close;
   qryDataUltimaAtualizacao.Open;
   Screen.Cursor := crDefault;

   spbLocalizaUltMovClick(Self);

   bbtnConfirmar.Enabled := Not (Qry.IsEmpty);
   bbtnCancelar.Enabled := Not (Qry.IsEmpty);
   bbtExcluir.Enabled := Not (Qry.IsEmpty);
End;

Function TFrmImportaEmpAcoes.RetornaTipoMovimento(iTipo: Integer): String;
Begin
   Case iTipo Of
      1: Result := 'Concessão do Empréstimo';
      2: Result := 'Reversão Parcial';
      3: Result := 'Reversão Total';
      4: Result := 'Renovação (Repactuação)';
      5: Result := 'Juros Diários';
      //Paulo Nobre 16/08/2011 - SOL 163239  - Kintana 1392476
      6: Result := 'Liquidação Financeira';
      7: Result := 'Inadimplência';
      // pnobre
      8: Result := 'Contrato Pré-datado';
      0: Result := '';
   End;
End;

Procedure TFrmImportaEmpAcoes.AtuUltimaDataImportacao;
Var QryAux: TwwQuery;
Begin
   Try
      Screen.Cursor := crSQLWait;
      QryAux := TwwQuery.Create(Nil);
      QryAux.DataBaseName := 'BaseDados';
      QryAux.Close;
      QryAux.Sql.Clear;
      QryAux.Sql.Add('SELECT MAX(O.DATAOPERACAO) AS DATAOPERACAO FROM OPEREMPACOESIMPORTA O');
      QryAux.Open;
      If Not (QryAux.IsEmpty) Then
         dtpUltMovImport.Date := QryAux.fieldByName('DATAOPERACAO').AsDateTime;
      QryAux.Close;
      Screen.Cursor := crDefault;
   Finally
      FreeAndNil(QryAux);
   End;
End;

Procedure TFrmImportaEmpAcoes.dbgImportaDrawDataCell(Sender: TObject;
   Const Rect: TRect; Field: TField; State: TGridDrawState);
Begin
   If Not ((gdSelected In State) Or (gdFixed In State) Or (gdFocused In State)) Then
      Begin
         If qry.fieldbyname('FLGSITUACAOIMPORT').asInteger = 1 Then // Com Pendência
            dbgImporta.Canvas.Font.Color := clRed
         Else
            dbgImporta.Canvas.Font.Color := clWindowText;

         dbgImporta.DefaultDrawDataCell(Rect, Field, State);
      End;
End;

Procedure TFrmImportaEmpAcoes.spbLocalizaUltMovClick(Sender: TObject);
Begin
   Screen.Cursor := crSQLWait;
   bbtExcluir.Enabled := False;
   Qry.Close;
   Qry.ParamByName('DATAOPERACAO').AsString := datetostr(dtpUltMovImport.Date);
   Qry.Open;
   Screen.Cursor := crDefault;
   If qry.isEmpty Then
      Begin
         MsgDlg('Não há Movimento Importado com esta data ou Movimento já Atualizado. Verifique !', 'Atenção', MtWarning, [mbok], 0);
         AtuUltimaDataImportacao;
      End
   Else
      Begin
         If MovimentoComProblema Then
            Begin
               bbtnConfirmar.enabled := False;
               PageControl.Pages[1].TabVisible := True;
               sNomeLog := Sistema.RetornaCaminhoArquivos(Sistema.idEmpresa) + '\RV_LogErroImportacaoEmpAcoes_' + FormatDateTime('ddmmyyyy', (now)) + '.txt';
               // Testa se Arquivo Especificado Existe
               If (FileExists(sNomeLog)) Then
                  Begin
                     mmErro.Lines.LoadFromFile(sNomeLog);
                  End;
            End;

         bbtExcluir.Enabled := True;
      End;
End;

Function TFrmImportaEmpAcoes.MovimentoComProblema: Boolean;
Var QryAux: TwwQuery;
Begin
   Try
      Screen.Cursor := crSQLWait;
      QryAux := TwwQuery.Create(Nil);
      QryAux.DataBaseName := 'BaseDados';
      QryAux.Close;
      QryAux.Sql.Clear;
      QryAux.sql.Add('SELECT count(1) QTDDIVERGENTE FROM OPEREMPACOESIMPORTA O');
      QryAux.sql.Add('WHERE (O.DATAOPERACAO =:DATAOPERACAO OR O.DATAOPERACAO IS NULL) AND O.FLGSITUACAOIMPORT = 1');
      QryAux.ParamByName('DATAOPERACAO').AsString := datetostr(dtpUltMovImport.Date);
      QryAux.Open;
      Result := (QryAux.fieldbyname('QTDDIVERGENTE').asInteger > 0);
      QryAux.Close;
      Screen.Cursor := crDefault;
   Finally
      FreeAndNil(QryAux);
   End;
End;

Procedure TFrmImportaEmpAcoes.dbgImportaCalcCellColors(Sender: TObject;
   Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont;
   ABrush: TBrush);
Begin
   Inherited;
   // faz com que as linhas do grid tenham cores alternadas
   If State <> [gdSelected] Then
      Begin
         If Not Highlight Then
            Begin
               // linhas ímpares = amarelo, linhas pares = branco
               If ((Sender As TwwDBGrid).CalcCellRow Mod 2) = 0 Then
                  ABrush.Color := $00C0FFFF // amarelo bebê
               Else
                  ABrush.Color := clWhite;
            End;
      End
   Else
      Begin
         ABrush.Color := clHighLight;
         AFont.Color := clHighLightText;
      End;
End;

Function TFrmImportaEmpAcoes.DiaImportado(Sit: Integer): Boolean;
Var QryImportado: TwwQuery;
Begin
   Try
      Screen.Cursor := crSQLWait;
      QryImportado := TwwQuery.Create(Nil);
      QryImportado.DataBaseName := 'BaseDados';
      QryImportado.Close;
      QryImportado.sql.Clear;
      QryImportado.sql.Add('SELECT O.DATAOPERACAO FROM OPEREMPACOES O');
      QryImportado.sql.Add('WHERE O.DATAOPERACAO =:pDATAOPERACAO');
      QryImportado.sql.Add('  AND O.TIPOLANCAMENTO = ''I'' '); // Importado
      If Sit = 1 Then // Busca pela data do arquvivo texto
         QryImportado.ParamByName('pDATAOPERACAO').AsString := RegEmpAcoes.sDataOperacao
      Else // Busca pela ultima data importada
         QryImportado.ParamByName('pDATAOPERACAO').AsString := QryDATAOPERACAO.AsString;
      QryImportado.Open;
      If Not (QryImportado.IsEmpty) Then
         Result := True
      Else
         Begin
            QryImportado.Close;
            QryImportado.sql.Clear;
            QryImportado.sql.Add('SELECT H.DATAHISTEMPACOES FROM HISTEMPACOES H');
            QryImportado.sql.Add('WHERE H.DATAHISTEMPACOES =:pDATAHISTEMPACOES ');
            QryImportado.sql.Add('  AND H.NUMCONTRATOCUSTODIA IS NOT NULL '); // Importado
            If Sit = 1 Then // Busca pela data do arquvivo texto
               QryImportado.ParamByName('pDATAHISTEMPACOES').AsString := RegEmpAcoes.sDataOperacao
            Else // Busca pela ultima data importada
               QryImportado.ParamByName('pDATAHISTEMPACOES').AsString := QryDATAOPERACAO.AsString;
            QryImportado.Open;
            If Not (QryImportado.IsEmpty) Then
               Result := True
            Else
               Result := False;
         End;
      QryImportado.Close;
   Finally
      FreeAndNil(QryImportado);
      Screen.Cursor := crDefault;
   End;
End;

Procedure TFrmImportaEmpAcoes.bbtnConfirmarClick(Sender: TObject);
Var
   iMercadoOrig, iMercadoDest: Integer;
   sTabela: String;
   invest, iVenctoReversao: integer;
   DataVenctoAR: TDateTime;
Begin
   If DiaImportado(2) Then
      Begin
         MsgDlg('Movimento já Atualizado para este dia - ' + datetostr(dtpUltMovImport.Date), 'Atenção', mtWarning, [mbOk], 0);
         Exit;
      End;

   lblMensagem.Caption := '';

   If qry.IsEmpty Then
      exit;

   If MsgDlg('Confirma a Atualização definitiva do Movimento Importado ?', 'Atenção', mtConfirmation, [mbYes, mbNo], 0) = mrNo Then
      Abort;

   //Ricardo Cristiano 28/11/2011 - SOL 169307 - Kintana 1501822
   If mmInvest.lines.count > 0 Then
      Begin
         PageControl.ActivePage := TabSheet3;
         If MsgDlg('Existem ações marcadas para serem reprocessadas!' + #13 +
            'O procedimento correto antes de "Atualizar" o movimento de Empréstimo de Ações é acionar ' + #13 +
            'o reprocessamento de ações para evitar situações de divergência de saldos.' + #13 +
            'Deseja continuar com o "Atualizar"?', 'Atenção', mtConfirmation, [mbYes, mbNo], 0) = mrNo Then
            Exit;
      End;

   Try
      Try
         If (Qry.State = dsBrowse) And (Not Qry.IsEmpty) Then
            Begin
               Screen.Cursor := crSQLWait;
               If Not dtmbasedados.dbBaseDados.InTransaction Then
                  dtmbasedados.dbBaseDados.StartTransaction;

               // Buscando na tabela de tipos de operação, a quantidade de dias para o vencimento
               // que será a data de vencimento real no contas a receber
               Query1.Close;
               Query1.Sql.Clear;
               Query1.Sql.Add('SELECT T.VENCIMENTO    ');
               Query1.Sql.Add('FROM TIPOOPERACAO T    ');
               Query1.Sql.Add('WHERE IDTIPOINVEST = 2 ');
               Query1.Sql.Add('  AND T.IDTIPOOPERACAO = -53 ');
               Query1.Open;
               iVenctoReversao := Query1.FieldByName('VENCIMENTO').AsInteger;
               Query1.Close;
               ///

               QryImp := TwwQuery.Create(Nil);
               QryImp.DatabaseName := 'BaseDados';

               QryImpHist := TwwQuery.Create(Nil);
               QryImpHist.DatabaseName := 'BaseDados';

               QryOper := TwwQuery.Create(Nil);
               QryOper.DatabaseName := 'BaseDados';

               QryImp.Close;
               QryImp.SQL.Clear;
               QryImp.RequestLive := True;
               QryImp.Sql.Add('SELECT O.* FROM OPEREMPACOES O WHERE 1=2');
               QryImp.Open;

               QryImpHist.Close;
               QryImpHist.SQL.Clear;
               QryImpHist.RequestLive := True;
               QryImpHist.Sql.Add('SELECT H.* FROM HISTEMPACOES H WHERE 1=2');
               QryImpHist.Open;

               Qry.First;
               prbReproc.Position := 0;
               prbReproc.Max := Qry.RecordCount;
               Application.ProcessMessages;
               lblMensagem.Caption := 'Atualizando as Bases do Empréstimo...';
               fSaldoQtd := 0;
               CtrlEmpAcoes.Plano := -1;
               CtrlEmpAcoes.Planilha := -1;
               CtrlEmpAcoes.Documento := -1;

               // Começa Loop do Movimento Importado e gravado na OPEREMPACOESIMPORTA
               While Not Qry.EOF Do
                  Begin
                     fDiferencaAjuste := 0;
                     fSaldoJuros := 0;

                     prbReproc.StepIt;
                     Application.ProcessMessages;
                     //Paulo Nobre - 27/07/2011 - N. Sol 161867 -  N. Kintana 1371009
      // pnobre
                     Case QryIDTIPOMOVIMENTO.AsInteger Of
                        1, 4, 7, 8, {CONCESSÕES} 2, 3, 6: // REVERSÕES
                           Begin
                              //Paulo Nobre 28/07/2011 - SOL 162187 - Kintana 1376428
                              If QryIDTIPOMOVIMENTO.AsInteger In [2, 3] Then // REVERSÃO PARCIAL OU TOTAL
                                 // Buscando o saldo da quantidade na OPEREMPACOES antes de tudo ou seja de qualquer inserção
                                 fSaldoQtd := BuscaSaldoQtd(QryNUMCONTRATOCUSTODIA.AsInteger);

                              //***************************************
                              // GRAVAR NA OPEREMPACOES
                              //***************************************
                              iIdEmpAcoes := leUltRegistro(Nil, 'OPEREMPACOES');
                              QryImp.Insert;
                              QryImp.FieldByName('IDOPEREMPACOES').AsInteger := iIdEmpAcoes;
                              QryImp.FieldByName('IDCUSTODIANTE').AsInteger := QryIDCUSTODIANTE.AsInteger;
                              QryImp.FieldByName('IDCARTEIRAINVEST').AsInteger := pRPI.IDCARTEMPACOES;
                              QryImp.FieldByName('IDCARTEIRACUSTODIANTE').AsInteger := QryIDCARTEIRAINVEST.AsInteger;
                              QryImp.FieldByName('IDINVESTIMENTO').AsInteger := QryIDINVESTIMENTO.AsInteger;
                              QryImp.FieldByName('IDTIPOINVEST').AsInteger := 2; // Renda Variável
                              QryImp.FieldByName('IDPLANPREVCTBPATR').AsInteger := QryIDPLANPREVCTBPATR.AsInteger;
                              QryImp.FieldByName('NUMCONTRATOCUSTODIA').AsString := QryNUMCONTRATOCUSTODIA.AsString;
                              QryImp.FieldByName('IDCORRETVALORES').AsInteger := QryIDCORRETVALORES.AsInteger;
                              //Paulo Nobre - 27/07/2011 - N. Sol 161867 -  N. Kintana 1371009
                              If QryIDTIPOMOVIMENTO.AsInteger In [1, 4, 2, 3] Then // CONCESSÃO OU REPACTUAÇÃO OU REVERSÃO PARCIAL OU TOTAL
                                 QryImp.FieldByName('TIPOLANCAMENTO').AsString := 'I' // Importado
                              Else If QryIDTIPOMOVIMENTO.AsInteger = 6 Then // REVERSÃO INADIMPLÊNCIA OU CONTRATO PRÉ-DATADO INCLUSA PELO SISTEMA
                                 QryImp.FieldByName('TIPOLANCAMENTO').AsString := 'F'
                              Else If QryIDTIPOMOVIMENTO.AsInteger = 7 Then // CONCESSÃO INADIMPLÊNCIA, CONTRATO PRÉ-DATADO INCLUSA PELO SISTEMA
                                 QryImp.FieldByName('TIPOLANCAMENTO').AsString := 'L'
                                    // pnobre
                              Else If QryIDTIPOMOVIMENTO.AsInteger = 8 Then // CONCESSÃO CONTRATOS PRÉ-DATADO INCLUSA PELO SISTEMA
                                 QryImp.FieldByName('TIPOLANCAMENTO').AsString := 'G';
                              QryImp.FieldByName('DATAVENCOPER').AsString := QryDATAVENCOPER.AsString;
                              QryImp.FieldByName('VLROPERACAO').AsFloat := QryVLROPERACAO.AsFloat;
                              QryImp.FieldByName('VLRRESGATE').AsFloat := QryVLRRECEITABRUTA.asFloat;
                              QryImp.FieldByName('QTDOPERACAO').AsFloat := QryQTDOPERACAO.AsFloat;
                              //Paulo Nobre 05/07/2011 - SOL 160038 - Kintana 1331763
                              QryImp.FieldByName('PUOPERACAO').AsFloat := QryPUOPERACAO.AsFloat;
                              QryImp.FieldByName('TAXAOPERACAO').AsFloat := QryTAXAOPERACAO.AsFloat;
                              QryImp.FieldByName('FLGTIPOCONTA').AsInteger := QryFLGTIPOCONTA.AsInteger;
                              QryImp.FieldByName('TIPOMOVIMENTO').AsInteger := QryIDTIPOMOVIMENTO.AsInteger; // Tipo do movimento
                              //Paulo Nobre - 27/07/2011 - N. Sol 161867 -  N. Kintana 1371009
      // pnobre
                              If QryIDTIPOMOVIMENTO.AsInteger In [1, 4, 7, 8] Then // CONCESSÃO OU REPACTUAÇÃO OU INADIMPLÊNCIA OU CONTRATO PRÉ-DATADO
                                 Begin
                                    If QryFLGTIPOCONTA.AsInteger = 0 Then // CC
                                       QryImp.FieldByName('IDTIPOOPERACAO').AsInteger := -52
                                    Else // CCI
                                       QryImp.FieldByName('IDTIPOOPERACAO').AsInteger := -10052;

                                    QryImp.FieldByName('FLGREVERSAO').AsString := 'N';
                                    QryImp.FieldByName('DATAOPERACAO').AsString := QryDATAOPERACAO.AsString;
                                 End
                                    //Paulo Nobre - 27/07/2011 - N. Sol 161867 -  N. Kintana 1371009
                              Else If QryIDTIPOMOVIMENTO.AsInteger In [2, 3, 6] Then // REVERSÃO PARCIAL OU TOTAL OU Liquidação Financeira
                                 Begin
                                    If QryFLGTIPOCONTA.AsInteger = 0 Then // CC
                                       QryImp.FieldByName('IDTIPOOPERACAO').AsInteger := -53
                                    Else // CCI
                                       QryImp.FieldByName('IDTIPOOPERACAO').AsInteger := -10053;

                                    QryImp.FieldByName('FLGREVERSAO').AsString := 'S'; // Sim
                                    QryImp.FieldByName('DATAOPERACAO').AsString := QryDATAREVERSAO.AsString;

                                    //************************************
                                    // GRAVA CONTABILIZAÇÃO DAS REVERSÕES
                                    //************************************
                                    // Localizando uma data de recebimento em dia útil
                                    DataVenctoAR := VenctoReversaoAR(QryDATAREVERSAO.AsDateTime + iVenctoReversao);

                                    IntegraContabCapCarImporta(
                                       QryIDINVESTIMENTO.AsInteger,
                                       QryImp.FieldByName('IDTIPOOPERACAO').AsInteger,
                                       pRPI.IDCARTEMPACOES,
                                       QryIDPLANPREVCTBPATR.AsInteger,
                                       QryIDCUSTODIANTE.AsInteger,
                                       QryVLRRECEITABRUTA.asFloat,
                                       QryDATAREVERSAO.AsDateTime,
                                       DataVenctoAR,
                                       QryNUMCONTRATOCUSTODIA.AsString);

                                    If ((CtrlEmpAcoes.Planilha > 0) Or (CtrlEmpAcoes.Documento > 0)) Then
                                       Begin
                                          If (CtrlEmpAcoes.Plano > 0) Then
                                             QryImp.FieldByName('PLANO').AsInteger := CtrlEmpAcoes.Plano;

                                          If (CtrlEmpAcoes.Planilha > 0) Then
                                             QryImp.FieldByName('PLNCODIGO').AsInteger := CtrlEmpAcoes.Planilha;

                                          If (CtrlEmpAcoes.Documento > 0) Then
                                             QryImp.FieldByName('CODDOCUMENTO').AsInteger := CtrlEmpAcoes.Documento;
                                       End;
                                    //***************************************
                                    // FIM GRAVA CONTABILIZAÇÃO DAS REVERSÕES
                                    //***************************************
                                 End;

                              QryImp.Post;

                              //***************************************
                              // FIM GRAVA NA OPEREMPACOES
                              //***************************************

                              //***************************************
                              // GRAVAR NA HISTEMPACOES
                              //***************************************
                              //Paulo Nobre - 27/07/2011 - N. Sol 161867 -  N. Kintana 1371009
                              If QryIDTIPOMOVIMENTO.AsInteger In [2, 3, 6] Then // REVERSÃO PARCIAL, TOTAL OU INADIMPLÊNCIA
                                 Begin
                                    //***************************************************************************************************
                                    // (HISTEMPACOES) - GRAVA UM JUROS EXTRA NO DIA DA REVERSÃO, POIS O CUSTODIANTE NÃO ENVIA REGISTRO DE
                                    // JUROS NO DIA DA REVERSÃO. ESTE JUROS ELES EMBUTEM NO VALOR DA REVERSÃO (RECEITA BRUTA).
                                    // Obs. Está sendo gravado aqui, para ficar numa ordem antes do lançamento principal (2, 3, 6)
                                    //***************************************************************************************************
                                    //Paulo Nobre 05/07/2011 - SOL 160038 - Kintana 1331763
                                    GravaJuros('C', // Juros Calculado pelo sistema na Reversão
                                       QryNUMCONTRATOCUSTODIA.AsString,
                                       QryIDCUSTODIANTE.AsInteger,
                                       pRPI.IDCARTEMPACOES,
                                       QryIDCARTEIRAINVEST.AsInteger,
                                       QryIDINVESTIMENTO.AsInteger,
                                       QryIDPLANPREVCTBPATR.AsInteger,
                                       QryIDCORRETVALORES.AsInteger,
                                       QryVLROPERACAO.AsFloat,
                                       QryVLROPERACAO.AsFloat,
                                       QryQTDOPERACAO.AsFloat,
                                       QryQTDOPERACAO.AsFloat,
                                       0, // Ajuste zero
                                       QryDATAOPERACAO.AsDateTime,
                                       QryDATAVENCOPER.AsDateTime);
                                    //******************************************************************************************************
                                    //************************** FIM DA GRAVA JUROS DA REVERSÃO ********************************************
                                    //******************************************************************************************************
                                 End;

                              iIdEmpAcoes := leUltRegistro(Nil, 'HISTEMPACOES');
                              QryImpHist.Insert;
                              QryImpHist.FieldByName('IDHISTEMPACOES').AsInteger := iIdEmpAcoes;
                              QryImpHist.FieldByName('IDCUSTODIANTE').AsInteger := QryIDCUSTODIANTE.AsInteger;
                              QryImpHist.FieldByName('IDCARTEIRAINVEST').AsInteger := pRPI.IDCARTEMPACOES;
                              QryImpHist.FieldByName('IDCARTEIRACUSTODIANTE').AsInteger := QryIDCARTEIRAINVEST.AsInteger;
                              QryImpHist.FieldByName('IDINVESTIMENTO').AsInteger := QryIDINVESTIMENTO.AsInteger;
                              QryImpHist.FieldByName('IDTIPOINVEST').AsInteger := 2; // Renda Variável
                              QryImpHist.FieldByName('IDPLANPREVCTBPATR').AsInteger := QryIDPLANPREVCTBPATR.AsInteger;
                              QryImpHist.FieldByName('NUMCONTRATOCUSTODIA').AsString := QryNUMCONTRATOCUSTODIA.AsString;
                              QryImpHist.FieldByName('IDCORRETVALORES').AsInteger := QryIDCORRETVALORES.AsInteger;
                              //Paulo Nobre - 27/07/2011 - N. Sol 161867 -  N. Kintana 1371009
                              If QryIDTIPOMOVIMENTO.AsInteger In [1, 4, 2, 3] Then // CONCESSÃO OU REPACTUAÇÃO OU REVERSÃO PARCIAL OU TOTAL
                                 QryImpHist.FieldByName('TIPOLANCAMENTO').AsString := 'I' // Importado
                              Else If QryIDTIPOMOVIMENTO.AsInteger = 6 Then // REVERSÃO INADIMPLÊNCIA OU CONTRATO PRÉ-DATADO INCLUSA PELO SISTEMA
                                 QryImpHist.FieldByName('TIPOLANCAMENTO').AsString := 'F'
                              Else If QryIDTIPOMOVIMENTO.AsInteger = 7 Then // CONCESSÃO INADIMPLÊNCIA INCLUSA PELO SISTEMA
                                 QryImpHist.FieldByName('TIPOLANCAMENTO').AsString := 'L'
                                    // pnobre
                              Else If QryIDTIPOMOVIMENTO.AsInteger = 8 Then // CONCESSÃO DE CONTRATO PRÉ-DATADO
                                 QryImpHist.FieldByName('TIPOLANCAMENTO').AsString := 'G';
                              QryImpHist.FieldByName('VLRHISTEMPACOES').AsFloat := QryVLROPERACAO.AsFloat;
                              QryImpHist.FieldByName('QTDHISTEMPACOES').AsFloat := QryQTDOPERACAO.AsFloat;
                              QryImpHist.FieldByName('TIPOMOVIMENTO').AsInteger := QryIDTIPOMOVIMENTO.AsInteger; // Tipo do movimento
                              QryImpHist.FieldByName('SLDHISTEMPACOES').AsFloat := QryVLROPERACAO.AsFloat;
                              //Paulo Nobre - 27/07/2011 - N. Sol 161867 -  N. Kintana 1371009
      // pnobre
                              If QryIDTIPOMOVIMENTO.AsInteger In [1, 4, 7, 8] Then // CONCESSÃO OU REPACTUAÇÃO OU INADIMPLÊNCIA OU CONTRATO PRÉ-DATADO
                                 Begin
                                    If QryFLGTIPOCONTA.AsInteger = 0 Then // CC
                                       QryImpHist.FieldByName('IDTIPOOPERACAO').AsInteger := -52
                                    Else // CCI
                                       QryImpHist.FieldByName('IDTIPOOPERACAO').AsInteger := -10052;

                                    QryImpHist.FieldByName('DATAHISTEMPACOES').AsString := QryDATAOPERACAO.AsString;
                                    //Paulo Nobre - 27/07/2011 - N. Sol 161867 -  N. Kintana 1371009
                                    QryImpHist.FieldByName('SLDQTDHISTEMPACOE').AsFloat := QryQTDOPERACAO.AsFloat;
                                    QryImpHist.FieldByName('VLRJUROSIMPORTA').AsFloat := 0.000000;
                                 End
                                    //Paulo Nobre - 27/07/2011 - N. Sol 161867 -  N. Kintana 1371009
                              Else If QryIDTIPOMOVIMENTO.AsInteger In [2, 3, 6] Then // REVERSÃO PARCIAL OU TOTAL OU REVERSÃO INADIMPLÊNCIA
                                 Begin
                                    If QryFLGTIPOCONTA.AsInteger = 0 Then // CC
                                       QryImpHist.FieldByName('IDTIPOOPERACAO').AsInteger := -53
                                    Else // CCI
                                       QryImpHist.FieldByName('IDTIPOOPERACAO').AsInteger := -10053;

                                    QryImpHist.FieldByName('DATAHISTEMPACOES').AsString := QryDATAREVERSAO.AsString;
                                    //Paulo Nobre - 27/07/2011 - N. Sol 161867 -  N. Kintana 1371009
                                    If QryIDTIPOMOVIMENTO.AsInteger In [2, 3] Then // REVERSÃO PARCIAL OU TOTAL
                                       QryImpHist.FieldByName('SLDQTDHISTEMPACOE').AsFloat := fSaldoQtd - QryQTDOPERACAO.AsFloat
                                    Else // 6 - Reversão somente financeira, quantidade permanece a mesma
                                       QryImpHist.FieldByName('SLDQTDHISTEMPACOE').AsFloat := QryQTDOPERACAO.AsFloat;
                                    // Paulo Nobre - 27/07/2011 - N. Sol 161867 -  N. Kintana 1371009
                                    QryImpHist.FieldByName('VLRJUROSIMPORTA').AsFloat := (QryVLRRECEITABRUTA.asFloat * -1);
                                    // Paulo Nobre - 06/09/2011 - N. Sol 164481 - Kintana 1412774
                                    If (QryIDTIPOMOVIMENTO.AsInteger = 2) And // SE FOR REVERSÃO PARCIAL, E O SALDO DA QUANTIDADE ESTIVER ZERADO
                                    (QryImpHist.FieldByName('SLDQTDHISTEMPACOE').AsFloat = 0) Then
                                       QryImpHist.FieldByName('TIPOMOVIMENTO').AsInteger := 3; // Força a Reversão Total
                                 End;

                              //*****************************************
                              // GRAVA TRANSFERÊNCIAS ENTRE AS CARTEIRAS
                              //*****************************************
                              //Paulo Nobre - 27/07/2011 - N. Sol 161867 -  N. Kintana 1371009
                              If QryIDTIPOMOVIMENTO.AsInteger In [1, 4, 8, 2, 3] Then // Somente para o que for importado
                                 Begin
                                    TransferenciaEntreCarteiras(QryIDTIPOMOVIMENTO.AsInteger,
                                       QryIDCUSTODIANTE.AsInteger,
                                       QryIDCARTEIRAINVEST.AsInteger,
                                       QryIDINVESTIMENTO.AsInteger,
                                       QryIDPLANPREVCTBPATR.AsInteger,
                                       QryFLGTIPOCONTA.AsInteger,
                                       QryIDEMISSOR.AsInteger,
                                       QryDATAOPERACAO.AsDateTime,
                                       QryDATAREVERSAO.AsDateTime,
                                       QryQTDOPERACAO.AsFloat,
                                       QryDESCINVESTIMENTO.AsString);
                                    //*********************************************
                                    // FIM GRAVA TRANSFERÊNCIAS ENTRE AS CARTEIRAS
                                    //*********************************************
                                 End;

                              QryImpHist.Post;

                              //***************************
                              // FIM GRAVA NA HISTEMPACOES
                              //***************************

                              // Paulo Nobre 14/11/2011 - SOL 170566 Kintana 1519133
                              If (QryImpHist.FieldByName('TIPOMOVIMENTO').AsInteger = 3) Then // SE FOR REVERSÃO TOTAL
                                 Begin
                                    fDiferencaAjuste := BuscaSaldoFinanceiroAtual(QryNUMCONTRATOCUSTODIA.AsInteger);

                                    // por exemplo um valor de -0,00848 é insignificante para gravar o ajuste
                                    If (fDiferencaAjuste <> 0) And (RoundCM(abs(fDiferencaAjuste), 2) > 0.00) Then
                                       Begin
                                          //**************************************************************************************
                                          // (HISTEMPACOES) - GRAVA UM JUROS DE AJUSTE (+/-), PARA ACERTAR DIFERENÇAS DE CÁLCULOS
                                          // ENTRE A BOLSA E O CUSTODIANTE E NÃO DAR DIFERENÇAS CONTÁBEIS
                                          //**************************************************************************************
                                          //Paulo Nobre 05/07/2011 - SOL 160038 - Kintana 1331763
                                          GravaJuros('J', // Juros de Ajuste para maior ou menor
                                             QryNUMCONTRATOCUSTODIA.AsString,
                                             QryIDCUSTODIANTE.AsInteger,
                                             pRPI.IDCARTEMPACOES,
                                             QryIDCARTEIRAINVEST.AsInteger,
                                             QryIDINVESTIMENTO.AsInteger,
                                             QryIDPLANPREVCTBPATR.AsInteger,
                                             QryIDCORRETVALORES.AsInteger,
                                             QryVLROPERACAO.AsFloat,
                                             QryVLROPERACAO.AsFloat,
                                             QryQTDOPERACAO.AsFloat,
                                             0, // Quantidade zero
                                             fDiferencaAjuste,
                                             QryDATAOPERACAO.AsDateTime,
                                             QryDATAVENCOPER.AsDateTime);

                                          fDiferencaAjuste := 0;
                                          //*************************************************************************************
                                          //************************* FIM DA GRAVA AJUSTE ***************************************
                                          //*************************************************************************************
                                       End;
                                 End;
                           End;
                        5:
                           Begin
                              //************************************
                              // (HISTEMPACOES) - GRAVA JUROS NORMAL
                              //************************************
                              GravaJuros('I', // Importado Normal
                                 QryNUMCONTRATOCUSTODIA.AsString,
                                 QryIDCUSTODIANTE.AsInteger,
                                 pRPI.IDCARTEMPACOES,
                                 QryIDCARTEIRAINVEST.AsInteger,
                                 QryIDINVESTIMENTO.AsInteger,
                                 QryIDPLANPREVCTBPATR.AsInteger,
                                 QryIDCORRETVALORES.AsInteger,
                                 QryVLROPERACAO.AsFloat,
                                 QryVLROPERACAO.AsFloat,
                                 QryQTDOPERACAO.AsFloat,
                                 QryQTDOPERACAO.AsFloat,
                                 0, // Ajuste zero
                                 QryDATAOPERACAO.AsDateTime,
                                 QryDATAVENCOPER.AsDateTime);
                              //************************************
                              // FIM GRAVA JUROS NORMAL
                              //************************************
                           End;
                     End; // Fim Case

                     // ATUALIZA TABELA OPEREMPACOESIMPORTA COM SITUAÇÃO DE ATUALIZAÇÃO DEFINITIVA = 2
                     ExecutaQuery(QryOper, 'UPDATE OPEREMPACOESIMPORTA SET OPEREMPACOESIMPORTA.FLGSITUACAOIMPORT = 2 ' +
                        'WHERE OPEREMPACOESIMPORTA.IDOPEREMPACOESIMPORTA = ' + QryIDOPEREMPACOESIMPORTA.AsString);
                     QryOper.Close;

                     Qry.Next;
                  End;

               If dtmbasedados.dbBaseDados.InTransaction Then
                  dtmbasedados.dbBaseDados.Commit;

               MsgDlg('Atualização Realizada com Sucesso !', 'Atenção', mtWarning, [mbOk], 0);
               lblMensagem.Caption := '';
               Screen.Cursor := crDefault;
            End;

         bbtnConfirmar.Enabled := False;
         bbtnCancelar.Enabled := False;

      Except
         On E: Exception Do
            Begin
               If dtmbasedados.dbBaseDados.InTransaction Then
                  dtmBaseDados.dbBaseDados.Rollback;

               MsgDlg('Ocorreu um erro ao Atualizar o Movimento.' + #13 + #10 + E.Message + #13 + #10 +
                  'A operação será cancelada.', 'Atenção', mtWarning, [mbOk], 0);

               QryImp.Close;
               QryImpHist.Close;
               QryOper.Close;

               FreeAndNil(QryImp);
               FreeAndNil(QryImpHist);
               FreeAndNil(QryOper);

               bbtnCancelar.Click;

               Exit;
            End;
      End;
   Finally
      qryDataUltimaAtualizacao.Open;
      qryDataUltimaAtualizacao.Close;
      prbReproc.Position := 0;
      lblMensagem.Caption := '';

      QryImp.Close;
      QryImpHist.Close;
      QryOper.Close;

      FreeAndNil(QryImp);
      FreeAndNil(QryImpHist);
      FreeAndNil(QryOper);
   End;
End;

Procedure TFrmImportaEmpAcoes.bbtnCancelarClick(Sender: TObject);
Begin
   Inherited;

   Qry.Close;

   bbtnConfirmar.Enabled := False;
   bbtExcluir.Enabled := False;
   bbtnCancelar.Enabled := Not (Qry.IsEmpty);
   prbReproc.Position := 0;

   //Ricardo Cristiano 28/11/2011 - SOL 169307 - Kintana 1501822
   mmInvest.lines.clear;
   PageControl.Pages[2].TabVisible := False;

   Screen.Cursor := crDefault;
End;

Procedure TFrmImportaEmpAcoes.FormCreate(Sender: TObject);
Begin
   Inherited;
   CtrlEmpAcoes := TCtrlEmpAcoes.Create;
   CtrlEmpAcoes.InitializeAs(Padroes);
End;

Procedure TFrmImportaEmpAcoes.FormDestroy(Sender: TObject);
Begin
   Inherited;
   FreeAndNil(CtrlEmpAcoes);
End;

Function TFrmImportaEmpAcoes.TestaPeriodo(sData: String): Boolean;
Begin
   Try
      Result := True;
      StrToDate(sData);
   Except
      Result := False;
   End;
End;

Function TFrmImportaEmpAcoes.RetornaTipoConta(iCodContaInvestimento, iCodCustodiantePlano: integer): String;
Var QryAux: TwwQuery;
Begin
   result := '0'; // CC
   QryAux := TwwQuery.Create(Nil);
   QryAux.DataBaseName := 'BaseDados';
   QryAux.Close;
   QryAux.sql.Clear;
   QryAux.sql.Add('SELECT nvl(c.idtipooperacaoVenda,0) idtipooperacaoVenda ');
   QryAux.sql.Add('FROM custodianteplano C');
   QryAux.sql.Add('where C.CodigoCustodiante = ' + IntTostr(iCodCustodiantePlano));
   QryAux.sql.Add('      AND C.CodigoContaInvestimento = ' + IntTostr(iCodContaInvestimento));
   QryAux.Open;
   If QryAux.RecordCount > 0 Then
      Begin
         If (QryAux.FieldByName('idTipoOperacaoVenda').isNull) Or
            (QryAux.FieldByName('idTipoOperacaoVenda').asInteger = 65) Then
            result := '1' // Conta Investimento - qtd nova - CCI
         Else
            result := '0'; // Conta Normal - qtd antiga - CC  (idTipoOperacaoVenda = 2)
      End;
   QryAux.Close;
End;

Procedure TFrmImportaEmpAcoes.bbtExcluirClick(Sender: TObject);
Begin
   If DiaImportado(2) Then
      Begin
         MsgDlg('Movimento já Transferido para este dia - ' + datetostr(dtpUltMovImport.Date) + '. Exclua as Operações deste dia !', 'Atenção', mtWarning, [mbOk], 0);
         Exit;
      End;

   If MsgDlg('Confirma Exclusão do Movimento Importado para este dia - ' + datetostr(dtpUltMovImport.Date) + ' ? ', 'Atenção !', mtConfirmation, [mbYes, mbNo], 0) = mrNo Then
      Exit;

   lblMensagem.Caption := '';
   Screen.Cursor := crSQLWait;

   If Not dtmbasedados.dbBaseDados.InTransaction Then
      dtmbasedados.dbBaseDados.StartTransaction;

   ExecutaQuery(Query1, 'DELETE OPEREMPACOESIMPORTA WHERE DATAOPERACAO = ' + quotedstr(datetostr(dtpUltMovImport.Date)));
   Query1.Close;

   dtmbasedados.dbBaseDados.Commit;

   Qry.Close;
   Qry.ParamByName('DATAOPERACAO').AsString := datetostr(dtpUltMovImport.Date);
   Qry.Open;
   Screen.Cursor := crDefault;

   bbtnCancelarClick(self);

   AtuUltimaDataImportacao;
   spbLocalizaUltMovClick(Self);
End;

Procedure TFrmImportaEmpAcoes.GravaJuros(Tipo, NumContrato: String; idcustodiante, idcartempacoes, idcartinvest,
   idinvest, idplanopatro, idcorret: Integer;
   valor, sldvalor, qtd, sldqtd, DifAjuste: Double;
   DataOper, DataVencto: TDateTime);
Var fVlrJurosImporta: Double;
Begin
   fVlrJurosImporta := 0.00;
   fSaldoJuros := 0.00;

   iIdEmpAcoes := leUltRegistro(Nil, 'HISTEMPACOES');
   QryImpHist.Insert;
   QryImpHist.FieldByName('IDHISTEMPACOES').AsInteger := iIdEmpAcoes;
   QryImpHist.FieldByName('IDCUSTODIANTE').AsInteger := idcustodiante;
   QryImpHist.FieldByName('IDCARTEIRAINVEST').AsInteger := idcartempacoes;
   QryImpHist.FieldByName('IDCARTEIRACUSTODIANTE').AsInteger := idcartinvest;
   QryImpHist.FieldByName('IDINVESTIMENTO').AsInteger := idinvest;
   QryImpHist.FieldByName('IDTIPOINVEST').AsInteger := 2; // Renda Variável
   QryImpHist.FieldByName('IDPLANPREVCTBPATR').AsInteger := idplanopatro;
   QryImpHist.FieldByName('IDCORRETVALORES').AsInteger := idcorret;
   QryImpHist.FieldByName('IDTIPOOPERACAO').AsInteger := -54; // Juros
   QryImpHist.FieldByName('DATAHISTEMPACOES').AsDateTime := DataOper;
   QryImpHist.FieldByName('NUMCONTRATOCUSTODIA').AsString := NumContrato;
   QryImpHist.FieldByName('VLRHISTEMPACOES').AsFloat := valor;
   QryImpHist.FieldByName('SLDHISTEMPACOES').AsFloat := sldvalor;
   QryImpHist.FieldByName('QTDHISTEMPACOES').AsFloat := qtd;
   QryImpHist.FieldByName('SLDQTDHISTEMPACOE').AsFloat := sldqtd;
   QryImpHist.FieldByName('TIPOMOVIMENTO').AsInteger := 5; // Juros
   QryImpHist.FieldByName('TIPOLANCAMENTO').AsString := Tipo; // (I ou J ou C) - Importado, Juros de Ajuste ou Juros Calculado na Reversão

   If Tipo = 'I' Then // Juros Importado
      QryImpHist.FieldByName('VLRJUROSIMPORTA').AsFloat := QryVLRJUROS.AsFloat;

   // Paulo Nobre 05/07/2011 - SOL 160038 - Kintana 1331763
   // Paulo Nobre 21/07/2011 - SOL 161791  Kintana 1369052
   If Tipo = 'J' Then // // Juros de Ajuste para maior ou menor
      QryImpHist.FieldByName('VLRJUROSIMPORTA').AsFloat := DifAjuste;

   //Paulo Nobre 05/07/2011 - SOL 160038 - Kintana 1331763
   If Tipo = 'C' Then // Juros Calculado pelo sistema na Reversão
      Begin
         // Calcula o juros de um 1 dia
         jJurosDia := 0.00;
         jJurosDia := CalculaJurosDiario(QryVLROPERACAO.AsFloat, QryTAXAOPERACAO.AsFloat, 1);
         QryImpHist.FieldByName('VLRJUROSIMPORTA').AsFloat := jJurosDia;
      End;

   fVlrJurosImporta := QryImpHist.FieldByName('VLRJUROSIMPORTA').AsFloat;

   //*******************************
   // GRAVA CONTABILIZAÇÃO DO JUROS
   //*******************************
   IntegraContabCapCarImporta(idinvest,
      -54,
      idcartempacoes,
      idplanopatro,
      idcustodiante,
      fVlrJurosImporta,
      DataOper,
      DataVencto,
      NumContrato);
   //***********************************
   // FIM GRAVA CONTABILIZAÇÃO DO JUROS
   //***********************************

   If (CtrlEmpAcoes.Planilha > 0) Then
      Begin
         If (CtrlEmpAcoes.Plano > 0) Then
            QryImpHist.FieldByName('PLANO').AsInteger := CtrlEmpAcoes.Plano;

         If (CtrlEmpAcoes.Planilha > 0) Then
            QryImpHist.FieldByName('PLNCODIGO').AsInteger := CtrlEmpAcoes.Planilha;
      End;

   QryImpHist.Post;
End;

Procedure TFrmImportaEmpAcoes.IntegraContabCapCarImporta(invest, tipooper, cartempacoes, planopatro, custodiante: Integer;
   fVlrJurosImporta: Double; DataOper, DataVencto: TDateTime; NumContrato: String);
Begin
   If Not CtrlEmpAcoes.IntegraContabCapCar(invest,
      tipooper,
      cartempacoes,
      planopatro,
      custodiante,
      -1,
      fVlrJurosImporta,
      0.00,
      DataOper,
      DataVencto,
      1,
      NumContrato) Then
      Raise Exception.Create('Não foi possível Contabilizar o Juros' + #13 + 'Mensagem: ' + CtrlEmpAcoes.MessageInfo);
End;

Function TFrmImportaEmpAcoes.BuscaSaldoFinanceiroAtual(iNumContrato: Integer): Double;
Var QryJuros: TwwQuery;
Begin
   Try
      Result := 0;
      QryJuros := TwwQuery.Create(Nil);
      QryJuros.DataBaseName := 'BaseDados';
      QryJuros.Close;
      QryJuros.sql.Clear;
      QryJuros.Sql.Add('SELECT SUM(NVL(VLRJUROSIMPORTA, 0)) AS SALDOATUAL'); // Soma aritmética dos valores importados (+ / -)
      QryJuros.Sql.Add('FROM HISTEMPACOES ');
      QryJuros.Sql.Add('WHERE NUMCONTRATOCUSTODIA = ' + IntToStr(iNumContrato));
      QryJuros.Open;
      If Not (QryJuros.IsEmpty) Then
         Begin
            // SOL 171022   KTN 1528923 - Paulo Nobre
            // O Valor do Juros de Ajuste a ser lançado, sempre será com o sinal trocado para poder zerar o Contrato
            Result := QryJuros.FieldByName('SALDOATUAL').AsFloat * -1;
         End;
      QryJuros.Close;
   Finally
      FreeAndNil(QryJuros);
   End;
End;

//Paulo Nobre 05/07/2011 - SOL 160038 - Kintana 1331763

Function TFrmImportaEmpAcoes.CalculaJurosDiario(fVlOperacao, fTaxa: Double; iQtdDias: Integer): Double;
Begin
   // Achando o Juros Diário (pró-rata) - Fórmula usada pelo mercado financeiro para calcular a remuneração diária de ações emprestadas
   Result := RoundCM(fVlOperacao * (Power((1 + (fTaxa / 100)), (iQtdDias / 252)) - 1), 6);
End;

Function TFrmImportaEmpAcoes.BuscaSaldoQtd(iNumContrato: Integer): Double;
Var
   QryQtd: TwwQuery;
Begin
   Try
      Result := 0;
      QryQtd := TwwQuery.Create(Nil);
      QryQtd.DataBaseName := 'BaseDados';
      QryQtd.Close;
      QryQtd.Sql.Clear;
      //Paulo Nobre - 27/07/2011 - N. Sol 161867 -  N. Kintana 1371009
      //Paulo Nobre 05/07/2011 - SOL 160038 - Kintana 1331763
      QryQtd.Sql.Add('SELECT SUM(                                                                ');
      QryQtd.Sql.Add('       CASE                                                                ');
      QryQtd.Sql.Add('          WHEN O.TIPOMOVIMENTO IN (1, 4, 7, 8) THEN                        ');
      QryQtd.Sql.Add('             O.QTDOPERACAO                                                 ');
      //Paulo Nobre 28/07/2011 - SOL 162187 - Kintana 1376428
      QryQtd.Sql.Add('          WHEN O.TIPOMOVIMENTO IN (2, 3, 6) THEN                           ');
      QryQtd.Sql.Add('             O.QTDOPERACAO * -1                                            ');
      QryQtd.Sql.Add('       END ) AS SALDO_QTD                                                  ');
      QryQtd.Sql.Add('FROM OPEREMPACOES O  ');
      QryQtd.Sql.Add('WHERE O.NUMCONTRATOCUSTODIA = ' + IntToStr(iNumContrato));
      QryQtd.Open;
      If Not (QryQtd.IsEmpty) Then
         Result := QryQtd.FieldByName('SALDO_QTD').AsFloat;
      QryQtd.Close;
   Finally
      FreeAndNil(QryQtd);
   End;
End;

Procedure TFrmImportaEmpAcoes.TransferenciaEntreCarteiras(TipoMov, idcustodiante, idcartinvest, idinvest, idplanopatro, tipoconta, emissor: Integer;
   DataOper, DataRever: Tdatetime; qtd: Double; descinvest: String);
Var iMercadoOrig, iMercadoDest: Integer;
Begin
   // Transferência entre as Carteiras
   QryCarteira.Close;
   QryCarteira.ParamByName('IDCARTEIRAINVEST').AsInteger := OperComum.IIF((TipoMov In [1, 4, 8]), pRPI.IDCARTEMPACOES, QryIDCARTEIRAINVEST.AsInteger);
   QryCarteira.Open;
   iMercadoOrig := QryCarteira.FieldByName('IDMERCADO').AsInteger; // Qualquer uma das Carteiras Ativas

   QryCarteira.Close;
   QryCarteira.ParamByName('IDCARTEIRAINVEST').AsInteger := OperComum.IIF((TipoMov In [1, 4, 8]), QryIDCARTEIRAINVEST.AsInteger, pRPI.IDCARTEMPACOES);
   QryCarteira.Open;
   iMercadoDest := QryCarteira.FieldByName('IDMERCADO').AsInteger; // Carteira de Empréstimo

   QryCarteira.Close;

   If Not OperComum.ProcessaTransfCarteira(
      OperComum.IIF((TipoMov In [1, 4, 8]), idcartinvest, pRPI.IDCARTEMPACOES),
      OperComum.IIF((TipoMov In [1, 4, 8]), pRPI.IDCARTEMPACOES, idcartinvest),
      QryIDEMISSOR.AsInteger,
      idinvest,
      idcustodiante,
      idcustodiante,
      OperComum.IIF((TipoMov In [1, 4, 8]), -1, pRPI.IDMOTBLOQEMPAC),
      OperComum.IIF((TipoMov In [1, 4, 8]), pRPI.IDMOTBLOQEMPAC, -1),
      iMercadoOrig,
      iMercadoDest,
      idplanopatro,
      tipoconta,
      descinvest,
      qtd,
      OperComum.IIF((TipoMov In [1, 4, 8]), DataOper, DataRever)) Then
      Raise Exception.Create('Por favor verificar o problema, a Trasnsferência não será confirmada !');
End;

//Paulo Nobre 28/07/2011 - SOL 162187 - Kintana 1376428

Function TFrmImportaEmpAcoes.VerificaExistenciaDeReversao(sNumContratoCustodiante, sDataOper: String): Boolean;
Var QryAux: TwwQuery;
Begin
   Screen.Cursor := crSQLWait;
   QryAux := TwwQuery.Create(Nil);
   QryAux.DatabaseName := 'BaseDados';
   QryAux.Close;
   QryAux.SQL.Clear;
   QryAux.SQL.Add('SELECT O.NUMCONTRATOCUSTODIA   ');
   QryAux.SQL.Add('FROM OPEREMPACOESIMPORTA O     ');
   QryAux.SQL.Add('WHERE TRIM(O.NUMCONTRATOCUSTODIA) = ' + QuotedStr(Trim(sNumContratoCustodiante)));
   QryAux.SQL.Add('      AND O.DATAOPERACAO = ' + QuotedStr(sDataOper));
   QryAux.SQL.Add('      AND O.TIPOMOVIMENTO IN (3, 6) '); // Reversão Total e Liquidação Financeira
   QryAux.Open;
   result := QryAux.RecordCount > 0;

   QryAux.Close;
   Screen.Cursor := crDefault;

   FreeAndNil(QryAux);
End;

//******************************************************************************************************
// ROTINAS "AUXILIARES" PARA ACERTO DE DIFERENÇAS ENCONTRADAS NO SALDO DOS CONTRATOS APÓS O ENCERRAMENTO
//******************************************************************************************************

Procedure TFrmImportaEmpAcoes.Button1Click(Sender: TObject);
Begin
   Inherited;
   // Auxilio 2
   dtmBaseDados.dbBaseDados.StartTransaction;
   Qry01.ExecSQL;
   dtmBaseDados.dbBaseDados.Commit;
End;

Procedure TFrmImportaEmpAcoes.Button2Click(Sender: TObject);
Var Saldo: Double;
   Arquivo: TStringList;
   i: integer;
   sLinha: String;
   sDelimitador: String;
Begin
   QryImpHist := TwwQuery.Create(Nil);
   QryImpHist.DatabaseName := 'BaseDados';

   sDelimitador := ';';
   Arquivo := TStringList.Create();
   Arquivo.LoadFromFile('C:\PLANUS\TEMP\ajuste.csv');

   // Auxilio 1
   dtmBaseDados.dbBaseDados.StartTransaction;
   // Loop Principal da Importacao
   For i := 1 To Arquivo.Count - 1 Do
      Begin
         sLinha := Arquivo.Strings[i];
         //Numero contrato custodiante
         RegEmpAcoes.sContratoCustodiante := ExtraiTexto(sLinha, sDelimitador);
         //Valor Juros
         RegEmpAcoes.fJuros := StrToFloat(TrocaPontoVirgula(ExtraiTexto(sLinha, sDelimitador)));

         QryImpHist.Close;
         QryImpHist.SQL.Clear;
         QryImpHist.RequestLive := True;
         QryImpHist.Sql.Add('SELECT * FROM HISTEMPACOES WHERE 1 = 2');
         QryImpHist.Open;

         Query4.Close;
         Query4.Sql.Clear;
         Query4.Sql.Add('SELECT *                     ');
         Query4.Sql.Add('FROM HISTEMPACOES             ');
         Query4.Sql.Add('WHERE NUMCONTRATOCUSTODIA = ' + RegEmpAcoes.sContratoCustodiante);
         Query4.Sql.Add('AND TIPOMOVIMENTO IN (1, 4, 8)');
         Query4.Open;
         If Not Query4.IsEmpty Then
            Begin
               iIdEmpAcoes := leUltRegistro(Nil, 'HISTEMPACOES');
               QryImpHist.Insert;
               QryImpHist.FieldByName('IDHISTEMPACOES').AsInteger := iIdEmpAcoes;
               QryImpHist.FieldByName('IDCUSTODIANTE').AsInteger := Query4.fieldbyname('IDCUSTODIANTE').AsInteger;
               QryImpHist.FieldByName('IDCARTEIRAINVEST').AsInteger := Query4.fieldbyname('IDCARTEIRAINVEST').AsInteger;
               QryImpHist.FieldByName('IDCARTEIRACUSTODIANTE').AsInteger := Query4.fieldbyname('IDCARTEIRACUSTODIANTE').AsInteger;
               QryImpHist.FieldByName('IDINVESTIMENTO').AsInteger := Query4.fieldbyname('IDINVESTIMENTO').AsInteger;
               QryImpHist.FieldByName('IDTIPOINVEST').AsInteger := 2; // Renda Variável
               QryImpHist.FieldByName('IDPLANPREVCTBPATR').AsInteger := Query4.fieldbyname('IDPLANPREVCTBPATR').AsInteger;
               QryImpHist.FieldByName('IDCORRETVALORES').AsInteger := Query4.fieldbyname('IDCORRETVALORES').AsInteger;
               QryImpHist.FieldByName('IDTIPOOPERACAO').AsInteger := -54; // Juros
               QryImpHist.FieldByName('DATAHISTEMPACOES').AsDateTime := STRTODATE('02/01/2012');
               QryImpHist.FieldByName('NUMCONTRATOCUSTODIA').AsString := Query4.fieldbyname('NUMCONTRATOCUSTODIA').asString;
               QryImpHist.FieldByName('VLRHISTEMPACOES').AsFloat := Query4.fieldbyname('VLRHISTEMPACOES').AsFloat;
               QryImpHist.FieldByName('SLDHISTEMPACOES').AsFloat := Query4.fieldbyname('SLDHISTEMPACOES').AsFloat;
               QryImpHist.FieldByName('QTDHISTEMPACOES').AsFloat := Query4.fieldbyname('QTDHISTEMPACOES').AsFloat;
               QryImpHist.FieldByName('SLDQTDHISTEMPACOE').AsFloat := 0;
               QryImpHist.FieldByName('TIPOMOVIMENTO').AsInteger := 5; // Juros
               QryImpHist.FieldByName('TIPOLANCAMENTO').AsString := 'Z'; // ACERTO SISTEMA
               QryImpHist.fieldbyname('VLRJUROSIMPORTA').asFloat := RegEmpAcoes.fJuros;
               QryImpHist.Post;
            End;
      End;

   dtmBaseDados.dbBaseDados.Commit;
   FreeAndNil(QryImpHist);
End;

// ************************************************************************************************************************************

End.

