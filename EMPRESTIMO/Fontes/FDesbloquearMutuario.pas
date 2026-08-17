{-------------------------------------------------------------------------------
ALTERAÇÕES / IMPLEMENTAÇÕES ----------------------------------------------------
--------------------------------------------------------------------------------
Pendência   : SOL 161785 KINTANA 1368593
Responsável : Fanuel Junior
Data        : 21/07/2011
Descrição   : Alteração do caption do menu "Financiamento Habitacional" para
              "Consulta Quitação Financiamento Habitacional"
--------------------------------------------------------------------------------
Pendência   : SOL 136411 Kintana 815862
Responsável : Marcelo Almeida da Silva
Descrição   : Criação da tela 'Consulta Quitação de Financiamento'
--------------------------------------------------------------------------------
-------------------------------------------------------------------------------}

unit FDesbloquearMutuario;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, ComCtrls, fcLabel, ToolWin, Db, DBClient, ImgList, Grids, DBGrids, TREdit, wwdbdatetimepicker, uValidaDoc, USistema,
  DBTables, Wwquery, MontaSelect, UMensErro;

type
  TAcaoTela = (atDesbloquearMutuario, atDesbloquearMutuarioIndividual, atDesbloquearMutuarioArquivo, atConsultarHistoricoDesbloqueio);
  TMutuarioMensagem = (mmMatriculaNaoEncontrada, mmMatriculaInvalida, mmDataLiquidacaoInvalida, mmValorLiquidacaoInvalido, mmCPFInvalido, mmMatriculaConstaHistorico, mmMatriculaSemHistoricoSIAFI);
  TMutuarioMensagens = set of TMutuarioMensagem;
  TMarcarItens = (miMarcarTodos, miInverterSelecao);

type
  TMutuarioInfo = class
  private
    FIDPessoa : Integer;
    FMatricula : String;
    FNome : String;
    FDataLiquidacao : TDate;
    FValorLiquidacao : Double;
    FCPF : String;
    FStatus : TMutuarioMensagens;
    FDesbloqueado : Boolean;
    FLinhaRecebidaArquivo : String;
    procedure SetCPF(const Value: String);
    procedure SetDataLiquidacao(const Value: String);
    procedure SetMatricula(const Value: String);
    procedure SetValorLiquidacao(const Value: String);
    function GetDataLiquidacao: String;
    function GetValorLiquidacao: String;
    function GetMatriculaFormatada: String;
    function GetCPF: String;
  public
    property IDPessoa : Integer read FIDPessoa default 0;
    property Matricula : String read FMatricula write SetMatricula;
    property MatriculaFormatada : String read GetMatriculaFormatada;
    property Nome : String read FNome write FNome;
    property DataLiquidacao : String read GetDataLiquidacao write SetDataLiquidacao;
    property ValorLiquidacao : String read GetValorLiquidacao write SetValorLiquidacao;
    property CPF : String read GetCPF write SetCPF;
    property Status : TMutuarioMensagens read FStatus;
    property Desbloqueado : Boolean read FDesbloqueado default False;
    property LinhaRecebidaArquivo : String read FLinhaRecebidaArquivo;
    constructor Create(AMatricula : String; ANome : String; ADataLiquidacao : String; AValorLiquidacao : String; ACPF : String; ALinhaRecebidaArquivo : String = '');
    class function ParseStatusToString(AMutuarioMensagens : TMutuarioMensagens) : TStrings;
    function DesbloquearMutuario : Boolean;
end;


type
  TfrmDesbloquearMutuario = class(TfrmSairAjuda)
    pcDesbloqueioMutuario: TPageControl;
    tsMutuario: TTabSheet;
    tsHistoricoDesbloqueio: TTabSheet;
    pnlTituloTela: TPanel;
    lblTituloTela: TfcLabel;
    pnlListaMutuarios: TPanel;
    pnlDesbloquearMutuarioArquivoBotoes: TPanel;
    ToolBarOperacoesItensImportador: TToolBar;
    tlbtnImportarMarcarTodos: TToolButton;
    tlbtnImportarInverteSelecao: TToolButton;
    pnlCamposEntradaManual: TPanel;
    edtMutuarioMatricula: TEdit;
    lblMutuarioMatricula: TLabel;
    edtMutuarioCPF: TEdit;
    lblMutuarioCPF: TLabel;
    edtMutuarioNome: TEdit;
    lblMutuarioNome: TLabel;
    imglstToolBar: TImageList;
    btnBuscaMutuario: TBitBtn;
    btnLimpaCamposEntradaManual: TBitBtn;
    grdHistoricoDesbloqueio: TDBGrid;
    pnlPeriodoDatasBase: TPanel;
    pnlHistoricoDesbloqueioPeriodoDatas: TPanel;
    pnlHistoricoDesbloqueioPeriodoDatasAte: TPanel;
    pnlHistoricoDesbloqueioPeriodoDatasDe: TPanel;
    btnBuscarHistoricoDesbloqueio: TBitBtn;
    pnlDesbloquearMutuarioArquivoSelecionar: TPanel;
    plnDesbloquearMutuarioArquivo: TPanel;
    edtArquivoMutuarioCSV: TEdit;
    btnSelecionarArquivoCSV: TBitBtn;
    lblDataLiquidacao: TLabel;
    edtValorLiquidacao: TDBRealEdit;
    lblValorLiquidacao: TLabel;
    edtDataLiquidacao: TwwDBDateTimePicker;
    edtHistoricoDataInicial: TwwDBDateTimePicker;
    edtHistoricoDataFinal: TwwDBDateTimePicker;
    stsArquivoDesbloqueio: TStatusBar;
    stsHistoricoDesbloqueio: TStatusBar;
    ilListaMutuario: TImageList;
    btnLimparDadosArquivo: TBitBtn;
    pnlNenhumMutuarioImportado: TPanel;
    qryHistoricoDesbloqueio: TwwQuery;
    opLocalizarArquivo: TOpenDialog;
    lvMutuariosArquivo: TListView;
    msBuscaMutuarioBloqueado: TMontaSelect;
    tbBotoesDesbloquear: TToolbar97;
    ToolbarSep972: TToolbarSep97;
    ToolbarSep974: TToolbarSep97;
    ToolbarSep975: TToolbarSep97;
    bbtnDesbloqueiarMutuario: TBitBtn;
    bbtnCancelarDesbloqueio: TBitBtn;
    dsHistoricoDesbloqueio: TDataSource;
    pnlNenhumHistoricoDesbloqueio: TPanel;
    btnInformacoesMatricula: TToolButton;
    msBuscaMutuario: TMontaSelect;
    procedure FormCreate(Sender: TObject);
    procedure pcDesbloqueioMutuarioChange(Sender: TObject);
    procedure btnLimpaCamposEntradaManualClick(Sender: TObject);
    procedure btnSelecionarArquivoCSVClick(Sender: TObject);
    procedure btnLimparDadosArquivoClick(Sender: TObject);
    procedure tlbtnImportarMarcarTodosClick(Sender: TObject);
    procedure tlbtnImportarInverteSelecaoClick(Sender: TObject);
    procedure btnBuscaMutuarioClick(Sender: TObject);
    procedure bbtnCancelarDesbloqueioClick(Sender: TObject);
    procedure bbtnDesbloqueiarMutuarioClick(Sender: TObject);
    procedure btnBuscarHistoricoDesbloqueioClick(Sender: TObject);
    procedure dsHistoricoDesbloqueioStateChange(Sender: TObject);
    procedure lvMutuariosArquivoDblClick(Sender: TObject);
    procedure btnInformacoesMatriculaClick(Sender: TObject);
    procedure lvMutuariosArquivoClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    FAcaoTela : TAcaoTela;
    procedure SetAcaoTela(const Value: TAcaoTela);
    procedure AdicionarMutuarioLista(AMutuario : TMutuarioInfo);
    function CarregarArquivo(ANomeArquivo : String) : Boolean;
    procedure LimparListaEntradaArquivo;
    procedure LimparCamposEntradaManual;
    procedure LimparDadosArquivo;
    procedure MarcarItensMutuariosImportados(AMarcarItens : TMarcarItens = miMarcarTodos);
    procedure DesbloquearMutuario;
    procedure CancelarDesbloqueioMutuario;
    procedure BuscarHistoricoDesbloqueio;
    procedure GerarLogHistoricoDesbloqueio;
    procedure ExibirInformacoesMatricula;
    function ValidarLinha(ALinha : String) : Boolean;
  public
    { Public declarations }
    property AcaoTela : TAcaoTela read FAcaoTela write SetAcaoTela;
  end;

