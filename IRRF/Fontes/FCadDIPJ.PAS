{$A+,B-,C+,D+,E-,F-,G+,H+,I+,J+,K-,L+,M-,N+,O+,P+,Q-,R-,S-,T-,U-,V+,W-,X+,Y+,Z1}
{$MINSTACKSIZE $00004000}
{$MAXSTACKSIZE $00100000}
{$IMAGEBASE $00400000}
{$APPTYPE GUI}
//*******************************************************************************************************
//N. Sol..........: SOL 209775 e SOL 233732
//N. Kintana......: Kintana 2024254 e 233732
//Data............: 17/06/2014
//Responsável.....: Fernando Xavier
//Descrição.......: Na geração do arquivo da DIPJ está com erro ao gerar os campos.
//*******************************************************************************************************
//N. Sol..........: 231060
//N. PPM..........: 377414
//Data............: 08/05/2014
//Responsável.....: Paulo Nobre
//Descrição.......: Todos os registros: Correção p/ uma nova definição para o campo sAnoCalendario
//                  Registro R01: Inclusão novo campo sOptanteEfeitoMP627
//                  Demais Registros : Aumento do tamanho do campo de telefone e fax de 8 p/ 9
//*******************************************************************************************************
//N. Sol..........: SOL 208941
//N. Kintana......: Kintana 2020125
//Data............: 14/06/2013
//Responsável.....: Thiago Melo
//Descrição.......: A funcionalidade de geração do arquivo txt da DIPJ não está funcionando
//*******************************************************************************************************
//N. Sol..........: SOL 126124 / SOL 126125
//N. Kintana......: KTN 656907 / KTN 656908
//Data............: 29/05/2012
//Responsável.....: Arnaldo Scarin
//Revisão.........: Paulo Nobre
//Descrição.......: Cadastro DACON / DIPJ
//*******************************************************************************************************
Unit FCadDIPJ;

Interface

Uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   StdCtrls, Buttons, Grids, DBGrids, DBCtrls, ComCtrls, ExtCtrls, filectrl,
   FSairAjuda, IvDictio, IvMulti, IvEMulti, MAHlpBtn, TB97Tlbr, TB97,
   MontaSelect, Mask, MskEdDlg, uMensErro, uSistema, Db, Wwdatsrc, DBClient,
   uCMClientDataSet, uCmSqlParams, Wwdbigrd, Wwdbgrid,
   uCtrlDaconMT, uCtrlNormaVigente, uCtrlParametrosRelatorio, uCtrlLinhaRelatorio,
   wwdblook, uCtrlTipoRelatorio, uCmControlObject, DBTables, Wwquery,
   wwdbedit, Wwdotdot, Wwdbcomb;

Const MSG001 = 'Existe relatório gerado para o período %s gerado sem o número do recibo. Favor verificar e regularizar a situação.'; // Ok
Const MSG002 = 'Um relatório para o %s foi encontrado sem número do recibo informado.'; // Ok
Const MSG003 = 'Para geração dos Demonstrativos, os campos ano do exercício e ao mês são de preenchimento obrigatório !'; // Ok
Const MSG004 = 'Não foram encontrados lançamentos contábeis para o período informado. Relatório não pôde ser gerado.'; // Ok
Const MSG005 = 'Existe um relatório gerado para o período informado sem número de recibo.' + #13 + 'Excluí este relatório para a geração do novo ?'; // Sim, Nao
Const MSG006 = 'Já existe um relatório gerado e enviado, um novo relatório será gerado do tipo Retificador. Confirma?'; // Ok
Const MSG007 = 'A norma vigente é diferente da norma utilizada na geração do relatório que está sendo retificado. Deseja usar a norma vigente? Selecione a opção Não para gerar o relatório retificador com a norma do relatório que está sendo retificado.'; //  <SIM><NÃO>
Const MSG008 = 'Para geração do arquivo, é obrigatório a seleção de um relatório.'; // <OK>
Const MSG009 = 'Não foi possível gerar o arquivo. O sistema não encontrou os dados complementares.'; // <OK>
Const MSG010 = 'Foi encontrado arquivo gerado para este relatório. Deseja substituir?'; //  <SIM> <NÃO>
Const MSG011 = 'Arquivo gerado com sucesso no caminho %s.'; //  <OK>
Const MSG012 = 'Não existe relatório <opção Anterior ou Posterior> ao relatório corrente.'; // OK.
Const MSG013 = 'Não é possível excluir relatórios com número de recibo informado.'; // <OK>
Const MSG014 = 'Confirma exclusão para o relatório selecionado ?'; // <SIM><NÃO>.
Const MSG015 = 'O número de recibo informado já encontra-se registrado para outro relatório. Não é possível registrar dois relatórios com o mesmo número de recibo.'; // <OK>
Const MSG016 = 'O número do recibo informado já está sendo usado como número retificador. Não é permitido que dois relatórios tenham o mesmo número de recibo retificador.'; // <OK>
Const MSG017 = 'Número do recibo gravado com sucesso !'; // <OK>
Const MSG018 = 'Confirma gravação do novo valor para a conta contábil %s?'; // <SIM><Não>.
Const MSG019 = 'Não foi Localizado Movimento para o Exercício e Período informado !'; // pnobre
Const MSG020 = 'Para geração dos Demonstrativos, o campo ano do exercício é obrigatório !'; // Ok
Const MSG021 = 'Não foi Localizado Movimento para o Exercício informado !'; // pnobre
Const MSG022 = 'Deseja excluir esta DIPJ ?';
Const MSG023 = 'Já existe um Número de Recibo para esta DIPJ. Deseja inserir um Número de Recibo Retificador?';
Const MSG024 = 'Não existe informações para inserir o número do recibo. Por favor, gere uma DIPJ ou pesquise uma DIPJ existente.';
Const MSG025 = 'Favor preencher o número do Recibo e a data do mesmo.';
Const MSG026 = 'Atualização realizada com sucesso !.';
Const MSG027 = 'Existem ainda na Aba Rendimentos pessoas sem a classificação da Receita Federal. Verifique por favor!';
Const MSG028 = 'Favor preencher o ano do Exercício.';
Const MSG029 = 'Favor Selecionar ou Gerar uma DIPJ antes de gravar o número de recibo e data da mesma.';
Const MSG030 = 'Número do recibo incluido com sucesso.';
Const MSG031 = 'O número do recibo não foi incluido, repita a operação.';
Const MSG032 = 'Erro ao atualizar os valores, repita a operação.';

Type
   TfrmCadDIPJ = Class(TfrmSairAjuda)
      Panel1: TPanel;
      CMSqllAnalitico: TCMSqlParams;
      cdsSintetico: TCMClientDataSet;
      dsSintetico: TwwDataSource;
      cdsAnalitico: TCMClientDataSet;
      dsAnalitico: TwwDataSource;
      cdsInfoAdic: TCMClientDataSet;
      cdsDadosRelatorio: TCMClientDataSet;
      cdsListaLinhas: TCMClientDataSet;
      dsListaLinhas: TwwDataSource;
      CMSqlSintetico: TCMSqlParams;
      gbFiltros: TGroupBox;
      sbtnProcurar: TSpeedButton;
      Label7: TLabel;
      edExercicio: TEdit;
      sbtnGeraDacon: TSpeedButton;
      sbtnGeraArquivo: TSpeedButton;
      sbtnExcluiDacon: TSpeedButton;
      pgDados: TPageControl;
      tbSintetico: TTabSheet;
      Panel4: TPanel;
      dbGridSintetico: TwwDBGrid;
      tbAnalitico: TTabSheet;
      Panel6: TPanel;
      lblLinhas: TLabel;
      lblContaContabil: TLabel;
      edContaContabil: TMaskEdit;
      cbxLinha: TComboBox;
      Panel7: TPanel;
      lblDebito: TLabel;
      lblCredito: TLabel;
      btnAtualizar: TBitBtn;
      edDebito: TEdit;
      edCredito: TEdit;
      dbGridAnalitico: TwwDBGrid;
      tbInfoAdic: TTabSheet;
      Panel8: TPanel;
      gbRepresentante: TGroupBox;
      Label1: TLabel;
      Label2: TLabel;
      Label3: TLabel;
      lblNomeRepre: TLabel;
      lblTelefoneRepre: TLabel;
      lblCorreio1Repre: TLabel;
      Label9: TLabel;
      lblRamalRepre: TLabel;
      Label11: TLabel;
      lblCpfRepre: TLabel;
      lblFaxRepre: TLabel;
      lblCorreio2Repre: TLabel;
      Label16: TLabel;
      Label18: TLabel;
      gbPessoaJuridica: TGroupBox;
      Label12: TLabel;
      lblCNPJ: TLabel;
      Label17: TLabel;
      lblNomeEmpresarial: TLabel;
      gbResponsavel: TGroupBox;
      Label33: TLabel;
      lblNomeResp: TLabel;
      Label35: TLabel;
      lblCpfResp: TLabel;
      Label37: TLabel;
      lblTelefoneResp: TLabel;
      Label39: TLabel;
      lblRamalResp: TLabel;
      Label41: TLabel;
      lblCorreio1Resp: TLabel;
      Label43: TLabel;
      lblCorreio2Resp: TLabel;
      Label45: TLabel;
      lblFaxResp: TLabel;
      cdsFiltroTipo: TCMClientDataSet;
      dsFiltroTipo: TwwDataSource;
      CMSqlParams1: TCMSqlParams;
      cdsFiltroTipoIDTIPO: TFloatField;
      cdsFiltroTipoDESCRICAO: TStringField;
      rgTipo: TRadioGroup;
      tbRendimentos: TTabSheet;
      Panel2: TPanel;
      dbGridRendimentos: TwwDBGrid;
      cdsGridRendimentos: TCMClientDataSet;
      dsGridRendimentos: TwwDataSource;
      CMSqlParamsRendimentos: TCMSqlParams;
      cdsSinteticoCODLINHA: TStringField;
      cdsSinteticoDESCRICAOLINHA: TStringField;
      cdsSinteticoCATEGORIA: TStringField;
      cdsSinteticoTOTAL: TFloatField;
      cdsAnaliticoPLANOCONTA: TStringField;
      cdsAnaliticoPLANONOME: TStringField;
      cdsAnaliticoDEBITO: TFloatField;
      cdsAnaliticoCREDITO: TFloatField;
      cdsAnaliticoTOTAL: TFloatField;
      lblTotalAtivo: TLabel;
      lblTotalPassivo: TLabel;
      lblResultado: TLabel;
      edTotalAtivo: TMaskEdit;
      edTotalPassivo: TMaskEdit;
      edResultado: TMaskEdit;
      tbInfoPrevSint: TTabSheet;
      Panel5: TPanel;
      btnGravar: TBitBtn;
      lblNumRecibo: TLabel;
      lblReciboSintetico: TLabel;
      Label4: TLabel;
      Panel3: TPanel;
      cdsGridRendimentosCPF: TStringField;
      cdsGridRendimentosNOME: TStringField;
      cdsGridRendimentosCARGO: TStringField;
      cdsGridRendimentosIRRF: TFloatField;
      cdsGridRendimentosRENDIMENTO: TFloatField;
      dsInfPrev: TwwDataSource;
      cdsInfPrev: TCMClientDataSet;
      FloatField2: TFloatField;
      qryAuxI: TwwQuery;
      edNumRecibo: TMaskEdit;
      edReciboSintetico: TMaskEdit;
      Label5: TLabel;
      edDataRecibo: TDateTimePicker;
      GroupBox1: TGroupBox;
      Label6: TLabel;
      Label8: TLabel;
      edQtdEmprIniPer: TEdit;
      edQtdEmprFimPer: TEdit;
      edNumReciboPesq: TMaskEdit;
      Label10: TLabel;
      edDtRecIni: TEdit;
      CMSqlInfPrev: TCMSqlParams;
      dbGridInfPrev: TwwDBGrid;
      cdsPrevCompl: TCMClientDataSet;
      cdsInfPrevCODLINHA: TStringField;
      cdsInfPrevDESCRICAOLINHA: TStringField;
      Label13: TLabel;
      Label14: TLabel;
      Label15: TLabel;
      btnChangeCodRF: TBitBtn;
      cbListQualfRF: TComboBox;
      cdsGridRendimentosDESCRICAORF: TStringField;
      edNomeDir: TEdit;
      edCPFDir: TMaskEdit;
      Label19: TLabel;
      edCargoDir: TEdit;
      cdsGridRendimentosCODQUALIRF: TFloatField;
      cdsPrevTot: TCMClientDataSet;
      cdsSinteticoAnoAnt: TCMClientDataSet;
      edSeq: TEdit;
      cdsGridRendimentosIDSEQ: TFloatField;
      cdsRendimentosDB: TCMClientDataSet;
      cdsRendimentosEDI: TCMClientDataSet;
      qryHlp: TCMSqlParams;
      Procedure sbtnGeraArquivoClick(Sender: TObject);
      Procedure sbtnGeraDaconClick(Sender: TObject);
      Procedure sbtnExcluiDaconClick(Sender: TObject);
      Procedure sbtnProcurarClick(Sender: TObject);
      Procedure FormCreate(Sender: TObject);
      Procedure FormClose(Sender: TObject; Var Action: TCloseAction);
      Procedure edContaContabilChange(Sender: TObject);
      Procedure pgDadosChange(Sender: TObject);
      Procedure cdsAnaliticoAfterScroll(DataSet: TDataSet);
      Procedure btnAtualizarClick(Sender: TObject);
      Procedure cbxLinhasClick(Sender: TObject);
      Procedure dbGridAnaliticoDrawDataCell(Sender: TObject;
         Const Rect: TRect; Field: TField; State: TGridDrawState);
      Procedure FormShow(Sender: TObject);
      Procedure btnGravarClick(Sender: TObject);
      Procedure dbGridAnaliticoCalcCellColors(Sender: TObject; Field: TField;
         State: TGridDrawState; Highlight: Boolean; AFont: TFont;
         ABrush: TBrush);
      Procedure rgTipoClick(Sender: TObject);
      Procedure dbGridSinteticoRowChanged(Sender: TObject);
      Procedure cbxLinhaClick(Sender: TObject);
      Procedure cdsGridRendimentosAfterScroll(DataSet: TDataSet);
      Procedure cbListQualfRFChange(Sender: TObject);
      Procedure cbListQualfRFExit(Sender: TObject);
      Procedure btnChangeCodRFClick(Sender: TObject);
   Private
      Function GeraArquivoReceita: Boolean;
      Function GeraArquivoDIPJ(iNroRecibo: Integer; sNomeArquivo, strExercicio, sCNPJ: String): Boolean;
      Function GravarArquivo(Var sNomeArquivo: String): Boolean;
      Function GravarDadosTabelaGenerica: Boolean;
      Function IsRelatorioSelecionado: Boolean;
      Function AtualizaDadosDacon: Boolean;
      Function GerarDacon: Boolean;
      Function ValidaDadosDacon: Boolean;
      Function IsExisteRelatorioGerado: Boolean;
      Function IsExisteRelatorioGeradoReticador: Boolean;
      Function IsExisteRelatorioGeradoNumero: Boolean;
      Function CarregaDadosRelatorio: Boolean;
      Function CriarRelatorioDacon(Const bRetificador: Boolean): Boolean;
      Function IsPossivelExcluirRelatorio: Boolean;
      Function ExcluiDacon: Boolean;
      Function PesquisarRelatorioMesAno: Boolean;
      Function PesquisarRelatorioNumRecibo: Boolean;
      Procedure CarregarDadosControles;
      Procedure AjustaComboBoxLinhas(pTipoGeracaoDIPJ, iNroRecibo: Integer);
      Function PadLeft(aStr: String; aSize: Integer; aCh: char = ' '): String;
      Function PadRight(aStr: String; aSize: Integer; aCh: char = ' '): String;
      Procedure LimparCds();

      Function retornaCodMax(cds: TCmClientDataSet): Integer; // Thiago Melo SOL 208941 Kintana 2020125

      { Private declarations }
   Protected
      oDaconMT: TCtrlDaconMT;
      oNormaVigente: TCtrlNormaVigente;
      oParametrosRelatorio: TCtrlParametrosRelatorio;
      oLinhaRelatorio: TCtrlLinhaRelatorio;
      oTipoRelatorio: TCtrlTipoRelatorio;
      arquivo: TextFile;
      strPad: String;
      cdsDadosCadastraisFuncef: TClientDataSet;
      sNumeroAntigo: String;
      vDouValorTotal: Double;
   Public
      { Public declarations }
      idReciboRetPesq, idReciboPesq: Integer;
      IdReciboRetG: Integer;
      sTpDeclaracao: String;
      sReciboIni: String;

      Function ExistirDIPJ(idNorma: Integer; pExercicio: String): Integer;

      Function MontaHeader(sAno: String): String;
      Function MontaR01: String;
      Function MontaR02: String;
      Function MontaR03: String;
      Function MontaR36_01(iNRoRecibo: Integer): String;
      Function MontaR36_02(sExercAntr: String): String;
      Function MontaR37_01(iNRoRecibo: Integer): String;
      Function MontaR37_02(sExercAntr: String): String;
      Function MontaR61(iNRoRecibo: Integer): String;
      Function MontaR70(iNRoRecibo: Integer): String;    
      Function MontaTrailler: String;
      Function SelecionaCNPJ: String;
      Function QualifIrrf(nroCPF: String): String;
      Function TiraPontoeVirgulaSinal(sTexto: String): String;

      Procedure PreencheNroRecibo(idReciboRetPesq, iNroRecibo: Integer);
      Procedure PopulaComboQualifRF;
      Procedure MudaStatusBtn(Habilita: Boolean);
      Procedure AtualizaDadosGrid(iNRoRecibo: Integer);
      Function PreparaTabRendimentos(iNRoRecibo: Integer): String;

   End;

Var
   frmCadDIPJ: TfrmCadDIPJ;
   IdNormaAtual, IdRelatorioDados: Integer;
   sNumeroRecibo, sExercicio, sPeriodo, PathArquivo, sTipoForm: String;
   sRetificadora: String;
   sTesteData: TDateTime;
   curValores: Currency;
   idTipoG, idNormaG, IdReciboG, iNewCodRFG: Integer;
   pExercicioG: String;
   bTipoDIPJ: boolean;

Implementation

Uses UDatabase, DBaseDados, FPesqRecDIPF;

{$R *.DFM}

Procedure TfrmCadDIPJ.FormShow(Sender: TObject);
Begin
   Inherited;
   sTpDeclaracao := '0';
   IdReciboG := 0;
   iNewCodRFG := 99;
   idReciboRetPesq := 0;
   idReciboPesq := 0;
   IdReciboRetG := 0;
   sReciboIni := '';

   edDataRecibo.Date := Now;
   //  sTipoForm := inttostr(dblcTipoRelatCad.LookupTable.FieldByName('IdTipo').asInteger);
   //  IdNormaAtual := oDaconMT.LocalizaNormaVigenteAtual(dblcTipoRelatCad.LookupTable.FieldByName('IdTipo').asString);
   sTipoForm := '2';
   IdNormaAtual := oDaconMT.LocalizaNormaVigenteAtual(sTipoForm);
   //      oDaconMT.isDacon := True;   ver o que é isto

   If (edExercicio.Text <> EmptyStr) Then
      sbtnProcurarClick(self);

   edExercicio.Text := FormatDateTime('YYYY', Now);
   sRetificadora := 'N'; //Marcio Sanches Spinosa SOL: 126124/126125 Kintana: 656907/656908
   // pnobre
   pgDados.ActivePageIndex := 0;
   PathArquivo := Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa) + '\DIPJ';

   vDouValorTotal := 0;

   LimparCds;
End;

