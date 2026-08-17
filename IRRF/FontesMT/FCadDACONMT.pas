//*******************************************************************************************************
//N. Sol..........: SOL 208410/14598
//N. Kintana......: KTN 2014896
//Data............: 07/06/2013
//Responsável.....: Marcio Sanches Spinosa SOL 208410/14598 KTN 2014896
//Descrição.......: ajutes na dacon para emitir o relatorio zerado nos meses de dezembro de cada ano
//*******************************************************************************************************
//N. Sol..........: SOL 200212
//N. Kintana......: KTN 1940555
//Data............: 19/02/2013
//Responsável.....: Marcio Sanches Spinosa
//Descrição.......: Validação na criação de um novo relatorio e não alterar os valores depois que um
//relatório já possui numero de registro
//*******************************************************************************************************
//N. Sol..........: SOL 193089
//N. Kintana......: KTN  1837888
//Data............: 30/10/2012
//Responsável.....: Marcio Sanches Spinosa
//Descrição.......: Alteração na exclusão de relatório
(*******************************************************************************************************
  N. Sol..........: 192134
  N. Kintana......: 1821357
  Data............: 29/05/2012
  Responsável.....: Vander Campos
  Descrição.......: Solicito ajuste no modulo de imposto na geração da DACON Retificadora, pois a
                    na geração não está sendo marcada com retificadora e não está indo o número de
                    recibo
//*******************************************************************************************************)
//N. Sol..........: SOL 126124 / SOL 126125
//N. Kintana......: KTN 656907 / KTN 656908
//Data............: 29/05/2012
//Responsável.....: Arnaldo Scarin
//Revisão.........: Paulo Nobre
//Descrição.......: Cadastro DACON / DIPJ
//*******************************************************************************************************
Unit FCadDACONMT;

Interface

Uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   StdCtrls, Buttons, Grids, DBGrids, DBCtrls, ComCtrls, ExtCtrls, filectrl,
   FSairAjuda, IvDictio, IvMulti, IvEMulti, MAHlpBtn, TB97Tlbr, TB97,
   MontaSelect, Mask, MskEdDlg, uMensErro, uSistema, Db, Wwdatsrc, DBClient,
   uCMClientDataSet, uCmSqlParams, Wwdbigrd, Wwdbgrid,
   uCtrlDaconMT, uCtrlNormaVigente, uCtrlParametrosRelatorio, uCtrlLinhaRelatorio,
   wwdblook, uCtrlTipoRelatorio;

Const MSG001 = 'Existe relatório gerado para o período %s gerado sem o número do recibo. Favor verificar e regularizar a situação.'; // Ok
Const MSG002 = 'Um relatório para o %s foi encontrado sem número do recibo informado.'; // Ok
Const MSG003 = 'Para geração dos Demonstrativos, os campos ano do exercício e ao mês são de preenchimento obrigatório !'; // Ok
Const MSG004 = 'Não foram encontrados lançamentos contábeis para o período informado. Relatório não pôde ser gerado.'; // Ok
Const MSG005 = 'Existe um relatório gerado para o período informado sem número de recibo.' + #13 + 'Excluí este relatório para a geração do novo ?'; // Sim, Nao
Const MSG006 = 'Já existe um relatório gerado e enviado, um novo relatório será gerado do tipo Retificador.'; // Ok
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

Type
   TfrmCadDacon = Class(TfrmSairAjuda)
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
      cdsSinteticoIDLINHA: TFloatField;
      cdsSinteticoIDNORMA: TFloatField;
      cdsSinteticoDESCRICAO: TStringField;
      cdsSinteticoVALOR: TFloatField;
      cdsAnaliticoPLACONTA: TStringField;
      cdsAnaliticoPLANOME: TStringField;
      cdsAnaliticoCREDITO: TFloatField;
      cdsAnaliticoDEBITO: TFloatField;
      cdsAnaliticoTOTAL: TFloatField;
      gbFiltros: TGroupBox;
      lblNumRecibo: TLabel;
      sbtnProcurar: TSpeedButton;
      Label7: TLabel;
      Label8: TLabel;
      edNumRecibo: TEdit;
      cbPeriodo: TComboBox;
      edExercicio: TEdit;
      sbtnGeraDacon: TSpeedButton;
      sbtnGeraArquivo: TSpeedButton;
      sbtnExcluiDacon: TSpeedButton;
      pgDados: TPageControl;
      tbSintetico: TTabSheet;
      Panel4: TPanel;
      lblReciboSintetico: TLabel;
      lblReciboRetificadorSintetico: TLabel;
      lblBaseCalculo: TLabel;
      lblVlrPis: TLabel;
      lblVlrCofins: TLabel;
      edReciboSintetico: TEdit;
      edReciboRetificadorSintetico: TEdit;
      edBaseCalc: TEdit;
      edVlrPis: TEdit;
      edVlrCofins: TEdit;
      Panel5: TPanel;
      btnGravar: TBitBtn;
      dbGridSintetico: TwwDBGrid;
      tbAnalitico: TTabSheet;
      Panel6: TPanel;
      lblLinhas: TLabel;
      lblContaContabil: TLabel;
      lblReciboAnalitico: TLabel;
      lblReciboRetificadorAnalitico: TLabel;
      edReciboAnalitico: TEdit;
      edReciboRetificadorAnalitico: TEdit;
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
      lblTipoRelatCad: TLabel;
      dblcTipoRelatCad: TwwDBLookupCombo;
      cdsFiltroTipo: TCMClientDataSet;
      dsFiltroTipo: TwwDataSource;
      CMSqlParams1: TCMSqlParams;
      cdsFiltroTipoIDTIPO: TFloatField;
      cdsFiltroTipoDESCRICAO: TStringField;
    cdsAnaliticoIDLINHADACON: TFloatField;
    cdsAnaliticoIDRELATORIODADOS: TFloatField;
    cdsSinteticoNURECIBO: TStringField;
    rgTipo: TRadioGroup;
    cdsAnaliticoNURECIBO: TStringField;
    cdsSinteticoIDRELATORIODADOS: TFloatField;
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
      Procedure dblcTipoRelatCadChange(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure dbGridAnaliticoCalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont;
      ABrush: TBrush);
    procedure rgTipoClick(Sender: TObject);
    procedure dbGridSinteticoRowChanged(Sender: TObject);
    procedure cbxLinhaClick(Sender: TObject);
   Private
      Function GeraArquivoReceita: Boolean;
      Function GravarArquivo(Var sNomeArquivo: String): Boolean;
      Function GravarDadosTabelaGenerica: Boolean;
      Function IsRelatorioSelecionado: Boolean;
      Function AtualizaDadosDacon: Boolean;
      Function GerarDacon: Boolean;
      Function ValidaDadosDacon: Boolean;
      Function IsExisteRelatorioGerado: Boolean;
      function IsExisteRelatorioGeradoReticador : Boolean;
      Function IsExisteRelatorioGeradoNumero: Boolean;
      Function CarregaDadosRelatorio: Boolean;
      Function CriarRelatorioDacon(Const bRetificador: Boolean): Boolean;
      Function IsPossivelExcluirRelatorio: Boolean;
      Function ExcluiDacon: Boolean;
      Function PesquisarRelatorioMesAno: Boolean;
      Function PesquisarRelatorioNumRecibo: Boolean;
      Procedure CarregarDadosControles;
      Procedure AjustaComboBoxLinhas(Const pIdRelatorioDados: Integer);
      function PadLeft(aStr: string; aSize: Integer; aCh: char = ' '): string;
      function PadRight(aStr: string; aSize: Integer; aCh: char = ' '): string;
      procedure LimparCds();
      { Private declarations }
   Protected
      oDaconMT                        : TCtrlDaconMT;
      oNormaVigente                   : TCtrlNormaVigente;
      oParametrosRelatorio            : TCtrlParametrosRelatorio;
      oLinhaRelatorio                 : TCtrlLinhaRelatorio;
      oTipoRelatorio                  : TCtrlTipoRelatorio;
      arquivo                         : TextFile;
      strPad                          : string;
      cdsDadosCadastraisFuncef        : TClientDataSet;
      sNumeroAntigo                   : string;
      vDouValorTotal                  : Double;
   Public
      { Public declarations }
   End;

Var
   frmCadDacon: TfrmCadDacon;
   IdNormaAtual, IdRelatorioDados: Integer;
   sNumeroRecibo, sExercicio, sPeriodo, PathArquivo, sTipoForm: String;
   sRetificadora : string;
   sTesteData : TDateTime;
   curValores : Currency;


Implementation

Uses UDatabase, DBaseDados;

{$R *.DFM}

Procedure TfrmCadDacon.FormShow(Sender: TObject);
Begin
   Inherited;
   sRetificadora := 'N';//Marcio Sanches Spinosa SOL: 126124/126125 Kintana: 656907/656908
   // pnobre
   pgDados.ActivePageIndex := 0;
   PathArquivo := Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa) + '\Dacon';
   cbPeriodo.ItemIndex := 0;

   dblcTipoRelatCad.text := 'DACON';
   dblcTipoRelatCad.Setfocus;
   dblcTipoRelatCadChange(Self);

   vDouValorTotal := 0;

   // PNOBRE
  //   If Not IsExisteRelatorioGerado() Then
    //    MsgDlg(Format(MSG001, [cbPeriodo.Text + '/' + EdExercicio.Text]), 'Erro', mtError, [mbOk], 0);
