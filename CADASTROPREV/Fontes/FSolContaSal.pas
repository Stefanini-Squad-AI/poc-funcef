unit FSolContaSal;

// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    : Helio Lima Custodio
// Data        : 14/11/2014
// Pendência   : SOL 230367.16434 PPM 491155
// Form        : Aumento do campo e field MOTIVORECUSA para 118
// Alteração   : Incluir restricao quando houver mesmo cpf em outro beneficio,
//               em dbgrdContas, deve mostrar o responsavel se houver um.
// *****************************************************************************
// Autor(a)    : Felipe A. Santos
// Data        : 23/05/2014
// Pendência   : SOL 231979 PPM 393356  
// Alteração   : correção do erro acess violation, por conta de o campo Estado
//               civil estar vazio.
// *****************************************************************************
// Autor(a)    : Higor Nayde
// Data        : 28/03/2013
// Pendência   : SOL 201126 Kintana 1947118
// Alteração   : A critica para verificar se já existe conta salario deve
// observar apenas se os três primeiros dígitos das contas é igual a 037.
// *****************************************************************************
// Autor(a)    : Felipe A. Santos
// Data        : 14/11/2013
// Pendência   : SOL 201126 Kintana 1947118
// Alteração   : Criação da funcionalidade.
// *****************************************************************************

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, TB97Ctls, ImgList, Grids, Wwdbigrd, Wwdbgrid,
  Db, DBTables, Wwquery, uFuncoesUteis, CmEventosCadastro, ComObj, uSistema,

  dBaseDados; //Helio - SOL Nº 230367-16434 PPM Nº 491155

