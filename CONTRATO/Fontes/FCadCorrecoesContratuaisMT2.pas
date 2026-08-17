unit FCadCorrecoesContratuaisMT2;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroMestreDetMT, MontaSelect, Db, DBClient, uCMClientDataSet,
  CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, TB97Tlbr, StdCtrls, Buttons, TB97Ctls, TB97, Grids, Wwdbigrd,
  Wwdbgrid, ComCtrls, TabControlDetalhe, ExtCtrls, Mask, wwdbedit, DBCtrls,
  wwdblook, wwdbdatetimepicker, CMDateTimePicker, TREdit, uCmSqlParams,
  uCtrlCorrecoesContratuais, uCtrlServProdxItemContr, uCtrlContratos,
  uCtrlAditamentos, uCtrlReferenciaContr, FOrdenaCorrecoesMT;

const
   WM_EDITAR = WM_User+1;
   WM_EDITARDET = WM_User+2;
   WM_CANCELARDET = WM_User+3;

type
  TfrmCadCorrecoesContratuaisMT = class(TFrmCadastroMestreDetMT)
    pgcDadosCorrecao: TPageControl;
    tbsDadosII: TTabSheet;
    Bevel1: TBevel;
    dbrgTipoCorrecao: TDBRadioGroup;
    gbFaixa: TGroupBox;
    Label3: TLabel;
    Label5: TLabel;
    edrFaixaFinal: TDBRealEdit;
    lblValorCorrecao: TLabel;
    dbeVlrCorrecao: TDBRealEdit;
    lblMoedaCorrecao: TLabel;
    dblcMoeda: TwwDBLookupCombo;
    Bevel2: TBevel;
    Label2: TLabel;
    dbeNomeContrato: TwwDBEdit;
    cdsSrvProd: TCMClientDataSet;
    spTeste: TCMSqlParams;
    edrFaixaInicial: TDBRealEdit;
    cdsDet: TCMClientDataSet;
    cdsMoeda: TCMClientDataSet;
    sbtnOrdenar: TToolbarButton97;
    cdsAditamento: TCMClientDataSet;
    dsAditamento: TwwDataSource;
    tbsDadosIII: TTabSheet;
    dbmObsAditamento: TDBMemo;
    cdsItemContratual: TCMClientDataSet;
    cdsSrvProdAbatido: TCMClientDataSet;
    cdsItemContratualAbatido: TCMClientDataSet;
    Panel1: TPanel;
    Label6: TLabel;
    dbeDescricao: TwwDBEdit;
    Label8: TLabel;
    dbcRateioAcumulativo: TDBCheckBox;
    tbsDadosI: TTabSheet;
    lblTituloData: TLabel;
    edDataBase: TCMDateTimePicker;
    dbrgFrequencia: TDBRadioGroup;
    Label1: TLabel;
    edrIntervalo: TDBRealEdit;
    rgValorBaseCalculo: TRadioGroup;
    Bevel5: TBevel;
    dblcReferencia: TwwDBLookupCombo;
    lblReferencia: TLabel;
    cdsObjetoxItemContratual: TCMClientDataSet;
    dsObjetoxItemContratual: TwwDataSource;
    tbsAditamento: TTabSheet;
    Panel2: TPanel;
    Label7: TLabel;
    Label10: TLabel;
    Label9: TLabel;
    edDataAditamento: TCMDateTimePicker;
    dbeCodigoAditamento: TDBEdit;
    dbeDescricaoAditamento: TDBMemo;
    Bevel3: TBevel;
    dbcbAfetaOutrasCorrecoes: TDBCheckBox;
    cdsValoresReferencia: TCMClientDataSet;
    dbeCodAditamentoCorr: TwwDBEdit;
    Label4: TLabel;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    dbrgAtuacao: TDBRadioGroup;
    Label13: TLabel;
    dblcServProdAbatido: TwwDBLookupCombo;
    Label14: TLabel;
    dblcItemContratualAbatido: TwwDBLookupCombo;
    dbcbPermResMenor: TDBCheckBox;
    TabSheet3: TTabSheet;
    Label24: TLabel;
    edDataAditamentoAbat: TCMDateTimePicker;
    Label26: TLabel;
    dbeCodigoAditamentoAbat: TDBEdit;
    Label25: TLabel;
    dbmDescricaoAditamentoAbat: TDBMemo;
    TabSheet4: TTabSheet;
    dblcItemContratual: TwwDBLookupCombo;
    dblcServProd: TwwDBLookupCombo;
    Label11: TLabel;
    Label15: TLabel;
    Label12: TLabel;
    rgAbrangencia: TRadioGroup;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CmeCadastroFind(Sender: TObject);
    procedure dbrgTipoCorrecaoClick(Sender: TObject);
    procedure CmeCadastroConfirma(Sender: TObject);
    procedure CmeCadastroAtualizaBotoes(Sender: TObject);
    procedure dblcServProdItemContratoChange(Sender: TObject);
    procedure CmeDetalheInsert(Sender: TObject);
    procedure dblcServProdContratoAbatidoChange(Sender: TObject);
    procedure CmeDetalheConfirma(Sender: TObject);
    procedure CmeDetalheDelete(Sender: TObject);
    procedure CmeDetalheAtualizaBotoes(Sender: TObject);
    procedure sbtnOrdenarClick(Sender: TObject);
    procedure rgAbrangenciaClick(Sender: TObject);
    procedure CmeDetalheEdit(Sender: TObject);
    procedure CmeDetalheCancel(Sender: TObject);
    procedure cdsDetAfterScroll(DataSet: TDataSet);
    procedure rgValorBaseCalculoClick(Sender: TObject);
    procedure tbcDetalheChange(Sender: TObject);
    procedure CmeCadastroCancel(Sender: TObject);
    procedure edDataBaseCloseUp(Sender: TObject);
    procedure dbrgFrequenciaChange(Sender: TObject);
  private
    { Private declarations }
    CtrlCorrecoes       : TCtrlCorrecoesContratuais;
    CtrlAditamentos     : TCtrlAditamentos;
    CtrlServProdxItem   : TCtrlServProdxItemContr;
    CtrlContratos       : TCtrlContratos;
    CtrlReferenciaContr : TCtrlReferenciaContr;
    iNumCorrecoes       : Integer;
    rOrdem              : Double;
    bDesAtivando        : Boolean;
    rIDObjetoTodoContr  : Double;
    rIDItemTodoContr    : Double;
    procedure ModoEdicao(var msg: TMessage); message WM_EDITAR;
    procedure ModoEdicaoDet(var msg: TMessage); message WM_EDITARDET;
    procedure CancelarDet(var msg: TMessage); message WM_CANCELARDET;
  public
    { Public declarations }
  end;

