///////////////////////////////
// ClaudioR - 25-04-2006
// Foi retirada do form a opção antiga "Tábua de Pensão Normal" e
// foi renomeada a "Tábua de Pensão Normal Composta" para "Tábua de Pensão Normal"
//------------------------------------------------------------------
// ClaudioR - 21-06-2006
// Criado um filtro para exibir os tipo de tábuas/ CM nº 21454 - SOL nº 40238
///////////////////////////////

unit FOkConsultaTabuaServico;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, TB97Ctls, MontaSelect, Db, DBTables, Wwquery,
  Grids, DBGrids, DBClient, comctrls, CMTree;

type
  TfrmOkConsultaTabuaServico = class(TfrmOkCancelar)
    Dock972: TDock97;
    Toolbar971: TToolbar97;
    sbtnInserir: TToolbarButton97;
    sbtnAlterar: TToolbarButton97;
    sbtnProcurar: TToolbarButton97;
    sbtnApagar: TToolbarButton97;
    MontaSelect: TMontaSelect;
    QryLkpTabuasComutacao: TwwQuery;
    DBGrdTabuas: TDBGrid;
    dsLkpTabuasComutacao: TDataSource;
    QryLkpTabuasComutacaoSQ_VERSAO_COMUTACAO: TFloatField;
    QryLkpTabuasComutacaoCD_TABUA_ROTATIV: TFloatField;
    QryLkpTabuasComutacaoCD_TABUA_ENTRADA_INVALID: TFloatField;
    QryLkpTabuasComutacaoCD_TABUA_INVALID: TFloatField;
    QryLkpTabuasComutacaoCD_TABUA_MORTAL: TFloatField;
    QryLkpTabuasComutacaoIR_VERSAO_COMUTACAO: TStringField;
    QryLkpTabuasComutacaoDS_VERSAO_COMUTACAO: TStringField;
    QryLkpTabuasComutacaoDT_GERACAO: TDateTimeField;
    QryLkpTabuasComutacaoTRGDTINCLUSAO: TDateTimeField;
    QryLkpTabuasComutacaoTRGUSERINCLUSAO: TStringField;
    RdGrpOpcoes: TRadioGroup;
    ClntDtStTabuaServico: TClientDataSet;
    ClntDtStTabuaServicoDS_TIPO_TABUA_SERVICO: TStringField;
    ClntDtStTabuaServicoIR_TIPO_TABUA_SERVICO: TStringField;
    QryLkpTabuasComutacaolkpTIPO_TABUA: TStringField;
    QryDelVersao: TwwQuery;
    StringField1: TStringField;
    FloatField1: TFloatField;
    FloatField2: TFloatField;
    FloatField3: TFloatField;
    FloatField4: TFloatField;
    FloatField5: TFloatField;
    StringField2: TStringField;
    StringField3: TStringField;
    DateTimeField1: TDateTimeField;
    DateTimeField2: TDateTimeField;
    StringField4: TStringField;
    QryDelOcorrenciasVersao: TwwQuery;
    StringField5: TStringField;
    FloatField6: TFloatField;
    FloatField7: TFloatField;
    FloatField8: TFloatField;
    FloatField9: TFloatField;
    FloatField10: TFloatField;
    StringField6: TStringField;
    StringField7: TStringField;
    DateTimeField3: TDateTimeField;
    DateTimeField4: TDateTimeField;
    StringField8: TStringField;
    QryDelRegrasAjuste: TwwQuery;
    StringField9: TStringField;
    FloatField11: TFloatField;
    FloatField12: TFloatField;
    FloatField13: TFloatField;
    FloatField14: TFloatField;
    FloatField15: TFloatField;
    StringField10: TStringField;
    StringField11: TStringField;
    DateTimeField5: TDateTimeField;
    DateTimeField6: TDateTimeField;
    StringField12: TStringField;
    QryRegraAjusteVersao: TwwQuery;
    QryRegraAjusteVersaoSQ_VERSAO_COMUTACAO: TFloatField;
    QryRegraAjusteVersaoCD_GRUPO_FORMULA: TFloatField;
    QryRegraAjusteVersaoCD_FORMULA: TFloatField;
    QryRegraAjusteVersaoNR_ORDEM_FORMULA: TFloatField;
    QryRegraAjusteVersaoCD_FORMULA_AJUSTE: TFloatField;
    QryRegraAjusteVersaoIR_CONDICAO_AJUSTE: TStringField;
    sbtnGerarExcel: TToolbarButton97;
    qryOcorrenciasTabua: TwwQuery;
    ClntDtStOcorrencias: TClientDataSet;
    QryLkpTabuasComutacaoCD_GRUPO_FORMULA: TFloatField;
    qryIdadesTabua_PENSAO: TwwQuery;
    ClntDtStOcorrencias_PENSAO: TClientDataSet;
    ClntDtStOcorrenciasVARIAVEL: TStringField;
    ClntDtStOcorrenciasIDADE: TIntegerField;
    ClntDtStOcorrenciasIDADE_PENSAO: TIntegerField;
    ClntDtStOcorrenciasVALOR: TStringField;
    qryOcorrenciasTabua_PENSAO: TwwQuery;
    qryOcorrenciasTabua_PENSAOVARIAVEL: TStringField;
    qryOcorrenciasTabua_PENSAOIDADE: TFloatField;
    qryOcorrenciasTabua_PENSAOIDADE_PENSAO: TFloatField;
    qryOcorrenciasTabua_PENSAOVALOR: TFloatField;
    qryIdadesTabua_PENSAOMIN_IDADE: TFloatField;
    qryIdadesTabua_PENSAOMAX_IDADE: TFloatField;
    qryIdadesTabua_PENSAOMIN_IDADE_PENSAO: TFloatField;
    qryIdadesTabua_PENSAOMAX_IDADE_PENSAO: TFloatField;
    qryOcorrenciasTabuaVARIAVEL: TStringField;
    qryOcorrenciasTabuaIDADE: TFloatField;
    qryOcorrenciasTabuaIDADE_PENSAO: TFloatField;
    qryOcorrenciasTabuaVALOR: TFloatField;
    cbxFiltra_Tabua: TComboBox;
    Label1: TLabel;
    procedure sbtnProcurarClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sbtnApagarClick(Sender: TObject);
    procedure sbtnGerarExcelClick(Sender: TObject);
    procedure cbxFiltra_TabuaChange(Sender: TObject);
  private
    { Private declarations }
    function existemCriticas: Boolean;
    procedure montaTelaCalculo;
    procedure setPlanilhaComutacao;
    function  setPlanilhaComutacao_PENSAO:String;
    procedure montaTelaCalculoPensao;
  public
    { Public declarations }
  end;

