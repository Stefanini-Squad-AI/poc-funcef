unit FCadContaEmLote;

// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    : Felipe Azevedo dos Santos
// Data        : 29/10/2013
// Pendência   : SOL 200445 KTN 1943221
// Alteração   : criação da funcionalidade.
// *****************************************************************************

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, TB97Ctls, ComCtrls, Grids, Wwdbigrd, Wwdbgrid,
  DBTables, Db, Wwquery, ComObj, uMensErro, UFuncoesUteis, uSistema,
  uValidaDoc, FProgresso;

type
  TOperacao = (opImportar, opProcessar);
  TAlinhamento = (xlNone, xlLeft, xlCenter, xlRight);

  TColsCabecalho = record
    Col : string;
    Valor : string;
  end;

  TColsCabecalhoRelatContasCad = record
    Col : string;
    Valor : string;
    Largura : double;
    HAlign : TAlinhamento;
  end;

  TRegistros = record
    Col : string;
    QtdCaracteres : integer;
  end;

  TfrmCadContaEmLote = class(TfrmOkCancelar)
    Dock972: TDock97;
    TB97ImportarArquivo: TToolbar97;
    sbtnImportar: TToolbarButton97;
    sbtnProcurar: TToolbarButton97;
    pgctrlCadContas: TPageControl;
    tbsContasCad: TTabSheet;
    tbsContasNaoCad: TTabSheet;
    edtPath: TEdit;
    dbgrdContasEmLote: TwwDBGrid;
    dbgrdContasNaoCad: TwwDBGrid;
    qryArqContasSal: TwwQuery;
    updArqContasSal: TUpdateSQL;
    dsContasEmLote: TDataSource;
    updContasEmLote: TUpdateSQL;
    openDlg: TOpenDialog;
    qryContasEmLote: TwwQuery;
    qryContasNaoCad: TwwQuery;
    dsContasNaoCad: TDataSource;
    updContasNaoCad: TUpdateSQL;
    qryContasEmLoteMATRICULA: TStringField;
    qryContasEmLoteNOME: TStringField;
    qryContasEmLoteNUMDOCUMENTO: TStringField;
    qryContasEmLoteNUMBANCO: TStringField;
    qryContasEmLoteNUMAGENCIA: TStringField;
    qryContasEmLoteCONTACORRENTE: TStringField;
    qryContasEmLoteMOVIMENTACAO: TStringField;
    qryContasEmLoteNUMBANCO2: TStringField;
    qryContasEmLoteNUMAGENCIA2: TStringField;
    qryContasEmLoteCONTACORRENTE2: TStringField;
    qryContasEmLoteDV: TFloatField;
    tb97GerarRelat: TToolbar97;
    sbtnGerarRelat: TToolbarButton97;
    qryValResp: TwwQuery;
    qryContasEmLoteTIPOCONTA: TStringField;
    qryContasEmLoteTIPOCONTA2: TStringField;
    qryValContaPref: TwwQuery;
    qryValBancoVin: TwwQuery;
    qryValAgenciaVin: TwwQuery;
    qryArqContasSalIDTITULAR: TFloatField;
    qryArqContasSalIDPESSOA: TFloatField;
    qryArqContasSalAGENCIA: TStringField;
    qryArqContasSalOPERACAO: TStringField;
    qryArqContasSalCONTA: TStringField;
    qryArqContasSalDATAABERTURA: TDateTimeField;
    qryArqContasSalMATRICULA: TStringField;
    qryArqContasSalNOME: TStringField;
    qryArqContasSalCPF: TStringField;
    qryArqContasSalBANCOPREFERENCIAL: TStringField;
    qryArqContasSalAGENCIAPREFERENCIAL: TStringField;
    qryArqContasSalCONTAPREFERENCIAL: TStringField;
    qryArqContasSalDVPREFERENCIAL: TFloatField;
    qryArqContasSalFLGMOVIMENTACAO: TFloatField;
    qryArqContasSalTIPOMOVIMENTACAO: TFloatField;
    qryArqContasSalMOTIVO: TStringField;
    qryArqContasSalTRGUSERINCLUSAO: TStringField;
    qryArqContasSalTRGDTINCLUSAO: TDateTimeField;
    qryContasEmLoteDATAABERTURA: TStringField;
    qryValidaReg: TwwQuery;
    qryAux: TwwQuery;
    qryValContaVin: TwwQuery;
    qryContasEmLoteIDPESSOA: TFloatField;
    qryContasEmLoteIDTITULAR: TFloatField;
    qryMovimentacao: TwwQuery;
    qryAtualizaContas: TwwQuery;
    updAtualizaContas: TUpdateSQL;
    qryContasEmLoteIDAGENCIA: TFloatField;
    CMValidaCPF: TCMValidaDoc;
    qryContaProcessada: TwwQuery;
    qryContasNaoCadIDPESSOA: TFloatField;
    qryContasNaoCadIDTITULAR: TFloatField;
    qryContasNaoCadIDAGENCIA: TFloatField;
    qryContasNaoCadMATRICULA: TStringField;
    qryContasNaoCadNOME: TStringField;
    qryContasNaoCadNUMDOCUMENTO: TStringField;
    qryContasNaoCadNUMBANCO: TStringField;
    qryContasNaoCadNUMAGENCIA: TStringField;
    qryContasNaoCadCONTACORRENTE: TStringField;
    qryContasNaoCadTIPOCONTA: TStringField;
    qryContasNaoCadMOTIVORECUSA: TStringField;
    qryContasNaoCadNUMBANCO2: TStringField;
    qryContasNaoCadNUMAGENCIA2: TStringField;
    qryContasNaoCadCONTACORRENTE2: TStringField;
    qryContasNaoCadTIPOCONTA2: TStringField;
    qryContasNaoCadDV: TFloatField;
    qryContasNaoCadDATAABERTURA: TStringField;
    qryContasEmLoteCONTAPROCESSADA: TFloatField;
    qryContasEmLoteIDBANCO: TFloatField;
    qryValContaCadastrada: TwwQuery;
    qryValidaRegIDPESSOA: TFloatField;
    qryValidaRegNUMDOCUMENTO: TStringField;
    qryValidaRegFLGCONTASALARIOPROCESSADA: TFloatField;
    qryValidaRegDTCONTASALARIOPROCESSADA: TDateTimeField;
    qryValidaRegFLGSOLICITACONTASALARIO: TFloatField;
    qryValidaRegDTSOLICITACONTASALARIO: TDateTimeField;
    qryValidaRegMATRICULA: TStringField;
    qryValidaRegIDTITULAR: TFloatField;
    procedure sbtnProcurarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure sbtnImportarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure dbgrdContasEmLoteCalcCellColors(Sender: TObject;
      Field: TField; State: TGridDrawState; Highlight: Boolean;
      AFont: TFont; ABrush: TBrush);
    procedure pgctrlCadContasChanging(Sender: TObject;
      var AllowChange: Boolean);
    procedure pgctrlCadContasChange(Sender: TObject);
    procedure sbtnGerarRelatClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
  private
    // objetos
    ArqExcel, ArqExcelExport, SheetOP37, SheetOP37Export : OleVariant;

    // Campos
    FMsgValidacaoArq : string;
    FExcelFilePath : string;
    FMotivoRecusa : string;
    FCPF : string;
    FMatricula : string;
    FAgencia: string;
    FMovimentacao: string;
    FAgenciaVin: string;
    FNome: string;
    FContaSal: string;
    FOperacao: string;
    FOperacaoVin: string;
    FDV: string;
    FBancoVin: string;
    FContaVin: string;
    FContaCorrente : string;
    FMessageInfo: string;
    FBanco: string;
    FContaVinComDV : string;
    FAgenciaVinSemDV : string;

    FDataAbertura: TDateTime;

    FIsExcelFile : boolean;

    FNumTotalRegistros : integer;
    FNumLinIniReg : integer;
    FNumTotalRegistrosExport : integer;
    FNumLinIniRegExport : integer;
    FFlgMovimentacao: integer;
    FTipoMovimentacao: integer;

    FArq: TStringList;

    // variaveis da classe

    iIdPessoa, iIdTitular, iIdAgencia, iIdCBancaria, iIdBanco : integer;

    CPFLiteralChar, sPathArquivoImportado : string;

    bAtualizacao, bProcessou : boolean;

    // vetores
    vColsCabecalho : array of TColsCabecalho;
    vColsCabecalhoRelat : array of TColsCabecalhoRelatContasCad;
    vRegistros : array of TRegistros;

    // funções para atender as regras de negócio

    function ValidarArquivo : boolean;
    function ValidarLayout : boolean;
    function ValidaRegistro(pOperacao : TOperacao) : boolean;
    function GravaArquivoContaSalario(ContaProcessada : boolean) : boolean;
    function UpdateContaBancaria : boolean;
    function InsertContaBancaria : boolean;
    function ImportarArquivoExcel : boolean;
    function GetCPFResp : string;
    function GetIdAgencia : integer;
    function GetIdBanco : integer;
    function AlinharCelula(Alinhamento : TAlinhamento) : integer;

    procedure PreencheArrayCabecalhoArqImportacao;
    procedure PreencheArrayCabecalhoArqExportacao;
    procedure PreencheArrayRegistros;
    procedure InserirRegistrosExcelNaGrid;
    procedure GerarRelatContasNaoCad;
    procedure GerarRelatContasCad;
    procedure ProcessaContasSalario;
    procedure MarcarComoContaProcessada;
    procedure InserirRegNaGridContasCad;
    procedure InserirRegNaGridContasNaoCad;
    procedure LimparTela;

    // funções das propriedades
    function GetIsExcelFile: boolean;
    function GetExcelFilePath: string;
    function GetNumTotalRegistros: integer;
    function GetNumLinIniReg: integer;
    function GetCPF: string;
    function GetAgencia: string;
    function GetAgenciaVin: string;
    function GetBancoVin: string;
    function GetContaSal: string;
    function GetContaVin: string;
    function GetDV: string;
    function GetOperacao: string;
    function GetOperacaoVin: string;
    function GetContaCorrente: string;
    function GetDataAbertura: TDateTime;

    function GetFlgMovimentacao: integer;
    function GetNumLinIniRegExport: integer;
    function GetNumTotalRegistrosExport: integer;
    function GetContaVinComDV: string;
    function GetTipoMovimentacao: integer;
    function GetAgenciaVinSemDV: string;

  public
    property MsgValidacaoArq : string read FMsgValidacaoArq write FMsgValidacaoArq;
    property MessageInfo : string read FMessageInfo write FMessageInfo;
    property ExcelFilePath : string read GetExcelFilePath;
    property ContaCorrente : string read GetContaCorrente;
    property ContaVinComDV : string read GetContaVinComDV;

    property IsExcelFile : boolean read GetIsExcelFile;

    property NumTotalRegistros : integer read GetNumTotalRegistros;
    property NumLinIniReg : integer read GetNumLinIniReg;
    property NumTotalRegistrosExport : integer read GetNumTotalRegistrosExport;
    property NumLinIniRegExport : integer read GetNumLinIniRegExport;

    property Arq : TStringList read FArq write FArq;

    // propriedades da grid e do arquivo
    property MotivoRecusa : string read FMotivoRecusa write FMotivoRecusa;
    property Matricula : string read FMatricula write FMatricula;
    property Nome : string read FNome write FNome;
    property Operacao : string read GetOperacao write FOperacao;
    property ContaSal : string read GetContaSal write FContaSal;
    property CPF : string read GetCPF write FCPF;
    property Banco : string read FBanco write FBanco;
    property Agencia : string read GetAgencia write FAgencia;
    property Movimentacao : string read FMovimentacao write FMovimentacao;
    property ContaVin : string read GetContaVin write FContaVin;
    property AgenciaVin : string read GetAgenciaVin write FAgenciaVin;
    property BancoVin : string read GetBancoVin write FBancoVin;
    property OperacaoVin : string read GetOperacaoVin write FOperacaoVin;
    property DV : string read GetDV write FDV;
    property DataAbertura : TDateTime read GetDataAbertura write FDataAbertura;
    property FlgMovimentacao : integer read GetFlgMovimentacao write FFlgMovimentacao;
    property TipoMovimentacao : integer read GetTipoMovimentacao;
    property AgenciaVinSemDV : string read GetAgenciaVinSemDV;
  end;