var
  frmDesbloquearMutuario: TfrmDesbloquearMutuario;

implementation

uses dBaseDados, UDataBase, fAguarde;

{$R *.DFM}

{ TMutuarioInfo }

constructor TMutuarioInfo.Create(AMatricula, ANome, ADataLiquidacao,
  AValorLiquidacao, ACPF: String; ALinhaRecebidaArquivo : String);
begin
  FStatus := [];
  Matricula := AMatricula;
  Nome := ANome;
  DataLiquidacao := ADataLiquidacao;
  ValorLiquidacao := AValorLiquidacao;
  CPF := ACPF;
  FLinhaRecebidaArquivo := ALinhaRecebidaArquivo;
end;

function TMutuarioInfo.DesbloquearMutuario : Boolean;
var
  sqlDeleteEPHISTSIAFI,
  sqlInsertHISTDESBLOQUEIO : TwwQuery;
begin
  if (not(Self.Desbloqueado)) then
  begin
    try
      // Inicia uma transação - só se não ouver transação iniciada.
      if (dtmBaseDados.dbBaseDados.InTransaction) then
      begin
        raise Exception.Create('Transação anterior em progresso!');
      end;

      //***Iniciar transação
      StartTransacao;

      //Inserir registro no histórico de desbloqueio de mutuários
      sqlInsertHISTDESBLOQUEIO := TwwQuery.Create(nil);
      sqlInsertHISTDESBLOQUEIO.DatabaseName := 'BaseDados';
      try
        with sqlInsertHISTDESBLOQUEIO do
        begin
          SQL.Clear;
          SQL.Add('INSERT INTO HISTDESBLOQUEIO');
          SQL.Add('       (');
          SQL.Add('            matricula,');
          SQL.Add('            dataliquid,');
          SQL.Add('            nome,');
          SQL.Add('            valliquid,');
          SQL.Add('            cpf,');
          SQL.Add('            idusuario');
          SQL.Add('       )');
          SQL.Add('VALUES');
          SQL.Add('       (');
          SQL.Add('            :matricula,');
          SQL.Add('            :dataliquid,');
          SQL.Add('            :nome,');
          SQL.Add('            :valliquid,');
          SQL.Add('            :cpf,');
          SQL.Add('            :idusuario');
          SQL.Add('       )');
        end;

        sqlInsertHISTDESBLOQUEIO.Params.Clear;

        sqlInsertHISTDESBLOQUEIO.Params.CreateParam(ftString, 'matricula', ptInput);
        sqlInsertHISTDESBLOQUEIO.ParamByName('matricula').AsString := Self.Matricula;

        sqlInsertHISTDESBLOQUEIO.Params.CreateParam(ftDate, 'dataliquid', ptInput);
        sqlInsertHISTDESBLOQUEIO.ParamByName('dataliquid').AsDate := Self.FDataLiquidacao;

        sqlInsertHISTDESBLOQUEIO.Params.CreateParam(ftString, 'nome', ptInput);
        sqlInsertHISTDESBLOQUEIO.ParamByName('nome').AsString := Self.Nome;

        sqlInsertHISTDESBLOQUEIO.Params.CreateParam(ftFloat, 'valliquid', ptInput);
        sqlInsertHISTDESBLOQUEIO.ParamByName('valliquid').AsFloat := Self.FValorLiquidacao;

        sqlInsertHISTDESBLOQUEIO.Params.CreateParam(ftString, 'cpf', ptInput);
        sqlInsertHISTDESBLOQUEIO.ParamByName('cpf').AsString := Self.CPF;

        sqlInsertHISTDESBLOQUEIO.Params.CreateParam(ftString, 'idusuario', ptInput);
        sqlInsertHISTDESBLOQUEIO.ParamByName('idusuario').AsInteger := Sistema.IdUsuario;

        sqlInsertHISTDESBLOQUEIO.Prepare;
        sqlInsertHISTDESBLOQUEIO.ExecSQL;
      finally
        FreeAndNil(sqlInsertHISTDESBLOQUEIO);
      end;

      //Excluir informações do mutuário com base no IDPESSOA da tabela EPHISTSIAFI,
      //conforme a SOL 136411 não é necessário guardar histórico dessas informações excluídas,
      //Somente o registro de quem executou a operação será guardado na tabela HISTDESBLOQUEIO.
      sqlDeleteEPHISTSIAFI := TwwQuery.Create(nil);
      sqlDeleteEPHISTSIAFI.DatabaseName := 'BaseDados';
      try
        with sqlDeleteEPHISTSIAFI do
        begin
          SQL.Clear;
          SQL.Add('DELETE ephistsiafi EPHS');
          SQL.Add(' WHERE EPHS.idpessoa = :idpessoa');
        end;
        sqlDeleteEPHISTSIAFI.Params.Clear;
        sqlDeleteEPHISTSIAFI.Params.CreateParam(ftInteger, 'idpessoa', ptInput);
        sqlDeleteEPHISTSIAFI.ParamByName('idpessoa').AsInteger := Self.IDPessoa;
        sqlDeleteEPHISTSIAFI.Prepare;
        sqlDeleteEPHISTSIAFI.ExecSQL;
      finally
        FreeAndNil(sqlDeleteEPHISTSIAFI);
      end;
      //***Efetivar transação
      CommitTransacao;
    except
      on e : Exception do
      begin
        //***Desfazer transação      
        RollBackTransacao;
        raise;
      end;
    end;
    FDesbloqueado := True;
  end
  else
  begin
    raise Exception.Create('Matrícula já consta no histórico de desbloqueio!');
  end;
  Result := FDesbloqueado;
