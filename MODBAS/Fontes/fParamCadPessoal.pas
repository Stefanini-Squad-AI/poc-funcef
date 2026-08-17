unit fParamCadPessoal;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, fSelPessoal,
  DBTables, Wwquery, Db, Wwtable, Wwdatsrc, MAHlpBtn, StdCtrls, Buttons, TEdNum, Spin,
  wwdblook, ExtCtrls, TB97, ComCtrls, FTelaAut, TB97Tlbr, IvDictio, IvMulti, IvEMulti,
  wwdbdatetimepicker, CMDateTimePicker;

type
  TfrmParamCadPessoal = class(TfrmSelPessoal)
    gbxTipoPapel: TGroupBox;
    cmbTipoPapel: TComboBox;
    tbsRelat: TTabSheet;
    rgOpcaoColuna: TRadioGroup;
    rgOpcaoColuna2: TRadioGroup;
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  end;

var
  frmParamCadPessoal: TfrmParamCadPessoal;

implementation

uses uMensErro, uSistema, fAguarde, uFuncoesUteis, dRelatoriosComum;

{$R *.DFM}

const
  TituloOrdFuncionario: array[0..11] of string =
    ('UPPER(PF.NOME)',
     'F.MATRICULA',
     'F.IDCARGO, UPPER(PF.NOME)',
     'F.IDCARGO, F.MATRICULA',
     'F.IDEMPRESA, F.CODCENTROCUSTO, UPPER(PF.NOME)',
     'F.IDEMPRESA, F.CODCENTROCUSTO, F.MATRICULA',
     'F.IDEMPRESA, F.IDESTAB, F.CODCENTROCUSTO, UPPER(PF.NOME)',
     'F.IDEMPRESA, F.IDESTAB, F.CODCENTROCUSTO, F.MATRICULA',
     'F.IDEMPRESA, F.CODCENTROCUSTO, F.IDCARGO, UPPER(PF.NOME)',
     'F.IDEMPRESA, F.CODCENTROCUSTO, F.IDCARGO, F.MATRICULA',
     'F.IDEMPRESA, F.IDESTAB, F.CODCENTROCUSTO, F.IDCARGO, UPPER(PF.NOME)',
     'F.IDEMPRESA, F.IDESTAB, F.CODCENTROCUSTO, F.IDCARGO, F.MATRICULA');

  TituloOrdCandidato: array[0..3] of string =
    ('UPPER(PF.NOME)',
     'C.IDPESSOA',
     'C.IDCARGO, UPPER(PF.NOME)',
     'C.IDCARGO, C.IDPESSOA');

procedure TfrmParamCadPessoal.FormCreate(Sender: TObject);
var
  iPos: integer;
begin
  inherited;
  cmbTipoPapel.Items.Assign (dtmRelatoriosComum.rpCadPessoal.PrinterSetup.PaperNames);

  iPos := ProcuraStList (cmbTipoPapel.Items,'A4');
  if (iPos = -1) then
    cmbTipoPapel. ItemIndex := 0
  else
    cmbTipoPapel. ItemIndex := iPos;
end;

procedure TfrmParamCadPessoal.bbtnConfirmarClick(Sender: TObject);
var
  c: integer;
  sListaFunc, sPefixo: string;
