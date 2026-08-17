{ --------------------------------------------------------------------------------------------------
// Alterações:
// Autor.........: Ricardo de Freitas Araújo Silva
// Data..........: 24/08/2011
// Nº SOL........: 161100
// Nº KINTANA....: 1358951
// Rotina........: Botão procurar
// Descrição.....: Alterad os parãmetro de busca do botão procurar.
---------------------------------------------------------------------------------------------------}
// Alterações:
// Autor.........: Ricardo de Freitas Araújo Silva
// Data..........: 18/08/2011
// Nº SOL........: 159240
// Nº KINTANA....: 1337878
// Rotina........: Totalização
// Descrição.....: Adicionado rotina de totalização de valores por período e Adicionado
//                 combobox de Atividade de Projeto, Tipo de Despesa e Atividade de Projeto
{ --------------------------------------------------------------------------------------------------
Rotina......: -
Nº SOL......: 150140
Nº KINTANA..: 1087554
Data........: 12/01/2011
Responsável.: Fábio Henrique Beccaria Sampaio
Descrição...: Implementação do Plano e Patro no Critério de Rateio
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Data      : 26.01.2006
Autor     : Antonio Marcos Fernandes de Souza (amf)
Descrição : Adicionado na tela a informação do exercício final. O MontaSelect também foi
            alterado.
------------------------------------------------------------------------------------------
Data      : 25.01.2006
Autor     : Antonio Marcos Fernandes de Souza (amf)
Pendência : ???
Descrição : Tela refeita no modelo CadastroGrid.
--------------------------------------------------------------------------------------------------
Rotina    : - (MontaSelect)
Data      : 09.01.2006
Autor     : Antonio Marcos Fernandes de Souza (amf)
Pendencia : 20921
Descrição : Adicionei ao valor chave, o field 'CODEXTERNO' para poder capturar pelo
            MontaSelect o conteúdo deste campo.
--------------------------------------------------------------------------------------------------
Rotina    : - (MontaSelect)
Data      : 15/08/2003
Autor     : André Pontes
Pendencia : 14495
Descrição : Alteração da ordem dos campos de pesquisa
            EXERCÍCIO - PERÍODO - NOME CENTRO DE CUSTO - CÓDIGO CENTRO DE CUSTO -
            DESCRIÇÃO DO TIPO DE RATEIO - CÓDIGO DO RATEIO - VALOR BASE UTILIZADO PELO RATEIO - EMPRESA
---------------------------------------------------------------------------------------------------}

{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Analista Responsável: Davi Ramos                      }
{ Atualizado Em: Julho/2002                             }
{Andre Tavares - pendência 14928 - 13/10/2003           }
{                                                       }
{*******************************************************}
unit FCadValCriterioRatMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroMT, MontaSelect, Db, DBClient, uCMClientDataSet,
  CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97Ctls, TB97, ExtCtrls, TREdit,
  wwdblook, CMDBLookupCombo, Mask, wwdbedit, Wwdbspin, uCtrlCadValCriterioRat,
  DBTables, Wwquery, uCMTypes, uCmSqlParams, FCadastroGridMT, Grids,
  Wwdbigrd, Wwdbgrid, uVerificaPreenchimento;

type
  TfrmCadValCriterioRatMT = class(TFrmCadastroGridMT)
    lblExercicio: TLabel;
    lblCriterio: TLabel;
    dblcCriterio: TCMDBLookupCombo;
    lblPeriodo: TLabel;
    dblcExercicio: TCMDBLookupCombo;
    dblcPeriodo: TCMDBLookupCombo;
    CdsExercicio: TCMClientDataSet;
    CdsPeriodo: TCMClientDataSet;
    CdsCriterio: TCMClientDataSet;
    Label2: TLabel;
    dblcPeriodoFim: TCMDBLookupCombo;
    cdsPeriodoFim: TCMClientDataSet;
    CMSqlParams1: TCMSqlParams;
    Label3: TLabel;
    dblcExercFim: TCMDBLookupCombo;
    cdsExercicioFim: TCMClientDataSet;
    CdsAux: TCMClientDataSet;
    Grid: TwwDBGrid;
    CMSqlParams2: TCMSqlParams;
    dsAux: TDataSource;
    Shape1: TShape;
    Label1: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    dblcCC: TCMDBLookupCombo;
    dblcPlano: TCMDBLookupCombo;
    dblcPatro: TCMDBLookupCombo;
    btIncluiCC: TSpeedButton;
    btIncluiPlano: TSpeedButton;
    btIncluiPatro: TSpeedButton;
    CdsCC: TCMClientDataSet;
    CdsPlano: TCMClientDataSet;
    CdsPatro: TCMClientDataSet;
    ClientDataSet1: TClientDataSet;
    cdsTotaliza: TClientDataSet;
    cdsTotalizaVALOR: TCurrencyField;
    cdsTotalizaPERIODOINICIO: TIntegerField;
    cdsTotalizaEXERCICIOINICIO: TIntegerField;
    cdsTotalizaEXERCICIOFIM: TIntegerField;
    dsTotaliza: TDataSource;
    cdsTotalizaPERIODOFIM: TIntegerField;
    pnlTotal: TPanel;
    lblTotalizacao: TLabel;
    dbgTotalizacao: TwwDBGrid;
    cdsTotalizaDESCRICAO: TStringField;
    Label8: TLabel;
    dblcPrograma: TCMDBLookupCombo;
    dblcTipoDespesa: TCMDBLookupCombo;
    btIncluiPrograma: TSpeedButton;
    btIncluiTipoDespesa: TSpeedButton;
    Label7: TLabel;
    Label9: TLabel;
    cdsPrograma: TCMClientDataSet;
    cdsTipoDespesa: TCMClientDataSet;
    dblcAtividadeProjeto: TCMDBLookupCombo;
    btIncluiAtividadeProjeto: TSpeedButton;
    Label10: TLabel;
    cdsAtividadeProjeto: TCMClientDataSet;
    pnlTotalRateioCdsAux: TPanel;
    pnlTotalRateioCds: TPanel;
    Splitter1: TSplitter;
    MontaSelect_Bkp: TMontaSelect;
    procedure CmeCadastroFind(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CmeCadastroEdit(Sender: TObject);
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroBeforeConfirma(sender: TObject; var Accept: Boolean);
    procedure dblcCriterioCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
    procedure dbGrdTitleButtonClick(Sender: TObject; AFieldName: String);
    procedure CdsAfterOpen(DataSet: TDataSet);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure CmeCadastroAfterConfirma(Sender: TObject);
    procedure dbGrdUpdateFooter(Sender: TObject);
    procedure GridTitleButtonClick(Sender: TObject; AFieldName: String);
    procedure GridRowChanged(Sender: TObject);
    procedure CdsAuxAfterOpen(DataSet: TDataSet);
    procedure GridUpdateFooter(Sender: TObject);
    procedure GridExit(Sender: TObject);
    procedure CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroCancel(Sender: TObject);
    procedure GridCalcCellColors(Sender: TObject; Field: TField;
    State: TGridDrawState; Highlight: Boolean; AFont: TFont;
    ABrush: TBrush);
    procedure CmeCadastroAtualizaBotoes(Sender: TObject);
    procedure btIncluiCCClick(Sender: TObject);
    procedure btIncluiPlanoClick(Sender: TObject);
    procedure btIncluiPatroClick(Sender: TObject);
    procedure dblcExercicioExit(Sender: TObject);
    procedure dblcExercFimExit(Sender: TObject);
    procedure dbgTotalizacaoCalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont;
      ABrush: TBrush);
    procedure dbgTotalizacaoTitleButtonClick(Sender: TObject;
      AFieldName: String);
    procedure CdsAfterPost(DataSet: TDataSet);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure btIncluiProgramaClick(Sender: TObject);
    procedure btIncluiTipoDespesaClick(Sender: TObject);
    procedure btIncluiAtividadeProjetoClick(Sender: TObject);
  private  // Private declarations
    CtrlCadValCriterioRat : TCtrlCadValCriterioRat;
    ValorBase             : Currency;
    procedure MensErroTela(sMsg: string);
    function VerificaPreenchimento: boolean;

    //Ricardo SOl 159240 Kintana 1337878
    //Função de totalização de Valores por grupo
    procedure Totaliza;

  public
   // Public declarations
  end;

