// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    :  Jéssica Lana
// Data        :  19/02/2009
// Pendência   :  SOL 109421 KINTANA 496332
// Descrição   :  Alteração de gravação de arquivos de log na raiz do disco C:
// *****************************************************************************

unit FImportaCartFdoInv;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelarInv, StdCtrls, Buttons, wwdbdatetimepicker, CMDateTimePicker,
  IvDictio, IvMulti, IvEMulti, MAHlpBtn, TB97Tlbr, TB97, fcLabel, ExtCtrls,
  Db, DBTables, Wwquery, wwdblook, Wwdatsrc, OleCtnrs, ComObj, uSistema, ComCtrls;

type
  TFrmImportaCartFdoInv = class(TfrmOkCancelarInv)
    OpenDialog1: TOpenDialog;
    QryImportacao: TwwQuery;
    QryAux: TwwQuery;
    QryBolsaValores: TwwQuery;
    QryBolsaValoresSGLBOLSAVALORES: TStringField;
    QryBolsaValoresIDBOLSAVALORES: TFloatField;
    QryFundoInvestOperacao: TwwQuery;
    QryFundoInvestOperacaoIDFUNDOINVEST: TFloatField;
    QryFundoInvestOperacaoDESCFUNDOINVEST: TStringField;
    QryFundoInvestOperacaoIDCARTEIRAINVEST: TFloatField;
    QryFundoInvestOperacaoIDTIPOFUNDOINVEST: TFloatField;
    Panel1: TPanel;
    ProgressBar1: TProgressBar;
    RdgCarteiraAtivos: TRadioGroup;
    Panel2: TPanel;
    Label3: TLabel;
    DateEdit1: TCMDateTimePicker;
    Label2: TLabel;
    DbLkcBolsa: TwwDBLookupCombo;
    Label4: TLabel;
    Label1: TLabel;
    edtArquivo: TEdit;
    SB1: TSpeedButton;
    QryPatroPlanPrevContab: TwwQuery;
    QryPatroPlanPrevContabIDPLANPREVCTBPATR: TFloatField;
    QryPatroPlanPrevContabIDPLANOPREV: TFloatField;
    QryPatroPlanPrevContabIDPATRO: TFloatField;
    QryPatroPlanPrevContabPLANPRVCONTABPATRO: TStringField;
    DbLkcPatroPlano: TwwDBLookupCombo;
    Label5: TLabel;
    DbLkCCarteiraInvest: TwwDBLookupCombo;
    Label6: TLabel;
    qryCarteiraInvest: TwwQuery;
    qryCarteiraInvestDESCCARTINVEST: TStringField;
    qryCarteiraInvestIDCARTEIRAINVEST: TFloatField;
    qryCarteiraInvestIDGESTORCARTEIRA: TFloatField;
    qryCarteiraInvestFLGCARTPROP: TFloatField;
    qryCarteiraInvestFLGCALCDIARIO: TStringField;
    qryCarteiraInvestDATAINICIO: TDateTimeField;
    qryCarteiraInvestFLGTRATALOTE: TStringField;
    qryCarteiraInvestTRGDTINCLUSAO: TDateTimeField;
    qryCarteiraInvestTRGUSERINCLUSAO: TStringField;
    qryCarteiraInvestIDPLANOPREV: TFloatField;
    qryCarteiraInvestIDPATROCINADORA: TFloatField;
    qryCarteiraInvestIDTIPOINVEST: TFloatField;
    qryCarteiraInvestIDMERCADO: TFloatField;
    qryCarteiraInvestFLGORDMOVINV: TStringField;
    DbLkCFundoInvest: TwwDBLookupCombo;
    procedure SB1Click(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    ExcelApp, Sheet : Variant;
    function  IntegracaoFDOCartAcoes    : Boolean;
    function  IntegracaoFDOOperCompr    : Boolean;
    function  IntegracaoFDOTitPrivados  : Boolean;
    function  IntegracaoFDOTitPublicos  : Boolean;
    function  IntegracaoFDOSwap         : Boolean;
    function  IntegracaoFDODespCorret   : Boolean;
    function  IntegracaoFDOOutrasContas : Boolean;


  public
    { Public declarations }
  end;

var
  FrmImportaCartFdoInv: TFrmImportaCartFdoInv;

implementation

uses UBibliotecaInvest, DBaseDados, UDataBase, UMensErro;

{$R *.DFM}

procedure TFrmImportaCartFdoInv.SB1Click(Sender: TObject);
begin
  inherited;
// Abre a Pesquisa e Testa Retorno
  If (OpenDialog1.Execute) Then Begin
    edtArquivo.Text := UpperCase(OpenDialog1.FileName);
  End;
end;

function TFrmImportaCartFdoInv.IntegracaoFDOOperCompr    : Boolean;
Const
  VetorEnumerado  : Array['A'..'Z'] Of Integer = (1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26);
Var
  RegCotacoes     :  Record
                         ContraParte   : String;
                         Lastro        : String;
                         DataEmissao   : String;
                         DataVencto    : String;
                         StaAtivPass   : String;
                         Quantidade    : String;
                         Taxa          : String;
                         Indexador     : String;
                         PuCompra      : String;
                         PuVencto      : String;
                         Financeiro    : String;
                         ContraParOpe  : String;
                         IndexadorOpe  : String;
                         PerIndexaOpe  : String;
                         CupomTaxa     : String;
                         DataRelOpe    : String;
                         DataReversao  : String;
                     End;
   I, iFdoOperCompr : Integer;

begin
   if not dtmBaseDados.dbBaseDados.InTransaction then
      dtmBaseDados.dbBaseDados.StartTransaction;

   ExecutaQuery(QryImportacao,'DELETE FROM FDOOPERCOMPR WHERE '+
    ' IDFUNDOINVEST      = '+DbLkCFundoInvest.LookupValue+' AND '+
    ' IDCARTEIRAINVEST   = '+DbLkCCarteiraInvest.LookupValue+' AND '+
    ' IDPLANPREVCTBPATR  = '+DbLkcPatroPlano.LookupValue+' AND '+
    ' DATAOPER           = '+'TO_DATE('''+DateEdit1.Text+''','+'''DD/MM/YYYY'')');

   for I := 6 to (Sheet.UsedRange.Rows.Count+1) do
   begin
      ProgressBar1.Stepit;
      // Preenche o Registro com  as Cotacoes
      RegCotacoes.ContraParte   := Trim(Sheet.Cells[I,VetorEnumerado['D']]);
      RegCotacoes.Lastro        := Trim(Sheet.Cells[I,VetorEnumerado['E']]);
      RegCotacoes.DataEmissao   := Trim(Sheet.Cells[I,VetorEnumerado['F']]);
      RegCotacoes.DataVencto    := Trim(Sheet.Cells[I,VetorEnumerado['G']]);
      RegCotacoes.StaAtivPass   := Trim(Sheet.Cells[I,VetorEnumerado['H']]);
      RegCotacoes.Quantidade    := Trim(Sheet.Cells[I,VetorEnumerado['I']]);
      RegCotacoes.Taxa          := Copy(Trim(Sheet.Cells[I,VetorEnumerado['J']]),1,
                  Length(Trim(Sheet.Cells[I,VetorEnumerado['J']]))-1);
      RegCotacoes.Indexador     := Trim(Sheet.Cells[I,VetorEnumerado['K']]);
      RegCotacoes.PuCompra      := Trim(Sheet.Cells[I,VetorEnumerado['L']]);
      RegCotacoes.PuVencto      := Trim(Sheet.Cells[I,VetorEnumerado['M']]);
      RegCotacoes.Financeiro    := Trim(Sheet.Cells[I,VetorEnumerado['N']]);
      RegCotacoes.ContraParOpe  := Trim(Sheet.Cells[I,VetorEnumerado['O']]);
      RegCotacoes.IndexadorOpe  := Trim(Sheet.Cells[I,VetorEnumerado['P']]);
      RegCotacoes.PerIndexaOpe  := Trim(Sheet.Cells[I,VetorEnumerado['Q']]);
      RegCotacoes.CupomTaxa     := Trim(Sheet.Cells[I,VetorEnumerado['R']]);
      RegCotacoes.DataRelOpe    := Trim(Sheet.Cells[I,VetorEnumerado['S']]);
      RegCotacoes.DataReversao  := Trim(Sheet.Cells[I,VetorEnumerado['T']]);

      // Acerta Operações
      if (RegCotacoes.ContraParte   = '') or (RegCotacoes.ContraParte   = 'NA') then
          RegCotacoes.ContraParte  := '';

      if (RegCotacoes.Lastro       = '')  or (RegCotacoes.Lastro  = 'NA') then
         RegCotacoes.Lastro       := '';

      if (RegCotacoes.DataEmissao  = '')  or (RegCotacoes.DataEmissao  = 'NA') then
         RegCotacoes.DataEmissao  := '';

      if (RegCotacoes.DataVencto   = '')  or (RegCotacoes.DataVencto  = 'NA') then
         RegCotacoes.DataVencto   := '';

      if (RegCotacoes.StaAtivPass  = '')  or (RegCotacoes.StaAtivPass  = 'NA') then
         RegCotacoes.StaAtivPass  := '';

      if (RegCotacoes.Quantidade   = '')  or (RegCotacoes.Quantidade    = 'NA') then
         RegCotacoes.Quantidade   := '0';

      if (RegCotacoes.Taxa         = '')  or (RegCotacoes.Taxa    = 'NA') then
         RegCotacoes.Taxa         := '0';

      if (RegCotacoes.Indexador    = '')  or (RegCotacoes.Indexador  = 'NA') then
         RegCotacoes.Indexador    := '';

      if (RegCotacoes.PuCompra     = '')  or (RegCotacoes.PuCompra     = 'NA') then
         RegCotacoes.PuCompra     := '0';

      if (RegCotacoes.PuVencto     = '')  or (RegCotacoes.PuVencto     = 'NA') then
         RegCotacoes.PuVencto     := '0';

      if (RegCotacoes.Financeiro   = '')  or (RegCotacoes.Financeiro = 'NA') then
         RegCotacoes.Financeiro   := '0';

      if (RegCotacoes.ContraParOpe = '')  or (RegCotacoes.ContraParOpe = 'NA') then
         RegCotacoes.ContraParOpe := '';

      if (RegCotacoes.IndexadorOpe = '')  or (RegCotacoes.IndexadorOpe = 'NA') then
         RegCotacoes.IndexadorOpe := '';

      if (RegCotacoes.PerIndexaOpe = '')  or (RegCotacoes.PerIndexaOpe = 'NA') then
         RegCotacoes.PerIndexaOpe := '0';

      if (RegCotacoes.CupomTaxa    = '')  or (RegCotacoes.CupomTaxa = 'NA') then
         RegCotacoes.CupomTaxa    := '0';

      if (RegCotacoes.DataRelOpe   = '')  or (RegCotacoes.DataRelOpe = 'NA') then
         RegCotacoes.DataRelOpe   := '';

      if (RegCotacoes.DataReversao = '')  or (RegCotacoes.DataReversao = 'NA') then
         RegCotacoes.DataReversao := '';

      if RegCotacoes.Financeiro <> '0' then
      begin
         // Caso não exista Tenta Inserir Registro no Arquivo de Cotacoes
         Try

            iFdoOperCompr := LeUltRegistro(Nil,'FDOOPERCOMPR');

            ExecutaQuery(QryImportacao,
              'INSERT INTO FDOOPERCOMPR '+
              '(IDFDOOPERCOMPR, IDFUNDOINVEST, IDCARTEIRAINVEST, IDPLANPREVCTBPATR, '+
              ' DESCCONTRAPARTE, LASTRO, DATAOPER, DATAEMISSAO, DATAVENCIMENTO, '+
              ' STAATIVPASS, INDEXADOR, TAXA, QUANTIDADE, PUCOMPRA, PUVENCIMENTO, '+
              ' VLRFINANCEIRO, DESCCTRPAROPER, INDEXADORCTRPAR, PERCTRPAROPER, TAXACTRPAROPER, '+
              ' DATARELOPER, DATAREVEROPER) VALUES '+
              '('+IntToStr(iFdoOperCompr)+', '+
              DbLkCFundoInvest.LookupValue+', '+
              DbLkCCarteiraInvest.LookupValue+', '+
              DbLkcPatroPlano.LookupValue+', '+
              ''''+Trim(TrocaVirgulaPonto(RegCotacoes.ContraParte))+''', '+
              ''''+Trim(TrocaVirgulaPonto(RegCotacoes.Lastro))+''', '+
              'TO_DATE('''+DateEdit1.Text+''','+'''DD/MM/YYYY''), '+
              'TO_DATE('''+Trim(TrocaVirgulaPonto(RegCotacoes.DataEmissao))+''','+
              '''DD/MM/YY''), '+
              'TO_DATE('''+Trim(TrocaVirgulaPonto(RegCotacoes.DataVencto))+''','+
              '''DD/MM/YY''), '+
              ''''+Trim(RegCotacoes.StaAtivPass)+''','+
              ''''+Trim(TrocaVirgulaPonto(RegCotacoes.Indexador))+''', '+
              'NVL('+Trim(TrocaVirgulaPonto(RegCotacoes.Taxa))    +',0), '+
              'NVL('+Trim(TrocaVirgulaPonto(RegCotacoes.Quantidade))    +',0), '+
              'NVL('+Trim(TrocaVirgulaPonto(RegCotacoes.PuCompra))    +',0), '+
              'NVL('+Trim(TrocaVirgulaPonto(RegCotacoes.PuVencto))    +',0), '+
              'NVL('+Trim(TrocaVirgulaPonto(RegCotacoes.Financeiro))    +',0), '+
              ''''+Trim(TrocaVirgulaPonto(RegCotacoes.ContraParOpe))+''', '+
              ''''+Trim(TrocaVirgulaPonto(RegCotacoes.IndexadorOpe))+''', '+
              'NVL('+Trim(TrocaVirgulaPonto(RegCotacoes.PerIndexaOpe))    +',0), '+
              'NVL('+Trim(TrocaVirgulaPonto(RegCotacoes.CupomTaxa))    +',0), '+
              'TO_DATE('''+Trim(TrocaVirgulaPonto(RegCotacoes.DataRelOpe))+''','+
              '''DD/MM/YY''), '+
              'TO_DATE('''+Trim(TrocaVirgulaPonto(RegCotacoes.DataReversao))+''','+
              '''DD/MM/YY''))');
         Except
            ShowMessage('Erro na nova inclusão !');
            DtmBaseDados.dbBaseDados.Rollback;
            QryImportacao.Close;
            Result := False;
            Exit;
         End;
      end;
   End;
   if dtmBaseDados.dbBaseDados.InTransaction then
      dtmBaseDados.dbBaseDados.Commit;
   Result := True;
   QryImportacao.Close;