end;

function TMutuarioInfo.GetCPF: String;
begin
  Result := Trim(FCPF);
end;

function TMutuarioInfo.GetDataLiquidacao: String;
begin
  Result := FormatDateTime('dd/mm/yyyy', FDataLiquidacao);;
end;

function TMutuarioInfo.GetMatriculaFormatada: String;
begin
  Result := Concat(Copy(FMatricula, 1, Length(FMatricula)-1), '-', Copy(FMatricula, Length(FMatricula), 1));
end;

function TMutuarioInfo.GetValorLiquidacao: String;
begin
  Result := FormatFloat(',0.00', FValorLiquidacao);
end;

class function TMutuarioInfo.ParseStatusToString(
  AMutuarioMensagens: TMutuarioMensagens): TStrings;
begin
  Result := TStringList.Create();
  Result.Clear;
  if (AMutuarioMensagens <> []) then
  begin
    if (mmMatriculaNaoEncontrada in AMutuarioMensagens) then
    begin
      Result.Add('Matrícula não encontrada no sistema');
    end;

    if (mmMatriculaInvalida in AMutuarioMensagens) then
    begin
      Result.Add('Matrícula inválida')
    end;

    if (mmDataLiquidacaoInvalida in AMutuarioMensagens) then
    begin
      Result.Add('Data de liquidação inválida');
    end;

    if (mmValorLiquidacaoInvalido in AMutuarioMensagens) then
    begin
      Result.Add('Valor da liquidação inválida');
    end;

    if (mmCPFInvalido in AMutuarioMensagens) then
    begin
      Result.Add('CPF inválido');
    end;

    if (mmMatriculaConstaHistorico in AMutuarioMensagens) then
    begin
      Result.Add('Matrícula já consta no histórico de desbloqueio');
    end;

    if (mmMatriculaSemHistoricoSIAFI in AMutuarioMensagens) then
    begin
      Result.Add('Matrícula não possuí registro na estrutura de histórico do SIAFI');
    end;


  end;
end;

procedure TMutuarioInfo.SetCPF(const Value: String);
var
  cmValidaCPF : TCMValidaDoc;
  cpfSemFormatacao : String;
begin
  FCPF := Value;
  cpfSemFormatacao := StringReplace(FCPF, '.', '', [rfReplaceAll]);
  cpfSemFormatacao := StringReplace(cpfSemFormatacao, '-', '', [rfReplaceAll]);
  cmValidaCPF := TCMValidaDoc.Create(nil);
  try
    with cmValidaCPF do
    begin
      TipoDocumento := tdCPF;
      NumDocumento := cpfSemFormatacao;
      if (not(DocumentoValido)) then
      begin
        FStatus := FStatus + [mmCPFInvalido];
      end;
    end;
  finally
    FreeAndNil(cmValidaCPF);
  end;
end;

procedure TMutuarioInfo.SetDataLiquidacao(const Value: String);
var
  dia,
  mes : String[2];
  ano : String[4];
begin
  try
    //Conforme a RN001 (136411.815862) o formato de data esperado é DD/MM/AAAA
    dia := Copy(Value, 1, 2);
    mes := Copy(Value, 4, 2);
    ano := Copy(Value, 7, 4);
    FDataLiquidacao := EncodeDate(StrToInt(ano), StrToInt(mes), StrToInt(dia));
  except
    FStatus := FStatus + [mmDataLiquidacaoInvalida];
  end;
end;

procedure TMutuarioInfo.SetMatricula(const Value: String);
const
  TAMANHO_MAXIMO_MATRICULA = 7;

var
  sqlHistoricoSIAF,
  sqlHistoricoDesbloqueio : TwwQuery;

//sub function
  function ParseMatricula(AMatricula : String) : String;
  var
    Index : Integer;
    numeroMatricula : String;
  begin
    numeroMatricula := EmptyStr;
    for Index := 1 to Length(AMatricula) do
    begin
      if AMatricula[Index] in ['0'..'9'] then
      begin
        numeroMatricula := Concat(numeroMatricula, AMatricula[Index]);
      end;
    end;
    Result := numeroMatricula;
  end;
begin
  FMatricula := StringReplace(Format('%'+IntToStr(TAMANHO_MAXIMO_MATRICULA)+'s', [ParseMatricula(Value)]), ' ', '0', [rfReplaceAll]);
  try
    if (StrToInt(FMatricula) = 0)
    or (Length(FMatricula) > TAMANHO_MAXIMO_MATRICULA) then
    begin
      FStatus := FStatus + [mmMatriculaInvalida];
    end
    else
    begin
      //Procurar matricula na DEPENTIT e verificar se existe historico no SIAFI
      sqlHistoricoSIAF := TwwQuery.Create(nil);
      sqlHistoricoSIAF.DatabaseName := 'BaseDados';
      if (sqlHistoricoSIAF.Active) then
      begin
        sqlHistoricoSIAF.Close;
      end;
      try
        with sqlHistoricoSIAF do
        begin
          SQL.Clear;
          SQL.Add('SELECT DT.idpessoa,');
          SQL.Add('       DECODE(EHS.idpessoa, NULL, ''N'', ''S'') possui_historico');
          SQL.Add('  FROM depentit DT');
          SQL.Add('  LEFT JOIN ephistsiafi EHS');
          SQL.Add('    ON EHS.idpessoa = DT.idpessoa');
          SQL.Add(' WHERE DT.matricula = :matricula');
        end;
        sqlHistoricoSIAF.Params.Clear;
        sqlHistoricoSIAF.Params.CreateParam(ftString, 'matricula', ptInput);
        sqlHistoricoSIAF.ParamByName('matricula').AsString := Self.Matricula;
        sqlHistoricoSIAF.Open;

        if (sqlHistoricoSIAF.IsEmpty)
        or (sqlHistoricoSIAF.FieldByName('idpessoa').IsNull) then
        begin
          FStatus := FStatus + [mmMatriculaNaoEncontrada];
        end
        else
        begin
          if (sqlHistoricoSIAF.FieldByName('possui_historico').AsString = 'N') then
          begin
            FStatus := FStatus + [mmMatriculaSemHistoricoSIAFI];
          end
          else
          begin
            Self.FIDPessoa := sqlHistoricoSIAF.FieldByName('idpessoa').AsInteger;
          end;
        end;
      finally
        FreeAndNil(sqlHistoricoSIAF);
      end;

      //Procurar Matricula no historico de desbloqueio
      sqlHistoricoDesbloqueio := TwwQuery.Create(nil);
      sqlHistoricoDesbloqueio.DatabaseName := 'BaseDados';
      if (sqlHistoricoDesbloqueio.Active) then
      begin
        sqlHistoricoDesbloqueio.Close;
      end;
      try
        with sqlHistoricoDesbloqueio do
        begin
          SQL.Clear;
          SQL.Add('SELECT HD.matricula');
          SQL.Add('  FROM histdesbloqueio HD');
          SQL.Add(' WHERE HD.matricula = :matricula');
        end;
        sqlHistoricoDesbloqueio.Params.Clear;
        sqlHistoricoDesbloqueio.Params.CreateParam(ftString, 'matricula', ptInput);
        sqlHistoricoDesbloqueio.ParamByName('matricula').AsString := Self.Matricula;
        sqlHistoricoDesbloqueio.Open;

        if (not(sqlHistoricoDesbloqueio.IsEmpty)) then
        begin
          FStatus := FStatus + [mmMatriculaConstaHistorico];
          FDesbloqueado := True;
        end;
      finally
        FreeAndNil(sqlHistoricoDesbloqueio);
      end;
    end;
  except
    FStatus := FStatus + [mmMatriculaInvalida];
  end;