var
   frmCadValCriterioRatMT: TfrmCadValCriterioRatMT;

implementation

{$R *.DFM}

uses
   uSistema, dBaseDados, uMensErro, uFuncoesOrcamento;


procedure TfrmCadValCriterioRatMT.FormCreate(Sender: TObject);
begin
   inherited;
   CtrlCadValCriterioRat := TCtrlCadValCriterioRat.Create;

   CtrlCadValCriterioRat.Initialize(DtmBaseDados.dbBaseDados,
                                    True,
                                    Sistema.ConnectionType,
                                    Sistema.ConnectionSide,
                                    Sistema.AppRemoteServer,
                                    True,
                                    nil,
                                    nil,
                                    False
                                   );

   CtrlCadValCriterioRat.IdEmpresa := Sistema.IdEmpresa;

   CtrlCadValCriterioRat.CdsValorCriRatOrc := Cds;

   cds.Data    := CtrlCadValCriterioRat.PesquisaCriterio(0,0,0,0);
   CdsAux.Data := CtrlCadValCriterioRat.ListaCCustoParaCrit(opInserir,-1,-1,-1,-1,-1,-1);

   //Ricardo SOl 159240 Kintana 1337878
   pnlTotalRateioCds.Caption := 'Total de ' + IntToStr(Cds.RecordCount) + ' relacionamento(s)';
   pnlTotalRateioCdsAux.Caption := 'Total de ' + IntToStr(CdsAux.RecordCount) + ' relacionamento(s)';
   //Ricardo SOl 159240 Kintana 1337878 - fim

   CdsCriterio.Data      := CtrlCadValCriterioRat.ListaCriterio;

   CdsExercicio.Data     := CtrlCadValCriterioRat.ListaExercicio(Sistema.IdEmpresa);
   cdsExercicioFim.Data  := CtrlCadValCriterioRat.ListaExercicio(Sistema.IdEmpresa);

   CdsPeriodo.Data       := CtrlCadValCriterioRat.ListaPeriodo(-2, -2, -2);
   cdsPeriodoFim.Data    := CtrlCadValCriterioRat.ListaPeriodo(-2, -2, -2);

   CdsCC.Data := CtrlCadValCriterioRat.ListaCentroDeCusto('-1');
   CdsPlano.Data := CtrlCadValCriterioRat.ListaPlanoPrev(-1);
   CdsPatro.Data := CtrlCadValCriterioRat.ListaPatro(-1);

   //Ricardo SOl 159240 Kintana 1337878
   cdsPrograma.Data          := CtrlCadValCriterioRat.ListaPrograma(-1);
   cdsTipoDespesa.Data       := CtrlCadValCriterioRat.ListaTipoDespesa(-1);
   cdsAtividadeProjeto.Data  := CtrlCadValCriterioRat.ListaAtivProj(-1,-1);

   cdsTotaliza.CreateDataSet;
   pnlTotal.Visible            := true;
   pnlTotalRateioCds.Visible   := true;
   Application.ProcessMessages;
   //Ricardo SOl 159240 Kintana 1337878 - fim
end;



procedure TfrmCadValCriterioRatMT.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Cds.Close;
   CdsCriterio.Close;
   CdsExercicio.Close;
   CdsPeriodo.Close;
   cdsPeriodoFim.Close;
   CdsCC.Close;
   CdsPlano.Close;
   CdsPatro.Close;

   //Ricardo SOL 159240 KTN 1337878
   cdsPrograma.Close;
   cdsTipoDespesa.Close;
   cdsAtividadeProjeto.Close;
   //Ricardo SOL 159240 KTN 1337878 - fim


   CtrlCadValCriterioRat.Free;
   inherited;
end;

procedure TfrmCadValCriterioRatMT.CmeCadastroFind(Sender: TObject);
var
   iCriterio, iExercicioIni, iExercicioFim, iPeriodoIni, iPeriodoFim: integer;
begin
   inherited;

   iCriterio      := -1;
   iExercicioIni  := -1;
   iExercicioFim  := -1;
   iPeriodoIni    := -1;
   iPeriodoFim    := -1;

   if MontaSelect.RetornouValor then
   begin
      //pendência 27759 - 28/05/2008 - substitui as chamadas da função strToInt por strToIntDef
      dblcExercicio.LookUpValue  := MontaSelect.ValoresChave[0];
      iExercicioIni              := StrToIntDef(MontaSelect.ValoresChave[0], 0);

      // Alterado por FHBS - SOL: 150140 KTN: 1087554
      cdsExercicioFim.Data := CtrlCadValCriterioRat.ListaExercicio(Sistema.IdEmpresa,
                                                                   StrToIntDef(dblcExercicio.LookUpValue,-1));

      dblcExercFim.LookUpValue   := MontaSelect.ValoresChave[5];
      iExercicioFim              := StrToIntDef(MontaSelect.ValoresChave[5], 0);

      dblcCriterio.LookUpValue    := MontaSelect.ValoresChave[2];
      iCriterio                   := StrToIntDef(MontaSelect.ValoresChave[2], 0);

      CdsPeriodo.Data := CtrlCadValCriterioRat.ListaPeriodo(Sistema.IdEmpresa,
                                                            iCriterio,
                                                            iExercicioIni);
      dblcPeriodo.LookUpValue := MontaSelect.ValoresChave[1];
      iPeriodoIni             := StrToIntDef(MontaSelect.ValoresChave[1], 0);

      CdsPeriodoFim.Data := CtrlCadValCriterioRat.ListaPeriodo(Sistema.IdEmpresa,
                                                               iCriterio,
                                                               iExercicioFim);

      dblcPeriodoFim.LookUpValue := MontaSelect.ValoresChave[3];
      iPeriodoFim                := StrToIntDef(MontaSelect.ValoresChave[3], 0);

      cds.Data := CtrlCadValCriterioRat.PesquisaCriterio(iCriterio,
                                                         iExercicioIni,
                                                         iExercicioFim,
                                                         iPeriodoIni,
                                                         iPeriodoFim);
      //Ricardo SOl 159240 Kintana 1337878
      pnlTotalRateioCds.Caption := 'Total de ' + IntToStr(Cds.RecordCount) + ' relacionamento(s)';

      //Ricardo SOl 159240 Kintana 1337878
      //Caso for anual posiciona o combobox de Período para janeiro e dezembro
      if MontaSelect.ValoresChave[1] = '0' then
      begin
           dblcPeriodo.LookUpValue     := '1';
           dblcPeriodoFim.LookUpValue  := '12';
           dblcCriterioCloseUp(dblcCriterio,dblcCriterio.LookupTable,nil,false);
           Application.ProcessMessages;
      end;



     //Ricardo SOl 159240 Kintana 1337878
     Totaliza();
     pnlTotal.Visible := true;
     pnlTotalRateioCds.Visible   := true;
     Application.ProcessMessages;

   end;