end;

function TFrmImportaCartFdoInv.IntegracaoFDOTitPrivados  : Boolean;
Const
  VetorEnumerado  : Array['A'..'Z'] Of Integer = (1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26);
Var
  RegCotacoes     :  Record
                         ContraParte   : String;
                         Codigo        : String;
                         StaAtivPass   : String;
                         DataCompra    : String;
                         DataVencto    : String;
                         Principal     : String;
                         Indexador     : String;
                         Taxa          : String;
                         Financeiro    : String;
                         CupomTaxa     : String;
                         CodSnd        : String;
                         QtdDebentures : String;
                         StaGarantia   : String;

                     End;
   I, iFdoTitPrivados : Integer;

begin
   if not dtmBaseDados.dbBaseDados.InTransaction then
      dtmBaseDados.dbBaseDados.StartTransaction;

   ExecutaQuery(QryImportacao,'DELETE FROM FDOTITPRIVADOS WHERE '+
     ' IDFUNDOINVEST      = '+DbLkCFundoInvest.LookupValue+' AND '+
     ' IDCARTEIRAINVEST   = '+DbLkCCarteiraInvest.LookupValue+' AND '+
     ' IDPLANPREVCTBPATR  = '+DbLkcPatroPlano.LookupValue+' AND '+
     ' DATAOPER           = '+'TO_DATE('''+DateEdit1.Text+''','+'''DD/MM/YYYY'')');

   for I := 6 to (Sheet.UsedRange.Rows.Count+1) do
   begin
      ProgressBar1.Stepit;
      // Preenche o Registro com  as Cotacoes
      RegCotacoes.ContraParte   := Trim(Sheet.Cells[I,VetorEnumerado['D']]);
      RegCotacoes.Codigo        := Trim(Sheet.Cells[I,VetorEnumerado['E']]);
      RegCotacoes.StaAtivPass   := Trim(Sheet.Cells[I,VetorEnumerado['F']]);
      RegCotacoes.DataCompra    := Trim(Sheet.Cells[I,VetorEnumerado['G']]);
      RegCotacoes.DataVencto    := Trim(Sheet.Cells[I,VetorEnumerado['H']]);
      RegCotacoes.Principal     := Trim(Sheet.Cells[I,VetorEnumerado['I']]);
      RegCotacoes.Indexador     := Trim(Sheet.Cells[I,VetorEnumerado['J']]);
      RegCotacoes.Taxa          := Copy(Trim(Sheet.Cells[I,VetorEnumerado['K']]),1,
                  Length(Trim(Sheet.Cells[I,VetorEnumerado['K']]))-1);
      RegCotacoes.Financeiro    := Trim(Sheet.Cells[I,VetorEnumerado['L']]);
      RegCotacoes.CupomTaxa     := Trim(Sheet.Cells[I,VetorEnumerado['M']]);
      RegCotacoes.CodSnd        := Trim(Sheet.Cells[I,VetorEnumerado['N']]);
      RegCotacoes.QtdDebentures := Trim(Sheet.Cells[I,VetorEnumerado['O']]);
      RegCotacoes.StaGarantia   := Trim(Sheet.Cells[I,VetorEnumerado['P']]);

      // Acerta Operações
      if (RegCotacoes.ContraParte  = '') or (RegCotacoes.ContraParte   = 'NA') then
          RegCotacoes.ContraParte := '';

      if (RegCotacoes.Codigo       = '')  or (RegCotacoes.Codigo  = 'NA') then
          RegCotacoes.Codigo      := '';

      if (RegCotacoes.StaAtivPass  = '')  or (RegCotacoes.StaAtivPass  = 'NA') then
          RegCotacoes.StaAtivPass := '';

      if (RegCotacoes.DataCompra   = '')  or (RegCotacoes.DataCompra   = 'NA') then
          RegCotacoes.DataCompra  := '';

      if (RegCotacoes.DataVencto   = '')  or (RegCotacoes.DataVencto   = 'NA') then
          RegCotacoes.DataVencto   := '';

      if (RegCotacoes.Principal    = '')  or (RegCotacoes.Principal    = 'NA') then
          RegCotacoes.Principal   := '0';

      if (RegCotacoes.Indexador    = '')  or (RegCotacoes.Indexador  = 'NA') then
          RegCotacoes.Indexador    := '';

      if (RegCotacoes.Taxa         = '')  or (RegCotacoes.Taxa    = 'NA') then
          RegCotacoes.Taxa         := '0';

      if (RegCotacoes.Financeiro   = '')  or (RegCotacoes.Financeiro = 'NA') then
          RegCotacoes.Financeiro   := '0';

      if (RegCotacoes.CupomTaxa    = '')  or (RegCotacoes.CupomTaxa = 'NA') then
         RegCotacoes.CupomTaxa    := '0';

      if (RegCotacoes.CodSnd = '')  or (RegCotacoes.CodSnd = 'NA') then
          RegCotacoes.CodSnd := '';

      if (RegCotacoes.QtdDebentures   = '')  or (RegCotacoes.QtdDebentures = 'NA') then
         RegCotacoes.QtdDebentures   := '0';

      if (RegCotacoes.StaGarantia = '')  or (RegCotacoes.StaGarantia = 'NA') then
         RegCotacoes.StaGarantia := '';

      if RegCotacoes.Financeiro <> '0' then
      begin
         // Caso não exista Tenta Inserir Registro no Arquivo de Cotacoes
         Try

            iFdoTitPrivados := LeUltRegistro(Nil,'FDOTITPRIVADOS');

            ExecutaQuery(QryImportacao,
              'INSERT INTO FDOTITPRIVADOS '+
              '(IDFDOTITPRIVADOS, IDFUNDOINVEST, IDCARTEIRAINVEST, IDPLANPREVCTBPATR, '+
              ' DESCCONTRAPARTE, CODIGO, DATAOPER, DATACOMPRA, DATAVENCIMENTO, '+
              ' STAATIVPASS, INDEXADOR, TAXA, VLRPRINCIPAL, '+
              ' VLRFINANCEIRO, CUPOMTAXA, CODSNDDEBENTURE, '+
              ' QTDDEBENTURES, STAGARANTIA) VALUES '+
              '('+IntToStr(iFdoTitPrivados)+', '+
              DbLkCFundoInvest.LookupValue+', '+
              DbLkCCarteiraInvest.LookupValue+', '+
              DbLkcPatroPlano.LookupValue+', '+
              ''''+Trim(TrocaVirgulaPonto(RegCotacoes.ContraParte))+''', '+
              ''''+Trim(TrocaVirgulaPonto(RegCotacoes.Codigo))+''', '+
              'TO_DATE('''+DateEdit1.Text+''','+'''DD/MM/YYYY''), '+
              'TO_DATE('''+Trim(TrocaVirgulaPonto(RegCotacoes.DataCompra))+''','+
              '''DD/MM/YY''), '+
              'TO_DATE('''+Trim(TrocaVirgulaPonto(RegCotacoes.DataVencto))+''','+
              '''DD/MM/YY''), '+
              ''''+Trim(RegCotacoes.StaAtivPass)+''','+
              ''''+Trim(TrocaVirgulaPonto(RegCotacoes.Indexador))+''', '+
              'NVL('+Trim(TrocaVirgulaPonto(RegCotacoes.Taxa))    +',0), '+
              'NVL('+Trim(TrocaVirgulaPonto(RegCotacoes.Principal))    +',0), '+
              'NVL('+Trim(TrocaVirgulaPonto(RegCotacoes.Financeiro))    +',0), '+
              'NVL('+Trim(TrocaVirgulaPonto(RegCotacoes.CupomTaxa))    +',0), '+
              ''''+Trim(TrocaVirgulaPonto(RegCotacoes.CodSnd))+''', '+
              'NVL('+Trim(TrocaVirgulaPonto(RegCotacoes.QtdDebentures))    +',0), '+
              ''''+Trim(RegCotacoes.StaGarantia)+''')');

         Except
            ShowMessage('Erro na nova inclusão !');
            DtmBaseDados.dbBaseDados.Rollback;
            QryImportacao.Close;
            Result := False;
            Exit;
         End;
      end;
   End;
   if dtmBaseDados.dbBaseDados.InTransaction then
      dtmBaseDados.dbBaseDados.Commit;
   Result := True;
   QryImportacao.Close;