Procedure TfrmCadDIPJ.FormCreate(Sender: TObject);
Begin
   Inherited;
   oDaconMT := TCtrlDaconMT.Create;
   oDaconMT.Initialize(DtmBaseDados.dbBaseDados,
      True,
      Sistema.ConnectionType,
      Sistema.ConnectionSide,
      Sistema.AppRemoteServer,
      True,
      Nil,
      Nil,
      False);

   oNormaVigente := TCtrlNormaVigente.Create;
   oNormaVigente.Initialize(DtmBaseDados.dbBaseDados,
      True,
      Sistema.ConnectionType,
      Sistema.ConnectionSide,
      Sistema.AppRemoteServer,
      True,
      Nil,
      Nil,
      False);

   oParametrosRelatorio := TCtrlParametrosRelatorio.Create;
   oParametrosRelatorio.Initialize(DtmBaseDados.dbBaseDados,
      True,
      Sistema.ConnectionType,
      Sistema.ConnectionSide,
      Sistema.AppRemoteServer,
      True,
      Nil,
      Nil,
      False);

   oLinhaRelatorio := TCtrlLinhaRelatorio.Create;
   oLinhaRelatorio.Initialize(DtmBaseDados.dbBaseDados,
      True,
      Sistema.ConnectionType,
      Sistema.ConnectionSide,
      Sistema.AppRemoteServer,
      True,
      Nil,
      Nil,
      False);

   oTipoRelatorio := TCtrlTipoRelatorio.Create;
   oTipoRelatorio.Initialize(DtmBaseDados.dbBaseDados,
      True,
      Sistema.ConnectionType,
      Sistema.ConnectionSide,
      Sistema.AppRemoteServer,
      True,
      Nil,
      Nil,
      False);

   cdsFiltroTipo.Data := oTipoRelatorio.ListTipoRelatorio;
   cdsDadosCadastraisFuncef := TClientDataSet.Create(Nil);

End;

Procedure TfrmCadDIPJ.FormClose(Sender: TObject; Var Action: TCloseAction);
Begin
   Inherited;
   FreeAndNil(oNormaVigente);
   FreeAndNil(oParametrosRelatorio);
   FreeAndNil(oLinhaRelatorio);
   FreeAndNil(oDaconMT);
   FreeAndNil(oTipoRelatorio);
End;

Procedure TfrmCadDIPJ.sbtnGeraArquivoClick(Sender: TObject);
Var
   pCompetencia, pCnpj, sAno, sNomeArquivo,
      sHeader, sTrailler, sR01, sR02, sR03, sR36,
      sR37: String;
   iAnoAtual, iAnoAnt, iFileHandle: Integer;
   lstNwFile: TStringList;
   texto: String;
Begin
   If oDaconMT.ExisteCod99(IdReciboG) Then
      Begin
         MsgDlg(MSG027, 'Informação', mtInformation, [mbOK], 0);
         exit;
      End;

   If (edExercicio.Text = EmptyStr) And (edNumReciboPesq.Text = EmptyStr) Then
      Begin
         Texto := 'Não foi informado o Exercício ou Nº de Recibo. Verifique !';
         MsgDlg(Texto, 'Erro', mtError, [mbOK], 0);
      End
   Else
      Begin
         If Not DirectoryExists(PathArquivo) Then
            CreateDir(PathArquivo);
         pCnpj := SelecionaCNPJ;
         iAnoAnt := StrToInt(edExercicio.Text);
         iAnoAtual := iAnoAnt + 1;
         pCompetencia := IntToStr(iAnoAtual) + '-' + IntToStr(iAnoAnt);

         sNomeArquivo := PathArquivo + '\' + pCnpj + '-DIPJ-' + pCompetencia + '.DEC';
         If FileExists(sNomeArquivo) Then
            Begin
               DeleteFile(sNomeArquivo);
            End;
         iFileHandle := FileCreate(sNomeArquivo);
         FileClose(iFileHandle);
         If GeraArquivoDIPJ(IdReciboG, sNomeArquivo, edExercicio.Text, pCnpj) Then
            MsgDlg(Format(MSG011, [sNomeArquivo]), 'Informação', mtInformation, [mbOK], 0);
      End;

End;

Function TfrmCadDIPJ.GeraArquivoReceita(): Boolean;
Var sNomeArquivo: String;

Begin
   Result := True;

   If GravarDadosTabelaGenerica() Then
      Begin
         Result := GravarArquivo(sNomeArquivo);
         If Result Then
            MsgDlg(Format(MSG011, [sNomeArquivo]), 'Informação', mtInformation, [mbOK], 0);
      End;

End;

Function TfrmCadDIPJ.GravarDadosTabelaGenerica: Boolean;
Begin
   Result := True;
End;

Function TfrmCadDIPJ.GravarArquivo(Var sNomeArquivo: String): Boolean;
   Procedure GeraNomeArquivo(Var sNomeArquivo: String; pCompetencia: String; pCnpj: String);
   Begin
      If Not DirectoryExists(PathArquivo) Then
         CreateDir(PathArquivo);
      sNomeArquivo := PathArquivo + '\' + pCnpj + '-DIPJ-' + pCompetencia + '.DEC';

   End;

   Procedure GravarLayout(Const sNomeArquivo: String);
   Begin
      // ARNALDO NÃO FEZ
   End;

Begin
   Result := True;
   //   GeraNomeArquivo(sNomeArquivo, edExercicio.Text + '-' + PadLeft(inttostr(cbPeriodo.ItemIndex),2,'0'), cdsInfoAdic.FieldByName('CNPJFundacao').AsString );
   If FileExists(sNomeArquivo) Then
      Begin
         Result := MsgDlg(MSG010, 'Atenção', mtConfirmation, [mbYes, mbNo], 0) = idYes;
         If Not Result Then
            Exit;
      End;

   Try
      AssignFile(arquivo, sNomeArquivo);
      If FileExists(sNomeArquivo) Then
         DeleteFile(sNomeArquivo);

      ReWrite(arquivo); { cria um novo se não existir }
      // Sistema
      Write(arquivo, Padright(cdsInfoAdic.FieldByName('Sistema').AsString, 8, ' '));
      //Filler
      Write(arquivo, Padright(cdsInfoAdic.FieldByName('Filler').AsString, 4, '0'));
      //Exercicio
      If Trim(edExercicio.Text) <> EmptyStr Then
         Write(arquivo, edExercicio.Text)
      Else
         Write(arquivo, formatdatetime('yyyy', Now));
      // Filler
      Write(arquivo, PadRight(cdsInfoAdic.FieldByName('Filler_1').AsString, 4, '0'));
      // Indicador de Demonstrativo 0 - Original / 1 - Retificadora
      Write(arquivo, PadRight(cdsInfoAdic.FieldByName('Demonstrativo').AsString, 1, '0'));
      // CNPJ - numero de identificação
      Write(arquivo, padright(lblCNPJ.Caption, 14, '0'));
      // Tipo de NI - Pessoa Juridica
      Write(arquivo, PadRight(cdsInfoAdic.FieldByName('TipoNI').AsString, 1, '2'));
      //Versão do PGD
      Write(arquivo, PadRight(cdsInfoAdic.FieldByName('PGD').AsString, 3, '0'));
      //String para adicionar campos
      strPad := lblNomeEmpresarial.Caption;
      // Nome Empresarial
      write(arquivo, Padright(strPad, 60, ' '));
      // Estado
      write(arquivo, Padright(cdsInfoAdic.FieldByName('UFFundacao').AsString, 2, ' '));
      strPad := '';
      //Filler
      write(arquivo, padright(strPad, 10, '0'));
      //Filler
      write(arquivo, padright(strPad, 250, ' '));
      //Filler
      write(arquivo, padright(strPad, 3, '0'));
      //Filler
      Writeln(arquivo, padright(strPad, 10, '0'));
      // Fim de registro
     // Writeln(arquivo, padright(strPad, 2, '0'));

      //Dados Iniciais
      //Tipo
      strPad := cdsInfoAdic.FieldByName('TipoCadastral').AsString;
      write(arquivo, padright(strPad, 4, ' '));
      //CNPJ do Declarante
      write(arquivo, Padright(lblCNPJ.Caption, 14, '0'));
      //Periodicidade de Entrega 1 - Mensal/ 2 - Semestral
      write(arquivo, PadRight(cdsInfoAdic.FieldByName('PeriodEntrega').AsString, 1, '0'));
      // Verificar a data do dacon
      If Trim(edExercicio.Text) <> EmptyStr Then
         Write(arquivo, PadRight(edExercicio.Text, 4, '0'))
      Else
         Write(arquivo, formatdatetime('yyyymm', Now)); // Verificar a data do dacon
      // Verificar a data do inicio
      write(arquivo, PadRight(edExercicio.Text, 4, '0') + '01');
      sTesteData := StrToDateTime('01' + '/' + '/' + PadRight(edExercicio.Text, 4, '0'));
      // Verificar a data fim
      write(arquivo, formatdatetime('yyyymmdd', IncMonth(sTesteData, 1) - 1));
      // TIPO DEMONSTRATIVO
      write(arquivo, PadRight(cdsInfoAdic.FieldByName('TipoDemonstrativo').AsString, 1, '0'));
      // SITUAÇÃO ESPECIAL
      write(arquivo, PadRight(cdsInfoAdic.FieldByName('SituacaoEspecial').AsString, 2, '0'));
      // DATA DO EVENTO
      If (cdsInfoAdic.FieldByName('DataEvento').AsString = '00000000') Then
         write(arquivo, PadRight(cdsInfoAdic.FieldByName('DataEvento').AsString, 8, '0'))
      Else
         write(arquivo, PadRight(FormatDateTime('yyyymmdd', cdsInfoAdic.FieldByName('DataEvento').AsDateTime), 8, '0'));
      // Desenquadramento
      write(arquivo, PadRight(cdsInfoAdic.FieldByName('Desenquadramento').AsString, 1, '0'));
      // Data do Desenquadramento
      If (cdsInfoAdic.FieldByName('DataDesenquadramento').AsString = '00000000') Then
         write(arquivo, PadRight(cdsInfoAdic.FieldByName('DataDesenquadramento').AsString, 8, '0'))
      Else
         write(arquivo, PadRight(FormatDateTime('yyyymmdd', cdsInfoAdic.FieldByName('DataDesenquadramento').AsDateTime), 8, '0'));
      // Filler
      write(arquivo, PADLEFT('', 10, '0'));
      // Qualificação para Pessoa Jurídica
      write(arquivo, PADLEFT(cdsInfoAdic.FieldByName('PJ').AsString, 2, '0'));
      // Tipo Entidade
      write(arquivo, PADLEFT(cdsInfoAdic.FieldByName('TipoEntidade').AsString, 2, '0'));
      // Inclusão no Simples
      write(arquivo, PADLEFT(cdsInfoAdic.FieldByName('InclusaoSimples').AsString, 1, '0'));
      // Data da inclusão
      If (cdsInfoAdic.FieldByName('DataInclusaoSimples').AsString = '00000000') Then
         write(arquivo, PadRight(cdsInfoAdic.FieldByName('DataInclusaoSimples').AsString, 8, '0'))
      Else
         write(arquivo, PadRight(FormatDateTime('yyyymmdd', cdsInfoAdic.FieldByName('DataInclusaoSimples').AsDateTime), 8, '0'));
      // Regime de Apuração de PIS/Pasep e Cofins
      write(arquivo, PadRight(cdsInfoAdic.FieldByName('PISPasepCofins').AsString, 1, '0'));
      // Apuração de Créditos sobre Operações de Importação
      write(arquivo, PadRight(cdsInfoAdic.FieldByName('ApuracaoCreditos').AsString, 1, '0'));
      // Apuração de Pis/Pasep e Cofins a Alíquotas Diferenciadas na Condição de Contribuinte
      write(arquivo, PadRight(cdsInfoAdic.FieldByName('ApurPisDiferenciadasContrib').AsString, 1, '0'));
      // Apuração de Pis/Pasep e Cofins a Alíquotas Diferenciadas na Condição de Substituto Tributário
      write(arquivo, PadRight(cdsInfoAdic.FieldByName('ApuracaoPisSubstitutoTrib').AsString, 1, '0'));
      // Apuração de Pis/Pasep e Cofins a Alíquotas Por Unidade de Medida de Produto na Condição de Contribuinte
      write(arquivo, PadRight(cdsInfoAdic.FieldByName('ApPisProdutoContribuinte').AsString, 1, '0'));
      // Apuração de Pis/Pasep e Cofins a Alíquotas Por Unidade de Medida de Produto na Condição de Substituto Tributário
      write(arquivo, PadRight(cdsInfoAdic.FieldByName('ApPisProdutoTributario').AsString, 1, '0'));
      // Adição de Contribuição ou Crédito Diferidos em Meses Anteriores
      write(arquivo, PadRight(cdsInfoAdic.FieldByName('AdicaoContrCreditoAnteriores').AsString, 1, '2'));
      // Diferimento de Contribuição ou Crédito no Mês
      write(arquivo, PadRight(cdsInfoAdic.FieldByName('DiferimContrCreditoMes').AsString, 1, '2'));
      // Créditos Transferidos de Sucedidas no Mês
      write(arquivo, PadRight(cdsInfoAdic.FieldByName('CredTransferido').AsString, 1, '2'));
      // Contribuições e Créditos Diferidos Transferidos de Sucedidas no Mês
      write(arquivo, PadRight(cdsInfoAdic.FieldByName('ContrCredDifTransferidos').AsString, 1, '2'));
      // Desconto no Mês de Créditos Transferidos por PJ Sucedidas
      write(arquivo, PadRight(cdsInfoAdic.FieldByName('DescCredPJSucedidas').AsString, 1, '2'));
      // Método de Determinação dos Créditos
      write(arquivo, PadRight(cdsInfoAdic.FieldByName('MetDeterminacaoCred').AsString, 1, ' '));
      // Filler
      Writeln(arquivo, PADLEFT('', 10, '0'));
      // Fim de registro
      //Writeln(arquivo, PADLEFT('', 2, ' '));

      //Seleciona dados cadastrais da funcef
      cdsDadosCadastraisFuncef.Data := oDaconMT.CarregarDadosCadastraisFuncef;

      //Dados Cadastrais
      // Tipo
      write(arquivo, PADRight('R02', 4, ' '));
      // CNPJ do Declarante
      write(arquivo, PadRight(lblCNPJ.Caption, 14, ' '));
      // Nome Empresarial
      strPad := lblNomeEmpresarial.Caption;
      write(arquivo, PadRight(strPad, 150, ' '));
      // Natureza Jurídica
      write(arquivo, PadRight('3999', 4, ' '));
      // Filler
      write(arquivo, PadRight('', 7, '0'));
      // Tipo de Logradouro
      write(arquivo, PadRight(cdsDadosCadastraisFuncef.FieldByName('TIPOENDERECO').AsString, 20, ' '));
      // Logradouro
      write(arquivo, PadRight(cdsDadosCadastraisFuncef.FieldByName('LOGRADOURO').AsString, 150, ' '));
      // Numero
      write(arquivo, PadRight(cdsDadosCadastraisFuncef.FieldByName('NUMERO').AsString, 6, ' '));
      // Complemento
      write(arquivo, PadRight(cdsDadosCadastraisFuncef.FieldByName('COMPLEMENTO').AsString, 50, ' '));
      // Bairro/Distrito
      write(arquivo, PadRight(cdsDadosCadastraisFuncef.FieldByName('BAIRRO').AsString, 50, ' '));
      // UF
      write(arquivo, PadRight(cdsDadosCadastraisFuncef.FieldByName('UF').AsString, 2, ' '));
      // Município
      write(arquivo, PadRight(cdsDadosCadastraisFuncef.FieldByName('NOME_CIDADE').AsString, 50, ' '));
      // CEP
      write(arquivo, PadRight(cdsDadosCadastraisFuncef.FieldByName('CEP').AsString, 8, ' '));
      // DDD do Telefone
      write(arquivo, Padleft(cdsDadosCadastraisFuncef.FieldByName('DDD_CONTATO').AsString, 4, ' '));
      // Telefone
      write(arquivo, PadRight(cdsDadosCadastraisFuncef.FieldByName('NUMERO_CONTATO').AsString, 8, ' '));
      // DDD do Fax
      write(arquivo, Padleft(cdsDadosCadastraisFuncef.FieldByName('DDD_FAX').AsString, 4, ' '));
      // Fax
      write(arquivo, PadRight(cdsDadosCadastraisFuncef.FieldByName('NUMERO_FAX').AsString, 8, ' '));
      // Caixa Postal
      write(arquivo, PadRight('', 6, ' '));
      // UF da Caixa Postal
      write(arquivo, PadRight('', 2, ' '));
      // CEP da Caixa Postal
      write(arquivo, PadRight('', 8, ' '));
      // Correio Eletrônico
      write(arquivo, PadRight(cdsDadosCadastraisFuncef.FieldByName('EMAIL').AsString, 115, ' '));
      // Filler
      Writeln(arquivo, PadRight('', 10, '0'));
      // Fim de registro
     // Writeln(arquivo, PadRight('', 2, ' '));

      // Dados do Representante e do Responsável
      // Tipo
      write(arquivo, PadRight(cdsInfoAdic.FieldByName('Tipo_3').AsString, 4, ' '));
      // Nome do Representante
      write(arquivo, PadRight(cdsInfoAdic.FieldByName('NomeRepresentante').AsString, 150, ' '));
      // CPF - Representante
      write(arquivo, PadRight(cdsInfoAdic.FieldByName('CpfRepresentante').AsString, 11, ' '));
      // DDD do Telefone - Representante
      write(arquivo, Padleft(cdsInfoAdic.FieldByName('DDDRepresentante').AsString, 4, '0'));
      // Telefone - Representante
      write(arquivo, PadRight(cdsInfoAdic.FieldByName('FoneRepresentante').AsString, 8, ' '));
      // Ramal - Representante
      write(arquivo, PadRight(cdsInfoAdic.FieldByName('RamalRepresentante').AsString, 5, ' '));
      // DDD do Fax - Representante
      write(arquivo, Padleft(cdsInfoAdic.FieldByName('DDDFaxRepresentante').AsString, 4, '0'));
      // Fax – Representante
      write(arquivo, PadRight(cdsInfoAdic.FieldByName('FaxRepresentante').AsString, 8, ' '));
      // Correio Eletrônico – Representante
      write(arquivo, PadRight(cdsInfoAdic.FieldByName('EmailRepresentante').AsString, 115, ' '));
      // Nome do Responsável
      write(arquivo, PadRight(cdsInfoAdic.FieldByName('NomeResponsavel').AsString, 150, ' '));
      // CPF – Responsável
      write(arquivo, PadRight(cdsInfoAdic.FieldByName('CpfResponsavel').AsString, 11, ' '));
      // CRC – Responsável
      write(arquivo, PadRight(cdsInfoAdic.FieldByName('CRCResponsavel').AsString, 15, ' '));
      // UF do CRC - Responsável
      write(arquivo, PadRight(cdsInfoAdic.FieldByName('UFCRCResponsavel').AsString, 2, ' '));
      // DDD do Telefone – Responsável
      write(arquivo, Padleft(cdsInfoAdic.FieldByName('DDDResponsavel').AsString, 4, '0'));
      // Telefone – Responsável
      write(arquivo, PadRight(cdsInfoAdic.FieldByName('FoneResponsavel').AsString, 8, ' '));
      // Ramal – Responsável
      write(arquivo, PadRight(cdsInfoAdic.FieldByName('RamalResponsavel').AsString, 5, ' '));
      // DDD do Fax – Responsável
      write(arquivo, Padleft(cdsInfoAdic.FieldByName('DDDFaxResponsavel').AsString, 4, '0'));
      // Fax – Responsável
      write(arquivo, PadRight(cdsInfoAdic.FieldByName('FaxResponsavel').AsString, 8, ' '));
      // Correio Eletrônico – Responsável
      write(arquivo, PadRight(cdsInfoAdic.FieldByName('EmailResponsavel').AsString, 115, ' '));
      // Filler
      Writeln(arquivo, PadRight('', 10, '0'));
      // Fim de registro
     // writeln(arquivo, PadRight('', 2, ' '));

      //Base de Cálculo
      cdsSintetico.DisableControls;
      // Tipo
      write(arquivo, PadRight(cdsInfoAdic.FieldByName('Tipo_4').AsString, 4, ' '));
      // Mês
      write(arquivo, PadRight(FormatDateTime('mm', sTesteData), 2, ' '));
      // Coluna
      write(arquivo, PadRight('01', 2, ' '));
      // Linha 01 – Recursos Coletados Previdenciais
      cdsSintetico.Filter := 'DESCRICAO like ''%Recursos Coletados Previdenciais%''';
      cdsSintetico.Filtered := True;
      curValores := cdsSintetico.FieldByName('VALOR').AsCurrency;
      If (curValores < 0) Then
         curValores := curValores * (-1);
      cdsSintetico.Filtered := False;
      write(arquivo, PadLeft(StringReplace(StringReplace(FormatCurr('###,##0.00', curValores), ',', '', [rfReplaceAll]), '.', '', [rfReplaceAll]), 14, '0'));

      // Linha 02 – Recursos Coletados Assistenciais
      cdsSintetico.Filter := 'DESCRICAO like ''%Recursos Coletados Assistenciais%''';
      cdsSintetico.Filtered := True;
      curValores := cdsSintetico.FieldByName('VALOR').AsCurrency;
      If (curValores < 0) Then
         curValores := curValores * (-1);
      cdsSintetico.Filtered := False;
      write(arquivo, PadLeft(StringReplace(StringReplace(FormatCurr('###,##0.00', curValores), ',', '', [rfReplaceAll]), '.', '', [rfReplaceAll]), 14, '0'));

      // Linha 03 – Receitas Administrativas
      cdsSintetico.Filter := 'DESCRICAO like ''%Receitas Administrativas%''';
      cdsSintetico.Filtered := True;
      curValores := cdsSintetico.FieldByName('VALOR').AsCurrency;
      If (curValores < 0) Then
         curValores := curValores * (-1);
      cdsSintetico.Filtered := False;
      write(arquivo, PadLeft(StringReplace(StringReplace(FormatCurr('###,##0.00', curValores), ',', '', [rfReplaceAll]), '.', '', [rfReplaceAll]), 14, '0'));

      // Linha 04 – Rendas de Investimento (bruta)
      cdsSintetico.Filter := 'DESCRICAO like ''%Rendas de Investimento (bruta)%''';
      cdsSintetico.Filtered := True;
      curValores := cdsSintetico.FieldByName('VALOR').AsCurrency;
      If (curValores < 0) Then
         curValores := curValores * (-1);
      cdsSintetico.Filtered := False;
      write(arquivo, PadLeft(StringReplace(StringReplace(FormatCurr('###,##0.00', curValores), ',', '', [rfReplaceAll]), '.', '', [rfReplaceAll]), 14, '0'));

      // Linha 05 – (-) Constituição de Provisões Técnicas - Previdência
      cdsSintetico.Filter := 'DESCRICAO like ''%Constituição de Provisões Técnicas%'''; // - Previdência
      cdsSintetico.Filtered := True;
      curValores := cdsSintetico.FieldByName('VALOR').AsCurrency;
      If (curValores < 0) Then
         curValores := curValores * (-1);
      cdsSintetico.Filtered := False;
      write(arquivo, PadLeft(StringReplace(StringReplace(FormatCurr('###,##0.00', curValores), ',', '', [rfReplaceAll]), '.', '', [rfReplaceAll]), 14, '0'));

      // Linha 06 – (-) Rendimentos de Aplicações Financeiras – Previdência
      cdsSintetico.Filter := 'DESCRICAO like ''%Rendimentos de Aplicações Financeiras%'''; // – Previdencia
      cdsSintetico.Filtered := True;
      curValores := cdsSintetico.FieldByName('VALOR').AsCurrency;
      If (curValores < 0) Then
         curValores := curValores * (-1);
      cdsSintetico.Filtered := False;
      write(arquivo, PadLeft(StringReplace(StringReplace(FormatCurr('###,##0.00', curValores), ',', '', [rfReplaceAll]), '.', '', [rfReplaceAll]), 14, '0'));

      // Linha 07 – (-) Rendimentos Relativos à Receita de Aluguel – Previdência
      cdsSintetico.Filter := 'DESCRICAO like ''%Rendimentos Relativos à Receita de Aluguel%'''; // – Previdencia
      cdsSintetico.Filtered := True;
      curValores := cdsSintetico.FieldByName('VALOR').AsCurrency;
      If (curValores < 0) Then
         curValores := curValores * (-1);
      cdsSintetico.Filtered := False;
      write(arquivo, PadLeft(StringReplace(StringReplace(FormatCurr('###,##0.00', curValores), ',', '', [rfReplaceAll]), '.', '', [rfReplaceAll]), 14, '0'));

      // Linha 08 – (-) Receita Decorrente da Venda de Bens Imóveis – Previdência
      cdsSintetico.Filter := 'DESCRICAO like ''%Receita Decorrente da Venda de Bens Imóveis – Previdência%''';
      cdsSintetico.Filtered := True;
      curValores := cdsSintetico.FieldByName('VALOR').AsCurrency;
      If (curValores < 0) Then
         curValores := curValores * (-1);
      cdsSintetico.Filtered := False;
      write(arquivo, PadLeft(StringReplace(StringReplace(FormatCurr('###,##0.00', curValores), ',', '', [rfReplaceAll]), '.', '', [rfReplaceAll]), 14, '0'));

      // Linha 09 – (-) Resultado Positivo Auferido na Reavaliação da Carteira de Investimentos Imobiliários – Previdência
      cdsSintetico.Filter := 'DESCRICAO like ''%Resultado Positivo Auferido na Reavaliação da Carteira de Investimentos Imobiliários – Previdência%''';
      cdsSintetico.Filtered := True;
      curValores := cdsSintetico.FieldByName('VALOR').AsCurrency;
      If (curValores < 0) Then
         curValores := curValores * (-1);
      cdsSintetico.Filtered := False;
      write(arquivo, PadLeft(StringReplace(StringReplace(FormatCurr('###,##0.00', curValores), ',', '', [rfReplaceAll]), '.', '', [rfReplaceAll]), 14, '0'));

      // Linha 10 – (-) Reversão de Provisão e Recuperação de Créditos Baixados como Perda que não Representem Ingressos de Novas Receitas – Assistência
      cdsSintetico.Filter := 'DESCRICAO like ''%Reversão de Provisão e Recuperação de Créditos Baixados como Perda que não Representem Ingressos de Novas Receitas – Assistência%''';
      cdsSintetico.Filtered := True;
      curValores := cdsSintetico.FieldByName('VALOR').AsCurrency;
      If (curValores < 0) Then
         curValores := curValores * (-1);
      cdsSintetico.Filtered := False;
      write(arquivo, PadLeft(StringReplace(StringReplace(FormatCurr('###,##0.00', curValores), ',', '', [rfReplaceAll]), '.', '', [rfReplaceAll]), 14, '0'));

      // Linha 11 – (-) Recursos não Tributáveis - Assistência
      cdsSintetico.Filter := 'DESCRICAO like ''%Recursos não Tributáveis - Assistência%''';
      cdsSintetico.Filtered := True;
      curValores := cdsSintetico.FieldByName('VALOR').AsCurrency;
      If (curValores < 0) Then
         curValores := curValores * (-1);
      cdsSintetico.Filtered := False;
      write(arquivo, PadLeft(StringReplace(StringReplace(FormatCurr('###,##0.00', curValores), ',', '', [rfReplaceAll]), '.', '', [rfReplaceAll]), 14, '0'));

      // Linha 12 – (-) Constituição de Provisões Técnicas – Assistência
      cdsSintetico.Filter := 'DESCRICAO like ''%Constituição de Provisões Técnicas – Assistência%''';
      cdsSintetico.Filtered := True;
      curValores := cdsSintetico.FieldByName('VALOR').AsCurrency;
      If (curValores < 0) Then
         curValores := curValores * (-1);
      cdsSintetico.Filtered := False;
      write(arquivo, PadLeft(StringReplace(StringReplace(FormatCurr('###,##0.00', curValores), ',', '', [rfReplaceAll]), '.', '', [rfReplaceAll]), 14, '0'));

      // Linha 13 – (-) Venda de Bens do Ativo Permanente
      cdsSintetico.Filter := 'DESCRICAO like ''%Venda de Bens do Ativo Permanente%''';
      cdsSintetico.Filtered := True;
      curValores := cdsSintetico.FieldByName('VALOR').AsCurrency;
      If (curValores < 0) Then
         curValores := curValores * (-1);
      cdsSintetico.Filtered := False;
      write(arquivo, PadLeft(StringReplace(StringReplace(FormatCurr('###,##0.00', curValores), ',', '', [rfReplaceAll]), '.', '', [rfReplaceAll]), 14, '0'));

      // Linha 14 – (-) Reversão de Provisão e Recuperação de Créditos Baixados como Perda que não Representem Ingressos de Novas Receitas – Administrativa
      cdsSintetico.Filter := 'DESCRICAO like ''%Reversão de Provisão e Recuperação de Créditos Baixados como Perda que não Representem Ingressos de Novas Receitas – Administrativa%''';
      cdsSintetico.Filtered := True;
      curValores := cdsSintetico.FieldByName('VALOR').AsCurrency;
      If (curValores < 0) Then
         curValores := curValores * (-1);
      cdsSintetico.Filtered := False;
      write(arquivo, PadLeft(StringReplace(StringReplace(FormatCurr('###,##0.00', curValores), ',', '', [rfReplaceAll]), '.', '', [rfReplaceAll]), 14, '0'));

      // Linha 15 – (-) Outras Exclusões e Deduções
      cdsSintetico.Filter := 'DESCRICAO like ''%Outras Exclusões e Deduções%''';
      cdsSintetico.Filtered := True;
      curValores := cdsSintetico.FieldByName('VALOR').AsCurrency;
      If (curValores < 0) Then
         curValores := curValores * (-1);
      cdsSintetico.Filtered := False;
      write(arquivo, PadLeft(StringReplace(StringReplace(FormatCurr('###,##0.00', curValores), ',', '', [rfReplaceAll]), '.', '', [rfReplaceAll]), 14, '0'));

      // Linha 16 – BASE DE CÁLCULO DA CONTRIBUIÇÃO PARA O PIS/PASEP
      cdsSintetico.Filter := 'DESCRICAO like ''%BASE DE CÁLCULO DA CONTRIBUIÇÃO PARA O PIS/PASEP%''';
      cdsSintetico.Filtered := True;
      curValores := cdsSintetico.FieldByName('VALOR').AsCurrency;
      If (curValores < 0) Then
         curValores := curValores * (-1);
      cdsSintetico.Filtered := False;
      write(arquivo, PadLeft(StringReplace(StringReplace(FormatCurr('###,##0.00', curValores), ',', '', [rfReplaceAll]), '.', '', [rfReplaceAll]), 14, '0'));

      // Linha 17 – Contribuição para o PIS/Pasep Apurada
      cdsSintetico.Filter := 'DESCRICAO like ''%Contribuição para o PIS/Pasep Apurada%''';
      cdsSintetico.Filtered := True;
      curValores := cdsDadosRelatorio.FieldByName('VLRPIS').AsCurrency;
      If (curValores < 0) Then
         curValores := curValores * (-1);
      cdsSintetico.Filtered := False;
      write(arquivo, PadLeft(StringReplace(StringReplace(FormatCurr('###,##0.00', curValores), ',', '', [rfReplaceAll]), '.', '', [rfReplaceAll]), 14, '0'));

      // Reservado para uso futuro
      write(arquivo, PadRight('', 262, '0'));
      Writeln(arquivo, PadRight('', 10, '0')); // Filler
      // writeln(arquivo, PadRight('', 2, ' '));// Fim de registro

      cdsSintetico.EnableControls;

      //Registro tipo Encerramento
      // Tipo
      write(arquivo, PadRight(cdsInfoAdic.FieldByName('Tipo_5').AsString, 2, ' '));
      // Quantidade de registros
      write(arquivo, PadRight(cdsInfoAdic.FieldByName('QuantRegistros').AsString, 3, '0'));
      // Filler
  //            write(arquivo, PadRight('', 228, ' '));
      write(arquivo, PadRight('', 226, ' '));
      // Filler
      Writeln(arquivo, PadRight('', 10, '0'));
      // Fim de registro
     // Writeln(arquivo, PadRight('', 2, ' '));

   Finally
      CloseFile(arquivo);
   End;

   GravarLayout(sNomeArquivo);