var
  frmCadCorrecoesContratuaisMT: TfrmCadCorrecoesContratuaisMT;

implementation

{$R *.DFM}

uses dBaseDados, uSistema, uMensErro;

procedure TfrmCadCorrecoesContratuaisMT.FormCreate(Sender: TObject);
begin
   inherited;

   bDesAtivando:=False;
   iNumCorrecoes:=0;
   rOrdem:=0;

   //Acrescenta filtro ao MontaSelect
   MontaSelect.Filtro.Add('(CONTRATOCONTR.IDPESSOA = '+FloatToStr(Sistema.IdEmpresa)+') ');
   MontaSelect.Filtro.Add('(CONTRATOCONTR.IDCONTRATO IN (SELECT IDCONTRATO FROM CONTRATOUSUARIO '+
                          'WHERE (IDUSUARIO = '+FloatToStr(Sistema.IDUsuario)+')))');
   MontaSelect.Filtro.Add('EXISTS(SELECT OB.IDOBJETO FROM OBJETOSXITEMCONTR OB '+
                                 'WHERE (CONTRATOCONTR.IDCONTRATO = OB.IDCONTRATO))');
                                 
   //Inicializa CtrlServProdxItemContr
   CtrlServProdxItem:=TCtrlServProdxItemContr.Create;
   CtrlServProdxItem.Initialize(dtmBaseDados.dbBaseDados,True);

   //Inicializa CtrlCorrecoes
   CtrlCorrecoes:=TCtrlCorrecoesContratuais.Create;
   CtrlCorrecoes.Initialize(dtmBaseDados.dbBaseDados,True);

   //Inicializa CtrlAditamentos
   CtrlAditamentos:=TCtrlAditamentos.Create;
   CtrlAditamentos.Initialize(dtmBaseDados.dbBaseDados,True);

   //Inicializa CtrlContratos
   CtrlContratos:=TCtrlContratos.Create(Sistema.IdEmpresa);
   CtrlContratos.Initialize(dtmBaseDados.dbBaseDados,True);

   //Inicializa CtrlContratos
   CtrlReferenciaContr:=TCtrlReferenciaContr.Create;
   CtrlReferenciaContr.Initialize(dtmBaseDados.dbBaseDados,True);

   //Carrega cds
   cds.Data:=CtrlContratos.ListContratos(-1); //vazio

   //Carrega cdsDet
   cdsDet.Data:=CtrlCorrecoes.ListCorrecoes(-1,-1,False); //vazio

   //Carrega cdsAditamento
   cdsAditamento.Data:=CtrlAditamentos.ListAditamento(-1,-1); //vazio

   //Carrega cdsObjetoxItemContratual
   cdsObjetoxItemContratual.Data:=CtrlServProdxItem.ListProdServXItem(-1,0,0); //vazio
   
   //Carrega combos de Serviços/Produtos e Itens Contratuais
   cdsSrvProd.Data:=CtrlServProdxItem.ListProdServXItem(-1,0,0); //vazio
   cdsSrvProdAbatido.Data:=cdsSrvProd.Data;
   cdsItemContratual.Data:=CtrlCorrecoes.ListItemContratual(-1); //vazio
   cdsItemContratualAbatido.Data:=cdsItemContratual.Data;

   //Carrega combos de Valores de Referência
   cdsValoresReferencia.Data:=CtrlReferenciaContr.ListReferenciaContr(0);   

   //Carrega cdsMoeda
   cdsMoeda.Data:=CtrlCorrecoes.ListMoeda;

   //Associa cds das Ctrls
   CtrlCorrecoes.CdsCorrecaoContr:=cdsDet;
   CtrlCorrecoes.CdsAditamento:=cdsAditamento;
   CtrlCorrecoes.CdsObjetosxItemContr:=cdsObjetoxItemContratual;

   //Inicializa Ambiente
   tbsAditamento.TabVisible:=False;
   tbsAditamentoAbat.TabVisible:=False;
   sbtnExcluiDet.Hint:='Excluir/Desativar';
   pgctrlDetalhe.ActivePageIndex:=0;