end;

procedure TMutuarioInfo.SetValorLiquidacao(const Value: String);
var
  valorLiquidacao : String;
begin
  valorLiquidacao := StringReplace(Value, ',', DecimalSeparator, [rfReplaceAll]);
  valorLiquidacao := StringReplace(Value, ThousandSeparator, '', [rfReplaceAll]);
  try
    FValorLiquidacao := StrToFloat(valorLiquidacao);
  except
    FStatus := FStatus + [mmValorLiquidacaoInvalido];
  end;
end;

{ TfrmSairAjuda1 }

procedure TfrmDesbloquearMutuario.SetAcaoTela(const Value: TAcaoTela);
begin
  FAcaoTela := Value;
  case FAcaoTela of
    atDesbloquearMutuario : begin
                              tbBotoesDesbloquear.Visible := False;
                              LimparDadosArquivo();
                              LimparCamposEntradaManual();
                              if (pcDesbloqueioMutuario.ActivePage <> tsMutuario) then
                              begin
                                pcDesbloqueioMutuario.OnChange := nil;
                                try
                                  pcDesbloqueioMutuario.ActivePage := tsMutuario;
                                finally
                                  pcDesbloqueioMutuario.OnChange := pcDesbloqueioMutuarioChange;
                                end;
                              end;

                              //Campos Entrada Manual
                              edtMutuarioMatricula.Enabled := True;
                              edtMutuarioCPF.Enabled := True;
                              edtMutuarioNome.Enabled := True;
                              btnBuscaMutuario.Enabled := True;
                              btnLimpaCamposEntradaManual.Enabled := True;
                              lblDataLiquidacao.Visible := True;
                              lblValorLiquidacao.Visible := True;
                              edtDataLiquidacao.Visible := True;
                              edtValorLiquidacao.Visible := True;
                              edtDataLiquidacao.Enabled := False;
                              edtValorLiquidacao.Enabled := False;

                              //Campos Entrada Arquivo
                              edtArquivoMutuarioCSV.Enabled := True;
                              btnLimparDadosArquivo.Enabled := True;
                              btnSelecionarArquivoCSV.Enabled := True;
                            end;
    atDesbloquearMutuarioIndividual : begin
                                        tbBotoesDesbloquear.Visible := True;

                                        //Campos Entrada Arquivo
                                        edtArquivoMutuarioCSV.Enabled := False;
                                        btnLimparDadosArquivo.Enabled := False;
                                        btnSelecionarArquivoCSV.Enabled := False;
                                        edtDataLiquidacao.Enabled := True;
                                        edtValorLiquidacao.Enabled := True;

                                        LimparDadosArquivo();
                                      end;
    atDesbloquearMutuarioArquivo : begin
                                     tbBotoesDesbloquear.Visible := True;

                                     //Campos Entrada Manual
                                     edtMutuarioMatricula.Enabled := False;
                                     edtMutuarioCPF.Enabled := False;
                                     edtMutuarioNome.Enabled := False;
                                     btnBuscaMutuario.Enabled := False;
                                     btnLimpaCamposEntradaManual.Enabled := False;
                                     lblDataLiquidacao.Visible := True;
                                     lblValorLiquidacao.Visible := True;
                                     edtDataLiquidacao.Visible := True;
                                     edtValorLiquidacao.Visible := True;
                                     edtDataLiquidacao.Enabled := False;
                                     edtValorLiquidacao.Enabled := False;

                                     LimparCamposEntradaManual();
                                   end;
    atConsultarHistoricoDesbloqueio : begin
                                        if (qryHistoricoDesbloqueio.Active) then
                                        begin
                                          qryHistoricoDesbloqueio.Close;
                                        end;
                                        tbBotoesDesbloquear.Visible := False;
                                        //Campos Entrada Manual
                                        edtMutuarioMatricula.Enabled := True;
                                        edtMutuarioCPF.Enabled := True;
                                        edtMutuarioNome.Enabled := True;
                                        btnBuscaMutuario.Enabled := True;
                                        btnLimpaCamposEntradaManual.Enabled := True;
                                        lblDataLiquidacao.Visible := False;
                                        lblValorLiquidacao.Visible := False;
                                        edtDataLiquidacao.Visible := False;
                                        edtValorLiquidacao.Visible := False;
                                        edtDataLiquidacao.Enabled := False;
                                        edtValorLiquidacao.Enabled := False;

                                        LimparDadosArquivo();
                                        LimparCamposEntradaManual();
                                      end;
  else
    begin
      SetAcaoTela(atDesbloquearMutuario);
    end;
  end;
end;

procedure TfrmDesbloquearMutuario.FormCreate(Sender: TObject);
begin
  inherited;
  AcaoTela := atDesbloquearMutuario;
end;

procedure TfrmDesbloquearMutuario.pcDesbloqueioMutuarioChange(
  Sender: TObject);
begin
  inherited;
  if (pcDesbloqueioMutuario.ActivePage = tsMutuario) then
  begin
    AcaoTela := atDesbloquearMutuario;
  end
  else if (pcDesbloqueioMutuario.ActivePage = tsHistoricoDesbloqueio) then
  begin
    AcaoTela := atConsultarHistoricoDesbloqueio;
  end;
