// Alterações:
//------------------------------------------------------------------------------
//Pendência   : SOL 253577/17819 PPM 1104948
//Responsável : Helio Lima Custódio
//Data        : 28/12/2015
//Descrição   : Criação da tela
//------------------------------------------------------------------------------

unit FFRelProvPerdas;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, ComCtrls, MontaSelect, Db, DBTables, Wwquery,
  wwdblook, Mask, wwdbedit, Wwdotdot, Wwdbcomb, Wwdatsrc, Grids, Wwdbigrd,
  Wwdbgrid;

type
  TFrmFRelProvPerdas = class(TfrmOkCancelar)
    Panel1: TPanel;
    grpConsultaPor: TGroupBox;
    rbMatricula: TRadioButton;
    rbOutrasCondi: TRadioButton;
    pgctrlConsultaPor: TPageControl;
    tbsMatricula: TTabSheet;
    tbsOutrasCondi: TTabSheet;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    bbtnProcurar: TBitBtn;
    Label3: TLabel;
    edParticipante: TEdit;
    Label4: TLabel;
    edMatricula: TEdit;
    Label5: TLabel;
    edNumInsc: TEdit;
    edPlano: TEdit;
    Label7: TLabel;
    edPatrocinadora: TEdit;
    Label6: TLabel;
    MontaSelect: TMontaSelect;
    grpPatro: TGroupBox;
    lblPatro: TLabel;
    qryPatro: TwwQuery;
    qryPatroIDPESSOA: TFloatField;
    qryPatroNOME: TStringField;
    cmbPatro: TwwDBLookupCombo;
    gprPlanContabil: TGroupBox;
    lblPlanContabil: TLabel;
    cmbPlanContabil: TwwDBLookupCombo;
    qryPlanoContabil: TwwQuery;
    qryPlanoContabilIDPLANOPREV: TFloatField;
    qryPlanoContabilNOME: TStringField;
    gprPlanPrev: TGroupBox;
    lblPlanPrev: TLabel;
    cmbPlanPrev: TwwDBLookupCombo;
    gprSitFunc: TGroupBox;
    lblSitFunc: TLabel;
    cmbSitFunc: TwwDBLookupCombo;
    qryPlano: TwwQuery;
    qryPlanoIDPLANOPREV: TFloatField;
    qryPlanoNOME: TStringField;
    qrySitFunc: TwwQuery;
    qrySitFuncIDSITFUNC: TFloatField;
    qrySitFuncDESCRICAO: TStringField;
    gprMesCobr: TGroupBox;
    lblMesCobr: TLabel;
    txtMesCobr: TMaskEdit;
    dsContribDisponivel: TwwDataSource;
    qryContribDisponivel: TwwQuery;
    updContribAssociado: TUpdateSQL;
    dsContribAssociado: TwwDataSource;
    qryContribAssociado: TwwQuery;
    grdContribDisponivel: TwwDBGrid;
    bntRemoveContrib: TButton;
    bntRemoveTodosContrib: TButton;
    bntAddContrib: TButton;
    grdContribAssociado: TwwDBGrid;
    grpOrdenarPor: TGroupBox;
    rbOrdMatricula: TRadioButton;
    rbOrdNomeParticip: TRadioButton;
    bntAddTodosContrib: TButton;
    procedure rbMatriculaClick(Sender: TObject);
    procedure rbOutrasCondiClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure bbtnProcurarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cmbPlanPrevChange(Sender: TObject);
    procedure bntRemoveContribClick(Sender: TObject);
    procedure bntRemoveTodosContribClick(Sender: TObject);
    procedure bntAddContribClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure bntAddTodosContribClick(Sender: TObject);
  private
    procedure AbreQueries;
    procedure FechaQueries;
    procedure LimpaCampos;
    function ObtemOrderBySelecionado : String;
    procedure MostraRelatorioFiltraPorMatricula;
    function CreateCarregaLstComIdContribSelecionada : TStringList;
    procedure MostraRelatorioFiltraOutrasOpcs;
    function VerificaPreenchimento:Boolean;
    function VerificaPreenchimentoMatricula:Boolean;
    function VerificaPreenchimentoOutrasOpcoes:Boolean;
  public
    { Public declarations }
  end;