end;

procedure TfrmCadCorrecoesContratuaisMT.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   CtrlCorrecoes.Free;
   CtrlAditamentos.Free;
   CtrlServProdxItem.Free;
   CtrlContratos.Free;
   CtrlReferenciaContr.Free;
   inherited;
end;

procedure TfrmCadCorrecoesContratuaisMT.CmeCadastroFind(Sender: TObject);
begin
   inherited;
   if MontaSelect.RetornouValor then
    begin
       //Carrega cds mestre
       cds.Close;
       cds.Data:=CtrlContratos.ListContratos(StrToFloat(MontaSelect.ValoresChave[0]));

       //Carrega cds detalhe
       cdsDet.Filtered:=False;
       cdsDet.Close;
       cdsDet.Data:=CtrlCorrecoes.ListCorrecoes(StrToFloat(MontaSelect.ValoresChave[0]),
                                                Sistema.IdEmpresa,False);

       //Carrega cdsObjetoxItemContratual
       cdsObjetoxItemContratual.Filtered:=False;
       cdsObjetoxItemContratual.Data:=CtrlServProdxItem.ListProdServXItem(StrToFloat(MontaSelect.ValoresChave[0]),0,0);
       //Filtra cdsObjetoxItemContratual (mostra vazio)
       cdsObjetoxItemContratual.Filter:='(IDOBJETO = 0) and (IDITEM = 0)';
       cdsObjetoxItemContratual.Filtered:=True;

       //Carrega IDObjeto e IDItem para contratos com uma única correção
       CtrlServProdxItem.TestaProdServXItem(StrToFloat(MontaSelect.ValoresChave[0]),
                                            rIDObjetoTodoContr, rIDItemTodoContr);

       //Carrega Combos de Produtos/Serviços
       cdsSrvProd.Data:=CtrlCorrecoes.ListServProd(StrToFloat(MontaSelect.ValoresChave[0]));
       cdsSrvProdAbatido.Data:=cdsSrvProd.Data;

       //Carrega Combos de Item Contratual
       cdsItemContratual.Data:=CtrlCorrecoes.ListItemContratual(StrToFloat(MontaSelect.ValoresChave[0]));
       cdsItemContratualAbatido.Data:=cdsItemContratual.Data;

       //Guarda número de correções já cadastradas
       iNumCorrecoes:=cdsDet.RecordCount;

       //Gera número de Ordem das Correções
       if cdsDet.IsEmpty then
          rOrdem:=1
       else
        begin
           cdsDet.Last;
           rOrdem:=cdsDet.FieldByName('ORDEM').AsFloat+1;
        end;

       //Habilita/Desabilita Abrangência
       rgAbrangencia.Enabled:=cdsDet.IsEmpty;

       //Habilita/Desabilita Combos Serv./Prod e Item. Associa Abrangência
       dblcServProd.Clear;
       dblcItemContratual.Clear;
       if CtrlCorrecoes.VerifAbrangTodoContrato(StrToFloat(MontaSelect.ValoresChave[0])) or
          cdsDet.IsEmpty then
        begin
           rgAbrangencia.ItemIndex:=0;
           dblcServProd.Enabled:=False;
           dblcItemContratual.Enabled:=False;
           dblcServProdAbatido.Enabled:=False;
           dblcItemContratualAbatido.Enabled:=False;
           dbcbPermResMenor.Enabled:=False;
        end
       else
        begin
           rgAbrangencia.ItemIndex:=1;
           dblcServProd.Enabled:=True;
           dblcItemContratual.Enabled:=True;
           dblcServProdAbatido.Enabled:=True;
           dblcItemContratualAbatido.Enabled:=True;
           dbcbPermResMenor.Enabled:=True;
        end;

       //Filtra (mostra vazio) cdsDet caso a correção seja por serv./Prod x Item
       if (rgAbrangencia.ItemIndex=1) then
        begin
           cdsDet.Filter:='(IDOBJETO = 0) and (IDITEM = 0)'; //vazio
           cdsDet.Filtered:=True;
        end;

       //Carrega o Hint com o nome completo do Contrato
       dbeNomeContrato.Hint:='('+FloatToStr(Cds.FieldByName('IDCONTRATO').AsFloat)+
                             ') --> '+Cds.FieldByName('NOMECONTRATO').AsString;

       //Prepara Ambiente
       tbcDetalhe.TabIndex:=0;
       pgcDadosCorrecao.ActivePageIndex:=0;
       rgValorBaseCalculo.ItemIndex:=0;

       //Coloca o Registro mestre em alteração de modo a habilitar os botões do detalhe
       PostMessage(Handle,WM_EDITAR,0,0);
    end;