End;

Procedure TfrmCadDacon.FormCreate(Sender: TObject);
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
   cdsDadosCadastraisFuncef := TClientDataSet.Create(nil);

End;

Procedure TfrmCadDacon.FormClose(Sender: TObject; Var Action: TCloseAction);
Begin
   Inherited;
   FreeAndNil(oNormaVigente);
   FreeAndNil(oParametrosRelatorio);
   FreeAndNil(oLinhaRelatorio);
   FreeAndNil(oDaconMT);
   FreeAndNil(oTipoRelatorio);
End;

Procedure TfrmCadDacon.sbtnGeraArquivoClick(Sender: TObject);
Begin
   Inherited;
   If IsRelatorioSelecionado() Then
      GeraArquivoReceita();
End;

Function TFrmCadDacon.GeraArquivoReceita(): Boolean;
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

Function TFrmCadDacon.GravarDadosTabelaGenerica: Boolean;
Begin
   Result := True;
End;

Function TFrmCadDacon.GravarArquivo(Var sNomeArquivo: String): Boolean;
   Procedure GeraNomeArquivo(Var sNomeArquivo: String; pCompetencia : string; pCnpj :string );
   Begin
      If Not DirectoryExists(PathArquivo) Then
         CreateDir(PathArquivo);
      sNomeArquivo := PathArquivo + '\' + pCnpj + '-DACON-' + pCompetencia + '.DEC';

   End;

   Procedure GravarLayout(Const sNomeArquivo: String);
   Begin
      // ARNALDO NÃO FEZ
   End;

Var
  // INICIO - VANDER CAMPOS - KTN - 1821357 - Sol 192134
  TipoDemonstrativo : String;
  // FIM    - VANDER CAMPOS - KTN - 1821357 - Sol 192134