end;




procedure TfrmCadValCriterioRatMT.CmeCadastroEdit(Sender: TObject);
begin
   inherited;
   dblcCriterio.Enabled := False;
   dblcCriterio.Color   := clBtnFace;

  if not VerificaPreenchimento then
     bbtnCancelar.Click
  else
  begin
     CdsCC.Data := CtrlCadValCriterioRat.ListaCentroDeCusto('',
                                                            StrToIntDef(dblcCriterio.LookupValue, 0),
                                                            StrToIntDef(dblcExercicio.LookupValue, 0),
                                                            StrToIntDef(dblcExercFim.LookupValue, 0),
                                                            StrToIntDef(dblcPeriodo.LookupValue, 0),
                                                            StrToIntDef(dblcPeriodoFim.LookupValue, 0) );
     CdsPlano.Data := CtrlCadValCriterioRat.ListaPlanoPrev(-1,
                                                           StrToIntDef(dblcCriterio.LookupValue, 0),
                                                           StrToIntDef(dblcExercicio.LookupValue, 0),
                                                           StrToIntDef(dblcExercFim.LookupValue, 0),
                                                           StrToIntDef(dblcPeriodo.LookupValue, 0),
                                                           StrToIntDef(dblcPeriodoFim.LookupValue, 0) );
     CdsPatro.Data := CtrlCadValCriterioRat.ListaPatro(-1,
                                                       StrToIntDef(dblcCriterio.LookupValue, 0),
                                                       StrToIntDef(dblcExercicio.LookupValue, 0),
                                                       StrToIntDef(dblcExercFim.LookupValue, 0),
                                                       StrToIntDef(dblcPeriodo.LookupValue, 0),
                                                       StrToIntDef(dblcPeriodoFim.LookupValue, 0) );

     //Ricardo SOl 159240 Kintana 1337878
     cdsPrograma.Data := CtrlCadValCriterioRat.ListaPrograma(-1,
                                                       StrToIntDef(dblcCriterio.LookupValue, 0),
                                                       StrToIntDef(dblcExercicio.LookupValue, 0),
                                                       StrToIntDef(dblcExercFim.LookupValue, 0),
                                                       StrToIntDef(dblcPeriodo.LookupValue, 0),
                                                       StrToIntDef(dblcPeriodoFim.LookupValue, 0) );

     cdsTipoDespesa.Data := CtrlCadValCriterioRat.ListaTipoDespesa(-1,
                                                       StrToIntDef(dblcCriterio.LookupValue, 0),
                                                       StrToIntDef(dblcExercicio.LookupValue, 0),
                                                       StrToIntDef(dblcExercFim.LookupValue, 0),
                                                       StrToIntDef(dblcPeriodo.LookupValue, 0),
                                                       StrToIntDef(dblcPeriodoFim.LookupValue, 0) );

     cdsAtividadeProjeto.Data := CtrlCadValCriterioRat.ListaAtivProj(-1, -1,
                                                       StrToIntDef(dblcCriterio.LookupValue, 0),
                                                       StrToIntDef(dblcExercicio.LookupValue, 0),
                                                       StrToIntDef(dblcExercFim.LookupValue, 0),
                                                       StrToIntDef(dblcPeriodo.LookupValue, 0),
                                                       StrToIntDef(dblcPeriodoFim.LookupValue, 0) );
     

     //Ricardo SOl 159240 Kintana 1337878 - fim



     CdsAux.Data := CtrlCadValCriterioRat.ListaCCustoParaCrit(CmeCadastro.Operacao,
                                                              Sistema.IdEmpresa,
                                                              Cds.FieldByName('PERIODO').AsInteger,
                                                              Cds.FieldByName('PERIODOFIM').AsInteger,
                                                              Cds.FieldByName('EXERCICIO').AsInteger,
                                                              Cds.FieldByName('EXERCICIOFIM').AsInteger,
                                                              Cds.FieldByName('IDCRITERIORATORC').AsInteger);

     //Ricardo SOl 159240 Kintana 1337878
     pnlTotal.Visible := false;
     pnlTotalRateioCds.Visible   := false;
     Application.ProcessMessages;

  end;
end;



procedure TfrmCadValCriterioRatMT.CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
var
   pnlTotalRateioCdsCaption:string;
begin
   inherited;
   Accept := VerificaPreenchimento;

   TRY

   Screen.Cursor := crHourGlass;
   bbtnConfirmar.Enabled := false;
   pnlTotalRateioCdsCaption  := pnlTotalRateioCdsAux.Caption;
   pnlTotalRateioCdsAux.Caption := 'Salvando valores de base para rateio. Aguarde...';
   Application.ProcessMessages;


   if Accept then
   begin
      Accept := CtrlCadValCriterioRat.GravarCriterio(CdsAux.Data,
                                                     CmeCadastro.Operacao,
                                                     StrToIntDef(dblcPeriodo.LookupValue, 0),
                                                     StrToIntDef(dblcPeriodoFim.LookupValue, 0),
                                                     StrToIntDef(dblcExercicio.LookupValue, 0),
                                                     StrToIntDef(dblcExercFim.LookupValue, 0),
                                                     Sistema.IdEmpresa,
                                                     StrToInt(dblcCriterio.LookupValue));
      Application.ProcessMessages;

      if not Accept then
         MsgDlg('Houve um erro ao gravar os dados.' + #13 +
                'Motivo: ' + CtrlCadValCriterioRat.MessageInfo,'Erro',mtError,[mbOk],0)
      else
      begin
         dblcCriterio.OnCloseUp(self,CdsCriterio,CdsCriterio,False);
         CmeCadastro.AtualizaBotoes(self);

         dblcCriterio.Enabled   := True;
         dblcExercicio.Enabled  := True;
         dblcPeriodo.Enabled    := True;
         dblcExercFim.Enabled   := True;
         dblcPeriodoFim.Enabled := True;

         dblcCriterio.Color     := clWindow;
         dblcCriterio.Color     := clWindow;
         dblcExercicio.Color    := clWindow;
         dblcPeriodo.Color      := clWindow;
         dblcExercFim.Color     := clWindow;
         dblcPeriodoFim.Color   := clWindow;
      end;


   end;

   FINALLY
          bbtnConfirmar.Enabled := true;
          pnlTotalRateioCdsAux.Caption := pnlTotalRateioCdsCaption;

          //Ricardo SOl 159240 Kintana 1337878
          pnlTotal.Visible := true;
          pnlTotalRateioCds.Visible   := true;

          Screen.Cursor := crDefault;
          Application.ProcessMessages;
   END;
end;




procedure TfrmCadValCriterioRatMT.CmeCadastroBeforeConfirma(sender: TObject; var Accept: Boolean);
begin
   inherited;
   try
      Accept := True;
   except
      On E: ExCeption do
      begin
         Accept := False;
         MsgDlg('Não foi possível cadastrar critério de rateio.','Aviso',mtWarning,[mbOk],0);
         Repaint;
      end;
   end;