end;

procedure TfrmDesbloquearMutuario.AdicionarMutuarioLista(
  AMutuario: TMutuarioInfo);
begin
  with lvMutuariosArquivo.Items.Add do
  begin
    Caption := AMutuario.MatriculaFormatada;
    Data := AMutuario;
    SubItems.Append(AMutuario.Nome);
    SubItems.Append(AMutuario.DataLiquidacao);
    SubItems.Append(AMutuario.ValorLiquidacao);
    SubItems.Append(AMutuario.CPF);
    if (AMutuario.Status = []) then
    begin
      if (AMutuario.Desbloqueado) then
      begin
        ImageIndex := 2;
      end
      else
      begin
        ImageIndex := 0;
      end;
    end
    else
    begin
      ImageIndex := 1;
    end;
  end;
end;

function TfrmDesbloquearMutuario.CarregarArquivo(ANomeArquivo: String) : Boolean;
var
  arquivo : TStrings;
  Index : Integer;
  mutuario : TMutuarioInfo;
  mutuarioMatricula : String;
  mutuarioNome : String;
  mutuarioDataLiquidacao : String;
  mutuarioValorLiquidacao : String;
  mutuarioCPF : String;
  linha,
  linhaOriginal : String;
  linhasInvalidas : Integer;
  importouArquivo : Boolean;
  backupAnimateVisible : Boolean;
begin
  importouArquivo := False;
  linhasInvalidas := 0;
  if FileExists(ANomeArquivo) then
  begin
    LimparListaEntradaArquivo();
    arquivo := TStringList.Create();
    Screen.Cursor := crHourGlass;
    try
      try
        arquivo.LoadFromFile(ANomeArquivo);
        frmAguarde.Max := arquivo.Count;
        frmAguarde.Pos := 1;
        frmAguarde.Mostra('Carregando arquivo, Aguarde...');
        backupAnimateVisible := frmAguarde.Animate1.Visible;
        frmAguarde.Animate1.Visible := False;
        try
          for Index := 0 to arquivo.Count-1 do
          begin
            Application.ProcessMessages;
            linhaOriginal := arquivo.Strings[Index];
            linha := linhaOriginal;
            if (ValidarLinha(linhaOriginal)) then
            begin
              mutuarioMatricula := Copy(linha, 1, POS(';', linha)-1);
              linha := Copy(linha, POS(';', linha)+1, Length(linha));
              mutuarioNome := Copy(linha, 1, POS(';', linha)-1);
              linha := Copy(linha, POS(';', linha)+1, Length(linha));
              mutuarioDataLiquidacao := Copy(linha, 1, POS(';', linha)-1);
              linha := Copy(linha, POS(';', linha)+1, Length(linha));
              mutuarioValorLiquidacao := Copy(linha, 1, POS(';', linha)-1);
              linha := Copy(linha, POS(';', linha)+1, Length(linha));
              if (POS(';', linha) > 0) then
              begin
                mutuarioCPF := Copy(linha, 1, POS(';', linha)-1);
              end
              else
              begin
                mutuarioCPF := Copy(linha, 1, Length(linha));
              end;
              linha := EmptyStr;
              AdicionarMutuarioLista(TMutuarioInfo.Create(mutuarioMatricula, mutuarioNome, mutuarioDataLiquidacao, mutuarioValorLiquidacao, mutuarioCPF, linhaOriginal))
            end
            else
            begin
              Inc(linhasInvalidas, 1);
            end;
            frmAguarde.Pos := frmAguarde.Pos + 1;
          end;
        finally
          frmAguarde.Animate1.Visible := backupAnimateVisible;
          frmAguarde.Apaga;
        end;
        if (linhasInvalidas > 0) then
        begin
          MsgDlg('No arquivo selecionado foram encontradas linhas fora do padrão de CSV esperado.'+#13+#10+'Total='+IntToStr(linhasInvalidas)+#13+#10+#13+#10+'ATENÇÃO: Arquivo com formato inválido!', Application.Title, mtError, [mbOK],0);
          AcaoTela := atDesbloquearMutuario;
        end
        else
        begin
          if (lvMutuariosArquivo.Items.Count > 0) then
          begin
            importouArquivo := True;
            pnlNenhumMutuarioImportado.Visible := False;
            tlbtnImportarMarcarTodos.Enabled := True;
            tlbtnImportarInverteSelecao.Enabled := True;
            btnInformacoesMatricula.Enabled := True;
          end
          else
          begin
            MsgDlg('Nenhum registro foi importado. Verifique o arquivo!', Application.Title, mtError, [mbOK],0);
            AcaoTela := atDesbloquearMutuario;
          end;
        end;
      except
        on E : Exception do
        begin
          raise Exception.Create('Ocorreu um erro ao tentar importar o aquivo - Erro: '+e.Message)
        end;
      end;
    finally
      Result := importouArquivo;
      Screen.Cursor := crDefault;
      FreeAndNil(arquivo);
    end;
  end
  else
  begin
    Result := importouArquivo;
    raise Exception.Create('Arquivo não encontrado');
  end;
end;

procedure TfrmDesbloquearMutuario.LimparListaEntradaArquivo;
var
  Index : Integer;
  mutuario : TMutuarioInfo;
begin
  Screen.Cursor := crHourGlass;
  try
    for Index := 0 to lvMutuariosArquivo.Items.Count-1 do
    begin
      if Assigned(lvMutuariosArquivo.Items[Index].Data) then
      begin
        mutuario := TMutuarioInfo(lvMutuariosArquivo.Items[Index].Data);
        FreeAndNil(mutuario);
      end;
    end;
    lvMutuariosArquivo.Items.Clear;
    pnlNenhumMutuarioImportado.Visible := True;
    tlbtnImportarMarcarTodos.Enabled := False;
    tlbtnImportarInverteSelecao.Enabled := False;
    btnInformacoesMatricula.Enabled := False;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmDesbloquearMutuario.LimparCamposEntradaManual;
begin
  edtMutuarioMatricula.Clear;
  edtMutuarioCPF.Clear;
  edtMutuarioNome.Clear;
  edtDataLiquidacao.ClearDateTime;
  edtValorLiquidacao.Clear;
  if (AcaoTela = atConsultarHistoricoDesbloqueio) then
  begin
    edtHistoricoDataInicial.ClearDateTime;
    edtHistoricoDataFinal.ClearDateTime;
  end;
end;

procedure TfrmDesbloquearMutuario.btnLimpaCamposEntradaManualClick(
  Sender: TObject);
begin
  if (AcaoTela in [atDesbloquearMutuario, atDesbloquearMutuarioIndividual]) then
  begin
    AcaoTela := atDesbloquearMutuario;
  end
  else if (AcaoTela = atConsultarHistoricoDesbloqueio) then
  begin
    AcaoTela := atConsultarHistoricoDesbloqueio;
  end;
end;

procedure TfrmDesbloquearMutuario.LimparDadosArquivo;
begin
  edtArquivoMutuarioCSV.Clear;
  LimparListaEntradaArquivo();
end;


procedure TfrmDesbloquearMutuario.btnSelecionarArquivoCSVClick(
  Sender: TObject);
begin
  inherited;
  opLocalizarArquivo.InitialDir := Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa);
  if (opLocalizarArquivo.Execute()) then
  begin
    edtArquivoMutuarioCSV.Text := opLocalizarArquivo.FileName;
    if FileExists(edtArquivoMutuarioCSV.Text) then
    begin
      try
        if (CarregarArquivo(edtArquivoMutuarioCSV.Text)) then
        begin
          AcaoTela := atDesbloquearMutuarioArquivo;
        end;
      except
        on e : Exception do
        begin
          MsgDlg(e.Message, Application.Title, mtInformation, [mbOK], 0);
        end;
      end;
    end
    else
    begin
      MsgDlg('Arquivo com informações para desbloqueio não encontrado!', Application.Title,  mtInformation, [mbOK], 0);
    end;
  end