end;

function TFrmImportaCartFdoInv.IntegracaoFDOTitPublicos  : Boolean;
Const
  VetorEnumerado  : Array['A'..'Z'] Of Integer = (1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26);
Var
  RegCotacoes     :  Record
                         ContraParte   : String;
                         Codigo        : String;
                         StaAtivPass   : String;
                         DataEmissao   : String;
                         DataVencto    : String;
                         Quantidade    : String;
                         Taxa          : String;
                         Indexador     : String;
                         PuCompra      : String;
                         PuVencimento  : String;
                         Financeiro    : String;
                         DataCompra    : String;
                         StaGarantia   : String;
                     End;
   I, iFdoTitPublicos : Integer;

begin
   if not dtmBaseDados.dbBaseDados.InTransaction then
      dtmBaseDados.dbBaseDados.StartTransaction;

   ExecutaQuery(QryImportacao,'DELETE FROM FDOTITPUBLICOS WHERE '+
     ' IDFUNDOINVEST      = '+DbLkCFundoInvest.LookupValue+' AND '+
     ' IDCARTEIRAINVEST   = '+DbLkCCarteiraInvest.LookupValue+' AND '+
     ' IDPLANPREVCTBPATR  = '+DbLkcPatroPlano.LookupValue+' AND '+
     ' DATAOPER           = '+'TO_DATE('''+DateEdit1.Text+''','+'''DD/MM/YYYY'')');

   for I := 6 to (Sheet.UsedRange.Rows.Count+1) do
   begin
      ProgressBar1.Stepit;
      // Preenche o Registro com  as Cotacoes
      RegCotacoes.ContraParte   := Trim(Sheet.Cells[I,VetorEnumerado['D']]);
      RegCotacoes.Codigo        := Trim(Sheet.Cells[I,VetorEnumerado['E']]);
      RegCotacoes.StaAtivPass   := Trim(Sheet.Cells[I,VetorEnumerado['F']]);
      RegCotacoes.DataEmissao   := Trim(Sheet.Cells[I,VetorEnumerado['G']]);
      RegCotacoes.DataVencto    := Trim(Sheet.Cells[I,VetorEnumerado['H']]);
      RegCotacoes.Quantidade    := Trim(Sheet.Cells[I,VetorEnumerado['I']]);
      RegCotacoes.Taxa          := Copy(Trim(Sheet.Cells[I,VetorEnumerado['J']]),1,
                  Length(Trim(Sheet.Cells[I,VetorEnumerado['J']]))-1);
      RegCotacoes.Indexador     := Trim(Sheet.Cells[I,VetorEnumerado['K']]);
      RegCotacoes.PuCompra      := Trim(Sheet.Cells[I,VetorEnumerado['L']]);
      RegCotacoes.PuVencimento  := Trim(Sheet.Cells[I,VetorEnumerado['M']]);
      RegCotacoes.Financeiro    := Trim(Sheet.Cells[I,VetorEnumerado['N']]);
      RegCotacoes.DataCompra    := Trim(Sheet.Cells[I,VetorEnumerado['O']]);
      RegCotacoes.StaGarantia   := Trim(Sheet.Cells[I,VetorEnumerado['P']]);

      // Acerta Operações
      if (RegCotacoes.ContraParte  = '') or (RegCotacoes.ContraParte   = 'NA') then
          RegCotacoes.ContraParte := '';

      if (RegCotacoes.Codigo       = '')  or (RegCotacoes.Codigo  = 'NA') then
          RegCotacoes.Codigo      := '';

      if (RegCotacoes.StaAtivPass  = '')  or (RegCotacoes.StaAtivPass  = 'NA') then
          RegCotacoes.StaAtivPass := '';

      if (RegCotacoes.DataEmissao   = '')  or (RegCotacoes.DataEmissao   = 'NA') then
          RegCotacoes.DataEmissao  := '';

      if (RegCotacoes.DataVencto   = '')  or (RegCotacoes.DataVencto   = 'NA') then
          RegCotacoes.DataVencto   := '';

      if (RegCotacoes.Quantidade    = '')  or (RegCotacoes.Quantidade    = 'NA') then
          RegCotacoes.Quantidade   := '0';

      if (RegCotacoes.Taxa         = '')  or (RegCotacoes.Taxa    = 'NA') then
          RegCotacoes.Taxa         := '0';

      if (RegCotacoes.Indexador    = '')  or (RegCotacoes.Indexador  = 'NA') then
          RegCotacoes.Indexador    := '';

      if (RegCotacoes.PuCompra    = '')  or (RegCotacoes.PuCompra = 'NA') then
         RegCotacoes.PuCompra    := '0';

      if (RegCotacoes.PuVencimento    = '')  or (RegCotacoes.PuVencimento = 'NA') then
         RegCotacoes.PuVencimento    := '0';

      if (RegCotacoes.Financeiro   = '')  or (RegCotacoes.Financeiro = 'NA') then
          RegCotacoes.Financeiro   := '0';

      if (RegCotacoes.DataCompra   = '')  or (RegCotacoes.DataCompra = 'NA') then
         RegCotacoes.DataCompra   := '0';

      if (RegCotacoes.StaGarantia = '')  or (RegCotacoes.StaGarantia = 'NA') then
         RegCotacoes.StaGarantia := '';

      if RegCotacoes.Financeiro <> '0' then
      begin
         // Caso não exista Tenta Inserir Registro no Arquivo de Cotacoes
         Try

            iFdoTitPublicos := LeUltRegistro(Nil,'FDOTITPUBLICOS');

            ExecutaQuery(QryImportacao,
              'INSERT INTO FDOTITPUBLICOS '+
              '(IDFDOTITPUBLICOS, IDFUNDOINVEST, IDCARTEIRAINVEST, IDPLANPREVCTBPATR, '+
              ' DESCCONTRAPARTE, CODIGO, DATAOPER, DATAEMISSAO, DATAVENCIMENTO, '+
              ' STAATIVPASS, INDEXADOR, TAXA, QUANTIDADE, '+
              ' PUCOMPRA, PUVENCIMENTO, VLRFINANCEIRO, '+
              ' DATACOMPRA, STAGARANTIA) VALUES '+
              '('+IntToStr(iFdoTitPublicos)+', '+
              DbLkCFundoInvest.LookupValue+', '+
              DbLkCCarteiraInvest.LookupValue+', '+
              DbLkcPatroPlano.LookupValue+', '+
              ''''+Trim(TrocaVirgulaPonto(RegCotacoes.ContraParte))+''', '+
              ''''+Trim(TrocaVirgulaPonto(RegCotacoes.Codigo))+''', '+
              'TO_DATE('''+DateEdit1.Text+''','+'''DD/MM/YYYY''), '+
              'TO_DATE('''+Trim(TrocaVirgulaPonto(RegCotacoes.DataEmissao))+''','+
              '''DD/MM/YY''), '+
              'TO_DATE('''+Trim(TrocaVirgulaPonto(RegCotacoes.DataVencto))+''','+
              '''DD/MM/YY''), '+
              ''''+Trim(RegCotacoes.StaAtivPass)+''','+
              ''''+Trim(TrocaVirgulaPonto(RegCotacoes.Indexador))+''', '+
              'NVL('+Trim(TrocaVirgulaPonto(RegCotacoes.Taxa))    +',0), '+
              'NVL('+Trim(TrocaVirgulaPonto(RegCotacoes.Quantidade))    +',0), '+
              'NVL('+Trim(TrocaVirgulaPonto(RegCotacoes.PuCompra))    +',0), '+
              'NVL('+Trim(TrocaVirgulaPonto(RegCotacoes.PuVencimento))    +',0), '+
              'NVL('+Trim(TrocaVirgulaPonto(RegCotacoes.Financeiro))    +',0), '+
              'TO_DATE('''+Trim(TrocaVirgulaPonto(RegCotacoes.DataCompra))+''','+
              '''DD/MM/YY''), '+
              ''''+Trim(RegCotacoes.StaGarantia)+''')');
         Except
            ShowMessage('Erro na nova inclusão !');
            DtmBaseDados.dbBaseDados.Rollback;
            QryImportacao.Close;
            Result := False;
            Exit;
         End;
      end;
   End;
   if dtmBaseDados.dbBaseDados.InTransaction then
      dtmBaseDados.dbBaseDados.Commit;
   Result := True;
   QryImportacao.Close;