Begin
   Result := True;
   GeraNomeArquivo(sNomeArquivo, edExercicio.Text + '-' + PadLeft(inttostr(cbPeriodo.ItemIndex),2,'0'), cdsInfoAdic.FieldByName('CNPJFundacao').AsString );
   If FileExists(sNomeArquivo) Then
      Begin
         Result := MsgDlg(MSG010, 'Atenção', mtConfirmation, [mbYes, mbNo], 0) = idYes;
         If Not Result Then
            Exit;
      End;

   // INICIO - VANDER CAMPOS - KTN - 1821357 - Sol 192134
   if sRetificadora = 'S' Then
      TipoDemonstrativo := '1'
   else
      TipoDemonstrativo := '0';
   // FIM    - VANDER CAMPOS - KTN - 1821357 - Sol 192134

   try
    AssignFile(arquivo , sNomeArquivo);
        if FileExists(sNomeArquivo) then
            DeleteFile(sNomeArquivo);

            ReWrite(arquivo); { cria um novo se não existir }
            // Sistema
            Write(arquivo, Padright(cdsInfoAdic.FieldByName('Sistema').AsString, 8, ' '));
            //Filler
            Write(arquivo, Padright(cdsInfoAdic.FieldByName('Filler').AsString, 4, '0'));
            //Exercicio
            if Trim(edExercicio.Text) <> EmptyStr then
               Write(arquivo, edExercicio.Text )
            else
               Write(arquivo, formatdatetime('yyyy', Now));
            // Filler
            Write(arquivo, PadRight(cdsInfoAdic.FieldByName('Filler_1').AsString, 4, '0'));

            // Indicador de Demonstrativo 0 - Original / 1 - Retificadora
            // Write(arquivo, PadRight(cdsInfoAdic.FieldByName('Demonstrativo').AsString, 1, '0'));
            // VANDER CAMPOS - KTN - 1821357 - Sol 192134
            Write(arquivo, TipoDemonstrativo);
            
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
            if (Trim(edExercicio.Text) <> EmptyStr) and (cbPeriodo.ItemIndex > 0) then
               Write(arquivo, PadRight(edExercicio.Text , 4, '0') + PadLeft(inttostr(cbPeriodo.ItemIndex), 2, '0'))
            else
               Write(arquivo, formatdatetime('yyyymm', Now));// Verificar a data do dacon
            // Verificar a data do inicio
            write(arquivo, PadRight(edExercicio.Text , 4, '0') + PadLeft(inttostr(cbPeriodo.ItemIndex), 2, '0') + '01' );
            sTesteData := StrToDateTime('01' + '/' + PadLeft(inttostr(cbPeriodo.ItemIndex), 2, '0') + '/' + PadRight(edExercicio.Text , 4, '0'));
            // Verificar a data fim
            write(arquivo, formatdatetime('yyyymmdd',  IncMonth(sTesteData, 1) - 1));
            // TIPO DEMONSTRATIVO
            //write(arquivo, PadRight(cdsInfoAdic.FieldByName('TipoDemonstrativo').AsString, 1, '0'));
            // VANDER CAMPOS - KTN - 1821357 - Sol 192134
            Write(arquivo, TipoDemonstrativo);

            // SITUAÇÃO ESPECIAL
            write(arquivo, PadRight(cdsInfoAdic.FieldByName('SituacaoEspecial').AsString, 2, '0'));
            // DATA DO EVENTO
            if (cdsInfoAdic.FieldByName('DataEvento').AsString = '00000000') then
                write(arquivo, PadRight(cdsInfoAdic.FieldByName('DataEvento').AsString, 8, '0'))
            else
                write(arquivo, PadRight(FormatDateTime('yyyymmdd', cdsInfoAdic.FieldByName('DataEvento').AsDateTime), 8, '0'));
            // Desenquadramento
            write(arquivo, PadRight(cdsInfoAdic.FieldByName('Desenquadramento').AsString, 1, '0'));
            // Data do Desenquadramento
            if (cdsInfoAdic.FieldByName('DataDesenquadramento').AsString = '00000000') then
               write(arquivo, PadRight(cdsInfoAdic.FieldByName('DataDesenquadramento').AsString, 8, '0'))
            else
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
            if (cdsInfoAdic.FieldByName('DataInclusaoSimples').AsString = '00000000') then
               write(arquivo, PadRight(cdsInfoAdic.FieldByName('DataInclusaoSimples').AsString, 8, '0'))
            else
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
            write(arquivo,PadRight(lblCNPJ.Caption, 14,' '));
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
            if (curValores < 0) then
              curValores := curValores * (-1);
            cdsSintetico.Filtered := False;
            write(arquivo, PadLeft(StringReplace(StringReplace(FormatCurr('###,##0.00', curValores) , ',', '',[rfReplaceAll]), '.', '',[rfReplaceAll]) , 14, '0'));

            // Linha 02 – Recursos Coletados Assistenciais
            cdsSintetico.Filter := 'DESCRICAO like ''%Recursos Coletados Assistenciais%''';
            cdsSintetico.Filtered := True;
            curValores := cdsSintetico.FieldByName('VALOR').AsCurrency;
            if (curValores < 0) then
              curValores := curValores * (-1);
            cdsSintetico.Filtered := False;
            write(arquivo, PadLeft(StringReplace(StringReplace(FormatCurr('###,##0.00', curValores) , ',', '',[rfReplaceAll]), '.', '',[rfReplaceAll]) , 14, '0'));

            // Linha 03 – Receitas Administrativas
            cdsSintetico.Filter := 'DESCRICAO like ''%Receitas Administrativas%''';
            cdsSintetico.Filtered := True;
            curValores := cdsSintetico.FieldByName('VALOR').AsCurrency;
            if (curValores < 0) then
              curValores := curValores * (-1);
            cdsSintetico.Filtered := False;
            write(arquivo, PadLeft(StringReplace(StringReplace(FormatCurr('###,##0.00', curValores) , ',', '',[rfReplaceAll]), '.', '',[rfReplaceAll]) , 14, '0'));

            // Linha 04 – Rendas de Investimento (bruta)
            cdsSintetico.Filter := 'DESCRICAO like ''%Rendas de Investimento (bruta)%''';
            cdsSintetico.Filtered := True;
            curValores := cdsSintetico.FieldByName('VALOR').AsCurrency;
            if (curValores < 0) then
              curValores := curValores * (-1);
            cdsSintetico.Filtered := False;
            write(arquivo, PadLeft(StringReplace(StringReplace(FormatCurr('###,##0.00', curValores) , ',', '',[rfReplaceAll]), '.', '',[rfReplaceAll]) , 14, '0'));

            // Linha 05 – (-) Constituição de Provisões Técnicas - Previdência
            cdsSintetico.Filter := 'DESCRICAO like ''%Constituição de Provisões Técnicas%''';// - Previdência
            cdsSintetico.Filtered := True;
            curValores := cdsSintetico.FieldByName('VALOR').AsCurrency;
            if (curValores < 0) then
              curValores := curValores * (-1);
            cdsSintetico.Filtered := False;
            write(arquivo, PadLeft(StringReplace(StringReplace(FormatCurr('###,##0.00', curValores) , ',', '',[rfReplaceAll]), '.', '',[rfReplaceAll]) , 14, '0'));

            // Linha 06 – (-) Rendimentos de Aplicações Financeiras – Previdência
            cdsSintetico.Filter := 'DESCRICAO like ''%Rendimentos de Aplicações Financeiras%''';  // – Previdencia
            cdsSintetico.Filtered := True;
            curValores := cdsSintetico.FieldByName('VALOR').AsCurrency;
            if (curValores < 0) then
              curValores := curValores * (-1);
            cdsSintetico.Filtered := False;
            write(arquivo, PadLeft(StringReplace(StringReplace(FormatCurr('###,##0.00', curValores) , ',', '',[rfReplaceAll]), '.', '',[rfReplaceAll]) , 14, '0'));

            // Linha 07 – (-) Rendimentos Relativos à Receita de Aluguel – Previdência
            cdsSintetico.Filter := 'DESCRICAO like ''%Rendimentos Relativos à Receita de Aluguel%''';// – Previdencia
            cdsSintetico.Filtered := True;
            curValores := cdsSintetico.FieldByName('VALOR').AsCurrency;
            if (curValores < 0) then
              curValores := curValores * (-1);
            cdsSintetico.Filtered := False;
            write(arquivo, PadLeft(StringReplace(StringReplace(FormatCurr('###,##0.00', curValores) , ',', '',[rfReplaceAll]), '.', '',[rfReplaceAll]) , 14, '0'));

            // Linha 08 – (-) Receita Decorrente da Venda de Bens Imóveis – Previdência
            cdsSintetico.Filter := 'DESCRICAO like ''%Receita Decorrente da Venda de Bens Imóveis - Previdência%''';
            cdsSintetico.Filtered := True;
            curValores := cdsSintetico.FieldByName('VALOR').AsCurrency;
            if (curValores < 0) then
              curValores := curValores * (-1);
            cdsSintetico.Filtered := False;
            write(arquivo, PadLeft(StringReplace(StringReplace(FormatCurr('###,##0.00', curValores) , ',', '',[rfReplaceAll]), '.', '',[rfReplaceAll]) , 14, '0'));

            // Linha 09 – (-) Resultado Positivo Auferido na Reavaliação da Carteira de Investimentos Imobiliários – Previdência
            cdsSintetico.Filter := 'DESCRICAO like ''%Resultado Positivo Auferido na Reavaliação da Carteira de Investimentos Imobiliários - Previdência%''';
            cdsSintetico.Filtered := True;
            curValores := cdsSintetico.FieldByName('VALOR').AsCurrency;
            if (curValores < 0) then
              curValores := curValores * (-1);
            cdsSintetico.Filtered := False;
            write(arquivo, PadLeft(StringReplace(StringReplace(FormatCurr('###,##0.00', curValores) , ',', '',[rfReplaceAll]), '.', '',[rfReplaceAll]) , 14, '0'));

            // Linha 10 – (-) Reversão de Provisão e Recuperação de Créditos Baixados como Perda que não Representem Ingressos de Novas Receitas – Assistência
            cdsSintetico.Filter := 'DESCRICAO like ''%Reversão de Provisão e Recuperação de Créditos Baixados como Perda que não Representem Ingressos de Novas Receitas - Assistência%''';
            cdsSintetico.Filtered := True;
            curValores := cdsSintetico.FieldByName('VALOR').AsCurrency;
            if (curValores < 0) then
              curValores := curValores * (-1);
            cdsSintetico.Filtered := False;
            write(arquivo, PadLeft(StringReplace(StringReplace(FormatCurr('###,##0.00', curValores) , ',', '',[rfReplaceAll]), '.', '',[rfReplaceAll]) , 14, '0'));

            // Linha 11 – (-) Recursos não Tributáveis - Assistência
            cdsSintetico.Filter := 'DESCRICAO like ''%Recursos não Tributáveis - Assistência%''';
            cdsSintetico.Filtered := True;
            curValores := cdsSintetico.FieldByName('VALOR').AsCurrency;
            if (curValores < 0) then
              curValores := curValores * (-1);
            cdsSintetico.Filtered := False;
            write(arquivo, PadLeft(StringReplace(StringReplace(FormatCurr('###,##0.00', curValores) , ',', '',[rfReplaceAll]), '.', '',[rfReplaceAll]) , 14, '0'));

            // Linha 12 – (-) Constituição de Provisões Técnicas – Assistência
            cdsSintetico.Filter := 'DESCRICAO like ''%Constituição de Provisões Técnicas - Assistência%''';
            cdsSintetico.Filtered := True;
            curValores := cdsSintetico.FieldByName('VALOR').AsCurrency;
            if (curValores < 0) then
              curValores := curValores * (-1);
            cdsSintetico.Filtered := False;
            write(arquivo, PadLeft(StringReplace(StringReplace(FormatCurr('###,##0.00', curValores) , ',', '',[rfReplaceAll]), '.', '',[rfReplaceAll]) , 14, '0'));

            // Linha 13 – (-) Venda de Bens do Ativo Permanente
            cdsSintetico.Filter := 'DESCRICAO like ''%Venda de Bens do Ativo Permanente%''';
            cdsSintetico.Filtered := True;
            curValores := cdsSintetico.FieldByName('VALOR').AsCurrency;
            if (curValores < 0) then
              curValores := curValores * (-1);
            cdsSintetico.Filtered := False;
            write(arquivo, PadLeft(StringReplace(StringReplace(FormatCurr('###,##0.00', curValores) , ',', '',[rfReplaceAll]), '.', '',[rfReplaceAll]) , 14, '0'));

            // Linha 14 – (-) Reversão de Provisão e Recuperação de Créditos Baixados como Perda que não Representem Ingressos de Novas Receitas – Administrativa
            cdsSintetico.Filter := 'DESCRICAO like ''%Reversão de Provisão e Recuperação de Créditos Baixados como Perda que não Representem Ingressos de Novas Receitas - Administrativa%''';
            cdsSintetico.Filtered := True;
            curValores := cdsSintetico.FieldByName('VALOR').AsCurrency;
            if (curValores < 0) then
              curValores := curValores * (-1);
            cdsSintetico.Filtered := False;
            write(arquivo, PadLeft(StringReplace(StringReplace(FormatCurr('###,##0.00', curValores) , ',', '',[rfReplaceAll]), '.', '',[rfReplaceAll]) , 14, '0'));

            // Linha 15 – (-) Outras Exclusões e Deduções
            cdsSintetico.Filter := 'DESCRICAO like ''%Outras Exclusões e Deduções%''';
            cdsSintetico.Filtered := True;
            curValores := cdsSintetico.FieldByName('VALOR').AsCurrency;
            if (curValores < 0) then
              curValores := curValores * (-1);
            cdsSintetico.Filtered := False;
            write(arquivo, PadLeft(StringReplace(StringReplace(FormatCurr('###,##0.00', curValores) , ',', '',[rfReplaceAll]), '.', '',[rfReplaceAll]) , 14, '0'));

            //Marcio Sanches Spinosa SOL 208410/14598 KTN 2014896 - inicio
            // Linha 16 – BASE DE CÁLCULO DA CONTRIBUIÇÃO PARA O PIS/PASEP