end;

procedure TfrmCadCorrecoesContratuaisMT.CmeCadastroAtualizaBotoes(
  Sender: TObject);
begin
   inherited;
   sbtnOrdenar.Enabled:=((Trim(dbeNomeContrato.Text)<>'') and (iNumCorrecoes<>0));
end;

procedure TfrmCadCorrecoesContratuaisMT.CmeCadastroConfirma(Sender: TObject);
var
   bFiltrado: Boolean;
begin
   bFiltrado:=cdsDet.Filtered;
   cdsDet.Filtered:=False;
   cdsObjetoxItemContratual.Filtered:=False;

   if not(CtrlCorrecoes.AplicaAtualCorrContr) then
    begin
       MsgDlg(CtrlCorrecoes.MessageInfo,'Erro',mtError,[mbOK],0);
       Abort;
    end
   else
    begin
       cdsDet.Close;
       cdsDet.Data:=CtrlCorrecoes.ListCorrecoes(StrToFloat(MontaSelect.ValoresChave[0]),
                                                Sistema.IdEmpresa, False);
       cdsObjetoxItemContratual.Close;
       cdsObjetoxItemContratual.Data:=
                 CtrlServProdxItem.ListProdServXItem(StrToFloat(MontaSelect.ValoresChave[0]),0,0);
       cdsDet.Filtered:=bFiltrado;
       cdsObjetoxItemContratual.Filtered:=bFiltrado;

       cdsAditamento.EmptyDataSet;

       inherited;

       tbsAditamento.TabVisible:=False;
       tbsAditamentoAbat.TabVisible:=False;

       PostMessage(Handle,WM_EDITAR,0,0);
    end;
end;

procedure TfrmCadCorrecoesContratuaisMT.CmeCadastroCancel(Sender: TObject);
begin
   inherited;
   tbsAditamento.TabVisible:=False;
   tbsAditamentoAbat.TabVisible:=False;
end;

procedure TfrmCadCorrecoesContratuaisMT.CmeDetalheInsert(Sender: TObject);
begin
   inherited;
   //Prepara o form para a nova inclusão
   pgcDadosCorrecao.ActivePageIndex:=0;
   gbFaixa.Enabled:=False;
   lblMoedaCorrecao.Enabled:=False;
   dblcMoeda.Enabled:=False;
   edDataBase.Date:=cdsObjetoxItemContratual.FieldByName('DataBaseItem').AsDateTime;

   cdsDet.FieldByName('IDContrato').AsFloat:=cds.FieldByName('IDContrato').AsFloat;
   cdsDet.FieldByName('DataBase').AsDateTime:=
                                  cdsObjetoxItemContratual.FieldByName('DataBaseItem').AsDateTime;

   if (rgAbrangencia.ItemIndex=0) then
    begin
       cdsDet.FieldByName('IDObjeto').AsFloat:=rIDObjetoTodoContr;
       cdsDet.FieldByName('IDItem').AsFloat:=rIDItemTodoContr;
    end
   else
    begin
       cdsDet.FieldByName('IDObjeto').AsFloat:=StrToFloat(dblcServProd.LookupValue);
       cdsDet.FieldByName('IDItem').AsFloat:=StrToFloat(dblcItemContratual.LookupValue);
    end;

   cdsDet.FieldByName('Frequencia').AsString:='D';
   cdsDet.FieldByName('TipoCorrecao').AsString:='PC';
   cdsDet.FieldByName('FLGAFETACORR').AsString:='N';
   cdsDet.FieldByName('FLGFAIXARATACU').AsString:='N';
   cdsDet.FieldByName('FLGATIVO').AsString:='S';
   cdsDet.FieldByName('ORDEM').AsFloat:=rOrdem;

   // Inicializa Descrição de acordo com a abrangência escolhida
   if rgAbrangencia.ItemIndex=0 then
    begin
       cdsDet.FieldByName('ABRANGENCIA').AsString:='C';
       cdsDet.FieldByName('DESCRICAO').AsString:='Correção Contratual';
    end
   else
      cdsDet.FieldByName('ABRANGENCIA').AsString:='I';
end;