end;



procedure TfrmCadValCriterioRatMT.dblcCriterioCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
begin
   if not (Cds.State in [dsEdit, dsInsert]) then
   begin
      Cds.Data := CtrlCadValCriterioRat.PesquisaCriterio(StrToIntDef(dblcCriterio.LookupValue, -1),
                                                         StrToIntDef(dblcExercicio.LookupValue, -1),
                                                         StrToIntDef(dblcExercFim.LookupValue, -1),
                                                         StrToIntDef(dblcPeriodo.LookupValue, -1),
                                                         StrToIntDef(dblcPeriodoFim.LookupValue, -1));

      //Ricardo SOl 159240 Kintana 1337878
      pnlTotalRateioCds.Caption := 'Total de ' + IntToStr(Cds.RecordCount) + ' relacionamento(s)';
      pnlTotalRateioCdsAux.Caption := 'Total de ' + IntToStr(CdsAux.RecordCount) + ' relacionamento(s)';
      //Ricardo SOl 159240 Kintana 1337878 - fim


      //Ricardo SOl 159240 Kintana 1337878
      Totaliza();

      if CmeCadastro.Operacao = opVazio then
         CmeCadastro.Operacao := opIdle;

      CmeCadastro.AtualizaBotoes(self);
      
      TWinControl(Sender).SetFocus;
   end;
end;



procedure TfrmCadValCriterioRatMT.MensErroTela(sMsg: string);
begin
  MsgDlg(sMsg, 'Aviso', mtWarning, [mbOK], 0)
end;

procedure TfrmCadValCriterioRatMT.dbGrdTitleButtonClick(Sender: TObject;
  AFieldName: String);
begin
  inherited;
   cds.IndexFieldNames := AfieldName;
end;




function TfrmCadValCriterioRatMT.VerificaPreenchimento: boolean;
begin
  Result := False;
	try
      if length(trim(dblcCriterio.Text)) = 0 then
         raise EValidacao.CreateVal('Obrigatório preencher Critério!', dblcCriterio);

      if length(trim(dblcExercicio.Text)) = 0 then
         raise EValidacao.CreateVal('Obrigatório preencher o exercício inicial!', dblcExercicio);

      if length(trim(dblcPeriodo.Text)) = 0 then
         raise EValidacao.CreateVal('Obrigatório preencher o período inicial!', dblcPeriodo );

      if length(trim(dblcPeriodoFim.Text)) = 0 then
         raise EValidacao.CreateVal('Obrigatório preencher o período final!', dblcPeriodoFim );
  except
      on ev : EValidacao do
      begin
       if ev.Show then MsgDlg(ev.message, 'Orçamento', mtWarning, [mbOk], 0);
         Repaint;
       if ev.Control.CanFocus then ev.Control.SetFocus;
         Exit;
      end;
  end;

   Result := True;
end;

procedure TfrmCadValCriterioRatMT.CdsAfterOpen(DataSet: TDataSet);
begin
  inherited;
  TFloatField(DataSet.FieldByName('VLRCRIRATORC')).DisplayFormat := '#,##0.00';
end;




procedure TfrmCadValCriterioRatMT.CmeCadastroInsert(Sender: TObject);
var
  sMsg: string;

begin
  inherited;
  CmeCadastro.RepetirInsert := False;

  if cds.State in [dsBrowse] then
     cds.Insert;

  if not VerificaPreenchimento then
  begin
     bbtnCancelar.Click;
     Application.ProcessMessages;
  end
  else
  begin
     if (Cds.RecordCount = 0) then
     begin
        // pendência 27759 - 28/05/2008 - substitui as chamadas da função strToInt por strToIntDef
        sMsg := CtrlCadValCriterioRat.TestaCriterio(StrToIntDef(dblcCriterio.LookupValue, 0),
                                                    StrToIntDef(dblcPeriodo.LookupValue, 0),
                                                    StrToIntDef(dblcPeriodoFim.LookupValue, 0),
                                                    StrToIntDef(dblcExercicio.LookupValue, 0),
                                                    StrToIntDef(dblcExercFim.LookupValue, 0));
        if Trim(sMsg) <> '' then
        begin
           MsgDlg(sMsg,'Erro',mtError,[mbOk],0);
           bbtnCancelar.Click;
           Exit;
        end;
     end;

     dblcCriterio.Enabled   := False;
     dblcExercicio.Enabled  := False;
     dblcPeriodo.Enabled    := False;
     dblcExercFim.Enabled   := False;
     dblcPeriodoFim.Enabled := False;

     dblcCriterio.Color     := clBtnFace;
     dblcCriterio.Color     := clBtnFace;
     dblcExercicio.Color    := clBtnFace;
     dblcPeriodo.Color      := clBtnFace;
     dblcExercFim.Color     := clBtnFace;
     dblcPeriodoFim.Color   := clBtnFace;

     CdsCC.Data := CtrlCadValCriterioRat.ListaCentroDeCusto('',
                                                            StrToIntDef(dblcCriterio.LookupValue, 0),
                                                            StrToIntDef(dblcExercicio.LookupValue, 0),
                                                            StrToIntDef(dblcExercFim.LookupValue, 0),
                                                            StrToIntDef(dblcPeriodo.LookupValue, 0),
                                                            StrToIntDef(dblcPeriodoFim.LookupValue, 0) );
     CdsPlano.Data := CtrlCadValCriterioRat.ListaPlanoPrev(-1,
                                                           StrToIntDef(dblcCriterio.LookupValue, 0),
                                                           StrToIntDef(dblcExercicio.LookupValue, 0),
                                                           StrToIntDef(dblcExercFim.LookupValue, 0),
                                                           StrToIntDef(dblcPeriodo.LookupValue, 0),
                                                           StrToIntDef(dblcPeriodoFim.LookupValue, 0) );
     CdsPatro.Data := CtrlCadValCriterioRat.ListaPatro(-1,
                                                       StrToIntDef(dblcCriterio.LookupValue, 0),
                                                       StrToIntDef(dblcExercicio.LookupValue, 0),
                                                       StrToIntDef(dblcExercFim.LookupValue, 0),
                                                       StrToIntDef(dblcPeriodo.LookupValue, 0),
                                                       StrToIntDef(dblcPeriodoFim.LookupValue, 0) );

     //Ricardo SOl 159240 Kintana 1337878
     cdsPrograma.Data := CtrlCadValCriterioRat.ListaPrograma(-1,
                                                       StrToIntDef(dblcCriterio.LookupValue, 0),
                                                       StrToIntDef(dblcExercicio.LookupValue, 0),
                                                       StrToIntDef(dblcExercFim.LookupValue, 0),
                                                       StrToIntDef(dblcPeriodo.LookupValue, 0),
                                                       StrToIntDef(dblcPeriodoFim.LookupValue, 0) );

     cdsTipoDespesa.Data := CtrlCadValCriterioRat.ListaTipoDespesa(-1,
                                                       StrToIntDef(dblcCriterio.LookupValue, 0),
                                                       StrToIntDef(dblcExercicio.LookupValue, 0),
                                                       StrToIntDef(dblcExercFim.LookupValue, 0),
                                                       StrToIntDef(dblcPeriodo.LookupValue, 0),
                                                       StrToIntDef(dblcPeriodoFim.LookupValue, 0) );

     cdsAtividadeProjeto.Data := CtrlCadValCriterioRat.ListaAtivProj(-1,-1,
                                                       StrToIntDef(dblcCriterio.LookupValue, 0),
                                                       StrToIntDef(dblcExercicio.LookupValue, 0),
                                                       StrToIntDef(dblcExercFim.LookupValue, 0),
                                                       StrToIntDef(dblcPeriodo.LookupValue, 0),
                                                       StrToIntDef(dblcPeriodoFim.LookupValue, 0) );
     //Ricardo SOl 159240 Kintana 1337878 - fim


     //pendência 27759 - 28/05/2008 - substitui as chamadas da função strToInt por strToIntDef
     CdsAux.Data  := CtrlCadValCriterioRat.ListaCCustoParaCrit(CmeCadastro.Operacao,
                                                               Sistema.IdEmpresa,
                                                               StrToIntDef(dblcPeriodo.LookupValue, 0),
                                                               StrToIntDef(dblcPeriodoFim.LookupValue, 0),
                                                               StrToIntDef(dblcExercicio.LookupValue, 0),
                                                               StrToIntDef(dblcExercFim.LookupValue, 0),
                                                               StrToIntDef(dblcCriterio.LookupValue, 0));
     // Cancela o Append feito pelo padrão, pois
     //a inserção será feita de forma específica.
     Cds.Cancel;

     //Ricardo SOl 159240 Kintana 1337878
     pnlTotal.Visible := false;
     pnlTotalRateioCds.Visible   := false;
     Application.ProcessMessages;

  end;