//            cdsSintetico.Filter := 'DESCRICAO like ''%BASE DE CÁLCULO DA CONTRIBUIÇÃO PARA O PIS/PASEP%''';
//            cdsSintetico.Filtered := True;
            if edBaseCalc.Text <> EmptyStr then
            begin
//            curValores := cdsSintetico.FieldByName('VALOR').AsCurrency;
            curValores := StrToCurr(StringReplace(edBaseCalc.Text, '.', '', [rfReplaceAll]))
            end;
            if (curValores < 0) then
              curValores := curValores * (-1);
            cdsSintetico.Filtered := False;
            write(arquivo, PadLeft(StringReplace(StringReplace(FormatCurr('###,##0.00', curValores) , ',', '',[rfReplaceAll]), '.', '',[rfReplaceAll]) , 14, '0'));
            ////Marcio Sanches Spinosa SOL 208410/14598 KTN 2014896 - Fim

            // Linha 17 – Contribuição para o PIS/Pasep Apurada
            cdsSintetico.Filter := 'DESCRICAO like ''%Contribuição para o PIS/Pasep Apurada%''';
            cdsSintetico.Filtered := True;
            curValores := cdsDadosRelatorio.FieldByName('VLRPIS').AsCurrency;
            if (curValores < 0) then
              curValores := curValores * (-1);
            cdsSintetico.Filtered := False;
            write(arquivo, PadLeft(StringReplace(StringReplace(FormatCurr('###,##0.00', curValores) , ',', '',[rfReplaceAll]), '.', '',[rfReplaceAll]) , 14, '0'));

            // Reservado para uso futuro
            write(arquivo, PadRight('', 262, '0'));
            Writeln(arquivo, PadRight('', 10, '0'));// Filler
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


   finally
              CloseFile(arquivo);
   end;

   GravarLayout(sNomeArquivo);
