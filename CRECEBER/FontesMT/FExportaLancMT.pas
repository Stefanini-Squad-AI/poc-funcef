{-----------------------------------------------------------------------------
Autor(a)    :  Henrique Massão
Data        :  26/02/2009
Pendência   :  SOL 109421 KINTANA 496332
Descricao   :  Alteração de gravação de arquivos de log na raiz do disco C:
------------------------------------------------------------------------------}

unit FExportaLancMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, wwdbdatetimepicker, CMDateTimePicker,
  uCmSqlParams, Db, DBClient, uCMClientDataSet, CheckLst, ComCtrls,
  BfDialogs, BrowseFolder, uProcuraDir, Mask, fprogresso, uCtrlLoteexportactb,
  uCtrlDocumento, dBaseDados, usistema, wwdbedit;

type
  TFrmExportaLancMT = class(TfrmOkCancelar)
    Label3: TLabel;
    sqlModulos: TCMSqlParams;
    sqlLancamento: TCMSqlParams;
    cdsModulos: TCMClientDataSet;
    ChkLBModulos: TCheckListBox;
    cdsLancamento: TCMClientDataSet;
    edtPath: TEdit;
    btnSelecionar: TBitBtn;
    Label6: TLabel;
    Cds: TCMClientDataSet;
    lbldesc: TLabel;
    edtDesc: TwwDBEdit;
    sbMarcar: TSpeedButton;
    sbDesmarca: TSpeedButton;
    GroupBox1: TGroupBox;
    dtInicial: TCMDateTimePicker;
    Label2: TLabel;
    dtFinal: TCMDateTimePicker;
    rbRecPag: TRadioGroup;
    rbValor: TRadioGroup;
    cbBaixaCap: TCheckBox;
    lbBaixaCAP: TLabel;
    NomeArq: TSaveDialog;
    rgTipoData: TRadioGroup;
    procedure FormCreate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure btnSelecionarClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sbMarcarClick(Sender: TObject);
    procedure sbDesmarcaClick(Sender: TObject);
    procedure rbRecPagClick(Sender: TObject);
  private
    { Private declarations }
    SNomeArquivo : string;
    CtrlLoteexportactb: TCtrlLoteexportactb;
    CtrlDocumento : TCtrlDocumento;

    function getModulos : String;
    function BaixaCAP (const iIdExportaCtb:Integer): Boolean;
    function StrTran (sValor, sBusca: String; sTroca: String = ''; bPrimeira: Boolean = False): String;
  public
    { Public declarations }
  end;

var
  FrmExportaLancMT: TFrmExportaLancMT;
implementation

{$R *.DFM}

procedure TFrmExportaLancMT.FormCreate(Sender: TObject);
begin
  inherited;
  //Henrique Massão
  NomeArq.InitialDir:=Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa);

  CtrlLoteexportactb := TCtrlLoteexportactb.Create;
  CtrlLoteexportactb.Initialize(dtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,
                             Sistema.ConnectionSide,Sistema.AppRemoteServer,True);

  CtrlDocumento := TCtrlDocumento.Create;
  CtrlDocumento.InitiAlizeAs(CtrlLoteExportaCtb);

  CtrlLoteexportactb.Cds := Cds;
  Cds.Data := CtrlLoteexportactb.ListLoteexportactb(-1);

  if Sistema.TipoCliente = 20041 then
       SNomeArquivo := 'AR04' + formatDateTime('ddmmyyyy', now) + '.TXT'
  else SNomeArquivo := 'ExportLanc' + formatDateTime('ddmmyyyy', now) + '.TXT';
  NomeArq.FileName  := sNomeArquivo;
  edtPath.Text := NomeArq.InitialDir + SNomeArquivo;

  if Sistema.TipoCliente = 20041 then begin
     rbRecPag.ItemIndex := 1;
     rbValor.ItemIndex  := 1;
     cbBaixaCAP.Checked := (rbRecPag.ItemIndex = 0);
     cbBaixaCAP.Enabled := (rbRecPag.ItemIndex = 0);
     lbBaixaCAP.Enabled := (rbRecPag.ItemIndex = 0);
  end;

  sqlModulos.Open;
  cdsModulos.First;
  While not cdsModulos.Eof do begin
    ChkLBModulos.Items.Append(cdsModulos.fieldByName('NOMEMODULO').asString);
    cdsModulos.Next;
  end;