type
  // tipos para construção do arquivo excel
  TAlinhamento = (xlNone, xlLeft, xlCenter, xlRight);
  TBordas = (xlEdgeBottom, xlEdgeLeft, xlEdgeRight, xlEdgeTop, xlInsideVerical, xlInsideHorizontal);

  TCabecalhoExcel = record
    Valor : string;
    Col : integer;
    ColWidth : integer;
    Lin : integer;
  end;

  TfrmSolContaSal = class(TfrmOkCancelar)
    Dock972: TDock97;
    Toolbar971: TToolbar97;
    sbtnProcurar: TToolbarButton97;
    Dock973: TDock97;
    Toolbar972: TToolbar97;
    sbtnExcluiDet: TToolbarButton97;
    sbtnAltDet: TToolbarButton97;
    imlPadrao: TImageList;
    dbgrdContas: TwwDBGrid;
    qryDados: TwwQuery;
    updDados: TUpdateSQL;
    dsDados: TDataSource;
    chkSel: TCheckBox;
    qryEndPess: TwwQuery;
    qryCidades: TwwQuery;
    qryDocPessoa: TwwQuery;
    qryCargoExt: TwwQuery;
    qryEndPessCIDADE: TStringField;
    qryEndPessCODESTADO: TStringField;
    qryEndPessLOGRADOURO: TStringField;
    qryEndPessBAIRRO: TStringField;
    qryEndPessCEP: TStringField;
    qryEndPessIDCIDADES: TFloatField;
    qryDocPessoaORGAO: TStringField;
    qryDocPessoaNUMDOCUMENTO: TStringField;
    qryDocPessoaESTADOEMISSAO: TStringField;
    qryDocPessoaDATAEMISSAO: TDateTimeField;
    qryEndPessIDENDERECO: TFloatField;
    qryTelEndPess: TwwQuery;
    qryTelEndPessDDD: TStringField;
    qryTelEndPessNUMERO: TStringField;
    qryAgenciaBancaria: TwwQuery;
    qryCidadesUFNASCIMENTO: TStringField;
    qryCidadesCIDADENASCIMENTO: TStringField;
    qryCargoExtCARGO: TStringField;
    qryAgenciaBancariaNUMAGENCIA: TStringField;
    qryAgenciaBancariaNUMBANCO: TStringField;
    qryDadosMATRICULA: TStringField;
    qryDadosCPF: TStringField;
    qryDadosNOMECOMPLETO: TStringField;
    qryDadosNOMEREDUZIDO: TStringField;
    qryDadosPIS: TStringField;
    qryDadosCARTEIRATRABALHO: TStringField;
    qryDadosDATANASC: TDateTimeField;
    qryDadosCIDADENASCIMENTO: TStringField;
    qryDadosUFNASCIMENTO: TStringField;
    qryDadosDESCESTCIVIL: TStringField;
    qryDadosNOMECONJUGE: TStringField;
    qryDadosNOMEPAI: TStringField;
    qryDadosNOMEMAE: TStringField;
    qryDadosSEXO: TStringField;
    qryDadosRG: TStringField;
    qryDadosORGAO: TStringField;
    qryDadosESTADOEMISSAO: TStringField;
    qryDadosDATAEMISSAO: TStringField;
    qryDadosCARGO: TStringField;
    qryDadosENDERECO: TStringField;
    qryDadosBAIRRO: TStringField;
    qryDadosCIDADE: TStringField;
    qryDadosUF: TStringField;
    qryDadosCEP: TStringField;
    qryDadosDDD: TStringField;
    qryDadosTELEFONE: TStringField;
    qryDadosEMAIL: TStringField;
    qryDadosRENDAVALOR: TFloatField;
    qryDadosBANCO: TStringField;
    qryDadosAGENCIA: TStringField;
    qryDadosDV: TStringField;
    qryDadosDESCGRINSTR: TStringField;
    qryHistRubSal: TwwQuery;
    qryHistRubSalRENDA: TFloatField;
    qryResp: TwwQuery;
    qryAux: TwwQuery;
    cmeDados: TCmEventosCadastro;
    qryValContaSal: TwwQuery;
    qryContaPref: TwwQuery;
    qryDadosCONTA: TStringField;
    qryDadosSEL: TFloatField;
    qryDadosIDPESSOA: TFloatField;
    qryDadosNUMSEQUENCIA: TFloatField;
    qryDadosESTCIVIL: TStringField;
    qryDadosIDCARGOEXT: TFloatField;
    qryDadosIDGRINSTR: TFloatField;
    qryColsExcel: TwwQuery;
    qryColsExcelNOMECOMPLETO: TStringField;
    qryColsExcelNOMEREDUZIDO: TStringField;
    qryColsExcelCPF: TStringField;
    qryColsExcelPIS: TStringField;
    qryColsExcelCARTEIRATRABALHO: TStringField;
    qryColsExcelDATANASC: TStringField;
    qryColsExcelCIDADENASCIMENTO: TStringField;
    qryColsExcelUFNASCIMENTO: TStringField;
    qryColsExcelDESCESTCIVIL: TStringField;
    qryColsExcelNOMECONJUGUE: TStringField;
    qryColsExcelNOMEPAI: TStringField;
    qryColsExcelNOMEMAE: TStringField;
    qryColsExcelSEXO: TStringField;
    qryColsExcelRG: TStringField;
    qryColsExcelORGAO: TStringField;
    qryColsExcelESTADOEMISSAO: TStringField;
    qryColsExcelDATAEMISSAO: TStringField;
    qryColsExcelCARGO: TStringField;
    qryColsExcelDATAADMISSAO: TStringField;
    qryColsExcelENDERECO: TStringField;
    qryColsExcelBAIRRO: TStringField;
    qryColsExcelCIDADE: TStringField;
    qryColsExcelUF: TStringField;
    qryColsExcelCEP: TStringField;
    qryColsExcelDDD: TStringField;
    qryColsExcelTELEFONE: TStringField;
    qryColsExcelEMAIL: TStringField;
    DESCGRINSTR: TStringField;
    qryColsExcelRENDAVALOR: TStringField;
    qryColsExcelBANCO: TStringField;
    qryColsExcelAGENCIA: TStringField;
    qryColsExcelCONTA: TStringField;
    qryColsExcelDV: TStringField;
    qryDadosMOTIVORECUSA: TStringField;
    qryContaPrefIDCBANCARIA: TFloatField;
    qryContaPrefCONTACORRENTE: TStringField;
    qryContaPrefIDAGENCIA: TFloatField;
    qryContaPrefFLGCONTAPREF: TFloatField;
    qryContaPrefIDPESSOA: TFloatField;
    qryContaPrefTIPOCONTA: TStringField;
    qryContaPrefTRGDTINCLUSAO: TDateTimeField;
    qryContaPrefTRGUSERINCLUSAO: TStringField;
    qryContaPrefFLGCONTACONJUNTA: TStringField;
    qryContaPrefTRGDTALTERACAO: TDateTimeField;
    qryContaPrefTRGUSERALTERACAO: TStringField;
    qryContaPrefFLGCONTARESGATE: TFloatField;
    qryContaPrefIDTITULAR: TFloatField;
    qryContaPrefFLGCONTAINATIVA: TStringField;
    qryContaPrefCODSUREG: TFloatField;
    qryContaPrefDVUNIDADE: TFloatField;
    qryContaPrefDVCOMERCIAL: TFloatField;
    qryContaPrefDTCRIACAO: TDateTimeField;
    qryContaPrefDATAFIM: TDateTimeField;
    qryElegPatro: TwwQuery;
    qryDepentit: TwwQuery;
    qryDadosDATAADMISSAO: TStringField;
    qryDocPessoaIDESTADO: TFloatField;
    procedure sbtnProcurarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure chkSelClick(Sender: TObject);
    procedure cmeDadosFind(Sender: TObject);
    procedure cmeDadosDelete(Sender: TObject);
    procedure sbtnExcluiDetClick(Sender: TObject);
    procedure cmeDadosAtualizaBotoes(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure sbtnAltDetClick(Sender: TObject);
    procedure cmeDadosEdit(Sender: TObject);
    procedure dbgrdContasRowChanged(Sender: TObject);
    procedure dbgrdContasCalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont;
      ABrush: TBrush);
    procedure qryDadosAfterPost(DataSet: TDataSet);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure qryDadosSELChange(Sender: TField);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure cmeDadosCancel(Sender: TObject);
  private
    //******* OBJETOS ********
    FArqExcel, FSheetContas : OleVariant;
    lCamposEmBranco : TStringList;
    vCabecalho : array of TCabecalhoExcel;

    //****** VARIAVEIS ********
    iIdPessoa : integer;
    bTemMotivoRecusa : boolean;

    // ******* CAMPOS *******
    FNumRegSelecionados : integer;

    FNomeReduzido : string;
    FPIS: string;
    FCarteiraTrabalho: string;
    FCPF: string;
    FDescEstCivil: string;
    FRG: string;
    FAgenciaPreferencial : string;
    FConta: string;
    FDV: string;
    FDescGrInstr: string;
    FMotivoRecusa: string;
    FNomeArquivo: string;
    FPathExcel : string;
    FUFdoRG: string;

    //******* ROTINAS ********

    function BuscaCPFResp : string;
    function BuscaConjuge : string;
    function BuscaUFdoRG(pIdEstado : integer) : string;
    function ValidaRegistro : boolean;
    function AlinharCelula(Alinhamento : TAlinhamento) : integer;
    function Borda(Posicao : TBordas) : integer;
    function SelReg : boolean;

    procedure ColocarBorda(Range : string; Sheet : OleVariant);
    procedure MontarArquivoExcel;
    procedure FieldsReadOnly(pBol : boolean);
    procedure CamposDeveSerNulos; 

    function GetNomeReduzido: string;
    function GetCarteiraTrabalho: string;
    function GetCPF: string;
    function GetPIS: string;
    function GetDescEstCivil: string;
    function GetRG: string;
    function GetContaPreferencial: string;
    function GetDVPreferencial: string;
    function GetDescGrInstr: string;
    function GetNumRegSelecionados: integer;
    function GetAgenciaPreferencial: string;

    //Helio - SOL Nº 230367-16434 PPM Nº 491155
    function TemContaSalOutroBenef(pCPF : String): Boolean;
    procedure RemoveLinhasRepetidas(pQry : TwwQuery);
    //FIM Helio - SOL Nº 230367-16434 PPM Nº 491155

  public
    { Public declarations }

    property NomeReduzido : string read GetNomeReduzido;
    property CPF : string read GetCPF write FCPF;
    property RG : string read GetRG write FRG;
    property CarteiraTrabalho : string read GetCarteiraTrabalho write FCarteiraTrabalho;
    property PIS : string read GetPIS write FPIS;
    property DescEstCivil : string read GetDescEstCivil write FDescEstCivil;
    property DescGrInst : string read GetDescGrInstr write FDescGrInstr;
    property AgenciaPreferencial : string read GetAgenciaPreferencial;
    property ContaPreferencial : string read GetContaPreferencial;
    property DVPreferencial : string read GetDVPreferencial;
    property MotivoRecusa : string read FMotivoRecusa write FMotivoRecusa;
    property ArqExcel : OleVariant read FArqExcel write FArqExcel;
    property SheetContas : OleVariant read FSheetContas write FSheetContas;
    property NomeArquivo : string read FNomeArquivo write FNomeArquivo;
    property PathExcel : string read FPathExcel write FPathExcel;
    property NumRegSelecionados : integer read GetNumRegSelecionados;
    property UFdoRG : string read FUFdoRG write FUFdoRG;
  end;