End;

Function TfrmCadDIPJ.IsRelatorioSelecionado: Boolean;
   Function VerificaRelatorioSelecionado: Boolean;
   Begin
      Result := (sExercicio <> emptyStr) And
         (sPeriodo <> emptyStr) Or
         (sNumeroRecibo <> emptyStr);
   End;

   Function VerificaDadosComplementares: Boolean;
   Begin
      //
      Result := True;
   End;

Begin
   Result := VerificaRelatorioSelecionado;
   If Not Result Then
      MsgDlg(MSG008, 'Erro', mtError, [mbOK], 0)
   Else
      Begin
         Result := VerificaDadosComplementares;
         If Not Result Then
            MsgDlg(MSG009, 'Erro', mtError, [mbOK], 0);
      End;
End;

Procedure TfrmCadDIPJ.sbtnGeraDaconClick(Sender: TObject);
Var
   iMes, idNormaLoc, iNRoRecibo, iRet: Integer;
   fAtivo, fPassivo, fTotal: Double;
Begin
   Inherited;
   PopulaComboQualifRF;
   // pnobre
   fAtivo := 0;
   fPassivo := 0;
   fTotal := 0;
   idNormaLoc := 0;
   iNRoRecibo := 0;
   sExercicio := edExercicio.Text;
   idNormaLoc := oDaconMT.iLocNorma(StrToInt(sTipoForm), sExercicio);

   Case ExistirDIPJ(idNormaLoc, sExercicio) Of
      0: // não existe ainda
         Begin
            sTpDeclaracao := '0';
            bTipoDIPJ := false;
            cdsSintetico.Data := oDaconMT.MostraDIPJSintetico(StrToInt(sTipoForm), idNormaLoc, sExercicio);
            cdsSinteticoAnoAnt.Data := oDaconMT.MostraDIPJSinteticoAnoAnt(StrToInt(sTipoForm), idNormaLoc, 0, sExercicio);
            cdsAnalitico.Data := oDaconMT.MostraDIPJAnalitico(StrToInt(sTipoForm), idNormaLoc, sExercicio);
            cdsInfoAdic.Data := oDaconMT.CarregarInformacoesAdicionaisDIPJ(sExercicio);
            cdsRendimentosDB.data := oDaconMT.CarregarDadosRendimento(sExercicio);
            //cdsGridRendimentos.data := oDaconMT.CarregarDadosRendimento(sExercicio);

            cdsInfPrev.Data := oDaconMT.MostrarPreviDIPJSintetico(idNormaLoc, sExercicio);
            cdsPrevCompl.Data := oDaconMT.MostraPreviComplDIPJ(idNormaLoc, sExercicio);

            //        {cdsPrevTot.Data :=} oDaconMT.TotalizaPrevidenciario(cdsInfPrev, idNormaLoc, sExercicio);
            cdsInfPrev.Data := oDaconMT.TotalizaPrevidenciario(cdsInfPrev, idNormaLoc, sExercicio);

            edQtdEmprIniPer.text := oDaconMT.ContaQtdFuncPer(sExercicio, 1);
            edQtdEmprFimPer.text := oDaconMT.ContaQtdFuncPer(sExercicio, 2);

            idTipoG := StrToInt(sTipoForm);
            idNormaG := idNormaLoc;
            pExercicioG := sExercicio;
            CarregarDadosControles();

            AjustaComboBoxLinhas(1, iNRoRecibo);

            fAtivo := oDaconMT.TotalPorCategoria(idTipoG, idNormaG, 1, pExercicioG);
            fPassivo := oDaconMT.TotalPorCategoria(idTipoG, idNormaG, 2, pExercicioG);

            edTotalAtivo.Text := FloatToStrf(fAtivo, FFnumber, 16, 2);
            edTotalPassivo.Text := FloatToStrf(fPassivo, FFnumber, 16, 2);

            If fAtivo < 0 Then fAtivo := fAtivo * -1;
            If fPassivo < 0 Then fPassivo := fPassivo * -1;

            fTotal := fAtivo - fPassivo;

            edResultado.Text := FloatToStrf(fTotal, FFnumber, 16, 2);

            Try
               dtmBaseDados.dbBaseDados.StartTransaction;
               iNRoRecibo := oDaconMT.InsertTabReciboDIPJ(idNormaLoc, 0, pExercicioG, 'N');
               If iNRoRecibo <> 0 Then
                  Begin
                     If (oDaconMT.InsertTabAnaliticoDIPJ(cdsAnalitico, iNRoRecibo)) Then
                        If (oDaconMT.InsertTabRendimentosDIPJ(cdsRendimentosDB, iNRoRecibo, idNormaG, pExercicioG)) Then
                           If (oDaconMT.InsertTabContribPrevDIPJ(cdsInfPrev, iNRoRecibo, idNormaG)) Then
                              If (oDaconMT.InsertTabContribPrevDIPJ(cdsPrevCompl, iNroRecibo, idNormaG)) Then
                                 dtmBaseDados.dbBaseDados.Commit;
                     IdReciboG := iNRoRecibo;
                     MudaStatusBtn(true);
                  End
               Else
                  Begin
                     //mensagem de erro
                  End;
            Except
               On E: Exception Do
                  dtmBaseDados.dbBaseDados.Rollback;
            End;
            cdsGridRendimentos.Data := oDaconMT.MostraRendimentosDIPJGravado(iNRoRecibo);
            cdsRendimentosDB.Data := cdsGridRendimentos.Data;
            cdsInfPrev.Data := oDaconMT.MostrarPreviDIPJGravado(iNRoRecibo);
            sbtnGeraArquivo.Enabled := true;
         End;
      1: // existe mas não existe o nro do recibo
         Begin
            If MsgDlg(MSG005, 'Atenção', mtConfirmation, [mbYes, mbNo], 0) = idYes Then
               Begin
                  pExercicioG := sExercicio; // Thiago Melo SOL 208941 Kintana 2020125

                  sTpDeclaracao := '0';
                  //deletar tabelas
                  bTipoDIPJ := true;
                  iNRoRecibo := oDaconMT.SelectTabReciboDIPJ(idNormaLoc, pExercicioG);
                  oDaconMT.DeleteTabReciboDIPJ(iNRoRecibo);
                  oDaconMT.DeleteTabAnaliticoDIPJ(iNRoRecibo);
                  oDaconMT.DeleteTabRendimentosDIPJ(iNRoRecibo);
                  oDaconMT.DeleteTabContribPrevDIPJ(iNRoRecibo);
                  oDaconMT.DeleteTabContribComplPrevDIPJ(iNRoRecibo);

                  //fazer tudo novamente
                  cdsSintetico.Data := oDaconMT.MostraDIPJSintetico(StrToInt(sTipoForm), idNormaLoc, sExercicio);
                  cdsSinteticoAnoAnt.Data := oDaconMT.MostraDIPJSinteticoAnoAnt(StrToInt(sTipoForm), idNormaLoc, 0, sExercicio);
                  cdsAnalitico.Data := oDaconMT.MostraDIPJAnalitico(StrToInt(sTipoForm), idNormaLoc, sExercicio);
                  cdsInfoAdic.Data := oDaconMT.CarregarInformacoesAdicionaisDIPJ(sExercicio);
                  cdsRendimentosDB.data := oDaconMT.CarregarDadosRendimento(sExercicio);
                  //cdsGridRendimentos.data := oDaconMT.CarregarDadosRendimento(sExercicio);

                  cdsInfPrev.Data := oDaconMT.MostrarPreviDIPJSintetico(idNormaLoc, sExercicio);
                  cdsPrevCompl.Data := oDaconMT.MostraPreviComplDIPJ(idNormaLoc, sExercicio);

                  cdsInfPrev.Data := oDaconMT.TotalizaPrevidenciario(cdsInfPrev, idNormaLoc, sExercicio);

                  edQtdEmprIniPer.text := oDaconMT.ContaQtdFuncPer(sExercicio, 1);
                  edQtdEmprFimPer.text := oDaconMT.ContaQtdFuncPer(sExercicio, 2);

                  idTipoG := StrToInt(sTipoForm);
                  idNormaG := idNormaLoc;
                  pExercicioG := sExercicio;
                  CarregarDadosControles();

                  AjustaComboBoxLinhas(2, iNRoRecibo);

                  fAtivo := oDaconMT.TotalPorCategoria(idTipoG, idNormaG, 1, pExercicioG);
                  fPassivo := oDaconMT.TotalPorCategoria(idTipoG, idNormaG, 2, pExercicioG);

                  edTotalAtivo.Text := FloatToStrf(fAtivo, FFnumber, 16, 2);
                  edTotalPassivo.Text := FloatToStrf(fPassivo, FFnumber, 16, 2);

                  If fAtivo < 0 Then fAtivo := fAtivo * -1;
                  If fPassivo < 0 Then fPassivo := fPassivo * -1;

                  fTotal := fAtivo - fPassivo;

                  edResultado.Text := FloatToStrf(fTotal, FFnumber, 16, 2);

                  Try
                     dtmBaseDados.dbBaseDados.StartTransaction;
                     iNRoRecibo := oDaconMT.InsertTabReciboDIPJ(idNormaLoc, 0, pExercicioG, 'N');
                     If iNRoRecibo <> 0 Then
                        Begin
                           If (oDaconMT.InsertTabAnaliticoDIPJ(cdsAnalitico, iNRoRecibo)) Then
                              If (oDaconMT.InsertTabRendimentosDIPJ(cdsRendimentosDB, iNRoRecibo, idNormaG, pExercicioG)) Then
                                 If (oDaconMT.InsertTabContribPrevDIPJ(cdsInfPrev, iNRoRecibo, idNormaG)) Then
                                    If (oDaconMT.InsertTabContribPrevDIPJ(cdsPrevCompl, iNroRecibo, idNormaG)) Then
                                       dtmBaseDados.dbBaseDados.Commit;
                           IdReciboG := iNRoRecibo;
                           MudaStatusBtn(true);
                        End
                     Else
                        Begin
                           //mensagem de erro
                        End;
                  Except
                     On E: Exception Do
                        dtmBaseDados.dbBaseDados.Rollback;
                  End;
                  cdsGridRendimentos.Data := oDaconMT.MostraRendimentosDIPJGravado(iNRoRecibo);
                  cdsRendimentosDB.Data := cdsGridRendimentos.Data;
                  cdsInfPrev.Data := oDaconMT.MostrarPreviDIPJGravado(iNRoRecibo);
                  sbtnGeraArquivo.Enabled := true;

               End
            Else
               Begin

               End;
         End;
      2: // já existe o recibo
         Begin
            If MsgDlg(MSG006, 'Atenção', mtConfirmation, [mbYes, mbNo], 0) = idYes Then
               Begin
                  sTpDeclaracao := '1';
                  bTipoDIPJ := false;
                  cdsSintetico.Data := oDaconMT.MostraDIPJSintetico(StrToInt(sTipoForm), idNormaLoc, sExercicio);
                  cdsSinteticoAnoAnt.Data := oDaconMT.MostraDIPJSinteticoAnoAnt(StrToInt(sTipoForm), idNormaLoc, 0, sExercicio);
                  cdsAnalitico.Data := oDaconMT.MostraDIPJAnalitico(StrToInt(sTipoForm), idNormaLoc, sExercicio);
                  cdsInfoAdic.Data := oDaconMT.CarregarInformacoesAdicionaisDIPJ(sExercicio);
                  cdsRendimentosDB.data := oDaconMT.CarregarDadosRendimento(sExercicio);
                  //cdsGridRendimentos.data := oDaconMT.CarregarDadosRendimento(sExercicio);

                  cdsInfPrev.Data := oDaconMT.MostrarPreviDIPJSintetico(idNormaLoc, sExercicio);
                  cdsPrevCompl.Data := oDaconMT.MostraPreviComplDIPJ(idNormaLoc, sExercicio);

                  //            {cdsPrevTot.Data :=} oDaconMT.TotalizaPrevidenciario(cdsInfPrev, idNormaLoc, sExercicio);
                  cdsInfPrev.Data := oDaconMT.TotalizaPrevidenciario(cdsInfPrev, idNormaLoc, sExercicio);

                  edQtdEmprIniPer.text := oDaconMT.ContaQtdFuncPer(sExercicio, 1);
                  edQtdEmprFimPer.text := oDaconMT.ContaQtdFuncPer(sExercicio, 2);

                  idTipoG := StrToInt(sTipoForm);
                  idNormaG := idNormaLoc;
                  pExercicioG := sExercicio;
                  CarregarDadosControles();

                  AjustaComboBoxLinhas(1, iNRoRecibo);

                  fAtivo := oDaconMT.TotalPorCategoria(idTipoG, idNormaG, 1, pExercicioG);
                  fPassivo := oDaconMT.TotalPorCategoria(idTipoG, idNormaG, 2, pExercicioG);

                  edTotalAtivo.Text := FloatToStrf(fAtivo, FFnumber, 16, 2);
                  edTotalPassivo.Text := FloatToStrf(fPassivo, FFnumber, 16, 2);

                  If fAtivo < 0 Then fAtivo := fAtivo * -1;
                  If fPassivo < 0 Then fPassivo := fPassivo * -1;

                  fTotal := fAtivo - fPassivo;

                  edResultado.Text := FloatToStrf(fTotal, FFnumber, 16, 2);

                  Try
                     dtmBaseDados.dbBaseDados.StartTransaction;
                     iNRoRecibo := oDaconMT.InsertTabReciboDIPJ(idNormaLoc, IdReciboG, pExercicioG, 'S');
                     If iNRoRecibo <> 0 Then
                        Begin
                           If (oDaconMT.InsertTabAnaliticoDIPJ(cdsAnalitico, iNRoRecibo)) Then
                              If (oDaconMT.InsertTabRendimentosDIPJ(cdsRendimentosDB, iNRoRecibo, idNormaG, pExercicioG)) Then
                                 If (oDaconMT.InsertTabContribPrevDIPJ(cdsInfPrev, iNRoRecibo, idNormaG)) Then
                                    If (oDaconMT.InsertTabContribPrevDIPJ(cdsPrevCompl, iNroRecibo, idNormaG)) Then
                                       dtmBaseDados.dbBaseDados.Commit;
                           IdReciboRetG := IdReciboG;
                           IdReciboG := iNRoRecibo;
                           MudaStatusBtn(true);
                        End
                     Else
                        Begin
                           //mensagem de erro
                        End;
                  Except
                     On E: Exception Do
                        dtmBaseDados.dbBaseDados.Rollback;
                  End;
                  cdsGridRendimentos.Data := oDaconMT.MostraRendimentosDIPJGravado(iNRoRecibo);
                  cdsRendimentosDB.Data := cdsGridRendimentos.Data;
                  cdsInfPrev.Data := oDaconMT.MostrarPreviDIPJGravado(iNRoRecibo);
                  sbtnGeraArquivo.Enabled := true;
                  edNumRecibo.Text := '';
                  edDataRecibo.Date := Now;

               End
            Else
               Begin
                  IdReciboG := 0;
               End;

         End;
   End;