var
  frmOkConsultaTabuaServico: TfrmOkConsultaTabuaServico;

implementation

uses UMensErro, FOkCalculoTabuaServico, UOLE, FOkSelecionaVariavel,
  FOkCalculoTabuaServicoPensao, FAnimacao;

{$R *.DFM}

procedure TfrmOkConsultaTabuaServico.sbtnProcurarClick(Sender: TObject);
begin
   If not QryLkpTabuasComutacao.Active then
      QryLkpTabuasComutacao.Open;

   MontaSelect.Executar;

   If (MontaSelect.ValoresChave.Count > 0) and
      (MontaSelect.ValoresChave[0] <> '') then
      QryLkpTabuasComutacao.Locate('SQ_VERSAO_COMUTACAO', MontaSelect.ValoresChave[0], []);

   sbtnProcurar.Down := False;
end;

procedure TfrmOkConsultaTabuaServico.bbtnConfirmarClick(Sender: TObject);
begin
   If existemCriticas then
      Exit;

   If RdGrpOpcoes.ItemIndex = 3 then
      Try
         frmOkCalculoTabuaServicoPensao := TfrmOkCalculoTabuaServicoPensao.Create(Nil);
         montaTelaCalculoPensao;
         frmOkCalculoTabuaServicoPensao.ShowModal;
      Finally
         QryLkpTabuasComutacao.Close;
         QryLkpTabuasComutacao.Open;
         frmOkCalculoTabuaServicoPensao.Release;
         frmOkCalculoTabuaServicoPensao := nil;
      End
   Else
      Try
         frmOkCalculoTabuaServico := TfrmOkCalculoTabuaServico.Create(Nil);
         With frmOkCalculoTabuaServico do
         Begin
            montaTelaCalculo;

            ShowModal;
         End; //with
      Finally
         QryLkpTabuasComutacao.Close;
         QryLkpTabuasComutacao.Open;
         frmOkCalculoTabuaServico.Release;
         frmOkCalculoTabuaServico := nil;
      End;