end;




procedure TfrmCadValCriterioRatMT.CmeCadastroAfterConfirma(
  Sender: TObject);
begin
  inherited;
  cmeCadastro.Find(Sender);
end;




procedure TfrmCadValCriterioRatMT.dbGrdUpdateFooter(Sender: TObject);
var
  cdsAux: TClientDataSet;
  rSomaValor: extended;
begin
  inherited;
  try
    rSomaValor := 0;

    cdsAux := TClientDataSet.Create(nil);
    cdsAux.Data  := cds.Data;

    while not cdsAux.Eof do
    begin
       rSomaValor := rSomaValor + cdsAux.FieldByName('VLRCRIRATORC').Value;
       CdsAux.Next;
    end;

    dbGrd.ColumnByName('VLRCRIRATORC').FooterValue := FormatFloat('#,##0.00', rSomaValor);
  finally
     FreeAndNil(cdsAux);
  end;
end;



procedure TfrmCadValCriterioRatMT.GridTitleButtonClick(Sender: TObject;
  AFieldName: String);
begin
  inherited;
  CdsAux.IndexFieldNames := AFieldName;
end;




procedure TfrmCadValCriterioRatMT.GridRowChanged(Sender: TObject);
begin
  inherited;
  // Controle para evitar que o usuário fique inserindo registro no grid
  if (CdsAux.FieldByName('VALIDAR').AsString = 'S') then
    TFloatField(CdsAux.FieldByName('VALOR')).ReadOnly  := False
  else
    TFloatField(CdsAux.FieldByName('VALOR')).ReadOnly  := True;
end;




procedure TfrmCadValCriterioRatMT.CdsAuxAfterOpen(DataSet: TDataSet);
begin
  inherited;
  TStringField(CdsAux.FieldByName('CODEXTERNO')).ReadOnly  := True; // Alterado por FHBS - SOL: 150140 KTN: 1087554
  TStringField(CdsAux.FieldByName('CENTCUST')).ReadOnly    := True;
  TStringField(CdsAux.FieldByName('PLANO')).ReadOnly       := True; // Alterado por FHBS - SOL: 150140 KTN: 1087554
  TStringField(CdsAux.FieldByName('PATRO')).ReadOnly       := True; // Alterado por FHBS - SOL: 150140 KTN: 1087554
  TIntegerField(CdsAux.FieldByName('PERINI')).ReadOnly     := True;
  TIntegerField(CdsAux.FieldByName('PERFIM')).ReadOnly     := True;
  TIntegerField(CdsAux.FieldByName('EXEINI')).ReadOnly     := True;
  TIntegerField(CdsAux.FieldByName('EXEFIM')).ReadOnly     := True;
  TFloatField(CdsAux.FieldByName('VLREFET')).ReadOnly      := True;


  //Ricardo SOL 159240 KTN 1337878
  TStringField(CdsAux.FieldByName('PROGRAMA')).ReadOnly     := True;
  TStringField(CdsAux.FieldByName('TIPODESPESA')).ReadOnly  := True; 
  //Ricardo SOL 159240 KTN 1337878 - fim

  TFloatField(CdsAux.FieldByName('VLREFET')).DisplayFormat := '#,##0.00;-#,##0.00';
  TFloatField(CdsAux.FieldByName('VALOR')).DisplayFormat   := '#,##0.00;-#,##0.00';
end;




procedure TfrmCadValCriterioRatMT.GridUpdateFooter(Sender: TObject);
var
  _Cds: TClientDataSet;
  rVlrBase,rVlrInsert: Double;

begin
  inherited;
  try
     _Cds       := TClientDataSet.Create(nil);
     _Cds.Data  := CdsAux.Data;
     rVlrBase   := 0;
     rVlrInsert := 0;

     while not _Cds.Eof do
     begin
         rVlrBase   := rVlrBase   + _Cds.FieldByName('VALOR').AsFloat;
         rVlrInsert := rVlrInsert + _Cds.FieldByName('VLREFET').AsFloat;
        _Cds.Next;
     end;

     Grid.ColumnByName('VALOR').FooterValue   := FormatFloat('#,##0.00;-#,##0.00',rVlrBase);
     Grid.ColumnByName('VLREFET').FooterValue := FormatFloat('#,##0.00;-#,##0.00',rVlrInsert);

  finally
     FreeAndNil(_Cds);
  end;
end;




procedure TfrmCadValCriterioRatMT.GridExit(Sender: TObject);
begin
  inherited;
  case CdsAux.State of
     dsInsert: CdsAux.Cancel;
     dsEdit  : CdsAux.Post;
  end;
end;




procedure TfrmCadValCriterioRatMT.CmeCadastroApplyDelete(sender: TObject;
  var Accept: Boolean);
begin
  inherited;

  TRY

  Screen.Cursor := crHourGlass;

  Accept := CtrlCadValCriterioRat.DeletaCriteriosRateio;

  if not Accept then
     MsgDlg('Não foi possível excluir o registro.' + #13 +
            'Motivo: ' + CtrlCadValCriterioRat.MessageInfo,'Erro',mtError,[mbOk],0);

   //Ricardo SOl 159240 Kintana 1337878
   pnlTotal.Visible := true;
   pnlTotalRateioCds.Visible   := true;
   Application.ProcessMessages;
 FINALLY
   Screen.Cursor := crDefault;
 END;  
end;


procedure TfrmCadValCriterioRatMT.CmeCadastroCancel(Sender: TObject);
begin
  inherited;
  dblcCriterio.Enabled   := True;
  dblcExercicio.Enabled  := True;
  dblcPeriodo.Enabled    := True;
  dblcExercFim.Enabled   := True;
  dblcPeriodoFim.Enabled := True;

  dblcCriterio.Color     := clWindow;
  dblcCriterio.Color     := clWindow;
  dblcExercicio.Color    := clWindow;
  dblcPeriodo.Color      := clWindow;
  dblcExercFim.Color     := clWindow;
  dblcPeriodoFim.Color   := clWindow;
  dblcCriterio.OnCloseUp(self,CdsCriterio,CdsCriterio,False);

  //Ricardo SOl 159240 Kintana 1337878
  pnlTotal.Visible := true;
  pnlTotalRateioCds.Visible   := true;
  Application.ProcessMessages;