var
  frmCadContaEmLote: TfrmCadContaEmLote;

implementation

// *** Constantes de validações e mensagens *** //

const
  MsgProcessar = 'Deseja processar os dados do arquivo selecionado.'; // Msg001
  MsgRelatorio = 'Relatório gerado com sucesso.'; // Msg002
  MsgSelArq = 'É necessário selecionar um arquivo para importação.'; //Msg003
  MsgSelArqExcel = 'É necessário selecionar um arquivo em formato Excel para importação.'; //Msg004
  MsgLayoutArq = 'O arquivo não está com o layout correto.'; // Msg005

  // Msgs de validação do arquivo RN007

  MsgValMatricula = 'Matrícula inconsistente ou não identificada.';
  MsgValCPF = 'CPF inconsistente ou não identificado.';
  MsgValMatCPFPart = 'CPF e matrícula de participantes diferentes.';
  MsgValSolContaSal = 'Solicitação de Conta Salário não efetuada.';
  MsgValContaSalProcessada = 'Conta Salário já processada e/ou cadastrada.';
  MsgValContaSalCad = 'Conta Salário com marcação de processada mas ainda não cadastrada.';
  MsgValContaB_037 = 'Conta Bancária não se inicia com 037.';
  MsgValCaracterContaB = 'Conta Bancária informada não possui 12 caracteres numéricos.';
  MsgValContaVin = 'Divergência na Conta Vinculada.';
  MsgValContaPref = 'Conta Vinculada Diferente da Conta Preferencial.';
  MsgValBatimentoMatCPF = 'Problemas no batimento da Matrícula e CPF';
  MsgValAgencia = 'Agência bancária não cadastrada';


  // validações de caracteres RN004
  NumCaracterAgencia = 5;
  NumCaracterOperacao = 3;
  NumCaracterConta = 10;
  NumCaracterTitulo = 60;
  NumCaracterCPF = 12;
  NumCaracterMatricula = 15;
  NumCaracterDataAbertura = 10;
  NumCaracterBancoVin = 3;
  NumCaracterAgenciaVin = 5;
  NumCaracterContaVin = 11;
  NumCaracterDV = 1;

  // validações de colunas RN004
  ColAgencia = 'A';
  ColOperacao = 'B';
  ColConta = 'C';
  ColDataAbertura = 'D';
  ColMatricula = 'E';
  ColTitular = 'F';
  ColCPF = 'H';
  ColBancoContaVin = 'AO';
  ColAgenciaContaVin = 'AP';
  ColContaVin = 'AQ';
  ColDV = 'AR';

  // valor das colunas do cabeçalho
  ColAgenciaValor = 'Agência';
  ColOperacaoValor = 'Operação';
  ColContaValor = 'Conta';
  ColDataAberturaValor = 'Data Abertura';
  ColMatriculaValor = 'Matrícula';
  ColTitularValor = 'Titular';
  ColCPFValor = 'CPF';
  ColBancoContaVinValor = 'Banco';
  ColAgenciaContaVinValor = 'Agência';
  ColContaVinValor = 'Conta';
  ColDVValor = 'DV';

  //As cinco primeiras linhas do arquivo se referem ao cabeçalho
  NumLinCabecalho = 5;
  NumColsCabecalho = 11;

  //Colunas para Relatório de Contas não cadastradas

  // colunas
  ColRelatMatricula = 'A';
  ColRelatNome = 'B';
  ColRelatCPF = 'C';
  ColRelatBanco = 'D';
  ColRelatAgencia = 'E';
  ColRelatConta = 'F';
  ColRelatOperacao = 'H';
  ColRelatBancoContaVin = 'AO';
  ColRelatAgenciaContaVin = 'AP';
  ColRelatContaVin = 'AQ';
  ColRelatMovimentacao = 'AR';

  // valor das colunas do cabeçalho
  ColRelatMatriculaValor = 'Matrícula';
  ColRelatNomeValor = 'Nome';
  ColRelatCPFValor = 'CPF';
  ColRelatBancoValor = 'Banco';
  ColRelatAgenciaValor = 'Agência';
  ColRelatContaValor = 'Conta Corrente';
  ColRelatOperacaoValor = 'Tipo';
  ColRelatBancoContaVinValor = 'Banco Preferencial';
  ColRelatAgenciaContaVinValor = 'Agência Preferencial';
  ColRelatContaVinValor = 'Conta Preferencial';
  ColRelatMovimentacaoValor = 'Movimentação';

  //As cinco primeiras linhas do arquivo se referem ao cabeçalho
  NumLinRelatCabecalho = 5;
  NumColsRelatCabecalho = 11;

  // largura e altura
  AlturaLinCabecalho = 20.25;

  LarguraColMatricula = 12.29;
  LarguraColNome = 36.29;
  LarguraColCPF = 18.14;
  LarguraColBanco = 5;
  LarguraColAgencia = 8.57;
  LarguraColConta = 15.57;
  LarguraColOperacao = 8;
  LarguraColBancoPref = 15.14;
  LarguraColAgenciaPref = 16.86;
  LarguraColContaPref = 15;
  LarguraColMovimentacao = 11.71;

  // Outros Valores
  CellDataGerRelat = 'B3';
  FontSizeReg = 8;

  // Fim das constantes do relatório de contas não cadastradas

// *** Fim das Constantes de validações e mensagens *** //

{$R *.DFM}

procedure TfrmCadContaEmLote.sbtnProcurarClick(Sender: TObject);
begin
  inherited;
  openDlg.Execute;
  edtPath.Text := openDlg.FileName;
  sbtnProcurar.Down := False;
end;