end;

procedure TfrmOkConsultaTabuaServico.FormCreate(Sender: TObject);
begin
   inherited;

   ClntDtStTabuaServico.CreateDataSet;
   ClntDtStTabuaServico.AppendRecord(['Comutação Normal (Padrão)', 'N']);
   ClntDtStTabuaServico.AppendRecord(['Comutação Ajustada', 'A']);
   ClntDtStTabuaServico.AppendRecord(['Tábua de Pensão', 'P']);

   QryLkpTabuasComutacao.Open;
end;

procedure TfrmOkConsultaTabuaServico.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   ClntDtStTabuaServico.Close;
   QryLkpTabuasComutacao.Close;

   inherited;
end;

procedure TfrmOkConsultaTabuaServico.sbtnApagarClick(Sender: TObject);
begin
   sbtnApagar.Down := False;
   If (MsgDlg('Deseja realmente excluir este registro?', 'Exclusão', mtConfirmation, [mbYes,mbNo],0) = mrYes) then
   Begin
      QryDelRegrasAjuste.ParamByName('SQ_VERSAO_COMUTACAO').asInteger := QryLkpTabuasComutacaoSQ_VERSAO_COMUTACAO.asInteger;
      QryDelRegrasAjuste.ExecSQL;

      QryDelOcorrenciasVersao.ParamByName('SQ_VERSAO_COMUTACAO').asInteger := QryLkpTabuasComutacaoSQ_VERSAO_COMUTACAO.asInteger;
      QryDelOcorrenciasVersao.ExecSQL;

      QryDelVersao.ParamByName('SQ_VERSAO_COMUTACAO').asInteger := QryLkpTabuasComutacaoSQ_VERSAO_COMUTACAO.asInteger;
      QryDelVersao.ExecSQL;

      QryLkpTabuasComutacao.Close;
      QryLkpTabuasComutacao.Open;
   End; //if
end;

function TfrmOkConsultaTabuaServico.existemCriticas: Boolean;
begin
   Try
      Result := False;

      //Recalcular Versão
      If RdGrpOpcoes.ItemIndex = 1 then
      Begin
         QryRegraAjusteVersao.Close;
         QryRegraAjusteVersao.ParamByName('SQ_VERSAO_COMUTACAO').asInteger := QryLkpTabuasComutacaoSQ_VERSAO_COMUTACAO.asInteger;
         QryRegraAjusteVersao.Open;

         Result := QryRegraAjusteVersao.isEmpty;
         If Result then
         Begin
            MessageDlg('Não existe Regra de Ajuste cadastrada para a Versão.', mtWarning, [mbOk], 0);
            Exit;
         End;
      End; //if
   Finally
      QryRegraAjusteVersao.Close;
   End;
end;