end;

procedure TfrmDesbloquearMutuario.btnLimparDadosArquivoClick(
  Sender: TObject);
begin
  AcaoTela := atDesbloquearMutuario;
end;


procedure TfrmDesbloquearMutuario.tlbtnImportarMarcarTodosClick(
  Sender: TObject);
begin
  if (AcaoTela = atDesbloquearMutuarioArquivo) then
  begin
    MarcarItensMutuariosImportados(miMarcarTodos);
  end;
end;

procedure TfrmDesbloquearMutuario.MarcarItensMutuariosImportados(
  AMarcarItens: TMarcarItens);
var
  index : Integer;
  mutuario : TMutuarioInfo;
  mutuarioItem : TListItem;
begin
  for index := 0 to (lvMutuariosArquivo.Items.Count-1) do
  begin
    try
      mutuarioItem := lvMutuariosArquivo.Items[Index];
      if Assigned(mutuarioItem.Data) then
      begin
        mutuario := TMutuarioInfo(mutuarioItem.Data);
        if (mutuario.Desbloqueado)
        or (mutuario.Status <> []) then
        begin
          mutuarioItem.Checked := False;
        end
        else
        begin
          case AMarcarItens of
            miMarcarTodos : mutuarioItem.Checked := True;
            miInverterSelecao : mutuarioItem.Checked := not(mutuarioItem.Checked);
          else
            mutuarioItem.Checked := True;
          end;
        end;
      end;
    finally
      mutuario := nil;
      mutuarioItem := nil;
    end;
  end;
end;

procedure TfrmDesbloquearMutuario.tlbtnImportarInverteSelecaoClick(
  Sender: TObject);
begin
  inherited;
  if (AcaoTela = atDesbloquearMutuarioArquivo) then
  begin
    MarcarItensMutuariosImportados(miInverterSelecao);
  end;
end;

procedure TfrmDesbloquearMutuario.btnBuscaMutuarioClick(Sender: TObject);
var
  montaSelectMutuario : TMontaSelect;
begin
  if (AcaoTela = atConsultarHistoricoDesbloqueio) then
  begin
    montaSelectMutuario := msBuscaMutuario;
  end
  else
  begin
    montaSelectMutuario := msBuscaMutuarioBloqueado;
  end;
  montaSelectMutuario.Executar();
  if (montaSelectMutuario.RetornouValor) then
  begin
    edtMutuarioNome.Text := montaSelectMutuario.ValoresChave[0];
    edtMutuarioCPF.Text := montaSelectMutuario.ValoresChave[1];
    edtMutuarioMatricula.Text := montaSelectMutuario.ValoresChave[2];
    if (AcaoTela in [atDesbloquearMutuario, atDesbloquearMutuarioIndividual]) then
    begin
      AcaoTela := atDesbloquearMutuarioIndividual;
    end;
  end
  else
  begin
    if (AcaoTela in [atDesbloquearMutuario, atDesbloquearMutuarioIndividual]) then
    begin
      AcaoTela := atDesbloquearMutuario;
    end
    else if (AcaoTela = atConsultarHistoricoDesbloqueio) then
    begin
      AcaoTela := atConsultarHistoricoDesbloqueio;
    end;
  end;
  montaSelectMutuario := nil;
end;

procedure TfrmDesbloquearMutuario.DesbloquearMutuario;
var
  index : Integer;
  mutuarioItem : TListItem;
  mutuario : TMutuarioInfo;
  mutuarioMensagens : TStrings;
  totalMutuarioDesbloqueados,
  totalMutuariosNaoDesbloqueados : Integer;
  backupAnimateVisible : Boolean;