procedure TfrmCadContaEmLote.FormCreate(Sender: TObject);
begin
  inherited;
  qryContasEmLote.Close;
  qryContasEmLote.Open;

  qryContasNaoCad.Close;
  qryContasNaoCad.Open;

  pgctrlCadContas.ActivePage := tbsContasCad;

  //cria os vetores com as posições das colunas do cabeçalho do arquivo de importação
  SetLength(vColsCabecalho, NumColsCabecalho + 1);
  PreencheArrayCabecalhoArqImportacao;

  SetLength(vColsCabecalhoRelat, NumColsRelatCabecalho + 1);
  PreencheArrayCabecalhoArqExportacao;

  SetLength(vRegistros, NumColsRelatCabecalho + 1);
  PreencheArrayRegistros;

  // cria o arquivo de exportação de contas não cadastradas
  Arq := TStringList.Create;

  // inicia os campos e variaveis
  FMotivoRecusa := '';
  FMovimentacao := '';
  FFlgMovimentacao := 0;
  iIdPessoa := 0;
  iIdTitular := 0;
  iIdAgencia := 0;
  bAtualizacao := False;
end;

function TfrmCadContaEmLote.ImportarArquivoExcel : boolean;
begin
  // importar para o grid
  try
    if not(ValidarArquivo) then
       raise Exception.Create(MsgValidacaoArq);

    try
      InserirRegistrosExcelNaGrid;
    finally
      ArqExcel.Quit;
    end;

    Result := True;
  except
    on e : exception do
    begin
      Result := False;
      MsgDlg(e.Message, 'Aviso', mtInformation, [mbOk], 0);
    end;
  end;
end;

function TfrmCadContaEmLote.ValidarArquivo: boolean;
begin
    Result := False;

    if (ExcelFilePath = '') then
    begin
      MsgValidacaoArq := MsgSelArq;
      Exit;
    end;

    if not(IsExcelFile) then
    begin
      MsgValidacaoArq := MsgSelArqExcel;
      Exit;
    end;

    if not(ValidarLayout) then
    begin
      MsgValidacaoArq := MsgLayoutArq;
      ArqExcel.Quit;
      Exit;
    end;

    Result := True;
end;

function TfrmCadContaEmLote.GetIsExcelFile: boolean;
var
   Extensao : string;
begin
  Extensao := ExtractFileExt(edtPath.Text);
  FIsExcelFile := (Pos('.xls', Extensao) > 0);
  Result := FIsExcelFile;
end;

procedure TfrmCadContaEmLote.sbtnImportarClick(Sender: TObject);
begin
  if ImportarArquivoExcel then
  begin
    sPathArquivoImportado := edtPath.Text; // grava o path para gerar arquivo de exportação
    bAtualizacao := False; // alguma conta foi atualizada? NÃO
    bProcessou := False;
    bbtnConfirmar.Enabled := not(qryContasEmLote.IsEmpty);
    dbgrdContasEmLote.Repaint;
    GravaArquivoContaSalario(False); // grava contas não cadastradas na tabela auxiliar
  end;
end;

function TfrmCadContaEmLote.ValidarLayout: boolean;
var
   LinPos, ColPos : integer;
   CellPos : string;
   bValidacao : boolean;
begin

  //Crio o objeto que gerencia o arquivo excel
  ArqExcel := CreateOleObject('Excel.Application');

  //Abro o arquivo
  ArqExcel.WorkBooks.Open(ExcelFilePath);
  ArqExcel.Visible := False;

  //Pego a primeira planilha do arquivo
  SheetOP37 := ArqExcel.WorkSheets[1];

  // verifica o cabeçalho
  for ColPos := 1 to NumColsCabecalho do
  begin
      CellPos := vColsCabecalho[ColPos].Col + IntToStr(NumLinCabecalho);

      { verifica os valores das celulas do cabeçalho com o
        valor atribuido no array (o valor do array está correto) }
      if (SheetOP37.Range[CellPos].Text <> vColsCabecalho[ColPos].Valor) then
      begin
           bValidacao := False;
           Break;
      end;

      bValidacao := True;
  end;

  if not(bValidacao) then
  begin
       Result := bValidacao;
       Exit;
  end;

  // verifica o layout dos registros

  for LinPos := NumLinIniReg to NumTotalRegistros do
  begin
       for ColPos := 1 to NumColsCabecalho do
       begin
            CellPos := vRegistros[ColPos].Col + IntToStr(LinPos);
            {verifica se os registros estão com a quantidade
             de caracteres devidos}
            if (Length(SheetOP37.Range[CellPos].Value) > vRegistros[ColPos].QtdCaracteres) then
            begin
                 bValidacao := False;
                 Break;
            end;

            bValidacao := True;
       end;

       if not(bValidacao) then Break;
  end;

  Result := bValidacao;
end;

function TfrmCadContaEmLote.GetExcelFilePath: string;
begin
   FExcelFilePath := Trim(edtPath.Text);
   Result := FExcelFilePath;
end;

procedure TfrmCadContaEmLote.PreencheArrayCabecalhoArqImportacao;
var
  Col : integer;
begin

  // preenche o array com a coluna e valor dos cabeçalhos padrão para validação dos mesmos
  for Col := 1 to High(vColsCabecalho) + 1 do
  begin

    case Col of
    1 :
        begin
           vColsCabecalho[Col].Col := ColAgencia;
           vColsCabecalho[Col].Valor := ColAgenciaValor;
        end;
    2 :
        begin
           vColsCabecalho[Col].Col := ColOperacao;
           vColsCabecalho[Col].Valor := ColOperacaoValor;
        end;
    3 :
        begin
           vColsCabecalho[Col].Col := ColConta;
           vColsCabecalho[Col].Valor := ColContaValor;
        end;
    4 :
        begin
           vColsCabecalho[Col].Col := ColDataAbertura;
           vColsCabecalho[Col].Valor := ColDataAberturaValor;
        end;
    5 :
        begin
           vColsCabecalho[Col].Col := ColMatricula;
           vColsCabecalho[Col].Valor := ColMatriculaValor;
        end;
    6 :
        begin
           vColsCabecalho[Col].Col := ColTitular;
           vColsCabecalho[Col].Valor := ColTitularValor;
        end;
    7 :
        begin
           vColsCabecalho[Col].Col := ColCPF;
           vColsCabecalho[Col].Valor := ColCPFValor;
        end;
    8 :
        begin
           vColsCabecalho[Col].Col := ColBancoContaVin;
           vColsCabecalho[Col].Valor := ColBancoContaVinValor;
        end;
    9 :
        begin
           vColsCabecalho[Col].Col := ColAgenciaContaVin;
           vColsCabecalho[Col].Valor := ColAgenciaContaVinValor;
        end;
    10 :
        begin
           vColsCabecalho[Col].Col := ColContaVin;
           vColsCabecalho[Col].Valor := ColContaVinValor;
        end;
    11 :
        begin
           vColsCabecalho[Col].Col := ColDV;
           vColsCabecalho[Col].Valor := ColDVValor;
        end;
    end;
  end;

end;

procedure TfrmCadContaEmLote.PreencheArrayCabecalhoArqExportacao;
var
  Col : integer;
begin

  // preenche o array com a coluna e valor dos cabeçalhos padrão para atribuir ao cabecalho do arquivo de exportação
  for Col := 1 to High(vColsCabecalhoRelat) + 1 do
  begin

    case Col of
    1 :
        begin
           vColsCabecalhoRelat[Col].Col := ColRelatMatricula;
           vColsCabecalhoRelat[Col].Valor := ColRelatMatriculaValor;
           vColsCabecalhoRelat[Col].Largura := LarguraColMatricula;
           vColsCabecalhoRelat[Col].HAlign := xlCenter;
        end;
    2 :
        begin
           vColsCabecalhoRelat[Col].Col := ColRelatNome;
           vColsCabecalhoRelat[Col].Valor := ColRelatNomeValor;
           vColsCabecalhoRelat[Col].Largura := LarguraColNome;
           vColsCabecalhoRelat[Col].HAlign := xlLeft;
        end;
    3 :
        begin
           vColsCabecalhoRelat[Col].Col := ColRelatCPF;
           vColsCabecalhoRelat[Col].Valor := ColRelatCPFValor;
           vColsCabecalhoRelat[Col].Largura := LarguraColCPF;
           vColsCabecalhoRelat[Col].HAlign := xlCenter;
        end;
    4 :
        begin
           vColsCabecalhoRelat[Col].Col := ColRelatBanco;
           vColsCabecalhoRelat[Col].Valor := ColRelatBancoValor;
           vColsCabecalhoRelat[Col].Largura := LarguraColBanco;
           vColsCabecalhoRelat[Col].HAlign := xlCenter;
        end;
    5 :
        begin
           vColsCabecalhoRelat[Col].Col := ColRelatAgencia;
           vColsCabecalhoRelat[Col].Valor := ColRelatAgenciaValor;
           vColsCabecalhoRelat[Col].Largura := LarguraColAgencia;
           vColsCabecalhoRelat[Col].HAlign := xlCenter;
        end;
    6 :
        begin
           vColsCabecalhoRelat[Col].Col := ColRelatConta;
           vColsCabecalhoRelat[Col].Valor := ColRelatContaValor;
           vColsCabecalhoRelat[Col].Largura := LarguraColConta;
           vColsCabecalhoRelat[Col].HAlign := xlCenter;
        end;
    7 :
        begin
           vColsCabecalhoRelat[Col].Col := ColRelatOperacao;
           vColsCabecalhoRelat[Col].Valor := ColRelatOperacaoValor;
           vColsCabecalhoRelat[Col].Largura := LarguraColOperacao;
           vColsCabecalhoRelat[Col].HAlign := xlCenter;
        end;
    8 :
        begin
           vColsCabecalhoRelat[Col].Col := ColRelatBancoContaVin;
           vColsCabecalhoRelat[Col].Valor := ColRelatBancoContaVinValor;
           vColsCabecalhoRelat[Col].Largura := LarguraColBancoPref;
           vColsCabecalhoRelat[Col].HAlign := xlCenter;
        end;
    9 :
        begin
           vColsCabecalhoRelat[Col].Col := ColRelatAgenciaContaVin;
           vColsCabecalhoRelat[Col].Valor := ColRelatAgenciaContaVinValor;
           vColsCabecalhoRelat[Col].Largura := LarguraColAgenciaPref;
           vColsCabecalhoRelat[Col].HAlign := xlCenter;
        end;
    10 :
        begin
           vColsCabecalhoRelat[Col].Col := ColRelatContaVin;
           vColsCabecalhoRelat[Col].Valor := ColRelatContaVinValor;
           vColsCabecalhoRelat[Col].Largura := LarguraColContaPref;
           vColsCabecalhoRelat[Col].HAlign := xlCenter;
        end;
    11 :
        begin
           vColsCabecalhoRelat[Col].Col := ColRelatMovimentacao;
           vColsCabecalhoRelat[Col].Valor := ColRelatMovimentacaoValor;
           vColsCabecalhoRelat[Col].Largura := LarguraColMovimentacao;
           vColsCabecalhoRelat[Col].HAlign := xlCenter;
        end;
    end;
  end;