procedure TfrmOkConsultaTabuaServico.montaTelaCalculo;
begin
   With frmOkCalculoTabuaServico do
   Begin
      If (RdGrpOpcoes.ItemIndex = 1) or (RdGrpOpcoes.ItemIndex = 3) then
      Begin
         sDS_VERSAO := QryLkpTabuasComutacaoDS_VERSAO_COMUTACAO.asString;
         iCD_TABUA_MORTALIDADE := QryLkpTabuasComutacaoCD_TABUA_MORTAL.asInteger;
         iCD_TABUA_INVALIDEZ := QryLkpTabuasComutacaoCD_TABUA_INVALID.asInteger;
         iCD_TABUA_ENTRADA_INVALIDEZ := QryLkpTabuasComutacaoCD_TABUA_ENTRADA_INVALID.asInteger;;
         iCD_TABUA_ROTATIVIDADE := QryLkpTabuasComutacaoCD_TABUA_ROTATIV.asInteger;
         iCD_ROTINA_CALCULO_TABUA := QryLkpTabuasComutacaoCD_GRUPO_FORMULA.asInteger;

         CMDBLkpCmbTabuaServico.Enabled := False;
         CMDBLkpCmbTabuaMortalidade.Enabled := False;
         CMDBLkpCmbTabuaInvalidez.Enabled := False;
         CMDBLkpCmbTabuaEntradaInvalidez.Enabled := False;
         CMDBLkpCmbTabuaRotatividade.Enabled := False;
         CMDBLkpCmbRotinaCalculoTabua.Enabled := False;
      End; //if

      Case RdGrpOpcoes.ItemIndex of
          //Calcular Nova Versão
          0: Begin
                sIR_TIPO_TABUA := 'N';
             End;
          //Recalcular Versão
          1: Begin
                sIR_TIPO_TABUA := QryLkpTabuasComutacaoIR_VERSAO_COMUTACAO.asString;
                iSQ_VERSAO_RECALCULO := QryLkpTabuasComutacaoSQ_VERSAO_COMUTACAO.asInteger;
                sDS_VERSAO := sDS_VERSAO + ' (RECALCULADA)';
             End;
          //Calcular Tábua de Serviço Ajustada
          2: Begin
                sIR_TIPO_TABUA := 'A';
                sDS_VERSAO := QryLkpTabuasComutacaoDS_VERSAO_COMUTACAO.asString + ' (AJUSTADA)';
             End;
      End; //case
   End; //with
end;

procedure TfrmOkConsultaTabuaServico.sbtnGerarExcelClick(Sender: TObject);
var planilha: TOLEObject;
    fVariavel:String;
begin
   Try
      sbtnGerarExcel.Down := False;

      If QryLkpTabuasComutacaoIR_VERSAO_COMUTACAO.asString = 'P' then
      Begin
         // Converteu a Procedure para Function para retornar a variavel escolhida para
         // a geração do relatório
         fVariavel := setPlanilhaComutacao_PENSAO;

         If (not ClntDtStOcorrencias_PENSAO.Active) or
            ((ClntDtStOcorrencias_PENSAO.Active) and (ClntDtStOcorrencias_PENSAO.isEmpty)) then
         Begin
            MessageDlg('Não existem ocorrências para a Tábua selecionara.', mtWarning, [mbOk], 0);
            Exit;
         end;

         planilha := TOLEObject.Create(ClntDtStOcorrencias_PENSAO);
         planilha.Nome_Pasta := fVariavel; //Criado esse parametro para
                                           // renomear a pasta do excel para o nome da variavel
         planilha.CallExcel;
      End
      Else
      Begin
         setPlanilhaComutacao;

         If ClntDtStOcorrencias.isEmpty then
         Begin
            MessageDlg('Não existem ocorrências para a Tábua selecionara.', mtWarning, [mbOk], 0);
            Exit;
         End;

         planilha := TOLEObject.Create(ClntDtStOcorrencias);
         planilha.CallExcel;
      End;

      FreeAndNil(planilha); //Foi retirado do finally pois quando
                            // dava o exit finalizava o objeto sem antes ter criado
   Finally
      qryOcorrenciasTabua.Close;
      qryIdadesTabua_PENSAO.Close;
      qryOcorrenciasTabua_PENSAO.Close;

      ClntDtStOcorrencias.Close;
      ClntDtStOcorrencias_PENSAO.Close;
   End;
end;