var
  frmSolContaSal: TfrmSolContaSal;

implementation

uses FEmailContasSol, FTelaAut;

const
  MsgValPossuiContas = 'Usuário Já possui Conta preferencial e já possui conta 037 (Conta Salário) cadastrada';
  MsgValContaSal     = 'Usuário já possui conta 037 (Conta Salário)';
  MsgValContaPref    = 'Usuário não possui conta preferencial cadastrada';
  MsgValContaVinDifContaPref = 'Conta vinculada diferente da conta preferencial';

  //Helio - SOL Nº 230367-16434 PPM Nº 491155
  MsgContCPFOutroBenef = 'Usuário Já possui Conta preferencial e já possui conta 037 (Conta Salário) cadastrada NO MESMO CPF em outro benefício';

  CinzaClaro = 15;
  CinzaEscuro = 16;
  EstiloLinha = 1;
  TamanhoBorda = 1;
  NumLinCabecalho = 4;
  RangeCabecalho = 'A4:AG4';
  ColIni = 'A';
  ColFin = 'AG';

{$R *.DFM}

procedure TfrmSolContaSal.sbtnProcurarClick(Sender: TObject);
begin
  inherited;
  FieldsReadOnly(False);
  cmeDados.Find(Self);
  FieldsReadOnly(True);
end;

procedure TfrmSolContaSal.FormCreate(Sender: TObject);
begin
  inherited;
  qryDados.DisableControls;
  qryDados.Close;
  qryDados.ParamByName('FLGSOLICITACONTASALARIO').AsInteger := -1;
  qryDados.Open;
  qryDados.EnableControls;

  lCamposEmBranco := TStringList.Create;
  CamposDeveSerNulos;

  FieldsReadOnly(True); // atribuindo readonly para todos os fields menos a seleção
  cmeDados.AtualizaBotoes(Self);
end;

procedure TfrmSolContaSal.chkSelClick(Sender: TObject);
var
   iSel : integer;
   BM : TBookMark;
begin
  inherited;
  BM := qryDados.GetBookmark;
  qryDados.DisableControls;
  qryDados.First;

  if chkSel.Checked then
     iSel := 1
  else
     iSel := 0;

  while not(qryDados.Eof) do
  begin
    dbgrdContasRowChanged(Self);
    if not(bTemMotivoRecusa) then
    begin
      qryDados.Edit;
      qryDados.FieldByName('SEL').AsInteger := iSel;
    end;
    qryDados.Next;
  end;

  qryDados.GotoBookmark(BM);
  qryDados.EnableControls;
end;

function TfrmSolContaSal.GetNomeReduzido: string;
begin
  FNomeReduzido := qryDadosNOMECOMPLETO.AsString;

  // faz o tratamento de abreviações no nome
  if (Length(FNomeReduzido) > 33) then
  begin
     FNomeReduzido := AbreviaNome(FNomeReduzido);
  end;

  Result := FNomeReduzido;
end;

function TfrmSolContaSal.GetCPF: string;
begin
  FCPF := RetiraCaracteresDaString(FCPF); // deixa somente números
  Result := FCPF;
end;

function TfrmSolContaSal.GetPIS: string;
begin
  FPIS := RetiraCaracteresDaString(FPIS); // deixa somente números
  Result := FPIS;
end;

function TfrmSolContaSal.GetCarteiraTrabalho: string;
begin
  FCarteiraTrabalho := RetiraCaracteresDaString(FCarteiraTrabalho); // deixa somente números
  Result := FCarteiraTrabalho;
end;

function TfrmSolContaSal.GetDescEstCivil: string;
begin
  if FDescEstCivil = '' then // Felipe A. Santos - SOL 229783/16102 PPM 391537
     FDescEstCivil := ' ';

  if FDescEstCivil  = 'S' then
     FDescEstCivil := 'Solteiro'
  else if FDescEstCivil = 'C' then
     FDescEstCivil := 'Casado com comunhão parcial'
  else if FDescEstCivil[1] in ['D', 'E'] then
     FDescEstCivil := 'Divorciado'
  else if FDescEstCivil[1] in ['J', 'P'] then
     FDescEstCivil := 'Separado'
  else if FDescEstCivil = 'V' then
     FDescEstCivil := 'Viúvo';

  Result := FDescEstCivil;
end;

function TfrmSolContaSal.GetRG: string;
begin
  FRG := RetiraCaracteresDaString(FRG);
  Result := FRG;
end;