end;

function TFrmImportaCartFdoInv.IntegracaoFDOCartAcoes    : Boolean;
Const
  VetorEnumerado  : Array['A'..'Z'] Of Integer = (1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26);
Var
  RegCotacoes     :  Record
                         Codigo        : String;
                         AtivoPassivo  : String;
                         Quantidade    : String;
                         VlrAjuste     : String;
                         VlrFinanceiro : String;
                     End;

  I, iIdInvestimento, iFdoCartAcoes : Integer;

Begin
   if not dtmBaseDados.dbBaseDados.InTransaction then
      dtmBaseDados.dbBaseDados.StartTransaction;

   for I := 6 to (Sheet.UsedRange.Rows.Count+1) do
   begin
      ProgressBar1.Stepit;
      // Preenche o Registro com  as Cotacoes
      RegCotacoes.Codigo        := Trim(Sheet.Cells[I,VetorEnumerado['D']]);
      RegCotacoes.AtivoPassivo  := Trim(Sheet.Cells[I,VetorEnumerado['E']]);
      RegCotacoes.Quantidade    := Trim(Sheet.Cells[I,VetorEnumerado['F']]);
      RegCotacoes.VlrAjuste     := Trim(Sheet.Cells[I,VetorEnumerado['G']]);
      RegCotacoes.VlrFinanceiro := Trim(Sheet.Cells[I,VetorEnumerado['H']]);

      // Acerta as Ações
      if (RegCotacoes.Codigo        = '') or (RegCotacoes.Codigo        = 'NA') then
          RegCotacoes.Codigo       := '';

      if (RegCotacoes.AtivoPassivo  = '') or (RegCotacoes.AtivoPassivo  = 'NA') then
         RegCotacoes.AtivoPassivo  := '';

      if (RegCotacoes.Quantidade    = '') or (RegCotacoes.Quantidade    = 'NA') then
         RegCotacoes.Quantidade    := '0';

      if (RegCotacoes.VlrAjuste     = '') or (RegCotacoes.VlrAjuste     = 'NA') then
         RegCotacoes.VlrAjuste     := '0';

      if (RegCotacoes.VlrFinanceiro = '') or (RegCotacoes.VlrFinanceiro = 'NA') then
         RegCotacoes.VlrFinanceiro := '0';

      if RegCotacoes.Quantidade <> '0' then
      begin
         // Caso não exista Tenta Inserir Registro no Arquivo de Cotacoes
         Try
           if FazQuery(QryAux,
               'SELECT IDACAO ' +
               'FROM ACOESXBOLSA '+
               'WHERE IDBOLSAVALORES = '''+
                QryBolsaValores.FieldByName('IDBOLSAVALORES').AsString+''' AND '+
               '      SIGLAACAOBOLSA = '''+RegCotacoes.Codigo+'''') then
           begin
              iIdInvestimento := QryAux.FieldByName('IDACAO').AsInteger;
              If Not FazQuery(QryAux,
                 'SELECT QUANTIDADE, VLRAJUSTE, VLRFINANCEIRO, STAATIVPASS FROM FDOCARTACOES '+
                 'WHERE '+
                 ' IDFUNDOINVEST     = '+DbLkCFundoInvest.LookupValue+' AND '+
                 ' IDINVESTIMENTO    = '+IntToStr(iIdInvestimento)+'    AND '+
                 ' IDCARTEIRAINVEST  = '+DbLkCCarteiraInvest.LookupValue+' AND '+
                 ' IDPLANPREVCTBPATR = '+DbLkcPatroPlano.LookupValue+'     AND '+
                 ' DATAMOV        = TO_DATE('''+DateEdit1.Text+''','+'''DD/MM/YYYY'')') then
              begin
                 iFdoCartAcoes := LeUltRegistro(Nil,'FDOCARTACOES');
                 ExecutaQuery(QryImportacao,
                   'INSERT INTO FDOCARTACOES '+
                   '(IDFDOCARTACOES, IDFUNDOINVEST, IDINVESTIMENTO, IDCARTEIRAINVEST, IDPLANPREVCTBPATR, '+
                   ' DATAMOV, STAATIVPASS, QUANTIDADE, VLRAJUSTE, VLRFINANCEIRO) VALUES '+
                   '('+IntToStr(iFdoCartAcoes)+', '+
                   DbLkCFundoInvest.LookupValue+', '+
                   IntToStr(iIdInvestimento)+', '+
                   DbLkCCarteiraInvest.LookupValue+', '+
                   DbLkcPatroPlano.LookupValue+', '+
                   'TO_DATE('''+DateEdit1.Text+''','+'''DD/MM/YYYY''), '+
                   ''''+Trim(RegCotacoes.AtivoPassivo)+''','+
                   'NVL('+Trim(TrocaVirgulaPonto(RegCotacoes.Quantidade))    +',0), '+
                   'NVL('+Trim(TrocaVirgulaPonto(RegCotacoes.VlrAjuste))     +',0), '+
                   'NVL('+Trim(TrocaVirgulaPonto(RegCotacoes.VlrFinanceiro)) +',0))');
              End
              Else If (QryAux.FieldByName('QUANTIDADE').AsString    <> Trim(TrocaVirgulaPonto(RegCotacoes.Quantidade)))    Or
                      (QryAux.FieldByName('VLRAJUSTE').AsString     <> Trim(TrocaVirgulaPonto(RegCotacoes.VlrAjuste)))     Or
                      (QryAux.FieldByName('VLRFINANCEIRO').AsString <> Trim(TrocaVirgulaPonto(RegCotacoes.VlrFinanceiro))) Or
                      (QryAux.FieldByName('STAATIVPASS').AsString   <> Trim(RegCotacoes.AtivoPassivo)) Then
              Begin
                 ExecutaQuery(QryImportacao,
                   'UPDATE FDOCARTACOES       '+
                   'SET STAATIVPASS         = '''+Trim(RegCotacoes.AtivoPassivo)+''','+
                   '    QUANTIDADE          = '+'NVL('+Trim(TrocaVirgulaPonto(RegCotacoes.Quantidade))    +',0), '+
                   '    VLRAJUSTE           = '+'NVL('+Trim(TrocaVirgulaPonto(RegCotacoes.VlrAjuste))     +',0), '+
                   '    VLRFINANCEIRO       = '+'NVL('+Trim(TrocaVirgulaPonto(RegCotacoes.VlrFinanceiro)) +',0)  '+
                   'WHERE IDINVESTIMENTO    = '+IntToStr(iIdInvestimento)+'       AND '+
                   '      IDFUNDOINVEST     = '+DbLkCFundoInvest.LookupValue+'    AND '+
                   '      IDCARTEIRAINVEST  = '+DbLkCCarteiraInvest.LookupValue+' AND '+
                   '      IDPLANPREVCTBPATR = '+DbLkcPatroPlano.LookupValue+'     AND '+
                   '      DATAMOV           = TO_DATE('''+DateEdit1.Text+''','+'''DD/MM/YYYY'')');
              End;
           End;
         Except
            ShowMessage('Erro na nova inclusão !');
            DtmBaseDados.dbBaseDados.Rollback;
            QryImportacao.Close;
            Result := False;
            Exit;
         End;
      end;
   end;
   // Fecha o Arquivo Independente do resultado da Operacao
   if dtmBaseDados.dbBaseDados.InTransaction then
      DtmBaseDados.dbBaseDados.Commit;
   Result := True;
   QryImportacao.Close;
