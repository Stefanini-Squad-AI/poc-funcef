// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    :  Ádler Teodoro de Souza
// Data        :  19/02/2009
// Pendência   : SOL 109421 KINTANA 496332
// Descricao   :  Alteração de gravação de arquivos de log na raiz do disco C: .
//------------------------------------------------------------------------------
unit fParamVerificaAlfabMensal;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls, Db,
  DBTables, Wwquery, Wwdatsrc, Mask, wwdbedit, Wwdotdot, Wwdbcomb, Machklb,
  wwdblook, checklst, TREdit, Spin, IvDictio, IvMulti, IvEMulti,
  ComCtrls, Grids, Wwdbigrd, IniFiles, Wwdbgrid, DBGrids, FSairAjuda;

type
  TfrmParamVerificaAlfabMensal = class(TfrmSairAjuda)
    qryEstab: TwwQuery;
    qryParamRH: TwwQuery;
    gbxEstab: TGroupBox;
    dblkcbEstab: TwwDBLookupCombo;
    gbxAnoMesRef: TGroupBox;
    cmbMes: TComboBox;
    speAno: TSpinEdit;
    ToolbarSep972: TToolbarSep97;
    bbtnVerificar: TBitBtn;
    pnlResult: TPanel;
    dbgrdResult: TwwDBGrid;
    dsAlfabMensal: TwwDataSource;
    qryAlfabMensal: TwwQuery;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dblkcbEstabChange(Sender: TObject);
    procedure bbtnVerificarClick(Sender: TObject);
  private
    procedure LeAlteracoes;
    procedure HabilitaBtOk;
  public
    { Public declarations }
  end;

var
  frmParamVerificaAlfabMensal: TfrmParamVerificaAlfabMensal;

implementation

uses uSistema, uMensErro, uFuncoesUteisRH, dRelatorios2, UsoGeralRH;

{$R *.DFM}

procedure TfrmParamVerificaAlfabMensal.LeAlteracoes;
var
  sEstab: string;
  ArqConfig: TIniFile;
begin
  // Recupera as últimas alterações das opções
  //ArqConfig := TIniFile.Create('C:\CONFIG_FOLHAPAGTO.INI');
  ArqConfig := TIniFile.Create(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\CONFIG_FOLHAPAGTO.INI');//Ádler Teodoro de Souza SOL 109421 KINTANA 496332
  sEstab    := ArqConfig.ReadString ('REL_ALFABMENSAL', 'Estabelec', '');

  if (sEstab = '') then
  begin
    qryEstab.First;
    sEstab := qryEstab.FieldByName('CODIGO').asString;
  end;
  dblkcbEstab.LookUpValue := sEstab;
  dblkcbEstab.UpDate;

  HabilitaBtOk;

  ArqConfig.Free;
end;

procedure TfrmParamVerificaAlfabMensal.FormCreate(Sender: TObject);
begin
  inherited;
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

  cmbMes.ItemIndex := ExtraiMes(qryParamRH.FieldByName('NORMALINI').asDateTime) - 1;
  speAno.Text      := Copy(qryParamRH.FieldByName('NORMALINI').asString,7,4);

  // Carrega alterações nas opções feitas anteriormente
  LeAlteracoes;
end;

procedure TfrmParamVerificaAlfabMensal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  qryEstab.Close;
  qryEstab.unPrepare;
  qryParamRH.Close;
  inherited;
end;

procedure TfrmParamVerificaAlfabMensal.HabilitaBtOk;
begin
  bbtnVerificar.Enabled := (Trim(dblkcbEstab.Text) <> '') and (Trim(speAno.Text) <> '');
end;

procedure TfrmParamVerificaAlfabMensal.dblkcbEstabChange(Sender: TObject);
begin
  inherited;
  HabilitaBtOk;
end;

procedure TfrmParamVerificaAlfabMensal.bbtnVerificarClick(Sender: TObject);
begin
  inherited;
  if (WindowState = wsNormal) then
  begin
    WindowState := wsMaximized;
    pnlResult.BringToFront;
  end
  else
  begin
    WindowState := wsNormal;
    pnlResult.SendToBack;    
  end;

  pnlResult.Visible := (WindowState = wsMaximized);

  qryAlfabMensal.Close;
  with (qryAlfabMensal.SQL) do
  begin
    Clear;
    Add('SELECT DISTINCT');
    Add('  PJ.RAZAOSOCIAL AS EMPRESA,');
    Add('  RTRIM(E.LOGRADOURO) ||'', ''|| E.NUMERO ||''''|| DECODE(E.COMPLEMENTO,'' '','' - '' ||''''||');
    Add('    RTRIM(E.COMPLEMENTO)) ||'' - ''|| RTRIM(E.BAIRRO) ||'' - ''|| RTRIM(CIDADES.NOME) ||'' - CEP:''||');
    Add('    RTRIM(SUBSTR(E.CEP,1,5)) ||''-''|| RTRIM(SUBSTR(E.CEP,6,3)) AS ENDERECO,');
    Add('  ES.CODESTADO AS UF,');
    Add('  F.MATRICULA,');
    Add('  PF.NOME,');
    Add('  UPPER(CC.NOME) AS NOMECENTROCUSTO, CC.CODREDUZIDO,');
    Add('  F.DATAADMISSAO,');
    Add('  RTRIM(C.TITULO) AS CARGO,');
    Add('  DECODE(ST.TIPOSIT,''A'',1,DECODE(ST.TIPOSIT,''F'', 1,0))');

    Add('FROM');
    Add('  PESSOA PJ, PESSOA PF, ENDPESS E, FUNCIONARIO F, ESTADO ES, CIDADES,');
    Add('  CARGO C, CENTCUST CC, SITFUNC ST');
    // -----------------------------------------------------------------------
    Add('WHERE');
    Add('  (PJ.IDPESSOA       = '+qryEstab.FieldByName('CODIGO').asString+') AND');

    // C. de Custo(s) habilitado(s) para o usuário
    if (sUsuXccusto <> '') then
      Add('  (F.CODCENTROCUSTO IN ' +sUsuXccusto+ ') AND');

    Add('  (F.DATAADMISSAO   <= TO_DATE('+QuotedStr(PoeZero(ExtraiDia(Date)) +'/'+
      PoeZero(cmbMes.ItemIndex+1) +'/'+ speAno.Text)+',''DD/MM/YYYY'')) AND');

    Add('  (ST.IDSITFUNC      = F.IDSITFUNC(+))       AND');
    Add('  (PJ.IDPESSOA       = E.IDPESSOA)        AND');
    Add('  (PJ.IDENDCOMERCIAL = E.IDENDERECO)      AND');
    Add('  (E.IDCIDADES       = CIDADES.IDCIDADES) AND');
    Add('  (CIDADES.IDESTADO  = ES.IDESTADO)       AND');
    Add('  (PJ.IDPESSOA       = F.IDESTAB)         AND');
    Add('  (F.IDPESSOA        = PF.IDPESSOA)       AND');
    Add('  (F.CODCENTROCUSTO  = CC.CODCENTROCUSTO) AND');
    Add('  (F.IDEMPRESA       = CC.IDEMPRESA)      AND');
    Add('  (F.IDCARGO         = C.IDCARGO)');
    //SaveToFile ('c:\qry.txt');
    SaveToFile (Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\qry.txt');//Ádler Teodoro de Souza SOL 109421 KINTANA 496332
  end;

  qryAlfabMensal.Open;
end;

end.