end;




procedure TfrmCadValCriterioRatMT.GridCalcCellColors(Sender: TObject;
  Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont;
  ABrush: TBrush);
begin
  inherited;
  // faz com que as linhas do grid tenham cores alternadas
  if State <> [gdSelected] then begin
     if not Highlight then
     begin
        // linhas ímpares = amarelo, linhas pares = branco
        if ((Sender as TwwDBGrid).CalcCellRow mod 2) = 0 then
        begin
           ABrush.Color := $00C0FFFF; // amarelo bebê
        end
        else
        begin
           ABrush.Color := clWhite;
        end;

        // Para as contas com dotação já efetuada, pintar a linha de vermelho
        if ((CdsAux.RecordCount <> 0) and
            (CdsAux.FieldByName('VALIDAR').AsString = 'N') ) then
           ABrush.Color := $00594DF9

     end;
  end
  else
  begin
     ABrush.Color := clHighLight;
     AFont.Color  := clHighLightText;
  end;

end;

procedure TfrmCadValCriterioRatMT.CmeCadastroAtualizaBotoes(
  Sender: TObject);
begin
  inherited;

  if CmeCadastro.Operacao in [opInserir, opAlterar] then
  begin
    dblcCC.Enabled := True;
    dblcCC.Color   := clWindow;
    btIncluiCC.Enabled := True;

    dblcPlano.Enabled := True;
    dblcPlano.Color   := clWindow;
    btIncluiPlano.Enabled := True;

    dblcPatro.Enabled := True;
    dblcPatro.Color   := clWindow;
    btIncluiPatro.Enabled := True;

    //Ricardo SOL 159240 KTN 1337878
    dblcPrograma.Enabled := True;
    dblcPrograma.Color   := clWindow;
    btIncluiPrograma.Enabled := True;

    dblcTipoDespesa.Enabled := True;
    dblcTipoDespesa.Color   := clWindow;
    btIncluiTipoDespesa.Enabled := True;

    dblcAtividadeProjeto.Enabled := True;
    dblcAtividadeProjeto.Color   := clWindow;
    btIncluiAtividadeProjeto.Enabled := True;
    //Ricardo SOL 159240 KTN 1337878 - fim

  end
  else
  begin
    dblcCC.Enabled := False;
    dblcCC.Color   := clBtnFace;
    btIncluiCC.Enabled := False;

    dblcPlano.Enabled := False;
    dblcPlano.Color   := clBtnFace;
    btIncluiPlano.Enabled := False;

    dblcPatro.Enabled := False;
    dblcPatro.Color   := clBtnFace;
    btIncluiPatro.Enabled := False;

    //Ricardo SOL 159240 KTN 1337878
    dblcPrograma.Enabled := False;
    dblcPrograma.Color   := clBtnFace;
    btIncluiPrograma.Enabled := False;

    dblcTipoDespesa.Enabled := False;
    dblcTipoDespesa.Color   := clBtnFace;
    btIncluiTipoDespesa.Enabled := False;

    dblcAtividadeProjeto.Enabled := false;
    dblcAtividadeProjeto.Color   := clBtnFace;
    btIncluiAtividadeProjeto.Enabled := false;
    //Ricardo SOL 159240 KTN 1337878 - fim
  end;

end;

procedure TfrmCadValCriterioRatMT.btIncluiCCClick(Sender: TObject);
begin
  inherited;

  TRY

     Screen.Cursor := crHourGlass;

     if ((Trim(dblcCC.Text) = '' ) and (MsgDlg('Será incluído TODOS os Centros de Custos.' +CR_LF+
                                            'Confirma a Execução?', 'Confirmação',
                                            mtConfirmation, [mbYes,mbNo,mbHelp], 0) = mrYes)) or

     ((Trim(dblcCC.Text) <> '') and (MsgDlg('Será incluído o Centro de Custo ' + Trim(dblcCC.Text) + '.' +CR_LF+
                                            'Confirma a Execução?', 'Confirmação',
                                            mtConfirmation, [mbYes,mbNo,mbHelp], 0) = mrYes)) then
     begin
          CdsAux.Data := CtrlCadValCriterioRat.AdionaDadosListaX(CdsAux.Data, lxCentroDeCusto, dblcCC,
                                                           StrToIntDef(dblcCriterio.LookupValue, 0),
                                                           StrToIntDef(dblcExercicio.LookupValue, 0),
                                                           StrToIntDef(dblcExercFim.LookupValue, 0),
                                                           StrToIntDef(dblcPeriodo.LookupValue, 0),
                                                           StrToIntDef(dblcPeriodoFim.LookupValue, 0));
          CdsAux.First;
     end;

     //Ricardo SOl 159240 Kintana 1337878
     pnlTotalRateioCds.Caption := 'Total de ' + IntToStr(Cds.RecordCount) + ' relacionamento(s)';
     pnlTotalRateioCdsAux.Caption := 'Total de ' + IntToStr(CdsAux.RecordCount) + ' relacionamento(s)';
     //Ricardo SOl 159240 Kintana 1337878 - fim

  FINALLY
     Screen.Cursor := crDefault;
  END;
end;

procedure TfrmCadValCriterioRatMT.btIncluiPlanoClick(Sender: TObject);
begin
  inherited;
  TRY

     Screen.Cursor := crHourGlass;
     if ((Trim(dblcPlano.Text) = '' ) and (MsgDlg('Será incluído TODOS os Planos.' +CR_LF+
                                            'Confirma a Execução?', 'Confirmação',
                                            mtConfirmation, [mbYes,mbNo,mbHelp], 0) = mrYes)) or

     ((Trim(dblcPlano.Text) <> '') and (MsgDlg('Será incluído o Plano ' + Trim(dblcPlano.Text) + '.' +CR_LF+
                                            'Confirma a Execução?', 'Confirmação',
                                            mtConfirmation, [mbYes,mbNo,mbHelp], 0) = mrYes)) then
     begin
          CdsAux.Data := CtrlCadValCriterioRat.AdionaDadosListaX(CdsAux.Data, lxPlanoPrev, dblcPlano,
                                                           StrToIntDef(dblcCriterio.LookupValue, 0),
                                                           StrToIntDef(dblcExercicio.LookupValue, 0),
                                                           StrToIntDef(dblcExercFim.LookupValue, 0),
                                                           StrToIntDef(dblcPeriodo.LookupValue, 0),
                                                           StrToIntDef(dblcPeriodoFim.LookupValue, 0));
          CdsAux.First;
     end;

     //Ricardo SOl 159240 Kintana 1337878
     pnlTotalRateioCds.Caption := 'Total de ' + IntToStr(Cds.RecordCount) + ' relacionamento(s)';
     pnlTotalRateioCdsAux.Caption := 'Total de ' + IntToStr(CdsAux.RecordCount) + ' relacionamento(s)';
     //Ricardo SOl 159240 Kintana 1337878 - fim
  FINALLY
     Screen.Cursor := crDefault;
  END;
end;

