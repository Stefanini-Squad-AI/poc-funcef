{ --------------------------------------------------------------------------------------------------
Rotina......: ImprimeContrAnalitico, PreencherCamposRel, AjustaSITUACAO, PegaValoresSituacao
              ExisteContrato, MontaCodicaoSituacao
Nº SOL......: 190136  
Nº KINTANA..: 1806055
Data........: 25/03/2013
Responsável.: Felipe Azevedo dos Santos
Descrição...: Inclusão do quadro de situação do contrato que permite filtrar os contratos por situação,
              inclusão do campo Situação no quadro de Campos a Exibir.
-------------------------------------------------------------------------------------------------- }
{ --------------------------------------------------------------------------------------------------
Rotina......: ImprimeContrAnalitico, PreencherCamposRel, AjustaCODCONTRATOEMPR
Nº SOL......: 155071
Nº KINTANA..: 1471869
Data........: 13/12/2011
Responsável.: Vinicius Eduardo Nascimento Maciel
Descrição...: A rotina de geração do relatório foi alterada para que as colunas
              DescriçãoContrato, Observação e Renovação. Sejam geradas
              manualmente, onde os itens são carregados um a um através um loop.
-------------------------------------------------------------------------------------------------- }
{ --------------------------------------------------------------------------------------------------
Rotina......: -
Nº SOL......: 151411
Nº KINTANA..: 1107842
Data........: 15/02/2011
Responsável.: Thaise Amaral Martins
Descrição...: Ajustes nos campos Descrição do Contrato, Observação e Renovação, pois os mesmos
              não podem aparecer em colunas, precisam ser ajustados abaixo das colunas.
-------------------------------------------------------------------------------------------------- }

{ --------------------------------------------------------------------------------------------------
Rotina......: -
Nº SOL......: 99155
Nº KINTANA..: 495508
Data........: 02/09/2010
Responsável.: Thaise Amaral Martins
Descrição...: Criação do relatório de Contratos Analitico com as colunas à escolha do usuário.
-------------------------------------------------------------------------------------------------- }

unit FRelatContratosAnalitico;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, mContrato, CMProcuraSubTipo, MontaSelect,
  wwdblook, Db, DBTables, Wwquery, Wwdatsrc, DBClient, uCMClientDataSet,
  CheckLst, Mask, wwdbedit, uTeclado, wwdbdatetimepicker, CMDateTimePicker,
  NMUDP, dReports;