end;

procedure TfrmCadContaEmLote.PreencheArrayRegistros;
var
   Col : integer;
begin
   // preenche o array para validar os registros do arquivo
   for Col := 1 to High(vRegistros) + 1 do
   begin
     case Col of
     1 :
        begin
           vRegistros[Col].Col := ColAgencia;
           vRegistros[Col].QtdCaracteres := NumCaracterAgencia;
        end;
     2 :
        begin
           vRegistros[Col].Col := ColOperacao;
           vRegistros[Col].QtdCaracteres := NumCaracterOperacao;
        end;
     3 :
        begin
           vRegistros[Col].Col := ColConta;
           vRegistros[Col].QtdCaracteres := NumCaracterConta;
        end;
     4 :
        begin
           vRegistros[Col].Col := ColDataAbertura;
           vRegistros[Col].QtdCaracteres := NumCaracterDataAbertura;
        end;
     5 :
        begin
           vRegistros[Col].Col := ColMatricula;
           vRegistros[Col].QtdCaracteres := NumCaracterMatricula;
        end;
     6 :
        begin
           vRegistros[Col].Col := ColTitular;
           vRegistros[Col].QtdCaracteres := NumCaracterTitulo;
        end;
     7 :
        begin
           vRegistros[Col].Col := ColCPF;
           vRegistros[Col].QtdCaracteres := NumCaracterCPF;
        end;
     8 :
        begin
           vRegistros[Col].Col := ColBancoContaVin;
           vRegistros[Col].QtdCaracteres := NumCaracterBancoVin;
        end;
     9 :
        begin
           vRegistros[Col].Col := ColAgenciaContaVin;
           vRegistros[Col].QtdCaracteres := NumCaracterAgenciaVin;
        end;
     10 :
        begin
           vRegistros[Col].Col := ColContaVin;
           vRegistros[Col].QtdCaracteres := NumCaracterContaVin;
        end;
     11 :
        begin
           vRegistros[Col].Col := ColDV;
           vRegistros[Col].QtdCaracteres := NumCaracterDV;
        end;
     end;
   end;
end;

function TfrmCadContaEmLote.GetNumTotalRegistros: integer;
var
   QtdReg : integer;
begin
   QtdReg := NumLinIniReg;

   // pega até a ultima linha dos registros
   while Trim(SheetOP37.Cells[QtdReg, 1].Text) <> '' do
      QtdReg := QtdReg + 1;

   QtdReg := QtdReg - 1;
   FNumTotalRegistros := QtdReg;
   Result := FNumTotalRegistros;
end;

function TfrmCadContaEmLote.GetNumTotalRegistrosExport: integer;
var
   QtdReg : integer;
begin
   QtdReg := NumLinIniRegExport;

   // pega até a ultima linha dos registros
   while Trim(SheetOP37Export.Cells[QtdReg, 1].Text) <> '' do
      QtdReg := QtdReg + 1;

   QtdReg := QtdReg - 1;
   FNumTotalRegistrosExport := QtdReg;
   Result := FNumTotalRegistrosExport;
end;

procedure TfrmCadContaEmLote.InserirRegistrosExcelNaGrid;
var
   LinReg, iContador, iMax : integer;
   LinRegAux : string;
begin

   qryContasEmLote.DisableControls;
   qryContasNaoCad.DisableControls;

   qryContasEmLote.First;
   while not(qryContasEmLote.Eof) do qryContasEmLote.Delete;

   qryContasNaoCad.First;
   while not(qryContasNaoCad.Eof) do qryContasNaoCad.Delete;

   iContador := 0;
   iMax := NumTotalRegistros - NumLinCabecalho; // (numero total de registros - numéro da linha do cabeçalho)

   // chamando a barra de progresso
   frmProgresso.MostraFormProgresso('', True, True, True, iContador, iMax);

   // varre as linhas dos registros do arquivo inserindo as mesmas no grid de contas bancárias em lote
   for LinReg := NumLinIniReg to NumTotalRegistros do
   begin
      Inc(iContador);

      if not(frmProgresso.Cancelou) then
      begin
        // atribuindo valores
        LinRegAux := IntToStr(LinReg);
        CPF := SheetOP37.Range[ColCPF + LinRegAux].Text;
        CPFLiteralChar := SheetOP37.Range[ColCPF + LinRegAux].Text;
        Matricula := SheetOP37.Range[ColMatricula + LinRegAux].Text;
        Nome := SheetOP37.Range[ColTitular + LinRegAux].Text;
        Agencia := Copy(SheetOP37.Range[ColAgencia + LinRegAux].Text, 1, 4);
        ContaSal := SheetOP37.Range[ColConta + LinRegAux].Text;
        Operacao := SheetOP37.Range[ColOperacao + LinRegAux].Text;
        Movimentacao := '';
        MotivoRecusa := '';
        Banco := '104';
        BancoVin := SheetOP37.Range[ColBancoContaVin + LinRegAux].Text;
        AgenciaVin := Copy(SheetOP37.Range[ColAgenciaContaVin + LinRegAux].Text,1 ,4);
        ContaVin := SheetOP37.Range[ColContaVin + LinRegAux].Text;
        OperacaoVin := '001';
        DV := SheetOP37.Range[ColDV + LinRegAux].Text;
        DataAbertura := StrToDate(SheetOP37.Range[ColDataAbertura + linRegAux].Text);

        if (ValidaRegistro(opImportar)) then
           InserirRegNaGridContasCad
        else
           InserirRegNaGridContasNaoCad;

        frmProgresso.AndaFormProgresso(iContador);
      end
      else
        frmProgresso.EscondeFormProgresso;

   end; // for

   qryContasEmLote.EnableControls;
   qryContasNaoCad.EnableControls;

   frmProgresso.EscondeFormProgresso;
end;

