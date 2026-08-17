unit FWizPlanilhaSPC;

{-----------------------------------------------------------------------------------------
  Desenvolvedor: Antonio Marcos Fernandes de Souza (amf)
  Data         : 13.02.2006
  Pendência    : 21336
  Implementação: Geração de Planilha no formato Excel5. Para gerar a planilha, é necessário
                 o Template com as contas e as fórmulas. O programa lê o Template e gera
                 a nova planilha baseado no exercício selecionado.
-----------------------------------------------------------------------------------------}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FWizardMT, IvDictio, IvMulti, IvEMulti, fcButton, fcImgBtn, fcShapeBtn,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, fcLabel, ComCtrls, ExtCtrls,
  Grids, Mask, wwdbedit, Db, uCmSqlParams, DBClient, wwclient, Wwdbigrd,
  Wwdbgrid, wwdblook, AxCtrls, OleCtrls, vcf1, uCMClientDataSet, uCtrlPeriodo,
  uCtrlPadroes, uSistema, uMensErro, uVerificaPreenchimento, uCtrlPlanoSaldo,
  uCtrlParamIntegra, fProgresso, uCtrlParamImportOrc;

Const
  VetorEnumerado  : Array['A'..'Z'] Of Integer =
   (1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26);

  VetEnumCelula: array[1..26] of string[1] =
   ('A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'X', 'Y', 'W', 'Z');

type
  TfrmWizPlaniSpc = class(TfrmWizardMT)
    OpenDialog: TOpenDialog;
    Label1: TLabel;
    lblCaminho: TLabel;
    edtCaminho: TEdit;
    bitBtnAbrir: TBitBtn;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel5: TPanel;
    Panel6: TPanel;
    Memo1: TMemo;
    dbgrPatro: TwwDBGrid;
    cdsPatro: TwwClientDataSet;
    sqlPatro: TCMSqlParams;
    dsPat: TDataSource;
    dbgrPlanoPrev: TwwDBGrid;
    cdsPlanoPrev: TwwClientDataSet;
    sqlPlanoPrev: TCMSqlParams;
    dsPrev: TDataSource;
    Label3: TLabel;
    dblkExerc: TwwDBLookupCombo;
    cdsExercicio: TCMClientDataSet;
    strgPlani: TStringGrid;
    Planilha: TF1Book;
    cdsSaldo: TCMClientDataSet;
    cdsPlaEstrut: TCMClientDataSet;
    procedure bitBtnAbrirClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnContinuarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cdsPlaEstrutBeforePost(DataSet: TDataSet);
  private
    { Private declarations }
    //Guarda a lista de Logs.
    ListaLog: TStringList;
    //Guarda a estrutura da planilha origem do usuário.
    ListaEstrut: TStringList;
    CtrlPeriodo: TCtrlPeriodo;
    CtrlPlanoSaldo: TCtrlPlanoSaldo;
    CtrlParamImportOrc: TCtrlParamImportOrc;

    sListaPlanoPatro, sListaPlanoPrev: string;
    procedure PreencheStrGrid;
    function ColunasOK: boolean;
    function PlanosPatroSelecionados: boolean;
    function VerificaPreenchimento: boolean;
    function VarrePlanilha: boolean;
    function ObterConta(const pLinha: integer;
                        const pColuna: integer;
                        const pConta: string): string;
    function ObterSaldoInicial(const pLinha: integer;
                               const pColuna: integer;
                               const pConta: string;
                               const pSinal: string): extended;
    function ObterCelula(const pLinha: integer;
                             const pColuna: integer): string;
    function ObterSelecionados(const cdsLista: TwwClientDataSet;
                               const sFieldName: string):string;
    function GravarLog(const pCelula:string; const pLin: integer; const pCol: integer;
                       const pTipo: string): boolean;
    function EFormula(const pText: string): boolean;
    function MaxLinhas: integer;
  public
    { Public declarations }
  end;

var
  frmWizPlaniSpc: TfrmWizPlaniSpc;

implementation

{$R *.DFM}

{ TfrmWizPlaniSpc }

procedure TfrmWizPlaniSpc.PreencheStrGrid;
   {--} procedure MontaHeaderLista;
        begin
           //Header da StringGrid
           strgPlani.Cells[1,0] := 'Conta Contábil';
           strgPlani.Cells[2,0] := 'Saldo Inicial';
           strgPlani.Cells[0,1] := 'Coluna';

           //Movimentos Mensais
           strgPlani.Cells[3,0] := 'Jan';
           strgPlani.Cells[4,0] := 'Fev';
           strgPlani.Cells[5,0] := 'Mar';
           strgPlani.Cells[6,0] := 'Abr';
           strgPlani.Cells[7,0] := 'Mai';
           strgPlani.Cells[8,0] := 'Jun';
           strgPlani.Cells[9,0] := 'Jul';
           strgPlani.Cells[10,0] := 'Ago';
           strgPlani.Cells[11,0] := 'Set';
           strgPlani.Cells[12,0] := 'Out';
           strgPlani.Cells[13,0] := 'Nov';
           strgPlani.Cells[14,0] := 'Dez';
    {--}end;

   {--} procedure CarregaLista(const pList: TStringList = nil);
        begin
           cdsPlaEstrut.Data := CtrlParamImportOrc.GetParam(Sistema.IdModulo);

           if (cdsPlaEstrut.FieldByName('IDMODULO').AsFloat = Sistema.IdModulo) then
           begin
              cdsPlaEstrut.Edit;

              //coluna Conta
              strgPlani.Cells[1, 1] := cdsPlaEstrut.FieldByName('COLCODCONTA').AsString;
              //coluna Saldo Inicial
              strgPlani.Cells[2, 1] := cdsPlaEstrut.FieldByName('COLSALDOINICIAL').AsString;

              //Janeiro a Dezembro
              strgPlani.Cells[3, 1] :=  cdsPlaEstrut.FieldByName('COLJANEIRO').AsString;
              strgPlani.Cells[4, 1] :=  cdsPlaEstrut.FieldByName('COLFEVEREIRO').AsString;
              strgPlani.Cells[5, 1] :=  cdsPlaEstrut.FieldByName('COLMARCO').AsString;
              strgPlani.Cells[6, 1] :=  cdsPlaEstrut.FieldByName('COLABRIL').AsString;
              strgPlani.Cells[7, 1] :=  cdsPlaEstrut.FieldByName('COLMAIO').AsString;
              strgPlani.Cells[8, 1] :=  cdsPlaEstrut.FieldByName('COLJUNHO').AsString;
              strgPlani.Cells[9, 1] :=  cdsPlaEstrut.FieldByName('COLJULHO').AsString;
              strgPlani.Cells[10, 1] := cdsPlaEstrut.FieldByName('COLAGOSTO').AsString;
              strgPlani.Cells[11, 1] := cdsPlaEstrut.FieldByName('COLSETEMBRO').AsString;
              strgPlani.Cells[12, 1] := cdsPlaEstrut.FieldByName('COLOUTUBRO').AsString;
              strgPlani.Cells[13, 1] := cdsPlaEstrut.FieldByName('COLNOVEMBRO').AsString;
              strgPlani.Cells[14, 1] := cdsPlaEstrut.FieldByName('COLDEZEMBRO').AsString;
           end
           else
              cdsPlaEstrut.Append;
   {--} end;

begin
   MontaHeaderLista;
   CarregaLista(ListaEstrut);
end;

procedure TfrmWizPlaniSpc.bitBtnAbrirClick(Sender: TObject);
begin
  inherited;
  if OpenDialog.Execute then
     edtCaminho.Text := OpenDialog.FileName;
end;

procedure TfrmWizPlaniSpc.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlPeriodo    := TCtrlPeriodo.Create;
  CtrlPlanoSaldo := TCtrlPlanoSaldo.Create;
  CtrlParamImportOrc := TCtrlParamImportOrc.Create;
  CtrlPeriodo.InitializeAs (Padroes);
  CtrlPlanoSaldo.InitializeAs(Padroes);
  CtrlParamImportOrc.InitializeAs(Padroes);
  CtrlParamImportOrc.CdsParamImportOrc := cdsPlaEstrut;

  CdsExercicio.Data := CtrlPeriodo.ListExercicios(Sistema.IdEmpresa,True);

  ListaLog := TStringList.Create;
  ListaEstrut := TStringList.Create;
  PreencheStrGrid;
end;

function TfrmWizPlaniSpc.VerificaPreenchimento: boolean;
begin
   Result := (edtCaminho.Text = OpenDialog.Filename) and
             (dblkExerc.Text <> '') and
             (ColunasOk);
end;

function TfrmWizPlaniSpc.ColunasOK: boolean;
var
   i, j: integer;
begin
   Result := False;
   for i := 1 to strgPlani.ColCount - 1 do  //amf só até a coluna P
   begin
       Result := (strgPlani.Cells[i, 1] <> '');
       if not Result then
          break;

       ListaEstrut.Add(strgPlani.Cells[i, 1]);
   end;

   if Result then
   begin
      if cdsPlaEstrut.State = dsBrowse then
      begin
         if cdsPlaEstrut.RecordCount > 0 then
            cdsPlaEstrut.Edit
         else
            cdsPlaEstrut.Append;
      end;

      cdsPlaEstrut.FieldByName('COLCODCONTA').AsString := UpperCase(strgPlani.Cells[1,1]);
      cdsPlaEstrut.FieldByName('COLSALDOINICIAL').AsString := UpperCase(strgPlani.Cells[2,1]);
      cdsPlaEstrut.FieldByName('COLJANEIRO').AsString := UpperCase(strgPlani.Cells[3,1]);
      cdsPlaEstrut.FieldByName('COLFEVEREIRO').AsString := UpperCase(strgPlani.Cells[4,1]);
      cdsPlaEstrut.FieldByName('COLMARCO').AsString := UpperCase(strgPlani.Cells[5,1]);
      cdsPlaEstrut.FieldByName('COLABRIL').AsString := UpperCase(strgPlani.Cells[6,1]);
      cdsPlaEstrut.FieldByName('COLMAIO').AsString := UpperCase(strgPlani.Cells[7,1]);
      cdsPlaEstrut.FieldByName('COLJUNHO').AsString := UpperCase(strgPlani.Cells[8,1]);
      cdsPlaEstrut.FieldByName('COLJULHO').AsString := UpperCase(strgPlani.Cells[9,1]);
      cdsPlaEstrut.FieldByName('COLAGOSTO').AsString := UpperCase(strgPlani.Cells[10,1]);
      cdsPlaEstrut.FieldByName('COLSETEMBRO').AsString := UpperCase(strgPlani.Cells[11,1]);
      cdsPlaEstrut.FieldByName('COLOUTUBRO').AsString := UpperCase(strgPlani.Cells[12,1]);
      cdsPlaEstrut.FieldByName('COLNOVEMBRO').AsString := UpperCase(strgPlani.Cells[13,1]);
      cdsPlaEstrut.FieldByName('COLDEZEMBRO').AsString := UpperCase(strgPlani.Cells[14,1]);
      Result := CtrlParamImportOrc.Grava;
   end
   else
      ListaEstrut.Clear;

end;

function TfrmWizPlaniSpc.PlanosPatroSelecionados: boolean;
var
   bSelecPatro, bSelecPlanoPrev: boolean;
   cdsAuxPatro: TClientDataSet;
   cdsAuxPlanoPrev: TClientDataSet;
begin
   Result := False;
   bSelecPatro := False;
   bSelecPlanoPrev:= False;
   cdsAuxPatro := TClientDataSet.Create(nil);
   cdsAuxPatro.Data := cdsPatro.Data;

   cdsAuxPatro.First;
   while not cdsAuxPatro.Eof do
   begin
      if (cdsAuxPatro.FieldByName('MARCA').AsString <> '') then
         bSelecPatro := True;
      cdsAuxPatro.Next;
   end;


   cdsAuxPlanoPrev := TClientDataSet.Create(nil);
   cdsAuxPLanoPrev.Data := cdsPlanoPrev.Data;

   cdsAuxPlanoPrev.First;
   while not cdsAuxPlanoPrev.Eof do
   begin
      if (cdsAuxPlanoPrev.FieldByName('MARCA').AsString <> '') then
         bSelecPlanoPrev := True;

      cdsAuxPlanoPrev.Next;
   end;

   Result := bSelecPatro and bSelecPlanoPrev;

   FreeAndNil(cdsAuxPatro);
   FreeAndNil(cdsAuxPlanoPrev);
end;

procedure TfrmWizPlaniSpc.btnContinuarClick(Sender: TObject);
var
  //constante para o formato excel
  F1FileExcel5: smallInt;
begin
  if not VerificaPreenchimento then
  begin
     MsgDlg ('O caminho do arquivo não foi preenchido ou o exercício não foi preenchido ' + #13#10 +
      'ou as colunas da planilha não foram preenchidas !', 'Aviso', mtWarning, [mbok], 0);
     abort;
  end;

  cdsPatro.DisableControls;
  cdsPlanoPrev.DisableControls;

  Planilha.Read(OpenDialog.FileName, F1FileExcel5);

  sListaPlanoPatro := '';
  sListaPlanoPrev  := '';

  sListaPlanoPrev       := ObterSelecionados(cdsPlanoPrev, 'IDPLANOPREV');
  sListaPlanoPatro      := ObterSelecionados(cdsPatro, 'IDPESSOA');

  VarrePlanilha;

  Planilha.Visible := False;

  if (not frmProgresso.Cancelou) and (ListaLog.Count = 0) then
  begin
      Planilha.Visible := True;
      Planilha.PrintHeader := 'Demonstrativo Contábil ' + dblkExerc.LookupValue;
      Planilha.LaunchDesigner;
  end;

  frmProgresso.EscondeFormProgresso;

  Memo1.Visible := not Planilha.Visible;
  Memo1.Lines.Assign(ListaLog);


  //Salva a planilha mantendo a planilha original
  Planilha.Write(ExtractFilePath(OpenDialog.FileName) + 'DemoContab' + dblkExerc.LookUpValue + '.XLS', F1FileExcel5);

  PagControle.ActivePageIndex := 2;

  cdsPatro.EnableControls;
  cdsPlanoPrev.EnableControls;

  inherited;
end;

procedure TfrmWizPlaniSpc.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FreeAndNil(ListaLog);
  FreeAndNil(ListaEstrut);
  FreeAndNil(CtrlPeriodo);
  FreeAndNil(CtrlParamImportOrc);
  inherited;
end;

function TfrmWizPlaniSpc.VarrePlanilha: boolean;
var
  sMes: string;
  sFormula: string;
  iLinha, iColuna, iMaxLinhas: integer;
  sIni, sFim, sPlaConta: string;
  rValor: extended; // Para guardar o valor do movimento.

   {--} procedure CarregaMovimentos(const pSinal: string);
        var
           i: integer;
           iColMes: integer;
           iColStrGrid: integer; // coluna no StringGrid
        begin
           cdsSaldo.Data := CtrlPlanoSaldo.RetornaSaldoContaExercLista
                            (StrToInt(dblkExerc.LookUpValue),
                             12,
                             ParamIntegra.Plano,
                             Sistema.IdEmpresa,
                             sPlaConta,
                             tAtual,
                             ObterSelecionados(cdsPlanoPrev, 'IDPLANOPREV'),
                             ObterSelecionados(cdsPatro, 'IDPESSOA'),
                             False,
                             '',
                             True
                             );

           iColStrGrid := 2; // Saldo Inicial
           while ((not cdsSaldo.Eof) and (iColStrGrid < 15)) do {14 = Dezembro}
           begin
              iColMes := VetorEnumerado[strgPlani.Cells[iColStrGrid, 1][1]];
              inc(iColStrGrid);

              //Saldo Inicial
              if (cdsSaldo.FieldByName('PERNUMERO').IsNull) then
                 Planilha.NumberRC[iLinha, iColMes] := ObterSaldoInicial(iLinha,
                                                       iColMes,
                                                       sPlaConta,
                                                       pSinal)
              else
              begin //meses de Janeiro a Dezembro
                 if (not cdsSaldo.FieldByName('SALDO').isNull) then
                   rValor := cdsSaldo.FieldByName('SALDO').AsFloat
                 else
                   rValor := 0;

                 if pSinal = '-' then
                    rValor := rValor * (-1);

                Planilha.NumberRC[iLinha, iColMes] := rValor;
              end;

              cdsSaldo.Next;
           end;
   {--} end;

   {--} function EmBranco: boolean;
        var
           sText: string;
           col: integer;
        begin
          Result := Planilha.TextRC[iLinha, 1] = '';
          Result := Result and (Planilha.TextRC[iLinha, 2] = '');

   {--} end;

begin

   Result := False;

   sIni := '';
   sFim := '';
   iLinha := 1;

   iMaxLinhas := MaxLinhas;

   frmProgresso.MostraFormProgresso ('Montando a Demonstração Contábil',
                                      true,
                                      true,
                                      true,
                                      0,
                                      iMaxLinhas);

  //varre toda a planilha
   while (sIni <> '#INI') or (sFim <> '#FIM') do
   begin

      if Planilha.TextRC[iLinha, 1] = '#INI' then
      begin
         sIni := Planilha.TextRC[iLinha, 1]; // início da planilha
         inc(iLinha);
         Continue;
      end;

      if Planilha.TextRC[iLinha, 1] = '#FIM' then
      begin
         sFim := Planilha.TextRC[iLinha, 1]; // fim da planilha
         inc(iLinha);
         Continue;
      end;

      frmProgresso.Legenda := 'Montando conta: ' + sPlaConta;

      frmProgresso.AndaFormProgresso(iLinha, iMaxLinhas);

      if frmProgresso.Cancelou then
         abort;

      if not EmBranco then
      begin
         if Planilha.TextRC[iLinha, 1] = '' then
         begin
            // Saldo Inicial
            sFormula := ObterCelula(iLinha, VetorEnumerado[strgPlani.Cells[2,1][1]]);
            iColuna := VetorEnumerado[strgPlani.Cells[2,1][1]];
            if (not EFormula(sFormula)) then
               begin
                  GravarLog(sFormula, iLinha, iColuna, 'Fórmula');
                  Planilha.TextRC[iLinha, iColuna] := '#ERRO';
               end;
         end;
      end;

      if Planilha.TextRC[iLinha, 1] = 'C' then
      begin
         //Obter Saldo Inicial
         iColuna := VetorEnumerado[strgPlani.Cells[1,1][1]];
         sPlaConta := Planilha.TextRC[iLinha, iColuna];
         sPlaconta := ObterConta(iLinha, iColuna, sPlaConta);

        //Carrega Movimento Mensal
         CarregaMovimentos('+');
      end;

      if Planilha.TextRC[iLinha, 1] = '-C' then
      begin
         //Obtém conta
         iColuna := VetorEnumerado[strgPlani.Cells[1,1][1]];
         sPlaconta := Planilha.TextRC[iLinha, iColuna];
         sPlaconta := ObterConta(iLinha, iColuna, sPlaConta);

         //Carrega Movimento Mensal
         CarregaMovimentos('-');
      end;

      inc(iLinha);
   end;

   Result := True;
end;

function TfrmWizPlaniSpc.ObterConta(const pLinha: integer;
                                    const pColuna: integer;
                                    const pConta: string): string;
var
   i: integer;
   sConta: string;
begin
  Result := '';
  for i := 1  to length(pConta) do
  begin
    case pConta[i] of
     '0', '1', '2', '3',
     '4', '5', '6', '7', '8', '9': sConta := sConta + pConta[i];
    end;
  end;

  //retira os zeros a direita
  for i := Length(sConta) downto 1 do
  begin
     if sConta[i] = '0' then
        Delete(sConta, i, 1)
     else
        break;
  end;

  Result := sConta;

end;


function TfrmWizPlaniSpc.ObterSaldoInicial(const pLinha: integer; const pColuna: integer;
  const pConta: string; const pSinal: string): extended;
var
   sFormula: string;
   rValor: extended;
begin
   sFormula := ObterCelula(pLinha, pColuna);
   if sFormula <> '' then
   begin
   if EFormula(sFormula) then ;
      begin
         GravarLog(sFormula, pLinha, pColuna, 'Valor');
         Planilha.TextRC[pLinha, pColuna] := '#ERRO';
      end;
   end
   else
   begin
      Result := 0;
      if (not cdsSaldo.FieldByName('SALDO').IsNull) then
         Result := cdsSaldo.FieldByName('SALDO').AsFloat;
   end;

   if pSinal = '-' then
      Result := Result * (-1);
end;


function TfrmWizPlaniSpc.ObterCelula(const pLinha,
  pColuna: integer): string;
begin
   Result := Planilha.FormulaRC[pLinha, pColuna];
end;

function TfrmWizPlaniSpc.ObterSelecionados(
  const cdsLista: TwwClientDataSet; const sFieldName: string): string;
begin
   Result := '';
   cdsLista.First;
   while not cdsLista.Eof do
   begin
      if cdsLista.FieldByName('MARCA').AsString = 'S' then
      begin
      if Result = '' then
         Result := cdsLista.FieldByName(sFieldName).AsString
      else
         Result := Result + ',' + cdsLista.FieldByName(sFieldName).AsString;
      end;
      cdsLista.Next;
   end;
end;

function TfrmWizPlaniSpc.GravarLog(const pCelula: string; const pLin,
  pCol: integer; const pTipo: string): boolean;
begin
  if pTipo = 'Formula' then
     ListaLog.Add('Era esperada uma fórmula na Célula ' + VetEnumCelula[pCol] + IntToStr(pLin))
  else
     ListaLog.Add('Não era esperada um fórmula na Célula ' + VetEnumCelula[pCol] + IntToStr(pLin));
end;

function TfrmWizPlaniSpc.EFormula(const pText: string): boolean;
var
  iValor: integer;
begin
  Result := False;
  try
    iValor := StrToInt(pText);
  except
    Result := True;
  end;
end;

function TfrmWizPlaniSpc.MaxLinhas: integer;
var
   iLinha: integer;
   sIni, sFim: string;
begin

   Result := 0;
   iLinha := 1;
   sIni := '';
   sFim := '';
   while (sIni <> '#INI') or (sFim <> '#FIM') do
   begin
      if Planilha.TextRC[iLinha, 1] = '#INI' then
         sIni := Planilha.TextRC[iLinha, 1]; // início da planilha

      if Planilha.TextRC[iLinha, 1] = '#FIM' then
         sFim := Planilha.TextRC[iLinha, 1]; // fim da planilha

      inc(iLinha);
   end;

   Result := iLinha;
end;

procedure TfrmWizPlaniSpc.cdsPlaEstrutBeforePost(DataSet: TDataSet);
begin
  inherited;
  if DataSet.FieldByName('IDMODULO').IsNull then
      DataSet.FieldByName('IDMODULO').Value := Sistema.IdModulo;
end;

end.