var
  FrmFRelProvPerdas: TFrmFRelProvPerdas;

implementation

{$R *.DFM}

uses UAdmPrev, dRelProvPerdas, uVerificaPreenchimento, UMensErro, uSistema;

procedure TFrmFRelProvPerdas.rbMatriculaClick(Sender: TObject);
begin
  inherited;
  if rbMatricula.Checked then
      pgctrlConsultaPor.ActivePage := tbsMatricula;
end;

procedure TFrmFRelProvPerdas.rbOutrasCondiClick(Sender: TObject);
begin
  inherited;
  if rbOutrasCondi.Checked then
       pgctrlConsultaPor.ActivePage := tbsOutrasCondi;
end;

procedure TFrmFRelProvPerdas.FormShow(Sender: TObject);
begin
  inherited;
  pgctrlConsultaPor.ActivePage := tbsMatricula;
  AbreQueries;
end;

procedure TFrmFRelProvPerdas.AbreQueries;
begin
  qryContribDisponivel.Open;
  qryPatro.ParamByName('IDFUNDACAO').AsInteger := iIdFundacao;
  qryPatro.Open;
  
  qryPlanoContabil.Open;
  qryPlano.Open;
  qrySitFunc.Open;
  qryContribAssociado.Open;
end;

procedure TFrmFRelProvPerdas.FechaQueries;
begin
  qryPatro.Close;
  qryPlanoContabil.Close;
  qryPlano.Close;
  qrySitFunc.Close;
  qryContribDisponivel.Close;
  qryContribAssociado.Close;
end;

procedure TFrmFRelProvPerdas.bbtnProcurarClick(Sender: TObject);
begin
  inherited;
  MontaSelect.Executar;

  if (MontaSelect.ValoresChave.Count > 0) and (MontaSelect.ValoresChave[0] <> '')
  then begin
     //sIdPessoa            := MontaSelect.ValoresChave[0];
     //sIdPessJur           := MontaSelect.ValoresChave[1];
     edParticipante.Text  := MontaSelect.ValoresChave[3];
     edPatrocinadora.Text := MontaSelect.ValoresChave[4];
     edPlano.Text         := MontaSelect.ValoresChave[5];
     edMatricula.Text     := MontaSelect.ValoresChave[7];
     edNumInsc.Text       := MontaSelect.ValoresChave[8];
  end
  else LimpaCampos;
end;

procedure TFrmFRelProvPerdas.LimpaCampos;
begin
   rbMatricula.Checked := True;
   rbOrdMatricula.Checked := True;

   edParticipante.Text  := '';
   edMatricula.Text     := '';
   edPatrocinadora.Text := '';
   edNumInsc.Text       := '';
   edPlano.Text         := '';

   cmbPatro.Text := '';
   cmbPlanContabil.Text := '';
   cmbPlanPrev.Text := '';
   cmbSitFunc.Text := '';
   txtMesCobr.Text := '';

   bntRemoveTodosContribClick(Nil); 
   qryContribDisponivel.Close;
   qryContribDisponivel.ParamByName('IDPLANOPREV').AsInteger := -1;
   qryContribDisponivel.Open;

   pgctrlConsultaPor.ActivePage := tbsMatricula;
end;

procedure TFrmFRelProvPerdas.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  FechaQueries;
end;

procedure TFrmFRelProvPerdas.cmbPlanPrevChange(Sender: TObject);
begin
  inherited;
  qryContribDisponivel.Close;
  qryContribDisponivel.ParamByName('IDPLANOPREV').AsInteger := qryPlanoIDPLANOPREV.AsInteger;
  qryContribDisponivel.Open;