End;

function TFrmImportaCartFdoInv.IntegracaoFDOSwap         : Boolean;
Const
  VetorEnumerado  : Array['A'..'Z'] Of Integer = (1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26);
Var
  RegCotacoes     :  Record
                         ContraParte   : String;
                         Codigo        : String;
                         DataCompra    : String;
                         DataVencto    : String;
                         Principal     : String;
                         IndexadorPass : String;
                         TaxaPassivo   : String;
                         FinanceiroPass: String;
                         IndexadorAtiv : String;
                         TaxaAtivo     : String;
                         FinanceiroAtiv: String;
                         TaxaPassPre   : String;
                         TaxaAtivPre   : String;
                         Emissor       : String;
                         StaGarantia   : String;
                     End;
   I, iFdoSwap : Integer;

begin
   if not dtmBaseDados.dbBaseDados.InTransaction then
      dtmBaseDados.dbBaseDados.StartTransaction;

   ExecutaQuery(QryImportacao,'DELETE FROM FDOSWAP WHERE '+
     ' IDFUNDOINVEST      = '+DbLkCFundoInvest.LookupValue+' AND '+
     ' IDCARTEIRAINVEST   = '+DbLkCCarteiraInvest.LookupValue+' AND '+
     ' IDPLANPREVCTBPATR  = '+DbLkcPatroPlano.LookupValue+' AND '+
     ' DATAOPER           = '+'TO_DATE('''+DateEdit1.Text+''','+'''DD/MM/YYYY'')');

   for I := 6 to (Sheet.UsedRange.Rows.Count+1) do
   begin
      ProgressBar1.Stepit;
      // Preenche o Registro com  as Cotacoes
      RegCotacoes.ContraParte   := Trim(Sheet.Cells[I,VetorEnumerado['D']]);
      RegCotacoes.Codigo        := Trim(Sheet.Cells[I,VetorEnumerado['E']]);
      RegCotacoes.DataCompra    := Trim(Sheet.Cells[I,VetorEnumerado['F']]);
      RegCotacoes.DataVencto    := Trim(Sheet.Cells[I,VetorEnumerado['G']]);
      RegCotacoes.Principal     := Trim(Sheet.Cells[I,VetorEnumerado['H']]);
      RegCotacoes.IndexadorPass := Trim(Sheet.Cells[I,VetorEnumerado['I']]);
      RegCotacoes.TaxaPassivo   := Copy(Trim(Sheet.Cells[I,VetorEnumerado['J']]),1,
                  Length(Trim(Sheet.Cells[I,VetorEnumerado['J']]))-1);
      RegCotacoes.FinanceiroPass:= Trim(Sheet.Cells[I,VetorEnumerado['K']]);
      RegCotacoes.IndexadorAtiv := Trim(Sheet.Cells[I,VetorEnumerado['L']]);
      RegCotacoes.TaxaAtivo     := Copy(Trim(Sheet.Cells[I,VetorEnumerado['M']]),1,
                  Length(Trim(Sheet.Cells[I,VetorEnumerado['M']]))-1);
      RegCotacoes.FinanceiroAtiv:= Trim(Sheet.Cells[I,VetorEnumerado['N']]);
      RegCotacoes.TaxaPassPre   := Trim(Sheet.Cells[I,VetorEnumerado['O']]);
      RegCotacoes.TaxaAtivPre   := Trim(Sheet.Cells[I,VetorEnumerado['P']]);
      RegCotacoes.Emissor       := Trim(Sheet.Cells[I,VetorEnumerado['Q']]);
      RegCotacoes.StaGarantia   := Trim(Sheet.Cells[I,VetorEnumerado['R']]);

      // Acerta Operações
      if (RegCotacoes.ContraParte   = '') or (RegCotacoes.ContraParte   = 'NA') then
          RegCotacoes.ContraParte  := '';

      if (RegCotacoes.Codigo        = '')  or (RegCotacoes.Codigo  = 'NA') then
          RegCotacoes.Codigo       := '';

      if (RegCotacoes.DataCompra    = '')  or (RegCotacoes.DataCompra   = 'NA') then
          RegCotacoes.DataCompra   := '';

      if (RegCotacoes.DataVencto    = '')  or (RegCotacoes.DataVencto   = 'NA') then
          RegCotacoes.DataVencto   := '';

      if (RegCotacoes.Principal     = '')  or (RegCotacoes.Principal    = 'NA') then
          RegCotacoes.Principal    := '0';

      if (RegCotacoes.IndexadorPass = '')  or (RegCotacoes.IndexadorPass = 'NA') then
          RegCotacoes.IndexadorPass:= '';

      if (RegCotacoes.TaxaPassivo    = '')  or (RegCotacoes.TaxaPassivo  = 'NA') then
          RegCotacoes.TaxaPassivo    := '0';

      if (RegCotacoes.FinanceiroPass   = '')  or (RegCotacoes.FinanceiroPass = 'NA') then
          RegCotacoes.FinanceiroPass   := '0';

      if (RegCotacoes.IndexadorAtiv = '')  or (RegCotacoes.IndexadorAtiv = 'NA') then
          RegCotacoes.IndexadorAtiv:= '';

      if (RegCotacoes.TaxaAtivo      = '')  or (RegCotacoes.TaxaAtivo  = 'NA') then
          RegCotacoes.TaxaAtivo    := '0';

      if (RegCotacoes.FinanceiroAtiv   = '')  or (RegCotacoes.FinanceiroAtiv = 'NA') then
          RegCotacoes.FinanceiroAtiv   := '0';

      if (RegCotacoes.TaxaPassPre   = '')  or (RegCotacoes.TaxaPassPre = 'NA') then
          RegCotacoes.TaxaPassPre   := '0';

      if (RegCotacoes.TaxaAtivPre   = '')  or (RegCotacoes.TaxaAtivPre = 'NA') then
          RegCotacoes.TaxaAtivPre   := '0';

      if (RegCotacoes.Emissor = '')  or (RegCotacoes.Emissor = 'NA') then
          RegCotacoes.Emissor := '';

      if (RegCotacoes.StaGarantia = '')  or (RegCotacoes.StaGarantia = 'NA') then
          RegCotacoes.StaGarantia := '';

      if (RegCotacoes.FinanceiroPass <> '0') And (RegCotacoes.FinanceiroAtiv <> '0') then
      begin
         // Caso não exista Tenta Inserir Registro no Arquivo de Cotacoes
         Try

            iFdoSwap := LeUltRegistro(Nil,'FDOSWAP');

            ExecutaQuery(QryImportacao,
              'INSERT INTO FDOSWAP '+
              '(IDFDOSWAP, IDFUNDOINVEST, IDCARTEIRAINVEST, IDPLANPREVCTBPATR, '+
              ' DESCCONTRAPARTE, CODIGO, DATAOPER, DATACOMPRA, DATAVENCIMENTO, '+
              ' VLRPRINCIPAL, INDEXADORPASS, TAXAPASSIVO, VLRFINANCPASS, '+
              ' INDEXADORATIVO, TAXAATIVO, VLRFINANCATIVO, '+
              ' TAXAPASSIVOPRE, TAXAATIVOPRE, EMISSOR, '+
              ' STAGARANTIA) VALUES '+
              '('+IntToStr(iFdoSwap)+', '+
              DbLkCFundoInvest.LookupValue+', '+
              DbLkCCarteiraInvest.LookupValue+', '+
              DbLkcPatroPlano.LookupValue+', '+
              ''''+Trim(TrocaVirgulaPonto(RegCotacoes.ContraParte))+''', '+
              ''''+Trim(TrocaVirgulaPonto(RegCotacoes.Codigo))+''', '+
              'TO_DATE('''+DateEdit1.Text+''','+'''DD/MM/YYYY''), '+
              'TO_DATE('''+Trim(TrocaVirgulaPonto(RegCotacoes.DataCompra))+''','+
              '''DD/MM/YY''), '+
              'TO_DATE('''+Trim(TrocaVirgulaPonto(RegCotacoes.DataVencto))+''','+
              '''DD/MM/YY''), '+
              'NVL('+Trim(TrocaVirgulaPonto(RegCotacoes.Principal))    +',0), '+
              ''''+Trim(TrocaVirgulaPonto(RegCotacoes.IndexadorPass))+''', '+
              'NVL('+Trim(TrocaVirgulaPonto(RegCotacoes.TaxaPassivo))    +',0), '+
              'NVL('+Trim(TrocaVirgulaPonto(RegCotacoes.FinanceiroPass))    +',0), '+
              ''''+Trim(TrocaVirgulaPonto(RegCotacoes.IndexadorAtiv))+''', '+
              'NVL('+Trim(TrocaVirgulaPonto(RegCotacoes.TaxaAtivo))    +',0), '+
              'NVL('+Trim(TrocaVirgulaPonto(RegCotacoes.FinanceiroAtiv))    +',0), '+
              'NVL('+Trim(TrocaVirgulaPonto(RegCotacoes.TaxaPassPre))    +',0), '+
              'NVL('+Trim(TrocaVirgulaPonto(RegCotacoes.TaxaAtivPre))    +',0), '+
              ''''+Trim(TrocaVirgulaPonto(RegCotacoes.Emissor))+''', '+
              ''''+Trim(RegCotacoes.StaGarantia)+''')');
         Except
            ShowMessage('Erro na nova inclusão !');
            DtmBaseDados.dbBaseDados.Rollback;
            QryImportacao.Close;
            Result := False;
            Exit;
         End;
      end;
   End;
   if dtmBaseDados.dbBaseDados.InTransaction then
      dtmBaseDados.dbBaseDados.Commit;
   Result := True;
   QryImportacao.Close;