end;

function TFrmExportaLancMT.getModulos: String;
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

procedure TFrmExportaLancMT.bbtnConfirmarClick(Sender: TObject);
var sFiltro, sLinha, s_NumLote : String;
    sRecPag, sCod_Sistema, sCod_Empresa, sCod_Origem,
    sCod_Pagto, sCod_Forma, sCod_Programa, scod_OrgPagto, sCod_PlanoPrev,
    sCod_Plano_Contas, sCod_CentroCusto : string;
    sPes_TipoCli, sPes_Nome, sPes_Documento, sPes_TipoPes, sPes_Titular : String;
    bApropriado, bBaixaCAP : Boolean;
    fValor : Extended;
    arq  : TextFile;
    iSeq, itam, iLoteExportaCtb : integer;
    Mascara : TMaskEdit;
    TudoOK :Boolean;
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
    sAux, sRecPag : string;
    bApropriado : Boolean;
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
    sCod_Empresa      := '';
    sCod_Plano_Contas := '';
    TudoOK            := false;
    sFiltro           := '';
    sFiltro           := getModulos;
    bbtnCancelar.Enabled := false;
    AssignFile(arq, edtPath.Text);
    Rewrite(arq);

    if sFiltro = '' then begin
      showMessage('Selecione ao menos um módulo');
      ChkLBModulos.SetFocus;
      exit;
    end;

    iSeq    := 0;
    Mascara := TMaskEdit.Create(nil);
    try

      if (trim(dtInicial.text) = '') or (trim(dtFinal.text) = '') then begin
        showMessage('Selecione o período.');
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

      if rbRecPag.ItemIndex = 0 then
           sRecPag := 'P'
      else sRecPag := 'R';

      if rbValor.ItemIndex = 0 then
           bApropriado := True
      else bApropriado := False;


      cds.Data := CtrlLoteexportactb.ListLoteexportactb(-1, '', -1);
      cdsLancamento.Data := CtrlLoteexportactb.ListaLancRecPag(dtInicial.Date,
                                                               dtFinal.Date,
                                                               rgTipoData.ItemIndex,
                                                               sFiltro,
                                                               sRecPag,
                                                               bApropriado);
      sLinha := '';
      itam := cdsLancamento.recordCount;

      if itam = 0 then begin
        showMessage('Não Há Lançamentos a Exportar Neste Período '+#13#10+
                    ' ou Os Lançamentos Deste Período Já Foram Exportados');
        exit;
      end;

      cdsLancamento.First;
      frmProgresso.MostraFormProgresso('Exportando dados para arquivo...', true, true, true, 1, itam);
      application.ProcessMessages;
      while not cdsLancamento.Eof do begin

        Inc(iSeq);
        application.ProcessMessages;
        frmProgresso.AndaFormProgresso(iSeq, itam);
        if frmProgresso.Cancelou then begin
          TudoOk := false;
          exit;
        end;

        // Define Número do Lote
        s_NumLote := IntToStr(cdsLancamento.FieldByName('ULTLOTE').AsInteger + 1);

        // Define o Valor
        fValor := cdsLancamento.fieldByName('VLR_LIQUIDO').asFloat;
        if not bApropriado then fValor := fValor * -1;

        // Preenche dados do Cliente / Fornecedor
        sPes_TipoCli   := stringOfChar(' ', 2);
        sPes_Nome      := stringOfChar(' ', 50);
        sPes_Documento := stringOfChar(' ', 15);
        sPes_TipoPes   := stringOfChar(' ', 2);
        sPes_Titular   := stringOfChar(' ', 2);

        if cdsLancamento.FieldByName('COD_FORCLI').AsString = '' then begin
           sPes_TipoCli   := CtrlLoteexportactb.GetCodExterno('IdTipoCliente', cdsLancamento.FieldByName('IDTIPOCLIENTE').asString);
           sPes_Nome      := Copy(cdsLancamento.FieldByName('RAZAOSOCIAL').asString,1,50);
           sPes_Documento := Copy(cdsLancamento.FieldByName('NUMDOCUMENTO').asString,1,15);
           sPes_TipoPes   := CtrlLoteexportactb.GetCodExterno('TipoPessoa', cdsLancamento.FieldByName('TIPO').asString);
           sPes_Titular   := '1';
        end;

        sLinha := '';
        if sRecPag = 'P' then begin
           scod_Sistema     := CtrlLoteexportactb.GetCodExterno('idmodulo', cdsLancamento.FieldByName('COD_PROCESSO').asString);
           scod_Empresa     := CtrlLoteexportactb.GetCodExterno('idempresa', cdsLancamento.FieldByName('COD_EMPRESA').asString);
           scod_Programa    := CtrlLoteexportactb.GetCodExterno('IdPrograma', cdsLancamento.FieldByName('IDPROGRAMA').asString);
           scod_PlanoPrev   := CtrlLoteexportactb.GetCodExterno('IdPlanoPrev', cdsLancamento.FieldByName('IDPLANOPREV').asString);
           scod_Origem      := CtrlLoteexportactb.GetCodExterno('CodCentroRespon', cdsLancamento.FieldByName('CODCENTRORESPON').asString);
           scod_Pagto       := CtrlLoteexportactb.GetCodExterno('CodTipRecDes', cdsLancamento.FieldByName('CODTIPRECDES').asString);
           scod_Forma       := CtrlLoteexportactb.GetCodExterno('CodForma', cdsLancamento.FieldByName('CODFORMA').asString);
           scod_OrgPagto    := CtrlLoteexportactb.GetCodExterno('CodOrgPagto', '1');   // Fixo para a VALIA
           scod_CentroCusto := CtrlLoteexportactb.GetCodExterno('CodCentroCusto', cdsLancamento.FieldByName('CODCENTROCUSTO').asString);

           sLinha := CompletaString(scod_Sistema, '0', 2, 'E') +
                     cdsLancamento.FieldByName('DATA_PROCESSAMENTO').asString +
                     CompletaString(s_NumLote,  '0', 8, 'E') +
                     CompletaString(intToStr(iSeq), '0', 8, 'E') +
                     CompletaString(('Nr. Documento: '+ cdsLancamento.FieldByName('NODOCUMENTO').asString), ' ', 30, 'D') +
                     CompletaString(sCod_Empresa, '0', 2, 'E') +
                     CompletaString(sCod_Origem,  '0', 5, 'E') +
                     CompletaString(cdsLancamento.FieldByName('COD_FORCLI').asString, '0', 8, 'E') +
                     CompletaString(sCod_Pagto, '0', 4, 'E') +
                     CompletaString(sCod_Forma, '0', 2, 'E') +
                     CompletaString(cdsLancamento.FieldByName('NUMBANCO').asString, '0', 3, 'E') +
                     CompletaString(Trim(cdsLancamento.FieldByName('NUMAGENCIA').asString), ' ', 7, 'D') +
                     CompletaString(Trim(StrTran(cdsLancamento.FieldByName('CONTACORRENTE').asString,'.','')), ' ', 20, 'D') +
                     CompletaString(cdsLancamento.FieldByName('BANCO_PORTADOR').asString, '0', 3, 'E') +
                     CompletaString(Trim(cdsLancamento.FieldByName('AGENCIA_PORTADOR').asString), ' ', 7, 'D') +
                     CompletaString(Trim(StrTran(cdsLancamento.FieldByName('CONTA_PORTADOR').asString,'.','')), ' ', 20, 'D') +
                     CompletaString(RemoveCaracEspciais(formatFloat('#,##0.00', fValor)), '0', 14, 'E') +
                     cdsLancamento.FieldByName('DATAVENCTO').asString +
                     cdsLancamento.FieldByName('DATAPROGRAMADA').asString +
                     CompletaString(cdsLancamento.FieldByName('AGRUPA').asString, '0', 2, 'E') +
                     CompletaString(cdsLancamento.FieldByName('AUTENTICA').asString, '0', 3, 'E') +
                     CompletaString(Copy(cdsLancamento.FieldByName('OBS').asString,0,255), ' ', 255, 'D') +
                     CompletaString(sCod_Programa, '0', 3, 'E') +
                     CompletaString(sCod_OrgPagto, '0', 5, 'E') +
                     CompletaString(sPes_TipoCli, '0', 2, 'E') +
                     CompletaString(sPes_Nome, ' ', 50, 'D') +
                     CompletaString(sPes_Documento, ' ', 15, 'D') +
                     CompletaString(sPes_TipoPes, '0', 2, 'E') +
                     CompletaString(sPes_Titular, '0', 2, 'E') +
                     stringOfChar(' ',  2) +
                     CompletaString(sCod_PlanoPrev, '0', 6, 'E') +
                     CompletaString(sCod_CentroCusto, '0', 6, 'E') +
                     StringOfChar(' ', 50) +
                     StringOfChar('0', 3);
        end;

        if sRecPag = 'R' then begin
           scod_Sistema     := CtrlLoteexportactb.GetCodExterno('idmodulo', cdsLancamento.FieldByName('COD_PROCESSO').asString);
           scod_Empresa     := CtrlLoteexportactb.GetCodExterno('idempresa', cdsLancamento.FieldByName('COD_EMPRESA').asString);
           scod_Programa    := CtrlLoteexportactb.GetCodExterno('IdPrograma', cdsLancamento.FieldByName('IDPROGRAMA').asString);
           scod_PlanoPrev   := CtrlLoteexportactb.GetCodExterno('IdPlanoPrev', cdsLancamento.FieldByName('IDPLANOPREV').asString);
           scod_Origem      := CtrlLoteexportactb.GetCodExterno('CodCentroRespon', cdsLancamento.FieldByName('CODCENTRORESPON').asString);
           scod_Pagto       := CtrlLoteexportactb.GetCodExterno('CodTipRecDes', cdsLancamento.FieldByName('CODTIPRECDES').asString);
           scod_Forma       := CtrlLoteexportactb.GetCodExterno('CodForma', cdsLancamento.FieldByName('CODFORMA').asString);
           scod_OrgPagto    := CtrlLoteexportactb.GetCodExterno('CodOrgPagto', '1');   // Fixo para a VALIA
           scod_CentroCusto := CtrlLoteexportactb.GetCodExterno('CodCentroCusto', cdsLancamento.FieldByName('CODCENTROCUSTO').asString);

           sLinha := CompletaString(scod_Sistema, '0', 2, 'E') +
                     cdsLancamento.FieldByName('DATA_PROCESSAMENTO').asString +
                     CompletaString(s_NumLote,  '0', 8, 'E') +
                     CompletaString(intToStr(iSeq), '0', 8, 'E') +
                     CompletaString(('Nr. Documento: '+ cdsLancamento.FieldByName('NODOCUMENTO').asString), ' ', 30, 'D') +
                     CompletaString(sCod_Empresa, '0', 2, 'E') +
                     CompletaString(sCod_Origem,  '0', 5, 'E') +
                     CompletaString(cdsLancamento.FieldByName('COD_FORCLI').asString, '0', 8, 'E') +
                     CompletaString(sCod_Pagto, '0', 4, 'E') +
                     CompletaString(sCod_Forma, '0', 2, 'E') +
                     CompletaString(RemoveCaracEspciais(formatFloat('#,##0.00', fValor)), ' ', 14, 'D') +
                     cdsLancamento.FieldByName('DATAVENCTO').asString +
                     CompletaString(Copy(cdsLancamento.FieldByName('OBS').asString,0,255), ' ', 255, 'D') +
                     CompletaString(sCod_Programa, '0', 3, 'E') +
                     CompletaString(sCod_OrgPagto, '0', 5, 'E') +
                     CompletaString(sPes_TipoCli, '0', 2, 'E') +
                     CompletaString(sPes_Nome, ' ', 50, 'D') +
                     CompletaString(sPes_Documento, ' ', 15, 'D') +
                     CompletaString(sPes_TipoPes, '0', 2, 'E') +
                     CompletaString(sPes_Titular, '0', 2, 'E') +
                     stringOfChar(' ',  2) +
                     CompletaString(sCod_PlanoPrev, '0', 6, 'E') +
                     CompletaString(sCod_CentroCusto, '0', 6, 'E') +
                     StringOfChar(' ', 50) +
                     StringOfChar('0', 3);
        end;
        writeLn(arq, sLinha);

        cdsLancamento.Next;
      end;
      TudoOK := not frmProgresso.Cancelou;
    except
      TudoOk := false;
      ShowMessage('Ocorreu um erro durante a exportaçao');
    end;
  finally
    if TudoOk then begin
      iLoteExportaCtb := CtrlLoteexportactb.GravarLoteexportactb(cdsLancamento.Data,
                                                     edtDesc.Text, sRecPag,
                                                     StrToInt(s_NumLote),
                                                     bApropriado );
      if iLoteExportaCtb = -1 then showMessage(CtrlLoteexportactb.MessageInfo);

      // Efetua baixa dos documentos a Pagar
      if (sRecPag = 'P') and (rbValor.ItemIndex = 0) and (cbBaixaCap.Checked) then
         BaixaCAP(iLoteExportaCtb);
    end;

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