function TfrmSolContaSal.GetContaPreferencial: string;
begin
  FConta := Copy(qryContaPrefCONTACORRENTE.AsString, 1 , (Length(qryContaPrefCONTACORRENTE.AsString) - 1));
  Result := FConta;
end;

function TfrmSolContaSal.GetDVPreferencial: string;
begin
  FDV := Copy(qryContaPrefCONTACORRENTE.AsString, Length(qryContaPrefCONTACORRENTE.AsString)  , 1);
  Result := FDV;
end;

function TfrmSolContaSal.GetDescGrInstr: string;
begin
  if FDescGrInstr = '1' then
     FDescGrInstr := 'Ignorado'
  else if FDescGrInstr = '4' then
     FDescGrInstr := '1ºgrau incompleto'
  else if FDescGrInstr = '5' then
     FDescGrInstr := '1ºgrau completo'
  else if FDescGrInstr = '6' then
     FDescGrInstr := '2ºgrau incompleto'
  else if FDescGrInstr = '7' then
     FDescGrInstr := '2ºgrau completo'
  else if FDescGrInstr = '8' then
     FDescGrInstr := '3ºgrau incompleto'
  else if FDescGrInstr = '9' then
     FDescGrInstr := '3ºgrau completo'
  else if FDescGrInstr = '10' then
     FDescGrInstr := 'Especialização, Mestrado, Doutorado';

  Result := FDescGrInstr;
end;

function TfrmSolContaSal.BuscaCPFResp: string;
var
   sSQL : string;
begin
  try
    sSQL := 'SELECT NUMDOCUMENTO FROM PESSOA WHERE IDPESSOA = :IDPESSOA';

    qryAux.Close;
    qryAux.SQL.Clear;
    qryAux.SQL.Add(sSQL);
    qryAux.ParamByName('IDPESSOA').AsInteger := qryResp.FieldByName('IDRESPONSAVEL').AsInteger;
    qryAux.Open;

    Result := qryAux.FieldbyName('NUMDOCUMENTO').AsString;
  finally
    qryAux.Close;
  end;
end;

procedure TfrmSolContaSal.cmeDadosFind(Sender: TObject);
var
    //Helio - SOL Nº 230367-16434 PPM Nº 491155
    ii : Integer;
    nomeCampo : String;
    //FIM Helio - SOL Nº 230367-16434 PPM Nº 491155