function TfrmCadContaEmLote.ValidaRegistro(pOperacao : TOperacao): boolean;
begin
   // validação do registro na importação ou processamento dos dados RN007
   try
     Result := False;

     qryValidaReg.Close;
     qryValidaReg.ParamByName('CPF').AsString := CPF;
     qryValidaReg.Open;

     qryValidaReg.Filtered := False;
     qryValidaReg.Filter := 'MATRICULA = ' + Matricula;
     qryValidaReg.Filtered := True;

     iIdPessoa := qryValidaRegIDPESSOA.AsInteger;
     iIdTitular := qryValidaRegIDTITULAR.AsInteger;
     iIdAgencia := GetIdAgencia;

     if (pOperacao = OpImportar) then
     begin
        // valida o CPF
       CMValidaCPF.NumDocumento := CPF;

       if (qryValidaReg.FieldByName('NUMDOCUMENTO').AsString = '') or
          not(CMValidaCPF.DocumentoValido) then
       begin
            MotivoRecusa := 'CPF ' + CPFLiteralChar + ' inválido ou não identificado';
            Exit;
       end;

       // Verificando matricula

       if Trim(qryValidaReg.FieldByName('Matricula').AsString) = '' then
       begin
            MotivoRecusa := 'Matrícula ' + Matricula + ' inválida ou não identificada';
            Exit;
       end;

       // Verificando se a matricula que está no arquivo e diferente da Matricula que está no banco
       if (qryValidaReg.FieldByName('Matricula').AsString <> Matricula) then
       begin
          MotivoRecusa := MsgValMatCPFPart;
          Exit;
       end;

       // verificando solicitação de conta salário
       if (qryValidaReg.FieldByName('FLGSOLICITACONTASALARIO').AsInteger = 0) then
       begin
          MotivoRecusa := MsgValSolContaSal;
          Exit;
       end;

       // verificando se conta salário ja foi processada e/ou cadastrada

       qryValContaCadastrada.Close;
       qryValContaCadastrada.ParamByName('IDPESSOA').AsInteger := iIdPessoa;
       qryValContaCadastrada.Open;

       if (qryValidaReg.FieldByName('FLGCONTASALARIOPROCESSADA').AsInteger = 1) and
          (qryValContaCadastrada.FieldByName('CONTACORRENTE').AsString <> ContaCorrente) then
       begin
          MotivoRecusa := MsgValContaSalCad; // processada e não cadastrada
          Exit;
       end;

       if (qryValidaReg.FieldByName('FLGCONTASALARIOPROCESSADA').AsInteger = 1) or
          (qryValContaCadastrada.FieldByName('CONTACORRENTE').AsString = ContaCorrente) then
       begin
          MotivoRecusa := MsgValContaSalProcessada; // processada e/ou cadastrada
          Exit;
       end;

       // verifica se conta bancária se inicia com 037
       if (Operacao <> '037') then
       begin
          MotivoRecusa := MsgValContaB_037;
          Exit;
       end;

       // verifica se conta bancária tem 12 digitos
       if (Length(ContaCorrente) <> 12) then
       begin
         MotivoRecusa := MsgValCaracterContaB;
         Exit;
       end;

       qryValResp.Close;
       qryValResp.ParamByName('IDPESSOA').AsInteger := iIdPessoa;
       qryValResp.Open;

       // verifica se o recebedor do benefício com situação normal é o responsavel
       if (qryValResp.FieldByName('IDPESSOA').AsInteger <>
           qryValResp.FieldByName('IDRESPONSAVEL').AsInteger) then
       begin
           CPF := GetCPFResp;
       end;

       if iIdAgencia = 0 then
       begin
            MotivoRecusa := MsgValAgencia;
            Exit;
       end;
     end
     else // operacao é processamento
     begin
       // vericando conta vinculada
       qryValAgenciaVin.Close;
       qryValAgenciaVin.ParamByName('IDPESSOA').AsInteger := iIdPessoa;
       qryValAgenciaVin.ParamByName('CONTACORRENTE').AsString := ContaVinComDV;
       qryValAgenciaVin.Open;

       qryValBancoVin.Close;
       qryValBancoVin.ParamByName('IDPESSOA').AsInteger := qryValAgenciaVin.FieldByName('IDBANCO').AsInteger;
       qryValBancoVin.Open;

       qryValContaVin.Close;
       qryValContaVin.ParamByName('IDPESSOA').AsInteger := iIdPessoa;
       qryValContaVin.ParamByName('CONTACORRENTE').AsString := ContaVinComDV;
       qryValContaVin.Open;

       if (qryValBancoVin.FieldByName('NUMBANCO').AsString <> BancoVin) or
          (AgenciaVinSemDV <> AgenciaVin) or
          (qryValContaVin.IsEmpty) then
       begin
          MotivoRecusa := MsgValContaVin;
          Exit;
       end;

       // verificando se conta vinculada está cadastrada como conta preferencial

       qryValContaPref.Close;
       qryValContaPref.ParamByName('IDPESSOA').AsInteger := iIdPessoa;
       qryValContaPref.ParamByName('CONTACORRENTE').AsString := ContaVinComDV;
       qryValContaPref.Open;

       if (qryValContaPref.IsEmpty) then
       begin
          MotivoRecusa := MsgValContaPref;
          Exit;
       end;

     end; // operacao

     Result := True;

  finally
     qryValidaReg.Close;
     qryValContaCadastrada.Close;
     qryValResp.Close;
     qryValBancoVin.Close;
     qryValAgenciaVin.Close;
     qryValContaVin.Close;
     qryValContaPref.Close;
   end;
end;

function TfrmCadContaEmLote.GetCPF: string;
begin
  FCPF := StringReplace(FCPF, '-', '', [rfReplaceAll]);
  FCPF := StringReplace(FCPF, '.', '', [rfReplaceAll]);
  Result := Trim(FCPF);
end;

procedure TfrmCadContaEmLote.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  FreeAndNil(FArq);
end;

function TfrmCadContaEmLote.GetAgencia: string;
begin
  if Trim(FAgencia) = '' then
     FAgencia := '0';

  Result := ColocaZeros(FAgencia, NumCaracterAgencia - 1);
end;

function TfrmCadContaEmLote.GetAgenciaVin: string;
begin
  if Trim(FAgenciaVin) = '' then
     FAgenciaVin := '0';

  Result := ColocaZeros(FAgenciaVin, NumCaracterAgenciaVin - 1);
end;

function TfrmCadContaEmLote.GetBancoVin: string;
begin
  if Trim(FBancoVin) = '' then
     FBancoVin := '0';

  Result := ColocaZeros(FBancoVin, NumCaracterBancoVin);
end;

function TfrmCadContaEmLote.GetContaSal: string;
begin
  FContaSal := StringReplace(FContaSal, '-', '', [rfReplaceAll]);

  if Trim(FContaSal) = '' then
     FContaSal := '0';

  FContaSal := ColocaZeros(FContaSal, NumCaracterConta - 1);
  FContaSal := Copy(FContaSal, 1, 8) + '-' + Copy(FContaSal, 9, 1);
  Result := FContaSal;
end;

function TfrmCadContaEmLote.GetContaVin: string;
begin
  if Trim(FContaVin) = '' then
     FContaVin := '0';

  Result := ColocaZeros(FContaVin, NumCaracterContaVin);
end;

function TfrmCadContaEmLote.GetDV: string;
begin
  if Trim(FDV) = '' then
     FDV := '0';

  Result := ColocaZeros(FDV, NumCaracterDV);
end;

function TfrmCadContaEmLote.GetOperacao: string;
begin
  if Trim(FOperacao) = '' then
     FOperacao := '0';

  Result := ColocaZeros(FOperacao, NumCaracterOperacao);
end;

function TfrmCadContaEmLote.GetOperacaoVin: string;
begin
  if Trim(FOperacaoVin) = '' then
     FOperacaoVin := '0';

  Result := ColocaZeros(FOperacaoVin, NumCaracterOperacao);
end;

function TfrmCadContaEmLote.GetContaCorrente: string;
begin
  FContaCorrente := Operacao + StringReplace(ContaSal, '-', '', [rfReplaceAll]);
  Result := FContaCorrente;
end;

function TfrmCadContaEmLote.GetDataAbertura: TDateTime;
begin
  Result := FDataAbertura;
end;