procedure TfrmOkConsultaTabuaServico.setPlanilhaComutacao;
var i, iColuna: Integer;
begin
   Try
      ClntDtStOcorrencias.Close;
      ClntDtStOcorrencias.Fields.Clear;
      ClntDtStOcorrencias.FieldDefs.Clear;

      qryIdadesTabua_PENSAO.Close;
      qryIdadesTabua_PENSAO.SQL[4] := ' ';
      qryIdadesTabua_PENSAO.ParamByName('SQ_VERSAO_COMUTACAO').asInteger := QryLkpTabuasComutacaoSQ_VERSAO_COMUTACAO.asInteger;
      qryIdadesTabua_PENSAO.Open;

      qryOcorrenciasTabua.Close;
      qryOcorrenciasTabua.ParamByName('SQ_VERSAO_COMUTACAO').asInteger := QryLkpTabuasComutacaoSQ_VERSAO_COMUTACAO.asInteger;
      qryOcorrenciasTabua.ParamByName('NR_IDADE').asInteger := qryIdadesTabua_PENSAOMIN_IDADE.asInteger;
      qryOcorrenciasTabua.Open;

      ClntDtStOcorrencias.FieldDefs.Add('IDADE', ftInteger);
      iColuna := 1;
      While not qryOcorrenciasTabua.Eof do
      Begin
         ClntDtStOcorrencias.FieldDefs.Add(IntTostr(iColuna) + ' - ' + qryOcorrenciasTabuaVARIAVEL.asString, ftString, 30);

         inc(iColuna);
         qryOcorrenciasTabua.Next;
      End;
      ClntDtStOcorrencias.CreateDataSet;

      For i := qryIdadesTabua_PENSAOMIN_IDADE.asInteger to qryIdadesTabua_PENSAOMAX_IDADE.asInteger do
      Begin
         iColuna := 1;
         qryOcorrenciasTabua.Close;
         qryOcorrenciasTabua.ParamByName('SQ_VERSAO_COMUTACAO').asInteger := QryLkpTabuasComutacaoSQ_VERSAO_COMUTACAO.asInteger;
         qryOcorrenciasTabua.ParamByName('NR_IDADE').asInteger := i;
         qryOcorrenciasTabua.Open;

         ClntDtStOcorrencias.Append;
         ClntDtStOcorrencias.Fields[0].asInteger := i;

         While not qryOcorrenciasTabua.Eof do
         Begin
            ClntDtStOcorrencias.Fields[iColuna].asString := #39 + FormatFloat('#,###,###,###,##0.0000000000',
               qryOcorrenciasTabuaVALOR.asFloat);

            inc(iColuna);
            qryOcorrenciasTabua.Next;
         End; //while
         ClntDtStOcorrencias.Post;
      End; //for

   Finally
      qryOcorrenciasTabua.Close;
   End;
end;