procedure TfrmCadCorrecoesContratuaisMT.CmeDetalheEdit(Sender: TObject);
begin
   pgcDadosCorrecao.ActivePageIndex:=0;
   pgcAbatimentos.ActivePageIndex:=0;

   if (cdsDet.FieldByName('IDREFCONTR').AsFloat>0) then
       rgValorBaseCalculo.ItemIndex:=1
   else
       rgValorBaseCalculo.ItemIndex:=0;   

   if (tbcDetalhe.TabIndex=0) then
    begin
       if (cdsDet.FieldByName('FLGATIVO').AsString='N') and not(bDesAtivando) then
        begin
           MsgDlg('Esta Correção precisa ser Reativada para poder ser Alterada','Erro',mtError,[mbOK],0);
           Abort;
        end;

       inherited;

       if bDesAtivando then
        begin
           if (cdsDet.FieldByName('FLGATIVO').AsString='N') then
              cdsDet.FieldByName('FLGATIVO').AsString:='S'
           else
              cdsDet.FieldByName('FLGATIVO').AsString:='N';
        end;

       tbsAditamento.TabVisible:=not(cdsDet.FieldByName('IDCORRECAO').IsNull);
       if tbsAditamento.TabVisible then
        begin
           cdsAditamento.Append;
           cdsAditamento.FieldByName('IDCONTRATO').AsFloat:=Cds.FieldByName('IDCONTRATO').AsFloat;
        end;

       rgValorBaseCalculoClick(nil);
       dbrgFrequenciaChange(nil);
       dbrgTipoCorrecaoClick(nil);
    end;

   if (tbcDetalhe.TabIndex=1) then
    begin
       inherited;
       tbsAditamentoAbat.TabVisible:=
                         not(cdsObjetoxItemContratual.FieldByName('IDOBJABATCORR').IsNull) and
                         not(cdsObjetoxItemContratual.FieldByName('IDITEMABATCORR').IsNull);
       if tbsAditamentoAbat.Visible then
        begin
           cdsAditamento.Append;
           cdsAditamento.FieldByName('IDCONTRATO').AsFloat:=Cds.FieldByName('IDCONTRATO').AsFloat;
        end;
    end;
end;

procedure TfrmCadCorrecoesContratuaisMT.CmeDetalheCancel(Sender: TObject);
begin
   cdsAditamento.Cancel;
   tbsAditamento.TabVisible:=False;
   tbsAditamentoAbat.TabVisible:=False;
   bDesAtivando:=False;
   inherited;
   tbsAditamentoAbat.TabVisible:=False;
end;


procedure TfrmCadCorrecoesContratuaisMT.CmeDetalheConfirma(
  Sender: TObject);
var
   bErro : Boolean;
   iPagina : Integer;
   sMensagem: String;
   Componente : TWinControl;