end;

function TFrmImportaCartFdoInv.IntegracaoFDODespCorret   : Boolean;
Const
  VetorEnumerado  : Array['A'..'Z'] Of Integer = (1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26);
Var
  RegCotacoes     :  Record
                         DesCorretora    : String;
                         TpoCorretora    : String;
                         CnpjCorrt       : String;
                         NumOperacao     : String;
                         VlrTabBovespa   : String;
                         VlrDevBovespa   : String;
                         VlrEfePgBovespa : String;
                         VlrTabBmf       : String;
                         VlrDevBmf       : String;
                         VlrEfePgBmf     : String;
                         VlrTabBolsa     : String;
                         VlrDevBolsa     : String;
                         VlrEfePgBolsa   : String;
                     End;
   I, iFdoDespCorret : Integer;
begin
   if not dtmBaseDados.dbBaseDados.InTransaction then
      dtmBaseDados.dbBaseDados.StartTransaction;

   ExecutaQuery(QryImportacao,'DELETE FROM FDODESPCORRET WHERE '+
     ' IDFUNDOINVEST      = '+DbLkCFundoInvest.LookupValue+' AND '+
     ' IDCARTEIRAINVEST   = '+DbLkCCarteiraInvest.LookupValue+' AND '+
     ' IDPLANPREVCTBPATR  = '+DbLkcPatroPlano.LookupValue+' AND '+
     ' DATAOPER           = '+'TO_DATE('''+DateEdit1.Text+''','+'''DD/MM/YYYY'')');

   for I := 6 to (Sheet.UsedRange.Rows.Count+1) do
   begin
      ProgressBar1.Stepit;
      // Preenche o Registro com  as Cotacoes
      RegCotacoes.DesCorretora    := Trim(Sheet.Cells[I,VetorEnumerado['D']]);
      RegCotacoes.TpoCorretora    := Trim(Sheet.Cells[I,VetorEnumerado['E']]);
      RegCotacoes.CnpjCorrt       := Trim(Sheet.Cells[I,VetorEnumerado['F']]);
      RegCotacoes.NumOperacao     := Trim(Sheet.Cells[I,VetorEnumerado['G']]);
      RegCotacoes.VlrTabBovespa   := Trim(Sheet.Cells[I,VetorEnumerado['H']]);
      RegCotacoes.VlrDevBovespa   := Trim(Sheet.Cells[I,VetorEnumerado['I']]);
      RegCotacoes.VlrEfePgBovespa := Trim(Sheet.Cells[I,VetorEnumerado['J']]);
      RegCotacoes.VlrTabBmf       := Trim(Sheet.Cells[I,VetorEnumerado['K']]);
      RegCotacoes.VlrDevBmf       := Trim(Sheet.Cells[I,VetorEnumerado['L']]);
      RegCotacoes.VlrEfePgBmf     := Trim(Sheet.Cells[I,VetorEnumerado['M']]);
      RegCotacoes.VlrTabBolsa     := Trim(Sheet.Cells[I,VetorEnumerado['N']]);
      RegCotacoes.VlrDevBolsa     := Trim(Sheet.Cells[I,VetorEnumerado['O']]);
      RegCotacoes.VlrEfePgBolsa   := Trim(Sheet.Cells[I,VetorEnumerado['P']]);

      if (RegCotacoes.DesCorretora = '')  or (RegCotacoes.DesCorretora = 'NA') then
          RegCotacoes.DesCorretora:= '';

      if (RegCotacoes.TpoCorretora = '')  or (RegCotacoes.TpoCorretora = 'NA') then
          RegCotacoes.TpoCorretora:= '';

      if (RegCotacoes.CnpjCorrt = '')  or (RegCotacoes.CnpjCorrt = 'NA') then
          RegCotacoes.CnpjCorrt:= '';

      if (RegCotacoes.NumOperacao    = '')  or (RegCotacoes.NumOperacao  = 'NA') then
          RegCotacoes.NumOperacao    := '0';

      if (RegCotacoes.VlrTabBovespa    = '')  or (RegCotacoes.VlrTabBovespa  = 'NA') then
          RegCotacoes.VlrTabBovespa    := '0';

      if (RegCotacoes.VlrDevBovespa    = '')  or (RegCotacoes.VlrDevBovespa  = 'NA') then
          RegCotacoes.VlrDevBovespa    := '0';

      if (RegCotacoes.VlrEfePgBovespa    = '')  or (RegCotacoes.VlrEfePgBovespa  = 'NA') then
          RegCotacoes.VlrEfePgBovespa    := '0';

      if (RegCotacoes.VlrTabBmf    = '')  or (RegCotacoes.VlrTabBmf  = 'NA') then
          RegCotacoes.VlrTabBmf    := '0';

      if (RegCotacoes.VlrDevBmf    = '')  or (RegCotacoes.VlrDevBmf  = 'NA') then
          RegCotacoes.VlrDevBmf    := '0';

      if (RegCotacoes.VlrEfePgBmf    = '')  or (RegCotacoes.VlrEfePgBmf  = 'NA') then
          RegCotacoes.VlrEfePgBmf    := '0';

      if (RegCotacoes.VlrTabBolsa    = '')  or (RegCotacoes.VlrTabBolsa  = 'NA') then
          RegCotacoes.VlrTabBolsa    := '0';

      if (RegCotacoes.VlrDevBolsa    = '')  or (RegCotacoes.VlrDevBolsa  = 'NA') then
          RegCotacoes.VlrDevBolsa    := '0';

      if (RegCotacoes.VlrEfePgBolsa    = '')  or (RegCotacoes.VlrEfePgBolsa  = 'NA') then
          RegCotacoes.VlrEfePgBolsa    := '0';

      if (RegCotacoes.NumOperacao <> '0') then
      begin
         // Caso não exista Tenta Inserir Registro no Arquivo de Cotacoes
         Try

            iFdoDespCorret := LeUltRegistro(Nil,'FDODESPCORRET');

            ExecutaQuery(QryImportacao,
              'INSERT INTO FDODESPCORRET '+
              '(IDFDODESPCORRET, IDFUNDOINVEST, IDCARTEIRAINVEST, IDPLANPREVCTBPATR, '+
              ' DESCCORRETORA, TIPOCORRETORA, CNPJCORRETORA, NUMOPERACAO, DATAOPER,'+
              ' VLRTABBOVESPA, VLRDEVBOVESPA, VLREFEPGBOVESPA,'+
              ' VLRTABBMF, VLRDEVBMF, VLREFEPGBMF,'+
              ' VLRTABBOLSA, VLRDEVBOLSA, VLREFEPGBOLSA) VALUES '+
              '('+IntToStr(iFdoDespCorret)+', '+
              DbLkCFundoInvest.LookupValue+', '+
              DbLkCCarteiraInvest.LookupValue+', '+
              DbLkcPatroPlano.LookupValue+', '+
              ''''+Trim(TrocaVirgulaPonto(RegCotacoes.DesCorretora))+''', '+
              ''''+Trim(TrocaVirgulaPonto(RegCotacoes.TpoCorretora))+''', '+
              ''''+Trim(TrocaVirgulaPonto(RegCotacoes.CnpjCorrt))+''', '+
              'NVL('+Trim(TrocaVirgulaPonto(RegCotacoes.NumOperacao))    +',0), '+
              'TO_DATE('''+DateEdit1.Text+''','+'''DD/MM/YYYY''), '+
              'NVL('+Trim(TrocaVirgulaPonto(RegCotacoes.VlrTabBovespa))    +',0), '+
              'NVL('+Trim(TrocaVirgulaPonto(RegCotacoes.VlrDevBovespa))    +',0), '+
              'NVL('+Trim(TrocaVirgulaPonto(RegCotacoes.VlrEfePgBovespa))    +',0), '+
              'NVL('+Trim(TrocaVirgulaPonto(RegCotacoes.VlrTabBmf))    +',0), '+
              'NVL('+Trim(TrocaVirgulaPonto(RegCotacoes.VlrDevBmf))    +',0), '+
              'NVL('+Trim(TrocaVirgulaPonto(RegCotacoes.VlrEfePgBmf))    +',0), '+
              'NVL('+Trim(TrocaVirgulaPonto(RegCotacoes.VlrTabBolsa))    +',0), '+
              'NVL('+Trim(TrocaVirgulaPonto(RegCotacoes.VlrDevBolsa))    +',0), '+
              'NVL('+Trim(TrocaVirgulaPonto(RegCotacoes.VlrEfePgBolsa))    +',0))');
         Except
            ShowMessage('Erro na nova inclusão !');
            DtmBaseDados.dbBaseDados.Rollback;
            QryImportacao.Close;
            Result := False;
            Exit;
         End;
      end;
   End;
   if dtmBaseDados.dbBaseDados.InTransaction then
      dtmBaseDados.dbBaseDados.Commit;
   Result := True;
   QryImportacao.Close;