procedure TfrmCadValCriterioRatMT.btIncluiPatroClick(Sender: TObject);
begin
  inherited;
  TRY

     Screen.Cursor := crHourGlass;
     if ((Trim(dblcPatro.Text) = '' ) and (MsgDlg('Será incluído TODOS os Patros.' +CR_LF+
                                            'Confirma a Execução?', 'Confirmação',
                                            mtConfirmation, [mbYes,mbNo,mbHelp], 0) = mrYes)) or

        ((Trim(dblcPatro.Text) <> '') and (MsgDlg('Será incluído o Patro ' + Trim(dblcPatro.Text) + '.' +CR_LF+
                                            'Confirma a Execução?', 'Confirmação',
                                            mtConfirmation, [mbYes,mbNo,mbHelp], 0) = mrYes)) then
     begin
          CdsAux.Data := CtrlCadValCriterioRat.AdionaDadosListaX(CdsAux.Data, lxPatro, dblcPatro,
                                                           StrToIntDef(dblcCriterio.LookupValue, 0),
                                                           StrToIntDef(dblcExercicio.LookupValue, 0),
                                                           StrToIntDef(dblcExercFim.LookupValue, 0),
                                                           StrToIntDef(dblcPeriodo.LookupValue, 0),
                                                           StrToIntDef(dblcPeriodoFim.LookupValue, 0));
          CdsAux.First;
     end;

     //Ricardo SOl 159240 Kintana 1337878
     pnlTotalRateioCds.Caption := 'Total de ' + IntToStr(Cds.RecordCount) + ' relacionamento(s)';
     pnlTotalRateioCdsAux.Caption := 'Total de ' + IntToStr(CdsAux.RecordCount) + ' relacionamento(s)';
     //Ricardo SOl 159240 Kintana 1337878 - fim

  FINALLY
     Screen.Cursor := crDefault;
  END;
end;

procedure TfrmCadValCriterioRatMT.dblcExercicioExit(Sender: TObject);
var
  sOldValue: String;
begin
  inherited;
  // Alterado por FHBS - SOL: 150140 KTN: 1087554
  sOldValue := dblcPeriodo.LookupValue;
  CdsPeriodo.Data := CtrlCadValCriterioRat.ListaPeriodo(Sistema.IdEmpresa,
                                                        CdsCriterio.FieldByName('IDCRITERIORATORC').AsInteger,
                                                        CdsExercicio.FieldByName('EXERCICIO').AsInteger);
  if sOldValue <> '' then
    dblcPeriodo.LookupValue := sOldValue;

  sOldValue := dblcExercFim.LookupValue;
  cdsExercicioFim.Data := CtrlCadValCriterioRat.ListaExercicio(Sistema.IdEmpresa,
                                                               CdsExercicio.FieldByName('EXERCICIO').AsInteger);
  if sOldValue <> '' then
    dblcExercFim.LookupValue := sOldValue;

  if StrToIntDef(dblcExercFim.LookUpValue,0) < StrToIntDef(dblcExercicio.LookUpValue,0) then
    dblcExercFim.LookUpValue := dblcExercicio.LookUpValue;

  dblcExercFimExit(dblcExercFim);
end;

procedure TfrmCadValCriterioRatMT.dblcExercFimExit(Sender: TObject);
var
  sOldValue: String;
begin
  inherited;
  // Alterado por FHBS - SOL: 150140 KTN: 1087554
  sOldValue := dblcPeriodoFim.LookupValue;
  cdsPeriodoFim.Data := CtrlCadValCriterioRat.ListaPeriodo(Sistema.IdEmpresa,
                                                           CdsCriterio.FieldByName('IDCRITERIORATORC').AsInteger,
                                                           cdsExercicioFim.FieldByName('EXERCICIO').AsInteger);
  if sOldValue <> '' then
    dblcPeriodoFim.LookupValue := sOldValue;
end;

procedure TfrmCadValCriterioRatMT.Totaliza;
begin
     TRY

        Cds.DisableControls;
        cdsTotaliza.DisableControls;
        cdsTotaliza.EmptyDataset;

        if not Cds.Active then
           Exit;

        if Cds.IsEmpty then
           Exit;

        Cds.First;
        While not Cds.eof Do
        begin
             cdsTotaliza.Filtered := false;
             cdsTotaliza.Filter   := ' EXERCICIOINICIO = '   + Cds.FieldByName('EXERCICIO').AsString    +
                                     ' AND EXERCICIOFIM = '  + Cds.FieldByName('EXERCICIOFIM').AsString +
                                     ' AND PERIODOINICIO = ' + Cds.FieldByName('PERIODO').AsString      +
                                     ' AND PERIODOFIM = '    + Cds.FieldByName('PERIODOFIM').AsString;
             cdsTotaliza.Filtered := true;

             if cdsTotaliza.IsEmpty then
             begin
                  //Insere
                  cdsTotaliza.Filtered := false;
                  cdsTotaliza.Append;
                  cdsTotaliza.fieldbyname('EXERCICIOINICIO').AsInteger := Cds.FieldByName('EXERCICIO').AsInteger;
                  cdsTotaliza.fieldbyname('EXERCICIOFIM').AsInteger    := Cds.FieldByName('EXERCICIOFIM').AsInteger;
                  cdsTotaliza.fieldbyname('PERIODOINICIO').AsInteger   := Cds.FieldByName('PERIODO').AsInteger;
                  cdsTotaliza.fieldbyname('PERIODOFIM').AsInteger      := Cds.FieldByName('PERIODOFIM').AsInteger;
                  cdsTotaliza.fieldbyname('VALOR').AsCurrency          := Cds.FieldByName('VLRCRIRATORC').AsCurrency;

                  cdsTotaliza.fieldbyname('DESCRICAO').AsString        := FormatFloat('##00',cdsTotaliza.fieldbyname('PERIODOINICIO').AsFloat) + '/' +
                                                                          cdsTotaliza.fieldbyname('EXERCICIOINICIO').AsString                      +
                                                                          ' à '                                                                    +
                                                                          FormatFloat('##00',cdsTotaliza.fieldbyname('PERIODOFIM').AsFloat)    + '/' +
                                                                          cdsTotaliza.fieldbyname('EXERCICIOFIM').AsString;
                  cdsTotaliza.Post;
             end
             else
             begin
                  //Edita
                  cdsTotaliza.Edit;
                  cdsTotaliza.fieldbyname('VALOR').AsCurrency          := cdsTotaliza.fieldbyname('VALOR').AsCurrency +
                                                                          Cds.FieldByName('VLRCRIRATORC').AsCurrency;
                  cdsTotaliza.Post;
             end;
             
             Cds.Next;
        end;

     FINALLY
       Cds.Filtered := false;
       Cds.First;
       Cds.EnableControls;

       cdsTotaliza.Filtered        := false;
       cdsTotaliza.Filter          := '';
       cdsTotaliza.IndexFieldNames :=  'EXERCICIOINICIO;PERIODOINICIO;EXERCICIOFIM;PERIODOFIM;VALOR';
       cdsTotaliza.EnableControls;

       lblTotalizacao.Caption := 'Totalização (' +  IntToStr( cdsTotaliza.RecordCount) + ')';

       Application.ProcessMessages;
     END;
end;

procedure TfrmCadValCriterioRatMT.dbgTotalizacaoCalcCellColors(
  Sender: TObject; Field: TField; State: TGridDrawState;
  Highlight: Boolean; AFont: TFont; ABrush: TBrush);
