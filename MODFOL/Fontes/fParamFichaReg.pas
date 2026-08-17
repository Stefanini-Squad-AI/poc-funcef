// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    :  Ádler Teodoro de Souza
// Data        :  19/02/2009
// Pendência   : SOL 109421 KINTANA 496332
// Descricao   :  Alteração de gravação de arquivos de log na raiz do disco C: .
//------------------------------------------------------------------------------
unit fParamFichaReg;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, MAHlpBtn, Mask,
  StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls, Db, DBTables, Spin, Wwquery, Wwdatsrc, uGImp,
  wwdblook, checklst, TREdit, IvDictio, IvMulti, IvEMulti, IniFiles, ComCtrls, fSairAjuda,
  wwdbdatetimepicker, CMDateTimePicker;

type
  TfrmParamFichaReg = class(TfrmSairAjuda)
    qryFunc: TwwQuery;
    qryEstab: TwwQuery;
    qryParamRH: TwwQuery;
    gbxEstab: TGroupBox;
    dblkcbEstab: TwwDBLookupCombo;
    gbxFunc: TGroupBox;
    chklstFunc: TCheckListBox;
    btImprimir: TBitBtn;
    svdlgDialogo: TOpenDialog;
    GImp: TGImp;
    qryFichaReg: TwwQuery;
    gbDataRef: TGroupBox;
    dtedDataRef: TCMDateTimePicker;
    qryAgBanc: TwwQuery;
    bbtnSelTodosTipoFolha: TBitBtn;
    bbtnInvSelTipoFolha: TBitBtn;
    qryFilhos: TwwQuery;
    qryConjuge: TwwQuery;
    rgNomeEmpresa: TRadioGroup;
    ToolbarSep971: TToolbarSep97;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btImprimirClick(Sender: TObject);
    procedure qryFichaRegBeforeOpen(DataSet: TDataSet);
    procedure qryFichaRegAfterScroll(DataSet: TDataSet);
    procedure qryFichaRegAfterOpen(DataSet: TDataSet);
    procedure dtedDataRefChange(Sender: TObject);
    procedure chklstFuncDrawItem(Control: TWinControl; Index: Integer; Rect: TRect;
      State: TOwnerDrawState);
    procedure bbtnSelTodosTipoFolhaClick(Sender: TObject);
    procedure bbtnInvSelTipoFolhaClick(Sender: TObject);
    procedure chklstFuncClickCheck(Sender: TObject);
    procedure dblkcbEstabChange(Sender: TObject);
    procedure chklstFuncKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    lstFunc: TStringList;
    sCodEstab: string;

    function  GerarDadosSegDes: boolean;
    procedure Imprimir;
    procedure MontaListaFuncionarios;
    procedure HabilitaBtOk;
  end;

var
  frmParamFichaReg: TfrmParamFichaReg;

implementation

uses uSistema, uMensErro, uFuncoesUteis, fAguarde, UsoGeralRH;

{$R *.DFM}

procedure TfrmParamFichaReg.FormCreate(Sender: TObject);
begin
  inherited;
  lstFunc := TStringList.Create;

  // Estabelecimento(s) habilitados para o usuário
  if (sUsuXfilial <> '') then
  begin
    if (Pos(',',sUsuXfilial) > 0) then
      qryEstab.SQL[5] := '  (PJ.IDPESSOA IN ' +sUsuXfilial+ ') AND'
    else
      qryEstab.SQL[5] := '  (PJ.IDPESSOA  = ' +sUsuXfilial+ ') AND';
  end;

  qryEstab.ParamByName('EMPRESA').asInteger := Sistema.IdEmpresa;
  qryEstab.Open;
  qryParamRH.Open;
  qryAgBanc.Open;

  dtedDataRef.Date := qryParamRH.FieldByName('NORMALINI').asDateTime;
end;

procedure TfrmParamFichaReg.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  qryFunc.Close;
  qryEstab.Close;
  qryParamRH.Close;
  qryAgBanc.Close;
  qryFichaReg.Close;

  qryFunc.UnPrepare;  
  inherited;
  lstFunc.Free;