function TfrmOkConsultaTabuaServico.setPlanilhaComutacao_PENSAO:String;
var i, j, w_linha_atual, MAX_iPensao: Integer;
begin
   qryOcorrenciasTabua_PENSAO.Close;
   Try
      frmOkSelecionaVariavel := TfrmOkSelecionaVariavel.Create(Nil);
      frmOkSelecionaVariavel.setListaVariaveis(QryLkpTabuasComutacaoCD_GRUPO_FORMULA.AsInteger);
      If frmOkSelecionaVariavel.ShowModal = mrOk then
      Begin
         Result := frmOkSelecionaVariavel.LstBxVariavel.Items.Strings[frmOkSelecionaVariavel.LstBxVariavel.ItemIndex];
         qryOcorrenciasTabua_PENSAO.SQL[3] := '  AND NO_VARIAVEL = ' + QuotedStr(Result);
      End
      Else
      Begin
         MessageDlg('É obrigatório selecionar uma Variável para gerar a planilha de Pensão.', mtWarning, [mbOk], 0);
         Exit;
      End;
   Finally
      frmOkSelecionaVariavel := Nil;
   End;

   qryIdadesTabua_PENSAO.Close;
   qryIdadesTabua_PENSAO.ParamByName('SQ_VERSAO_COMUTACAO').asInteger := QryLkpTabuasComutacaoSQ_VERSAO_COMUTACAO.asInteger;
   qryIdadesTabua_PENSAO.Open;

   //Seta Idades de Pensão como coluna do DataSet.
   ClntDtStOcorrencias_PENSAO.Close;
   ClntDtStOcorrencias_PENSAO.Fields.Clear;
   ClntDtStOcorrencias_PENSAO.FieldDefs.Clear;

   ClntDtStOcorrencias_PENSAO.FieldDefs.Add('IDADE PENSÃO\IDADE', ftInteger);

   For i := qryIdadesTabua_PENSAOMIN_IDADE_PENSAO.asInteger to qryIdadesTabua_PENSAOMAX_IDADE_PENSAO.asInteger do
      ClntDtStOcorrencias_PENSAO.FieldDefs.Add(IntToStr(i), ftString, 30);

   ClntDtStOcorrencias_PENSAO.CreateDataSet;
   //---

   //-- Cria Form de Animação
   Application.CreateForm(TfrmAnimacao, frmAnimacao);
   w_linha_atual := 0;
   frmAnimacao.SetAnimacao('Gerando planilha ...',
                           qryIdadesTabua_PENSAOMAX_IDADE_PENSAO.asInteger,
                           True,True,aviCopyFiles);

   //Insere os dados no DataSet.
   MAX_iPensao := qryIdadesTabua_PENSAOMAX_IDADE_PENSAO.asInteger;
   For i := qryIdadesTabua_PENSAOMIN_IDADE_PENSAO.asInteger to MAX_iPensao do
      Try
         qryOcorrenciasTabua_PENSAO.Close;
         qryOcorrenciasTabua_PENSAO.ParamByName('NR_IDADE').asInteger := i;
         qryOcorrenciasTabua_PENSAO.ParamByName('SQ_VERSAO_COMUTACAO').asInteger := QryLkpTabuasComutacaoSQ_VERSAO_COMUTACAO.asInteger;
         qryOcorrenciasTabua_PENSAO.Open;

         ClntDtStOcorrencias_PENSAO.Append;
         ClntDtStOcorrencias_PENSAO.Fields[0].asInteger := i;

         For j:=0 to MAX_iPensao do
         Begin
            qryOcorrenciasTabua_PENSAO.First;
            If (qryOcorrenciasTabua_PENSAO.Locate('IDADE_PENSAO', j, [])) Then
               ClntDtStOcorrencias_PENSAO.FieldByName(qryOcorrenciasTabua_PENSAOIDADE_PENSAO.asString).asString :=
                    #39 + FormatFloat('#,###,###,###,##0.0000000000', qryOcorrenciasTabua_PENSAOVALOR.asFloat)
            Else
               ClntDtStOcorrencias_PENSAO.FieldByName(IntToStr(J)).asString := #39 + '0.0000000000';
         End;

         ClntDtStOcorrencias_PENSAO.Post;

         w_linha_atual := w_linha_atual + 1;
         frmAnimacao.SetProgressBar(w_linha_atual);

         If frmAnimacao.Cancel Then
         Begin
            frmAnimacao.Close;
            frmAnimacao.Free;
            ShowMessage('Processamento cancelado por intervenção do usuário');
            Exit;
         End;

      Finally
         qryOcorrenciasTabua_PENSAO.Close;
      End;

   frmAnimacao.Close;
   frmAnimacao.Free;
end;

procedure TfrmOkConsultaTabuaServico.montaTelaCalculoPensao;
begin
   frmOkCalculoTabuaServicoPensao.CMDBLkpCmbTabuaServico.Enabled := False;
end;

procedure TfrmOkConsultaTabuaServico.cbxFiltra_TabuaChange(Sender: TObject);
Var sFiltro:String;
begin
   inherited;

   QryLkpTabuasComutacao.Filtered := False;
   
   Case cbxFiltra_Tabua.ItemIndex of
       0:sFiltro := '';
       1:sFiltro := 'N';
       2:sFiltro := 'A';
       3:sFiltro := 'P';
   End;

   QryLkpTabuasComutacao.Filter := 'IR_VERSAO_COMUTACAO =' + QuotedStr(sFiltro);

   If cbxFiltra_Tabua.ItemIndex > 0 Then
      QryLkpTabuasComutacao.Filtered := True;
end;

end.