begin
  inherited;
  // faz com que as linhas do grid tenham cores alternadas
  if State <> [gdSelected] then begin
     if not Highlight then
     begin
        // linhas ímpares = amarelo, linhas pares = branco
        if ((Sender as TwwDBGrid).CalcCellRow mod 2) = 0 then
        begin
           ABrush.Color := $00C0FFFF; // amarelo bebê
        end
        else
        begin
           ABrush.Color := clWhite;
        end;

        // Para as contas com dotação já efetuada, pintar a linha de vermelho
        if ((CdsAux.RecordCount <> 0) and
            (CdsAux.FieldByName('VALIDAR').AsString = 'N') ) then
           ABrush.Color := $00594DF9

     end;
  end
  else
  begin
     ABrush.Color := clHighLight;
     AFont.Color  := clHighLightText;
  end;
end;

procedure TfrmCadValCriterioRatMT.dbgTotalizacaoTitleButtonClick(
  Sender: TObject; AFieldName: String);
begin
  inherited;
  cdsTotaliza.IndexFieldNames := AFieldName;
end;

procedure TfrmCadValCriterioRatMT.CdsAfterPost(DataSet: TDataSet);
begin
  inherited;
  //Ricardo SOl 159240 Kintana 1337878
  Totaliza();
end;

procedure TfrmCadValCriterioRatMT.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  //Ricardo SOl 159240 Kintana 1337878
  pnlTotal.Visible := true;
  pnlTotalRateioCds.Visible   := true;
  Application.ProcessMessages;
end;

procedure TfrmCadValCriterioRatMT.btIncluiProgramaClick(Sender: TObject);
begin
  inherited;
  TRY

     Screen.Cursor := crHourGlass;
     if ((Trim(dblcPrograma.Text) = '' ) and (MsgDlg('Será incluído TODOS os Programas.' +CR_LF+
                                            'Confirma a Execução?', 'Confirmação',
                                            mtConfirmation, [mbYes,mbNo,mbHelp], 0) = mrYes)) or

     ((Trim(dblcPrograma.Text) <> '') and (MsgDlg('Será incluído o Programa ' + Trim(dblcPrograma.Text) + '.' +CR_LF+
                                            'Confirma a Execução?', 'Confirmação',
                                            mtConfirmation, [mbYes,mbNo,mbHelp], 0) = mrYes)) then
     begin
          CdsAux.Data := CtrlCadValCriterioRat.AdionaDadosListaX(CdsAux.Data, lxPrograma , dblcPrograma ,
                                                           StrToIntDef(dblcCriterio.LookupValue, 0),
                                                           StrToIntDef(dblcExercicio.LookupValue, 0),
                                                           StrToIntDef(dblcExercFim.LookupValue, 0),
                                                           StrToIntDef(dblcPeriodo.LookupValue, 0),
                                                           StrToIntDef(dblcPeriodoFim.LookupValue, 0));
          CdsAux.First;
     end;

     //Ricardo SOl 159240 Kintana 1337878
     pnlTotalRateioCds.Caption := 'Total de ' + IntToStr(Cds.RecordCount) + ' relacionamento(s)';
     pnlTotalRateioCdsAux.Caption := 'Total de ' + IntToStr(CdsAux.RecordCount) + ' relacionamento(s)';
     //Ricardo SOl 159240 Kintana 1337878 - fim

  FINALLY
     Screen.Cursor := crDefault;
  END;
end;

procedure TfrmCadValCriterioRatMT.btIncluiTipoDespesaClick(
  Sender: TObject);
begin
  inherited;
  TRY

     Screen.Cursor := crHourGlass;

     if ((Trim(dblcTipoDespesa.Text) = '' ) and (MsgDlg('Será incluído TODOS os Tipos de Depesas.' +CR_LF+
                                            'Confirma a Execução?', 'Confirmação',
                                            mtConfirmation, [mbYes,mbNo,mbHelp], 0) = mrYes)) or

        ((Trim(dblcTipoDespesa.Text) <> '') and (MsgDlg('Será incluído o Tipo de Despesa ' + Trim(dblcTipoDespesa.Text) + '.' +CR_LF+
                                            'Confirma a Execução?', 'Confirmação',
                                            mtConfirmation, [mbYes,mbNo,mbHelp], 0) = mrYes)) then
     begin
          CdsAux.Data := CtrlCadValCriterioRat.AdionaDadosListaX(CdsAux.Data, lxTipoDespesa , dblcTipoDespesa,
                                                           StrToIntDef(dblcCriterio.LookupValue, 0),
                                                           StrToIntDef(dblcExercicio.LookupValue, 0),
                                                           StrToIntDef(dblcExercFim.LookupValue, 0),
                                                           StrToIntDef(dblcPeriodo.LookupValue, 0),
                                                           StrToIntDef(dblcPeriodoFim.LookupValue, 0));
          CdsAux.First;
     end;

     //Ricardo SOl 159240 Kintana 1337878
     pnlTotalRateioCds.Caption := 'Total de ' + IntToStr(Cds.RecordCount) + ' relacionamento(s)';
     pnlTotalRateioCdsAux.Caption := 'Total de ' + IntToStr(CdsAux.RecordCount) + ' relacionamento(s)';
     //Ricardo SOl 159240 Kintana 1337878 - fim

  FINALLY
     Screen.Cursor := crDefault;
  END;
end;

procedure TfrmCadValCriterioRatMT.btIncluiAtividadeProjetoClick(
  Sender: TObject);
begin
  inherited;
  TRY

     Screen.Cursor := crHourGlass;
     if ((Trim(dblcAtividadeProjeto.Text) = '' ) and (MsgDlg('Será incluído TODOS as Atividades de Projeto.' +CR_LF+
                                            'Confirma a Execução?', 'Confirmação',
                                            mtConfirmation, [mbYes,mbNo,mbHelp], 0) = mrYes)) or

        ((Trim(dblcAtividadeProjeto.Text) <> '') and (MsgDlg('Será incluído a Atividade de Projeto ' + Trim(dblcAtividadeProjeto.Text) + '.' +CR_LF+
                                            'Confirma a Execução?', 'Confirmação',
                                            mtConfirmation, [mbYes,mbNo,mbHelp], 0) = mrYes)) then
     begin
        CdsAux.Data := CtrlCadValCriterioRat.AdionaDadosListaX(CdsAux.Data, lxAtividadeProjeto , dblcAtividadeProjeto,
                                                           StrToIntDef(dblcCriterio.LookupValue, 0),
                                                           StrToIntDef(dblcExercicio.LookupValue, 0),
                                                           StrToIntDef(dblcExercFim.LookupValue, 0),
                                                           StrToIntDef(dblcPeriodo.LookupValue, 0),
                                                           StrToIntDef(dblcPeriodoFim.LookupValue, 0));
        CdsAux.First;
     end;

     //Ricardo SOl 159240 Kintana 1337878
     pnlTotalRateioCds.Caption := 'Total de ' + IntToStr(Cds.RecordCount) + ' relacionamento(s)';
     pnlTotalRateioCdsAux.Caption := 'Total de ' + IntToStr(CdsAux.RecordCount) + ' relacionamento(s)';
     //Ricardo SOl 159240 Kintana 1337878 - fim

  FINALLY
     Screen.Cursor := crDefault;
  END;

end;

end.