function TfrmCadContaEmLote.GravaArquivoContaSalario(ContaProcessada : boolean): boolean;
begin
  // gravando os dados em uma tabela auxiliar

  if (ContaProcessada) then
  begin
    qryArqContasSal.Close;
    qryArqContasSal.Open;

    //gravar na tabela auxiliar
    qryArqContasSal.Append;
    qryArqContasSalIDTITULAR.AsInteger := qryContasEmLoteIDTITULAR.AsInteger;
    qryArqContasSalIDPESSOA.AsInteger := qryContasEmLoteIDPESSOA.AsInteger;
    qryArqContasSalAGENCIA.AsString := qryContasEmLoteNUMAGENCIA.AsString;
    qryArqContasSalOPERACAO.AsString := qryContasEmLoteTIPOCONTA.AsString;
    qryArqContasSalCONTA.AsString := qryContasEmLoteCONTACORRENTE.AsString;
    qryArqContasSalDATAABERTURA.AsString := qryContasEmLoteDATAABERTURA.AsString;
    qryArqContasSalMATRICULA.AsString := qryContasEmLoteMATRICULA.AsString;
    qryArqContasSalNOME.AsString := qryContasEmLoteNOME.AsString;
    qryArqContasSalCPF.AsString := qryContasEmLoteNUMDOCUMENTO.AsString;
    qryArqContasSalBANCOPREFERENCIAL.AsString := qryContasEmLoteNUMBANCO2.AsString;
    qryArqContasSalAGENCIAPREFERENCIAL.AsString := qryContasEmLoteNUMAGENCIA2.AsString;
    qryArqContasSalCONTAPREFERENCIAL.AsString := qryContasEmLoteCONTACORRENTE2.AsString;
    qryArqContasSalDVPREFERENCIAL.AsString := qryContasEmLoteDV.AsString;
    qryArqContasSalFLGMOVIMENTACAO.AsInteger := FlgMovimentacao;
    qryArqContasSalTIPOMOVIMENTACAO.AsInteger := TipoMovimentacao;
    qryArqContasSalMOTIVO.AsString := MotivoRecusa;
    qryArqContasSal.ApplyUpdates;
  end
  else
  begin
    qryContasNaoCad.DisableControls;
    qryContasNaoCad.First;

    qryArqContasSal.Close;
    qryArqContasSal.Open;

    //gravar na tabela auxiliar
    while not(qryContasNaoCad.Eof) do
    begin
       qryArqContasSal.Append;
       qryArqContasSalIDTITULAR.AsInteger := qryContasNaoCadIDTITULAR.AsInteger;
       qryArqContasSalIDPESSOA.AsInteger := qryContasNaoCadIDPESSOA.AsInteger;
       qryArqContasSalAGENCIA.AsString := qryContasNaoCadNUMAGENCIA.AsString;
       qryArqContasSalOPERACAO.AsString := qryContasNaoCadTIPOCONTA.AsString;
       qryArqContasSalCONTA.AsString := qryContasNaoCadCONTACORRENTE.AsString;
       qryArqContasSalDATAABERTURA.AsString := qryContasNaoCadDATAABERTURA.AsString;
       qryArqContasSalMATRICULA.AsString := qryContasNaoCadMATRICULA.AsString;
       qryArqContasSalNOME.AsString := qryContasNaoCadNOME.AsString;
       qryArqContasSalCPF.AsString := qryContasNaoCadNUMDOCUMENTO.AsString;
       qryArqContasSalBANCOPREFERENCIAL.AsString := qryContasNaoCadNUMBANCO2.AsString;
       qryArqContasSalAGENCIAPREFERENCIAL.AsString := qryContasNaoCadNUMAGENCIA2.AsString;
       qryArqContasSalCONTAPREFERENCIAL.AsString := qryContasNaoCadCONTACORRENTE2.AsString;
       qryArqContasSalDVPREFERENCIAL.AsString := qryContasNaoCadDV.AsString;
       qryArqContasSalFLGMOVIMENTACAO.AsInteger := FlgMovimentacao;
       qryArqContasSalTIPOMOVIMENTACAO.AsInteger := TipoMovimentacao;
       qryArqContasSalMOTIVO.AsString := qryContasNaoCadMOTIVORECUSA.AsString;
       qryArqContasSal.ApplyUpdates;

       qryContasNaoCad.Next;
    end;

    qryContasNaoCad.EnableControls;
  end;
end;

procedure TfrmCadContaEmLote.bbtnConfirmarClick(Sender: TObject);
begin
  if MsgDlg(MsgProcessar, 'Confirmação', mtConfirmation, [mbYes, mbNo], 0) = mrYes  then
  begin
    ProcessaContasSalario; // altera ou insere uma conta salário
    bbtnConfirmar.Enabled := False;
  end;

  sbtnGerarRelat.Enabled := (bAtualizacao and not(qryContasEmLote.IsEmpty));
end;

function TfrmCadContaEmLote.GetNumLinIniReg: integer;
begin
   FNumLinIniReg := NumLinCabecalho + 1;
   Result := FNumLinIniReg;
end;

function TfrmCadContaEmLote.GetNumLinIniRegExport: integer;
begin
   FNumLinIniReg := NumLinRelatCabecalho + 1;
   Result := FNumLinIniReg;
end;

function TfrmCadContaEmLote.GetCPFResp: string;
var
   sSQL : string;
begin
  try
   sSQL := 'SELECT TRIM(NUMDOCUMENTO) AS CPF FROM PESSOA WHERE IDPESSOA = :IDPESSOA';

   qryAux.Close;
   qryAux.SQL.Clear;
   qryAux.SQL.Add(sSQL);
   qryAux.ParamByName('IDPESSOA').AsInteger := qryValResp.FieldByName('IDRESPONSAVEL').AsInteger;
   qryAux.Open;

   Result := qryAux.FieldByName('CPF').AsString;
  finally
   qryAux.Close;
  end;
end;

procedure TfrmCadContaEmLote.ProcessaContasSalario;
begin
  try
    bProcessou := True;
    qryContasEmLote.DisableControls;
    qryContasEmLote.First;

    while not(qryContasEmLote.Eof) and (qryContasEmLoteCONTAPROCESSADA.AsInteger = 0) do
    begin
      // atribuindo valores para as propriedades
      Matricula := qryContasEmLoteMATRICULA.AsString;
      CPF := qryContasEmLoteNUMDOCUMENTO.AsString; // para validar conta vinculada
      Operacao := qryContasEmLoteTIPOCONTA.AsString;
      ContaSal := qryContasEmLoteCONTACORRENTE.AsString;
      Agencia := qryContasEmLoteNUMAGENCIA.AsString;
      Banco := qryContasEmLoteNUMBANCO.AsString;
      iIdPessoa := qryContasEmLoteIDPESSOA.AsInteger;
      iIdAgencia := qryContasEmLoteIDAGENCIA.AsInteger;
      iIdBanco := GetIdBanco;
      MotivoRecusa := '';
      BancoVin := qryContasEmLoteNUMBANCO2.AsString; // para verificar e validar conta vinculada
      AgenciaVin := qryContasEmLoteNUMAGENCIA2.AsString; // para verificar e validar conta vinculada
      ContaVin := qryContasEmLoteCONTACORRENTE2.AsString; // para verificar e validar conta vinculada
      DV := qryContasEmLoteDV.AsString; // para verificar e validar conta vinculada

      // verifica se é alteração ou inserção

      qryMovimentacao.Close;
      qryMovimentacao.ParamByName('IDPESSOA').AsInteger := qryContasEmLoteIDPESSOA.AsInteger;
      qryMovimentacao.Open;

      if not(qryMovimentacao.IsEmpty) then
         Movimentacao := 'Alteração' // possui tipoconta = 2(Conta Salário)
      else
         Movimentacao := 'Inclusão';


      // valida conta vinculada e conta preferencial
      if not(ValidaRegistro(opProcessar)) then
      begin
        // atribuindo valores para gravar na grid e na estrutura auxiliar como conta rejeitada
        iIdPessoa := qryContasEmLoteIDPESSOA.AsInteger;
        iIdTitular := qryContasEmLoteIDTITULAR.AsInteger;
        CPF := qryContasEmLoteNUMDOCUMENTO.AsString;
        Matricula := qryContasEmLoteMATRICULA.AsString;
        Nome := qryContasEmLoteNOME.AsString;
        Agencia := qryContasEmLoteNUMAGENCIA.AsString;
        ContaSal := qryContasEmLoteCONTACORRENTE.AsString;
        Operacao := qryContasEmLoteTIPOCONTA.AsString;
        Banco := qryContasEmLoteNUMBANCO.AsString;
        BancoVin := qryContasEmLoteNUMBANCO2.AsString;
        AgenciaVin := qryContasEmLoteNUMAGENCIA2.AsString;
        ContaVin := qryContasEmLoteCONTACORRENTE2.AsString;
        OperacaoVin := qryContasEmLoteTIPOCONTA2.AsString;
        DV := qryContasEmLoteDV.AsString;
        DataAbertura := qryContasEmLoteDATAABERTURA.AsDateTime;
        Movimentacao := 'Rejeitada';

        // inseri o registro na grid de contas rejeitadas
        InserirRegNaGridContasNaoCad;

        FlgMovimentacao := 0; // conta salário foi rejeitada
        GravaArquivoContaSalario(True); // Guarda na estrutura auxiliar a conta rejeitada

        // deleta o registro da grid de contas para processar
        qryContasEmLote.Delete;

        Continue; // pula o código abaixo
      end;

      try

        if Movimentacao = 'Inclusão' then
        begin
        
          bAtualizacao := InsertContaBancaria; // inserindo conta salário
          if not(bAtualizacao) then
             raise Exception.Create(MessageInfo)
          else
             MarcarComoContaProcessada;

        end
        else
        begin
          iIdCBancaria := qryMovimentacao.FieldByName('IDCBANCARIA').AsInteger;

          bAtualizacao := UpdateContaBancaria;
          if not(bAtualizacao) then
             raise Exception.Create(MessageInfo)
          else
              MarcarComoContaProcessada;

        end;

        qryContasEmLote.Edit;
        qryContasEmLoteMOVIMENTACAO.AsString := Movimentacao;
        qryContasEmLoteCONTAPROCESSADA.AsInteger := 1;
        qryContasEmLote.Post;

        FlgMovimentacao := 1; // conta salário sofreu alteração ou inserção
        GravaArquivoContaSalario(True);
      except
        on e : exception do
        begin
          MsgDlg(e.Message, 'Erro', mtError, [mbOk], 0);
        end;
      end;

      qryContasEmLote.Next;
    end; // while

    qryContasEmLote.EnableControls;
  finally
    qryMovimentacao.Close;
  end;
end;



function TfrmCadContaEmLote.InsertContaBancaria: boolean;
var
  sSQL : string;