type
  TfrmRelatContratosAnalitico = class(TfrmOkCancelar)
    MS_Contrato: TMontaSelect;
    gbrContrato: TGroupBox;
    edtContrato: TEdit;
    btnBuscaContrato: TBitBtn;
    btnLimpaContrato: TBitBtn;
    gbrFornecedor: TGroupBox;
    edtFornecedor: TEdit;
    btnBuscaFornec: TBitBtn;
    BitBtn2: TBitBtn;
    MS_Fornecedor: TMontaSelect;
    gbrRateio: TGroupBox;
    dblcRateio: TwwDBLookupCombo;
    dsRateio: TwwDataSource;
    qryRateio: TwwQuery;
    qryRateioCODCENTROCUSTO: TStringField;
    qryRateioNOME: TStringField;
    gbrTotContratos: TGroupBox;
    chklstContratos: TCheckListBox;
    gbrExibir: TGroupBox;
    chklstExibir: TCheckListBox;
    qryContratos: TwwQuery;
    Panel1: TPanel;
    bbtnSelTodos: TBitBtn;
    bbtnInverteSel: TBitBtn;
    gbrDtAssinatura: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    edDTinicio: TCMDateTimePicker;
    edDTfim: TCMDateTimePicker;
    Splitter1: TSplitter;
    Splitter2: TSplitter;
    Panel2: TPanel;
    bbtnSelAllCamp: TBitBtn;
    bbtnInverteSelAllCamp: TBitBtn;
    grbSituacao: TGroupBox;
    chklstSituacao: TCheckListBox;
    bbtnInvertSelSituacao: TBitBtn;
    bbtnSelAllSituacao: TBitBtn;
    qryAux: TwwQuery;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnBuscaContratoClick(Sender: TObject);
    procedure btnBuscaFornecClick(Sender: TObject);
    procedure bbtnSelTodosClick(Sender: TObject);
    procedure bbtnInverteSelClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure edtContratoChange(Sender: TObject);
    procedure edtFornecedorChange(Sender: TObject);
    procedure dblcRateioExit(Sender: TObject);
    procedure edDTinicioExit(Sender: TObject);
    procedure edDTfimExit(Sender: TObject);
    procedure btnLimpaContratoClick(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure bbtnSelAllCampClick(Sender: TObject);
    procedure bbtnInverteSelAllCampClick(Sender: TObject);
    procedure bbtnSelAllSituacaoClick(Sender: TObject);
    procedure bbtnInvertSelSituacaoClick(Sender: TObject);
  private
    sFiltro, sSituacao : String;
    SqlVigente, SqlEncerrado, SqlEmRenovacao, SqlVencNencerrado : string;
    iCodContrato, iCodPessoa : Integer;
    lContratos, lContratosSel, lSituacao : TStrings;
    procedure SqlExecParam;
    procedure MontaListaContratos(qry:TwwQuery);
    procedure ValidaDatas(DtInicio, DtFim: TDatetime);
    procedure SelChkBox(ChkList: TCheckListBox; Sel: Boolean);
    procedure IniciaCheckList;
    procedure ImprimeContrAnalitico;
    procedure PreencherCamposRel;
    function  SeqCodCOntratos: String;
    function  SelectSelCampos: String;
    procedure AjustarCamposSelecionados(Campo: String; nOrdem: Integer);
    procedure AjustaNOMECONTRATO(Ordem: Integer);
    procedure AjustaCODCONTRATOEMPR(Ordem: Integer);
    procedure AjustaDATAASSINATURA(Ordem: Integer);
    procedure AjustaDESCRICAOCONTRATO(Ordem: Integer);
    procedure AjustaVALORBASECONTRATO(Ordem: Integer);
    procedure AjustaRAZAOSOCIAL(Ordem: Integer);
    procedure AjustaNOME_ITEM(Ordem: Integer);
    procedure AjustaNOMEOBJETO(Ordem: Integer);
    procedure AjustaOBSERVACAO(Ordem: Integer);
    procedure AjustaNOME(Ordem: Integer);
    procedure AjustaRENOVACAO(Ordem: Integer);
    procedure AjustaDATAPREVENCERRA(Ordem: Integer);
    procedure AjustaDATAEFETENCERRA(Ordem: Integer);
    procedure AjustaSITUACAO(Ordem : Integer); // Felipe A.Santos SOL 190136 KTN 1806055
    function  ValidaCampos(ChkList: TCheckListBox):boolean;
    procedure PegaValoresSituacao(Expressao, VlrOuQtd : string); // Felipe A.Santos SOL 190136 KTN 1806055
    function ExisteContrato : boolean; // Felipe A.Santos SOL 190136 KTN 1806055
    procedure MontaCodicaoSituacao; // Felipe A.Santos SOL 190136 KTN 1806055
  public
    { Public declarations }
  end;

  type
    PContr = ^TPContr;
    TPContr = record
      sNumContr: String;
  end;

var
  frmRelatContratosAnalitico: TfrmRelatContratosAnalitico;
  PSelContrato: PContr;
implementation
uses DRelatContatoAnalitico, USistema, DBaseDados, UMensErro;
{$R *.DFM}

procedure TfrmRelatContratosAnalitico.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Dispose(PSelContrato);
  Action := caFree;
end;

procedure TfrmRelatContratosAnalitico.btnBuscaContratoClick(
  Sender: TObject);
begin
  inherited;
  sFiltro := MS_Contrato.Filtro.Text;
  MS_Contrato.Filtro.Add(' C.IDCONTRATO IN ' +
                         '(SELECT IDCONTRATO ' +
                         ' FROM   CONTRATOUSUARIO ' +
                         ' WHERE IDUSUARIO = ' + InttoStr(Sistema.IdUsuario) + ')');

  MS_Contrato.Executar;
  Repaint;

  if MS_Contrato.RetornouValor then
  begin
    iCodContrato     := StrToInt(MS_Contrato.ValoresChave[0]);
    edtContrato.Text := MS_Contrato.ValoresChave[1];
  end;

  MS_Contrato.Filtro.Text := sFiltro;
  btnBuscaContrato.SetFocus;
end;

procedure TfrmRelatContratosAnalitico.btnBuscaFornecClick(Sender: TObject);
begin
  inherited;
  sFiltro := MS_Fornecedor.Filtro.Text;

  MS_Fornecedor.Executar;
  Repaint;

  if MS_Fornecedor.RetornouValor then
  begin
    iCodPessoa         := StrToInt(MS_Fornecedor.ValoresChave[0]);
    edtFornecedor.Text := MS_Fornecedor.ValoresChave[1];
  end;

  MS_Fornecedor.Filtro.Text := sFiltro;
  btnBuscaFornec.SetFocus;
end;


procedure TfrmRelatContratosAnalitico.bbtnSelTodosClick(Sender: TObject);
begin
  inherited;
  SelChkBox(chklstContratos, True);
end;

procedure TfrmRelatContratosAnalitico.bbtnInverteSelClick(Sender: TObject);
begin
  inherited;
  SelChkBox(chklstContratos, False);
end;

procedure TfrmRelatContratosAnalitico.bbtnConfirmarClick(Sender: TObject);
begin
  ImprimeContrAnalitico;
  inherited;
end;

procedure TfrmRelatContratosAnalitico.FormCreate(Sender: TObject);
begin
  inherited;
  qryRateio.Close;
  qryRateio.ParamByName('IDUSUARIO').AsInteger:= Sistema.IdUsuario;
  qryRateio.Open;

  IniciaCheckList;
  MontaCodicaoSituacao;  // Felipe A. Santos SOL 190136 KTN 1806055
  sSituacao := QuotedStr('                              ') + ' SITUACAO'; // Felipe A. Santos SOL 190136 KTN 1806055
  PreencherCamposRel;
  bbtnSelAllCamp.OnClick(Self);
  bbtnSelAllSituacao.OnClick(Self); // Felipe A. Santos SOL 190136 KTN 1806055
end;

procedure TfrmRelatContratosAnalitico.SqlExecParam;
var sSql: String;
begin
  sSql:= 'SELECT DISTINCT C.IDCONTRATO, C.NOMECONTRATO'#13#10 +
         'FROM CONTRATOCONTR C, CENTCUST CC, RATEIOCENTROCUSTO R'#13#10 +
         'WHERE C.IDCONTRATO = R.IDCONTRATO(+)'#13#10 +
         'AND R.CODCENTROCUSTO = CC.CODCENTROCUSTO'#13#10 +
         'AND (C.IDPESSOA = ' + InttoStr(Sistema.IdEmpresa) + ')'#13#10 +
         'AND C.IDCONTRATO IN'#13#10 +
         '               (SELECT IDCONTRATO'#13#10 +
         '                FROM   CONTRATOUSUARIO'#13#10 +
         '                WHERE IDUSUARIO = ' + InttoStr(Sistema.IdUsuario) + ')'#13#10;


  if Trim(edtContrato.Text) <> '' then
    sSql:= sSql + ' AND C.IDCONTRATO = ' + IntToStr(iCodContrato);

  if Trim(edtFornecedor.Text) <> '' then
    sSql:= sSql + ' AND C.IDFORCLI = ' + IntToStr(iCodPessoa);

  if Trim(dblcRateio.Text) <> '' then
    sSql:= sSql + ' AND CC.CODCENTROCUSTO = ' + QuotedStr(qryRateio.FieldByName('CODCENTROCUSTO').AsString);

  if (edDTinicio.Text <> '') and (edDTfim.Text <> '') then
    sSql:= sSql + ' AND C.DATAASSINATURA BETWEEN TO_DATE(' + QuotedStr(edDTinicio.Text) + ', ''dd/mm/yyyy'') ' +
                                       ' AND TO_DATE(' + QuotedStr(edDTfim.Text) + ', ''dd/mm/yyyy'') ';


  qryContratos.Close;
  qryContratos.Sql.Clear;
  qryContratos.Sql.Add(sSql);        
  qryContratos.Open;

  //Liberando o ponteiro da memória
  Dispose(PSelContrato);
  MontaListaContratos(qryContratos);
end;

procedure TfrmRelatContratosAnalitico.MontaListaContratos(qry:TwwQuery);
begin
  chklstContratos.Items.Clear;

  if qry.RecordCount > 0 then
  begin
    while not qry.Eof do
    begin
      //Thaise\\
      //Criando referência no ponteiro para guardar o códio na posição do CheckListBox
      New(PSelContrato);
      PSelContrato^.sNumContr:= qry.FieldByName('IDCONTRATO').AsString;
      chklstContratos.Items.AddObject(qry.FieldByName('NOMECONTRATO').AsString + ' - ' + qry.FieldByName('IDCONTRATO').AsString,
                                      Pointer(PSelContrato));
      qry.Next;
    end;
    bbtnSelTodos.OnClick(Self);
  end
  else
    IniciaCheckList;
end;

procedure TfrmRelatContratosAnalitico.edtContratoChange(Sender: TObject);
begin
  inherited;
  if Trim(edtContrato.Text) <> '' then
    SqlExecParam;
end;

procedure TfrmRelatContratosAnalitico.edtFornecedorChange(Sender: TObject);
begin
  inherited;
  if Trim(edtFornecedor.Text) <> '' then
    SqlExecParam;
end;

procedure TfrmRelatContratosAnalitico.dblcRateioExit(Sender: TObject);
begin
  inherited;
  if Trim(dblcRateio.Text) <> '' then
    SqlExecParam;
end;

procedure TfrmRelatContratosAnalitico.edDTinicioExit(Sender: TObject);
begin
  inherited;
  if (edDTinicio.text <> '') and (edDTfim.Text <> '') then
  begin
    ValidaDatas(edDTinicio.Date, edDTfim.Date);
    SqlExecParam;
  end;
end;

procedure TfrmRelatContratosAnalitico.ValidaDatas(DtInicio,
  DtFim: TDatetime);
begin
  if DtFim < DtInicio then
  begin
    MsgDlg('A data final está menor que a data inicial.','Erro',mtError,[mbOK],0);
    edDTfim.SetFocus;
    Abort;
  end;
end;

procedure TfrmRelatContratosAnalitico.edDTfimExit(Sender: TObject);
begin
  inherited;
  if (edDTfim.text <> '') and (edDTinicio.Text <> '') then
  begin
    ValidaDatas(edDTinicio.Date, edDTfim.Date);
    SqlExecParam;
  end;
end;

procedure TfrmRelatContratosAnalitico.btnLimpaContratoClick(
  Sender: TObject);
begin
  inherited;
   iCodContrato := -1;
   edtContrato.Clear;
end;

procedure TfrmRelatContratosAnalitico.BitBtn2Click(Sender: TObject);
begin
  inherited;
   iCodPessoa := -1;
   edtFornecedor.Clear;
end;

procedure TfrmRelatContratosAnalitico.SelChkBox(ChkList: TCheckListBox;
  Sel: Boolean);
  var iCont: Integer;
begin
  for iCont:=0 to ChkList.Items.Count-1 do
  begin
    if Sel then
      ChkList.Checked[iCont] := True
    else
      ChkList.Checked[iCont]:= not(ChkList.Checked[iCont]);
  end;
  ChkList.Repaint;
end;

procedure TfrmRelatContratosAnalitico.bbtnSelAllCampClick(Sender: TObject);
begin
  inherited;
  SelChkBox(chklstExibir, True);
end;

procedure TfrmRelatContratosAnalitico.bbtnInverteSelAllCampClick(Sender: TObject);
begin
  inherited;
  SelChkBox(chklstExibir, False);
end;

procedure TfrmRelatContratosAnalitico.IniciaCheckList;
begin
  //Apontar a palavras 'Todos' com o código '-1'
  New(PSelContrato);
  PSelContrato^.sNumContr:= '-1';
  chklstContratos.Items.AddObject('Todos', Pointer(PSelContrato));
  chklstContratos.Checked[0]:= True;
end;

procedure TfrmRelatContratosAnalitico.ImprimeContrAnalitico;
var x: integer;
begin
  dmtRelatContatoAnalitico.qryRelatAnalitico.Close;
  dmtRelatContatoAnalitico.qryRelatAnalitico.Sql.Clear;
  if (ValidaCampos(chklstExibir)) and (ValidaCampos(chklstContratos)) and (ValidaCampos(chklstSituacao)) and (ExisteContrato) then
  begin

    dmtRelatContatoAnalitico.qryRelatAnalitico.Sql.Add('SELECT * FROM ('); // Felipe A. Santos SOL 190136 KTN 1806055
    dmtRelatContatoAnalitico.qryRelatAnalitico.Sql.Add('SELECT DISTINCT ' + SelectSelCampos + ', C.IDCONTRATO, C.NOMECONTRATO AS ORDEM ,');
    dmtRelatContatoAnalitico.qryRelatAnalitico.Sql.Add('C.FLGFIMCONTRATO, C.FLGRENOVACAO FROM CONTRATOCONTR C, PESSOA F, ITEMCONTRATUAL I, CENTCUST CC, ');
    //Vinicius Maciel SOL 155071 KTN 1471869
    dmtRelatContatoAnalitico.qryRelatAnalitico.Sql.Add('(select IDCONTRATO, cast(OBSERVACAO as varchar2(250)) as OBSERVACAO2, ');
    dmtRelatContatoAnalitico.qryRelatAnalitico.Sql.Add(' cast(RENOVACAO as varchar2(250)) as RENOVACAO2,cast(DESCRICAOCONTRATO as varchar2(250)) AS DESCRICAOCONTRATO2 from CONTRATOCONTR WHERE IDCONTRATO = -1 ) T, ');
    //Vinicius Maciel SOL 155071 KTN 1471869 - FIM

    dmtRelatContatoAnalitico.qryRelatAnalitico.Sql.Add('OBJETOCONTRATUAL O, OBJETOSXITEMCONTR OX, RATEIOCENTROCUSTO R');
    dmtRelatContatoAnalitico.qryRelatAnalitico.Sql.Add('WHERE C.IDCONTRATO = OX.IDCONTRATO');
    dmtRelatContatoAnalitico.qryRelatAnalitico.Sql.Add('AND I.IDITEM = OX.IDITEM');
    dmtRelatContatoAnalitico.qryRelatAnalitico.Sql.Add('AND O.IDOBJETO = OX.IDOBJETO');
    //Vinicius Maciel SOL 155071 KTN 1471869
    //dmtRelatContatoAnalitico.qryRelatAnalitico.Sql.Add('AND C.IDFORCLI = F.IDPESSOA');
    dmtRelatContatoAnalitico.qryRelatAnalitico.Sql.Add('AND C.IDFORCLI = F.IDPESSOA AND C.IDCONTRATO = T.IDCONTRATO(+)');
    //Vinicius Maciel SOL 155071 KTN 1471869 - FIM
    dmtRelatContatoAnalitico.qryRelatAnalitico.Sql.Add('AND C.IDCONTRATO = R.IDCONTRATO(+)');
    dmtRelatContatoAnalitico.qryRelatAnalitico.Sql.Add('AND R.CODCENTROCUSTO = CC.CODCENTROCUSTO');
    dmtRelatContatoAnalitico.qryRelatAnalitico.Sql.Add('AND (C.IDPESSOA = ' + InttoStr(Sistema.IdEmpresa) + ')');
    dmtRelatContatoAnalitico.qryRelatAnalitico.Sql.Add('AND C.IDCONTRATO IN');
    dmtRelatContatoAnalitico.qryRelatAnalitico.Sql.Add(' (SELECT IDCONTRATO');
    dmtRelatContatoAnalitico.qryRelatAnalitico.Sql.Add('  FROM   CONTRATOUSUARIO');
    dmtRelatContatoAnalitico.qryRelatAnalitico.Sql.Add('  WHERE IDUSUARIO = ' + InttoStr(Sistema.IdUsuario) + ')');

    if PContr(chklstContratos.Items.Objects[0])^.sNumContr <> '-1' then
    begin
      if SeqCodCOntratos <> '' then
        dmtRelatContatoAnalitico.qryRelatAnalitico.Sql.Add('AND C.IDCONTRATO IN (' + SeqCodCOntratos + ')');
    end;

    dmtRelatContatoAnalitico.qryRelatAnalitico.Sql.Add('ORDER BY ORDEM');
    dmtRelatContatoAnalitico.qryRelatAnalitico.SQL.Add(') WHERE '); // Felipe A. Santos SOL 190136 KTN 1806055

    dmtRelatContatoAnalitico.QtdCampos:= lContratosSel.Count;

    dmtRelatContatoAnalitico.ContCol    := 0;
    dmtRelatContatoAnalitico.ContColHor := 0;
    dmtRelatContatoAnalitico.ppColDescr1.Caption:= '';
    dmtRelatContatoAnalitico.ppColDescr2.Caption:= '';
    dmtRelatContatoAnalitico.ppColDescr3.Caption:= '';

    for x:= 0 to lContratosSel.Count -1 do
      AjustarCamposSelecionados(lContratosSel.Strings[x], x);

    // Felipe A. Santos SOL 190136 KTN 1806055

    if Assigned(dmtRelatContatoAnalitico.lSituacao) then
       FreeAndNil(lSituacao);

    dmtRelatContatoAnalitico.lSituacao := TStringList.Create;

    for x := 0 to chklstSituacao.items.Count - 1 do
    begin

         if (chklstSituacao.Checked[x]) then
         begin
            dmtRelatContatoAnalitico.lSituacao.Add(chklstSituacao.Items.Strings[x]);
         end;

    end;

    // Filtra os contratos por situação

    for x := 0 to dmtRelatContatoAnalitico.lSituacao.Count - 1 do
    begin
         if (x > 0) then
            dmtRelatContatoAnalitico.qryRelatAnalitico.Sql.Add( ' OR ' );

         if (dmtRelatContatoAnalitico.lSituacao.Strings[x] = 'Vigente') then
            dmtRelatContatoAnalitico.qryRelatAnalitico.Sql.Add(SqlVigente)
         else if (dmtRelatContatoAnalitico.lSituacao.Strings[x] = 'Encerrado') then
            dmtRelatContatoAnalitico.qryRelatAnalitico.Sql.Add(SqlEncerrado)
         else if (dmtRelatContatoAnalitico.lSituacao.Strings[x] = 'Em renovação') then
            dmtRelatContatoAnalitico.qryRelatAnalitico.Sql.Add(SqlEmRenovacao)
         else if (dmtRelatContatoAnalitico.lSituacao.Strings[x] = 'Vencido e não encerrado') then
            dmtRelatContatoAnalitico.qryRelatAnalitico.Sql.Add(SqlVencNencerrado);
    end;

    PegaValoresSituacao('SUM(VALORBASECONTRATO) AS VALOR', 'VALOR');  // pega os valores do contratos por situação
    PegaValoresSituacao('COUNT(*) AS QUANTIDADE', 'QUANTIDADE'); // pega as quantidades de contratos por situação

     // Felipe A. Santos SOL 190136 KTN 1806055 - FIM

    dmtRelatContatoAnalitico.qryRelatAnalitico.Open;

  end;
end;

function TfrmRelatContratosAnalitico.SeqCodCOntratos: String;
var lCodContrato: String;
    x: integer;
begin
  inherited;
  //Pego o código que está na posição do ponteiro dos itens selecionados no CheckListBox
  for x:= 0 to chklstContratos.Items.Count -1 do
  begin
    if chklstContratos.Checked[x] then
      lCodContrato:= lCodContrato + ',' + PContr(chklstContratos.Items.Objects[x])^.sNumContr;
  end;
  Delete(lCodContrato, 1, 1);

  Result:= Trim(lCodContrato);
end;

procedure TfrmRelatContratosAnalitico.PreencherCamposRel;
begin
  lContratos:= TStringList.Create;
  lContratos.Add('C.NOMECONTRATO');
  lContratos.Add('C.CODCONTRATOEMPR');
  lContratos.Add('C.DATAASSINATURA');
  //lContratos.Add('C.DESCRICAOCONTRATO');
  lContratos.Add('T.DESCRICAOCONTRATO2'); //Vinicius Maciel SOL 155071 KTN 1471869
  lContratos.Add('C.VALORBASECONTRATO');
  lContratos.Add('F.RAZAOSOCIAL');
  lContratos.Add('I.NOME_ITEM');
  lContratos.Add('O.NOMEOBJETO');
  //lContratos.Add('C.OBSERVACAO');
  lContratos.Add('T.OBSERVACAO2');  //Vinicius Maciel SOL 155071 KTN 1471869
  lContratos.Add('''RATEIO''');
  //lContratos.Add('C.RENOVACAO');
  lContratos.Add('T.RENOVACAO2');   //Vinicius Maciel SOL 155071 KTN 1471869
  lContratos.Add('C.DATAPREVENCERRA');
  lContratos.Add('C.DATAEFETENCERRA');
  lContratos.Add(sSituacao); // Felipe A. Santos SOL 190136 KTN 1806055
end;

function TfrmRelatContratosAnalitico.SelectSelCampos: String;
var iCont: integer;
    sContratos, aux: String;
begin
  lContratosSel:= TStringList.Create;
  for iCont:= 0 to chklstExibir.Items.Count -1 do
  begin
    if chklstExibir.Checked[iCont] then
    begin
       sContratos:= sContratos + ', ' + lContratos.Strings[iCont];
       Aux:= lContratos.Strings[iCont];
       if (lContratos.Strings[iCont] = sSituacao) then // Felipe A. Santos SOL 190136 KTN 1806055
         lContratosSel.Add('SITUACAO')
       else if lContratos.Strings[iCont] = '''RATEIO''' then
         lContratosSel.Add('RATEIO')
       else
         lContratosSel.Add(Copy(Aux, (pos('.', aux) + 1), Length(aux)));
    end;
  end;

  Delete(sContratos, 1, 1);
  Result:= Trim(sContratos);
end;

procedure TfrmRelatContratosAnalitico.AjustarCamposSelecionados(
  Campo: String; nOrdem: Integer);
begin
  if Campo = 'NOMECONTRATO' then
    AjustaNOMECONTRATO(nOrdem);

  if Campo = 'CODCONTRATOEMPR' then
    AjustaCODCONTRATOEMPR(nOrdem);

  if Campo = 'DATAASSINATURA' then
    AjustaDATAASSINATURA(nOrdem);

  //if Campo = 'DESCRICAOCONTRATO' then
  if Campo = 'DESCRICAOCONTRATO2' then  //Vinicius Maciel SOL 155071 KTN 1471869
    AjustaDESCRICAOCONTRATO(nOrdem);

  if Campo = 'VALORBASECONTRATO' then
    AjustaVALORBASECONTRATO(nOrdem);

  if Campo = 'RAZAOSOCIAL' then
    AjustaRAZAOSOCIAL(nOrdem);

  if Campo = 'NOME_ITEM' then
    AjustaNOME_ITEM(nOrdem);

  if Campo = 'NOMEOBJETO' then
    AjustaNOMEOBJETO(nOrdem);

  //if Campo = 'OBSERVACAO' then
  if Campo = 'OBSERVACAO2' then  //Vinicius Maciel SOL 155071 KTN 1471869
    AjustaOBSERVACAO(nOrdem);

  if Campo = 'RATEIO' then
    AjustaNOME(nOrdem);

  //if Campo = 'RENOVACAO' then
  if Campo = 'RENOVACAO2' then  //Vinicius Maciel SOL 155071 KTN 1471869
    AjustaRENOVACAO(nOrdem);

  if Campo = 'DATAPREVENCERRA' then
    AjustaDATAPREVENCERRA(nOrdem);

  if Campo = 'DATAEFETENCERRA' then
    AjustaDATAEFETENCERRA(nOrdem);

  if Campo = 'SITUACAO' then // Felipe A. Santos SOL 190136 KTN 1806055
     AjustaSITUACAO(nOrdem);

end;

procedure TfrmRelatContratosAnalitico.AjustaCODCONTRATOEMPR(Ordem: Integer);
begin
  dmtRelatContatoAnalitico.MontaRelatorio('CODCONTRATOEMPR', 'Num. Processo', 20, Ordem, False);
end;

procedure TfrmRelatContratosAnalitico.AjustaDATAASSINATURA(Ordem: Integer);
begin
  dmtRelatContatoAnalitico.MontaRelatorio('DATAASSINATURA', 'Dt. Assinatura', 10, Ordem, False);
end;

procedure TfrmRelatContratosAnalitico.AjustaDATAEFETENCERRA(Ordem: Integer);
begin
  dmtRelatContatoAnalitico.MontaRelatorio('DATAEFETENCERRA', 'Encerramento', 10, Ordem, False);
end;

procedure TfrmRelatContratosAnalitico.AjustaDATAPREVENCERRA(Ordem: Integer);
begin
  dmtRelatContatoAnalitico.MontaRelatorio('DATAPREVENCERRA', 'Prev. Encerr.', 10,  Ordem, False);
end;

procedure TfrmRelatContratosAnalitico.AjustaDESCRICAOCONTRATO(Ordem: Integer);
begin
  //dmtRelatContatoAnalitico.MontaRelatorio('DESCRICAOCONTRATO', 'Descr. Contrato', 500, Ordem, False);
  dmtRelatContatoAnalitico.MontaRelatorio('DESCRICAOCONTRATO2', 'Descr. Contrato', 500, Ordem, False); //Vinicius Maciel SOL 155071 KTN 1471869
end;

procedure TfrmRelatContratosAnalitico.AjustaNOME(Ordem: Integer);
begin
  dmtRelatContatoAnalitico.MontaRelatorio('RATEIO', 'Rateio', 30, Ordem, False);
end;

procedure TfrmRelatContratosAnalitico.AjustaNOME_ITEM(Ordem: Integer);
begin
  dmtRelatContatoAnalitico.MontaRelatorio('NOME_ITEM', 'Item Contratual', 200, Ordem, False);
end;

procedure TfrmRelatContratosAnalitico.AjustaNOMECONTRATO(Ordem: Integer);
begin
  dmtRelatContatoAnalitico.MontaRelatorio('NOMECONTRATO', 'Contrato', 60,  Ordem, False);
end;

procedure TfrmRelatContratosAnalitico.AjustaNOMEOBJETO(Ordem: Integer);
begin
  dmtRelatContatoAnalitico.MontaRelatorio('NOMEOBJETO', 'Serviço & Produto', 200,  Ordem, False);
end;

procedure TfrmRelatContratosAnalitico.AjustaOBSERVACAO(Ordem: Integer);
begin
  //dmtRelatContatoAnalitico.MontaRelatorio('OBSERVACAO', 'Obsv', 500,  Ordem, False);
  dmtRelatContatoAnalitico.MontaRelatorio('OBSERVACAO2', 'Obsv', 500,  Ordem, False); //Vinicius Maciel SOL 155071 KTN 1471869
end;

procedure TfrmRelatContratosAnalitico.AjustaRAZAOSOCIAL(Ordem: Integer);
begin
  dmtRelatContatoAnalitico.MontaRelatorio('RAZAOSOCIAL', 'Fornecedor', 60, Ordem, False);
end;

procedure TfrmRelatContratosAnalitico.AjustaRENOVACAO(Ordem: Integer);
begin
  //dmtRelatContatoAnalitico.MontaRelatorio('RENOVACAO', 'Renovação', 500, Ordem, False);
  dmtRelatContatoAnalitico.MontaRelatorio('RENOVACAO2', 'Renovação', 500, Ordem, False);  //Vinicius Maciel SOL 155071 KTN 1471869
end;

procedure TfrmRelatContratosAnalitico.AjustaVALORBASECONTRATO(Ordem: Integer);
begin
  dmtRelatContatoAnalitico.MontaRelatorio('VALORBASECONTRATO', 'Vl. Total', 10, Ordem, True);
end;

function TfrmRelatContratosAnalitico.ValidaCampos(ChkList: TCheckListBox):Boolean;
var x: integer;
    bCk: boolean;
begin
  for x:= 0 to ChkList.Items.Count -1 do
  begin
    bCk:= ChkList.Checked[x];
    if bCk then
      break;
  end;

  if not bCk then
    result:= False
  else
    result:= True;
end;


procedure TfrmRelatContratosAnalitico.AjustaSITUACAO(Ordem: Integer);
begin
     dmtRelatContatoAnalitico.MontaRelatorio('SITUACAO', 'Situação', 50,  Ordem, False);
end;

procedure TfrmRelatContratosAnalitico.bbtnSelAllSituacaoClick(
  Sender: TObject);
begin
  inherited;
  SelChkBox(chklstSituacao, True);
end;

procedure TfrmRelatContratosAnalitico.bbtnInvertSelSituacaoClick(
  Sender: TObject);
begin
  inherited;
  SelChkBox(chklstSituacao, False);
end;

// Felipe A. Santos SOL 190136 KTN 1806055

procedure TfrmRelatContratosAnalitico.PegaValoresSituacao(Expressao, VlrOuQtd : string);
begin
    // pega total vigente

    qryAux.Close;
    qryAux.SQL.Clear;
    qryAux.SQL.Add('SELECT ' + Expressao + ' FROM ( ' +
                  dmtRelatContatoAnalitico.qryRelatAnalitico.Sql.Text +
                  ') WHERE ' + SqlVigente);
    qryAux.Open;

    // valor ou quantidade
    if (VlrOuQtd = 'VALOR') then
       dmtRelatContatoAnalitico.VlrVigente := qryAux.Fields[0].AsFloat
    else
       dmtRelatContatoAnalitico.QtdVigente := qryAux.Fields[0].AsInteger;

    // pega total encerrado

    qryAux.Close;
    qryAux.SQL.Clear;
    qryAux.SQL.Add('SELECT ' + Expressao + ' FROM ( ' +
                   dmtRelatContatoAnalitico.qryRelatAnalitico.Sql.Text +
                   ') WHERE ' +  SqlEncerrado);
    qryAux.Open;

    // valor ou quantidade
    if (VlrOuQtd = 'VALOR') then
       dmtRelatContatoAnalitico.VlrEncerrado := qryAux.Fields[0].AsFloat
    else
       dmtRelatContatoAnalitico.QtdEncerrado := qryAux.Fields[0].AsInteger;

    // pega em renovação / vigente

    qryAux.Close;
    qryAux.SQL.Clear;
    qryAux.SQL.Add('SELECT ' + Expressao + ' FROM ( ' +
                   dmtRelatContatoAnalitico.qryRelatAnalitico.Sql.Text +
                   ') WHERE FLGFIMCONTRATO = ' + QuotedStr('S') +
                   '  AND FLGRENOVACAO = ' + QuotedStr('S')
                   );
    qryAux.Open;

    // valor ou quantidade
    if (VlrOuQtd = 'VALOR') then
       dmtRelatContatoAnalitico.VlrEmRenovaV := qryAux.Fields[0].AsFloat
    else
       dmtRelatContatoAnalitico.QtdEmRenovaV := qryAux.Fields[0].AsInteger;

    // pega em renovação / encerrado

    qryAux.Close;
    qryAux.SQL.Clear;
    qryAux.SQL.Add('SELECT ' + Expressao + ' FROM ( ' +
                   dmtRelatContatoAnalitico.qryRelatAnalitico.Sql.Text +
                   ') WHERE FLGFIMCONTRATO = ' + QuotedStr('E') +
                   '  AND FLGRENOVACAO = ' + QuotedStr('S')
                   );
    qryAux.Open;

    // valor ou quantidade
    if (VlrOuQtd = 'VALOR') then
       dmtRelatContatoAnalitico.VlrEmRenovaE := qryAux.Fields[0].AsFloat
    else
       dmtRelatContatoAnalitico.QtdEmRenovaE := qryAux.Fields[0].AsInteger;

    // pega vencido não encerrado

    qryAux.Close;
    qryAux.SQL.Clear;
    qryAux.SQL.Add('SELECT ' + Expressao + ' FROM ( ' +
                   dmtRelatContatoAnalitico.qryRelatAnalitico.Sql.Text +
                   ') WHERE ' + SqlVencNencerrado);
    qryAux.Open;

    // valor ou quantidade
    if (VlrOuQtd = 'VALOR') then
       dmtRelatContatoAnalitico.VlrVencidoNEncerrado := qryAux.Fields[0].AsFloat
    else
       dmtRelatContatoAnalitico.QtdVencidoNEncerrado := qryAux.Fields[0].AsInteger;


end;

function TfrmRelatContratosAnalitico.ExisteContrato: boolean;
var
   lSQLCondicao : TStrings;
   i : integer;
begin
   // verifica se existe contratos com as situações escolhidas pelo usuário
   try
       if PContr(chklstContratos.Items.Objects[0])^.sNumContr <> '-1' then
       begin

            Result := False;

            lSQLCondicao := TStringList.Create;

            for i := 0 to chklstSituacao.Items.Count - 1 do
            begin
                 if (chklstSituacao.Checked[i]) then
                 begin
                     if (chklstSituacao.Items.Strings[i] = 'Vigente') then
                        lSQLCondicao.Add(SqlVigente)
                     else if (chklstSituacao.Items.Strings[i] = 'Encerrado') then
                        lSQLCondicao.Add(SqlEncerrado)
                     else if (chklstSituacao.Items.Strings[i] = 'Em renovação') then
                        lSQLCondicao.Add(SqlEmRenovacao)
                     else if (chklstSituacao.Items.Strings[i] = 'Vencido e não encerrado') then
                        lSQLCondicao.Add(SqlVencNencerrado);
                 end;
            end;

            for i := 0 to lSQLCondicao.Count - 1 do
            begin
                qryAux.Close;
                qryAux.SQL.Clear;
                qryAux.SQL.Add('SELECT * FROM ( ' +
                               'SELECT * FROM CONTRATOCONTR WHERE IDCONTRATO IN ( ' + SeqCodCOntratos + ' ) ' +
                               ') WHERE ' + lSQLCondicao.Strings[i]);
                qryAux.Open;

                if not(qryAux.IsEmpty) then
                begin
                     Result := True;
                     Break;
                end;
            end;

        end
        else
        begin
             Result := True;
        end;

    finally
           FreeAndNil(lSQLCondicao);
    end;
end;

procedure TfrmRelatContratosAnalitico.MontaCodicaoSituacao;
begin
   // filtros por situação
    SqlVigente := ' (FLGFIMCONTRATO = ' + QuotedStr('S') + ' AND FLGRENOVACAO <> ' + QuotedStr('S') +
                  ' AND DATAPREVENCERRA > SYSDATE) OR (FLGFIMCONTRATO = ' + QuotedStr('S') + ' AND FLGRENOVACAO IS NULL' + ')' +
                  ' OR (FLGFIMCONTRATO = ' + QuotedStr('N') + ')';

    SqlEncerrado := ' (FLGFIMCONTRATO = ' + QuotedStr('E') + ' AND (FLGRENOVACAO <> ' + QuotedStr('S') +
                    ' OR FLGRENOVACAO IS NULL) AND DATAEFETENCERRA IS NOT NULL' + ')';

    SqlEmRenovacao := ' ((FLGFIMCONTRATO = ' + QuotedStr('S') + ' OR FLGFIMCONTRATO = ' + QuotedStr('E') + ')'  +
                      ' AND FLGRENOVACAO = ' + QuotedStr('S') + ')';

    SqlVencNencerrado := '(FLGRENOVACAO <> ' + QuotedStr('S') + '  AND DATAPREVENCERRA < SYSDATE AND DATAEFETENCERRA IS NULL)';

end;
// Felipe A. Santos SOL 190136 KTN 1806055 - FIM

end.
