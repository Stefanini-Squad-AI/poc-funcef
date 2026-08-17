unit fParamFormAvalBranco;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, fSelPessoal,
  DBTables, Wwquery, Db, Wwtable, Wwdatsrc, MAHlpBtn, StdCtrls, Buttons, TEdNum, Spin,
  wwdblook, ExtCtrls, TB97, ComCtrls, FTelaAut, TB97Tlbr, IvDictio, IvMulti, IvEMulti,
  wwdbdatetimepicker, CMDateTimePicker;

type
  TfrmParamFormAvalBranco = class(TfrmSelPessoal)
    tbshRelat: TTabSheet;
    qryTipAval: TwwQuery;
    qryPessoal: TwwQuery;
    lblNomeEmp: TLabel;
    dblckNome: TwwDBLookupCombo;
    lblTipoAval: TLabel;
    dblckTipAval: TwwDBLookupCombo;
    gbxOrdem: TGroupBox;
    cmbOrderBy: TComboBox;
    rgSelecao: TRadioGroup;
    gbxTipoPapel: TGroupBox;
    cmbTipoPapel: TComboBox;
    rgObserv: TRadioGroup;
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure rgSelecaoClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  end;

var
  frmParamFormAvalBranco: TfrmParamFormAvalBranco;

implementation

uses uMensErro, uSistema, fAguarde, uFuncoesUteis, dRelatoriosAva, UsoGeralRH;

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

procedure TfrmParamFormAvalBranco.FormCreate(Sender: TObject);
var
  iPos: integer;
begin
  inherited;
  cmbTipoPapel.Items.Assign(dtmRelatoriosAva.rpFormAvalBranco.PrinterSetup.PaperNames);

  iPos := ProcuraStList(cmbTipoPapel.Items,'A4');
  if (iPos = -1) then
    cmbTipoPapel.ItemIndex := 0
  else
    cmbTipoPapel.ItemIndex := iPos;

  qryTipAval.Open;

  qryPessoal.Close;
  with (qryPessoal.SQL) do
  begin
    Clear;
    Add('SELECT P.IDPESSOA, P.NOME');
    Add('FROM   PESSOA P, FUNCIONARIO F');
    Add('WHERE (F.IDPESSOA = P.IDPESSOA)');

    if (sUsuXccusto <> '') then
      Add(' AND F.CODCENTROCUSTO IN ' +sUsuXccusto);

    if (sUsuXfilial <> '') then
      Add(' AND F.IDESTAB IN ' +sUsuXfilial);

    Add('ORDER BY UPPER(P.NOME)');
  end;
  qryPessoal.Open;

  dblckNome.SelText    := qryPessoal.FieldByName('NOME').asString;
  dblckTipAval.SelText := qryTipAval.FieldByName('DESCRTIPOAVAL').asString;
  cmbOrderBy.ItemIndex := 0;
end;

procedure TfrmParamFormAvalBranco.bbtnConfirmarClick(Sender: TObject);
var
  c: integer;
  sListaFunc: string;
begin
  if (rgSelecao.ItemIndex = 1) then
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

    if (c = 0) then
    begin
      ModalResult := mrNone;
      MsgDlg('Não há dados a serem exibidos! Verifique.','Aviso',mtInformation,[mbOk,mbHelp],0);
      exit;
    end;
  end;

  dtmRelatoriosAva.qryFormAvalBranco.Close;
  with (dtmRelatoriosAva.qryFormAvalBranco.SQL) do
  begin
    Clear;
    Add('SELECT');
    Add('  (' +QuotedStr(Sistema.NomeEmpresa)+ ') AS EMPRESA,');
    Add('  TA.DESCRTIPOAVAL, PF.NOME, C.TITULO AS CARGO,');
    Add('  GA.IDGRUPOFATORAVAL, GA.DESCRICAO, FA.OBSFATORAVAL,');
    Add('  FA.DESCRFATORAVAL, F.DATAADMISSAO, CC.NOME AS CENTROCUSTO, PC.NOME AS CHEFE,');
    Add('  (F.DATAADMISSAO + 89) AS FIMEXPERIENCIA');
    Add('FROM');
    Add('  PESSOA PF, PESSOA PC, FUNCIONARIO F, CARGO C, FATORAVAL FA, ');
    Add('  CENTCUST CC, TIPOAVAL TA, GRUPOFATORAVAL GA ');
    Add('WHERE');

    if (rgSelecao.ItemIndex = 1) then
    begin
       if (Trim(sListaFunc) <> '') then
       begin
         if (Pos(',',sListaFunc) > 0) then
            Add('  (PF.IDPESSOA     IN (' +sListaFunc+ ')) AND')
         else
            Add('  (PF.IDPESSOA      = ' +sListaFunc+ ') AND');
       end
       else
            Add('  (PF.IDPESSOA      = -1) AND');
    end
    else
       Add('  (PF.IDPESSOA    = ' +qryPessoal.FieldByName('IDPESSOA').asString+ ') AND');

    Add('  (TA.CODTIPOAVAL   = ' +qryTipAval.FieldByName('CODTIPOAVAL').asString+ ') AND');
    Add('  (PF.IDPESSOA         = F.IDPESSOA) AND');
    Add('  (F.IDEMPRESA         = CC.IDEMPRESA) AND');
    Add('  (F.CODCENTROCUSTO    = CC.CODCENTROCUSTO) AND');
    Add('  (F.IDCARGO           = C.IDCARGO) AND');
    Add('  (FA.IDGRUPOFATORAVAL = GA.IDGRUPOFATORAVAL(+)) AND');
    Add('  (F.IDCHEFE           = PC.IDPESSOA(+))');
    Add('ORDER BY ' + TituloOrdFuncionario[cmbSequencia.ItemIndex]);
    case (cmbOrderBy.ItemIndex) of
      0 : Add(', GA.IDGRUPOFATORAVAL, FA.IDFATORAVAL');
      1 : Add(', GA.DESCRICAO, FA.DESCRFATORAVAL');
    end;
    SaveToFile ('c:\qry.txt');
  end;

  bImpObserv := (rgObserv.ItemIndex = 0);

  dtmRelatoriosAva.rpFormAvalBranco.PrinterSetup.PaperName := cmbTipoPapel.Items[cmbTipoPapel.ItemIndex];


end;

procedure TfrmParamFormAvalBranco.rgSelecaoClick(Sender: TObject);
begin
  inherited;
  dblckNome.Visible  := (rgSelecao.ItemIndex <> 1);
  lblNomeEmp.Visible := (rgSelecao.ItemIndex <> 1);

end;

procedure TfrmParamFormAvalBranco.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  qryTipAval.Close;
  qryPessoal.Close;
end;

end.