begin
  inherited;
  try
    qryDados.DisableControls;
    qryDados.Close;
    qryDados.ParamByName('FLGSOLICITACONTASALARIO').AsInteger := 1;
    qryDados.Open;
    qryDados.First;

    // atribuindo dados para qryDados de outras queries
    {obs: alguns valores atribui a propriedades para receberem tratamentos no metodo read}
    while not(qryDados.Eof) do
    begin
         //Helio - SOL Nº 230367-16434 PPM Nº 491155
         //caso tenha um responsavel
         //todos os dados devem vir do responsavel
         qryResp.Close;
         qryResp.ParamByName('IDPESSOA').AsInteger := qryDados.FieldByName('IDPESSOA').AsInteger;
         qryResp.Open;

         if not(qryResp.IsEmpty) then
         begin
            qryAux.Close;
            qryAux.SQL.Text := StringReplace(qryDados.SQL.Text, '(PF.FLGSOLICITACONTASALARIO = :FLGSOLICITACONTASALARIO)', '', [rfReplaceAll]);
            qryAux.SQL.Text := StringReplace(qryAux.SQL.Text, 'AND (PF.DTSOLICITACONTASALARIO IS NULL)', '(PF.DTSOLICITACONTASALARIO IS NULL)', [rfReplaceAll]);
            qryAux.SQL.Text := 'SELECT * FROM ( ' +
                                   qryAux.SQL.Text +
                                ' ) WHERE IDPESSOA = ' + qryResp.FieldByName('IDRESPONSAVEL').AsString;

            qryAux.Open;


            qryDados.Edit;
            for ii :=1 to qryDados.Fields.Count - 1 do
            begin
               nomeCampo := qryDados.Fields[ii].FieldName;
               qryDados.FieldByName(nomeCampo).AsString := qryAux.FieldByName(nomeCampo).AsString;
            end;

            qryDados.Post;
            qryAux.Close;
         end;
         //FIM Helio - SOL Nº 230367-16434 PPM Nº 491155

         iIdPessoa := qryDados.FieldByName('IDPESSOA').AsInteger;
         MotivoRecusa := '';

         qryDepentit.Close;
         qryDepentit.ParamByName('IDPESSOA').AsInteger := iIdPessoa;
         qryDepentit.Open;

         qryElegPatro.Close;
         qryElegPatro.ParamByName('IDPESSOA').AsInteger := iIdPessoa;
         qryElegPatro.Open;

         qryDados.Edit;
         qryDadosIDCARGOEXT.AsInteger := qryElegPatro.FieldByName('IDCARGOEXT').AsInteger;
         qryDados.Post;

         qryEndPess.Close;
         qryEndPess.ParamByName('IDPESSOA').AsInteger := iIdPessoa;
         qryEndPess.Open;

         qryCidades.Close;
         qryCidades.ParamByName('IDCIDADES').AsInteger := qryEndPessIDCIDADES.AsInteger;
         qryCidades.Open;

         qryDocPessoa.Close;
         qryDocPessoa.ParamByName('IDPESSOA').AsInteger := iIdpessoa;
         qryDocPessoa.ParamByName('IDDOCUMENTO').AsInteger := 6; // 6 PIS
         qryDocPessoa.Open;

         PIS := qryDocPessoa.FieldByName('NUMDOCUMENTO').AsString;

         qryDocPessoa.Close;
         qryDocPessoa.ParamByName('IDPESSOA').AsInteger := iIdpessoa;
         qryDocPessoa.ParamByName('IDDOCUMENTO').AsInteger := 9; // 9 Carteira de trabalho
         qryDocPessoa.Open;

         CarteiraTrabalho := qryDocPessoa.FieldByName('NUMDOCUMENTO').AsString;

         qryDocPessoa.Close;
         qryDocPessoa.ParamByName('IDPESSOA').AsInteger := iIdpessoa;
         qryDocPessoa.ParamByName('IDDOCUMENTO').AsInteger := 11; // 11 carteira de identidade
         qryDocPessoa.Open;

         UFdoRG := BuscaUFdoRG(qryDocPessoaIDESTADO.AsInteger);
         RG := qryDocPessoaNUMDOCUMENTO.AsString;
         CPF := qryDadosCPF.AsString;
         DescEstCivil := qryDados.FieldByName('ESTCIVIL').AsString;
         DescGrInst := qryDados.FieldByName('IDGRINSTR').AsString;

         qryTelEndPess.Close;
         qryTelEndPess.ParamByName('IDENDERECO').AsInteger := qryEndPessIDENDERECO.AsInteger;
         qryTelEndPess.Open;

         qryCargoExt.Close;
         qryCargoExt.ParamByName('IDCARGOEXT').AsInteger := qryDados.FieldByName('IDCARGOEXT').AsInteger;
         qryCargoExt.Open;

         qryContaPref.Close;
         qryContaPref.ParamByName('IDPESSOA').AsInteger := iIdPessoa;
         qryContaPref.Open;

         qryAgenciaBancaria.Close;
         qryAgenciaBancaria.ParamByName('IDPESSOA').AsInteger := qryContaPrefIDAGENCIA.AsInteger;
         qryAgenciaBancaria.Open;

         qryHistRubSal.Close;
         qryHistRubSal.ParamByName('IDPESSOA').AsInteger := iIdPessoa;
         qryHistRubSal.ParamByName('IDRUBRICA').AsInteger := 32476; //salário bruto
         qryHistRubSal.Open;

         //Helio - SOL Nº 230367-16434 PPM Nº 491155
         //comenta
         // verifica se o recebedor é o responsável
         {qryResp.Close;
         qryResp.ParamByName('IDPESSOA').AsInteger := iIdPessoa;
         qryResp.Open;

         // se o recedor é o responsável utiliza o CPF do mesmo
         if not(qryResp.IsEmpty) then
         begin
              CPF := BuscaCPFResp;
         end;}
         //Helio - SOL Nº 230367-16434 PPM Nº 491155

         ValidaRegistro; // verifica se o registro tem algum motivo de recusa

         qryDados.Edit;
         qryDadosNUMSEQUENCIA.AsInteger := qryDepentit.FieldByName('NUMSEQUENCIA').AsInteger;
         qryDadosMATRICULA.AsString := qryDepentit.FieldByName('MATRICULA').AsString;
         qryDadosNOMEREDUZIDO.AsString := NomeReduzido;
         qryDadosNOMECONJUGE.AsString := BuscaConjuge;
         qryDadosCPF.AsString := CPF;
         qryDadosPIS.AsString := PIS;
         qryDadosCARTEIRATRABALHO.AsString := CarteiraTrabalho;
         qryDadosCIDADENASCIMENTO.AsString := qryCidadesCIDADENASCIMENTO.AsString;
         qryDadosUFNASCIMENTO.AsString := qryCidadesUFNASCIMENTO.AsString;
         qryDadosDESCESTCIVIL.AsString := DescEstCivil;
         qryDadosDESCGRINSTR.AsString := DescGrInst;
         qryDadosRG.AsString := RG;
         qryDadosORGAO.AsString := qryDocPessoaORGAO.AsString;
         qryDadosESTADOEMISSAO.AsString := UFdoRG;
         qryDadosDATAEMISSAO.AsString := FormatDateTime('dd/mm/yyyy', qryDocPessoaDATAEMISSAO.AsDateTime);
         qryDadosCARGO.AsString := qryCargoExtCARGO.AsString;
         qryDadosDATAADMISSAO.AsString := qryElegPatro.FieldByName('DATAADMISSAO').AsString;
         qryDadosENDERECO.AsString := qryEndPessLOGRADOURO.AsString;
         qryDadosBAIRRO.AsString := qryEndPessBAIRRO.AsString;
         qryDadosCIDADE.AsString := qryEndPessCIDADE.AsString;
         qryDadosCEP.AsString := qryEndPessCEP.AsString;
         qryDadosUF.AsString := qryEndPessCODESTADO.AsString;
         qryDadosDDD.AsString := qryTelEndPessDDD.AsString;
         qryDadosTELEFONE.AsString := qryTelEndPessNUMERO.AsString;
         qryDadosRENDAVALOR.AsFloat := Round(qryHistRubSalRENDA.AsFloat);
         qryDadosBANCO.AsString := qryAgenciaBancariaNUMBANCO.AsString;
         qryDadosAGENCIA.AsString := AgenciaPreferencial;
         qryDadosCONTA.AsString := ContaPreferencial;
         qryDadosDV.AsString := DVPreferencial;
         qryDadosMOTIVORECUSA.AsString := MotivoRecusa;
         qryDados.Post;
         qryDados.Next;
    end;

    RemoveLinhasRepetidas(qryDados); //Helio - SOL Nº 230367-16434 PPM Nº 491155
    qryDados.First;
    qryDados.EnableControls;
    sbtnProcurar.Down := False;
  finally
    qryElegPatro.Close;
    qryDepentit.Close;
    qryEndPess.Close;
    qryCidades.Close;
    qryDocPessoa.Close;
    qryCargoExt.Close;
    qryTelEndPess.Close;
    qryHistRubSal.Close;
    qryResp.Close;
    qryContaPref.Close;
    qryAux.Close; //Helio - SOL Nº 230367-16434 PPM Nº 491155

    bTemMotivoRecusa := (Trim(qryDadosMOTIVORECUSA.AsString) <> '');
    cmeDados.AtualizaBotoes(Self);
  end;
end;