begin
   if not(cdsDet.State in [dsInsert,dsEdit]) and
      not(cdsObjetoxItemContratual.State in [dsInsert,dsEdit]) then
    begin
       inherited;
       Exit;
    end;

   bErro:=False;
   sMensagem:='';
   iPagina:=0;
   Componente:=nil;

   if (tbcDetalhe.TabIndex=0) then
    begin
       //Componentes da página 1
       iPagina:=0;

       if (Trim(dblcReferencia.Text)='') and (dblcReferencia.Enabled) and  not(bErro) then
        begin
           bErro:=True;
           sMensagem:='A Referência de Cálculo não pode ser deixada em branco';
           Componente:=dblcReferencia;
        end;

       if (Trim(edDataBase.Text)='') and not(bErro) then
        begin
           bErro:=True;
           sMensagem:='A Data Base não pode ser deixada em Branco';
           Componente:=edDataBase;
        end;

       //Componentes da página 2
       if not(bErro) then iPagina:=1;

       if (gbFaixa.Enabled) and ((edrFaixaFinal.Value=0) or
                                 (edrFaixaFinal.Value<edrFaixaInicial.Value)) and not(bErro) then
        begin
           bErro:=True;
           sMensagem:='O Valor Final da Faixa não pode ser deixado em Branco/Zerado ou '+#10#13+
                      'ser menor que o valor Inicial';
           Componente:=edrFaixaFinal;
        end;

       if (dbeVlrCorrecao.Enabled) and (dbeVlrCorrecao.Value=0) and not(bErro) then
        begin
           bErro:=True;
           sMensagem:='O Valor/Percentual de Correção não pode ser deixada em Branco/Zerado';
           Componente:=dbeVlrCorrecao;
        end;

       if (dblcMoeda.Enabled) and (Trim(dblcMoeda.Text)='') and not(bErro) then
        begin
           bErro:=True;
           sMensagem:='A Moeda de Correção não pode ser deixada em Branco';
           Componente:=dblcMoeda;
        end;

       //Componentes da página 3
       if not(bErro) then iPagina:=2;

       if (Trim(dbeDescricao.Text)='') and not(bErro) then
        begin
           bErro:=True;
           sMensagem:='A Descrição da Correção não pode ser deixada em Branco';
           Componente:=dbeDescricao;
        end;

       if (Trim(dbeCodAditamentoCorr.Text)='') and not(bErro) then
        begin
           bErro:=True;
           sMensagem:='O Código de Aditamento da Correção não pode ser deixado em Branco';
           Componente:=dbeCodAditamentoCorr;
        end;

       if (Trim(dbmObsAditamento.Lines.Text)='') and not(bErro) then
        begin
           bErro:=True;
           sMensagem:='A Observação de aditamento não pode ser deixada em Branco';
           Componente:=dbmObsAditamento;
        end;

        //Componentes da Página do Aditamento da Correção
        if (tbsAditamento.TabVisible) and not(bErro) then
         begin
            iPagina:=3;

            if (Trim(edDataAditamento.Text)='') then
             begin
                bErro:=True;
                sMensagem:='A Data do Aditamento não pode ser deixada em Branco';
                Componente:=edDataAditamento;
             end;

            if (Trim(dbeCodigoAditamento.Text)='') and not(bErro) then
             begin
                bErro:=True;
                sMensagem:='A Código do Aditamento não pode ser deixada em Branco';
                Componente:=dbeCodigoAditamento;
             end;

            if (Trim(dbeDescricaoAditamento.Text)='') and not(bErro) then
             begin
                bErro:=True;
                sMensagem:='A Descrição do Aditamento não pode ser deixada em Branco';
                Componente:=dbeDescricaoAditamento;
             end;
         end;
    end;

   if (tbcDetalhe.TabIndex=1) then
    begin
       iPagina:=0;
       //Componentes da página 1 de Abatimentos
       if (Trim(dblcServProdAbatido.Text)<>'') and
          (dblcServProdAbatido.LookupValue=dblcServProd.LookupValue) and
          (Trim(dblcItemContratualAbatido.Text)<>'') and
          (dblcItemContratualAbatido.LookupValue=dblcItemContratual.LookupValue) and not(bErro) then
        begin
           bErro:=True;
           sMensagem:='"Serviço/Produto e Item Contratual de abatimento" '+#10#13+
                      'não podem  ser iguais a da correção em questão';
           Componente:=dblcServProdAbatido;
        end;

        //Componentes da Página de Aditamento do Abatimento
        if not(bErro) then iPagina:=1;

        if (tbsAditamento.TabVisible) and not(bErro) then
         begin
            iPagina:=1;

            if (Trim(edDataAditamentoAbat.Text)='') then
             begin
                bErro:=True;
                sMensagem:='A Data do Aditamento não pode ser deixada em Branco';
                Componente:=edDataAditamentoAbat;
             end;

            if (Trim(dbeCodigoAditamentoAbat.Text)='') and not(bErro) then
             begin
                bErro:=True;
                sMensagem:='A Código do Aditamento não pode ser deixada em Branco';
                Componente:=dbeCodigoAditamentoAbat;
             end;

            if (Trim(dbmDescricaoAditamentoAbat.Text)='') and not(bErro) then
             begin
                bErro:=True;
                sMensagem:='A Descrição do Aditamento não pode ser deixada em Branco';
                Componente:=dbmDescricaoAditamentoAbat;
             end;
         end;
    end;

   //Testa se houve erro
   if bErro then
    begin
       MsgDlg(sMensagem,'Erro',mtError,[mbOK],0);
       if (tbcDetalhe.TabIndex=0) then pgcDadosCorrecao.ActivePageIndex:=iPagina;
       if (tbcDetalhe.TabIndex=1) then pgcAbatimentos.ActivePageIndex:=iPagina;
       Componente.SetFocus;
       Abort;
    end
   else
    begin
       if (cdsDet.State in [dsInsert]) and (tbcDetalhe.TabIndex=0) then
        begin
           Inc(iNumCorrecoes);
           rOrdem:=rOrdem+1;
           rgAbrangencia.Enabled:=False;
           inherited;
           //Interrompe o ciclo de inclusões caso seja uma correção de Todo o Contrato
           if (rgAbrangencia.ItemIndex=0) then PostMessage(Handle,WM_CANCELARDET,0,0);
        end
       else
        begin
           inherited;
           cdsDetAfterScroll(nil);
           bDesAtivando:=False;
        end;
       tbsAditamento.TabVisible:=False;
    end;
end;

procedure TfrmCadCorrecoesContratuaisMT.CmeDetalheAtualizaBotoes(
  Sender: TObject);
begin
   inherited;

   if (cdsDet.Active) then edDataBase.Enabled:=cdsDet.FieldByName('DATAULTIMACORR').IsNull;

   if (tbcDetalhe.TabIndex=0) then
    begin
       sbtnInsDet.Enabled:=(((rgAbrangencia.ItemIndex=1) and
                             (Trim(dblcServProd.Text)<>'') and
                             (Trim(dblcItemContratual.Text)<>'')) or
                            ((rgAbrangencia.ItemIndex=0) and
                              (iNumCorrecoes=0))) and
                           (Trim(dbeNomeContrato.Text)<>'') and
                           (cds.State in [dsEdit]) and
                           not(bDesAtivando);

       tbsDadosI.TabVisible:=not(bDesAtivando);
       tbsDadosII.TabVisible:=not(bDesAtivando);
       tbsDadosIII.TabVisible:=not(bDesAtivando);
    end;

   if (tbcDetalhe.TabIndex=1) then
    begin
       sbtnInsDet.Enabled:=False;
       sbtnAltDet.Enabled:=(Trim(dblcServProd.Text)<>'') and (Trim(dblcItemContratual.Text)<>'');
       sbtnExcluiDet.Enabled:=False;
    end;

   pnlMestre.Enabled:=not(cdsDet.State in [dsInsert,dsEdit]);