End;

Function TfrmCadDIPJ.ValidaDadosDacon: Boolean;

   Function IsExisteLancamentoContabilPeriodo: Boolean;
   Begin
      Result := oDaconMT.VerificarLancamentosContabeis(sExercicio, sPeriodo, sTipoForm, IdNormaAtual);
   End;

   Function ExcluiDadosRelatorio: Boolean;
   Begin
      Result := oDaconMT.ExcluiDadosRelatorio(sExercicio, sPeriodo, sTipoForm, sRetificadora, IdNormaAtual);
   End;

   Function RecalculaDadosRelatorio: Boolean;
   Begin
      Result := oDaconMT.InserirSaldoPlanoContabil(sExercicio, sPeriodo, sTipoForm, sRetificadora, IdNormaAtual);
   End;

Begin
   Result := True;
   // 3.3.2. O sistema valida os dados (RN005, MSG003, RN006, MSG004, RN007, MSG005).

   If edExercicio.Text = EmptyStr Then
      Begin
         Result := False;
         MsgDlg(MSG003, 'Erro', mtError, [mbOK], 0);
         exit;
      End;

   If Not IsExisteLancamentoContabilPeriodo() Then
      Begin
         Result := False;
         MsgDlg(MSG004, 'Erro', mtError, [mbOK], 0);
         exit;
      End;

   If IsExisteRelatorioGerado() Then
      Begin
         If Not (IsExisteRelatorioGeradoReticador) Then
            Begin
               If MsgDlg(MSG005, 'Atenção', mtConfirmation, [mbYes, mbNo], 0) = idYes Then
                  If ExcluiDadosRelatorio() Then
                     //               If RecalculaDadosRelatorio() Then    // pnobre
                     CarregaDadosRelatorio()
                  Else
                     Result := False;
            End
         Else
            Begin
               ShowMessage('Não é possivel criar um relatório retificador com um já existente sem número de recibo');
               Result := False;
            End;
      End
   Else
      CarregaDadosRelatorio();
End;

Function TfrmCadDIPJ.IsExisteRelatorioGerado: Boolean;
Begin
   Result := oDaconMT.IsExisteRelatorioGerado(sExercicio, sPeriodo, sTipoForm);
End;

Function TfrmCadDIPJ.CarregaDadosRelatorio: Boolean;
Begin
   cdsDadosRelatorio.Data := oDaconMT.CarregaBaseCalculoValores(sExercicio, sPeriodo, sTipoForm, sRetificadora);
   cdsSintetico.Data := oDaconMT.CarregarDadosRelatorioMesAno(sExercicio, sPeriodo, sTipoForm, sRetificadora);
   cdsSintetico.First;
   cbxLinha.ItemIndex := 0;
   cdsInfoAdic.Data := oDaconMT.CarregarInformacoesAdicionais(sExercicio, sPeriodo);
   //Marcio Sanches Spinosa SOL: 126124/126125 Kintana: 656907/656908 - Inicio
   cdsAnalitico.DisableControls;
   cdsAnalitico.Data := oDaconMT.CarregarDadosAnaliticosMesAno(sExercicio, sPeriodo, sTipoForm, sRetificadora, 0, cdsSintetico.FieldByName('IdNorma').asInteger);
   sNumeroAntigo := cdsSintetico.FieldByName('NURECIBO').AsString;
   cdsAnalitico.EnableControls;
   //Baruc
   cdsGridRendimentos.data := oDaconMT.CarregarDadosRendimento(edExercicio.Text);
   // cdsSintetico.data :=  oDaconMT.CarregarDadosDIPJ(edExercicio.Text);

   //Marcio Sanches Spinosa SOL: 126124/126125 Kintana: 656907/656908 - Fim
   CarregarDadosControles();

   Result := True;
End;

Procedure TfrmCadDIPJ.CarregarDadosControles();
Begin
   // Aba Informações Adicionais
   lblCNPJ.Caption := cdsInfoAdic.FieldbyName('CNPJFundacao').asString;
   lblNomeEmpresarial.Caption := cdsInfoAdic.FieldbyName('NomeFundacao').asString;

   lblNomeResp.Caption := cdsInfoAdic.FieldbyName('NomeResponsavel').asString;
   lblCPFResp.Caption := cdsInfoAdic.FieldbyName('CPFResponsavel').asString;
   lblTelefoneResp.Caption := '(' + cdsInfoAdic.FieldByName('DDDResponsavel').asString + ') ' +
      cdsInfoAdic.FieldbyName('FoneResponsavel').asString;
   lblRamalResp.Caption := cdsInfoAdic.FieldbyName('RamalResponsavel').asString;
   lblFaxResp.Caption := '(' + cdsInfoAdic.FieldByName('DDDFAXResponsavel').asString + ') ' +
      cdsInfoAdic.FieldbyName('FaxResponsavel').asString;
   lblCorreio1Resp.Caption := cdsInfoAdic.FieldbyName('EmailResponsavel').asString;
   lblCorreio2Resp.Caption := '';

   lblNomeRepre.Caption := cdsInfoAdic.FieldbyName('NomeRepresentante').asString;
   lblCPFRepre.Caption := cdsInfoAdic.FieldbyName('CPFRepresentante').asString;
   lblTelefoneRepre.Caption := '(' + cdsInfoAdic.FieldByName('DDDRepresentante').asString + ') ' +
      cdsInfoAdic.FieldbyName('FoneRepresentante').asString;
   lblRamalRepre.Caption := cdsInfoAdic.FieldbyName('RamalRepresentante').asString;
   lblFaxRepre.Caption := '(' + cdsInfoAdic.FieldByName('DDDFAXRepresentante').asString + ') ' +
      cdsInfoAdic.FieldbyName('FaxRepresentante').asString;
   lblCorreio1Repre.Caption := cdsInfoAdic.FieldbyName('EmailRepresentante').asString;
   lblCorreio2Repre.Caption := '';
End;

Function TfrmCadDIPJ.CriarRelatorioDacon(Const bRetificador: Boolean): Boolean;

   Function isNormaVigenteDiferenteNormaRelatorio: Boolean;
   Begin
      Result := (oNormaVigente.IdNorma <> IdNormaAtual)
   End;

   Function CarregaNormaRelatorio(): Boolean;
   Begin
      oNormaVigente.ProcurarNormaVigente(IdNormaAtual);
      Result := True;
   End;

   Function CriarRelatorio: Boolean;
   Begin
      Result := oDaconMt.InserirSaldoPlanoContabil(sExercicio, sPeriodo, sTipoForm, sRetificadora, IdNormaAtual); //pnobre
      If Result Then
         Result := CarregaDadosRelatorio();
   End;

Begin
   Result := True;
   If bRetificador Then
      Begin
         sRetificadora := 'S';
         If isNormaVigenteDiferenteNormaRelatorio() Then
            Begin
               If MsgDlg(MSG007, 'Atenção', mtConfirmation, [mbYes, mbNo], 0) = idNo Then
                  CarregaNormaRelatorio();
            End
      End;
   CriarRelatorio();
   sRetificadora := 'N';
End;

Function TfrmCadDIPJ.GerarDacon: Boolean;
Var bRelatorioRetificador: Boolean;
Begin
   // 3.3.3. O sistema gera o DACON (RN008, RN009, MSG006, MSG007, RN010, RN011).
   bRelatorioRetificador := IsExisteRelatorioGeradoNumero();
   If bRelatorioRetificador Then
      MsgDlg(MSG006, 'Atenção', mtWarning, [mbOK], 0);
   result := CriarRelatorioDacon(bRelatorioRetificador);
End;

Function TfrmCadDIPJ.AtualizaDadosDacon: Boolean;
Begin
   // 3.3.4. O sistema apresenta a interface de relatório sintético, figura 6.1 (RN012).
   CarregaDadosRelatorio();
   dbGridSintetico.Invalidate;
   Result := True;
End;

Procedure TfrmCadDIPJ.sbtnExcluiDaconClick(Sender: TObject);
Var
   Texto: String;
   result: Boolean;
   iMes, idNormaLoc, iNRoRecibo, iRet: Integer;
   fAtivo, fPassivo, fTotal: Double;
Begin
   Inherited;
   fAtivo := 0;
   fPassivo := 0;
   fTotal := 0;
   idNormaLoc := 0;
   iNRoRecibo := 0;

   If (edExercicio.Text = EmptyStr) And (edNumReciboPesq.Text = EmptyStr) Then
      Begin
         If (edExercicio.Text = EmptyStr) Then
            Texto := 'Não foi informado o Exercício. Verifique !';
         MsgDlg(Texto, 'Erro', mtError, [mbOK], 0);
      End;

   If IdReciboG = 0 Then
      Begin
         MsgDlg(MSG029, 'Informação', mtInformation, [mbOK], 0);
         exit;
      End;

   If MsgDlg(MSG022, 'Atenção', mtConfirmation, [mbYes, mbNo], 0) = idYes Then
      Begin
         oDaconMT.DeleteTabReciboDIPJ(IdReciboG);
         oDaconMT.DeleteTabAnaliticoDIPJ(IdReciboG);
         oDaconMT.DeleteTabRendimentosDIPJ(IdReciboG);
         oDaconMT.DeleteTabContribPrevDIPJ(IdReciboG);
         LimparCds;

         cdsSintetico.Data := oDaconMT.MostraSinteticoDIPJGravado(IdReciboG, 0);
         cdsAnalitico.Data := oDaconMT.MostraAnaliticoDIPJGravado(IdReciboG);
         cdsGridRendimentos.Data := oDaconMT.MostraRendimentosDIPJGravado(IdReciboG);
         cdsRendimentosDB.Data := cdsGridRendimentos.Data;
         cdsInfoAdic.Data := oDaconMT.CarregarInformacoesAdicionaisDIPJ(edExercicio.Text);
         cdsInfPrev.Data := oDaconMT.MostrarPreviDIPJGravado(IdReciboG);

         AjustaComboBoxLinhas(2, IdReciboG);
      End;
End;

Function TfrmCadDIPJ.ExcluiDacon: Boolean;
Begin
   // 3.6.4. O sistema excluir os dados cadastrais do banco de dados de acordo com a RN015.
   Result := oDaconMT.ExcluiDadosRelatorio(sExercicio, sPeriodo, sTipoForm, sRetificadora, IdNormaAtual);
End;

Function TfrmCadDIPJ.IsPossivelExcluirRelatorio: Boolean;
Begin
   // pnobre
   // 3.6.2. O sistema valida a operação (RN019, MSG013).
   Result := oDaconMT.IsExisteRelatorioGerado(sExercicio, sPeriodo, sTipoForm); // Sem recibo
   If Not Result Then
      MsgDlg(MSG013, 'Erro', mtError, [mbOK], 0)
   Else
      Begin
         // 3.6.3. O sistema solicita conformação da operação (MSG014).
         Result := MsgDlg(MSG014, 'Atenção', mtConfirmation, [mbYes, mbNo], 0) = IdYes;
      End;
End;

Procedure TfrmCadDIPJ.sbtnProcurarClick(Sender: TObject);
Var
   Texto: String;
   result: Boolean;
   iMes, idNormaLoc, iNRoRecibo, iRet: Integer;
   fAtivo, fPassivo, fTotal: Double;
   a, b: Integer;