procedure TFrmExportaLancMT.btnSelecionarClick(Sender: TObject);
begin
  inherited;
  if NomeArq.Execute then begin
    edtPath.Text := NomeArq.FileName;
  end;
end;

procedure TFrmExportaLancMT.bbtnCancelarClick(Sender: TObject);
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

procedure TFrmExportaLancMT.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  CtrlDocumento.Free;
  CtrlLoteexportactb.Free;
  inherited;
end;

procedure TFrmExportaLancMT.sbMarcarClick(Sender: TObject);
var i : Integer;
begin
  inherited;
  for i := 0 to ChkLBModulos.Items.Count - 1 do
    ChkLBModulos.checked[i] := True;
end;

procedure TFrmExportaLancMT.sbDesmarcaClick(Sender: TObject);
var i : Integer;
begin
  inherited;
  for i := 0 to ChkLBModulos.Items.Count - 1 do
    ChkLBModulos.checked[i] := False;
end;

procedure TFrmExportaLancMT.rbRecPagClick(Sender: TObject);
begin
  inherited;
  // Para VALIA - somente serão exportados as receitas efetivadas ( baixadas )
  if Sistema.TipoCliente = 20041 then begin
     rbValor.ItemIndex := rbRecPag.ItemIndex;
     if rbRecPag.ItemIndex = 0 then
          SNomeArquivo := 'AP04' + formatDateTime('ddmmyyyy', now) + '.TXT'
     else SNomeArquivo := 'AR04' + formatDateTime('ddmmyyyy', now) + '.TXT';
     NomeArq.FileName  := sNomeArquivo;
     edtPath.Text := NomeArq.InitialDir  + SNomeArquivo;

     cbBaixaCAP.Checked := (rbRecPag.ItemIndex = 0);
     cbBaixaCAP.Enabled := (rbRecPag.ItemIndex = 0);
     lbBaixaCAP.Enabled := (rbRecPag.ItemIndex = 0);
  end;