begin
  inherited;
  c:=0;
  while not(tblPessoal.EOF) do
  begin
    if (c = 0) then
    begin
      sListaFunc := tblPessoal.FieldByName('IDPESSOA').asString;
      Inc(c);
    end
    else
      sListaFunc := sListaFunc +','+ tblPessoal.FieldByName('IDPESSOA').asString;

    tblPessoal.Next;
  end;

  if (MarcouFuncionario) then
    sPefixo := 'F'
  else
    sPefixo := 'CD';

  with (dtmRelatoriosComum) do
  begin
    qryCadPessoal.Close;
    with (qryCadPessoal.SQL) do
    begin
      Clear;
      Add('SELECT');
      Add('  (' +QuotedStr(Sistema.NomeEmpresa)+ ') AS EMPRESA,');
      Add('  RTRIM(PF.NOME) AS NOME,');

      if (MarcouCandidato) then
      begin
        Add('  TO_CHAR(CD.IDPESSOA) AS MATRICULA, ('''') AS C_CUSTO, C.TITULO AS CARGO,');
        Add('  CD.DAT_ADMIS AS DATAADMISSAO, (''C'') AS TIPO_PESSOA,');
        Add('  ('''') AS DATADESLIGAMENTO,');
        if (rgOpcaoColuna.ItemIndex = 1) then
           Add('  CD.SALARIO AS DATANASC,');
      end
      else
      begin
        Add('  F.MATRICULA, CC.NOME AS C_CUSTO, C.TITULO AS CARGO,');
        Add('  F.DATAADMISSAO, (''F'') AS TIPO_PESSOA,');
        Add('  F.DATADESLIGAMENTO,');
        if (rgOpcaoColuna.ItemIndex = 1) then
           Add('  F.SALARIOATUAL AS DATANASC,');
      end;

      if (rgOpcaoColuna.ItemIndex = 0) then
         Add('  PEFIS.DATANASC,');
      Add('  DECODE(PEFIS.SEXO,''F'',''Feminino'',''Masculino'') AS SEXO,');
      if (rgOpcaoColuna2.ItemIndex = 0) then
      begin
        Add('  DECODE(PEFIS.ESTCIVIL,''S'',''Solteir'' || DECODE(PEFIS.SEXO,''F'',''a'',''o''),');
        Add('    ''C'',''Casad'' || DECODE(PEFIS.SEXO,''F'',''a'',''o''),');
        Add('    ''D'',''Separad'' || DECODE(PEFIS.SEXO,''F'',''a'',''o''),');
        Add('    ''J'',''Separad'' || DECODE(PEFIS.SEXO,''F'',''a'',''o'') || '' Judicialmente'',');
        Add('    ''E'',''Desquitad'' || DECODE(PEFIS.SEXO,''F'',''a'',''o''),');
        Add('    ''V'',''Viúv'' || DECODE(PEFIS.SEXO,''F'',''a'',''o''),');
        Add('    ''O'',''Outro'') AS ESTCIVIL');
      end
      else
        Add('    GRINSTR.DESCRICAO AS ESTCIVIL');
      Add('FROM');
      Add('  PESSOA PF, PESSOAFISICA PEFIS, ' +
        IFF (rgOpcaoColuna2.ItemIndex = 0, '', ' GRINSTR, ') +
        IFF(MarcouFuncionario,'FUNCIONARIO F, CENTCUST CC','CANDIDAT CD')+ ', CARGO C');
      // -------------------------------------------------------------------- //
      Add('WHERE');

      if (Trim(sListaFunc) <> '') then
      begin
        if (Pos(',',sListaFunc) > 0) then
          Add('  (PF.IDPESSOA     IN (' +sListaFunc+ ')) AND')
        else
          Add('  (PF.IDPESSOA      = ' +sListaFunc+ ') AND');
      end
      else
          Add('  (PF.IDPESSOA      = -1) AND');

      Add('  ('+sPefixo+'.IDPESSOA       = PF.IDPESSOA)          AND');
      Add('  (PF.IDPESSOA      = PEFIS.IDPESSOA)       AND');

      if (rgOpcaoColuna2.ItemIndex = 1) then
         Add('  (PEFIS.IDGRINSTR      = GRINSTR.IDGRINSTR(+))    AND');

      if (MarcouFuncionario) then
      begin
        Add('  (F.CODCENTROCUSTO = CC.CODCENTROCUSTO(+)) AND');
        Add('  (F.IDEMPRESA      = CC.IDEMPRESA(+))      AND');
        if (cbxCargoAltern.Checked) then
           Add(' DECODE('+sPefixo+'.IDFUNCAO,NULL,'+sPefixo+'.IDCARGO,'+sPefixo+'.IDFUNCAO) = C.IDCARGO(+) ')
        else
           Add(' '+sPefixo+'.IDCARGO     = C.IDCARGO(+) ');
      end
      else
        Add('  ('+sPefixo+'.IDCARGO        = C.IDCARGO(+))');

      if (MarcouFuncionario) then
        Add('ORDER BY ' + TituloOrdFuncionario[cmbSequencia.ItemIndex])
      else
        Add('ORDER BY ' + TituloOrdCandidato[cmbSequencia.ItemIndex]);

      SaveToFile('c:\qry.txt');

      if (rgOpcaoColuna.ItemIndex = 0) then
      begin
        rpCadPessoalLblDtNasc.Caption := 'Data Nasc.';
        rpCadPessoalDbDtNasc.DisplayFormat := '';
      end
      else
      begin
        rpCadPessoalLblDtNasc.Caption := '  Salário';
        rpCadPessoalDbDtNasc.DisplayFormat := '###,##0.00';
      end;

      if (rgOpcaoColuna2.ItemIndex = 0) then
        rpCadPessoalLbl11.Caption := 'Estado Civil'
      else
        rpCadPessoalLbl11.Caption := 'Escolaridade';

    end;

    rpCadPessoal.PrinterSetup.PaperName := cmbTipoPapel.Items[cmbTipoPapel.ItemIndex];
  end;

  frmAguarde.Mostra('Cadastro de Pessoal');
  frmAguarde.Pos := 0;
  dtmRelatoriosComum.qryCadPessoal.Open;
  if (dtmRelatoriosComum.qryCadPessoal.IsEmpty) then
  begin
    ModalResult := mrNone;
    frmAguarde.Apaga;
    MsgDlg('Não há dados a serem exibidos! Verifique.','Aviso',mtInformation,[mbOk,mbHelp],0);
  end
  else
    dtmRelatoriosComum.bSelDemitidos := cbxDemitidos.Checked;
end;

end.