end;

procedure TfrmCadCorrecoesContratuaisMT.CmeDetalheDelete(Sender: TObject);
begin
   if cdsDet.FieldByName('DATAULTIMACORR').IsNull then
    begin
       inherited;
       Dec(iNumCorrecoes);
       rgAbrangencia.Enabled:=(iNumCorrecoes=0);
    end
   else
    begin
       if (cdsDet.FieldByName('FLGATIVO').AsString='N') then
        begin
           bDesAtivando:=True;
           //Coloca a correção em modo de edição para que seja preenchido o Aditamento
           PostMessage(Handle,WM_EDITARDET,0,0);
           Abort;
        end
       else
        if MsgDlg( 'Esta correção não pode ser Excluída.'+#13#10+
                   'Deseja Desativá-la ?','Atenção', mtWarning, [mbYes, mbNo],0)=mrNo then
           Abort
        else
         begin
            bDesAtivando:=True;
            //Coloca a correção em modo de edição para que seja preenchido o Aditamento
            PostMessage(Handle,WM_EDITARDET,0,0);
            Abort;
         end;
    end;
end;

procedure TfrmCadCorrecoesContratuaisMT.sbtnOrdenarClick(Sender: TObject);
begin
   inherited;
   with TfrmOrdenaCorrecoesMT.Create(Self) do
   try
      cdsDet.Filtered:=False;
      cdsCorrecoes.Data:=cdsDet.Data;
      ShowModal;
      cdsDet.Close;
      cdsDet.Data:=cdsCorrecoes.Data;
      cdsDet.Filtered:=True;
   finally
      Free;
   end;
end;

procedure TfrmCadCorrecoesContratuaisMT.rgAbrangenciaClick(Sender: TObject);
begin
   inherited;
   dblcServProd.Enabled:=(rgAbrangencia.ItemIndex=1);
   dblcItemContratual.Enabled:=(rgAbrangencia.ItemIndex=1);
   dblcServProdAbatido.Enabled:=(rgAbrangencia.ItemIndex=1);
   dblcItemContratualAbatido.Enabled:=(rgAbrangencia.ItemIndex=1);
   dbcbAfetaOutrasCorrecoes.Enabled:=(rgAbrangencia.ItemIndex=1);
   CmeDetalheAtualizaBotoes(nil);
end;

procedure TfrmCadCorrecoesContratuaisMT.dblcServProdItemContratoChange(Sender: TObject);
var
   sIDObjeto : String;
begin
   inherited;
   if not(cds.State in [dsEdit]) then Exit;

   if (TwwDBLookupCombo(Sender).Name='dblcServProd') then
    begin
       dblcItemContratual.Clear;
       if (Trim(dblcServProd.Text)<>'') then
          sIDObjeto:=dblcServProd.LookupValue
       else
          sIDObjeto:='0';
          
       cdsItemContratual.Filtered:=False;
       cdsItemContratual.Filter:='(IDOBJETO = '+sIDObjeto+') ';
       cdsItemContratual.Filtered:=True;
    end;

   //Filtra cds detalhe
   cdsDet.Filtered:=False;
   if (Trim(dblcServProd.Text)<>'') and (Trim(dblcItemContratual.Text)<>'') then
       cdsDet.Filter:='(IDOBJETO = '+dblcServProd.LookupValue+') AND '+
                      '(IDITEM = '+dblcItemContratual.LookupValue+')'
   else
       cdsDet.Filter:='(IDOBJETO = 0) and (IDITEM = 0)'; //vazio

   cdsDet.Filtered:=True;

   if (Trim(dblcServProd.Text)<>'') and (Trim(dblcItemContratual.Text)<>'') then
    begin
       cdsObjetoxItemContratual.Filtered:=False;
       cdsObjetoxItemContratual.Filter:='(IDOBJETO = '+dblcServProd.LookupValue+') AND '+
                                        '(IDITEM = '+dblcItemContratual.LookupValue+')';
       cdsObjetoxItemContratual.Filtered:=True;
    end;

   dblcServProd.Hint:='';
   if (Trim(dblcServProd.Text)<>'') then
      dblcServProd.Hint:=cdsSrvProd.FieldByName('NOMEOBJETO').AsString;

   dblcItemContratual.Hint:='';
   if (Trim(dblcItemContratual.Text)<>'') then
      dblcItemContratual.Hint:=cdsItemContratual.FieldByName('NOME_ITEM').AsString;

   CmeCadastro.AtualizaBotoes(nil);
   CmeDetalhe.AtualizaBotoes(nil);
end;

procedure TfrmCadCorrecoesContratuaisMT.tbcDetalheChange(Sender: TObject);
begin
   inherited;
   CmeDetalheAtualizaBotoes(nil);
