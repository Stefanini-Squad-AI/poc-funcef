unit fParamCrachaAux;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, MAHlpBtn, Db,
  StdCtrls, Buttons, ExtCtrls, DBTables, Wwquery, wwdblook, TB97, ComCtrls, TB97Tlbr,
  IvDictio, IvMulti, IvEMulti, fSairAjuda;
  
type
  TfrmParamCrachaAux = class(TfrmSairAjuda)
    rgSelecao: TRadioGroup;
    dblcFunc: TwwDBLookupCombo;
    rgImprDescr: TRadioGroup;
    bbtnConfirmar: TBitBtn;
    ToolbarSep971: TToolbarSep97;
    qry: TwwQuery;
    qryDocCodBarr: TQuery;
    rgCodBarra: TRadioGroup;
    gbxCodBar: TGroupBox;
    dblckcmbDocCodBarr: TwwDBLookupCombo;
    cbxCargoAltern: TCheckBox;
    qryParam: TwwQuery;
    procedure FormCreate(Sender: TObject);
    procedure rgSelecaoClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure rgCodBarraClick(Sender: TObject);
  private
    procedure HabilitaBtOk;
  end;

var
  frmParamCrachaAux: TfrmParamCrachaAux;

implementation

uses uSistema, uMensErro, fAguarde, uFuncoesUteisRH, dRelatoriosComum, UsoGeralRH, uDataBase;

{$R *.DFM}

procedure TfrmParamCrachaAux.FormCreate(Sender: TObject);
begin
  inherited;
  qryDocCodBarr.Open;

  FazQuery(qryParam, 'SELECT FLGDOISCARGOS FROM PARAMRH');
  cbxCargoAltern.Visible := (qryParam.FieldByName('FLGDOISCARGOS').asInteger = 1);
  cbxCargoAltern.Checked := (qryParam.FieldByName('FLGDOISCARGOS').asInteger = 1);
  qryParam.Close;

  qry.Close;
  with (qry.SQL) do
  begin
    Clear;
    Add('SELECT');
    Add('  PF.IDPESSOA, PF.NOME');
    Add('FROM');
    Add('  PESSOA PF, FUNCIONARIO F');
    Add('WHERE');

    if (sUsuXccusto <> '') then
      Add('  (F.CODCENTROCUSTO IN ' +sUsuXccusto+ ') AND');

    if (sUsuXfilial <> '') then
      Add('  (F.IDESTAB        IN ' +sUsuXfilial+ ') AND');

    Add('  (F.IDPESSOA        = PF.IDPESSOA)');
    Add('ORDER BY UPPER(PF.NOME)');
  end;
  qry.Open;

  dblcFunc.Text := qry.FieldByName('NOME').asString;
end;

procedure TfrmParamCrachaAux.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  qry.Close;
  inherited;
end;

procedure TfrmParamCrachaAux.rgSelecaoClick(Sender: TObject);
begin
  dblcFunc.Visible := (rgSelecao.ItemIndex = 0);
  HabilitaBtOk;
end;

procedure TfrmParamCrachaAux.rgCodBarraClick(Sender: TObject);
begin
  gbxCodBar.Visible := (rgCodBarra.ItemIndex = 1);
end;