end;

procedure TFrmFRelProvPerdas.bntRemoveContribClick(Sender: TObject);
begin
  inherited;
  if qryContribAssociado.RecordCount > 0 then
       qryContribAssociado.Delete;
end;

procedure TFrmFRelProvPerdas.bntRemoveTodosContribClick(Sender: TObject);
begin
  inherited;
  qryContribAssociado.Close;
  qryContribAssociado.ParamByName('IDCONTRIBUICAO').Clear;
  qryContribAssociado.Open;
end;

procedure TFrmFRelProvPerdas.bntAddContribClick(Sender: TObject);
var
     idContribuicao : Integer;
     nome : String;
begin
  inherited;
  idContribuicao := qryContribDisponivel.FieldByName('IDCONTRIBUICAO').AsInteger;
  nome := qryContribDisponivel.FieldByName('NOME').AsString;

  if qryContribAssociado.Locate('IDCONTRIBUICAO',
                                idContribuicao,
                                []) then
      Exit;

  qryContribAssociado.Insert;
  qryContribAssociado.FieldByName('IDCONTRIBUICAO').AsInteger := idContribuicao;
  qryContribAssociado.FieldByName('NOME').AsString := nome;
  qryContribAssociado.Post;
end;

procedure TFrmFRelProvPerdas.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;

  if VerificaPreenchimento then
  if rbMatricula.Checked then
      MostraRelatorioFiltraPorMatricula
  else
      MostraRelatorioFiltraOutrasOpcs;
end;

function TFrmFRelProvPerdas.ObtemOrderBySelecionado : String;
begin
    if rbOrdMatricula.Checked then
          Result := 'TRGDTINCLUSAO, MATRICULA'
     else
          Result := 'TRGDTINCLUSAO, NOMEPESSOA'
end;

function TFrmFRelProvPerdas.CreateCarregaLstComIdContribSelecionada : TStringList;
var
    lstIdContrib : TStringList;
begin
       lstIdContrib := TStringList.Create;

       qryContribAssociado.DisableControls;

       qryContribAssociado.First;
       while Not qryContribAssociado.Eof do
       begin
              lstIdContrib.Add(
                  qryContribAssociado.FieldByName('IDCONTRIBUICAO').AsString);
              qryContribAssociado.Next;
       end;

       qryContribAssociado.EnableControls;

       Result := lstIdContrib;
end;

procedure TFrmFRelProvPerdas.MostraRelatorioFiltraPorMatricula;
var
    matricula,
    porOrderBy : String;
begin
     matricula := edMatricula.Text;
     porOrderBy := ObtemOrderBySelecionado;

     RptProvPerdas.MostraRelatorio(matricula,
                                   '',  //idPessJur
                                   '',  //idPlanoPrevContab
                                   '',  //idPlanoPrev
                                   '',  //idSitFunc
                                   '',  //mesCobranca
                                   Nil, //lstIdContribuicao
                                   porOrderBy);
end;

procedure TFrmFRelProvPerdas.MostraRelatorioFiltraOutrasOpcs;
var
    idPessJur,
    idPlanoPrevContab,
    idPlanoPrev,
    idSitFunc,
    mesCobranca,
    porOrderBy : String;
    lstIdContribuicao : TStringList;
begin
     if Trim(cmbPatro.Text) <> '' then idPessJur := qryPatroIDPESSOA.AsString else idPessJur := '';
     if Trim(cmbPlanContabil.Text) <> '' then idPlanoPrevContab := qryPlanoContabilIDPLANOPREV.AsString else idPlanoPrevContab := '';
     if Trim(cmbPlanPrev.Text) <> '' then idPlanoPrev := qryPlanoIDPLANOPREV.AsString else idPlanoPrev := '';
     if Trim(cmbSitFunc.Text) <> '' then idSitFunc := qrySitFuncIDSITFUNC.AsString else idSitFunc := '';
     if txtMesCobr.Text <> '    /  ' then mesCobranca := txtMesCobr.Text else mesCobranca := '';
     lstIdContribuicao := CreateCarregaLstComIdContribSelecionada;
     porOrderBy        := ObtemOrderBySelecionado;
     
     RptProvPerdas.MostraRelatorio('', //MATRICULA
                                   idPessJur,
                                   idPlanoPrevContab,
                                   idPlanoPrev,
                                   idSitFunc,
                                   mesCobranca,
                                   lstIdContribuicao,
                                   porOrderBy);

     lstIdContribuicao.Free;
