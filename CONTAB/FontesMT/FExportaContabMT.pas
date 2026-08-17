{-----------------------------------------------------------------------------
Autor(a)    :  Henrique Massão
Data        :  26/02/2009
Pendência   :  SOL 109421 KINTANA 496332
Descricao   :  Alteração de gravação de arquivos de log na raiz do disco C:
------------------------------------------------------------------------------}
unit FExportaContabMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, wwdbdatetimepicker, CMDateTimePicker,
  uCmSqlParams, Db, DBClient, uCMClientDataSet, CheckLst, ComCtrls,
  BfDialogs, BrowseFolder, uProcuraDir, Mask, fprogresso, uCtrlLoteexportactb,
  dBaseDados, usistema, wwdbedit;

type
  TFrmExportaContabMT = class(TfrmOkCancelar)
    Label1: TLabel;
    dtInicial: TCMDateTimePicker;
    dtFinal: TCMDateTimePicker;
    Label2: TLabel;
    Label3: TLabel;
    sqlModulos: TCMSqlParams;
    sqlContab: TCMSqlParams;
    cdsModulos: TCMClientDataSet;
    ChkLBModulos: TCheckListBox;
    cdsContab: TCMClientDataSet;
    edtPath: TEdit;
    btnSelecionar: TBitBtn;
    Label6: TLabel;
    Cds: TCMClientDataSet;
    lbldesc: TLabel;
    edtDesc: TwwDBEdit;
    sbMarcar: TSpeedButton;
    sbDesmarca: TSpeedButton;
    NomeArq: TSaveDialog;
    procedure FormCreate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure btnSelecionarClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sbMarcarClick(Sender: TObject);
    procedure sbDesmarcaClick(Sender: TObject);
  private
    { Private declarations }
    SNomeArquivo : string;
    CtrlLoteexportactb: TCtrlLoteexportactb;
    function getModulos : String;
  public
    { Public declarations }
  end;

var
  FrmExportaContabMT: TFrmExportaContabMT;
implementation

{$R *.DFM}

procedure TFrmExportaContabMT.FormCreate(Sender: TObject);
begin
  inherited;
  NomeArq.InitialDir:=Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa);
  CtrlLoteexportactb := TCtrlLoteexportactb.Create;
  CtrlLoteexportactb.Initialize(dtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,
                             Sistema.ConnectionSide,Sistema.AppRemoteServer,True);

  CtrlLoteexportactb.Cds := Cds;

  Cds.Data := CtrlLoteexportactb.ListLoteexportactb(-1);

  if Sistema.TipoCliente = 20041 then
       SNomeArquivo := 'TotalPrev.txt'
  else SNomeArquivo := 'ExportContab' + formatDateTime('ddmmyyyy', now) + '.txt';
  //Henrique Massão
  //edtPath.Text := 'C:\' + SNomeArquivo;
  edtPath.Text := Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa) +  SNomeArquivo;

  sqlModulos.Open;
  cdsModulos.First;
  While not cdsModulos.Eof do
  begin
    ChkLBModulos.Items.Append(cdsModulos.fieldByName('NOMEMODULO').asString);
    cdsModulos.Next;
  end;
end;

function TFrmExportaContabMT.getModulos: String;
var i : Integer;
begin
  result := '';
  for i := 0 to ChkLBModulos.Items.Count - 1 do
  begin
    if ChkLBModulos.checked[i] then
    begin
      if cdsModulos.Locate('NOMEMODULO',ChkLBModulos.Items[i],[loCaseInsensitive,loPartialKey]) then
        result := result + cdsModulos.FieldByName('IDMODULO').AsString + ', ';
    end;
  end;
  if Length(result) > 2 then
    result := Copy(result, 1, Length(result) - 2)
end;

procedure TFrmExportaContabMT.bbtnConfirmarClick(Sender: TObject);
var sFiltro, sLinha, splanilhaaux, sContaContabil, scod_Processo, sCod_Empresa, sCod_CentroCusto,
    sCod_Unidade, sCod_Plano_Contas, sDataContab, sDataProcessa : string;
    dUltDia : TDateTime;
    arq  : TextFile;
    iSeq, itam, iconta : integer;
    Mascara : TMaskEdit;
    TudoOK :Boolean;
    iDia, iMes, iAno : Word;