function TfrmSolContaSal.ValidaRegistro: boolean;
begin
   try
      Result := False;

      qryValContaSal.Close;
      qryValContaSal.ParamByName('IDPESSOA').AsInteger := iIdPessoa;
      qryValContaSal.Open;


      //Helio - SOL Nº 230367-16434 PPM Nº 491155
      if TemContaSalOutroBenef(qryDados.FieldByName('CPF').AsString) then
      begin
         MotivoRecusa := MsgContCPFOutroBenef;
         Exit;
      end;
      //FIM Helio - SOL Nº 230367-16434 PPM Nº 491155

      if (qryValContaSal.FieldByName('CONTACORRENTE').AsString <> '') and
         (qryContaPref.FieldByName('CONTACORRENTE').AsString <> '') then
      begin
         MotivoRecusa := MsgValPossuiContas;
         Exit;
      end;

      if qryValContaSal.FieldByName('CONTACORRENTE').AsString <> '' then
      begin
        MotivoRecusa := MsgValContaSal;
        Exit;
      end;

      if qryContaPref.FieldByName('CONTACORRENTE').AsString = '' then
      begin
         MotivoRecusa := MsgValContaPref;
         Exit;
      end;


      Result := True;
   finally
      qryValContaSal.Close;
   end;
end;

procedure TfrmSolContaSal.cmeDadosDelete(Sender: TObject);
begin
  inherited;
  while qryDados.Locate('SEL', 1, []) do qryDados.Delete;
  cmeDados.AtualizaBotoes(Self);
end;

procedure TfrmSolContaSal.sbtnExcluiDetClick(Sender: TObject);
begin
  inherited;
  cmeDados.Delete(Self);
  qryDadosSELChange(qryDadosSEL);
end;

procedure TfrmSolContaSal.cmeDadosAtualizaBotoes(Sender: TObject);
var
   bUpdate, bDelete : boolean;
begin
  inherited;
  bUpdate := sbtnAltDet.Down;
  bDelete := sbtnExcluiDet.Down;

  sbtnAltDet.Enabled := not(qryDados.IsEmpty) and not(bTemMotivoRecusa);
  sbtnExcluiDet.Enabled := not(qryDados.IsEmpty);

  if (bUpdate and not(qryDados.State = dsEdit)) then
     sbtnAltDet.Down := False
  else if (bDelete) then
     sbtnExcluiDet.Down := False;
end;

procedure TfrmSolContaSal.bbtnConfirmarClick(Sender: TObject);
begin
  MontarArquivoExcel;
  AbrirForm(frmEmailContasSol, TfrmEmailContasSol, True);
end;

function TfrmSolContaSal.AlinharCelula(Alinhamento: TAlinhamento): integer;
begin
     case Alinhamento of
          xlNone: Result := 1;
          xlLeft: Result := 2;
          xlCenter: Result := 3;
          xlRight: Result := 4;
     end;
end;

function TfrmSolContaSal.Borda(Posicao: TBordas): integer;
begin
     Case Posicao of
       xlEdgeBottom: Result := 9;
       xlEdgeLeft: Result := 7;
       xlEdgeRight: Result := 10;
       xlEdgeTop: Result := 8;
       xlInsideVerical : Result := 11;
       xlInsideHorizontal : Result := 12;
     end;
end;

procedure TfrmSolContaSal.ColocarBorda(Range: string; Sheet: OleVariant);
begin
  Sheet.Range[Range].Borders[Borda(xlEdgeBottom)].LineStyle := EstiloLinha;
  Sheet.Range[Range].Borders[Borda(xlEdgeLeft)].LineStyle := EstiloLinha;
  Sheet.Range[Range].Borders[Borda(xlEdgeRight)].LineStyle := EstiloLinha;
  Sheet.Range[Range].Borders[Borda(xlEdgeTop)].LineStyle := EstiloLinha;
  Sheet.Range[Range].Borders[Borda(xlInsideVerical)].LineStyle := EstiloLinha;
  Sheet.Range[Range].Borders[Borda(xlInsideHorizontal)].LineStyle := EstiloLinha;

  Sheet.Range[Range].Borders[Borda(xlEdgeBottom)].Weight := TamanhoBorda;
  Sheet.Range[Range].Borders[Borda(xlEdgeLeft)].Weight := TamanhoBorda;
  Sheet.Range[Range].Borders[Borda(xlEdgeRight)].Weight := TamanhoBorda;
  Sheet.Range[Range].Borders[Borda(xlEdgeTop)].Weight := TamanhoBorda;
  Sheet.Range[Range].Borders[Borda(xlInsideVerical)].Weight := TamanhoBorda;
  Sheet.Range[Range].Borders[Borda(xlInsideHorizontal)].Weight := TamanhoBorda;


  Sheet.Range[Range].Borders[Borda(xlEdgeBottom)].ColorIndex := CinzaClaro;
  Sheet.Range[Range].Borders[Borda(xlEdgeLeft)].ColorIndex := CinzaClaro;
  Sheet.Range[Range].Borders[Borda(xlEdgeRight)].ColorIndex := CinzaClaro;
  Sheet.Range[Range].Borders[Borda(xlEdgeTop)].ColorIndex := CinzaClaro;
  Sheet.Range[Range].Borders[Borda(xlInsideVerical)].ColorIndex := CinzaClaro;
  Sheet.Range[Range].Borders[Borda(xlInsideHorizontal)].ColorIndex := CinzaClaro;
end;

procedure TfrmSolContaSal.MontarArquivoExcel;
var
   iColPos, iLinPos, i : integer;
   sRange : string;