end;

procedure TFrmFRelProvPerdas.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  LimpaCampos;
  rbMatricula.SetFocus;
end;

function TFrmFRelProvPerdas.VerificaPreenchimento:Boolean;
begin
       if rbMatricula.Checked then
            Result := VerificaPreenchimentoMatricula
       else
            Result := VerificaPreenchimentoOutrasOpcoes;
end;

function TFrmFRelProvPerdas.VerificaPreenchimentoMatricula:Boolean;
begin
   
   Result := False;

   try
      if Trim(edMatricula.Text) = '' then
         raise EValidacao.CreateVal('É necessário selecionar matricula para apresentação do relatório.', bbtnProcurar);

   except
      on ev : EValidacao do
      begin
         Screen.Cursor := crDefault;
         if ev.Show then MsgDlg(ev.message, Sistema.NomeModulo, mtWarning, [mbOk], 0);
         Repaint;
         if ev.Control.CanFocus then ev.Control.SetFocus;
         Exit;
      end;
   end;

   Result := True;
end;

function TFrmFRelProvPerdas.VerificaPreenchimentoOutrasOpcoes:Boolean;
begin
   
   Result := False;

   try
      if (Trim(cmbPatro.Text) = '') And
         (Trim(cmbPlanContabil.Text) = '') And
         (Trim(cmbPlanPrev.Text) = '') And
         (Trim(cmbSitFunc.Text) = '') And
         ((Trim(txtMesCobr.Text) = '') or (txtMesCobr.Text = '    /  ')) And
         (qryContribAssociado.RecordCount = 0) then
             raise EValidacao.CreateVal('É necessário selecionar pelo menos um parâmetro de pesquisa para apresentação do relatório.', cmbPatro);

      if  (Trim(txtMesCobr.Text) = '') or
          (txtMesCobr.Text = '    /  ') then
            raise EValidacao.CreateVal('É necessário informar o mês de cobrança.', txtMesCobr);

   except
      on ev : EValidacao do
      begin
         Screen.Cursor := crDefault;
         if ev.Show then MsgDlg(ev.message, Sistema.NomeModulo, mtWarning, [mbOk], 0);
         Repaint;
         if ev.Control.CanFocus then ev.Control.SetFocus;
         Exit;
      end;
   end;

   Result := True;
end;


procedure TFrmFRelProvPerdas.bntAddTodosContribClick(Sender: TObject);
var
     idContribuicao : Integer;
     nome : String;
begin
  inherited;

  qryContribDisponivel.DisableControls;
  qryContribDisponivel.First;
  while Not qryContribDisponivel.Eof do
  begin
    
    idContribuicao := qryContribDisponivel.FieldByName('IDCONTRIBUICAO').AsInteger;
    nome := qryContribDisponivel.FieldByName('NOME').AsString;

    if qryContribAssociado.Locate('IDCONTRIBUICAO',
                                  idContribuicao,
                                  []) then
    begin
      qryContribDisponivel.Next;
      Continue;
    end;

    qryContribAssociado.Insert;
    qryContribAssociado.FieldByName('IDCONTRIBUICAO').AsInteger := idContribuicao;
    qryContribAssociado.FieldByName('NOME').AsString := nome;
    qryContribAssociado.Post;

    qryContribDisponivel.Next;
  end;
  qryContribDisponivel.EnableControls;
end;

end.