end;

procedure TfrmParamFichaReg.chklstFuncDrawItem(Control: TWinControl; Index: Integer;
  Rect: TRect; State: TOwnerDrawState);
begin
  with (TCheckListBox(Control).Canvas) do
  begin
    if (TCheckListBox(Control).Checked[Index]) then
      if (odSelected in State) then
      begin
        Brush.Color := clTeal;
        Font.Color := clWhite;
      end
      else
      begin
        Brush.Color := CL_AMARELO_CLARO;
        Font.Color := clBlack;
      end;

    FillRect(Rect);
    TextOut(Rect.Left, Rect.Top, TCheckListBox(Control).Items[Index]);
  end;
end;

procedure TfrmParamFichaReg.dblkcbEstabChange(Sender: TObject);
begin
  dblkcbEstab.Text := Trim(dblkcbEstab.Text);

  if (dblkcbEstab.Text <> sCodEstab) then
  begin
    MontaListaFuncionarios;
    sCodEstab := dblkcbEstab.Text;
    chklstFunc.Repaint;
  end;
end;

procedure TfrmParamFichaReg.dtedDataRefChange(Sender: TObject);
begin
  MontaListaFuncionarios;
end;

procedure TfrmParamFichaReg.chklstFuncKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = VK_TAB) then
    InvalidateItemListBox(TCustomListBox(Sender),TCustomListBox(Sender).ItemIndex);
end;

procedure TfrmParamFichaReg.bbtnSelTodosTipoFolhaClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstFunc.Items.Count -1 do
    chklstFunc.Checked[c] := true;
  chklstFunc.Repaint;
end;

procedure TfrmParamFichaReg.bbtnInvSelTipoFolhaClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstFunc.Items.Count -1 do
    chklstFunc.Checked[c] := not(chklstFunc.Checked[c]);
  chklstFunc.Repaint;
end;

procedure TfrmParamFichaReg.chklstFuncClickCheck(Sender: TObject);
begin
  InvalidateItemListBox(TCustomListBox(Sender),TCustomListBox(Sender).ItemIndex);
  HabilitaBtOk;
end;

procedure TfrmParamFichaReg.btImprimirClick(Sender: TObject);
begin
  if not(GerarDadosSegDes) and (qryFichaReg.IsEmpty) then
    ShowMessage('Não há dados a serem impressos!')
  else
    Imprimir;

  frmAguarde.Apaga;
end;

procedure TfrmParamFichaReg.qryFichaRegBeforeOpen(DataSet: TDataSet);
begin
  frmAguarde.Mostra ('Preparando dados...');
  frmAguarde.Pos := 0;
end;

procedure TfrmParamFichaReg.qryFichaRegAfterOpen(DataSet: TDataSet);
begin
  frmAguarde.Mostra ('Imprimindo dados...');
  frmAguarde.Max := qryFichaReg.RecordCount;
  frmAguarde.Min := 0;
  frmAguarde.UpDate;
end;

procedure TfrmParamFichaReg.qryFichaRegAfterScroll(DataSet: TDataSet);
begin
  frmAguarde.Pos := frmAguarde.Pos + 1;
  frmAguarde.Update;

  qryConjuge.Close;
  qryConjuge.ParamByName('IDTITULAR').asFloat := qryFichaReg.FieldByName('IDPESSOA').asFloat;
  qryConjuge.Open;

  qryFilhos.Close;
  qryFilhos.ParamByName('IDTITULAR').asFloat := qryFichaReg.FieldByName('IDPESSOA').asFloat;
  qryFilhos.Open;
end;

function TfrmParamFichaReg.GerarDadosSegDes: boolean;
var
  sFunc, sAnoMes: string;