function CompletaString(const s : string; const c : char; const tam: integer; const lado : char): string;
begin
  result := '';
  if lado = 'D' then
    result := s + stringOfChar(c, tam - length(s))
  else
    result := stringOfChar(c, tam - length(s)) + s
end;

function LimpaString(const s : string): string;
var i : integer;
    sAux : string;
begin
  result := '';
  sAux := s;
  for i := 1 to length(sAux) do
  begin
    if i < length(sAux) then
    if (sAux[i] = '.') and (sAux[i + 1] = ' ') then
       sAux[i] := ' ';
  end;
  result := trim(sAux);
end;

function RemoveCaracEspciais(const s : string): string;
var i : integer;
    sAux : string;

begin
  result := '';
  sAux := s;
  for i := 1 to length(sAux) do
  begin
    if (sAux[i] <> ',') and (sAux[i] <> '.') and (sAux[i] <> '''') and (sAux[i] <> '"') then
      result := result + sAux[i];
  end;
end;

begin
  inherited;
  try
    sContaContabil := '';
    sCod_Empresa := '';
    sCod_Unidade := '';
    sCod_Plano_Contas := '';
    sCod_CentroCusto := '';
    sDataContab := '';
    TudoOK := false;
    bbtnCancelar.Enabled := false;
    sFiltro := '';
    sFiltro := getModulos;

    AssignFile(arq, edtPath.Text);
    Rewrite(arq);

    if sFiltro = '' then begin
      showMessage('Selecione ao menos um módulo');
      ChkLBModulos.SetFocus;
      exit;
    end;
    iSeq := 0;
    iconta := 0;
    Mascara := TMaskEdit.Create(nil);
    try

      if (trim(dtInicial.text) = '') or (trim(dtFinal.text) = '') then begin
        showMessage('Selecione o período.');
        dtInicial.SetFocus;
        exit;
      end;

      if (FormatDateTime('MMYYYY',dtInicial.Date) <> FormatDateTime('MMYYYY',dtFinal.Date) ) then begin
        showMessage('O período deve ser pertencer a um único mês.');
        dtInicial.SetFocus;
        exit;
      end;

      if trim(edtDesc.text) = '' then begin
        showMessage('Preencha o campo com a descrição do lote.');
        edtDesc.SetFocus;
        exit;
      end;

      if trim(edtPath.text) = '' then begin
        showMessage('Escolha uma pasta para gravar o arquivo.');
        btnSelecionar.SetFocus;
        exit;
      end;
      cds.Data := CtrlLoteexportactb.ListLoteexportactb(-1, '', -1);
      cdsContab.Data := CtrlLoteexportactb.ListaLancamentos(dtInicial.Date, dtFinal.Date, sFiltro);
      sLinha := '';
      itam := cdsContab.recordCount;

      // Verifica o último dia do mês selecionado
      DecodeDate(dtFinal.Date, iAno, iMes, iDia);
      dUltDia := DiasUteis.UltDiaMes(iAno, iMes);


      if itam = 0 then begin
        showMessage('Não Há Lançamentos Contábies a Exportar Neste Período '+#13#10+
                    ' ou Os Lançamentos Deste Período Já Foram Exportados');
        exit;
      end;

      cdsContab.First;
      if itam > 1 then
        frmProgresso.MostraFormProgresso('Exportando dados para arquivo...', true, true, true, 1, itam);
      application.ProcessMessages;
      while not cdsContab.Eof do
      begin
        sPlanilhaAux := cdsContab.fieldByName('PLNCODIGO').asString;
        iSeq := iSeq + 1;
        while (sPlanilhaAux = cdsContab.fieldByName('PLNCODIGO').asString) and (cdsContab.Eof = false) do
        begin
          application.ProcessMessages;
          iconta := iconta + 1;
          frmProgresso.AndaFormProgresso(iconta, itam);
          sLinha := '';
          mascara.Text := '';
          mascara.EditMask := '';
          mascara.Text := cdsContab.fieldByName('COD_CONTA_CONTABIL').asString;
          mascara.EditMask := cdsContab.fieldByName('MASCARA').asString;
          sContaContabil := LimpaString(mascara.Text);
          if frmProgresso.Cancelou then
          begin
            TudoOk := false;
            exit;
          end;
          scod_Processo := CtrlLoteexportactb.GetCodExterno('idmodulo', cdsContab.FieldByName('COD_PROCESSO').asString);
          scod_Empresa  := CtrlLoteexportactb.GetCodExterno('idempresa', cdsContab.FieldByName('COD_EMPRESA').asString);
          sCod_Unidade  := CtrlLoteexportactb.GetCodExterno('idplanoprev', cdsContab.FieldByName('COD_UNIDADE').asString);
          sCod_Plano_Contas := CtrlLoteexportactb.GetCodExterno('idplano', cdsContab.FieldByName('COD_PLANO_CONTAS').asString);
          sCod_CentroCusto  := CtrlLoteexportactb.GetCodExterno('codcentrocusto', cdsContab.FieldByName('COD_CENTRO_CUSTO').asString);

          sDataContab   := cdsContab.FieldByName('DATA_CONTABILIZACAO').asString;
          sDataProcessa := FormatDateTime('YYYYMMDD',dUltDia);

          sLinha := sLinha + '25' + CompletaString(scod_Processo, '0', 4, 'E') +
                    CompletaString(scod_Empresa, '0', 4, 'E') +
                    CompletaString(sCod_Unidade, '0', 6, 'E') +
                    sDataProcessa +
                    CompletaString(cdsContab.FieldByName('NUM_DOCUMENTO').asString, '0', 6, 'E') +
                    CompletaString(intToStr(iConta), '0', 6, 'E') +
                    CompletaString(sCod_Plano_Contas, '0', 2, 'E') +
                    CompletaString(sContaContabil, ' ', 25, 'D') +
                    stringOfChar('0', 2) + stringOfChar('0', 4) + stringOfChar('0', 4) +
                    cdsContab.FieldByName('DEBITO_CREDITO').asString +
                    CompletaString(RemoveCaracEspciais(formatFloat('#,##0.00', cdsContab.FieldByName('VAL_LANCAMENTO').asFloat)), '0', 17, 'E') +
                    CompletaString(cdsContab.FieldByName('NOMEMODULO').asString, ' ', 30, 'D') +
                    stringOfChar('0', 6)  +
                    CompletaString(RemoveCaracEspciais(copy(cdsContab.FieldByName('COMPLEMENTO_HISTORICO').asString, 1, 130)), ' ', 130, 'D') +
                    sDataContab +
                    CompletaString(sCod_CentroCusto, '0', 6, 'E') +
                    stringOfChar('0', 6) + ' ' + stringOfChar('0', 6);
          writeLn(arq, sLinha);
          cdsContab.Next;
        end;
      end;
      TudoOK := not frmProgresso.Cancelou;

    except
      TudoOk := false;
      ShowMessage('Ocorreu um erro durante a exportaçao');
    end;
  finally
    if TudoOk then
      CtrlLoteexportactb.GravarLoteexportactb(cdsContab.Data, edtDesc.Text, 'C');
    if itam > 0 then
      frmProgresso.EscondeFormProgresso;
    closeFile(arq);
    cds.Close;
    freeAndNil(Mascara);
    bbtnCancelar.Enabled := true;
    if TudoOk then
      showMessage('Exportação Efetuada Com Sucesso.');
   end;
end;

procedure TFrmExportaContabMT.btnSelecionarClick(Sender: TObject);
begin
  inherited;
  if NomeArq.Execute then begin
    edtPath.Text := NomeArq.FileName;
  end;
end;

procedure TFrmExportaContabMT.bbtnCancelarClick(Sender: TObject);
var i : integer;
begin
  inherited;
  dtInicial.text := '';
  dtFinal.text := '';
   //Henrique Massão
  //edtPath.Text := 'C:\' + SNomeArquivo;
  edtPath.Text := Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa) +  SNomeArquivo;

  for i := 0 to ChkLBModulos.Items.Count - 1 do
    ChkLBModulos.checked[i] := false;
end;

procedure TFrmExportaContabMT.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  CtrlLoteexportactb.Free;
end;

procedure TFrmExportaContabMT.sbMarcarClick(Sender: TObject);
var i : Integer;
begin
  inherited;
  for i := 0 to ChkLBModulos.Items.Count - 1 do
    ChkLBModulos.checked[i] := True;
end;

procedure TFrmExportaContabMT.sbDesmarcaClick(Sender: TObject);
var i : Integer;
begin
  inherited;
  for i := 0 to ChkLBModulos.Items.Count - 1 do
    ChkLBModulos.checked[i] := False;
end;

end.