Begin
   Inherited;
   bTipoDIPJ := true;
   fAtivo := 0;
   fPassivo := 0;
   fTotal := 0;
   idNormaLoc := 0;
   iNRoRecibo := 0;

   If (edExercicio.Text = EmptyStr) And (edNumReciboPesq.Text = EmptyStr) Then
      Begin
         If (edExercicio.Text = EmptyStr) Then
            Texto := 'Não foi informado o Exercício. Verifique !';
         MsgDlg(Texto, 'Erro', mtError, [mbOK], 0);
         exit;
      End;

   idNormaLoc := oDaconMT.iLocNorma(StrToInt(sTipoForm), edExercicio.Text);

   If rgTipo.ItemIndex = 1 Then
      Begin
         Try
            Screen.Cursor := crAppStart;
            frPesqRecDIPJ := TfrPesqRecDIPJ.Create(Self);
            Screen.cursor := crDefault;
            frPesqRecDIPJ.cdsPesqRec.Data := oDaconMT.MostraRecibosRetificadoresDIPJ(edExercicio.Text, idNormaLoc);
            frPesqRecDIPJ.ShowModal;
            iNRoRecibo := idReciboPesq;
            IdReciboG := iNRoRecibo;
         Finally
            FreeAndNil(frPesqRecDIPJ);
         End;
      End
   Else
      Begin
         iNRoRecibo := oDaconMT.ExistirDIPJ(idNormaLoc, edExercicio.Text, edNumReciboPesq.Text);
         IdReciboG := iNRoRecibo;
      End;

   If iNRoRecibo <> 0 Then
      Begin
         cdsSintetico.Data := oDaconMT.MostraSinteticoDIPJGravado(iNRoRecibo, 0);
         cdsAnalitico.Data := oDaconMT.MostraAnaliticoDIPJGravado(iNRoRecibo);
         cdsGridRendimentos.Data := oDaconMT.MostraRendimentosDIPJGravado(iNRoRecibo);
         cdsRendimentosDB.Data := cdsGridRendimentos.Data;
         cdsInfoAdic.Data := oDaconMT.CarregarInformacoesAdicionaisDIPJ(edExercicio.Text);
         cdsInfPrev.Data := oDaconMT.MostrarPreviDIPJGravado(iNRoRecibo);
         //    cdsRendimentosDB.Data   := oDaconMT.MostraRendimentosDIPJGravado(iNRoRecibo);

         PopulaComboQualifRF;

         If idReciboRetPesq = 0 Then idReciboRetPesq := iNroRecibo;

         If idReciboRetPesq <> iNRoRecibo Then
            Begin
               PreencheNroRecibo(idReciboRetPesq, iNroRecibo);
               sTpDeclaracao := '1';
            End
         Else
            PreencheNroRecibo(iNroRecibo, iNroRecibo);

         CarregarDadosControles();
         AjustaComboBoxLinhas(2, iNRoRecibo);

         edQtdEmprIniPer.text := oDaconMT.ContaQtdFuncPer(edExercicio.Text, 1);
         edQtdEmprFimPer.text := oDaconMT.ContaQtdFuncPer(edExercicio.Text, 2);

         fAtivo := oDaconMT.TotalPorCategoriaDIPJGravada(iNroRecibo, 1);
         fPassivo := oDaconMT.TotalPorCategoriaDIPJGravada(iNroRecibo, 2);

         edTotalAtivo.Text := FloatToStrf(fAtivo, FFnumber, 16, 2);
         edTotalPassivo.Text := FloatToStrf(fPassivo, FFnumber, 16, 2);

         If fAtivo < 0 Then fAtivo := fAtivo * -1;
         If fPassivo < 0 Then fPassivo := fPassivo * -1;

         fTotal := fAtivo - fPassivo;

         edResultado.Text := FloatToStrf(fTotal, FFnumber, 16, 2);
         sbtnGeraArquivo.Enabled := true;

      End
   Else
      Begin
         MsgDlg(MSG021, 'Erro', mtError, [mbOK], 0);
         LimparCds;
         sbtnGeraArquivo.Enabled := false;
      End;

End;

Function TfrmCadDIPJ.PesquisarRelatorioNumRecibo: Boolean;
Begin
   sNumeroRecibo := edNumRecibo.Text;
   Result := oDaconMT.PesquisarRelatorioNumRecibo(sNumeroRecibo, sExercicio, sPeriodo, sTipoForm, IdNormaAtual, sRetificadora); //Marcio Sanches Spinosa SOL: 126124/126125 Kintana: 656907/656908
End;

Function TfrmCadDIPJ.PesquisarRelatorioMesAno: Boolean;
Begin
   sExercicio := edExercicio.Text;
   Result := oDaconMT.PesquisarRelatorioMesAno(sExercicio, sPeriodo, sTipoForm, sRetificadora, IdNormaAtual) //Marcio Sanches Spinosa SOL: 126124/126125 Kintana: 656907/656908
End;

Procedure TfrmCadDIPJ.edContaContabilChange(Sender: TObject);
Begin
   Inherited;
   If edContaContabil.Text <> '' Then
      cdsAnalitico.Locate('PlanoConta', edContaContabil.text, [lopartialkey])
   Else
      cdsAnalitico.first;
End;

Procedure TfrmCadDIPJ.pgDadosChange(Sender: TObject);
Begin
   Inherited;
   // pnobre
 {   If pgDados.ActivePageIndex = 1 Then
      Begin
         cdsAnalitico.Data := oDaconMT.CarregarDadosAnaliticosMesAno(sExercicio,
            sPeriodo, sTipoForm, 0, cdsSintetico.FieldByName('IdNorma').asInteger);
         AjustaComboBoxLinhas(idRelatorioDados)
      End;}
End;

Procedure TfrmCadDIPJ.AjustaComboBoxLinhas(pTipoGeracaoDIPJ, iNroRecibo: Integer);
Var
   oCds: TClientDataSet;
Begin

   If pTipoGeracaoDIPJ = 1 Then
      Begin
         oCds := TClientDataSet.Create(Nil);
         oCds.Data := oDaconMT.CarregaLinhasContas(idTipoG, idNormaG, pExercicioG);
         cbxLinha.Items.Clear;
         cbxLinha.Items.AddObject('Todas as Linhas', Pointer(0));

         While Not oCds.Eof Do
            Begin
               cbxLinha.Items.AddObject(oCds.FieldbyName('DescricaoLinha').asString,
                  Pointer(oCds.FieldByName('CodLinha').asInteger));
               oCds.Next;
            End;
         oCds.Close;
         FreeAndNil(oCds);
         cbxLinha.ItemIndex := 0;

      End
   Else
      Begin
         oCds := TClientDataSet.Create(Nil);
         oCds.Data := oDaconMT.CarregaLinhasContasDIPJGravadas(iNroRecibo);
         cbxLinha.Items.Clear;
         cbxLinha.Items.AddObject('Todas as Linhas', Pointer(0));

         While Not oCds.Eof Do
            Begin
               cbxLinha.Items.AddObject(oCds.FieldbyName('DescricaoLinha').asString,
                  Pointer(oCds.FieldByName('CodLinha').asInteger));
               oCds.Next;
            End;
         oCds.Close;
         FreeAndNil(oCds);
         cbxLinha.ItemIndex := 0;

      End;

End;

Procedure TfrmCadDIPJ.cdsAnaliticoAfterScroll(DataSet: TDataSet);
Begin
   Inherited;
   // pnobre
 //   edDebito.Text := floattostrf(cdsAnalitico.FieldByName('Debito').asFloat, ffnumber, 12, 2);
 //   edCredito.Text := floattostrf(cdsAnalitico.FieldByName('Credito').asFloat, ffnumber, 12, 2);

   //Marcio Sanches Spinosa SOL: 126124/126125 Kintana: 656907/656908 - Inicio
   edDebito.Text := FormatCurr('###,##0.00', cdsAnalitico.FieldByName('Debito').AsCurrency);
   edCredito.Text := FormatCurr('###,##0.00', cdsAnalitico.FieldByName('Credito').AsCurrency);
   //Marcio Sanches Spinosa SOL: 126124/126125 Kintana: 656907/656908 - Fim
End;

Procedure TfrmCadDIPJ.btnAtualizarClick(Sender: TObject);
Begin
   Inherited;
   cdsAnalitico.Edit;
   //Marcio Sanches Spinosa SOL: 126124/126125 Kintana: 656907/656908 - Inicio
   If (Pos('R$', edDebito.Text) = 0) Then
      cdsAnalitico.FieldByName('Debito').AsCurrency := StrToCurr(StringReplace(edDebito.Text, '.', '', [rfReplaceAll, rfIgnoreCase]));
   If (Pos('R$', edCredito.Text) = 0) Then
      cdsAnalitico.FieldByName('Credito').AsCurrency := StrToCurr(StringReplace(edCredito.Text, '.', '', [rfReplaceAll, rfIgnoreCase]));
   cdsAnalitico.Post;
   If oDaconMT.AtualizaDadosDIPJ(CdsAnalitico, IdReciboG) Then
      AtualizaDadosGrid(IdReciboG)
   Else
      MsgDlg(MSG032, 'Informação', mtInformation, [mbOK], 0);

   //Marcio Sanches Spinosa SOL: 126124/126125 Kintana: 656907/656908 - FIM
End;

Procedure TfrmCadDIPJ.cbxLinhasClick(Sender: TObject);
Begin
   Inherited;
   cdsAnalitico.data := oDaconMT.CarregarDadosAnaliticosMesAno(sExercicio,
      sPeriodo, sTipoForm, sRetificadora, Integer(cbxLinha.Items.Objects[cbxlinha.ItemIndex]), IdNormaAtual);
End;

Procedure TfrmCadDIPJ.dbGridAnaliticoDrawDataCell(Sender: TObject;
   Const Rect: TRect; Field: TField; State: TGridDrawState);
Begin
   // pnobre
   Inherited;
   If Not CdsAnalitico.isEmpty Then
      Begin
         If Not ((gdSelected In State) Or (gdFixed In State) Or (gdFocused In State)) Then
            Begin
               If Field.Name = 'cdsAnaliticoTOTAL' Then
                  Begin
                     If CdsAnalitico.FieldByName('TOTAL').asFloat < 0 Then
                        Begin
                           dbGridAnalitico.Canvas.Font.Color := clRed;
                           dbGridAnalitico.Canvas.Font.Style := [fsbold];
                        End;
                  End;

               dbGridAnalitico.DefaultDrawDataCell(Rect, Field, State);
            End;
      End;
End;

Procedure TfrmCadDIPJ.btnGravarClick(Sender: TObject);
Var
   iMes, idNormaLoc, iNRoRecibo, iNRoReciboIni, iRet: Integer;
   sSql, sNroRec: String;
Begin
   Inherited;
   idNormaLoc := 0;
   iNRoReciboIni := 0;

   If oDaconMT.ExisteCod99(IdReciboG) Then
      Begin
         MsgDlg(MSG027, 'Informação', mtInformation, [mbOK], 0);
         exit;
      End;

   If edNumRecibo.Text = '' Then
      Begin
         MsgDlg(MSG025, 'Informação', mtInformation, [mbOK], 0);
         edNumRecibo.SetFocus;
         exit;
      End;

   If edExercicio.Text = '' Then
      Begin
         MsgDlg(MSG028, 'Informação', mtInformation, [mbOK], 0);
         edExercicio.SetFocus;
         exit;
      End;

   If IdReciboG = 0 Then
      Begin
         MsgDlg(MSG029, 'Informação', mtInformation, [mbOK], 0);
         exit;
      End;
   {
   idNormaLoc := oDaconMT.iLocNorma(StrToInt(sTipoForm), sExercicio);
   iNRoReciboIni := oDaconMT.ExistirReciboIni(IdReciboG, idNormaLoc, 'S', edExercicio.Text);
   }
   If (oDaconMT.InserirNroReciboDIPJ(IdReciboG, edNumRecibo.Text, edDataRecibo.Date)) = 1 Then
      Begin
         MsgDlg(MSG030, 'Informação', mtInformation, [mbOK], 0);
         MudaStatusBtn(false);
      End
   Else
      Begin
         MsgDlg(MSG031, 'Informação', mtInformation, [mbOK], 0);
         MudaStatusBtn(true);
      End

End;