begin
  Result := false;

  CriaListaOpcoes (chklstFunc, lstFunc, sFunc, ',', false);

  if (sFunc = '') then
  begin
    MsgDlg ('Pelo menos um empregado deve ser selecionado !',
            'Aviso', mtInformation,[mbOk,mbHelp],0);
    exit;
  end;

  // Data de Competência
  sAnoMes := RetornaAnoMes(dtedDataRef.Date);

  // Monta a Query
  qryFichaReg.Close;
  with (qryFichaReg.SQL) do
  begin
    Clear;
    Add('SELECT DISTINCT');
    Add('  PJ.RAZAOSOCIAL AS ESTAB, F.IDPESSOA,');
    Add('  RTRIM(PF.NOME) AS EMPREGADO,PF.NUMDOCUMENTO AS CPF,');
    Add('  RTRIM(E.LOGRADOURO) || DECODE(E.NUMERO,NULL,'''','', ''|| E.NUMERO) ||');
    Add('    DECODE(E.BAIRRO,NULL,'''','', ''|| RTRIM(E.BAIRRO)) AS ENDERECO,');
    Add('  RTRIM(E.COMPLEMENTO) AS COMPLEMENTO,');
    Add('  RTRIM(SUBSTR(E.CEP,1,5)) ||'' ''|| RTRIM(SUBSTR(E.CEP,6,3)) AS CEP,');
    Add('  ES.CODESTADO AS UF, PEFIS.CODESTADO AS UFNASC,');
    Add('  CIDADES.NOME AS CIDADE,');
    Add('  PAIS.NOMENACIONALIDADE AS NACIONALIDADE, PAIS.NOMEPAIS AS PAIS,');
    Add('  DECODE(PEFIS.ESTCIVIL,''S'',''Solteir'' || DECODE(PEFIS.SEXO,''F'',''a'',''o''),');
    Add('    ''C'',''Casad'' || DECODE(PEFIS.SEXO,''F'',''a'',''o''),');
    Add('    ''D'',''Separad'' || DECODE(PEFIS.SEXO,''F'',''a'',''o''),');
    Add('    ''J'',''Separad'' || DECODE(PEFIS.SEXO,''F'',''a'',''o'') || '' Judicialmente'',');
    Add('    ''E'',''Desquitad'' || DECODE(PEFIS.SEXO,''F'',''a'',''o''),');
    Add('    ''V'',''Viúv'' || DECODE(PEFIS.SEXO,''F'',''a'',''o''),');
    Add('    ''O'',''Outro'') AS ESTCIVIL,');
    Add('  CC.NOME AS C_CUSTO, F.SALARIOATUAL,');
    Add('  ( DECODE(F.TIPOPAGAMENTO, ''H'',''Horista'', ''D'',''Diarista'',');
    Add('    ''M'', ''Mensalista'', ''T'',''Tarefa'')) AS TIPOPAGAMENTO,');
    Add('  RTRIM(PEFIS.NOMEMAE)   AS MAE, RTRIM(PEFIS.NOMEPAI)   AS PAI,');
    Add('  FP.IDITEMCNAE AS CNAE,');
    Add('  RTRIM(EJ.LOGRADOURO) || DECODE(EJ.NUMERO,NULL,'''','', ''|| EJ.NUMERO) ||');
    Add('    DECODE(EJ.BAIRRO,NULL,'''','', ''|| RTRIM(EJ.BAIRRO)) AS ENDEMPRESA,');
    Add('  PIS.NUM       AS PIS,');
    Add('  RG.NUM        AS RG, RG.ORGAORG,');
    Add('  RTRIM(CTPS.NUM) AS CTPS,');
    Add('  RTRIM(CTPS.UF)  AS CTPS_UF,');
    Add('  CBO.IDCBO       AS CBO,');
    Add('  RTRIM(C.TITULO) AS OCUPACAO,');
    Add('  TO_CHAR(F.DATAADMISSAO,''DD/MM/YYYY'')     AS ADMISSAO,');
    Add('  DECODE(PEFIS.SEXO,''M'',1,''F'',2) AS SEXO,');
    Add('  RTRIM(GI.DESCRICAO)                AS GRAUINSTRU,');
    Add('  TO_CHAR(PEFIS.DATANASC,''DD/MM/YYYY'') AS NASCIMENTO,');
    Add('  F.DATAOPCAOFGTS,');