End;

Function TFrmCadDacon.IsRelatorioSelecionado: Boolean;
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

Procedure TfrmCadDacon.sbtnGeraDaconClick(Sender: TObject);
Begin
   Inherited;
   // pnobre
   sExercicio := edExercicio.Text;
   sPeriodo := Format('%.2d', [cbPeriodo.ItemIndex]);

   If ValidaDadosDacon() Then
      If GerarDacon() Then
         AtualizaDadosDacon();
End;

Function TFrmCadDacon.ValidaDadosDacon: Boolean;

   Function IsExisteLancamentoContabilPeriodo: Boolean;
   Begin
      Result := oDaconMT.VerificarLancamentosContabeis(sExercicio, sPeriodo, sTipoForm, IdNormaAtual);
   End;

   Function ExcluiDadosRelatorio: Boolean;
   Begin
      Result := oDaconMT.ExcluiDadosRelatorio(sExercicio, sPeriodo, sTipoForm, sRetificadora,  IdNormaAtual);
   End;

   Function RecalculaDadosRelatorio: Boolean;
   Begin
      Result := oDaconMT.InserirSaldoPlanoContabil(sExercicio, sPeriodo, sTipoForm, sRetificadora,  IdNormaAtual);
   End;

Begin
   Result := True;
   // 3.3.2. O sistema valida os dados (RN005, MSG003, RN006, MSG004, RN007, MSG005).
   If (edExercicio.Text = EmptyStr) Or
      (cbPeriodo.Text = 'Selecione') Then
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
        if not (IsExisteRelatorioGeradoReticador) then
        begin
           If not(IsExisteRelatorioGeradoNumero) then //Marcio Sanches Spinosa SOL 200212 KTN 1940555 - Inicio
           begin
            If MsgDlg(MSG005, 'Atenção', mtConfirmation, [mbYes, mbNo], 0) = idYes Then
                If ExcluiDadosRelatorio() Then
                   //               If RecalculaDadosRelatorio() Then    // pnobre
                   CarregaDadosRelatorio()
                Else
                   Result := False;
           end;