Procedure TfrmCadDIPJ.dbGridAnaliticoCalcCellColors(Sender: TObject;
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

Function TfrmCadDIPJ.PadLeft(aStr: String; aSize: Integer; aCh: char = ' '): String;
Begin
   While Length(aStr) < aSize Do
      aStr := aCh + aStr;

   Result := aStr;
End;

//Marcio Sanches Spinosa SOL: 126124/126125 Kintana: 656907/656908

Function TfrmCadDIPJ.PadRight(aStr: String; aSize: Integer;
   aCh: char): String;
Begin
   While Length(aStr) < aSize Do
      aStr := aStr + aCh;

   Result := aStr;
End;
//Marcio Sanches Spinosa SOL: 126124/126125 Kintana: 656907/656908
//Marcio Sanches Spinosa SOL: 126124/126125 Kintana: 656907/656908

Procedure TfrmCadDIPJ.LimparCds;
Begin

   lblNomeEmpresarial.Caption := EmptyStr;
   edCredito.Text := EmptyStr;
   edDebito.Text := EmptyStr;
   lblCNPJ.Caption := EmptyStr;
   lblNomeRepre.Caption := EmptyStr;
   lblTelefoneResp.Caption := EmptyStr;
   lblNomeResp.Caption := EmptyStr;
   lblTelefoneResp.Caption := EmptyStr;
   lblCorreio1Resp.Caption := EmptyStr;
   lblRamalResp.Caption := EmptyStr;
   lblCpfResp.Caption := EmptyStr;
   lblFaxResp.Caption := EmptyStr;
   lblCorreio2Resp.Caption := EmptyStr;
   lblNomeRepre.Caption := EmptyStr;
   lblTelefoneRepre.Caption := EmptyStr;
   lblCorreio1Repre.Caption := EmptyStr;
   lblCpfRepre.Caption := EmptyStr;
   lblFaxRepre.Caption := EmptyStr;
   lblRamalRepre.Caption := EmptyStr;
   edReciboSintetico.Text := EmptyStr;
   edQtdEmprIniPer.Text := EmptyStr;
   edQtdEmprFimPer.Text := EmptyStr;
   edReciboSintetico.Text := EmptyStr;
   edNumRecibo.Text := EmptyStr;
   edDataRecibo.Date := Now;
   edNumReciboPesq.Text := EmptyStr;
   edExercicio.Text := '2012';

   lblCNPJ.Caption := EmptyStr;
   lblNomeEmpresarial.Caption := EmptyStr;
   lblNomeResp.Caption := EmptyStr;
   lblTelefoneResp.Caption := EmptyStr;
   gbResponsavel.Caption := EmptyStr;
   lblRamalResp.Caption := EmptyStr;
   lblCpfResp.Caption := EmptyStr;
   lblFaxResp.Caption := EmptyStr;
   lblCorreio2Resp.Caption := EmptyStr;
   lblNomeRepre.Caption := EmptyStr;
   lblTelefoneRepre.Caption := EmptyStr;
   lblCorreio1Repre.Caption := EmptyStr;
   lblRamalRepre.Caption := EmptyStr;
   lblCpfRepre.Caption := EmptyStr;
   lblFaxRepre.Caption := EmptyStr;
   lblCorreio2Repre.Caption := EmptyStr;
   cbxLinha.Text := EmptyStr;
   edTotalAtivo.Text := EmptyStr;
   edTotalPassivo.Text := EmptyStr;
   edResultado.Text := EmptyStr;
   edContaContabil.Text := EmptyStr;
   edCPFDir.Text := EmptyStr;
   edNomeDir.Text := EmptyStr;
   edCargoDir.Text := EmptyStr;
   cbListQualfRF.Text := EmptyStr;

End;
//Marcio Sanches Spinosa SOL: 126124/126125 Kintana: 656907/656908

Function TfrmCadDIPJ.IsExisteRelatorioGeradoNumero: Boolean;
Begin
   Result := oDaconMT.IsExisteRelatorioGeradoNumero(sExercicio, sPeriodo, sTipoForm);
End;

//Marcio Sanches Spinosa SOL: 126124/126125 Kintana: 656907/656908

Procedure TfrmCadDIPJ.rgTipoClick(Sender: TObject);
Begin
   Inherited;

   If (rgTipo.ItemIndex = 0) Then
      sRetificadora := 'N'
   Else
      sRetificadora := 'S';
   edNumRecibo.Text := EmptyStr;
End;
//Marcio Sanches Spinosa SOL: 126124/126125 Kintana: 656907/656908

Procedure TfrmCadDIPJ.dbGridSinteticoRowChanged(Sender: TObject);
Begin
   Inherited;
   {
   edNumRecibo.Text := dbGridSintetico.Fields[0].AsString;
   sNumeroAntigo    := dbGridSintetico.Fields[0].AsString;
   }
End;

Function TfrmCadDIPJ.IsExisteRelatorioGeradoReticador: Boolean;
Begin
   Result := oDaconMT.IsExisteRelatorioGeradoReticador(sExercicio, sPeriodo, sTipoForm);
End;

Procedure TfrmCadDIPJ.cbxLinhaClick(Sender: TObject);
Begin
   Inherited;
   cdsAnalitico.DisableControls;
   cdsAnalitico.Data := oDaconMT.MostrarGridAnaliticoPorConta(idTipoG, idNormaG, IdReciboG, pExercicioG, IntToStr(Integer(cbxLinha.Items.Objects[cbxlinha.ItemIndex])));
   cdsAnalitico.EnableControls;
End;

Function TfrmCadDIPJ.ExistirDIPJ(idNorma: Integer; pExercicio: String): Integer;
Var
   qryAux: Twwquery;
   iRes: Integer;
   pNroRec: String;
Begin
   iRes := 0;
   pNroRec := '';

   qryAux := Twwquery.Create(Nil);
   qryAux.DataBaseName := 'BaseDados';
   qryAux.Close;
   qryAux.SQL.Clear;
   qryAux.SQL.Add('SELECT IDRECIBO, NUMERORECIBO  FROM RECIBOS_DIPJ ');
   qryAux.SQL.Add('WHERE ');
   qryAux.SQL.Add('EXERCICIO = :EXERCICIO AND ');
   qryAux.SQL.Add('IDNORMA   = :IDNORMA ');
   qryAux.ParamByName('EXERCICIO').AsString := pExercicio;
   qryAux.ParamByName('IDNORMA').AsInteger := idNorma;
   qryAux.Open;
   If Not qryAux.Eof Then
      Begin
         pNroRec := qryAux.FieldByName('NUMERORECIBO').AsString;
         IdReciboG := qryAux.FieldByName('IDRECIBO').AsInteger;
         If pNroRec = '' Then
            Begin
               iRes := 1;
               MudaStatusBtn(true);
            End
         Else
            Begin
               iRes := 2;
               MudaStatusBtn(false);
            End;
      End
   Else
      MudaStatusBtn(true);

   result := iRes;
   freeandnil(qryAux);
End;

Procedure TfrmCadDIPJ.PreencheNroRecibo(idReciboRetPesq, iNroRecibo: Integer);
Var
   qryAux: Twwquery;
Begin
   qryAux := Twwquery.Create(Nil);
   qryAux.DataBaseName := 'BaseDados';
   qryAux.Close;
   qryAux.SQL.Clear;

   qryAux.SQL.Add(' SELECT ');
   qryAux.SQL.Add(' A.NUMERORECIBO RECIBOINI, A.DATARECIBO DATAINI, B.NUMERORECIBO RECIBORET, B.DATARECIBO DATARET ');
   qryAux.SQL.Add(' FROM RECIBOS_DIPJ A, RECIBOS_DIPJ B ');
   qryAux.SQL.Add(' WHERE ');
   qryAux.SQL.Add(' A.IDRECIBO = :A.IDRECIBO AND ');
   qryAux.SQL.Add(' B.IDRECIBO = :B.IDRECIBO ');
   qryAux.ParamByName('A.IDRECIBO').AsInteger := idReciboRetPesq;
   qryAux.ParamByName('B.IDRECIBO').AsInteger := iNroRecibo;
   qryAux.Open;
   If Not qryAux.Eof Then
      Begin
         edReciboSintetico.Text := qryAux.FieldByName('RECIBOINI').AsString;
         sReciboIni := qryAux.FieldByName('RECIBOINI').AsString;
         edDtRecIni.Text := qryAux.FieldByName('DATAINI').AsString;
         edNumRecibo.Text := qryAux.FieldByName('RECIBORET').AsString;
         If edNumRecibo.Text <> '' Then
            Begin
               edDataRecibo.Date := qryAux.FieldByName('DATARET').AsDateTime;
               MudaStatusBtn(false);
            End
         Else
            Begin
               MudaStatusBtn(true);
            End;
      End
   Else
      MudaStatusBtn(true);
   freeandnil(qryAux);
End;

Function TfrmCadDIPJ.GeraArquivoDIPJ(iNroRecibo: Integer; sNomeArquivo, strExercicio, sCNPJ: String): boolean;
Var
   pCompetencia, pCnpj, sAno, sHeader, sTrailler, sR01, sR02, sR03, sR36, sR37: String;
   iAnoAtual, iAnoAnt, iFileHandle: Integer;
   lstNwFile: TStringList;

   Tipo61, ReservadoA61, SeqEntrada61, CNPJContribuinte61, AnoCalendario61, DeclRetif61,
      Cpf61, Nome61, Qualificacao61, Rendimentos61, DemaisRendimentos61, Irrf61,
      ReservadoB61, ReservadoC61, DadosR61: String;
   iNroSeq61: Integer;
   LinhasR61: Array Of String;
   iNroLinhaR61, x61: Integer;
Begin
   PreparaTabRendimentos(iNroRecibo);
   lstNwFile := TStringList.Create;
   lstNwFile.LoadFromFile(sNomeArquivo);
   lstNwFile.Add(MontaHeader(strExercicio));
   lstNwFile.Add(MontaR01);
   lstNwFile.Add(MontaR02);
   lstNwFile.Add(MontaR03);
   lstNwFile.Add(MontaR36_02(strExercicio));
   lstNwFile.Add(MontaR36_01(iNroRecibo));
   lstNwFile.Add(MontaR37_02(strExercicio));
   lstNwFile.Add(MontaR37_01(iNroRecibo));
   lstNwFile.Add(MontaR61(iNroRecibo));
   lstNwFile.Add(MontaR70(iNroRecibo));
   lstNwFile.Add(MontaTrailler);

   lstNwFile.SaveToFile(sNomeArquivo);
   lstNwFile.Free;
   result := true;
End;

Function TfrmCadDIPJ.MontaHeader(sAno: String): String;
Var
   sSistema, sReservadoA, sAnoLancamentoPGD, sReservadoB: String;
Begin
   {
   Ordem     Campo                       Início    Fim    Tamanho     Formato
   01        Sistema                          1      4        4       X
   02        Reservado                        5      8        4       Branco(s)
   03        Ano de Lançamento do PGD         9     12        4       N
   04        Reservado                       13    374      362       Branco(s)
   05        Delimitador de Registro        375    376        2       EOL

   }
   //- Zerando variaveis
   sSistema := '';
   sReservadoA := '';
   sAnoLancamentoPGD := '';
   sReservadoB := '';
   //----------------------
   sSistema := 'DIPJ';
   sReservadoA := Padright(sReservadoA, 4, ' ');
   sAnoLancamentoPGD := FormatDateTime('YYYY', Now);
   sReservadoB := Padright(sReservadoB, 362, ' ');
   result := sSistema + sReservadoA + sAnoLancamentoPGD + sReservadoB;
End;

Function TfrmCadDIPJ.MontaR01: AnsiString;
Var
   sTipo, sReservadoA, sReservadoB, sCNPJ, sAnoCalendario, sDeclaracaoRetificadora,
      sNroReciboDIPJRetificada, sSituacaoEspecial, sDataDoEvento, sInicioDoPeriodo,
      sFimDoPeriodo, sOptantePeloRefis, sOptantePeloPaes, sFormaDeTributacao,
      sQualificacadoPessoaJuridica, sApuracaoIRPJeCSLL, sTrimesttesLucroArbitrado,
      sApuracaoDoIRPJeDaCSLLporTrimestre, sApuracaoInformacoesIPInoPeriodo,
      sAdministradoraDeFundosClubesDeInvestimento, sAtivosNoExterior,
      sParticipacaoPermanenteColigadasOuControladas, sComEletrTI, sRecebimentoDeRoyalties,
      sPagamentoDeRoyalties, sRendimentosJuroseDividendos, sPagamentoJuroseDividendos,
      sInovacaoTI, sCapacitacaoTI, sPJcomPaDeCoisa, sPoloIndustrial, sOperacaoExterior,
      sOperacaoPessoaInter, sParticExterior, sDoacaoPolitica, sLucroExploracao, sIsencaoIR,
      sAtivRural, sFFF, sPJComExp, sPJEVECEFEE, sPartConsEmpr, sRendRecExt, sPagExtg,
      sZonaProcessExport, sAreaLivre, sTpEntid, sInclSimples, sDtInclSimples, sVlrRecVendPJ,
      sPJSujAliqCSLL, sFormEscr, sReservadoC, sOptanteEfeitoMP627 {Paulo Nobre - SOL 231060 PPM 377414}: String;
Begin
   //01
   sTipo := 'R01';
   //02
   sReservadoA := Padright(' ', 1, ' ');
   //03
   sReservadoB := PadLeft('0', 4, '0');
   //04
   sCNPJ := '00436923000190';
   //05
   // Paulo Nobre - SOL 231060 PPM 377414
{   If edExercicio.text = '2012' Then
      sAnoCalendario := '1';
   If edExercicio.text = '2011' Then
      sAnoCalendario := '0';}

   // Paulo Nobre - SOL 231060 PPM 377414
   // Se ano for PAR (resto = 0) então o campo será 1
   If strtoint(edExercicio.text) Mod 2 = 0 Then
      sAnoCalendario := '1'
   Else
      sAnoCalendario := '0';
   //
   //06
   sDeclaracaoRetificadora := sTpDeclaracao;
   //07
   If sTpDeclaracao = '1' Then
      sNroReciboDIPJRetificada := PadLeft(sReciboIni, 12, '0')
   Else
      sNroReciboDIPJRetificada := PadLeft('0', 12, '0');
   //08
   sSituacaoEspecial := '0';
   //09
   sDataDoEvento := '0000';
   //10
   sInicioDoPeriodo := '0101';
   //11
   sFimDoPeriodo := '3112';
   //12
   sOptantePeloRefis := '0';
   //13
   sOptantePeloPaes := '0';
   //14
   sFormaDeTributacao := '7';
   //15
   sQualificacadoPessoaJuridica := '0';
   //16
   sApuracaoIRPJeCSLL := '3';
   //17
   sTrimesttesLucroArbitrado := '0000';
   //18
   sApuracaoDoIRPJeDaCSLLporTrimestre := '0000';
   //19
   sApuracaoInformacoesIPInoPeriodo := '0';
   //20
   sAdministradoraDeFundosClubesDeInvestimento := '0';
   //21
   sAtivosNoExterior := '0';
   //22
   sParticipacaoPermanenteColigadasOuControladas := '0';
   //23
   sComEletrTI := '0';
   //24
   sRecebimentoDeRoyalties := '0';
   //25
   sPagamentoDeRoyalties := '0';
   //26
   sRendimentosJuroseDividendos := '0';
   //27
   sPagamentoJuroseDividendos := '0';
   //28
   sInovacaoTI := '0';
   //29
   sCapacitacaoTI := '0';
   //30
   sPJcomPaDeCoisa := '0';
   //31
   sPoloIndustrial := '0';
   //32
   sOperacaoExterior := '0';
   //33
   sOperacaoPessoaInter := '0';

   // Paulo Nobre - SOL 231060 KTN
   //34
   sOptanteEfeitoMP627 := '1'; // Sim
   If sAnoCalendario = '0' Then
      sOptanteEfeitoMP627 := '0'; // Não Marcado
   //

   //35
   sParticExterior := '0';
   //36
   sDoacaoPolitica := '0';
   //37
   sLucroExploracao := '0';
   //38
   sIsencaoIR := '0';
   //39
   sAtivRural := '0';
   //40
   sFFF := '0';
   //41
   sPJComExp := '0';
   //42
   sPJEVECEFEE := '0';
   //43
   sPartConsEmpr := '0';
   //44
   sRendRecExt := '0';
   //45
   sPagExtg := '0';
   //46
   sZonaProcessExport := '0';
   //47
   sAreaLivre := '0';
   //48
   sTpEntid := '06';
   //49
   sInclSimples := '0';
   //50
   sDtInclSimples := PadLeft('0', 8, '0');
   //51
   sVlrRecVendPJ := PadLeft('0', 14, '0');
   //52
   sPJSujAliqCSLL := '0';
   //53
   sFormEscr := '0';
   //54
   sReservadoC := Padright(' ', 10, ' ');

   result := sTipo + sReservadoA + sReservadoB + sCNPJ + sAnoCalendario + sDeclaracaoRetificadora +
      sNroReciboDIPJRetificada + sSituacaoEspecial + sDataDoEvento + sInicioDoPeriodo +
      sFimDoPeriodo + sOptantePeloRefis + sOptantePeloPaes + sFormaDeTributacao +
      sQualificacadoPessoaJuridica + sApuracaoIRPJeCSLL + sTrimesttesLucroArbitrado +
      sApuracaoDoIRPJeDaCSLLporTrimestre + sApuracaoInformacoesIPInoPeriodo +
      sAdministradoraDeFundosClubesDeInvestimento + sAtivosNoExterior +
      sParticipacaoPermanenteColigadasOuControladas + sComEletrTI + sRecebimentoDeRoyalties +
      sPagamentoDeRoyalties + sRendimentosJuroseDividendos + sPagamentoJuroseDividendos +
      sInovacaoTI + sCapacitacaoTI + sPJcomPaDeCoisa + sPoloIndustrial + sOperacaoExterior +
      sOperacaoPessoaInter + sOptanteEfeitoMP627 {Paulo Nobre - SOL 231060 KTN} + sParticExterior + sDoacaoPolitica + sLucroExploracao + sIsencaoIR +
   sAtivRural + sFFF + sPJComExp + sPJEVECEFEE + sPartConsEmpr + sRendRecExt + sPagExtg +
      sZonaProcessExport + sAreaLivre + sTpEntid + sInclSimples + sDtInclSimples + sVlrRecVendPJ +
      sPJSujAliqCSLL + sFormEscr + sReservadoC;

End;

Function TfrmCadDIPJ.MontaR02: AnsiString;
Var
   sTipo, sReservadoA, sReservadoB, sCNPJContribuinte, sAnoCalendario, sDeclaracaoRetificadora,
      sNomeEmpresarial, sCodNatJuridica, sCodAtivEconomica, sTipoLogradouro, sLogradouro, sNumero,
      sComplemento, sBairro, sUF, sMunicipio, sCEP, sDDDFone, sFone, sDDDFax, sFax, sCxPostal,
      sUFCxaPostal, sCEPCxaPostal, sEmail, sReservadoC: String;
Begin
   // Zerando as variaveis
   // Colocando conteudo
   //01
   sTipo := 'R02';
   //02
   sReservadoA := Padright(sReservadoA, 1, ' ');
   //03
   sReservadoB := Padright('0', 4, '0');
   //04
   sCNPJContribuinte := '00436923000190';
   //05
   // Paulo Nobre - SOL 231060 PPM 377414
{   If edExercicio.text = '2012' Then
      sAnoCalendario := '1';
   If edExercicio.text = '2011' Then
      sAnoCalendario := '0';}

   // Paulo Nobre - SOL 231060 PPM 377414
   // Se ano for PAR (resto = 0) então o campo será 1
   If strtoint(edExercicio.text) Mod 2 = 0 Then
      sAnoCalendario := '1'
   Else
      sAnoCalendario := '0';
   //
   //06
   sDeclaracaoRetificadora := sTpDeclaracao;
   //07
   sNomeEmpresarial := Padright('FUNCEF - FUNDACAO DOS ECONOMIARIOS FEDERAIS', 150, ' ');
   //08
   sCodNatJuridica := '3999';
   //09
   sCodAtivEconomica := '6541300';
   //10
   sTipoLogradouro := '29';
   //11
   sLogradouro := Padright('SCN QUADRA BLOCO A ED. CORPORATE FINANCIAL CENTER', 150, ' ');
   //12
   sNumero := Padright(' ', 6, ' ');
   //13
   sComplemento := Padright('12 E 13 ANDARES', 50, ' ');
   //14
   sBairro := Padright('ASA NORTE', 50, ' ');
   //15
   sUF := 'DF';
   //16
   sMunicipio := '9701';
   //17
   sCEP := '70712900';
   //18
   sDDDFone := '  61';
   //19
   // Paulo Nobre - SOL 231060 PPM 377414
   sFone := Padright('33291950', 9, ' ');
   //20
   sDDDFax := Padright(' ', 4, ' ');
   //21
   // Paulo Nobre - SOL 231060 PPM 377414
   sFax := Padright(' ', 9, ' ');
   //22
   sCxPostal := Padright(' ', 6, ' ');
   //23
   sUFCxaPostal := Padright(' ', 2, ' ');
   //24
   sCEPCxaPostal := Padright(' ', 8, ' ');
   //25
   sEmail := Padright('FUNCEF@FUNCEF.COM.BR', 115, ' ');
   //26
   sReservadoC := Padright(' ', 10, ' ');

   result := sTipo + sReservadoA + sReservadoB + sCNPJContribuinte + sAnoCalendario + sDeclaracaoRetificadora +
      sNomeEmpresarial + sCodNatJuridica + sCodAtivEconomica + sTipoLogradouro + sLogradouro + sNumero +
      sComplemento + sBairro + sUF + sMunicipio + sCEP + sDDDFone + sFone + sDDDFax + sFax + sCxPostal +
      sUFCxaPostal + sCEPCxaPostal + sEmail + sReservadoC;
End;

Function TfrmCadDIPJ.MontaR03: String;
Var
   sTipo, sReservadoA, sReservadoB, sCNPJContribuinte, sAnoCalendario, sDeclaracaoRetificadora, sNomeDoRepresentante,
      sCPFRepresentante, sDDDTelefoneRepresentante, sTelefoneRepresentante, sRamalRepresentante, sDDDFaxRepresentante,
      sFaxRepresentante, sEmailRepresentante, sNomeResponsavel, sCPFResponsavel, sCRCResponsavel, sUFCRCResponsavel,
      sDDDFoneResponsavel, sFoneResponsavel, sRmlResponsavel, sDDDFaxResponsavel, sFaxResponsavel, sEmailResponsavel,
      sReservadoC: String;
Begin
   //monta linha
   //01
   sTipo := 'R03';
   //02
   sReservadoA := ' ';
   //03
   sReservadoB := Padright('0', 4, '0');
   //04
   sCNPJContribuinte := '00436923000190';
   //05
    // Paulo Nobre - SOL 231060 PPM 377414
{   If edExercicio.text = '2012' Then
      sAnoCalendario := '1';
   If edExercicio.text = '2011' Then
      sAnoCalendario := '0';}

   // Paulo Nobre - SOL 231060 PPM 377414
   // Se ano for PAR (resto = 0) então o campo será 1
   If strtoint(edExercicio.text) Mod 2 = 0 Then
      sAnoCalendario := '1'
   Else
      sAnoCalendario := '0';
   //
   //06
   sDeclaracaoRetificadora := sTpDeclaracao;
   //07
   sNomeDoRepresentante := Padright('ANTONIO BRAULIO DE CARVALHO', 150, ' ');
   //08
   sCPFRepresentante := '30988276615';
   //09
   sDDDTelefoneRepresentante := '  61';
   //10
   // Paulo Nobre - SOL 231060 PPM 377414
   sTelefoneRepresentante := Padright('33291932', 9, ' ');
   //11
   sRamalRepresentante := Padright(' ', 5, ' ');
   //12
   sDDDFaxRepresentante := '  61';
   //13
   // Paulo Nobre - SOL 231060 PPM 377414
   sFaxRepresentante := Padright('33291932', 9, ' ');
   //14
   sEmailRepresentante := Padright('DIPEC@FUNCEF.COM.BR', 115, ' ');
   //15
   sNomeResponsavel := Padright('RODRIGO LEANDRO ANDRETTO', 150, ' ');

   sCPFResponsavel := '80400515172';

   sCRCResponsavel := '14339          ';

   sUFCRCResponsavel := 'DF';

   sDDDFoneResponsavel := '  61';

   // Paulo Nobre - SOL 231060 PPM 377414
   sFoneResponsavel := Padright('33291932', 9, ' ');

   sRmlResponsavel := Padright(' ', 5, ' ');

   sDDDFaxResponsavel := '  61';

   // Paulo Nobre - SOL 231060 PPM 377414
   sFaxResponsavel := Padright('33291932', 9, ' ');

   sEmailResponsavel := Padright('ANDRETTO@FUNCEF.COM.BR', 115, ' ');
   //25
   sReservadoC := Padright(' ', 10, ' ');

   result := sTipo + sReservadoA + sReservadoB + sCNPJContribuinte + sAnoCalendario + sDeclaracaoRetificadora + sNomeDoRepresentante +
      sCPFRepresentante + sDDDTelefoneRepresentante + sTelefoneRepresentante + sRamalRepresentante + sDDDFaxRepresentante +
      sFaxRepresentante + sEmailRepresentante + sNomeResponsavel + sCPFResponsavel + sCRCResponsavel + sUFCRCResponsavel +
      sDDDFoneResponsavel + sFoneResponsavel + sRmlResponsavel + sDDDFaxResponsavel + sFaxResponsavel + sEmailResponsavel +
      sReservadoC;

   //Padright(cdsInfoAdic.FieldByName('Sistema').AsString, 8, ' '));  PREENCHER COM BRANCO
   //PadRight(cdsInfoAdic.FieldByName('PISPasepCofins').AsString, 1, '0')); PREENCHER COM 0

End;

Function TfrmCadDIPJ.MontaR36_01(iNRoRecibo: Integer): String;
Var
   Tipo, ReservadoA, Trimestre, Coluna, CNPJContribuinte, sAnoCalendario, sLinhaR36,
      DeclRetif, ReservadoB, ReservadoC: String;
   LinhasR36: Array Of String;
   iNroLinhaR36, x: Integer;
Begin
   // zerar variaveis
   iNroLinhaR36 := 1;
   SetLength(LinhasR36, 16);
   Tipo := '';
   ReservadoA := '';
   Trimestre := '';
   Coluna := '';
   CNPJContribuinte := '';
   sAnoCalendario := '';
   DeclRetif := '';
   sLinhaR36 := '';
   ReservadoB := '';
   ReservadoC := '';

   //carregar dados
   //01
   Tipo := 'R36';
   //02
   ReservadoA := 'D';
   //03
   Trimestre := '00';
   //04
   Coluna := '02';
   //05
   CNPJContribuinte := '00436923000190';
   //06

    // Paulo Nobre - SOL 231060 PPM 377414
{   If edExercicio.text = '2012' Then
      sAnoCalendario := '1';
   If edExercicio.text = '2011' Then
      sAnoCalendario := '0';}

   // Paulo Nobre - SOL 231060 PPM 377414
   // Se ano for PAR (resto = 0) então o campo será 1
   If strtoint(edExercicio.text) Mod 2 = 0 Then
      sAnoCalendario := '1'
   Else
      sAnoCalendario := '0';
   //

   //07
   DeclRetif := sTpDeclaracao;

   sLinhaR36 := '0';

   ReservadoB := '0';
   ReservadoC := ' ';

   cdsSintetico.Data := oDaconMT.MostraSinteticoDIPJGravado(iNRoRecibo, 1);
   cdsSintetico.DisableControls;
   cdsSintetico.first;
   While Not cdsSintetico.eof Do
      Begin
         If cdsSintetico.FieldByName('CODLINHA').asInteger = iNroLinhaR36 Then
            LinhasR36[iNroLinhaR36 - 1] := PadLeft(TiraPontoeVirgulaSinal(FloatToStrF(cdsSintetico.FieldByName('TOTAL').AsCurrency, FFnumber, 16, 2)), 14, '0')
         Else If cdsSintetico.FieldByName('CODLINHA').asInteger > iNroLinhaR36 Then
            Begin
               LinhasR36[iNroLinhaR36 - 1] := PadLeft(sLinhaR36, 14, '0');
               inc(iNroLinhaR36);
               Continue;
            End;
         cdsSintetico.Next;
         inc(iNroLinhaR36);
      End;
   cdsSintetico.Data := oDaconMT.MostraSinteticoDIPJGravado(iNRoRecibo, 0);
   cdsSintetico.EnableControls;

   ReservadoB := PadLeft(ReservadoB, 1246, '0');

   ReservadoC := Padright(ReservadoC, 10, ' ');

   sLinhaR36 := '';

   For x := 0 To 15 Do
      Begin
         If LinhasR36[x] <> '' Then
            sLinhaR36 := sLinhaR36 + LinhasR36[x]
         Else
            sLinhaR36 := sLinhaR36 + PadLeft('0', 14, '0')
      End;

   result := Tipo + ReservadoA + Trimestre + Coluna + CNPJContribuinte + sAnoCalendario +
      DeclRetif + sLinhaR36 + ReservadoB + ReservadoC;
End;

Function TfrmCadDIPJ.MontaR36_02(sExercAntr: String): String;
Var
   Tipo, ReservadoA, Trimestre, Coluna, CNPJContribuinte, sAnoCalendario, sLinhaR36,
      DeclRetif, ReservadoB, ReservadoC: String;
   LinhasR36: Array Of String;
   iNroLinhaR36, x: Integer;
Begin
   // zerar variaveis
   iNroLinhaR36 := 1;
   SetLength(LinhasR36, 16);
   Tipo := '';
   ReservadoA := '';
   Trimestre := '';
   Coluna := '';
   CNPJContribuinte := '';
   sAnoCalendario := '';
   DeclRetif := '';
   sLinhaR36 := '';
   ReservadoB := '';
   ReservadoC := '';

   //carregar dados
   //01
   Tipo := 'R36';
   //02
   ReservadoA := 'D';
   //03
   Trimestre := '00';
   //04
   Coluna := '01';
   //05
   CNPJContribuinte := '00436923000190';
   //06

    // Paulo Nobre - SOL 231060 PPM 377414
{   If edExercicio.text = '2012' Then
      sAnoCalendario := '1';
   If edExercicio.text = '2011' Then
      sAnoCalendario := '0';}

   // Paulo Nobre - SOL 231060 PPM 377414
   // Se ano for PAR (resto = 0) então o campo será 1
   If strtoint(edExercicio.text) Mod 2 = 0 Then
      sAnoCalendario := '1'
   Else
      sAnoCalendario := '0';
   //
   //07
   DeclRetif := sTpDeclaracao;
   sLinhaR36 := '0';

   ReservadoB := '0';
   ReservadoC := ' ';

   cdsSinteticoAnoAnt.Data := oDaconMT.MostraDIPJSinteticoAnoAnt(0, 0, 1, sExercAntr);
   cdsSinteticoAnoAnt.DisableControls;
   cdsSinteticoAnoAnt.first;
   While Not cdsSinteticoAnoAnt.eof Do
      Begin
         If cdsSinteticoAnoAnt.FieldByName('CODLINHA').asInteger = iNroLinhaR36 Then
            LinhasR36[iNroLinhaR36 - 1] := PadLeft(TiraPontoeVirgulaSinal(FloatToStrF(cdsSinteticoAnoAnt.FieldByName('TOTAL').AsCurrency, FFnumber, 16, 2)), 14, '0')
         Else If cdsSinteticoAnoAnt.FieldByName('CODLINHA').asInteger > iNroLinhaR36 Then
            Begin
               LinhasR36[iNroLinhaR36 - 1] := PadLeft(sLinhaR36, 14, '0');
               inc(iNroLinhaR36);
               Continue;
            End;
         cdsSinteticoAnoAnt.Next;
         inc(iNroLinhaR36);
      End;
   cdsSinteticoAnoAnt.Data := oDaconMT.MostraDIPJSinteticoAnoAnt(0, 0, 1, sExercAntr);
   cdsSinteticoAnoAnt.EnableControls;

   ReservadoB := PadLeft(ReservadoB, 1246, '0');

   ReservadoC := Padright(ReservadoC, 10, ' ');

   sLinhaR36 := '';

   For x := 0 To 15 Do
      Begin
         If LinhasR36[x] <> '' Then
            sLinhaR36 := sLinhaR36 + LinhasR36[x]
         Else
            sLinhaR36 := sLinhaR36 + PadLeft('0', 14, '0')
      End;

   result := Tipo + ReservadoA + Trimestre + Coluna + CNPJContribuinte + sAnoCalendario +
      DeclRetif + sLinhaR36 + ReservadoB + ReservadoC;
End;

Function TfrmCadDIPJ.MontaR37_01(iNRoRecibo: Integer): String;
Var
   Tipo, ReservadoA, Trimestre, Coluna, CNPJContribuinte, sAnoCalendario, sLinhaR37,
      DeclRetif, ReservadoB, ReservadoC: String;
   LinhasR37: Array Of String;
   iNroLinhaR37, x: Integer;
Begin
   // zerar variaveis
   iNroLinhaR37 := 1;

   // Thiago Melo SOL 208941 Kintana 2020125
   //SetLength(LinhasR37, 26);
   // Thiago Melo SOL 208941 Kintana 2020125

   Tipo := '';
   ReservadoA := '';
   Trimestre := '';
   Coluna := '';
   CNPJContribuinte := '';
   sAnoCalendario := '';
   DeclRetif := '';
   sLinhaR37 := '';
   ReservadoB := '';
   ReservadoC := '';

   //carregar dados
   Tipo := 'R37';
   ReservadoA := 'D';
   Trimestre := '00';
   Coluna := '02';
   CNPJContribuinte := '00436923000190';

   // Paulo Nobre - SOL 231060 PPM 377414
{   If edExercicio.text = '2012' Then
     sAnoCalendario := '1';
  If edExercicio.text = '2011' Then
     sAnoCalendario := '0';}

  // Paulo Nobre - SOL 231060 PPM 377414
  // Se ano for PAR (resto = 0) então o campo será 1
   If strtoint(edExercicio.text) Mod 2 = 0 Then
      sAnoCalendario := '1'
   Else
      sAnoCalendario := '0';
   //

   DeclRetif := sTpDeclaracao;
   sLinhaR37 := '0';
   ReservadoB := '0';
   ReservadoC := ' ';

   cdsSintetico.Data := oDaconMT.MostraSinteticoDIPJGravado(iNRoRecibo, 2);

   // Thiago Melo SOL 208941 Kintana 2020125
   //SetLength(LinhasR37, retornaCodMax(cdsSintetico)); // SOL 209775 e SOL 233732 comentado
   // Thiago Melo SOL 208941 Kintana 2020125
   SetLength(LinhasR37, 26); // SOL 209775 e SOL 233732 retornado

   cdsSintetico.DisableControls;
   cdsSintetico.first;
   While Not cdsSintetico.eof Do
      Begin
         If cdsSintetico.FieldByName('CODLINHA').asInteger = iNroLinhaR37 Then
            LinhasR37[iNroLinhaR37 - 1] := PadLeft(TiraPontoeVirgulaSinal(FloatToStrF(cdsSintetico.FieldByName('TOTAL').AsCurrency, FFnumber, 16, 2)), 14, '0')
         Else If cdsSintetico.FieldByName('CODLINHA').asInteger > iNroLinhaR37 Then
            Begin
               LinhasR37[iNroLinhaR37 - 1] := PadLeft(sLinhaR37, 14, '0');
               inc(iNroLinhaR37);
               Continue;
            End;
         cdsSintetico.Next;
         inc(iNroLinhaR37);
      End;
   cdsSintetico.Data := oDaconMT.MostraSinteticoDIPJGravado(iNRoRecibo, 0);
   cdsSintetico.EnableControls;
   ReservadoB := PadLeft(ReservadoB, 1232, '0');
   ReservadoC := Padright(ReservadoC, 10, ' ');
   sLinhaR37 := '';
   For x := 0 To 25 Do
      Begin
         If LinhasR37[x] <> '' Then
            sLinhaR37 := sLinhaR37 + LinhasR37[x]
         Else
            sLinhaR37 := sLinhaR37 + PadLeft('0', 14, '0')
      End;
   result := Tipo + ReservadoA + Trimestre + Coluna + CNPJContribuinte + sAnoCalendario +
      DeclRetif + sLinhaR37 + ReservadoB + ReservadoC;
End;

Function TfrmCadDIPJ.MontaR37_02(sExercAntr: String): String;
Var
   Tipo, ReservadoA, Trimestre, Coluna, CNPJContribuinte, sAnoCalendario, sLinhaR37,
      DeclRetif, ReservadoB, ReservadoC: String;
   LinhasR37: Array Of String;
   iNroLinhaR37, x: Integer;
Begin
   // zerar variaveis
   iNroLinhaR37 := 1;

   // Thiago Melo SOL 208941 Kintana 2020125
   //SetLength(LinhasR37, 26);
   // Thiago Melo SOL 208941 Kintana 2020125

   Tipo := '';
   ReservadoA := '';
   Trimestre := '';
   Coluna := '';
   CNPJContribuinte := '';
   sAnoCalendario := '';
   DeclRetif := '';
   sLinhaR37 := '';
   ReservadoB := '';
   ReservadoC := '';

   //carregar dados
   Tipo := 'R37';
   ReservadoA := 'D';
   Trimestre := '00';
   Coluna := '01';
   CNPJContribuinte := '00436923000190';

   // Paulo Nobre - SOL 231060 PPM 377414
{   If edExercicio.text = '2012' Then
     sAnoCalendario := '1';
  If edExercicio.text = '2011' Then
     sAnoCalendario := '0';}

  // Paulo Nobre - SOL 231060 PPM 377414
  // Se ano for PAR (resto = 0) então o campo será 1
   If strtoint(edExercicio.text) Mod 2 = 0 Then
      sAnoCalendario := '1'
   Else
      sAnoCalendario := '0';
   //

   DeclRetif := sTpDeclaracao;
   sLinhaR37 := '0';
   ReservadoB := '0';
   ReservadoC := ' ';

   cdsSintetico.Data := oDaconMT.MostraDIPJSinteticoAnoAnt(0, 0, 2, sExercAntr);

   // Thiago Melo SOL 208941 Kintana 2020125
   //SetLength(LinhasR37, retornaCodMax(cdsSintetico));    // Comentado
   // Thiago Melo SOL 208941 Kintana 2020125
   SetLength(LinhasR37, 26); // SOL 209775 e SOL 233732 retornado
   cdsSintetico.DisableControls;
   cdsSintetico.first;
   While Not cdsSintetico.eof Do
      Begin
         If cdsSintetico.FieldByName('CODLINHA').asInteger = iNroLinhaR37 Then
            LinhasR37[iNroLinhaR37 - 1] := PadLeft(TiraPontoeVirgulaSinal(FloatToStrF(cdsSintetico.FieldByName('TOTAL').AsCurrency, FFnumber, 16, 2)), 14, '0')
         Else If cdsSintetico.FieldByName('CODLINHA').asInteger > iNroLinhaR37 Then
            Begin
               LinhasR37[iNroLinhaR37 - 1] := PadLeft(sLinhaR37, 14, '0');
               inc(iNroLinhaR37);
               Continue;
            End;
         cdsSintetico.Next;
         inc(iNroLinhaR37);
      End;
   cdsSintetico.Data := oDaconMT.MostraDIPJSinteticoAnoAnt(0, 0, 0, sExercAntr);
   cdsSintetico.EnableControls;
   ReservadoB := PadLeft(ReservadoB, 1232, '0');
   ReservadoC := Padright(ReservadoC, 10, ' ');
   sLinhaR37 := '';
   For x := 0 To 25 Do
      Begin
         If LinhasR37[x] <> '' Then
            sLinhaR37 := sLinhaR37 + LinhasR37[x]
         Else
            sLinhaR37 := sLinhaR37 + PadLeft('0', 14, '0')
      End;
   result := Tipo + ReservadoA + Trimestre + Coluna + CNPJContribuinte + sAnoCalendario +
      DeclRetif + sLinhaR37 + ReservadoB + ReservadoC;
End;

Function TfrmCadDIPJ.MontaR61(iNRoRecibo: Integer): String;
Var
   Tipo61, ReservadoA61, SeqEntrada61, CNPJContribuinte61, AnoCalendario61, DeclRetif61,
      Cpf61, Nome61, Qualificacao61, Rendimentos61, DemaisRendimentos61, Irrf61,
      ReservadoB61, ReservadoC61, DadosR61: String;
   iNroSeq61: Integer;
   LinhasR61: Array Of String;
   iNroLinhaR61, x61: Integer;
Begin
   // zerar variaveis
   iNroLinhaR61 := 0;
   SetLength(LinhasR61, 20);
   //carregar dados

    // Paulo Nobre - SOL 231060 PPM 377414
{   If edExercicio.text = '2012' Then
      sAnoCalendario := '1';
   If edExercicio.text = '2011' Then
      sAnoCalendario := '0';}

   // Paulo Nobre - SOL 231060 PPM 377414
   // Se ano for PAR (resto = 0) então o campo será 1
   If strtoint(edExercicio.text) Mod 2 = 0 Then
      AnoCalendario61 := '1'
   Else
      AnoCalendario61 := '0';
   //
   //06
   DeclRetif61 := sTpDeclaracao;

   DadosR61 := '';
   iNroSeq61 := 1;
   Rendimentos61 := '0';
   DemaisRendimentos61 := '0';
   ReservadoB61 := '0';
   ReservadoC61 := ' ';
   cdsGridRendimentos.DisableControls;
   cdsGridRendimentos.first;
   While Not cdsGridRendimentos.eof Do
      Begin
         Tipo61 := 'R61';
         ReservadoA61 := 'B';
         SeqEntrada61 := PadLeft(IntToStr(iNroSeq61), 4, '0');
         CNPJContribuinte61 := '00436923000190';
         // AnoCalendario61
         // DeclRetif61
         Cpf61 := PadLeft((cdsGridRendimentos.FieldByName('CPF').asString), 11, '0');
         Nome61 := PadRight((cdsGridRendimentos.FieldByName('NOME').asString), 150, ' ');
         Qualificacao61 := cdsGridRendimentos.FieldByName('CODQUALIRF').asString; // 2
         Rendimentos61 := PadLeft(TiraPontoeVirgulaSinal(FloatToStrF(cdsGridRendimentos.FieldByName('RENDIMENTO').AsCurrency, FFnumber, 16, 2)), 14, '0');
         DemaisRendimentos61 := PadLeft(DemaisRendimentos61, 14, '0');
         Irrf61 := PadLeft(TiraPontoeVirgulaSinal(FloatToStrF(cdsGridRendimentos.FieldByName('IRRF').AsCurrency, FFnumber, 16, 2)), 14, '0');
         ReservadoB61 := PadLeft(ReservadoB61, 36, '0');
         ReservadoC61 := PadLeft(ReservadoC61, 10, '0');
         inc(iNroSeq61);
         DadosR61 := Tipo61 + ReservadoA61 + SeqEntrada61 + CNPJContribuinte61 + AnoCalendario61 + DeclRetif61 +
            Cpf61 + Nome61 + Qualificacao61 + Rendimentos61 + DemaisRendimentos61 + Irrf61 +
            ReservadoB61 + ReservadoC61;
         inc(iNroLinhaR61);
         cdsGridRendimentos.Next;
      End;
   cdsGridRendimentos.EnableControls;

   result := DadosR61;
End;

Function TfrmCadDIPJ.MontaR70(iNRoRecibo: Integer): String;
Var
   Tipo, ReservadoA, Trimestre, Coluna, CNPJContribuinte, sAnoCalendario,
      DeclRetif, sEntidImune, sPJContX, sLinhaR70, sEmprIniPeriodo, sEmprFimPeriodo, ReservadoB, ReservadoC: String;
   LinhasR70: Array Of String;
   iNroLinhaR70, x: Integer;
Begin
   // zerar variaveis
   iNroLinhaR70 := 1;

   // Thiago Melo SOL 208941 Kintana 2020125
   //SetLength(LinhasR70, 37);
   // Thiago Melo SOL 208941 Kintana 2020125

   Tipo := '';
   ReservadoA := '';
   Trimestre := '';
   Coluna := '';
   CNPJContribuinte := '';
   sAnoCalendario := '';
   DeclRetif := '';
   sEntidImune := '';
   sPJContX := '';
   sLinhaR70 := '';
   sEmprIniPeriodo := '0';
   sEmprFimPeriodo := '0';
   ReservadoB := '';
   ReservadoC := '';

   //carregar dados
   Tipo := 'R70';
   ReservadoA := ' ';
   Trimestre := '00';
   Coluna := '01';
   CNPJContribuinte := '00436923000190';

   // Paulo Nobre - SOL 231060 PPM 377414
{   If edExercicio.text = '2012' Then
     sAnoCalendario := '1';
  If edExercicio.text = '2011' Then
     sAnoCalendario := '0';}

  // Paulo Nobre - SOL 231060 PPM 377414
  // Se ano for PAR (resto = 0) então o campo será 1
   If strtoint(edExercicio.text) Mod 2 = 0 Then
      sAnoCalendario := '1'
   Else
      sAnoCalendario := '0';
   //

   DeclRetif := sTpDeclaracao;

   sEntidImune := '2';
   sPJContX := '0';

   sLinhaR70 := '0';
   sEmprIniPeriodo := PadLeft(edQtdEmprIniPer.Text, 6, '0');
   sEmprFimPeriodo := PadLeft(edQtdEmprFimPer.Text, 6, '0');

   ReservadoC := ' ';

   // Thiago Melo SOL 208941 Kintana 2020125
   //SetLength(LinhasR70, retornaCodMax(cdsInfPrev)); // SOL 209775 e SOL 233732 comentado
   // Thiago Melo SOL 208941 Kintana 2020125
   SetLength(LinhasR70, 37); // SOL 209775 e SOL 233732 retornado
   cdsInfPrev.DisableControls;
   cdsInfPrev.first;
   While Not cdsInfPrev.eof Do
      Begin
         If cdsInfPrev.FieldByName('CODLINHA').asInteger = iNroLinhaR70 Then
            LinhasR70[iNroLinhaR70 - 1] := PadLeft(TiraPontoeVirgulaSinal(FloatToStrF(cdsInfPrev.FieldByName('TOTAL').AsCurrency, FFnumber, 16, 2)), 14, '0')
         Else If cdsInfPrev.FieldByName('CODLINHA').asInteger > iNroLinhaR70 Then
            Begin
               LinhasR70[iNroLinhaR70 - 1] := PadLeft(sLinhaR70, 14, '0');
               inc(iNroLinhaR70);
               Continue;
            End;
         cdsInfPrev.Next;
         inc(iNroLinhaR70);
      End;
   cdsInfPrev.EnableControls;
   ReservadoC := Padright(ReservadoC, 10, ' ');
   sLinhaR70 := '';
   For x := 0 To 36 Do
      Begin
         If LinhasR70[x] <> '' Then
            sLinhaR70 := sLinhaR70 + LinhasR70[x]
         Else
            sLinhaR70 := sLinhaR70 + PadLeft('0', 14, '0')
      End;
   result := Tipo + ReservadoA + Trimestre + Coluna + CNPJContribuinte + sAnoCalendario +
      DeclRetif + sEntidImune + sPJContX + sLinhaR70 + sEmprIniPeriodo + sEmprFimPeriodo +
      ReservadoC;
End;

Function TfrmCadDIPJ.MontaTrailler: String;
Var
   i: Integer;
   sTipo, sReservado: String;
Begin
   {
   Ordem  Campo                       Início    Fim   Tamanho    Formato
   01     Tipo                          1         2      2       X
   02     Reservado                     3       102    100       Branco(s)
   03     Delimitador de Registro     103       104      2       EOL
   }
   sTipo := 'T9';
   sReservado := '';
   sReservado := Padright(sReservado, 100, ' ');
   result := sTipo + sReservado;
End;

Function TfrmCadDIPJ.SelecionaCNPJ: String;
Var
   qryAux: Twwquery;
Begin
   qryAux := Twwquery.Create(Nil);
   qryAux.DataBaseName := 'BaseDados';
   qryAux.Close;
   qryAux.SQL.Clear;
   qryAux.SQL.Add('select preenchimento from arquivodipj where grupo = 2 and ordem = 2');
   qryAux.Open;
   If Not qryAux.Eof Then
      Begin
         result := qryAux.FieldByName('preenchimento').AsString;
      End;
   freeandnil(qryAux);
End;

Function TfrmCadDIPJ.TiraPontoeVirgulaSinal(sTexto: String): String;
Var
   Temp_01: String;
   Temp_03, conta: Integer;
Begin
   Conta := 0;
   Temp_03 := length(sTexto);
   While conta < temp_03 Do
      Begin
         Conta := Conta + 1;
         Temp_01 := Copy(Stexto, conta, 1);
         If Temp_01 = '.' Then
            Begin
               sTexto := Copy(sTexto, 1, (Conta - 1)) + Copy(sTexto, (Conta + 1), (Temp_03 - Conta));
            End;
         If Temp_01 = ',' Then
            Begin
               sTexto := Copy(sTexto, 1, (Conta - 1)) + Copy(sTexto, (Conta + 1), (Temp_03 - Conta));
            End;
         If Temp_01 = '-' Then
            Begin
               sTexto := Copy(sTexto, 1, (Conta - 1)) + Copy(sTexto, (Conta + 1), (Temp_03 - Conta));
            End;
      End;
   Result := sTexto;
End;

Procedure TfrmCadDIPJ.PopulaComboQualifRF;
Var
   oCdx: TClientDataSet;
Begin
   oCdx := TClientDataSet.Create(Nil);
   oCdx.Data := oDaconMT.CarregaListaQualfRF;
   cbxLinha.Items.Clear;
   While Not oCdx.Eof Do
      Begin
         cbListQualfRF.Items.AddObject(oCdx.FieldbyName('DESCRICAORF').asString, Pointer(oCdx.FieldByName('CODQUALIRF').asInteger));
         oCdx.Next;
      End;
   oCdx.Close;
   FreeAndNil(oCdx);
End;

Procedure TfrmCadDIPJ.cdsGridRendimentosAfterScroll(DataSet: TDataSet);
Begin
   Inherited;
   edSeq.Text := IntToStr(cdsGridRendimentos.FieldByName('IDSEQ').AsInteger);
   edCPFDir.Text := cdsGridRendimentos.FieldByName('CPF').AsString;
   edNomeDir.Text := cdsGridRendimentos.FieldByName('NOME').AsString;
   cbListQualfRF.Text := cdsGridRendimentos.FieldByName('DESCRICAORF').AsString;
   edCargoDir.Text := cdsGridRendimentos.FieldByName('CARGO').AsString;
End;

Procedure TfrmCadDIPJ.cbListQualfRFChange(Sender: TObject);
Begin
   Inherited;
   iNewCodRFG := oDaconMT.ProcurarCodByDescricao(cbListQualfRF.Text);
End;

Procedure TfrmCadDIPJ.cbListQualfRFExit(Sender: TObject);
Begin
   Inherited;
   iNewCodRFG := oDaconMT.ProcurarCodByDescricao(cbListQualfRF.Text);
End;

Procedure TfrmCadDIPJ.btnChangeCodRFClick(Sender: TObject);
Begin
   Inherited;
   oDaconMT.AtualizaCodRF(edCPFDir.Text, iNewCodRFG, IdReciboG, StrToInt(edSeq.Text));
   cdsGridRendimentos.Data := oDaconMT.MostraRendimentosDIPJGravado(IdReciboG);
   cdsRendimentosDB.Data := cdsGridRendimentos.Data;
End;

Procedure TfrmCadDIPJ.MudaStatusBtn(Habilita: Boolean);
Begin
   btnChangeCodRF.Enabled := Habilita;
   btnAtualizar.Enabled := Habilita;
   edCredito.Enabled := Habilita;
   edDebito.Enabled := Habilita;
   sbtnExcluiDacon.Enabled := Habilita;
   btnGravar.Enabled := Habilita;
End;

Procedure TfrmCadDIPJ.AtualizaDadosGrid(iNRoRecibo: Integer);
Var
   fAtivo, fPassivo, fTotal: Double;
Begin
   cdsSintetico.Data := oDaconMT.MostraSinteticoDIPJGravado(iNRoRecibo, 0);
   cdsAnalitico.Data := oDaconMT.MostraAnaliticoDIPJGravado(iNRoRecibo);
   cdsGridRendimentos.Data := oDaconMT.MostraRendimentosDIPJGravado(iNRoRecibo);
   cdsRendimentosDB.Data := cdsGridRendimentos.Data;
   cdsInfoAdic.Data := oDaconMT.CarregarInformacoesAdicionaisDIPJ(edExercicio.Text);
   cdsInfPrev.Data := oDaconMT.MostrarPreviDIPJGravado(iNRoRecibo);

   PopulaComboQualifRF;

   If idReciboRetPesq = 0 Then idReciboRetPesq := iNroRecibo;

   If idReciboRetPesq <> iNRoRecibo Then
      Begin
         PreencheNroRecibo(idReciboRetPesq, iNroRecibo);
         sTpDeclaracao := '1';
      End
   Else
      PreencheNroRecibo(iNroRecibo, iNroRecibo);

   CarregarDadosControles();
   AjustaComboBoxLinhas(2, iNRoRecibo);

   edQtdEmprIniPer.text := oDaconMT.ContaQtdFuncPer(edExercicio.Text, 1);
   edQtdEmprFimPer.text := oDaconMT.ContaQtdFuncPer(edExercicio.Text, 2);

   fAtivo := oDaconMT.TotalPorCategoriaDIPJGravada(iNroRecibo, 1);
   fPassivo := oDaconMT.TotalPorCategoriaDIPJGravada(iNroRecibo, 2);

   edTotalAtivo.Text := FloatToStrf(fAtivo, FFnumber, 16, 2);
   edTotalPassivo.Text := FloatToStrf(fPassivo, FFnumber, 16, 2);

   If fAtivo < 0 Then fAtivo := fAtivo * -1;
   If fPassivo < 0 Then fPassivo := fPassivo * -1;

   fTotal := fAtivo - fPassivo;

   edResultado.Text := FloatToStrf(fTotal, FFnumber, 16, 2);
   sbtnGeraArquivo.Enabled := true;

End;

Function TfrmCadDIPJ.QualifIrrf(nroCPF: String): String;
Var
   qryAux: Twwquery;
Begin
   qryAux := Twwquery.Create(Nil);
   qryAux.DataBaseName := 'BaseDados';
   qryAux.Close;
   qryAux.SQL.Clear;
   qryAux.SQL.Add('SELECT CODQUALIRF FROM RENDIMENTOS_DIPJ WHERE CPF = :CPF AND FLGDEMITIDO = 1');
   qryAux.ParamByName('CPF').AsString := nroCPF;
   qryAux.Open;
   If Not qryAux.Eof Then
      Begin
         result := qryAux.FieldByName('CODQUALIRF').AsString;
      End;
   freeandnil(qryAux);
End;

Function TfrmCadDIPJ.PreparaTabRendimentos(iNRoRecibo: Integer): String;
Var

   sCPF_A, sCPF_B, Qualificacao: String;
   fSomaValorRend, fSomaValorIRRF: Real;
   iNroSeq_A, iNroSeq_B: Integer;
   idseq, idrecibo, idnorma, codqualirf, flgdemitido: Integer;
   irrf, rendimento: Real;
   ano, cpf, nome, cargo, sSql: String;

   qryAux, qryAut, qryAuj, qryAuw, qryAug: Twwquery;
   iGrd: Integer;
   sCPF: String;

Begin
   fSomaValorRend := 0;
   fSomaValorIRRF := 0;

   Qualificacao := '';

   idseq := 0;
   idrecibo := 0;
   idnorma := 0;
   codqualirf := 0;
   flgdemitido := 0;
   irrf := 0;
   rendimento := 0;

   ano := '';
   cpf := '';
   nome := '';
   cargo := '';

   qryAug := Twwquery.Create(Nil);
   qryAug.DataBaseName := 'BaseDados';

   qryAux := Twwquery.Create(Nil);
   qryAux.DataBaseName := 'BaseDados';

   qryAut := Twwquery.Create(Nil);
   qryAut.DataBaseName := 'BaseDados';

   qryAuj := Twwquery.Create(Nil);
   qryAuj.DataBaseName := 'BaseDados';

   qryAuw := Twwquery.Create(Nil);
   qryAuw.DataBaseName := 'BaseDados';

   qryAux.Close;
   qryAut.Close;
   qryAuj.Close;
   qryAuw.Close;
   qryAug.Close;

   qryAuj.SQL.Clear;
   qryAuj.SQL.Add('SELECT COUNT(CPF) GRD, CPF FROM RENDIMENTOS_DIPJ T WHERE IDRECIBO = :IDRECIBO GROUP BY CPF ORDER BY GRD');
   qryAuj.ParamByName('IDRECIBO').AsInteger := iNroRecibo;
   qryAuj.Open;
   While Not qryAuj.Eof Do
      Begin
         iGrd := qryAuj.FieldByName('GRD').AsInteger;
         sCPF := qryAuj.FieldByName('CPF').AsString;
         If iGrd > 1 Then
            Begin
               qryAux.Close;
               qryAux.SQL.Clear;
               qryAux.SQL.Add(' SELECT R.CPF CPF, SUM(R.IRRF) IRRF, SUM(R.RENDIMENTO) RENDIMENTO ');
               qryAux.SQL.Add(' FROM  RENDIMENTOS_DIPJ R ');
               qryAux.SQL.Add(' WHERE ');
               qryAux.SQL.Add(' R.IDRECIBO = :IDRECIBO AND ');
               qryAux.SQL.Add(' R.CPF = :CPF ');
               qryAux.SQL.Add(' GROUP BY R.CPF ');
               qryAux.ParamByName('IDRECIBO').AsInteger := iNRoRecibo;
               qryAux.ParamByName('CPF').AsString := sCPF;
               qryAux.Open;
               If Not qryAux.Eof Then
                  Begin
                     irrf := qryAux.FieldByName('IRRF').AsCurrency;
                     rendimento := qryAux.FieldByName('RENDIMENTO').AsCurrency;
                  End;
               qryAuw.Close;
               qryAuw.SQL.Clear;
               qryAuw.SQL.Add(' SELECT CODQUALIRF FROM RENDIMENTOS_DIPJ ');
               qryAuw.SQL.Add(' WHERE IDRECIBO = :IDRECIBO AND ');
               qryAuw.SQL.Add(' CPF = :CPF AND  ');
               qryAuw.SQL.Add(' FLGDEMITIDO = 1');
               qryAuw.ParamByName('IDRECIBO').AsInteger := iNroRecibo;
               qryAuw.ParamByName('CPF').AsString := sCPF;
               qryAuw.Open;
               If Not qryAuw.Eof Then
                  Begin
                     codqualirf := qryAuw.FieldByName('CODQUALIRF').AsInteger;
                  End;

               qryAut.Close;
               qryAut.SQL.Clear;
               qryAut.SQL.Add(' SELECT  ');
               qryAut.SQL.Add(' R.IDSEQ IDSEQ, R.ANO ANO, R.CPF CPF, R.NOME NOME, R.CARGO CARGO, ');
               qryAut.SQL.Add(' R.IRRF IRRF, R.RENDIMENTO RENDIMENTO, R.CODQUALIRF  CODQUALIRF  ');
               qryAut.SQL.Add(' FROM ');
               qryAut.SQL.Add(' RENDIMENTOS_DIPJ R ');
               qryAut.SQL.Add(' WHERE ');
               qryAut.SQL.Add(' R.IDRECIBO    = :IDRECIBO AND ');
               qryAut.SQL.Add(' R.CPF         = :CPF ');
               qryAut.ParamByName('IDRECIBO').AsInteger := iNRoRecibo;
               qryAut.ParamByName('CPF').AsString := sCPF;
               qryAut.Open;
               If Not qryAut.Eof Then
                  Begin
                     idseq := qryAut.FieldByName('IDSEQ').AsInteger;
                     ano := qryAut.FieldByName('ANO').AsString;
                     cpf := qryAut.FieldByName('CPF').AsString;
                     nome := qryAut.FieldByName('NOME').AsString;
                     cargo := qryAut.FieldByName('CARGO').AsString;
                     oDaconMT.GravaTabTem(iNRoRecibo, idseq, codqualirf, ano, cpf, nome, cargo, irrf, rendimento);
                  End;
            End
         Else
            Begin
               qryAut.Close;
               qryAut.SQL.Clear;
               qryAut.SQL.Add(' SELECT  ');
               qryAut.SQL.Add(' R.IDSEQ IDSEQ, R.ANO ANO, R.CPF CPF, R.NOME NOME, R.CARGO CARGO, ');
               qryAut.SQL.Add(' R.IRRF IRRF, R.RENDIMENTO RENDIMENTO, R.CODQUALIRF  CODQUALIRF  ');
               qryAut.SQL.Add(' FROM ');
               qryAut.SQL.Add(' RENDIMENTOS_DIPJ R ');
               qryAut.SQL.Add(' WHERE ');
               qryAut.SQL.Add(' R.IDRECIBO    = :IDRECIBO AND ');
               qryAut.SQL.Add(' R.CPF         = :CPF ');
               qryAut.ParamByName('IDRECIBO').AsInteger := iNRoRecibo;
               qryAut.ParamByName('CPF').AsString := sCPF;
               qryAut.Open;
               If Not qryAut.Eof Then
                  Begin

                     idseq := qryAut.FieldByName('IDSEQ').AsInteger;
                     ano := qryAut.FieldByName('ANO').AsString;
                     cpf := qryAut.FieldByName('CPF').AsString;
                     nome := qryAut.FieldByName('NOME').AsString;
                     cargo := qryAut.FieldByName('CARGO').AsString;
                     codqualirf := qryAut.FieldByName('CODQUALIRF').AsInteger;
                     irrf := qryAut.FieldByName('IRRF').AsCurrency;
                     rendimento := qryAut.FieldByName('RENDIMENTO').AsCurrency;

                     oDaconMT.GravaTabTem(iNRoRecibo, idseq, codqualirf, ano, cpf, nome, cargo, irrf, rendimento);

                  End;
            End;
         qryAuj.Next;
      End;

   qryAux.Close;
   qryAut.Close;
   qryAuj.Close;
   qryAuw.Close;
   qryAug.Close;

   freeandnil(qryAux);
   freeandnil(qryAut);
   freeandnil(qryAuj);
   freeandnil(qryAuw);
   freeandnil(qryAug);

End;

// Thiago Melo SOL 208941 Kintana 2020125 INI

Function TfrmCadDIPJ.retornaCodMax(cds: TCmClientDataSet): Integer;
Var
   CodMaximo: Integer;
Begin
   cds.Filtered := False;
   cds.IndexFieldNames := 'CODLINHA';
   cds.Filtered := True;

   If Not cds.IsEmpty Then Begin
         cds.Last;
         CodMaximo := StrToIntDef(cds.FieldByName('codlinha').AsString, 0);
      End Else Begin
         CodMaximo := cds.RecordCount;
      End;
   Result := CodMaximo;

   cds.Filtered := False;
   cds.First;
End;

// Thiago Melo SOL 208941 Kintana 2020125 Fim

End.

Cpf61 := '';
//Inicio montagem da R61
//zerar variaveis
iNroLinhaR61 := 0;
SetLength(LinhasR61, 20);
//carregar dados
 // Paulo Nobre - SOL 231060 PPM 377414
{   If edExercicio.text = '2012' Then
   sAnoCalendario := '1';
If edExercicio.text = '2011' Then
   sAnoCalendario := '0';}

// Paulo Nobre - SOL 231060 PPM 377414
// Se ano for PAR (resto = 0) então o campo será 1
If strtoint(edExercicio.text) Mod 2 = 0 Then
   AnoCalendario := '1'
Else
   AnoCalendario := '0';
//
//06
DeclRetif61 := sTpDeclaracao;

DadosR61 := '';
iNroSeq61 := 1;
Rendimentos61 := '0';
DemaisRendimentos61 := '0';
ReservadoB61 := '0';
ReservadoC61 := ' ';
cdsRendimentosEDI.Data := oDaconMT.PreparaRendimentosArqEDI(iNRoRecibo);
cdsRendimentosEDI.DisableControls;
cdsRendimentosEDI.first;
While Not cdsRendimentosEDI.eof Do
   Begin
      Tipo61 := 'R61';
      ReservadoA61 := 'B';
      SeqEntrada61 := PadLeft(IntToStr(iNroSeq61), 4, '0');
      CNPJContribuinte61 := '00436923000190';
      Cpf61 := PadLeft((cdsRendimentosEDI.FieldByName('CPF').asString), 11, '0');
      Nome61 := PadRight((cdsRendimentosEDI.FieldByName('NOME').asString), 150, ' ');
      Qualificacao61 := PadRight((cdsRendimentosEDI.FieldByName('CODQUALIRF').asString), 2, '0');
      Rendimentos61 := PadLeft(TiraPontoeVirgulaSinal(FloatToStrF(cdsRendimentosEDI.FieldByName('RENDIMENTO').AsCurrency, FFnumber, 16, 2)), 14, '0');
      DemaisRendimentos61 := PadLeft(DemaisRendimentos61, 14, '0');
      Irrf61 := PadLeft(TiraPontoeVirgulaSinal(FloatToStrF(cdsRendimentosEDI.FieldByName('IRRF').AsCurrency, FFnumber, 16, 2)), 14, '0');
      ReservadoB61 := PadLeft(ReservadoB61, 36, '0');
      ReservadoC61 := PadLeft(ReservadoC61, 10, ' ');

      inc(iNroSeq61);
      DadosR61 := Tipo61 + ReservadoA61 + SeqEntrada61 + CNPJContribuinte61 + AnoCalendario61 + DeclRetif61 +
         Cpf61 + Nome61 + Qualificacao61 + Rendimentos61 + DemaisRendimentos61 + Irrf61 +
         ReservadoB61 + ReservadoC61;
      inc(iNroLinhaR61);
      lstNwFile.Add(DadosR61);
      cdsRendimentosEDI.Next;
   End;
oDaconMT.LimpaRendimentosArqEDI(iNroRecibo);
cdsRendimentosEDI.EnableControls;
//Fim montagem da R61