begin
  case AcaoTela of
    atDesbloquearMutuarioIndividual :  begin
                                         if (MsgDlg('Desbloquear o mutuário?', Application.Title, mtConfirmation, [mbYes, mbNO], 0) = mrYes) then
                                         begin
                                           mutuario := TMutuarioInfo.Create(Trim(edtMutuarioMatricula.Text), Trim(edtMutuarioNome.Text), edtDataLiquidacao.Text, edtValorLiquidacao.Text, edtMutuarioCPF.Text);
                                           try
                                             try
                                               if (mutuario.Status = []) then
                                               begin
                                                 if not(mutuario.Desbloqueado) then
                                                 begin
                                                   if (mutuario.DesbloquearMutuario()) then
                                                   begin
                                                     MsgDlg('Desbloqueio realizado com sucesso!', Application.Title, mtInformation, [mbOK],0);
                                                   end
                                                   else
                                                   begin
                                                     MsgDlg('Não foi possível realizar o desbloqueio!', Application.Title, mtError, [mbOK],0);
                                                   end;
                                                 end
                                                 else
                                                 begin
                                                   MsgDlg('Matrícula já consta no histórico de desbloqueio', Application.Title, mtInformation, [mbOK],0);
                                                 end;
                                               end
                                               else
                                               begin
                                                 mutuarioMensagens := TMutuarioInfo.ParseStatusToString(mutuario.Status);
                                                 try
                                                   MsgDlg(mutuarioMensagens.GetText, Application.Title, mtInformation, [mbOK],0);
                                                 finally
                                                   FreeAndNil(mutuarioMensagens);
                                                 end;
                                               end;
                                             except
                                               on e: EDBEngineError do
                                               begin
                                                 MostrarErro(E);
                                               end;
                                               on e: Exception do
                                               begin
                                                 MsgDlg(e.Message, Application.Title, mtInformation, [mbOK],0);
                                               end;
                                             end;
                                           finally
                                             FreeAndNil(mutuario);
                                           end;
                                         end;
                                       end;
    atDesbloquearMutuarioArquivo : begin
                                     totalMutuarioDesbloqueados := 0;
                                     totalMutuariosNaoDesbloqueados := 0;
                                     if (MsgDlg('Desbloquear mutuários importados do arquivo?', Application.Title, mtConfirmation, [mbYes, mbNO], 0) = mrYes) then
                                     begin
                                       frmAguarde.Max := lvMutuariosArquivo.Items.Count;
                                       frmAguarde.Pos := 1;
                                       frmAguarde.Mostra('Desbloqueando mutuários, Aguarde...');
                                       backupAnimateVisible := frmAguarde.Animate1.Visible;
                                       frmAguarde.Animate1.Visible := False;
                                       try
                                         for index := 0 to (lvMutuariosArquivo.Items.Count-1) do
                                         begin
                                           try
                                             mutuarioItem := lvMutuariosArquivo.Items[Index];
                                             if Assigned(mutuarioItem.Data) then
                                             begin
                                               mutuario := TMutuarioInfo(mutuarioItem.Data);
                                               if (mutuario.Desbloqueado)
                                               or (mutuario.Status <> []) then
                                               begin
                                                 if (mutuarioItem.Checked) then
                                                 begin
                                                   mutuarioItem.Checked := False;
                                                 end;
                                               end
                                               else
                                               begin
                                                 if (mutuarioItem.Checked) then
                                                 begin
                                                    try
                                                      if (mutuario.Status = []) then
                                                      begin
                                                        if not(mutuario.Desbloqueado) then
                                                        begin
                                                          if (mutuario.DesbloquearMutuario()) then
                                                          begin
                                                            mutuarioItem.ImageIndex := 2;
                                                            Inc(totalMutuarioDesbloqueados);
                                                          end
                                                          else
                                                          begin
                                                            Inc(totalMutuariosNaoDesbloqueados);
                                                          end;
                                                        end;
                                                      end;
                                                    except
                                                      on e: EDBEngineError do
                                                      begin
                                                        MostrarErro(E);
                                                      end;
                                                      on e: Exception do
                                                      begin
                                                        MsgDlg(e.Message, Application.Title, mtError, [mbOK],0);
                                                      end;
                                                    end;
                                                 end;
                                               end;
                                             end;
                                             frmAguarde.Pos := frmAguarde.Pos + 1;
                                           finally
                                             mutuario := nil;
                                             mutuarioItem := nil;
                                           end;
                                         end;
                                       finally
                                         frmAguarde.Animate1.Visible := backupAnimateVisible;
                                         frmAguarde.Apaga;
                                       end;
                                       try
                                         GerarLogHistoricoDesbloqueio();
                                       finally
                                         MsgDlg('Estatística deste debloqueio em lote'+#13+#10+#13+#10+'Total de Mutuários Desbloqueados: '+IntToStr(totalMutuarioDesbloqueados)+#13+#10+'Total de Mutuários NÃO Desbloqueados: '+IntToStr(totalMutuariosNaoDesbloqueados)+#13+#10+#13+#10+'Para maiores informações visualize o LOG.', Application.Title, mtInformation, [mbOK], 0);
                                       end;
                                     end;
                                   end;
  end;
end;

procedure TfrmDesbloquearMutuario.CancelarDesbloqueioMutuario;
begin
  if (MsgDlg('Limpar os dados de desbloqueio?', Application.Title, mtConfirmation, [mbYes, mbNO], 0) = mrYes) then
  begin
    AcaoTela := atDesbloquearMutuario;
  end;
end;

procedure TfrmDesbloquearMutuario.bbtnCancelarDesbloqueioClick(
  Sender: TObject);
begin
  CancelarDesbloqueioMutuario();
end;

procedure TfrmDesbloquearMutuario.bbtnDesbloqueiarMutuarioClick(
  Sender: TObject);
begin
  if (AcaoTela in [atDesbloquearMutuarioIndividual, atDesbloquearMutuarioArquivo]) then
  begin
    DesbloquearMutuario();
  end;
end;

procedure TfrmDesbloquearMutuario.BuscarHistoricoDesbloqueio;
var
  informouMatricula,
  informouPeriodo : Boolean;
begin
  informouMatricula := False;
  informouPeriodo := False;

  if (qryHistoricoDesbloqueio.Active) then
  begin
    qryHistoricoDesbloqueio.Close;
  end;
  with qryHistoricoDesbloqueio do
  begin
    SQL.Clear;
    SQL.Add('SELECT HD.matricula,');
    SQL.Add('       HD.dataliquid,');
    SQL.Add('       HD.nome,');
    SQL.Add('       HD.valliquid,');
    SQL.Add('       HD.cpf,');
    SQL.Add('       HD.idusuario,');
    SQL.Add('       HD.datadesbloqueio');
    SQL.Add('  FROM histdesbloqueio HD');
    SQL.Add(' WHERE 0=0');

    qryHistoricoDesbloqueio.Params.Clear;
    if (Trim(edtMutuarioMatricula.Text) <> EmptyStr) then
    begin
      informouMatricula := True;
      SQL.Add('   AND HD.matricula = '+QuotedStr(Trim(edtMutuarioMatricula.Text)));
    end;

    if (Trim(edtHistoricoDataInicial.Text) <> EmptyStr)
    or (Trim(edtHistoricoDataFinal.Text) <> EmptyStr) then
    begin
      if (Trim(edtHistoricoDataInicial.Text) = EmptyStr)
      or (Trim(edtHistoricoDataFinal.Text) = EmptyStr) then
      begin
        MsgDlg('Informe corretamente o período de datas para efetuar pesquisa!', Application.Title, mtInformation, [mbOK], 0);
        edtHistoricoDataInicial.SetFocus;
        Exit;
      end
      else
      begin
        if (edtHistoricoDataInicial.Date > edtHistoricoDataFinal.Date) then
        begin
          MsgDlg('Data final do período deve ser maior que inicial!', Application.Title, mtInformation, [mbOK], 0);
          edtHistoricoDataInicial.SetFocus;
          Exit;
        end
        else
        begin
          informouPeriodo := True;
          SQL.Add('   AND HD.dataliquid BETWEEN TO_DATE('+QuotedStr(Trim(edtHistoricoDataInicial.Text))+', ''DD/MM/YYYY'') AND TO_DATE('+QuotedStr(Trim(edtHistoricoDataFinal.Text))+', ''DD/MM/YYYY'')');
        end;
      end;
    end;
  end;
  if not(informouMatricula) and not(informouPeriodo) then
  begin
    MsgDlg('Informe mutuário e/ou período de datas para realizar pesquisa!', Application.Title, mtInformation, [mbOK], 0);
  end
  else
  begin
    qryHistoricoDesbloqueio.Open;
    if (qryHistoricoDesbloqueio.IsEmpty) then
    begin
      MsgDlg('Nenhum registro encontrado para os parâmetros informados!', Application.Title, mtInformation, [mbOK], 0);
    end;
  end;
end;

procedure TfrmDesbloquearMutuario.btnBuscarHistoricoDesbloqueioClick(Sender: TObject);
begin
  if (AcaoTela = atConsultarHistoricoDesbloqueio) then
  begin
    BuscarHistoricoDesbloqueio();
  end;
end;

procedure TfrmDesbloquearMutuario.dsHistoricoDesbloqueioStateChange(
  Sender: TObject);
begin
  inherited;
  pnlNenhumHistoricoDesbloqueio.Visible := not(dsHistoricoDesbloqueio.DataSet.Active) or (dsHistoricoDesbloqueio.DataSet.IsEmpty);
  if (dsHistoricoDesbloqueio.DataSet.Active) then
  begin
    stsHistoricoDesbloqueio.Panels[0].Text := IntToStr(dsHistoricoDesbloqueio.DataSet.RecordCount)+' registro(s) encontrado(s).';
  end
  else
  begin
    stsHistoricoDesbloqueio.Panels[0].Text := EmptyStr;
  end;
end;

procedure TfrmDesbloquearMutuario.GerarLogHistoricoDesbloqueio;
var
  index : Integer;
  mutuario : TMutuarioInfo;
  mutuarioItem : TListItem;
  mensagemLog : String;
  arquivoLogDesbloqueio : TStrings;
  nomeArquivoLogDesbloqueio : String;
begin
  nomeArquivoLogDesbloqueio :=  ChangeFileExt(Trim(edtArquivoMutuarioCSV.Text), '.log');
  arquivoLogDesbloqueio := TStringList.Create();
  arquivoLogDesbloqueio.Clear;
  try
    for index := 0 to (lvMutuariosArquivo.Items.Count-1) do
    begin
      mensagemLog := EmptyStr;
      try
        mutuarioItem := lvMutuariosArquivo.Items[Index];
        if Assigned(mutuarioItem.Data) then
        begin
          mutuario := TMutuarioInfo(mutuarioItem.Data);
          mensagemLog := mutuario.LinhaRecebidaArquivo;
          if (mutuario.Status <> []) then
          begin
            if (mutuario.LinhaRecebidaArquivo[Length(mutuario.LinhaRecebidaArquivo)] <> ';') then
            begin
              mensagemLog := Concat(mensagemLog, ';', TMutuarioInfo.ParseStatusToString(mutuario.Status).CommaText);
            end
            else
            begin
              mensagemLog := Concat(mensagemLog, TMutuarioInfo.ParseStatusToString(mutuario.Status).CommaText);
            end;
            if (not(mutuario.Desbloqueado)) then
            begin
              mensagemLog := Concat(mensagemLog, ';', 'Matrícula não desbloqueada', ';');
            end;
          end
          else
          begin
            if (not(mutuario.Desbloqueado)) then
            begin
              mensagemLog := Concat(mensagemLog, ';', 'Matrícula não desbloqueada', ';');
            end
            else
            begin
              mensagemLog := EmptyStr;
            end;
          end;
          if (Trim(mensagemLog) <> EmptyStr) then
          begin
            mensagemLog := Concat(mensagemLog, ';');
            mensagemLog := StringReplace(mensagemLog, ';;', ';', [rfReplaceAll]);
            mensagemLog := StringReplace(mensagemLog, '"', '', [rfReplaceAll]);
            arquivoLogDesbloqueio.Add(mensagemLog);
          end;
        end;
      finally
        mutuario := nil;
        mutuarioItem := nil;
      end;
    end;
    arquivoLogDesbloqueio.SaveToFile(nomeArquivoLogDesbloqueio);
  finally
    FreeAndNil(arquivoLogDesbloqueio);
  end;
end;

procedure TfrmDesbloquearMutuario.lvMutuariosArquivoDblClick(
  Sender: TObject);
begin
  ExibirInformacoesMatricula();
end;

procedure TfrmDesbloquearMutuario.ExibirInformacoesMatricula;
var
  mutuarioMensagens : TStrings;
begin
 if Assigned(lvMutuariosArquivo.Selected) then
 begin
   with TMutuarioInfo(lvMutuariosArquivo.Selected.Data) do
   begin
     mutuarioMensagens := TMutuarioInfo.ParseStatusToString(Status);
     try
       if (mutuarioMensagens.Count > 0) then
       begin
         MsgDlg('Mensagens para esta matrícula:'+#13+#10+#13+#10+mutuarioMensagens.GetText, Application.Title, mtInformation, [mbOK], 0);
       end;
     finally
       FreeAndNil(mutuarioMensagens);
     end;
   end;
 end;
end;

procedure TfrmDesbloquearMutuario.btnInformacoesMatriculaClick(
  Sender: TObject);
begin
  ExibirInformacoesMatricula();
end;

procedure TfrmDesbloquearMutuario.lvMutuariosArquivoClick(Sender: TObject);
var
  mutuarioMensagens : TStrings;
begin
 if Assigned(lvMutuariosArquivo.Selected) then
 begin
   with TMutuarioInfo(lvMutuariosArquivo.Selected.Data) do
   begin
     if (lvMutuariosArquivo.Selected.Checked) and (Status <> []) then
     begin
       lvMutuariosArquivo.Selected.Checked := False;
       mutuarioMensagens := TMutuarioInfo.ParseStatusToString(Status);
       try
         if (mutuarioMensagens.Count > 0) then
         begin
           MsgDlg('Não é possível selecionar esta matrícula'+#13+#10+'Mensagens para esta matrícula:'+#13+#10+#13+#10+mutuarioMensagens.GetText, Application.Title, mtInformation, [mbOK], 0);
         end;
       finally
         FreeAndNil(mutuarioMensagens);
       end;
     end;
   end;
 end;
end;

function TfrmDesbloquearMutuario.ValidarLinha(ALinha: String): Boolean;
const
  CARACTER_SEPARADOR = ';';
  MINIMO_SEPARADORES = 4;
  MAXIMO_SEPARADORES = 5;
var
  index,
  contador : Integer;
begin
  contador := 0;
  for index := 1 to Length(ALinha) do
  begin
    if (Alinha[index] = CARACTER_SEPARADOR) then
    begin
      Inc(contador, 1);
    end;
  end;
  Result := (contador >= MINIMO_SEPARADORES) and (contador <= MAXIMO_SEPARADORES);
end;

procedure TfrmDesbloquearMutuario.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  LimparListaEntradaArquivo;
end;

end.