//           else
//             Result := False;
        end
        else
        begin
            ShowMessage('Não é possivel criar um relatório retificador com um já existente sem número de recibo');
            Result := False;
        end;
      End
   Else
      CarregaDadosRelatorio();
End;

Function TFrmCadDacon.IsExisteRelatorioGerado: Boolean;
Begin
   Result := oDaconMT.IsExisteRelatorioGerado(sExercicio, sPeriodo, sTipoForm);
End;

Function TFrmCadDacon.CarregaDadosRelatorio: Boolean;
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
   //Marcio Sanches Spinosa SOL: 126124/126125 Kintana: 656907/656908 - Fim
   CarregarDadosControles();
   AjustaComboBoxLinhas(cdsSintetico.FieldByName('IDRELATORIODADOS').AsInteger);
   dblcTipoRelatCad.Setfocus;
   Result := True;
End;

Procedure TFrmCadDacon.CarregarDadosControles();
Begin
   // pnobre
   // Aba Sintetico

   //MARCIO SANCHES SPINOSA
   edNumRecibo.Text := cdsDadosRelatorio.FieldByName('NURECIBO').asString;

   EdReciboSintetico.Text := cdsDadosRelatorio.FieldByName('NURECIBO').asString;
   edReciboRetificadorSintetico.Text := cdsDadosRelatorio.FieldByName('NURECRETIFICADOR').asString;
   //MARCIO SANCHES SPINOSA
   vDouValorTotal := 0;
   cdsSintetico.First;

   while not cdsSintetico.Eof do
   begin
     vDouValorTotal := vDouValorTotal + (cdsSintetico.FieldByName('VALOR').AsFloat);
     cdsSintetico.Next;
   end;

   //MARCIO SANCHES SPINOSA
   edBaseCalc.text := floattostrf(vDouValorTotal, ffnumber, 12, 2);

   if (cdsSintetico.FieldByName('IDRELATORIODADOS').AsString <> EmptyStr) then
   begin
     if (cdsDadosRelatorio.FieldByName('VLRPIS').AsCurrency = 0) then
        edVlrPis.text := floattostrf(oDaconMT.AtualizarPIS(cdsSintetico.FieldByName('IDRELATORIODADOS').AsString , vDouValorTotal), ffNumber, 12, 2)
     else
        edVlrPis.text := FloatToStrF(cdsDadosRelatorio.FieldByName('VLRPIS').AsFloat, ffNumber, 12, 2);

     if (cdsDadosRelatorio.FieldByName('VLRCOFINS').AsCurrency = 0) then
        edVlrCofins.Text := floattostrf(oDaconMT.AtualizarCOFINS(cdsSintetico.FieldByName('IDRELATORIODADOS').AsString, vDouValorTotal), ffnumber, 12, 2)
     else
        edVlrCofins.Text := floattostrf(cdsDadosRelatorio.FieldByName('VLRCOFINS').AsFloat, ffNumber, 12, 2);
   end;
   edBaseCalc.Text := floattostrf(vDouValorTotal, ffnumber, 12, 2);

   // Aba Analitico
   EdReciboAnalitico.Text := cdsDadosRelatorio.FieldByName('NURECIBO').asString;
   edReciboRetificadorAnalitico.Text := cdsDadosRelatorio.FieldByName('NURECRETIFICADOR').asString;
   edContaContabil.Text := '';

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

Function TFrmCadDacon.CriarRelatorioDacon(Const bRetificador: Boolean): Boolean;

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

Function TFrmCadDacon.GerarDacon: Boolean;
Var bRelatorioRetificador: Boolean;
Begin
   // 3.3.3. O sistema gera o DACON (RN008, RN009, MSG006, MSG007, RN010, RN011).
   bRelatorioRetificador := IsExisteRelatorioGeradoNumero();
   If bRelatorioRetificador Then
      MsgDlg(MSG006, 'Atenção', mtWarning, [mbOK], 0);
   result := CriarRelatorioDacon(bRelatorioRetificador);
End;

Function TFrmCadDacon.AtualizaDadosDacon: Boolean;
Begin
   // 3.3.4. O sistema apresenta a interface de relatório sintético, figura 6.1 (RN012).
   CarregaDadosRelatorio();
   dbGridSintetico.Invalidate;
   Result := True;
End;

Procedure TfrmCadDacon.sbtnExcluiDaconClick(Sender: TObject);
Begin
   Inherited;
   if (cdsDadosRelatorio.Active = true) then//Marcio Sanches Spinosa SOL 208410/14598 KTN 2014896
   begin
     if (cdsDadosRelatorio.FieldByName('NURECIBO').asString = EmptyStr) then
     BEGIN
        if not (oDaconMT.ExisteRetificadora(sExercicio, sPeriodo, sTipoForm)) then
        begin
           If isPossivelExcluirRelatorio() Then
              If ExcluiDacon() Then
                 CarregaDadosRelatorio();
        end
        //Marcio Sanches Spinosa SOL: 193089 Kintana: 1837888 - Inicio
        else if (cdsDadosRelatorio.FieldByName('NURECIBO').AsString = EmptyStr) then
        begin
            If isPossivelExcluirRelatorio() Then
              If ExcluiDacon() Then
                  CarregaDadosRelatorio();
        end
        else
          ShowMessage('Não é possível alterar um relatório se já existe uma corretiva');
        //Marcio Sanches Spinosa SOL: 193089 Kintana: 1837888 - Fim
     end
     else
     begin
       ShowMessage('Não é possivel excluir ou alterar o relatório que possua número de recibo!');
     end;
   end
   else
      ShowMessage('Não existe relatório carregado'); //Marcio Sanches Spinosa SOL 208410/14598 KTN 2014896
End;

Function TFrmCadDacon.ExcluiDacon: Boolean;
Begin
   // 3.6.4. O sistema excluir os dados cadastrais do banco de dados de acordo com a RN015.
   Result := oDaconMT.ExcluiDadosRelatorio(sExercicio, sPeriodo, sTipoForm, sRetificadora, IdNormaAtual);
