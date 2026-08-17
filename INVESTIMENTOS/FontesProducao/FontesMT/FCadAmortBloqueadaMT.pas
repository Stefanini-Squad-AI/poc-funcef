//******************************************************************************
// Autor    : Mônica Silva
// Data     : 14/02/2007
// Código   : AL_2
// Pendencia:
// SOL      :
// Desc     : Exibir os fundos do tipo escolhido
//            Não permitir qdade de cotas zeradas
//            Avisar quando a operação não estiver cadastrada
//******************************************************************************
// Autor    : Mônica Silva
// Data     : 14/02/2007
// Código   : AL_1
// Pendencia: 22229
// SOL      : 42585
// Desc     : Implementação do Receimento de Amortização Bloqueada (3 camadas).
//            Este Cadastro é somente para Fundo de Ações,Imobiliário, Direito Creditório e Participações
//            No grid somente será exibido as amortizações referente ao Tipo de Investimento utilizado pelo usuário
//            com padrão de 12 decimais para qtd de cotas.
//            Na Inclusão será sugerido se só houver um: O Tipo de Fundo, a Patrocinadora,Fundo de Investimento e a Operação
//            O Tipo de Fundo será filtrado de acordo com o tipo de Investimento do Usuário. Após informar o tipo o
//            o sistema irá sugeir a Data de Operação (data do último fechamento do fundo em Tipo de Fundo)
//            O Plano Patrocinadora sugerido será o definido para o Usuário, porém poderá ser alterado.
//            O Fundo de Investimento sugerido será de acordo com o Tipo de Investimento do usuário.
//            Após a informação do Fundo de Invetimento trazer a qtd de decimal a ser utilizado pela qdt cotas
//            O Tipo de Operação será sempre -171 = Amortização Bloqueada/Tipo de Investimento do Usuário, sem considerar
//            o idmercado. Todos os campos serão obrigatórios
//            É necessário incluir a Operação = -171 para os tipo de investimento = 6,7,9,10
//******************************************************************************

unit FCadAmortBloqueadaMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroGridMTInv, wwdbdatetimepicker, CMDateTimePicker, DBCtrls,
  StdCtrls, TREdit, wwdblook, ComCtrls, Menus, MontaSelect, Db, DBClient,
  uCMClientDataSet, CmEventosCadastro, ImgList, Wwdatsrc, IvDictio,
  IvMulti, IvEMulti, fcLabel, faMensagem, MAHlpBtn, Buttons, TB97Tlbr,
  TB97Ctls, TB97, Grids, Wwdbigrd, Wwdbgrid, ExtCtrls, uCmSqlParams, uCtrlInvestimento, UCtrlFundos,
  uCtrlPadroes,uCtrlParamInvest,uCMTypes, uMensErro;