begin
  inherited;
  FArqExcel := CreateOleObject('Excel.Application');
  FArqExcel.WorkBooks.Add(1);
  FArqExcel.Visible := False;
  FArqExcel.DisplayAlerts := False;

  SheetContas := FArqExcel.Worksheets[1];

  // preenchendo valores default no arquivo
  SheetContas.Range['H1'].Value := 'RELAÇÃO DE CONTAS SALÁRIO PARA ABERTURA EM LOTE';
  SheetContas.Range['H2'].Value := 'Nome da Empresa - CNPJ';

  // formatando o arquivo (fonte, cor, borda etc)
  FArqExcel.Cells.Select;
  FArqExcel.Selection.Interior.Color := clNavy;
  FArqExcel.Rows['1:1'].RowHeight := 27.75;
  FArqExcel.Rows['4:4'].RowHeight := 27.75;

  SheetContas.Range['A1:H1'].Borders[Borda(xlEdgeBottom)].Weight := 2;
  SheetContas.Range['A1:H1'].Borders[Borda(xlEdgeBottom)].Color := clGray;

  SheetContas.Range['H1'].Font.Size := 14;
  SheetContas.Range['H1'].Font.Color := clWhite;
  SheetContas.Range['H1'].Font.Bold := True;

  SheetContas.Range['H2'].Font.Size := 10;
  SheetContas.Range['H2'].Font.Color := clWhite;
  SheetContas.Range['H1:H2'].HorizontalAlignment := AlinharCelula(xlRight);

  //cabeçalho
  SheetContas.Range[RangeCabecalho].Font.Size := 10;
  SheetContas.Range[RangeCabecalho].Font.Color := clWhite;
  SheetContas.Range[RangeCabecalho].Font.Bold := True;
  SheetContas.Range[RangeCabecalho].Interior.ColorIndex := CinzaEscuro;
  SheetContas.Range[RangeCabecalho].HorizontalAlignment := AlinharCelula(xlCenter);
  SheetContas.Range[RangeCabecalho].VerticalAlignment := 2; // é center
  SheetContas.Range[RangeCabecalho].WrapText := True;

  ColocarBorda(RangeCabecalho, SheetContas);

  for i := 0 to qryColsExcel.FieldCount - 1 do
  begin
      iColPos := i + 1;
      SheetContas.Cells[NumLinCabecalho, iColPos].Value := qryColsExcel.Fields[i].DisplayLabel;
      SheetContas.Columns[iColPos].ColumnWidth := qryColsExcel.Fields[i].DisplayWidth;
  end;

  sRange := ColIni + IntToStr(NumLinCabecalho + 1) + ':' + ColFin + IntToStr(NumRegSelecionados + NumLinCabecalho);

  // formata as linhas dos registros
  SheetContas.Range[sRange].Interior.Color := clWhite;
  SheetContas.Range[sRange].NumberFormat := '@'; // formata para texto
  SheetContas.Range[sRange].HorizontalAlignment := AlinharCelula(xlLeft);
  ColocarBorda(sRange, SheetContas);

  iLinPos := 5;

  // inserindo registros
  qryDados.DisableControls;
  qryDados.First;

  while not(qryDados.Eof) do
  begin
       if qryDadosSEL.AsInteger = 0 then
       begin
            qryDados.Next;
            Continue; // pula o código abaixo
       end;

       for i := 0 to qryColsExcel.FieldCount - 1 do
       begin
            iColPos := i + 1;

            if lCamposEmBranco.IndexOf(qryColsExcel.Fields[i].FieldName) = -1 then // somente exporta os campos que não estão nesta lista
               SheetContas.Cells[iLinPos, iColPos].Value := qryDados.FieldByName(qryColsExcel.Fields[i].FieldName).AsString;
       end;
       Inc(iLinPos);

       qryDados.Next;
  end;

  qryDados.EnableControls;


  NomeArquivo := 'ABERTURA DE CONTA 037_' + FormatDateTime('ddmmyyyy', Now) + '.xlsx';
  PathExcel := Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa) + '\' + NomeArquivo;
end;

procedure TfrmSolContaSal.sbtnAltDetClick(Sender: TObject);
begin
  inherited;
  cmeDados.Edit(self);
end;

procedure TfrmSolContaSal.cmeDadosEdit(Sender: TObject);
begin
  inherited;
  if not(bTemMotivoRecusa) then
     FieldsReadOnly(False);
end;

procedure TfrmSolContaSal.dbgrdContasRowChanged(Sender: TObject);
begin
  inherited;
  // se tiver motivo de recusa não permitir flegar
  bTemMotivoRecusa := (Trim(qryDadosMOTIVORECUSA.AsString) <> '');

  if bTemMotivoRecusa then
     qryDadosSEL.ReadOnly := True
  else
     qryDadosSEL.ReadOnly := False;

  FieldsReadOnly(True); // deixa todos os campos (não modifica o SEL)
  cmeDados.AtualizaBotoes(Self);
end;

procedure TfrmSolContaSal.FieldsReadOnly(pBol: boolean);
var
   i : integer;
begin
  for i := 0 to qryDados.FieldCount - 1 do
  begin
     if qryDados.Fields[i].FieldName = 'SEL' then
        Continue;

     qryDados.Fields[i].ReadOnly := pBol;
  end;
end;

procedure TfrmSolContaSal.dbgrdContasCalcCellColors(Sender: TObject;
  Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont;
  ABrush: TBrush);
begin
  inherited;
  if Trim(qryDadosMOTIVORECUSA.AsString) <> '' then
     ABrush.Color := clBtnFace; // cinza
end;

procedure TfrmSolContaSal.qryDadosAfterPost(DataSet: TDataSet);
begin
  inherited;
  //cmeDados.AtualizaBotoes(Self);
end;

procedure TfrmSolContaSal.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  FreeAndNil(lCamposEmBranco);
end;

function TfrmSolContaSal.GetNumRegSelecionados: integer;
begin
  FNumRegSelecionados := 0;
  qryDados.DisableControls;
  qryDados.First;

  while not(qryDados.Eof) do
  begin
       if qryDadosSEL.AsInteger = 1 then
          FNumRegSelecionados := FNumRegSelecionados + 1;

       qryDados.Next;
  end;
  qryDados.EnableControls;

  if FNumRegSelecionados = 0 then
     FNumRegSelecionados := 1;

  Result := FNumRegSelecionados;
end;

procedure TfrmSolContaSal.qryDadosSELChange(Sender: TField);
begin
  inherited;
  bbtnConfirmar.Enabled := SelReg;