End;

Function TFrmCadDacon.IsPossivelExcluirRelatorio: Boolean;
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

Procedure TfrmCadDacon.sbtnProcurarClick(Sender: TObject);
Var Texto: String;
   result: Boolean;
Begin
   Inherited;
   vDouValorTotal := 0;
   If ((edExercicio.Text = EmptyStr) Or
      (cbPeriodo.Text = 'Selecione')) And
      (edNumRecibo.Text = EmptyStr) Then
      Begin
         If (edExercicio.Text = EmptyStr) Or
            (cbPeriodo.Text = 'Selecione') Then
            Texto := 'Não foi informado o Exercício ou Período. Verifique !'
         Else
            Texto := Format(MSG002, [cbPeriodo.Text + '/' + EdExercicio.Text]);

         MsgDlg(Texto, 'Erro', mtError, [mbOK], 0);
      End
   Else
      Begin
         If (Trim(edNumRecibo.Text) <> '') Then
            Result := PesquisarRelatorioNumRecibo()
         Else
            Result := PesquisarRelatorioMesAno();

            CarregaDadosRelatorio();

         If not Result Then
         begin
            MsgDlg(MSG019, 'Erro', mtError, [mbOK], 0);
            LimparCds;
         end;
      End;
End;

Function TFrmCadDacon.PesquisarRelatorioNumRecibo: Boolean;
Begin
   sNumeroRecibo := edNumRecibo.Text;
   sPeriodo := Format('%.2d', [cbPeriodo.ItemIndex]);
   Result := oDaconMT.PesquisarRelatorioNumRecibo(sNumeroRecibo, sExercicio, sPeriodo, sTipoForm, IdNormaAtual, sRetificadora);//Marcio Sanches Spinosa SOL: 126124/126125 Kintana: 656907/656908
End;

Function TFrmCadDacon.PesquisarRelatorioMesAno: Boolean;
Begin
   sExercicio := edExercicio.Text;
   sPeriodo := Format('%.2d', [cbPeriodo.ItemIndex]);
   Result := oDaconMT.PesquisarRelatorioMesAno(sExercicio, sPeriodo, sTipoForm, sRetificadora, IdNormaAtual)//Marcio Sanches Spinosa SOL: 126124/126125 Kintana: 656907/656908
End;

Procedure TfrmCadDacon.edContaContabilChange(Sender: TObject);
Begin
   Inherited;
   If edContaContabil.Text <> '' Then
      cdsAnalitico.Locate('placonta', edContaContabil.text, [lopartialkey])
   Else
      cdsAnalitico.first;
End;

Procedure TfrmCadDacon.pgDadosChange(Sender: TObject);
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

Procedure TFrmCadDacon.AjustaComboBoxLinhas(Const pIdRelatorioDados: Integer);
Var oCds: TClientDataSet;
Begin
   oCds := TClientDataSet.Create(Nil);
   oCds.Data := oDaconMT.CarregaDadosLinhas(pIdRelatorioDados);
   cbxLinha.Items.Clear;
   cbxLinha.Items.AddObject('Todas as Linhas', Pointer(0));

   While Not oCds.Eof Do
      Begin
         cbxLinha.Items.AddObject(oCds.FieldbyName('Descricao').asString,
            Pointer(oCds.FieldByName('IdLinha').asInteger));
         oCds.Next;
      End;
   oCds.Close;
   FreeAndNil(oCds);
   cbxLinha.ItemIndex := 0;
End;

Procedure TfrmCadDacon.cdsAnaliticoAfterScroll(DataSet: TDataSet);
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

Procedure TfrmCadDacon.btnAtualizarClick(Sender: TObject);
Begin
   Inherited;
   //Marcio Sanches Spinosa SOL 200212 KTN 1940555 - Inicio
   if not (oDaconMT.IsExisteRelatorioGeradoNumero(sExercicio, sPeriodo, sTipoForm)) then
   begin
     cdsAnalitico.Edit;
     //Marcio Sanches Spinosa SOL: 126124/126125 Kintana: 656907/656908 - Inicio
     if (Pos('R$', edDebito.Text) = 0) then
        cdsAnalitico.FieldByName('Debito').AsCurrency := StrToCurr(StringReplace(edDebito.Text, '.', '',[rfReplaceAll, rfIgnoreCase]));
     if (Pos('R$', edCredito.Text) = 0) then
        cdsAnalitico.FieldByName('Credito').AsCurrency := StrToCurr(StringReplace(edCredito.Text, '.', '',[rfReplaceAll, rfIgnoreCase]));
     cdsAnalitico.Post;
     oDaconMT.AtualizaDados(CdsAnalitico);
     CarregaDadosRelatorio;
   end
   else
     ShowMessage('Não é possível alterar um relatório que já possui número de recibo'); //Marcio Sanches Spinosa SOL 200212 KTN 1940555 - Inicio
   //Marcio Sanches Spinosa SOL: 126124/126125 Kintana: 656907/656908 - FIM
End;

Procedure TfrmCadDacon.cbxLinhasClick(Sender: TObject);
Begin
   Inherited;
   cdsAnalitico.data := oDaconMT.CarregarDadosAnaliticosMesAno(sExercicio,
      sPeriodo, sTipoForm, sRetificadora, Integer(cbxLinha.Items.Objects[cbxlinha.ItemIndex]), IdNormaAtual);
End;