begin
  try
     sSQL := 'insert into CONTABANCARIA ' +
             '(IDCBANCARIA, CONTACORRENTE, IDPESSOA, IDAGENCIA, ' +
             'FLGCONTAPREF, FLGCONTACONJUNTA, FLGCONTARESGATE, TIPOCONTA) ' +
             ' values ' +
             '(CM.SEQCONTABANCARIA.NEXTVAL, :CONTACORRENTE, :IDPESSOA, :IDAGENCIA, ' +
             ':FLGCONTAPREF, :FLGCONTACONJUNTA, :FLGCONTARESGATE, :TIPOCONTA) ';

     qryAtualizaContas.SQL.Clear;
     qryAtualizaContas.SQL.Add(sSQL);
     qryAtualizaContas.ParamByName('CONTACORRENTE').AsString := ContaCorrente;
     qryAtualizaContas.ParamByName('IDPESSOA').AsInteger := iIdPessoa;
     qryAtualizaContas.ParamByName('IDAGENCIA').AsInteger := iIdAgencia;
     qryAtualizaContas.ParamByName('FLGCONTAPREF').AsInteger := 0;
     qryAtualizaContas.ParamByName('FLGCONTACONJUNTA').AsString := 'N';
     qryAtualizaContas.ParamByName('FLGCONTARESGATE').AsInteger := 0;
     qryAtualizaContas.ParamByName('TIPOCONTA').AsInteger := 2;
     qryAtualizaContas.ExecSQL;

     Result := True;
  except
    on e : exception do
    begin
       Result := False;
       MessageInfo := e.Message;
    end;
  end;
end;

function TfrmCadContaEmLote.UpdateContaBancaria: boolean;
var
  sSQL : string;
begin
  try
     sSQL := 'UPDATE CONTABANCARIA SET ' +
             'CONTACORRENTE = :CONTACORRENTE, ' +
             'IDAGENCIA = :IDAGENCIA ' +
             'WHERE IDCBANCARIA = :IDCBANCARIA';

     qryAtualizaContas.SQL.Clear;
     qryAtualizaContas.SQL.Add(sSQL);
     qryAtualizaContas.ParamByName('CONTACORRENTE').AsString := ContaCorrente;
     qryAtualizaContas.ParamByName('IDCBANCARIA').AsInteger := iIdCBancaria;
     qryAtualizaContas.ParamByName('IDAGENCIA').AsInteger := iIdAgencia;
     qryAtualizaContas.ExecSQL;

     Result := True;
  except
    on e : exception do
    begin
       Result := False;
       MessageInfo := e.Message;
    end;
  end;
end;

function TfrmCadContaEmLote.GetIdAgencia: integer;
var
   sSQL : string;
begin
  try
   sSQL := 'SELECT DISTINCT IDPESSOA AS IDAGENCIA FROM AGENCIABANCARIA ' +
           ' WHERE SUBSTR(TRIM(NUMAGENCIA), 1, 4) = :NUMAGENCIA' +
           '   AND FLGATIVO = :FLGATIVO';

   qryAux.Close;
   qryAux.SQL.Clear;
   qryAux.SQL.Add(sSQL);
   qryAux.ParamByName('NUMAGENCIA').AsString := Agencia;
   qryAux.ParamByName('FLGATIVO').AsString := 'S';
   qryAux.Open;

   Result := qryAux.FieldByName('IDAGENCIA').AsInteger;
  finally
   qryAux.Close;
  end;
end;

procedure TfrmCadContaEmLote.dbgrdContasEmLoteCalcCellColors(
  Sender: TObject; Field: TField; State: TGridDrawState;
  Highlight: Boolean; AFont: TFont; ABrush: TBrush);
begin
  inherited;
  if (bAtualizacao) then
     dbgrdContasEmLote.Canvas.Brush.Color := clGray;
end;

procedure TfrmCadContaEmLote.MarcarComoContaProcessada;
begin
 try
    qryContaProcessada.Close;
    qryContaProcessada.ParamByName('FLGCONTASALARIOPROCESSADA').AsInteger := 1;
    qryContaProcessada.ParamByName('DTCONTASALARIOPROCESSADA').AsString := FormatDateTime('dd/mm/yyyy', Date);
    qryContaProcessada.ParamByName('IDPESSOA').AsInteger := iIdPessoa;
    qryContaProcessada.ExecSQL;
 finally
    qryContaProcessada.Close;
 end;

end;

procedure TfrmCadContaEmLote.pgctrlCadContasChanging(Sender: TObject;
  var AllowChange: Boolean);
begin
  inherited;
  AllowChange := not(qryContasNaoCad.IsEmpty)
end;

procedure TfrmCadContaEmLote.pgctrlCadContasChange(Sender: TObject);
begin
  inherited;

  if (pgctrlCadContas.ActivePage = tbsContasCad) then
  begin
     sbtnGerarRelat.Enabled := (not(qryContasEmLote.IsEmpty) and bAtualizacao);
     bbtnCancelar.Enabled := True;
     bbtnConfirmar.Enabled := (not(qryContasEmLote.IsEmpty) and not(bProcessou));
     sbtnImportar.Enabled := True;
  end
  else if (pgctrlCadContas.ActivePage = tbsContasNaoCad) then
  begin
     sbtnGerarRelat.Enabled := True;
     bbtnCancelar.Enabled := False;
     bbtnConfirmar.Enabled := False;
     sbtnImportar.Enabled := False;
  end;
end;

procedure TfrmCadContaEmLote.sbtnGerarRelatClick(Sender: TObject);
begin
  inherited;
  if (pgctrlCadContas.ActivePage = tbsContasCad) then
     GerarRelatContasCad
  else if (pgctrlCadContas.ActivePage = tbsContasNaoCad) then
     GerarRelatContasNaoCad;
end;

procedure TfrmCadContaEmLote.GerarRelatContasCad;
var
  sPath, sLinhaAux, sRange  : string;
  iLinIniReg, iLinPos, iLinFinalReg, iCol : integer;
begin
  try
     sPath := Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)  + '\' +
             'REL_CONTAS_CADASTRADAS_' + FormatDateTime('dd_mm_yyyy_hh_nn', Now) + '.xlsx';

     // cria  um arquivo de exportação com o mesmo padrão do arquivo importado
     ArqExcelExport := CreateOleObject('Excel.Application');
     ArqExcelExport.WorkBooks.Add(sPathArquivoImportado);
     ArqExcelExport.Visible := False;
     ArqExcelExport.DisplayAlerts := False;

     // manipulando a sheet
     SheetOP37Export := ArqExcelExport.WorkBooks[1].Sheets[1];

     // preenche e arruma o cabecalho
     sLinhaAux := IntToStr(NumLinRelatCabecalho);
     for iCol := 1 to NumColsRelatCabecalho do
     begin
          SheetOP37Export.Range[vColsCabecalhoRelat[iCol].Col + sLinhaAux].Value := vColsCabecalhoRelat[iCol].Valor;
          SheetOP37Export.Range[vColsCabecalhoRelat[iCol].Col + sLinhaAux].ColumnWidth := vColsCabecalhoRelat[iCol].Largura;
     end;

     // limpando os registros
     sRange := 'A' + IntToStr(NumLinIniRegExport) + ':' + 'AR' + IntToStr(NumTotalRegistrosExport);
     SheetOP37Export.Range[sRange].ClearContents;

     iLinIniReg := NumLinRelatCabecalho + 1; // posição do primeiro registro
     iLinFinalReg := NumLinRelatCabecalho + qryContasEmLote.RecordCount; // linha final dos registros

     // alinha e formata as celulas
     for iCol := 1 to NumColsRelatCabecalho do
     begin
       sRange := vColsCabecalhoRelat[iCol].Col + IntToStr(iLinIniReg) + ':' + vColsCabecalhoRelat[iCol].Col + IntToStr(iLinFinalReg);
       SheetOP37Export.Range[sRange].HorizontalAlignment := AlinharCelula(vColsCabecalhoRelat[iCol].HAlign);  // centralizado
       SheetOP37Export.Range[sRange].Font.Name := 'Arial';
       SheetOP37Export.Range[sRange].Font.Size := FontSizeReg;
       SheetOP37Export.Range[sRange].NumberFormat := '@'; // formata os campos numéricos para texto
     end;

     qryContasEmLote.First;
     qryContasEmLote.DisableControls;

     // adicionando os registros
     for iLinPos := iLinIniReg to iLinFinalReg do
     begin
        sLinhaAux := IntToStr(iLinPos);

        SheetOP37Export.Range[ColRelatMatricula + sLinhaAux].Value := qryContasEmLoteMATRICULA.AsString;
        SheetOP37Export.Range[ColRelatNome + sLinhaAux].Value := qryContasEmLoteNOME.AsString;
        SheetOP37Export.Range[ColRelatCPF + sLinhaAux].Value := qryContasEmLoteNUMDOCUMENTO.AsString;
        SheetOP37Export.Range[ColRelatBanco + sLinhaAux].Value := qryContasEmLoteNUMBANCO.AsString;
        SheetOP37Export.Range[ColRelatAgencia + sLinhaAux].Value := qryContasEmLoteNUMAGENCIA.AsString;
        SheetOP37Export.Range[ColRelatConta + sLinhaAux].Value := qryContasEmLoteCONTACORRENTE.AsString;
        SheetOP37Export.Range[ColRelatOperacao + sLinhaAux].Value := qryContasEmLoteTIPOCONTA.AsString;
        SheetOP37Export.Range[ColRelatBancoContaVin + sLinhaAux].Value := qryContasEmLoteNUMBANCO2.AsString;
        SheetOP37Export.Range[ColRelatAgenciaContaVin + sLinhaAux].Value := qryContasEmLoteNUMAGENCIA2.AsString;
        SheetOP37Export.Range[ColRelatContaVin + sLinhaAux].Value :=  qryContasEmLoteCONTACORRENTE2.AsString + qryContasEmLoteDV.AsString;
        SheetOP37Export.Range[ColRelatMovimentacao + sLinhaAux].Value := qryContasEmLoteMOVIMENTACAO.AsString;

        qryContasEmLote.Next;
     end;
     qryContasEmLote.First;
     qryContasEmLote.EnableControls;

     SheetOP37Export.Range[CellDataGerRelat].NumberFormat := '@';
     SheetOP37Export.Range[CellDataGerRelat].Value := FormatDateTime('dd/mm/yyyy', Now); // atribuindo data de exportação

     ArqExcelExport.WorkBooks[1].SaveAs(sPath); // salva o arquivo

     if FileExists(sPath) then
       MsgDlg(MsgRelatorio, 'Aviso', mtInformation, [mbOk], 0);
  finally
     ArqExcelExport.Quit;
  end;