end;

function TfrmSolContaSal.SelReg: boolean;
var
  BM : TBookMark;
begin
  BM := qryDados.GetBookmark;
  qryDados.DisableControls;

  Result := qryDados.Locate('SEL', 1, []);
  
  qryDados.GotoBookmark(BM);
  qryDados.EnableControls;
end;

procedure TfrmSolContaSal.CamposDeveSerNulos;
begin
  lCamposEmBranco.Add('PIS');
  lCamposEmBranco.Add('CARTEIRATRABALHO');
  lCamposEmBranco.Add('NOMECONJUGE');
  lCamposEmBranco.Add('CARGO');
  lCamposEmBranco.Add('EMAIL');
  lCamposEmBranco.Add('DESCGRINSTR');
  lCamposEmBranco.Add('RENDAVALOR');
end;

function TfrmSolContaSal.GetAgenciaPreferencial: string;
begin
  FAgenciaPreferencial := qryAgenciaBancariaNUMAGENCIA.AsString;

  if Length(FAgenciaPreferencial) = 5 then
     FAgenciaPreferencial := Copy(qryAgenciaBancariaNUMAGENCIA.AsString, 1, 4);

  Result := FAgenciaPreferencial;
end;

function TfrmSolContaSal.BuscaConjuge: string;
var
   sSQL : string;
begin
  try
    sSQL := 'SELECT P.NOME ' +
            '  FROM DEPENTIT D, PESSOA P ' +
            ' WHERE D.IDPESSOA = P.IDPESSOA ' +
            '   AND D.IDDEPENDENCIA = :IDDEPENDENCIA ' +
            '   AND D.IDTITULAR = :IDTITULAR';

    qryAux.Close;
    qryAux.SQL.Clear;
    qryAux.SQL.Add(sSQL);
    qryAux.ParamByName('IDTITULAR').AsInteger := qryDadosIDPESSOA.AsInteger;
    qryAux.ParamByName('IDDEPENDENCIA').AsString := 'COM';
    qryAux.Open;

    Result := qryAux.FieldByName('NOME').AsString;
  finally
    qryAux.Close;
  end;
end;

procedure TfrmSolContaSal.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  cmeDados.Cancel(Self);
end;

procedure TfrmSolContaSal.cmeDadosCancel(Sender: TObject);
begin
  inherited;
  qryDados.Cancel;
  while not(qryDados.Eof) do qryDados.Delete;

  bbtnConfirmar.Enabled := False;
  cmeDados.AtualizaBotoes(Self);
end;

function TfrmSolContaSal.BuscaUFdoRG(pIdEstado : integer): string;
var
   sSQL : string;
begin
  sSQL := ' SELECT CODESTADO FROM ESTADO WHERE IDESTADO = :IDESTADO ';

  try
     qryAux.Close;
     qryAux.SQL.Clear;
     qryAux.SQL.Add(sSQL);
     qryAux.ParamByName('IDESTADO').AsInteger := pIdEstado;
     qryAux.Open;

     Result := qryAux.FieldByName('CODESTADO').AsString;
  finally
     qryAux.Close;
  end;
end;

//Helio - SOL Nº 230367-16434 PPM Nº 491155
//verificar se o cpf tem conta salario em outro beneficio
function TfrmSolContaSal.TemContaSalOutroBenef(pCPF : String): Boolean;
var
    qryTemp : TWWQuery;
    sSQL    : String;
begin

    qryTemp := TwwQuery.Create(dtmBaseDados);
    qryTemp.DataBaseName := dtmBaseDados.dbBaseDados.DataBaseName;


    sSQL := ' SELECT DP.MATRICULA,AG.NUMAGENCIA,PE.NUMDOCUMENTO CPF,CB.* ' +#13+
            '   FROM CONTABANCARIA CB, AGENCIABANCARIA AG, DEPENTIT DP, PESSOA PE' +#13+
            ' WHERE CB.IDPESSOA = DP.IDPESSOA ' +#13+
            '   AND PE.IDPESSOA = CB.IDPESSOA ' +#13+
            '   AND AG.IDPESSOA = CB.IDAGENCIA' +#13+
            '   AND CB.TIPOCONTA = 2 ' +#13+
            '   AND SUBSTR(CB.CONTACORRENTE, 1, 3) = ''037'' ' +#13+
            '   AND DP.MATRICULA IN ' +#13+
            '       (SELECT MATRICULA FROM DEPENTIT WHERE IDPESSOA IN ' +#13+
            '          (SELECT IDPESSOA FROM PESSOA WHERE NUMDOCUMENTO = ''' + pCPF + '''))';

    try
        qryTemp.SQL.Text := sSQL;
        qryTemp.Open;

        if qryTemp.IsEmpty then
           Result := False
        else
           Result := True;

    finally
        qryTemp.Close;
        FreeAndNil(qryTemp);
    end;

end;

//Helio - SOL Nº 230367-16434 PPM Nº 491155
procedure TfrmSolContaSal.RemoveLinhasRepetidas(pQry : TwwQuery);
var
     listaIdPessoa : TStringList;
     idPessoa        : String;
     temNaLista      : Boolean;
     i               : Integer;
begin
     listaIdPessoa := TStringList.Create;

     pQry.First;
     while not (pQry.Eof) do
     begin

         idPessoa  := pQry.FieldByName('IDPESSOA').AsString;
         temNaLista := False;

         for i := 0 to listaIdPessoa.Count -1 do
             if listaIdPessoa[i] = idPessoa then
             begin
                temNaLista := True;
                Break;
             end;

         if temNaLista then
         begin
            pQry.Delete;

            pQry.Next;
            if not(pQry.Eof) then
            begin
                pQry.Prior;
                pQry.Prior;
            end else
                pQry.Next;
         end else
         begin
            listaIdPessoa.Add(idPessoa);
         end;

         
         pQry.Next;

     end;


     listaIdPessoa.Free;
end;

end.