end;

function TFrmImportaCartFdoInv.IntegracaoFDOOutrasContas : Boolean;
Const
  VetorEnumerado  : Array['A'..'Z'] Of Integer = (1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26);
Var
  RegCotacoes     :  Record
                         DescContas    : String;
                         VlrContas     : String;
                     End;
   I, iFdoOutrasContas  : Integer;
begin
   if not dtmBaseDados.dbBaseDados.InTransaction then
      dtmBaseDados.dbBaseDados.StartTransaction;

   ExecutaQuery(QryImportacao,'DELETE FROM FDOOUTRASCONTAS WHERE '+
     ' IDFUNDOINVEST      = '+DbLkCFundoInvest.LookupValue+' AND '+
     ' IDCARTEIRAINVEST   = '+DbLkCCarteiraInvest.LookupValue+' AND '+
     ' IDPLANPREVCTBPATR  = '+DbLkcPatroPlano.LookupValue+' AND '+
     ' DATAOPER           = '+'TO_DATE('''+DateEdit1.Text+''','+'''DD/MM/YYYY'')');

   for I := 3 to (Sheet.UsedRange.Rows.Count+1) do
   begin
      ProgressBar1.Stepit;
      // Preenche o Registro com  as Cotacoes
      RegCotacoes.DescContas := Trim(Sheet.Cells[I,VetorEnumerado['B']]);
      RegCotacoes.VlrContas  := Trim(Sheet.Cells[I,VetorEnumerado['D']]);

      if (RegCotacoes.DescContas = '')  or (RegCotacoes.DescContas = 'NA') then
          RegCotacoes.DescContas:= '';

      if (RegCotacoes.VlrContas    = '')  or (RegCotacoes.VlrContas  = 'NA') then
          RegCotacoes.VlrContas    := '0';

      if (RegCotacoes.DescContas <> '') then
      begin
         // Caso não exista Tenta Inserir Registro no Arquivo de Cotacoes
         Try

            iFdoOutrasContas := LeUltRegistro(Nil,'FDOOUTRASCONTAS');

            ExecutaQuery(QryImportacao,
              'INSERT INTO FDOOUTRASCONTAS '+
              '(IDFDOOUTRASCONTAS, IDFUNDOINVEST, IDCARTEIRAINVEST, IDPLANPREVCTBPATR,'+
              ' DATAOPER, DESCOUTRASCONTAS, VLRCONTAS) VALUES '+
              '('+IntToStr(iFdoOutrasContas)+', '+
              DbLkCFundoInvest.LookupValue+', '+
              DbLkCCarteiraInvest.LookupValue+', '+
              DbLkcPatroPlano.LookupValue+', '+
              'TO_DATE('''+DateEdit1.Text+''','+'''DD/MM/YYYY''), '+
              ''''+Trim(TrocaVirgulaPonto(RegCotacoes.DescContas))+''', '+
              'NVL('+Trim(TrocaVirgulaPonto(RegCotacoes.VlrContas))    +',0))');
         Except
            ShowMessage('Erro na nova inclusão !');
            DtmBaseDados.dbBaseDados.Rollback;
            QryImportacao.Close;
            Result := False;
            Exit;
         End;
      end;
   End;
   if dtmBaseDados.dbBaseDados.InTransaction then
      dtmBaseDados.dbBaseDados.Commit;
   Result := True;
   QryImportacao.Close;