end;

procedure TfrmCadContaEmLote.GerarRelatContasNaoCad;
var
   sLinha, sPath : string;
begin
  sPath := Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)  + '\' +
                   'REL_CONTAS_INCONSISTENTES_' + FormatDateTime('dd_mm_yyyy_hh_nn', Now) + '.txt';

  qryContasNaoCad.DisableControls;
  qryContasNaoCad.First;

  // montando o cabeçalho
  sLinha := AlinhaEsquerda('Matricula', 12) + AlinhaEsquerda('Nome', 45) + AlinhaEsquerda('CPF', 15) +
            AlinhaEsquerda('Banco', 8) + AlinhaEsquerda('Agência', 10) +
            AlinhaEsquerda('Conta Corrente', 20) + AlinhaEsquerda('Tipo', 15) +
            AlinhaEsquerda('Motivo', 10);

  Arq.Clear;
  Arq.Add(sLinha);

  while not(qryContasNaoCad.Eof) do
  begin
     sLinha := AlinhaEsquerda(qryContasNaoCadMATRICULA.AsString, 12) +
               AlinhaEsquerda(qryContasNaoCadNOME.AsString, 45) +
               AlinhaEsquerda(qryContasNaoCadNUMDOCUMENTO.AsString, 15) +
               AlinhaEsquerda(qryContasNaoCadNUMBANCO.AsString, 8) +
               AlinhaEsquerda(qryContasNaoCadNUMAGENCIA.AsString, 10) +
               AlinhaEsquerda(qryContasNaoCadCONTACORRENTE.AsString, 20) +
               AlinhaEsquerda('Conta Salário', 15) +
               AlinhaEsquerda(qryContasNaoCadMOTIVORECUSA.AsString, 10);

     Arq.Add(sLinha);

     qryContasNaoCad.Next;
  end;

  qryContasNaoCad.EnableControls;

  Arq.SaveToFile(sPath);

  if FileExists(sPath) then
     MsgDlg(MsgRelatorio, 'Aviso', mtInformation, [mbOk], 0);
end;


procedure TfrmCadContaEmLote.InserirRegNaGridContasCad;
begin
  qryContasEmLote.Append;
  qryContasEmLoteIDPESSOA.AsInteger := iIdPessoa;
  qryContasEmLoteIDTITULAR.AsInteger := iIdTitular;
  qryContasEmLoteIDAGENCIA.AsInteger := iIdAgencia;
  qryContasEmLoteIDBANCO.AsInteger := 0;
  qryContasEmLoteMATRICULA.AsString := Matricula;
  qryContasEmLoteNOME.AsString := Nome;
  qryContasEmLoteNUMDOCUMENTO.AsString := CPF;
  qryContasEmLoteNUMBANCO.AsString := Banco;
  qryContasEmLoteNUMAGENCIA.AsString := Agencia;
  qryContasEmLoteCONTACORRENTE.AsString := ContaSal;
  qryContasEmLoteTIPOCONTA.AsString := Operacao;
  qryContasEmLoteMOVIMENTACAO.AsString := Movimentacao;
  qryContasEmLoteNUMBANCO2.AsString := BancoVin;
  qryContasEmLoteNUMAGENCIA2.AsString := AgenciaVin;
  qryContasEmLoteCONTACORRENTE2.AsString := ContaVin;
  qryContasEmLoteTIPOCONTA2.AsString := OperacaoVin;
  qryContasEmLoteDV.AsString := DV;
  qryContasEmLoteDATAABERTURA.AsString := FormatDateTime('dd/mm/yyyy', DataAbertura);
  qryContasEmLote.Post;
end;

procedure TfrmCadContaEmLote.InserirRegNaGridContasNaoCad;
begin
  qryContasNaoCad.Append;
  qryContasNaoCadIDPESSOA.AsInteger := iIdPessoa;
  qryContasNaoCadIDTITULAR.AsInteger := iIdTitular;
  qryContasNaoCadIDAGENCIA.AsInteger := iIdAgencia;
  qryContasNaoCadMATRICULA.AsString := Matricula;
  qryContasNaoCadNOME.AsString := Nome;
  qryContasNaoCadNUMDOCUMENTO.AsString := CPF;
  qryContasNaoCadNUMBANCO.AsString := Banco;
  qryContasNaoCadNUMAGENCIA.AsString := Agencia;
  qryContasNaoCadCONTACORRENTE.AsString := ContaSal;
  qryContasNaoCadTIPOCONTA.AsString := Operacao;
  qryContasNaoCadMOTIVORECUSA.AsString := MotivoRecusa;
  qryContasNaoCadNUMBANCO2.AsString := BancoVin;
  qryContasNaoCadNUMAGENCIA2.AsString := AgenciaVin;
  qryContasNaoCadCONTACORRENTE2.AsString := ContaVin;
  qryContasNaoCadTIPOCONTA2.AsString := OperacaoVin;
  qryContasNaoCadDV.AsString := DV;
  qryContasNaoCadDATAABERTURA.AsString := FormatDateTime('dd/mm/yyyy', DataAbertura);
  qryContasNaoCad.Post;
end;

function TfrmCadContaEmLote.GetFlgMovimentacao: integer;
begin
  Result := FFlgMovimentacao;
end;

function TfrmCadContaEmLote.AlinharCelula(
  Alinhamento: TAlinhamento): integer;
begin
     case Alinhamento of
          xlNone: Result := 1;
          xlLeft: Result := 2;
          xlCenter: Result := 3;
          xlRight: Result := 4;
     end;
end;

function TfrmCadContaEmLote.GetContaVinComDV: string;
begin
   FContaVinComDV := ContaVin + DV;
   Result := FContaVinComDV;
end;

function TfrmCadContaEmLote.GetTipoMovimentacao: integer;
begin
   if Movimentacao = 'Alteração' then
      Result := 0
   else if Movimentacao = 'Inclusão' then
      Result := 1
   else
      Result := 2;
end;

function TfrmCadContaEmLote.GetAgenciaVinSemDV: string;
begin
   if Length(qryValAgenciaVin.FieldByName('NUMAGENCIA').AsString) = 5  then
       FAgenciaVinSemDV := Copy(qryValAgenciaVin.FieldByName('NUMAGENCIA').AsString, 1, 4)
   else
       FAgenciaVinSemDV := qryValAgenciaVin.FieldByName('NUMAGENCIA').AsString;

   Result := FAgenciaVinSemDV;
end;

function TfrmCadContaEmLote.GetIdBanco: integer;
var
  sSQL : string;
begin
  try
     sSQL := 'SELECT IDPESSOA AS IDBANCO FROM BANCO WHERE TRIM(NUMBANCO) = :NUMBANCO';

     qryAux.Close;
     qryAux.SQL.Clear;
     qryAux.SQL.Add(sSQL);
     qryAux.ParamByName('NUMBANCO').AsString := Banco;
     qryAux.Open;

     Result := qryAux.FieldByName('IDBANCO').AsInteger;
  finally
     qryAux.Close;
  end;
end;


procedure TfrmCadContaEmLote.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  LimparTela;
end;

procedure TfrmCadContaEmLote.LimparTela;
begin
  bAtualizacao := False;
  edtPath.Text := '';

  qryContasEmLote.DisableControls;
  qryContasEmLote.First;

  while not(qryContasEmLote.Eof) do qryContasEmLote.Delete;
  dbgrdContasEmLote.Repaint;

  qryContasEmLote.EnableControls;

  qryContasNaoCad.DisableControls;
  qryContasNaoCad.First;
  while not(qryContasNaoCad.Eof) do qryContasNaoCad.Delete;
  dbgrdContasNaoCad.Repaint;

  qryContasNaoCad.EnableControls;

  sbtnGerarRelat.Enabled := False;
end;

end.