procedure TfrmParamCrachaAux.bbtnConfirmarClick(Sender: TObject);
begin
  with (dtmRelatoriosComum) do
  begin
    qryCracha.Close;
    with (qryCracha.SQL) do
    begin
      Clear;
      Add('SELECT');
      // Dados da Empresa
      Add('  (' +QuotedStr(Sistema.NomeEmpresa)+ ') AS EMPRESA,');
      // Dados do Empregado
      Add('  RTRIM(PF.NOME) AS NOME, F.MATRICULA, PJ.IDIMAGEM AS IDLOGO,');
      Add('  PF.IDIMAGEM, PF.IDPESSOA, RTRIM(PF.HOMEPAGE) AS APELIDO, PEFIS.TIPOSANG,');
      Add('  PEFIS.DATANASC, PEFIS.NOMEPAI, PEFIS.NOMEMAE,');
      Add('  RG.NUMDOCUMENTO AS NUMCARTIDENT, RG.DATAEMISSAO, RG.ORGAO,');
      Add('  RTRIM(ST.DESCRICAO) AS SITUACAO,');
      case (rgCodBarra.ItemIndex) of
        0 : Add('  RTRIM(F.MATRICULA) AS CODBARRA,');
        1 : Add('  CB.NUMDOCUMENTO AS CODBARRA,');
        2 : Add('  ('' '') AS CODBARRA,');
      end;  
      Add('  TO_CHAR(F.DATAADMISSAO,''DD/MM/YYYY'') AS DATAADMISSAO,');
      Add('  DECODE(PEFIS.SEXO,''F'',''Feminino'',''M'',''Masculino'','''') AS SEXO,');
      Add('  DECODE(PEFIS.ESTCIVIL,''S'',''Solteir'' || DECODE(PEFIS.SEXO,''F'',''a'',''o''),');
      Add('    ''C'',''Casad'' || DECODE(PEFIS.SEXO,''F'',''a'',''o''),');
      Add('    ''D'',''Separad'' || DECODE(PEFIS.SEXO,''F'',''a'',''o''),');
      Add('    ''J'',''Separad'' || DECODE(PEFIS.SEXO,''F'',''a'',''o'') || '' Judicialmente'',');
      Add('    ''E'',''Desquitad'' || DECODE(PEFIS.SEXO,''F'',''a'',''o''),');
      Add('    ''V'',''Viúv'' || DECODE(PEFIS.SEXO,''F'',''a'',''o''),');
      Add('    ''O'',''Outro'') AS ESTCIVIL,');
      Add('  DECODE(F.TIPOCONTRATO, ''E'',''Efetivo'', ''S'',''Efetivo Especial'',');
      Add('    ''T'',''Temporário'', ''G'',''Estagiário'', ''3'',''Terceiro'',');
      Add('    ''P'',''Proprietário'', ''A'',''Autônomo'', ''Indefinido'') ||');
      Add('    DECODE(F.DATAFIMCONTRATO,NULL,'''','' (Até '' ||');
      Add('    TO_CHAR(F.DATAFIMCONTRATO,''DD/MM/YYYY'')) AS VINCULO,');
      Add('  E.LOGRADOURO, E.BAIRRO, E.CEP, E.NUMERO, CI.NOME AS CIDADE,');
      Add('  (CI.NOME ||''-''|| ES.CODESTADO) AS CIDADE_UF, ES.CODESTADO, E.COMPLEMENTO,');
      Add('  PJ.NOME AS ESTAB, SUBSTR(C.TITULO,INSTR(C.TITULO,''/'')+1,30) AS CARGO,');
      Add('  PR.DESCRICAO AS PROFISSAO, NVL(F.SALARIOATUAL,0) AS SALARIOATUAL,');
      Add('  DECODE(CCE.CCUSTOESP,NULL,CC.NOME,CCE.CCUSTOESP) AS C_CUSTO,');
      Add('  DECODE(F.TIPOPAGAMENTO, NULL,'''',');
      Add('    ''('' || DECODE(F.TIPOPAGAMENTO, ''H'',''Horista'', ''D'',''Diarista'',');
      Add('    ''M'', ''Mensalista'', ''T'',''Tarefa'') || '')'') AS TIPOPAGAMENTO,');
      Add('  GR.DESCRICAO AS GRINSTR ');
      Add('FROM');
      Add('  PESSOA PJ, PESSOA PF, PESSOAFISICA PEFIS, ENDPESS E, FUNCIONARIO F,');
      Add('  SITFUNC ST, CIDADES CI, CARGO C, PROFISS PR, CENTCUST CC, GRINSTR GR,');
      Add('  ESTADO ES,');
      // -------------------------------------------------------------------- //
      // Cart Ident do Funcionário
      Add('  (SELECT D.IDPESSOA, D.NUMDOCUMENTO, D.DATAEMISSAO, D.ORGAO ');
      Add('   FROM   DOCPESSOA D, TIPODOCOFICIAL T ');
      Add('   WHERE (T.CODDOCUMENTO = ''25'') AND');
      Add('         (D.IDDOCUMENTO  = T.IDDOCUMENTO)) RG,');
      // -------------------------------------------------------------------- //
      // Centro Custo Especial do Funcionário
      Add('  (SELECT D.IDPESSOA, D.NUMDOCUMENTO AS CCUSTOESP ');
      Add('   FROM   DOCPESSOA D, TIPODOCOFICIAL T ');
      Add('   WHERE (T.SIGLADOCUMENTO = ''LOTACAO:'') AND');
      Add('         (T.IDDOCUMENTO    = D.IDDOCUMENTO)) CCE');
      // -------------------------------------------------------------------- //
      // Outro Doc. para o Cod. Barra
      if rgCodBarra.ItemIndex = 1 then
      begin
        Add('  ,(SELECT D.IDPESSOA, D.NUMDOCUMENTO ');
        Add('    FROM   DOCPESSOA D ');
        Add('    WHERE (D.IDDOCUMENTO = '+ qryDocCodBarr.FieldByName('IDDOCUMENTO').asString+')) CB');
      end;
      // -------------------------------------------------------------------- //
      Add('WHERE');

      if (rgSelecao.ItemIndex = 0) then
        Add('  (PF.IDPESSOA         = ' +qry.FieldByName('IDPESSOA').asString+ ') AND')
      else
        Add('  (PF.IDPESSOA         = -1) AND');

      Add('  (PF.IDPESSOA         = PEFIS.IDPESSOA) AND');
      Add('  (PF.IDPESSOA         = F.IDPESSOA) AND');
      Add('  (ST.IDSITFUNC        = F.IDSITFUNC) AND');
      Add('  (F.IDESTAB           = PJ.IDPESSOA) AND');

      if (cbxCargoAltern.Checked) then
         Add(' (DECODE(F.IDFUNCAO,NULL,F.IDCARGO,F.IDFUNCAO) = C.IDCARGO(+)) AND')
      else
         Add('  (F.IDCARGO           = C.IDCARGO(+))         AND');

      Add('  (PEFIS.IDPROFISS     = PR.IDPROFISS(+)) AND');
      Add('  (F.CODCENTROCUSTO    = CC.CODCENTROCUSTO(+)) AND');
      Add('  (F.IDEMPRESA         = CC.IDEMPRESA(+)) AND');
      Add('  (PEFIS.IDGRINSTR     = GR.IDGRINSTR(+)) AND');
      Add('  (PF.IDPESSOA         = RG.IDPESSOA(+)) AND');
      Add('  (PF.IDPESSOA         = CCE.IDPESSOA(+)) AND');
      if (rgCodBarra.ItemIndex = 1) then
        Add(' (PF.IDPESSOA         = CB.IDPESSOA(+)) AND');
      Add('  (PF.IDPESSOA         = E.IDPESSOA(+)) AND');
      Add('  (PF.IDENDRESIDENCIAL = E.IDENDERECO(+)) AND');
      Add('  (E.IDCIDADES         = CI.IDCIDADES(+)) AND');
      Add('  (CI.IDESTADO         = ES.IDESTADO(+))');      
      Add('ORDER BY NOME');
      SaveToFile('c:\qry.txt');
    end;

    byImprDescr := rgImprDescr.ItemIndex;
    bMostraForm := (rgSelecao.ItemIndex = 1);
  end;

  if (rgSelecao.ItemIndex = 0) then
  begin
    frmAguarde.Mostra('Emissão de Crachá');
    frmAguarde.Pos := 0;
    dtmRelatoriosComum.qryCracha.Open;
    if (dtmRelatoriosComum.qryCracha.IsEmpty) then
    begin
      ModalResult := mrNone;
      frmAguarde.Apaga;
      MsgDlg('Não há dados a serem exibidos.'+CR_LF+'Verifique.',
        'Aviso', mtWarning, [mbOk,mbHelp], 0);
    end;
  end;
end;

procedure TfrmParamCrachaAux.HabilitaBtOk;
begin
  bbtnConfirmar.Enabled := ((rgSelecao.ItemIndex = 0) and (Trim(dblcFunc.Text) <> '')) or
    (rgSelecao.ItemIndex = 1);
end;

end.