end;

procedure TfrmCadCorrecoesContratuaisMT.rgValorBaseCalculoClick(Sender: TObject);
begin
   lblReferencia.Enabled:=(rgValorBaseCalculo.ItemIndex=1);
   dblcReferencia.Enabled:=(rgValorBaseCalculo.ItemIndex=1);
end;

procedure TfrmCadCorrecoesContratuaisMT.dbrgFrequenciaChange(
  Sender: TObject);
begin
   case dbrgFrequencia.ItemIndex of
      0  : lblTituloData.Caption:='Data Inicial';
      1,2: lblTituloData.Caption:='Data Base/Inicial';
   end;
end;

procedure TfrmCadCorrecoesContratuaisMT.edDataBaseCloseUp(Sender: TObject);
var
   iDia,iMes,iAno: Word;
begin
   if (cdsDet.State in [dsInsert]) then
    begin
       //Impede cadastro de Data Base/Inicial < Data Base do Prod./Serv. x Item Contratual
       if (edDataBase.Date<cdsObjetoxItemContratual.FieldByName('DataBaseItem').AsDateTime) then
        begin
           MsgDlg('A Data Base/Inicial não pode ser menor que: '+
            FormatDateTime('dd/mm/yyyy',
            cdsObjetoxItemContratual.FieldByName('DataBaseItem').AsDateTime),'Erro',mtError,[mbOK],0);
           cdsDet.FieldByName('DATABASE').AsDateTime:=
                  cdsObjetoxItemContratual.FieldByName('DataBaseItem').AsDateTime;
        end;
    end;
end;

procedure TfrmCadCorrecoesContratuaisMT.dbrgTipoCorrecaoClick(Sender: TObject);
begin
   gbFaixa.Enabled:=((dbrgTipoCorrecao.ItemIndex=2) or (dbrgTipoCorrecao.ItemIndex=3));

   lblMoedaCorrecao.Enabled:=(dbrgTipoCorrecao.ItemIndex=4);
   dblcMoeda.Enabled:=(dbrgTipoCorrecao.ItemIndex=4);

   lblValorCorrecao.Enabled:=not(lblMoedaCorrecao.Enabled);
   dbeVlrCorrecao.Enabled:=not(lblMoedaCorrecao.Enabled);

   case dbrgTipoCorrecao.ItemIndex of
      0,2: lblValorCorrecao.Caption:='Percentual de Correção';
      1,3: lblValorCorrecao.Caption:='Valor de Correção';
   end;
end;

procedure TfrmCadCorrecoesContratuaisMT.dblcServProdContratoAbatidoChange(Sender: TObject);
var
   sIDObjeto: String;
begin
   dblcServProdAbatido.Hint:='';
   if (Trim(dblcServProdAbatido.Text)<>'') then
      dblcServProdAbatido.Hint:=cdsSrvProd.FieldByName('NOMEOBJETO').AsString;

   dblcItemContratualAbatido.Hint:='';
   if (Trim(dblcItemContratualAbatido.Text)<>'') then
      dblcItemContratualAbatido.Hint:=cdsItemContratualAbatido.FieldByName('NOME_ITEM').AsString;

   if (TwwDBLookupCombo(Sender).Name='dblcServProdAbatido') and
      (cdsObjetoxItemContratual.State in [dsInsert,dsEdit]) then
    begin
       dblcItemContratualAbatido.Clear;
       if (Trim(dblcServProdAbatido.Text)<>'') then
          sIDObjeto:=dblcServProdAbatido.LookupValue
       else
          sIDObjeto:='0';
          
       cdsItemContratualAbatido.Filtered:=False;
       cdsItemContratualAbatido.Filter:='(IDOBJETO = '+sIDObjeto+') ';
       cdsItemContratualAbatido.Filtered:=True;
    end;
   dbcbPermResMenor.Enabled:=(Trim(dblcServProdAbatido.Text)<>'') and
                             (Trim(dblcItemContratualAbatido.Text)<>'');
end;

procedure TfrmCadCorrecoesContratuaisMT.ModoEdicao(var msg: TMessage);
begin
   sbtnAlterar.Click;
end;

procedure TfrmCadCorrecoesContratuaisMT.ModoEdicaoDet(var msg: TMessage);
begin
   sbtnAltDet.Click;
end;

procedure TfrmCadCorrecoesContratuaisMT.CancelarDet(var msg: TMessage);
begin
   bbtnCancelarDet.Click;
end;

procedure TfrmCadCorrecoesContratuaisMT.cdsDetAfterScroll(DataSet: TDataSet);
begin
   inherited;
   if (cdsDet.FieldByName('FLGATIVO').AsString='S') or (cdsDet.RecordCount=0) then
    begin
       sbtnExcluiDet.imageIndex:=2;
       sbtnExcluiDet.Hint:='Excluir/Desativar';
    end
   else
    begin
       sbtnExcluiDet.imageIndex:=4;
       sbtnExcluiDet.Hint:='Ativar';
    end;
end;


end.