Procedure TfrmCadDacon.dbGridAnaliticoDrawDataCell(Sender: TObject;
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

Procedure TfrmCadDacon.dblcTipoRelatCadChange(Sender: TObject);
Begin
   Inherited;
   sTipoForm := inttostr(dblcTipoRelatCad.LookupTable.FieldByName('IdTipo').asInteger);
   Caption := 'Demonstrativo de Apuração de Contribuções Sociais - ' + dblcTipoRelatCad.text;
   IdNormaAtual := oDaconMT.LocalizaNormaVigenteAtual(dblcTipoRelatCad.LookupTable.FieldByName('IdTipo').asString);
   If dblcTipoRelatCad.LookupTable.FieldByName('IdTipo').asInteger = 1 Then
      Begin
         oDaconMT.isDacon := True;
         sbtnGeraDacon.Caption := 'Gerar DACON';
         sbtnExcluiDacon.Caption := 'Excluir DACON';
      End
   Else
      Begin
         oDaconMT.isDacon := False;
         sbtnGeraDacon.Caption := 'Gerar DIPJ';
         sbtnExcluiDacon.Caption := 'Excluir DIPJ';
      End;

   If (edExercicio.Text <> EmptyStr) And (cbPeriodo.Text <> 'Selecione') Then
      sbtnProcurarClick(self);

End;

procedure TfrmCadDacon.btnGravarClick(Sender: TObject);
var   oAtualizaRecibo : TClientDataSet;
      sSql            : string;
begin
  inherited;
  //Marcio Sanches Spinosa SOL: 126124/126125 Kintana: 656907/656908

  if not (oDaconMT.ExisteRetificadora(sExercicio, sPeriodo, sTipoForm)) then
  begin
    edReciboSintetico.Text := edNumRecibo.Text;
    oDaconMT.AtualizaNumeroRecibo(cdsSintetico, edNumRecibo.Text, sNumeroAntigo);
    sbtnProcurar.Click;
  end
  else
  begin
      ShowMessage('Não é possível alterar o número do recibo, já existe um relatório retificador.');
      edNumRecibo.Text := edReciboSintetico.Text;
  end;
  //Marcio Sanches Spinosa SOL: 126124/126125 Kintana: 656907/656908

end;

procedure TfrmCadDacon.dbGridAnaliticoCalcCellColors(Sender: TObject;
  Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont;
  ABrush: TBrush);
begin
  inherited;
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
end;

function TfrmCadDacon.PadLeft(aStr: string; aSize: Integer; aCh: char = ' '): string;
begin
 while Length(aStr) < aSize do
   aStr := aCh + aStr;

 Result := aStr;
end;

//Marcio Sanches Spinosa SOL: 126124/126125 Kintana: 656907/656908
function TfrmCadDacon.PadRight(aStr: string; aSize: Integer;
  aCh: char): string;
begin
 while Length(aStr) < aSize do
   aStr := aStr + aCh;

 Result := aStr;
end;
//Marcio Sanches Spinosa SOL: 126124/126125 Kintana: 656907/656908
//Marcio Sanches Spinosa SOL: 126124/126125 Kintana: 656907/656908
procedure TfrmCadDacon.LimparCds;
begin
  lblNomeEmpresarial.Caption := EmptyStr;
  edCredito.Text             := EmptyStr;
  edDebito.Text              := EmptyStr;
  lblCNPJ.Caption            := EmptyStr;
  lblNomeRepre.Caption       := EmptyStr;
  lblTelefoneResp.Caption    := EmptyStr;
  lblNomeResp.Caption        := EmptyStr;
  lblTelefoneResp.Caption    := EmptyStr;
  lblCorreio1Resp.Caption    := EmptyStr;
  lblRamalResp.Caption       := EmptyStr;
  lblCpfResp.Caption         := EmptyStr;
  lblFaxResp.Caption         := EmptyStr;
  lblCorreio2Resp.Caption    := EmptyStr;
  lblNomeRepre.Caption       := EmptyStr;
  lblTelefoneRepre.Caption   := EmptyStr;
  lblCorreio1Repre.Caption   := EmptyStr;
  lblCpfRepre.Caption        := EmptyStr;
  lblFaxRepre.Caption        := EmptyStr;
  lblRamalRepre.Caption      := EmptyStr;
  edReciboSintetico.Text     := EmptyStr;
  edReciboAnalitico.Text     := EmptyStr;

end;
//Marcio Sanches Spinosa SOL: 126124/126125 Kintana: 656907/656908
function TfrmCadDacon.IsExisteRelatorioGeradoNumero: Boolean;
begin
   Result := oDaconMT.IsExisteRelatorioGeradoNumero(sExercicio, sPeriodo, sTipoForm);
end;

//Marcio Sanches Spinosa SOL: 126124/126125 Kintana: 656907/656908
procedure TfrmCadDacon.rgTipoClick(Sender: TObject);
begin
  inherited;

   if (rgTipo.ItemIndex = 0) then
     sRetificadora := 'N'
   else
     sRetificadora := 'S';
   edNumRecibo.Text := EmptyStr;
end;
//Marcio Sanches Spinosa SOL: 126124/126125 Kintana: 656907/656908
procedure TfrmCadDacon.dbGridSinteticoRowChanged(Sender: TObject);
begin
  inherited;
  edNumRecibo.Text := dbGridSintetico.Fields[0].AsString;
  sNumeroAntigo    := dbGridSintetico.Fields[0].AsString;
end;

function TfrmCadDacon.IsExisteRelatorioGeradoReticador: Boolean;
begin
   Result := oDaconMT.IsExisteRelatorioGeradoReticador(sExercicio, sPeriodo, sTipoForm);
end;

procedure TfrmCadDacon.cbxLinhaClick(Sender: TObject);
begin
  inherited;
   cdsAnalitico.DisableControls;
   cdsAnalitico.Data := oDaconMT.CarregarDadosAnaliticosMesAno(sExercicio,
                                                               sPeriodo,
                                                               sTipoForm,
                                                               sRetificadora,
                                                               Integer(cbxLinha.Items.Objects[cbxLinha.ItemIndex]),
                                                               cdsSintetico.FieldByName('IdNorma').asInteger);
   sNumeroAntigo := cdsSintetico.FieldByName('NURECIBO').AsString;
   cdsAnalitico.EnableControls;
end;

End.