end;




function TFrmExportaLancMT.BaixaCAP(const iIdExportaCtb: Integer): Boolean;
begin
   Result := True;
   try
      cdsLancamento.First;
      while not cdsLancamento.Eof do begin
         CtrlDocumento.OpenTransaction := False;
         CtrlDocumento.Prepare( OpLanctoDocum, odlBaixa );
         CtrlDocumento.UsaPlanoPatro := Sistema.UsaPlanoPatro;
         CtrlDocumento.IdUsuario     := Sistema.IdUsuario;
         CtrlDocumento.IdEspAcesso   := Sistema.IdEspAcesso;
         CtrlDocumento.IdModulo      := Sistema.IdModulo;
         CtrlDocumento.CodDocumento  := cdsLancamento.FieldByName('CODDOCUMENTO').AsInteger;

         CtrlDocumento.Lanctodocum.SetValues(cdsLancamento.FieldByName('DATAVENCTO').AsDateTime,
                                             cdsLancamento.FieldByName('CODDOCUMENTO').AsInteger,
                                             0,
                                             cdsLancamento.FieldByName('VLR_LIQUIDO').AsFloat,
                                             0,
                                             cdsLancamento.FieldByName('VLR_LIQUIDO').AsFloat,
                                             0, 0, 0,
                                             Sistema.IdUsuario, Sistema.IdEmpresa,
                                             0, 0,
                                             cdsLancamento.FieldByName('CODTIPDOC').AsInteger,
                                             0, 0, '', '', '', '',
                                             'Baixa Automática por Exportação',
                                             '', '', '', 'D',
                                             Sistema.IdModulo, 0, Sistema.UsaPlanoPatro,
                                             False);

         if not CtrlDocumento.Insert then
            raise Exception.Create( CtrlDocumento.MessageInfo );

         // Insere o registro na RecbtoPagto
         If Not CtrlDocumento.RecbToPagto.Inserir(cdsLancamento.FieldByName('CODDOCUMENTO').AsInteger,
                                                  CtrlDocumento.Lanctodocum.NumLancto,
                                                  Sistema.IdUsuario, 0, 0, 0, 0, 0, '',
                                                  cdsLancamento.FieldByName('DATAVENCTO').AsString,
                                                  cdsLancamento.FieldByName('DATAVENCTO').AsString) then
            raise Exception.Create( CtrlDocumento.MessageInfo );


         if not CtrlDocumento.ExecSQL('UPDATE LANCTODOCUM SET IDLOTEEXPORTACTB = ' + IntToStr(iIdExportaCtb)        +#13+
                                      ' WHERE CODDOCUMENTO = ' + cdsLancamento.FieldByName('CODDOCUMENTO').AsString +#13+
                                      '   AND NUMLANCTO    = ' + IntToStr(CtrlDocumento.Lanctodocum.NumLancto) ) then
            raise Exception.Create( CtrlDocumento.MessageInfo );

         cdsLancamento.Next;
      end;
   except
      On E: Exception Do Begin
        Result := False;
        ShowMessage(E.Message);
      End;
   end;
end;

function TFrmExportaLancMT.StrTran(sValor, sBusca, sTroca: String; bPrimeira: Boolean): String;
var iPos: Integer;
begin
   Result := sValor;
   if sBusca = sTroca then Exit;
   iPos := Pos(sBusca, sValor);
   while iPos <> 0 do begin
      Delete(sValor,iPos, Length(sBusca));
      if sTroca <> '' then
         Insert(sTroca,sValor,iPos);
      if bPrimeira then Exit;
      iPos := Pos(sBusca, sValor);
   end;
   Result := sValor;
end;

end.