type
  TFrmCadAmortBloqueadaMT = class(TFrmCadastroGridMTInv)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Label1: TLabel;
    lblQtdTransf: TLabel;
    lblVlrTransf: TLabel;
    lblFundo: TLabel;
    lblPlanoPatroOrigem: TLabel;
    lblDtOperacao: TLabel;
    lblClasse: TLabel;
    dblktipooperacao: TwwDBLookupCombo;
    dbrQuantidade: TDBRealEdit;
    dbrValor: TDBRealEdit;
    dblkFundoInvest: TwwDBLookupCombo;
    dblkPlanPatroOrig: TwwDBLookupCombo;
    dbDtaOperacao: TCMDateTimePicker;
    dblkTipoFundo: TwwDBLookupCombo;
    TabSheet2: TTabSheet;
    dbmObs: TDBMemo;
    CMSqlParams1: TCMSqlParams;
    CdsPlanoPatro: TCMClientDataSet;
    CdsTipoFundo: TCMClientDataSet;
    CdsFundoInvest: TCMClientDataSet;
    CdsTipoOper: TCMClientDataSet;
    CMSqlParams2: TCMSqlParams;
    CdsMaxVigenciaFundos: TCMClientDataSet;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dblkTipoFundoExit(Sender: TObject);
    procedure dblkTipoFundoCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure sbtnInserirClick(Sender: TObject);
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure CmeCadastroCancel(Sender: TObject);
    procedure sbtnAlterarClick(Sender: TObject);
    procedure CmeCadastroBeforeConfirma(sender: TObject;
      var Accept: Boolean);
    procedure sbtnApagarClick(Sender: TObject);
    procedure CmeCadastroFind(Sender: TObject);
    procedure dblkFundoInvestExit(Sender: TObject);
    procedure dblkFundoInvestCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure dbrQuantidadeEnter(Sender: TObject);
    procedure dbGrdDblClick(Sender: TObject);
    procedure dbrValorEnter(Sender: TObject);
    procedure CmeCadastroAfterConfirma(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    //AL_1
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    Procedure Seleciona(iIdOperacaoFundo: Integer = -1);
    Procedure AtualizaDecimal;

  public
    { Public declarations }
    iIdOperacaoFundoAnt: Integer;
  end;

var
  FrmCadAmortBloqueadaMT: TFrmCadAmortBloqueadaMT;
  CtrlInvestimento : TCtrlInvestimento;
  CtrlFundos: TCtrlFundos;

implementation

{$R *.DFM}
procedure TFrmCadAmortBloqueadaMT.Seleciona(iIdOperacaoFundo: Integer = -1);
var
 i : integer;
begin
   //Somente para exibicao
   i:=0;
   //AL_1
   //Cds.Data := CtrlFundos.ListAmortizacaoBloqueada(CtrlPInv.IdTipoInvest);
   Cds.Data := CtrlFundos.ListConsAmortBloq(-1,-1,CtrlPInv.IdTipoInvest);

   For i:= 0 to (Cds.Fields.Count-1) do
   begin
      If Cds.Fields[i].FieldName = 'VLROPERACAO' then
      begin
         TFloatField(cds.fields[i]).DisplayFormat:= '###,###,###,###.#0';
      end;
   end;

   For i:= 0 to (Cds.Fields.Count-1) do
   begin
      If Cds.Fields[i].FieldName = 'QTDOPERACAO' then
      begin
         TFloatField(cds.fields[i]).DisplayFormat:= '##0.###########0';
      end;
   end;

   If (iIdOperacaoFundo > 0) and Not(Cds.IsEmpty) then
     Cds.Locate('IDOPERACAOFUNDO',iIdOperacaoFundo,[lopartialkey]);
end;


procedure TFrmCadAmortBloqueadaMT.FormCreate(Sender: TObject);
begin
  inherited;
   CtrlInvestimento      := TCtrlInvestimento.Create;
   CtrlFundos            := TCtrlFundos.Create;

   CtrlInvestimento.InitializeAs(Padroes);
   CtrlFundos.InitializeAs(Padroes);

   CtrlFundos.CdsOperacaoFundo := Cds;

   cdsTipoFundo.Data     := CtrlFundos.ListTipoFundoInvest(CtrlPInv.IdTipoInvest);
   cdsFundoInvest.Data   := CtrlFundos.ListFundoInvest(CtrlPInv.IdTipoInvest);
   cdsPlanoPatro.Data     := CtrlInvestimento.ListPlanoPatro;
   cdsTipoOper.Data      := CtrlInvestimento.ListTipoOperacao(CtrlPInv.IdTipoInvest,-171,-1);
   Seleciona;
end;

procedure TFrmCadAmortBloqueadaMT.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  FreeAndNil(CtrlInvestimento);
  FreeAndNil(CtrlFundos);
end;

procedure TFrmCadAmortBloqueadaMT.dblkTipoFundoExit(Sender: TObject);
begin
   inherited;
   If Cds.State in [dsinsert,dsedit] then
   begin
      cds.fieldbyname('DATAOPERACAO').AsDateTime := cdsTipoFundo.fieldbyname('DATAULTFECH').AsDateTime;
      Cds.Fieldbyname('IDTIPOINVEST').AsInteger :=  cdsTipoFundo.fieldbyname('IDTIPOINVEST').AsInteger;
      cdsFundoInvest.Data   := CtrlFundos.ListFundoInvest(CtrlPInv.IdTipoInvest,cdsTipoFundo.fieldbyname('IDTIPOFUNDOINVEST').AsInteger);
   end;
end;

procedure TFrmCadAmortBloqueadaMT.dblkTipoFundoCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
begin
   If Cds.State in [dsinsert,dsedit] then
   begin
      cds.fieldbyname('DATAOPERACAO').AsDateTime := cdsTipoFundo.fieldbyname('DATAULTFECH').AsDateTime;
      Cds.Fieldbyname('IDTIPOINVEST').AsInteger :=  cdsTipoFundo.fieldbyname('IDTIPOINVEST').AsInteger;
   end;
end;

procedure TFrmCadAmortBloqueadaMT.sbtnInserirClick(Sender: TObject);
begin
   // Verificar se existe a Operação
   If Not (CdsTipoOper.IsEmpty) then
   begin
      //Vou pegar o registro anterior antes que o cds fique no modo inserção
      If not Cds.IsEmpty then
         iIdOperacaoFundoAnt:= Cds.fieldbyname('IDOPERACAOFUNDO').asinteger;
      inherited;

      // Sugerindo o Tipo de Fundo + data de operacao quando houver somente 1
      If CdsTipoFundo.RecordCount = 1 then
      begin
         //dblkTipoFundo.Text := cdsTipoFundo.fieldbyname('DESCTIPOFUNDOINV').AsString;
         Cds.fieldbyname('IDTIPOFUNDOINVEST').AsInteger := cdsTipoFundo.fieldbyname('IDTIPOFUNDOINVEST').AsInteger;
         Cds.fieldbyname('DATAOPERACAO').AsDateTime := cdsTipoFundo.fieldbyname('DATAULTFECH').AsDateTime;
      end;

      // Sugerindo o Tipo de Operacao quando houver somente 1
      If CdsTipoOper.RecordCount = 1 then
         Cds.fieldbyname('IDTIPOOPERACAO').AsInteger := cdsTipoOper.fieldbyname('IDTIPOOPERACAO').AsInteger;


      // Sugerindo o Plano Patrocinadora de CtrlPInv.IdPlanPrevCtbPatr
      If CdsPlanoPatro.Locate('IDPLANPREVCTBPATR',CtrlPInv.IdPlanPrevCtbPatr,[]) then
         Cds.fieldbyname('IDPLANPREVCTBPATR').AsInteger := cdsPlanoPatro.fieldbyname('IDPLANPREVCTBPATR').AsInteger;

      //Sugerindo o Fundo de Investimento se só houver 1
      If CdsFundoInvest.RecordCount = 1 then
         Cds.Fieldbyname('IDFUNDOINVEST').AsInteger := CdsFundoInvest.fieldbyname('DESCFUNDOINVEST').AsInteger;


      If dblkTipoFundo.CanFocus then
          dblkTipoFundo.SetFocus;
   end
   else
      MsgDlg('Operação não Cadastrada!','Mensagem do Sistema', mtWarning,[mbOk],0);
end;

procedure TFrmCadAmortBloqueadaMT.CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
begin

   Accept := CtrlFundos.AplicaAmortizacaoBloqueada;

   If CmeCadastro.Operacao in [OpInserir] then
     iIdOperacaoFundoAnt := CtrlFundos.IdOperacaoFundo;

   If not Accept then
      MsgDlg('Ocorreu um problema na gravação do Registro.' + #13 +
             'Motivo: ' + CtrlFundos.MessageInfo,'Mensagem do Sistema', mtWarning,[mbOk],0);
   inherited;

   Seleciona(iIdOperacaoFundoAnt);

end;

procedure TFrmCadAmortBloqueadaMT.bbtnConfirmarClick(Sender: TObject);
begin
   CmeCadastro.RepetirInsert := False;
   inherited;
  //   Seleciona(iIdOperacaoFundoAnt);
end;

procedure TFrmCadAmortBloqueadaMT.CmeCadastroCancel(Sender: TObject);
begin
   inherited;
   Seleciona(iIdOperacaoFundoAnt);
end;

procedure TFrmCadAmortBloqueadaMT.sbtnAlterarClick(Sender: TObject);
begin
   //Vou pegar o registro anterior antes que o cds fique no modo inserção
   If not Cds.IsEmpty then
      iIdOperacaoFundoAnt:= Cds.fieldbyname('IDOPERACAOFUNDO').asinteger;

   inherited;

   AtualizaDecimal;

   If dblkTipoFundo.CanFocus then
      dblkTipoFundo.SetFocus;
end;

procedure TFrmCadAmortBloqueadaMT.CmeCadastroBeforeConfirma(sender: TObject; var Accept: Boolean);
begin
   inherited;
   Accept := True;
   If CmeCadastro.Operacao in [OpInserir,OpAlterar] then;
   begin
       If dblkTipoFundo.Text = '' then
       begin
          MsgDlg('Selecione um Tipo de Fundo.','Mensagem do Sistema' ,MtWarning,[mbok],0);
          if dblkTipoFundo.CanFocus then
             dblkTipoFundo.SetFocus;
          Accept := False;
       end
       else if dbDtaOperacao.Text = '' then
       begin
          MsgDlg('Informe a Data da Operação.','Mensagem do Sistema' ,MtWarning,[mbok],0);
          if dbDtaOperacao.CanFocus then
             dbDtaOperacao.SetFocus;
          Accept := False;
       end
       else if dblkPlanPatroOrig.Text = '' then
       begin
          MsgDlg('Selecione um Plano/Patrocinadora.','Mensagem do Sistema' ,MtWarning,[mbok],0);
          if dblkPlanPatroOrig.CanFocus then
             dblkPlanPatroOrig.SetFocus;
          Accept := False;
       end
       else if dblkFundoInvest.Text = '' then
       begin
          MsgDlg('Selecione um Fundo de Investimento.','Mensagem do Sistema' ,MtWarning,[mbok],0);
          if dblkFundoInvest.CanFocus then
             dblkFundoInvest.SetFocus;
          Accept := False;
       end
       else If dblktipooperacao.Text = '' then
       begin
          MsgDlg('Selecione um Tipo de Operação.','Mensagem do Sistema' ,MtWarning,[mbok],0);
          if dblktipooperacao.CanFocus then
             dblktipooperacao.SetFocus;
          Accept := False;
       end
       //else If dbrQuantidade.Text = '0,000000000000' then
       else If dbrQuantidade.Value = 0 then
       begin
          MsgDlg('Informe a Quantidade de Cotas.','Mensagem do Sistema' ,MtWarning,[mbok],0);
          if dbrQuantidade.CanFocus then
             dbrQuantidade.SetFocus;
          Accept := False;
       end
       else If dbrValor.Text = '0,00' then
       begin
          MsgDlg('Informe o Valor da Operação.','Mensagem do Sistema' ,MtWarning,[mbok],0);
          if dbrValor.CanFocus then
             dbrValor.SetFocus;
          Accept := False;
       end;
   end;
end;

procedure TFrmCadAmortBloqueadaMT.sbtnApagarClick(Sender: TObject);
begin
  //Vou pegar o registro anterior antes que o cds fique no modo inserção
   if not Cds.IsEmpty then
      iIdOperacaoFundoAnt:= Cds.fieldbyname('IDOPERACAOFUNDO').asinteger;

  inherited;
  seleciona(iIdOperacaoFundoAnt);
end;

procedure TFrmCadAmortBloqueadaMT.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  if MontaSelect.RetornouValor then
      Cds.Locate('IDOPERACAOFUNDO',MontaSelect.ValoresChave[0],[]);
end;

procedure TFrmCadAmortBloqueadaMT.dblkFundoInvestExit(Sender: TObject);
begin
  inherited;
  AtualizaDecimal;
end;

procedure TFrmCadAmortBloqueadaMT.dblkFundoInvestCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  AtualizaDecimal;
end;

procedure TFrmCadAmortBloqueadaMT.dbrQuantidadeEnter(Sender: TObject);
begin
  inherited;
  AtualizaDecimal;
end;

procedure TFrmCadAmortBloqueadaMT.dbGrdDblClick(Sender: TObject);
begin
  //Vou pegar o registro anterior antes que o cds fique no modo inserção
   if not Cds.IsEmpty then
      iIdOperacaoFundoAnt:= Cds.fieldbyname('IDOPERACAOFUNDO').asinteger;

  inherited;
  AtualizaDecimal;

  if dblkTipoFundo.CanFocus then
     dblkTipoFundo.SetFocus;
end;

procedure TFrmCadAmortBloqueadaMT.AtualizaDecimal;
begin
  // Quantidade de decimais padrao: 12
  dbrQuantidade.DecDigits := 12;

  // Busca a qtd de decimal do fundo escolhido  de acordo o tipo de investimento/data de operacao/Fundo de Invest
  If Not VarIsNull(cds.fieldbyname('DATAOPERACAO').AsDateTime) and ((Cds.Fieldbyname('IDFUNDOINVEST').AsInteger) <> 0 )then
  begin
     CdsMaxVigenciaFundos.Data := CtrlFundos.ListHistFundoInvest(cds.FieldByName('DATAOPERACAO').AsDateTime,CtrlPInv.IdTipoInvest,Cds.FieldByName('IDFUNDOINVEST').AsInteger);
     If Not CdsMaxVigenciaFundos.IsEmpty then
        dbrQuantidade.DecDigits := CdsMaxVigenciaFundos.FieldByName('QTDDECQTD').AsInteger;
  end;
end;

procedure TFrmCadAmortBloqueadaMT.dbrValorEnter(Sender: TObject);
begin
  inherited;
  AtualizaDecimal;
end;

procedure TFrmCadAmortBloqueadaMT.CmeCadastroAfterConfirma(Sender: TObject);
begin
  inherited;
  Seleciona(iIdOperacaoFundoAnt);
end;

procedure TFrmCadAmortBloqueadaMT.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  Seleciona(iIdOperacaoFundoAnt);
end;

//AL_1
procedure TFrmCadAmortBloqueadaMT.FormShow(Sender: TObject);
begin
  inherited;
  MontaSelect.Filtro.Add('OPERACAOFUNDO.IDTIPOINVEST = ' + IntToStr(CtrlPInv.IdTipoInvest));
end;

end.