//    Add('  (''104'') AS N_BANCO,');
    Add('  (''Caixa Economica Federal'') AS N_BANCO,');
    // Agência  do Funcionário ...
    Add('  SUBSTR(AG.NUMAGENCIA,1,4) ||'' ''|| SUBSTR(AG.NUMAGENCIA,5,1) AS N_AGENCIA,');
    Add('  RTRIM(AGENC.NOME) AS AGENCIA,');
    Add('  TRUNC((SYSDATE - 1 - DATANASC)/365.25) AS IDADE ');
    Add('FROM');
    // -------------------------------------------------------------------------------- //
    // Se imprime Agência do FGTS do Funcionário...
    Add('  PESSOA PJ, PESSOA PF, PESSOA AGENC, PESSOAFISICA PEFIS, ENDPESS E, ENDPESS EJ,');
    Add('  FUNCIONARIO F, FILIALPESSOA FP, CARGO C, AGENCIABANCARIA AG,');
    Add('  BANCO B, CIDADES, ESTADO ES, CBO, GRINSTR GI, HORATRAB HT, PAIS, CENTCUST CC, ');
    // -------------------------------------------------------------------------------- //
    // PIS do Funcionário
    Add('  (SELECT F.IDPESSOA, TDP.MASCARA, DP.NUMDOCUMENTO AS NUM');
    Add('   FROM   DOCPESSOA DP, FUNCIONARIO F, TIPODOCPESSOA TDP, TIPODOCOFICIAL TDO');
    Add('   WHERE (TDO.SIGLADOCUMENTO = ''PIS/PASEP:'') AND');
    Add('         (TDO.IDDOCUMENTO    = DP.IDDOCUMENTO) AND');
    Add('         (TDP.IDDOCUMENTO    = DP.IDDOCUMENTO) AND');
    Add('         (DP.IDPESSOA        = F.IDPESSOA)) PIS,');
    // -------------------------------------------------------------------------------- //
    // Cart. Ident. do Funcionário
    Add('  (SELECT F.IDPESSOA, TDP.MASCARA, DP.NUMDOCUMENTO AS NUM, DP.ORGAO AS ORGAORG ');
    Add('   FROM   DOCPESSOA DP, FUNCIONARIO F, TIPODOCPESSOA TDP, TIPODOCOFICIAL TDO');
    Add('   WHERE (TDO.SIGLADOCUMENTO = ''RG:'') AND');
    Add('         (TDO.IDDOCUMENTO    = DP.IDDOCUMENTO) AND');
    Add('         (TDP.IDDOCUMENTO    = DP.IDDOCUMENTO) AND');
    Add('         (DP.IDPESSOA        = F.IDPESSOA)) RG,');
    // -------------------------------------------------------------------------------- //
    // CTPS do Funcionário
    Add('  (SELECT F.IDPESSOA, DP.NUMDOCUMENTO AS NUM, ES.CODESTADO AS UF');
    Add('   FROM   DOCPESSOA DP, FUNCIONARIO F, TIPODOCOFICIAL TDO, TIPODOCPESSOA TDP,');
    Add('          ESTADO ES, PAIS PA');
    Add('   WHERE (TDO.SIGLADOCUMENTO = ''CTPS:'')      AND');
    Add('         (TDO.IDDOCUMENTO    = DP.IDDOCUMENTO) AND');
    Add('         (TDP.IDDOCUMENTO    = DP.IDDOCUMENTO) AND');
    Add('         (F.IDPESSOA         = DP.IDPESSOA)    AND');
    Add('         (DP.IDPAIS          = PA.IDPAIS)      AND');
    Add('         (ES.IDPAIS          = PA.IDPAIS)      AND');
    Add('         (DP.IDESTADO        = ES.IDESTADO)) CTPS');
    // -------------------------------------------------------------------------------- //
    Add('WHERE');
    Add('  (FP.IDFILIALPESSOA     = ' +qryEstab.FieldByName('CODIGO').asString+ ') AND');

    if (sFunc <> '') then
    begin
      if (Pos(',',sFunc) > 0) then
        Add('  (F.IDPESSOA        IN ('+sFunc+'))         AND')
      else
        Add('  (F.IDPESSOA         = '+sFunc+')           AND');
    end;

    Add('  (FP.IDFILIALPESSOA = PJ.IDPESSOA)          AND');
    Add('  (FP.IDFILIALPESSOA = F.IDESTAB)            AND');
    Add('  (F.IDHORARIO       = HT.IDHORARIO)         AND');
    Add('  (F.IDPESSOA        = PF.IDPESSOA)          AND');
    Add('  (F.IDPESSOA        = PEFIS.IDPESSOA)       AND');
    Add('  (F.IDCARGO         = C.IDCARGO)            AND');
    Add('  (C.CBO             = CBO.IDCBO)            AND');
    Add('  (PEFIS.IDGRINSTR   = GI.IDGRINSTR)         AND');
    Add('  (F.IDAGENCIAFGTS   = AG.IDPESSOA)          AND');
    Add('  (AG.IDBANCO        = B.IDPESSOA)           AND');
    Add('  (AG.IDPESSOA       = AGENC.IDPESSOA)       AND');
    Add('  (PJ.IDENDCOMERCIAL = EJ.IDENDERECO)        AND');
    Add('  (E.IDENDERECO      = PF.IDENDRESIDENCIAL)  AND');
    Add('  (E.IDCIDADES       = CIDADES.IDCIDADES)    AND');
    Add('  (CIDADES.IDESTADO  = ES.IDESTADO)          AND');
    Add('  (F.IDPESSOA        = CTPS.IDPESSOA(+))     AND');
    Add('  (F.IDPESSOA        = PIS.IDPESSOA(+))      AND');
    Add('  (F.IDPESSOA        = RG.IDPESSOA(+))       AND');
    Add('  (F.CODCENTROCUSTO  = CC.CODCENTROCUSTO(+)) AND');
    Add('  (PEFIS.IDPAIS      = PAIS.IDPAIS(+))');
    Add('ORDER BY');
    Add('  EMPREGADO');
    //SaveToFile('c:\qry.txt');
    SaveToFile(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\qry.txt');//Ádler Teodoro de Souza SOL 109421 KINTANA 496332
  end;
  qryFichaReg.Open;

  Result := true;
end;

procedure TfrmParamFichaReg.Imprimir;
var
  c: byte;
{->}function CTPS (Ini,Tam:byte; Campo:string): string;
    var
      c: byte;
      sAux: string;
    begin
      for c:=1 to length(Campo) do
        if (Campo[c] in ['0'..'9']) then
          sAux := sAux + Campo[c];

      Result := Replicate ('0',Abs(Tam-Length(Copy(sAux,Ini,Tam)))) + Copy(sAux,Ini,Tam);
{->}end;

begin
  if (GImp.Inicializar) then
  begin
    GImp.EjetarPagina           := false;
    GImp.SaltodeLinhaCondensado := false;
    GImp.TipoFonte              := TfNormal;
    GImp.Condensado             := true;
    GImp.Sublinhado             := false;
    try
      // Imprimo cada linha Funcionário
      while not(qryFichaReg.EOF) do
      begin
        // Espaço do Cabeçalho
        for c:=1 to 4 do
          GImp.ImprimirTexto(' ');

        // (01) - Nome e Endereço da Empresa
        GImp.ImprimirTexto(Replicate(' ',30)+ IFF(rgNomeEmpresa.ItemIndex = 1,
          Alinha(qryFichaReg.FieldByName('ESTAB').asString,70,'C',' '),Replicate(' ',70)) +
          Replicate(' ',7) + Alinha(qryFichaReg.FieldByName('ENDEMPRESA').asString,70,'C',' '));

        GImp.ImprimirTexto(' ');
        GImp.ImprimirTexto(' ');
        // (02) - Nome do Funcionário
        GImp.ImprimirTexto(Replicate(' ',67)+
          Alinha(qryFichaReg.FieldByName('EMPREGADO').asString,68,'E',' '));

        // (03) - Idade, Data de Nascimento Nacion. e País
        GImp.ImprimirTexto(' ');
        GImp.ImprimirTexto(' ');
        GImp.ImprimirTexto(Replicate(' ',35)+
          Alinha(qryFichaReg.FieldByName('IDADE').asString,9,'D',' ')+' '+
          Alinha(qryFichaReg.FieldByName('NASCIMENTO').asString,18,'C',' ')+'  '+
          Alinha(qryFichaReg.FieldByName('NACIONALIDADE').asString,18,'E',' ')+
          Alinha(qryFichaReg.FieldByName('PAIS').asString,29,'C',' '));

        // (04) - UF de Nascimento, Est. Civil e CPF
        GImp.ImprimirTexto(' ');
        GImp.ImprimirTexto(Replicate(' ',35)+
          Alinha(qryFichaReg.FieldByName('UFNASC').asString,7,'D',' ')+
          Alinha(qryFichaReg.FieldByName('ESTCIVIL').asString,42,'C',' ')+
          Alinha(qryFichaReg.FieldByName('CPF').asString,37,'C',' '));

        // (05) - Carteira Profissional e Identidade
        GImp.ImprimirTexto(' ');
        GImp.ImprimirTexto(Replicate(' ',37)+
          // Número da CTPS
          Alinha(CTPS(1,7,Trim(qryFichaReg.FieldByName('CTPS').asString)),21,'C',' ')+
          // Série da CTPS
          Alinha(CTPS(8,5,Trim(qryFichaReg.FieldByName('CTPS').asString))+
            '/'+qryFichaReg.FieldByName('CTPS_UF').asString,12,'D',' ')+
          Replicate(' ',49)+
          Alinha(qryFichaReg.FieldByName('RG').asString,33,'C',' '));

        // (06) - Emitente Carteira de Identidade e Grau Instrução
        GImp.ImprimirTexto(' ');
        GImp.ImprimirTexto(Replicate(' ',39)+
          Alinha(qryFichaReg.FieldByName('ORGAORG').asString,18,'E',' ')+Replicate(' ',55)+
          Alinha(qryFichaReg.FieldByName('GRAUINSTRU').asString,40,'E',' '));

        GImp.ImprimirTexto(' ');
        // (07) - Nome do Pai e da Mãe do Funcionário
        GImp.ImprimirTexto(Replicate(' ',59)+
          Alinha(qryFichaReg.FieldByName('PAI').asString,53,'E',' '));
        GImp.ImprimirTexto(Replicate(' ',59)+
          Alinha(qryFichaReg.FieldByName('MAE').asString,53,'E',' '));

        // (08) - Nome do Cônjuge do Funcionário
        GImp.ImprimirTexto(' ');
        GImp.ImprimirTexto(' ');
        GImp.ImprimirTexto(' ');
        GImp.ImprimirTexto(Replicate(' ',98)+
          Alinha(qryConjuge.FieldByName('CONJUGE').asString,75,'E',' '));

        // (09) - Endereço do Funcionário e Filhos
        GImp.ImprimirTexto(' ');
        GImp.ImprimirTexto(' ');
        GImp.ImprimirTexto(Replicate(' ',9)+
          Alinha(qryFichaReg.FieldByName('ENDERECO').asString,75,'E',' ')+
          IFF(not qryFilhos.EOF,
              Alinha(qryFilhos.FieldByName('SEXOFIL').asString,12,'E',' ')+
              Replicate(' ',01)+
              Alinha(qryFilhos.FieldByName('FILHO').asString,58,'E',' ')+
              Replicate(' ',01)+
              Alinha(qryFilhos.FieldByName('NASCFILHO').asString,17,'C',' '),
              Replicate(' ',01)));
        qryFilhos.Next;

        for c:=1 to 4 do
          if (qryFilhos.EOF) then
            GImp.ImprimirTexto(' ')
          else
          begin
            GImp.ImprimirTexto(Replicate(' ',84)+
              Alinha(qryFilhos.FieldByName('SEXOFIL').asString,12,'E',' ')+
              Replicate(' ',1)+
              Alinha(qryFilhos.FieldByName('FILHO').asString,58,'E',' ')+
              Replicate(' ',1)+
              Alinha(qryFilhos.FieldByName('NASCFILHO').asString,17,'C',' '));
            qryFilhos.Next;
          end;

        // (10) - FGTS
        GImp.ImprimirTexto(Replicate(' ',5)+
          Alinha(qryFichaReg.FieldByName('DATAOPCAOFGTS').asString,20,'C',' ')+Replicate(' ',17)+
          // Nome do banco RANIERE e não número
          Alinha(qryFichaReg.FieldByName('N_BANCO').asString,32,'C',' ')+
          IFF(not qryFilhos.EOF,Replicate(' ',26)+
              Alinha(qryFilhos.FieldByName('SEXOFIL').asString,12,'E',' ')+
              Replicate(' ',01)+
              Alinha(qryFilhos.FieldByName('FILHO').asString,58,'E',' ')+
              Replicate(' ',01)+
              Alinha(qryFilhos.FieldByName('NASCFILHO').asString,17,'C',' '),
              Replicate(' ',01)));

        // (11) - Admissão, CBO e PIS
        GImp.ImprimirTexto(' ');
        GImp.ImprimirTexto(Replicate(' ',40)+
          Replicate(' ',4)+Alinha(qryFichaReg.FieldByName('ADMISSAO').asString,21,'C',' ')+
          Alinha(qryFichaReg.FieldByName('CBO').asString,21,'C',' ')+Replicate(' ',20)+
          Alinha(qryFichaReg.FieldByName('PIS').asString,29,'C',' '));

        // (12) - Forma de Pagamento
        GImp.ImprimirTexto(' ');        
        GImp.ImprimirTexto(' ');
        GImp.ImprimirTexto(Replicate(' ',40)+
          Alinha(qryFichaReg.FieldByName('TIPOPAGAMENTO').asString,42,'C',' '));

        // (13) - Salário, Cargo e C.Custo
        GImp.ImprimirTexto(' ');
        GImp.ImprimirTexto(Replicate(' ',35)+
          Replicate(' ',08)+RightPad(FormatFloat('###,###,##0.00',qryFichaReg.FieldByName('SALARIOATUAL').asFloat),20)+
          Replicate(' ',33)+Alinha(qryFichaReg.FieldByName('OCUPACAO').asString,34,'C',' ') +
          Replicate(' ',02)+Alinha(qryFichaReg.FieldByName('C_CUSTO').asString,37,'C',' '));

        // Imprimo o final da página
        for c:=1 to 9 do
          GImp.ImprimirTexto(' ');

        // Próximo funcionário
        qryFichaReg.Next;
      end;
      frmAguarde.Apaga;
      GImp.Finalizar;
      ShowMessage('Dados impressos com sucesso !');
    except
      frmAguarde.Apaga;
      GImp.Finalizar;
      ShowMessage ('Ocorreu um erro durante a impressão !');
    end;
  end;
end;

procedure TfrmParamFichaReg.MontaListaFuncionarios;
begin
  qryFunc.Close;
  lstFunc.Clear;
  chklstFunc.Items.Clear;

  if (dblkcbEstab.Text <> '') then
  begin
    qryFunc.ParamByName('ESTAB').asString   := qryEstab.FieldByName('CODIGO').asString;
    qryFunc.ParamByName('DATAREF').asString := RetornaAnoMes(dtedDataRef.Date);
    qryFunc.Open;

    while not(qryFunc.EOF) do
    begin
      lstFunc.Add(qryFunc.FieldByName('IDPESSOA').asString);
      chklstFunc.Items.Add(qryFunc.FieldByName('EMPREGADO').asString);
      qryFunc.Next;
    end;
  end;

  HabilitaBtOk;
end;

procedure TfrmParamFichaReg.HabilitaBtOk;
var
  c: integer;
  bSelFunc: boolean;
begin
  bSelFunc := false;
  for c:=0 to chklstFunc.Items.Count-1 do
    if (chklstFunc.Checked[c]) then
    begin
      bSelFunc := true;
      break;
    end;

  btImprimir.Enabled := (bSelFunc) and (Trim(dtedDataRef.Text) <> '');
end;

end.