end;

procedure TFrmImportaCartFdoInv.bbtnConfirmarClick(Sender: TObject);
Var
  J          : Integer;
  wDecimal   : Char;
begin
   wDecimal         := DecimalSeparator;
   DecimalSeparator := '.';
   // Critica Dados
   if (DateEdit1.Text  = '')       or (DbLkcBolsa.Text  = '') or (edtArquivo.Text = '') or
      (DbLkCFundoInvest.Text = '') or (DbLkCCarteiraInvest.Text  = '') or
      (DbLkcPatroPlano.Text  = '') then
   begin
      ShowMessage('Faltam Preencher Campos ...');
      Exit;
   end;

   // Testa se Arquivo Especificado Existe
   if not (FileExists(edtArquivo.Text)) then
   begin
      ShowMessage('Arquivo não Existe ou Inválido ...');
      Exit;
   end;

   //------------------------------------------------------------------------------
   // Tenta Abrir o Arquivo e Importar
   // conseguindo ou não Fecha o Arquivo
   try
      // Conecta com o Excel
      ExcelApp:=IDispatch(ExcelApp);
      ExcelApp:=CreateOleObject('Excel.Application');
      ExcelApp.Visible:=False;

      // Abre o arquivo
      ExcelApp.Workbooks.Open(EdtArquivo.Text,3);

      for J := 0 to 6 do
      begin
         // Inicia Processamento
         Sheet := ExcelApp.Workbooks[1].WorkSheets[UpperCase(RdgCarteiraAtivos.Items[J])];

         RdgCarteiraAtivos.ItemIndex := J;
         RdgCarteiraAtivos.Repaint;

         // Pausa para Abrir a Planilha a Importacao
         Application.ProcessMessages;

         ProgressBar1.Min  := 0;
         ProgressBar1.Max  := Sheet.UsedRange.Rows.Count;
         ProgressBar1.Step := 1;

         If J = 0 Then      // Operações Compromissadas
         Begin
            If Not IntegracaoFDOOperCompr Then
               Abort;
         End
         Else If J = 1 Then // Títulos Privados
         Begin
            If Not IntegracaoFDOTitPrivados Then
               Abort;
         End
         Else If J = 2 Then // Títulos Públicos
         Begin
            If Not IntegracaoFDOTitPublicos Then
               Abort;
         End
         Else If J = 3 Then // Bolsas (BM&F- BOVESPA)
         Begin
            If Not IntegracaoFDOCartAcoes Then
               Abort;
         End
         Else If J = 4 Then // Swap
         Begin
            If Not IntegracaoFDOSwap Then
               Abort;
         End
         Else If J = 5 Then // Despesas com Corretagem
         Begin
            If Not IntegracaoFDODespCorret Then
               Abort;
         End
         Else If J = 6 Then // Outras Contas
         Begin
            If Not IntegracaoFDOOutrasContas Then
               Abort;
         End;
         ProgressBar1.Min  := 0;
         ProgressBar1.Max  := 0;
         ProgressBar1.Step := 0;
         ProgressBar1.Stepit;
      End;

      ProgressBar1.Min  := 0;
      ProgressBar1.Max  := 0;
      ProgressBar1.Step := 0;
      ProgressBar1.Stepit;

      DecimalSeparator :=  wDecimal;

      inherited;
   finally
      DecimalSeparator :=  wDecimal;
      ExcelApp.Workbooks[1].Close(False);
      ExcelApp.Quit;
   end;

   MsgDlg('Importação manual terminada !','Mensagem do Sistema',MtInformation,[MbOk],0)

end;

procedure TFrmImportaCartFdoInv.FormShow(Sender: TObject);
begin
  inherited;
  QryBolsaValores.Open;
  qryCarteiraInvest.Open;
  QryPatroPlanPrevContab.Open;
  QryFundoInvestOperacao.Open;
  DateEdit1.Date   := Date;
  DbLkcBolsa.Text  := 'BOVESPA';
  QryBolsaValores.Locate('SGLBOLSAVALORES',DbLkcBolsa.Text,[loPartialKey]);
  //edtArquivo.Text  := 'C:\';
  //Jéssica Lana SOL 109421 KINTANA 496332
  edtArquivo.Text := Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa);


end;

procedure TFrmImportaCartFdoInv.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  QryAux.Close;
  QryImportacao.Close;
  QryBolsaValores.Close;
  QryFundoInvestOperacao.Close;
end;

procedure TFrmImportaCartFdoInv.FormCreate(Sender: TObject);
begin
  inherited;
  OpenDialog1.InitialDir := Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa);
  //Jéssica Lana SOL 109421 KINTANA 496332
end;

end.
