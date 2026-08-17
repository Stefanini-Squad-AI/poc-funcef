//******************************************************************************
// Rotina     : dbDtaOperacaoExit
// SOL        : 105491
// Kintana    : 471918
// Data       : 07/01/2009
// Responsável: Paulo Nobre
// Motivo     : Implementação para permitir fazer lançamentos de Transferência
//               entre Planos em Lote de Fundo de Investimentos Imobiliários
//               em dias não úteis.
//******************************************************************************
// Rotina     : bbtnConfirmarClick / GravaOperacaoFundo
// SOL        : 100716
// Kintana    : 447117
// Data       : 09/12/2008
// Responsável: Ricardo Cristiano
// Motivo     : Implementação para gravar a data de aplicação do certificado
//******************************************************************************
// Rotina     : redtPercentualExit
// SOL        : 100716
// Kintana    : 447117        
// Data       : 04/12/2008
// Responsável: Ricardo Cristiano
// Motivo     : Implementação para para excluir os registros da operação
//               de transferência entre planos(TRP).
//******************************************************************************
// Rotina     : sbtnFiltrarClick \ AbreSaldoTransf
// SOL        : 100340
// Kintana    : 443684 
// Data       : 05/11/2008  
// Responsável: Ricardo Cristiano
// Descrição  : Implementação de ajuste na busca do saldo para melhorar
//               a performance. Alterando SQL(QrySaldoTransf) da busca e criada
//               uma função para trata-la dinamicamente 
//******************************************************************************
// Data     : 09/01/2008
// Código   : AL_12
// Pendencia:
// SOL      :
// Motivo   : Não permitir transferências se houver qualquer operação de débito
//            posterior a transferência. Inclusive as transferências entre planos 
//******************************************************************************
// Data	     : 17/01/2008
// Codigo    : AL_11
// Pendência : 26744
// SOL       : 71043
// Desc      : Implementação do controle de processos para os fundos do tipo FMI
//******************************************************************************
// Data     : 22/08/2007
// Código   : AL_10
// Motivo   : Implementações na BuscaSaldoFundo( devido a criação de campo
//            saldobloqueado(Pendência 25706)
//******************************************************************************
// Data     : 28/05/2007
// Código   : AL_9
// Pendencia: 24176
// Motivo   : Implementações do testes de flag de integração contábil do módulo de
//            fundo. No momento de Filtrar.
//******************************************************************************
// Data     : 28/05/2007
// Código   : AL_8
// Motivo   : Implementação de otimização da query QrySaldoTransf para melhorar a performance.
//******************************************************************************
// Data     : 19/03/2007
// Código   : AL_7
// Pendencia: 24801
// SOL      : 55999
// Motivo   : Implementação para identificar a transferência de baixa do determinado
//            fundo e plano
//******************************************************************************
// Data     : 06/03/2007
// Código   : AL_6
// Motivo   : Implementações de ajuste na verificação das operações do dia para
//            transferência.
//******************************************************************************
// Data      : 01/02/2007
// Código    : AL_5
// Pendencia : 24349
// SOL       : 52712
// Desc      : Ajuste no tratamento de erro da rotina AlimentaFundo
//             Criado um parametro novo dom variável para retorno da
//               mensagem de erro
//******************************************************************************
// Data      : 11/12/2006
// Código    : AL_4
// Pendencia : 23954
// SOL       :
// Motivo    : Implementações para o Fundo de Participações
//******************************************************************************
// Data      : 08/12/2006
// Código    : AL_3
// Pendencia : 23954
// SOL       :
// Motivo    : Ajuste no teste para verificar saldo quando houver operação de transf.
//******************************************************************************
// Data     : 04/12/2006
// Código   : AL_2
// Pendencia: 22781/23782
// SOL      :
// Motivo   : Implementação para possibilitar a alteração e exclusão da transferência
//            antes do momento de confirmação da operação.
//******************************************************************************
// Data     : 03/11/2006
// Código   : AL_1
// Pendencia: 22781/23782
// SOL      :
// Motivo   : Implementação para transferência entre plano funcionar para "n" planos
//            Alteração na busca de saldo d+0, passa a buscar o saldo em d-1(QrySaldoTransf)
//            Implementação da gravação e consulta do percentual
//******************************************************************************

unit FCadTransfPlanoFdoLote;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroGridCS, StdCtrls, TREdit, wwdbdatetimepicker, CMDateTimePicker,
  wwdblook, ExtCtrls, fcLabel, Db, DBTables, Wwquery, CmEventosCadastro,
  ImgList, MontaSelect, Wwdatsrc, IvDictio, IvMulti, IvEMulti, MAHlpBtn,
  Buttons, TB97Tlbr, TB97Ctls, TB97, Grids, Wwdbigrd, Wwdbgrid, faMensagem,
  Menus, uCMMath;

type
  TfrmCadTransfPlanoFdoLote = class(TFrmCadastroGridCS)
    pnlTitulo: TPanel;
    lbNomItem: TfcLabel;
    Bevel2: TBevel;
    pnlSaldos: TPanel;
    dbgSaldos: TwwDBGrid;
    pnlAltSaldos: TPanel;
    QryPlanoPatroOrigem: TwwQuery;
    QryPlanoPatroDestino: TwwQuery;
    QrySaldoTransf: TwwQuery;
    DsSaldoTransf: TwwDataSource;
    fraMens: TfraMensagem;
    sbtnFiltrar: TBitBtn;
    ToolbarSep972: TToolbarSep97;
    pmnuFixaColunas: TPopupMenu;
    FixarColuna1: TMenuItem;
    LiberarColuna1: TMenuItem;
    N1: TMenuItem;
    LiberaTodasasColunas1: TMenuItem;
    lblPercentualTransf: TLabel;
    lblQtdTransf: TLabel;
    lblVlrTransf: TLabel;
    redtPercentualTransf: TDBRealEdit;
    redQtdTransf: TDBRealEdit;
    redVlrTransf: TDBRealEdit;
    ppmSaldos: TPopupMenu;
    FixarColuna2: TMenuItem;
    LiberarColuna2: TMenuItem;
    MenuItem3: TMenuItem;
    LiberaTodasasColunas2: TMenuItem;
    mnuAlterar: TMenuItem;
    mnuExcluir: TMenuItem;
    N2: TMenuItem;
    Dock974: TDock97;
    tb97Detalhe: TToolbar97;
    bbtnOkDet: TBitBtn;
    bbtnCancelarDet: TBitBtn;
    bbtnVoltarDet: TBitBtn;
    pnlDados: TPanel;
    lblDtOperacao: TLabel;
    lblPlanoPatroOrigem: TLabel;
    lblFundo: TLabel;
    lblPercentual: TLabel;
    lblClasse: TLabel;
    lblPlanoPatroDestino: TLabel;
    dbDtaOperacao: TCMDateTimePicker;
    dblkPlanPatroOrig: TwwDBLookupCombo;
    dblkFundoInvest: TwwDBLookupCombo;
    redtPercentual: TRealEdit;
    dblkTipoFundo: TwwDBLookupCombo;
    dblkPlanPatroDest: TwwDBLookupCombo;
    redIofTransf: TDBRealEdit;
    Label1: TLabel;
    Label2: TLabel;
    redVarTransf: TDBRealEdit;
    QryTipoFundo: TwwQuery;
    QryFundoInvest: TwwQuery;
    QrySaldoTransfDESCTIPOFUNDOINV: TStringField;
    QrySaldoTransfDESCFUNDOINVEST: TStringField;
    QrySaldoTransfPZOLIQRESG: TFloatField;
    QrySaldoTransfPZOLIQAPLIC: TFloatField;
    QrySaldoTransfDATACOTIZACAO: TDateTimeField;
    QrySaldoTransfQTDDECQTD: TFloatField;
    QrySaldoTransfQTDDECVALOR: TFloatField;
    QrySaldoTransfPZOCOTAPLIC: TFloatField;
    QrySaldoTransfPZOCOTRESG: TFloatField;
    QrySaldoTransfDATAAPLICACAO: TDateTimeField;
    QrySaldoTransfDATAMOVFUNDO: TDateTimeField;
    QrySaldoTransfVLRAPLICADO: TFloatField;
    QrySaldoTransfVLRIRPROV: TFloatField;
    QrySaldoTransfVLRIOFPROV: TFloatField;
    QrySaldoTransfVLRVARIACAO: TFloatField;
    QrySaldoTransfCOTASMOVFUNDO: TFloatField;
    QrySaldoTransfVLRMOVFUNDO: TFloatField;
    QrySaldoTransfSALDOQTDCOTAS: TFloatField;
    QrySaldoTransfSALDOQTDCOTASBLQ: TFloatField;
    QrySaldoTransfSALDOVLRFUNDO: TFloatField;
    QrySaldoTransfVLRCOTAAPLICACAO: TFloatField;
    //AL_4
    QrySaldoTransfSALDOQTDTRANSF: TFloatField;
    QrySaldoTransfSALDOVLRTRANSF: TFloatField;
    QrySaldoTransfVLRIOFTRANSF: TFloatField;
    QrySaldoTransfVLRVARTRANSF: TFloatField;
    QrySaldoTransfPERCENTUALTRANSF: TFloatField;
    UpdSaldoTransf: TUpdateSQL;
    qryIDLOTE: TStringField;
    qryPLANOPATROORIG: TStringField;
    qryPLANOPATRODEST: TStringField;
    qryDESCTIPOFUNDOINV: TStringField;
    qryDESCFUNDOINVEST: TStringField;
    qryDATAOPERACAO: TDateTimeField;
    qryDATALIQUIDACAO: TDateTimeField;
    qryQTDOPERACAO: TFloatField;
    qryVLROPERACAO: TFloatField;
    qryVLRIOF: TFloatField;
    qryVLRRENDIMENTO: TFloatField;
    qryIDPLANPREVCTBPATRO: TFloatField;
    qryIDPLANPREVCTBPATRD: TFloatField;
    qryIDTIPOFUNDOINVEST: TFloatField;
    qryIDFUNDOINVEST: TFloatField;
    QryTipoOper: TwwQuery;
    QrySaldoTransfIDOPERACAOFUNDO: TFloatField;
    QrySaldoTransfVLRAPLTRANSF: TFloatField;
    redAplTransf: TDBRealEdit;
    Label3: TLabel;
    QryTipoFundoMax: TwwQuery;
    QryTipoFundoInvest: TwwQuery;
    QryAux: TwwQuery;
    qryDTAINIPROC: TDateTimeField;
    dblkTipoCota: TwwDBLookupCombo;
    lblTipoCota: TLabel;
    QryTipoCota: TwwQuery;
    //AL_1
    QryAux1: TwwQuery;
    qryPERCENTUAL: TFloatField;
    procedure sbtnInserirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word;  Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure pmnuFixaColunasPopup(Sender: TObject);
    procedure FixarColuna1Click(Sender: TObject);
    procedure LiberarColuna1Click(Sender: TObject);
    procedure LiberaTodasasColunas1Click(Sender: TObject);
    procedure CmeCadastroFind(Sender: TObject);
    procedure CmeCadastroAtualizaBotoes(Sender: TObject);
    procedure PintaGridZebrado(Sender: TObject; Field: TField; State:
                               TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
    procedure GridRefresh(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure sbtnFiltrarClick(Sender: TObject);
    procedure DsSaldoTransfStateChange(Sender: TObject);
    procedure mnuAlterarClick(Sender: TObject);
    procedure mnuExcluirClick(Sender: TObject);
    procedure bbtnOkDetClick(Sender: TObject);
    procedure bbtnCancelarDetClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure redtPercentualTransfEnter(Sender: TObject);
    procedure redtPercentualTransfExit(Sender: TObject);
    procedure dblkTipoFundoExit(Sender: TObject);
    procedure dbDtaOperacaoExit(Sender: TObject);
    procedure dblkPlanPatroOrigExit(Sender: TObject);
    procedure sbtnApagarClick(Sender: TObject);
    //Ricardo Cristiano - 05/12/2008 - N. Sol 100716 -  N. Kintana 447117
    procedure redtPercentualExit(Sender: TObject);
  private
    { Private declarations }
    procedure SelLote(sLote : String = '');
    function  ValidaFiltros: Boolean;
    function  AlteraSaldo: Boolean;
    function  ExcluiSaldo: Boolean;
    //AL_1
    function  VerLoteExclusao(iFundo, iPlano : Integer;
                              dData   : TDateTime;
                              sLote   : String) : Boolean;

    //Ricardo Cristiano - 05/11/2008 - N. Sol 100340 -  N. Kintana 443684
    function  AbreSaldoTransf(dDataOper : TDateTime;
                              iTipoInvest, iPlano, iFundo, iTipoFundo, iTipoCota : Integer;
                              fPerc, fQtdDec : Double) : Boolean;
  public
    { Public declarations }
  end;

var
  frmCadTransfPlanoFdoLote: TfrmCadTransfPlanoFdoLote;
  iClasseAnt, iClasseAtu: Integer;
  fPercAnt: Double;
  //Paulo Nobre - 07/01/2009 - N. Sol 105491 -  N. Kintana 471918
  bDataOper : Boolean;

implementation

uses uMensErro, DBaseDados, UDataBase, UFundoComum, FPrincipal, UOperComum, uBibliotecaInvest, uCtrlInvContab,
     UDiasUteisInv,
     //AL_1
     UImpostos;

{$R *.DFM}

procedure TfrmCadTransfPlanoFdoLote.sbtnInserirClick(Sender: TObject);
begin
   pnlSaldos.BringToFront;
   pnlAltSaldos.SendToBack;
   pnlAltSaldos.Enabled := False;
   //AL_1
   redtPercentual.Value := 100;

   OperComum.LimpaParametros(QryTipoFundo);
   QryTipoFundo.ParamByName('IDTIPOINVEST').AsInteger := iTipoInvestUsu;
   QryTipoFundo.Open;

   dbDtaOperacao.Text := DateToStr(Date);
   OperComum.LimpaParametros(QryFundoInvest);
   QryFundoInvest.ParamByName('IDTIPOINVEST').AsInteger := iTipoInvestUsu;
   if QryTipoFundo.RecordCount = 1 Then
   begin
      dblkTipoFundo.LookupValue := QryTipoFundo.FieldByName('IDTIPOFUNDOINVEST').AsString;
      dblkTipoFundo.PerformSearch;

      dbDtaOperacao.Text := QryTipoFundo.FieldByName('DATAULTFECH').AsString;

      QryFundoInvest.ParamByName('DATAMOVFUNDO').AsString       :=
                     QryTipoFundo.FieldByName('DATAULTFECH').AsString;
      QryFundoInvest.ParamByName('IDTIPOFUNDOINVEST').AsInteger :=
                     QryTipoFundo.FieldByName('IDTIPOFUNDOINVEST').AsInteger;
   end
   else
      QryFundoInvest.ParamByName('DATAMOVFUNDO').AsString       := DateToStr(Date);
   QryFundoInvest.Open;

   OperComum.LimpaParametros(QryPlanoPatroOrigem);
   QryPlanoPatroOrigem.Open;

   dblkPlanPatroOrig.LookupValue := IntToStr(iPlanPrevCtbPatro);
   dblkPlanPatroOrig.PerformSearch;

   OperComum.LimpaParametros(QryPlanoPatroDestino);
   QryPlanoPatroDestino.ParamByName('IDPLANPREVCTBPATR').AsInteger := iPlanPrevCtbPatro;
   QryPlanoPatroDestino.Open;

   OperComum.LimpaParametros(QryTipoCota);
   QryTipoCota.Open;

   if iTipoInvestUsu in [9,10] then
   begin
      lblTipoCota.Visible  := True;
      dblkTipoCota.Visible := True;
   end;

//Ricardo Cristiano - 05/11/2008 - N. Sol 100340 -  N. Kintana 443684
{   OperComum.LimpaParametros(QrySaldoTransf);
   QrySaldoTransf.Open;}
   AbreSaldoTransf(0,0,0,0,0,0,0,0);

   DsSaldoTransfStateChange(Self);

   sbtnFiltrar.Visible   := True;
   sbtnAlterar.Enabled   := False;
   sbtnApagar.Enabled    := False;
   sbtnProcurar.Enabled  := False;
   bbtnConfirmar.Enabled := False;
   bbtnCancelar.Enabled  := True;

   dblkFundoInvest.Text  := '';
   dblkPlanPatroDest.Text:= '';

   if dblkTipoFundo.CanFocus then
      dblkTipoFundo.SetFocus;
end;

procedure TfrmCadTransfPlanoFdoLote.FormShow(Sender: TObject);
begin
  inherited;
  fraMens.Apaga;
  if UpperCase(Copy(TForm(Sender).Caption, 1, 3)) = 'FRM' then
     TForm(Sender).Caption := 'Operação';

  MontaSelect.Filtro.Add('OPERACAOFUNDO.IDTIPOINVEST = '+IntToStr(iTipoInvestUsu));

  QryTipoCota.Open;

  SelLote;
  //Paulo Nobre - 07/01/2009 - N. Sol 105491 -  N. Kintana 471918
  bDataOper := True;

end;

procedure TfrmCadTransfPlanoFdoLote.FormCreate(Sender: TObject);
begin
   // Maximiza a tela caso ela não caiba na área de trabalho do form principal
   if (TForm(Sender).Height > FrmPrincipal.ClientHeight - 50{Tamanho da barra de tarefas e barra de staus}) or
      (TForm(Sender).Width > FrmPrincipal.ClientWidth - 4 {Margem de segurança}) then
      WindowState := wsMaximized
   else
      WindowState := wsNormal;

   inherited;

end;

procedure TfrmCadTransfPlanoFdoLote.FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key = VK_Return then     //Enter - Troca de Campo
     SelectNext(ActiveControl,True,True)
end;

procedure TfrmCadTransfPlanoFdoLote.FormClose(Sender: TObject; var Action: TCloseAction);
var i: Word;
begin
   // Fecha todas as queries que ficarem abertas
   for i := 0 to TForm(Sender).ComponentCount -1 do
   begin
      if TForm(Sender).Components[i] is TwwQuery then
      begin
         if TwwQuery(TForm(Sender).Components[i]).State <> dsInactive then
            TwwQuery(TForm(Sender).Components[i]).Close;
      end;
      if TForm(Sender).Components[i] is TQuery then
      begin
         if TQuery(TForm(Sender).Components[i]).State <> dsInactive then
            TQuery(TForm(Sender).Components[i]).Close;
      end;
   end;
   inherited;
end;

procedure TfrmCadTransfPlanoFdoLote.pmnuFixaColunasPopup(Sender: TObject);
begin
  inherited;
  if TPopupMenu(Sender).PopupComponent.ClassNameIs('TwwDBGrid') then
  begin
     if TwwDBGrid(TPopupMenu(Sender).PopupComponent).DataSource.DataSet.Active then
     begin
        if TwwDBGrid(TPopupMenu(Sender).PopupComponent).FixedCols = 0 then
        begin
           if TwwDBGrid(TPopupMenu(Sender).PopupComponent).Name = 'dbgSaldos' then
           begin
              LiberarColuna2.Enabled := False;
              LiberaTodasasColunas2.Enabled := False;
           end
           else
           begin
              LiberarColuna1.Enabled := False;
              LiberaTodasasColunas1.Enabled := False;
           end
        end
        else
        begin
           if TwwDBGrid(TPopupMenu(Sender).PopupComponent).Name = 'dbgSaldos' then
           begin
              LiberarColuna2.Enabled := True;
              LiberaTodasasColunas2.Enabled := True;
           end
           else
           begin
              LiberarColuna1.Enabled := True;
              LiberaTodasasColunas1.Enabled := True;
           end
        end;

        if TwwDBGrid(TPopupMenu(Sender).PopupComponent).FixedCols = TwwDBGrid(TPopupMenu(Sender).PopupComponent).GetColCount then
        begin
           if TwwDBGrid(TPopupMenu(Sender).PopupComponent).Name = 'dbgSaldos' then
              FixarColuna2.Enabled := False
           else
              FixarColuna1.Enabled := False;
        end
        else
        begin
           if TwwDBGrid(TPopupMenu(Sender).PopupComponent).Name = 'dbgSaldos' then
              FixarColuna2.Enabled := True
           else
              FixarColuna1.Enabled := True;
        end;
     end
     else
     begin
        if TwwDBGrid(TPopupMenu(Sender).PopupComponent).Name = 'dbgSaldos' then
        begin
           LiberarColuna2.Enabled := False;
           LiberaTodasasColunas2.Enabled := False;
           FixarColuna2.Enabled := False
        end
        else
        begin
           LiberarColuna1.Enabled := False;
           LiberaTodasasColunas1.Enabled := False;
           FixarColuna1.Enabled := False
        end;
     end;
   end;
end;

procedure TfrmCadTransfPlanoFdoLote.FixarColuna1Click(Sender: TObject);
begin
  inherited;
   TwwDBGrid(TPopupMenu(TMenuItem(Sender).Parent.Owner).PopupComponent).FixedCols := TwwDBGrid(TPopupMenu(TMenuItem(Sender).Parent.Owner).PopupComponent).FixedCols + 1;
end;

procedure TfrmCadTransfPlanoFdoLote.LiberarColuna1Click(Sender: TObject);
begin
  inherited;
  TwwDBGrid(TPopupMenu(TMenuItem(Sender).Parent.Owner).PopupComponent).FixedCols := TwwDBGrid(TPopupMenu(TMenuItem(Sender).Parent.Owner).PopupComponent).FixedCols - 1;
end;

procedure TfrmCadTransfPlanoFdoLote.LiberaTodasasColunas1Click(Sender: TObject);
begin
  inherited;
  TwwDBGrid(TPopupMenu(TMenuItem(Sender).Parent.Owner).PopupComponent).FixedCols := 0;
end;

procedure TfrmCadTransfPlanoFdoLote.PintaGridZebrado(Sender: TObject; Field: TField; State:
                                                   TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
begin
  inherited;

  // faz com que as linhas do grid tenham cores alternadas, exceto a linha selecionada

  // Se a Celula atual pertence a linha selecionada
  if (Sender as TwwDBGrid).CalcCellRow = (Sender as TwwDBGrid).GetActiveRow then
  begin
     ABrush.Color := clHighLight;
     AFont.Color  := clHighLightText;
  end
  else
  begin
     // Se a celula atual não está selecionada nem fixada
     if (not (gdSelected in State)) and (not (gdFixed in State)) then
     begin
        if not Highlight then
        begin
           // linhas ímpares = amarelo, linhas pares = branco
           if ((Sender as TwwDBGrid).CalcCellRow mod 2) = 0 then
              ABrush.Color := $00C0FFFF // amarelo bebê
           else
              ABrush.Color := clWhite;
        end;
     end
     else
     // Se a celula atual é a selecionada
     if State = [gdSelected] then
     begin
        ABrush.Color := clHighLight;
        AFont.Color  := clHighLightText;
     end;
  end;
end;

procedure TfrmCadTransfPlanoFdoLote.GridRefresh(Sender: TObject);
begin
  inherited;
   // Acerta as cores quando muda a linha da grid
   (Sender as TwwDBGrid).Invalidate;
end;

procedure TfrmCadTransfPlanoFdoLote.SelLote(sLote : String = '');
begin
  OperComum.LimpaParametros(QryTipoFundoMax);
  QryTipoFundoMax.ParamByName('IDTIPOINVEST').AsInteger := iTipoInvestUsu;
  QryTipoFundoMax.Open;

   OperComum.LimpaParametros(qry);
   qry.ParamByName('IDTIPOINVEST').AsInteger := iTipoInvestUsu;
   qry.ParamByName('DATAMOVFUNDO').AsString  := QryTipoFundoMax.FieldByName('DATAULTFECH').AsString;
   if sLOTE <> '' then
      qry.ParamByName('IDLOTE').AsString     := sLote;
   qry.Open;

   OperComum.LimpaParametros(QryTipoFundoMax);

   pnlFundo.BringToFront;
   sbtnFiltrar.Visible := False;

   if not Qry.IsEmpty then
      sbtnApagar.Enabled := True;

end;

procedure TfrmCadTransfPlanoFdoLote.CmeCadastroFind(Sender: TObject);
begin
   inherited;

   if MontaSelect.RetornouValor then
      qry.Locate('IDLOTE', MontaSelect.ValoresChave[0], []);

end;

procedure TfrmCadTransfPlanoFdoLote.CmeCadastroAtualizaBotoes(Sender: TObject);
begin
  inherited;
  if sbtnInserir.Down then
  begin
     if qrySaldoTransf.RecordCount > 0 then
     begin
        sbtnAlterar.Enabled := True;
        sbtnApagar.Enabled := True;
        bbtnConfirmar.Enabled := True;
     end
     else
     begin
        sbtnAlterar.Enabled := False;
        sbtnApagar.Enabled := False;
        bbtnConfirmar.Enabled := False;
     end;
  end
  else
  begin
     sbtnInserir.Enabled := True;
     sbtnAlterar.Enabled := False;
     if qry.RecordCount > 0 then
        sbtnApagar.Enabled := True
     else
        sbtnApagar.Enabled := False;
  end;

end;

procedure TfrmCadTransfPlanoFdoLote.bbtnCancelarClick(Sender: TObject);
begin
   if sbtnInserir.Down then
   begin
      pnlSaldos.SendToBack;
      sbtnFiltrar.Visible := False;
      OperComum.LimpaParametros(qrySaldoTransf);

      CmeCadastro.AtualizaBotoes(Self);
   end
   else
     inherited;

   SelLote;

end;

function TfrmCadTransfPlanoFdoLote.ValidaFiltros: Boolean;
begin
   Result := False;
   if Trim(dblkTipoFundo.Text) = '' then
   begin
      MsgDlg('Informe o Tipo de Fundo.', 'Mensagem do Sistema', mtInformation, [mbOk], 0);
      Exit;
   end;
   if Trim(dblkFundoInvest.Text) = '' then
   begin
      MsgDlg('Informe o Fundo de Investimento.', 'Mensagem do Sistema', mtInformation, [mbOk], 0);
      Exit;
   end;
   if Trim(dblkPlanPatroOrig.Text) = '' then
   begin
      MsgDlg('Informe o Plano Origem.', 'Mensagem do Sistema', mtInformation, [mbOk], 0);
      Exit;
   end;
   if Trim(dblkPlanPatroDest.Text) = '' then
   begin
      MsgDlg('Informe o Plano Destino.', 'Mensagem do Sistema', mtInformation, [mbOk], 0);
      Exit;
   end;
   if Trim(dbDtaOperacao.Text) = '' then
   begin
      MsgDlg('Informe a Data da Transferência.', 'Mensagem do Sistema', mtInformation, [mbOk], 0);
      Exit;
   end;
   if redtPercentual.Value = 0 then
   begin
      MsgDlg('Informe o Percentual a Transferir.', 'Mensagem do Sistema', mtInformation, [mbOk], 0);
      Exit;
   end;
   if redtPercentual.Value > 100 then
   begin
      MsgDlg('O Percentual a Transferir é maior que 100%.', 'Mensagem do Sistema', mtInformation, [mbOk], 0);
      Exit;
   end;
   if ((dblkTipoCota.Visible) and (Trim(dblkTipoCota.Text) = '')) then
   begin
      MsgDlg('Informe o Tipo de Cota do Fundo.', 'Mensagem do Sistema', mtInformation, [mbOk], 0);
      Exit;
   end;

   Result := True;
end;

procedure TfrmCadTransfPlanoFdoLote.sbtnFiltrarClick(Sender: TObject);
var
   //AL_1
   DadosCota        : TDadosCota;
   fVlrIOF          : Currency;
   //AL_2
   Year, Month, Day : Word;
   dDtUltDiaMes     : TDateTime;
   //Ricardo Cristiano - 05/12/2008 - N. Sol 100716 -  N. Kintana 447117
   fVerificaPercent : Double;
begin
   if VerEmAbertura(QryFundoInvest.FieldByName('IDTIPOFUNDOINVEST').AsInteger) then
   begin
      CmeCadastro.AtualizaBotoes(Self);
      Exit;
   end;

   //Paulo Nobre - 07/01/2009 - N. Sol 105491 -  N. Kintana 471918
   if not bDataOper then
   begin
      MsgDlg('A data informada não é um dia útil.', 'Mensagem do Sistema', mtInformation, [mbOK], 0);
      if dbDtaOperacao.CanFocus then
         dbDtaOperacao.SetFocus;
      Exit;      
   end;

   if not CtrlInvContab.TestaPeriodo(dbDtaOperacao.Text, iTipoInvestUsu) then
   begin
      MsgDlg(CtrlInvContab.MessageInfo,'Mensagem do Sistema',mtInformation,[mbOK],0);
      Exit;
   end;

   //AL_11
   if Not ValidaFiltros then
      Exit;   

//Ricardo Cristiano - 05/12/2008 - N. Sol 100716 -  N. Kintana 447117
// Nilton 01/12/08 - Verifica se o percentual a transferir é maior que 100%
   fVerificaPercent := 0;
   QryAux.SQL.Text:= 'SELECT IDLOTE, PERCENTUAL FROM OPERACAOFUNDO O WHERE '+
                       ' (O.IDTIPOINVEST      = '+IntToStr(iTipoInvestUsu)+') AND '+
                       ' (O.IDPLANPREVCTBPATR = '+dblkPlanPatroOrig.LookupValue+') AND '+
                       ' (O.IDFUNDOINVEST     = '+QryFundoInvest.FieldByName('IDFUNDOINVEST').AsString+')  AND '+
                       ' (O.DATAOPERACAO      = TO_DATE('+QuotedStr(dbDtaOperacao.Text)+',''DD/MM/YYYY'')) AND '+
                       OperComum.IIF(((dblkTipoCota.Visible) And (Trim(dblkTipoCota.Text) <> '')),
                                      ' (O.IDTIPOCOTA = '+dblkTipoCota.LookupValue+')  AND ','')+
                       ' (O.IDTIPOOPERACAO = -107)' +
                       ' GROUP BY IDLOTE, PERCENTUAL';

   QryAux.Open;
   while not QryAux.Eof do
   begin
     fVerificaPercent := fVerificaPercent + (QryAux.FieldbyName('PERCENTUAL').AsFloat);
     QryAux.Next;
   end;
   QryAux.Close;
   fVerificaPercent := fVerificaPercent;

   if (fVerificaPercent+redtPercentual.Value) > 100 then
   begin
      MsgDlg('Já existe um percentual total transferido para esse plano de '+ FloatToStrF(fVerificaPercent, ffNumber, 10, 4)+'%, '+ #13 +
             'mais o percentual a transferir de '+FloatToStrF(redtPercentual.Value, ffNumber, 10, 4)+'%, a soma ultrapassa os 100,0000%.'+ #13 +
             'A operação não será executada.','Mensagem do Sistema', mtInformation, [mbOk], 0);
      Exit;
   end;
// Fim Nilton 01/12/08

   //AL_9
   //AL_2
   if CtrlInvContab.IntegraCtbFinModulo then
   begin
      DecodeDate(dbDtaOperacao.DateTime, Year, Month, Day);

      if Month > 1 then
         dDtUltDiaMes := DiasUteisInv.UltDiaUtilMes(Year,(Month-1),1,-1,'',True,False,False)
      else
         dDtUltDiaMes := DiasUteisInv.UltDiaUtilMes(Year-1,12,1,-1,'',True,False,False);

      if CtrlInvContab.TestaPeriodo(DateToStr(dDtUltDiaMes), iTipoInvestUsu) then
      begin
         If MsgDlg('A contabilidade para o mês anterior se encontra aberta para lançamentos!'+#13+
                   'Deseja prosseguir com a operação?','Mensagem do Sistema',mtInformation, [mbYes, mbNo],0) = mrNo Then
            Exit;
      end;
   end;

   inherited;

   //AL_11

   try
      fraMens.Mostra;
      fraMens.Mes := 'Buscando Aplicações ... ';

      redQtdTransf.DecDigits := QryFundoInvest.FieldByName('QTDDECQTD').AsInteger;

      QrySaldoTransfSALDOQTDCOTAS.DisplayFormat  := '###,#0.'+Replicate('0',QryFundoInvest.FieldByName('QTDDECQTD').AsInteger);
      QrySaldoTransfSALDOQTDTRANSF.DisplayFormat := '###,#0.'+Replicate('0',QryFundoInvest.FieldByName('QTDDECQTD').AsInteger);

//Ricardo Cristiano - 05/11/2008 - N. Sol 100340 -  N. Kintana 443684
      //AL_1
      QrySaldoTransf.DisableControls;      
{      OperComum.LimpaParametros(QrySaldoTransf);
      QrySaldoTransf.ParamByName('DATAMOVFUNDO').AsString        := dbDtaOperacao.Text;
      QrySaldoTransf.ParamByName('IDTIPOINVEST').AsInteger       := iTipoInvestUsu;
      QrySaldoTransf.ParamByName('IDPLANPREVCTBPATR').AsInteger  := QryPlanoPatroOrigem.FieldByName('IDPLANPREVCTBPATR').AsInteger;
      QrySaldoTransf.ParamByName('IDFUNDOINVEST').AsInteger      := QryFundoInvest.FieldByName('IDFUNDOINVEST').AsInteger;
      QrySaldoTransf.ParamByName('IDTIPOFUNDOINVEST').AsInteger  := QryFundoInvest.FieldByName('IDTIPOFUNDOINVEST').AsInteger;
      QrySaldoTransf.ParamByName('PERCENTUAL').AsFloat           := redtPercentual.Value;
      QrySaldoTransf.ParamByName('QTDDEC').AsFloat               := 12;
      if QryFundoInvest.FieldByName('QTDDECQTD').AsInteger > 0 then
         QrySaldoTransf.ParamByName('QTDDEC').AsFloat            := QryFundoInvest.FieldByName('QTDDECQTD').AsInteger;

      if ((dblkTipoCota.Visible) and (Trim(dblkTipoCota.Text) <> '')) then
         QrySaldoTransf.ParamByName('IDTIPOCOTA').AsInteger      := StrToInt(dblkTipoCota.LookupValue);
      QrySaldoTransf.Open; }
      
      AbreSaldoTransf(StrToDate(dbDtaOperacao.Text),
                      iTipoInvestUsu,
                      QryPlanoPatroOrigem.FieldByName('IDPLANPREVCTBPATR').AsInteger,
                      QryFundoInvest.FieldByName('IDFUNDOINVEST').AsInteger,
                      QryFundoInvest.FieldByName('IDTIPOFUNDOINVEST').AsInteger,
                      StrToInt(OperComum.iif(dblkTipoCota.LookupValue = '','0',dblkTipoCota.LookupValue)),
                      redtPercentual.Value,
                      QryFundoInvest.FieldByName('QTDDECQTD').AsInteger);

      //AL_1
      fraMens.Max := qrySaldoTransf.RecordCount;
      fraMens.Pos := 0;
      QrySaldoTransf.First;
      While Not QrySaldoTransf.Eof Do
      begin
         if QrySaldoTransf.FieldByName('VLRIOFPROV').AsFloat > 0 then
         begin
            // Busca dados da Cota
            DadosCota := UFundoComum.BuscaCotaFundo(QryAux,
                                                    StrToInt(dblkFundoInvest.LookupValue),
                                                    QrySaldoTransf.FieldByName('DATAAPLICACAO').AsDateTime);

            // Apura IOF
            fVlrIOF   := Impostos.CalculaIOF(1, QrySaldoTransf.FieldByName('DATAAPLICACAO').AsDateTime,
                                             dbDtaOperacao.Date,
                                             OperComum.Round(QrySaldoTransf.FieldByName('SALDOQTDCOTAS').AsFloat*
                                                             DadosCota.VlrCota,2),
                                             QrySaldoTransf.FieldByName('SALDOVLRFUNDO').AsFloat, 'S');
            QrySaldoTransf.Edit;
            QrySaldoTransf.FieldByName('VLRIOFPROV').AsFloat   := fVlrIOF;
            QrySaldoTransf.FieldByName('VLRIOFTRANSF').AsFloat := RoundCM(fVlrIOF*(redtPercentual.Value/100),2);
            QrySaldoTransf.Post;
         end;

         fraMens.Incrementa;
         QrySaldoTransf.Next;
      end;
      QrySaldoTransf.First;
      QrySaldoTransf.EnableControls;

      if QrySaldoTransf.RecordCount > 0 then
         bbtnConfirmar.Enabled := True
      else
         bbtnConfirmar.Enabled := False;

   finally
      fraMens.Apaga;
   end
end;

procedure TfrmCadTransfPlanoFdoLote.DsSaldoTransfStateChange(Sender: TObject);
begin
   inherited;
   if QrySaldoTransf.Active then
   begin
      if QrySaldoTransf.RecordCount > 0 then
      begin
         mnuAlterar.Enabled := True;
         mnuExcluir.Enabled := True;
      end
      else
      begin
         mnuAlterar.Enabled := False;
         mnuExcluir.Enabled := False;
      end;
   end
   else
   begin
      mnuAlterar.Enabled := False;
      mnuExcluir.Enabled := False;
   end;
end;

function TfrmCadTransfPlanoFdoLote.AlteraSaldo: Boolean;
begin
   try
      qrySaldoTransf.Edit;
      pnlAltSaldos.BringToFront;
      pnlAltSaldos.Enabled := True;
      bbtnConfirmar.Enabled := False;
      if redtPercentualTransf.CanFocus then
         redtPercentualTransf.SetFocus;
   except
      qrySaldoTransf.Cancel;
      pnlAltSaldos.SendToBack;
      pnlAltSaldos.Enabled := False;
      bbtnConfirmar.Enabled := True;
   end;
end;

function TfrmCadTransfPlanoFdoLote.ExcluiSaldo: Boolean;
begin
   if MsgDlg('Retira esta aplicação deste Lote de Transferência?', 'Mensagem do Sistema', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
      qrySaldoTransf.Delete;
end;

procedure TfrmCadTransfPlanoFdoLote.mnuAlterarClick(Sender: TObject);
begin
  inherited;
  AlteraSaldo;
end;

procedure TfrmCadTransfPlanoFdoLote.mnuExcluirClick(Sender: TObject);
begin
  inherited;
  ExcluiSaldo;
end;

procedure TfrmCadTransfPlanoFdoLote.bbtnOkDetClick(Sender: TObject);
begin
  if redAplTransf.Value <= 0 then
  begin
     if redAplTransf.CanFocus then
        redAplTransf.SetFocus;
     Exit;
  end;

  if redQtdTransf.Value <= 0 then
  begin
     if redQtdTransf.CanFocus then
        redQtdTransf.SetFocus;
     Exit;
  end;

  if redVlrTransf.Value <= 0 then
  begin
     if redVlrTransf.CanFocus then
        redVlrTransf.SetFocus;
     Exit;
  end;

  inherited;

  qrySaldoTransf.Post;
  pnlAltSaldos.SendToBack;
  pnlAltSaldos.Enabled := False;
  bbtnConfirmar.Enabled := True;
end;

procedure TfrmCadTransfPlanoFdoLote.bbtnCancelarDetClick(Sender: TObject);
begin
  inherited;
  qrySaldoTransf.Cancel;
  pnlAltSaldos.SendToBack;
  pnlAltSaldos.Enabled := False;
  bbtnConfirmar.Enabled := True;
end;

procedure TfrmCadTransfPlanoFdoLote.bbtnConfirmarClick(Sender: TObject);
var
   //AL_5
   //AL_1
   sDescFundo, sLote, sNaturezaS, sDescTipoOperS, sNaturezaE, sDescTipoOperE, sMens : String;
   fValorTransf, fValorIofTransf, fValorVarTransf : Currency;
   iPlano , iPlanilha , iDocumento, iIdForCli, iIdOperacaoFundoOrigem, iIdOperacaoFundoDestino,ipCota : Integer;
   DadosCotaA, DadosCotaH  : TDadosCota;
   //AL_1
   dDataAnt, dDataOper : TDateTime;
   fNull, fSaldoFundo : Double;
begin
   fValorTransf    := 0;
   fValorIofTransf := 0;
   fValorVarTransf := 0;

   If QrySaldoTransf.IsEmpty then
      Exit;

   //AL_1
   if not CtrlInvContab.TestaPeriodo(dbDtaOperacao.Text, iTipoInvestUsu) then
   begin
      MsgDlg(CtrlInvContab.MessageInfo,'Mensagem do Sistema',mtInformation,[mbOK],0);
      Exit;
   end;

   DadosCotaH  := BuscaCotaFundo(QryAux,
                                 StrToInt(dblkFundoInvest.LookupValue),
                                 dbDtaOperacao.Date,
                                 OperComum.IIF(((dblkTipoCota.Visible) And (Trim(dblkTipoCota.Text) <> '')),
                                           QryTipoCota.FieldByName('IDTIPOCOTA').AsInteger, -1));
   If DadosCotaH.VlrCota = 0 then
   begin
      MsgDlg('Não foi cadastrado a Cota para o dia '+dbDtaOperacao.Text+'. A operação não será executada.', 'Mensagem do Sistema', mtInformation, [mbOk], 0);
      QryAux.Close;
      Exit;
   end;

   dDataAnt   := dbDtaOperacao.Date - 1;
   While not DiasUteisInv.DiaUtil(dDataAnt, -1, 1,'',True,False,False) Do
      dDataAnt:= dDataAnt - 1;

   DadosCotaA  := BuscaCotaFundo(QryAux,
                                 StrToInt(dblkFundoInvest.LookupValue),
                                 dDataAnt,
                                 OperComum.IIF(((dblkTipoCota.Visible) And (Trim(dblkTipoCota.Text) <> '')),
                                           QryTipoCota.FieldByName('IDTIPOCOTA').AsInteger, -1));
   If DadosCotaA.VlrCota = 0 then
   begin
      MsgDlg('Não foi cadastrado a Cota para o dia '+DateToStr(dDataAnt)+'. A operação não será executada.', 'Mensagem do Sistema', mtInformation, [mbOk], 0);
      QryAux.Close;
      Exit;
   end;

   If DadosCotaA.VlrCota <> DadosCotaH.VlrCota then
   begin
      MsgDlg('A Cota do dia '+dbDtaOperacao.Text+' está diferente do dia '+DateToStr(dDataAnt)+'.'+#13+
             'Para executar essa funcionalidade, a cota do dia, deve ser igual a cota do dia anterior.', 'Mensagem do Sistema', mtInformation, [mbOk], 0);
      QryAux.Close;
      Exit;
   end;

   sLote := 'FI-' + Copy(dbDtaOperacao.Text,9,2) + '/' +
                         FormatFloat('0000', LeUltRegistro(Nil,'CONTDOCRENVAR' +
                                             Copy(dbDtaOperacao.Text,9,2)));
   //Transferência Saída
   If Not FazQuery(QryAux,'SELECT T.IDTIPOOPERACAO, T.DESCTIPOOPERACAO, T.NATUREZAOPERACAO, T.FLGTRATAIR, T.IDMERCADO '+
                          'FROM TIPOOPERACAO T WHERE T.IDTIPOINVEST = '+IntToStr(iTipoInvestUsu)+' AND '+
                          'T.IDTIPOOPERACAO = -107 ') Then
   begin
      MsgDlg('Não foi cadastrado o tipo de operação Transferência de Saida(-107), para o Tipo de Fundo.', 'Mensagem do Sistema', mtInformation, [mbOk], 0);
      QryAux.Close;
      Exit;
   end;

   sNaturezaS     := QryAux.FieldByName('NATUREZAOPERACAO').AsString;
   sDescTipoOperS := QryAux.FieldByName('DESCTIPOOPERACAO').AsString;

   //Transferência Entrada
   If Not FazQuery(QryAux,'SELECT T.IDTIPOOPERACAO, T.DESCTIPOOPERACAO, T.NATUREZAOPERACAO, T.FLGTRATAIR, T.IDMERCADO '+
                          'FROM TIPOOPERACAO T WHERE T.IDTIPOINVEST = '+IntToStr(iTipoInvestUsu)+' AND '+
                          'T.IDTIPOOPERACAO = -108 ') Then
   begin
      MsgDlg('Não foi cadastrado o tipo de operação Transferência de Entrada(-108), para o Tipo de Fundo.', 'Mensagem do Sistema', mtInformation, [mbOk], 0);
      QryAux.Close;
      Exit;
   end;

   sNaturezaE     := QryAux.FieldByName('NATUREZAOPERACAO').AsString;
   sDescTipoOperE := QryAux.FieldByName('DESCTIPOOPERACAO').AsString;

   //AL_6
   //AL_1
   //Verifica se exite outras operações para o dia da Transferência
   If FazQuery(QryAux,'SELECT O.IDOPERACAOFUNDO FROM OPERACAOFUNDO O, TIPOOPERACAO T WHERE '+
                      ' (O.IDTIPOINVEST      = '+IntToStr(iTipoInvestUsu)+') AND '+
                      ' (O.IDPLANPREVCTBPATR = '+dblkPlanPatroOrig.LookupValue+') AND '+
                      ' (O.IDFUNDOINVEST     = '+QryFundoInvest.FieldByName('IDFUNDOINVEST').AsString+')  AND '+
                      ' (O.DATAOPERACAO      = TO_DATE('+QuotedStr(dbDtaOperacao.Text)+',''DD/MM/YYYY'')) AND '+
                      OperComum.IIF(((dblkTipoCota.Visible) And (Trim(dblkTipoCota.Text) <> '')),
                                     ' (O.IDTIPOCOTA = '+dblkTipoCota.LookupValue+')  AND ','')+
                      '((O.IDTIPOOPERACAO <> -107) AND (O.IDTIPOOPERACAO <> -108))  AND '+
                      ' (T.IDTIPOINVEST      = O.IDTIPOINVEST)   AND '+
                      ' (T.IDTIPOOPERACAO    = O.IDTIPOOPERACAO) AND '+
                      ' (T.NATUREZAOPERACAO  = ''R'') ') Then
   begin
      MsgDlg('Existem operações no dia, no plano/patrocinadora de origem, '+#13+
             'que impossibilita executar a transferência.'+#13+
             'A operação não será executada!', 'Mensagem do Sistema', mtInformation, [mbOk], 0);
      QryAux.Close;
      Exit;
   end;
   //AL_12
   //AL_7
   //Verifica Transferência entre Planos
   {If FazQuery(QryAux,'SELECT IDOPERACAOFUNDO FROM OPERACAOFUNDO WHERE '+
                      ' IDTIPOINVEST    = '+IntToStr(iTipoInvestUsu)+' AND '+
                      ' IDPLANPREVCTBPATR = '+dblkPlanPatroOrig.LookupValue+' AND '+
                      ' IDFUNDOINVEST   = '+QryFundoInvest.FieldByName('IDFUNDOINVEST').AsString+'  AND '+
                      ' DATAOPERACAO    > TO_DATE('+QuotedStr(dbDtaOperacao.Text)+',''DD/MM/YYYY'') AND '+
                      OperComum.IIF(((dblkTipoCota.Visible) And (Trim(dblkTipoCota.Text) <> '')),
                                     ' IDTIPOCOTA = '+dblkTipoCota.LookupValue+'  AND ','')+
                      ' IDTIPOOPERACAO    = -107 ') Then
   begin
      MsgDlg('Já existe tranferência para esse Fundo com data superior a data de operação. '+#13+
             'A operação não será executada!', 'Mensagem do Sistema', mtInformation, [mbOk], 0);
      QryAux.Close;
      Exit;
   end;}
   // Verifica se existem Transferência entre planos posterior a data a ser transferida
   If ((dblkTipoCota.Visible) And (Trim(dblkTipoCota.Text) <> '')) then
       ipcota := strtoint(dblkTipoCota.LookupValue)
   else
       ipcota := -1;
   If ufundocomum.VerificaTranferenciaPlanos( iTipoInvestUsu,
                                              QryFundoInvest.FieldByName('IDFUNDOINVEST').AsInteger,
                                              strtoint(dblkPlanPatroOrig.LookupValue),
                                              dbDtaOperacao.Date,
                                              ipcota)  then
   Begin
      MsgDlg('Já há Lançamentos de Transferências entre planos para o Fundo com data superior a data de operação'+'.'#13+
             'A operação não será efetuada!','Mensagem do Sistema',mtWarning,[mbOk],0);
      QryAux.Close;             
      Exit;
   End; // Fim AL_12

   //Verifica se existem operações posteriores a data de transferência de natureza = D
   // Inclui as transferências entre fundos
   If FazQuery(QryAux,'SELECT O.IDOPERACAOFUNDO FROM OPERACAOFUNDO O, TIPOOPERACAO T WHERE '+
                      ' (O.IDTIPOINVEST      = '+IntToStr(iTipoInvestUsu)+') AND '+
                      ' (O.IDPLANPREVCTBPATR = '+dblkPlanPatroOrig.LookupValue+') AND '+
                      ' (O.IDFUNDOINVEST     = '+QryFundoInvest.FieldByName('IDFUNDOINVEST').AsString+')  AND '+
                      ' (O.DATAOPERACAO     >= TO_DATE('+QuotedStr(dbDtaOperacao.Text)+',''DD/MM/YYYY'')) AND '+
                      OperComum.IIF(((dblkTipoCota.Visible) And (Trim(dblkTipoCota.Text) <> '')),
                                     ' (O.IDTIPOCOTA = '+dblkTipoCota.LookupValue+')  AND ','')+
                      ' (O.IDTIPOOPERACAO   <>  -107)  AND '+
                      ' (T.IDTIPOINVEST      = O.IDTIPOINVEST)   AND '+
                      ' (T.IDTIPOOPERACAO    = O.IDTIPOOPERACAO) AND '+
                      ' (T.NATUREZAOPERACAO  = ''D'') ') Then
   begin
      MsgDlg('Já existem operações que afetam o saldo para esse Fundo com data superior a data de operação. '+#13+
             'A operação não será executada!', 'Mensagem do Sistema', mtInformation, [mbOk], 0);
      QryAux.Close;
      Exit;
   end; // Fim AL_11

   //AL_3
   //AL_1
   If Not FazQuery(QryAux,'SELECT SUM(O.VLROPERACAO) AS VLROPERACAO FROM OPERACAOFUNDO O WHERE '+
                          ' O.IDTIPOINVEST    = '+IntToStr(iTipoInvestUsu)+' AND '+
                          ' O.IDFUNDOINVEST   = '+QryFundoInvest.FieldByName('IDFUNDOINVEST').AsString+'  AND '+
                          ' O.DATAOPERACAO    = TO_DATE('+QuotedStr(dbDtaOperacao.Text)+',''DD/MM/YYYY'') AND '+
                          OperComum.IIF(((dblkTipoCota.Visible) And (Trim(dblkTipoCota.Text) <> '')),
                          ' O.IDTIPOCOTA = '+dblkTipoCota.LookupValue+'  AND ','')+
                          '(O.IDTIPOOPERACAO = -107) ') Then
   begin
      qrySaldoTransf.DisableControls;
      qrySaldoTransf.First;
      while not qrySaldoTransf.Eof do
      begin
         fValorTransf := fValorTransf + QrySaldoTransfSALDOVLRTRANSF.AsFloat;
         qrySaldoTransf.Next;
      end;
      qrySaldoTransf.First;
      qrySaldoTransf.EnableControls;

      //AL_10
      BuscaSaldoFundo(QryFundoInvest.FieldByName('IDFUNDOINVEST').AsInteger,
                      StrToInt(dblkPlanPatroOrig.LookupValue), 0, dbDtaOperacao.Date,
                      fNull, fNull, fNull, fNull, fNull, fNull, fNull, fSaldoFundo, fNull, fNull, sDescFundo);

      if (fSaldoFundo - (fValorTransf + QryAux.FieldByName('VLROPERACAO').AsFloat)) < 0 then
      begin
         MsgDlg('Existem operações de transferência. O saldo não é suficiente para executar outra tranferência. '+#13+
                'A operação não será executada!', 'Mensagem do Sistema', mtInformation, [mbOk], 0);
         QryAux.Close;
         Exit;
      end;
   end;
   QryAux.Close;

//  inherited;

   try
      //Prepara o ambiente para transferir
      fraMens.Mostra;
      fraMens.Max := qrySaldoTransf.RecordCount + 2;
      fraMens.Pos := 0;
      try
         if not dtmBaseDados.dbBaseDados.InTransaction then
            dtmBaseDados.dbBaseDados.StartTransaction;

         //Faz as transferências
         qrySaldoTransf.First;
         while not qrySaldoTransf.Eof do
         begin
            if QrySaldoTransfSALDOQTDTRANSF.AsFloat > 0 then
            begin
               fraMens.Mes := 'Efetuando transferências : ' + #13 +
                              'Aplicação ' + QrySaldoTransfDATAAPLICACAO.AsString;
               //Ricardo Cristiano - 09/12/2008 - N. Sol 100716 -  N. Kintana 447117
               //Transferência Saída
               if not GravaOperacaoFundo(QrySaldoTransf.FieldByName('IDOPERACAOFUNDO').AsInteger,
                                         iTipoInvestUsu,
                                         -1{iPedido}, -107,
                                         QryFundoInvest.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                         QryFundoInvest.FieldByName('IDFUNDOINVEST').AsInteger,
                                         -1{iComposicao},
                                         QryPlanoPatroOrigem.FieldByName('IDPLANPREVCTBPATR').AsInteger,
                                         dbDtaOperacao.DateTime{Cotizacao},
                                         dbDtaOperacao.DateTime{Liquidacao},
                                         dbDtaOperacao.DateTime{Operacao},
                                         QrySaldoTransfSALDOVLRTRANSF.AsFloat{Valor},
                                         0{Irrf},
                                         QrySaldoTransfVLRIOFTRANSF.AsFloat{Iof},
                                         QrySaldoTransfVLRVARTRANSF.AsFloat{Variacao},
                                         QrySaldoTransfSALDOQTDTRANSF.AsFloat{Quantidade},
                                         //AL_4
                                         DadosCotaH.VlrCota{Cota},
                                         iIdOperacaoFundoOrigem{iOperacao},
                                         OperComum.IIF(((dblkTipoCota.Visible) And (Trim(dblkTipoCota.Text) <> '')), QryTipoCota.FieldByName('IDTIPOCOTA').AsInteger, -1),
                                         sLote,
                                         QrySaldoTransfDATAAPLICACAO.AsDateTime) Then
                  Raise Exception.Create('Não foi Possível gravar a Operação de Origem.');

               //AL_5
               If Not AlimentaFundo(iTipoInvestUsu, -107,
                                    QryFundoInvest.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                    QryFundoInvest.FieldByName('IDFUNDOINVEST').AsInteger,
                                    QryPlanoPatroOrigem.FieldByName('IDPLANOPREV').AsInteger,
                                    QryPlanoPatroOrigem.FieldByName('IDPATRO').AsInteger,
                                    iIdOperacaoFundoOrigem,
                                    //AL_1
                                    -1{QrySaldoTransf.FieldByName('IDOPERACAOFUNDO').AsInteger},
                                    QryFundoInvest.FieldByName('QTDDECQTD').AsInteger,
                                    QryFundoInvest.FieldByName('IDTIPOFUNDOINVEST').AsInteger,
                                    -1{iForCli},
                                    QrySaldoTransfDATAAPLICACAO.AsDateTime{Aplicacao},
                                    dbDtaOperacao.DateTime{Operacao},
                                    dbDtaOperacao.DateTime{Liquidacao},
                                    QrySaldoTransfSALDOQTDTRANSF.AsFloat{Quantidade},
                                    QrySaldoTransfVLRCOTAAPLICACAO.AsFloat{CotaAplicacao},
                                    QrySaldoTransfSALDOVLRTRANSF.AsFloat{Valor},
                                    0{Irrf},
                                    QrySaldoTransfVLRIOFTRANSF.AsFloat{Iof},
                                    sNaturezaS,
                                    Trim(sDescTipoOperS)+' / '+QryFundoInvest.FieldByName('DESCFUNDOINVEST').AsString,
                                    'TRP', True,
                                    QryPlanoPatroOrigem.FieldByName('IDPLANPREVCTBPATR').AsInteger, -1, -1,
                                    QrySaldoTransfVLRVARTRANSF.AsFloat{Variacao}, sMens,
                                    OperComum.IIF(((dblkTipoCota.Visible) And (Trim(dblkTipoCota.Text) <> '')), QryTipoCota.FieldByName('IDTIPOCOTA').AsInteger, -1),
                                    QrySaldoTransfVLRAPLTRANSF.AsFloat{Aplicado},
                                    0,
                                   (QrySaldoTransfSALDOVLRFUNDO.AsFloat-QrySaldoTransfSALDOVLRTRANSF.AsFloat){Saldo}) Then
               begin
                  //AL_5
                  if sMens <> '' then
                     Raise Exception.Create('Não foi possível confirmar a operação Origem' + #13 +
                                            'Mensagem: ' + sMens)
                  else
                     Raise Exception.Create('Não foi possível confirmar a operação Origem' + #13 +
                                            'Ocorreu um problema durante o processo de gravação' + #13 +
                                            'Refaça a operação');
               end;

               //Ricardo Cristiano - 09/12/2008 - N. Sol 100716 -  N. Kintana 447117
               //Transferência Entrada
               if not GravaOperacaoFundo(QrySaldoTransf.FieldByName('IDOPERACAOFUNDO').AsInteger,
                                         iTipoInvestUsu,
                                         -1{iPedido}, -108,
                                         QryFundoInvest.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                         QryFundoInvest.FieldByName('IDFUNDOINVEST').AsInteger,
                                         -1{iComposicao},
                                         QryPlanoPatroDestino.FieldByName('IDPLANPREVCTBPATR').AsInteger,
                                         dbDtaOperacao.DateTime{Cotizacao},
                                         dbDtaOperacao.DateTime{Liquidacao},
                                         dbDtaOperacao.DateTime{Operacao},
                                         QrySaldoTransfSALDOVLRTRANSF.AsFloat{Valor},
                                         0{Irrf},
                                         QrySaldoTransfVLRIOFTRANSF.AsFloat{Iof},
                                         QrySaldoTransfVLRVARTRANSF.AsFloat{Variacao},
                                         QrySaldoTransfSALDOQTDTRANSF.AsFloat{Quantidade},
                                         //AL_4
                                         DadosCotaH.VlrCota{Cota},
                                         iIdOperacaoFundoDestino{iOperacao},
                                         OperComum.IIF(((dblkTipoCota.Visible) And (Trim(dblkTipoCota.Text) <> '')), QryTipoCota.FieldByName('IDTIPOCOTA').AsInteger, -1),
                                         sLote,
                                         QrySaldoTransfDATAAPLICACAO.AsDateTime) Then
                  Raise Exception.Create('Não foi Possível gravar a Operação de Destino.');

               //AL_5
               if not AlimentaFundo(iTipoInvestUsu, -108,
                                    QryFundoInvest.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                    QryFundoInvest.FieldByName('IDFUNDOINVEST').AsInteger,
                                    QryPlanoPatroDestino.FieldByName('IDPLANOPREV').AsInteger,
                                    QryPlanoPatroDestino.FieldByName('IDPATRO').AsInteger,
                                    iIdOperacaoFundoDestino,
                                    QrySaldoTransf.FieldByName('IDOPERACAOFUNDO').AsInteger,
                                    QryFundoInvest.FieldByName('QTDDECQTD').AsInteger,
                                    QryFundoInvest.FieldByName('IDTIPOFUNDOINVEST').AsInteger,
                                    -1{iForCli},
                                    QrySaldoTransfDATAAPLICACAO.AsDateTime{Aplicacao},
                                    dbDtaOperacao.DateTime{Operacao},
                                    dbDtaOperacao.DateTime{Liquidacao},
                                    QrySaldoTransfSALDOQTDTRANSF.AsFloat{Quantidade},
                                    QrySaldoTransfVLRCOTAAPLICACAO.AsFloat{CotaAplicacao},
                                    QrySaldoTransfSALDOVLRTRANSF.AsFloat{Valor},
                                    0{Irrf},
                                    QrySaldoTransfVLRIOFTRANSF.AsFloat{Iof},
                                    sNaturezaE,
                                    Trim(sDescTipoOperE)+' / '+QryFundoInvest.FieldByName('DESCFUNDOINVEST').AsString,
                                    'TRP', True,
                                    QryPlanoPatroDestino.FieldByName('IDPLANPREVCTBPATR').AsInteger, -1, -1,
                                    QrySaldoTransfVLRVARTRANSF.AsFloat{Variacao}, sMens,
                                    OperComum.IIF(((dblkTipoCota.Visible) And (Trim(dblkTipoCota.Text) <> '')), QryTipoCota.FieldByName('IDTIPOCOTA').AsInteger, -1),
                                    QrySaldoTransfVLRAPLTRANSF.AsFloat{Aplicado},
                                    0,
                                    QrySaldoTransfSALDOVLRTRANSF.AsFloat{Saldo}) Then
               begin
                  //AL_5
                  if sMens <> '' then
                     Raise Exception.Create('Não foi possível confirmar a operação Destino' + #13 +
                                            'Mensagem: ' + sMens)
                  else
                     Raise Exception.Create('Não foi possível confirmar a operação Destino' + #13 +
                                            'Ocorreu um problema durante o processo de gravação' + #13 +
                                            'Refaça a operação');
               end;

               fValorTransf    := fValorTransf    + QrySaldoTransfSALDOVLRTRANSF.AsFloat;
               fValorIofTransf := fValorIofTransf + QrySaldoTransfVLRIOFTRANSF.AsFloat;
               fValorVarTransf := fValorVarTransf + QrySaldoTransfVLRVARTRANSF.AsFloat;

            end;

            fraMens.Incrementa;

            qrySaldoTransf.Next;
         end;

         if (fValorTransf + fValorIofTransf + fValorVarTransf) > 0 then
         begin
            fraMens.Mes := 'Efetuando a Contabilização : '+ #13 +
                            FloatToStrF(fValorTransf, ffNumber, 16, 2);

            iIdForCli := OperComum.BuscaForCli(iTipoInvestUsu,
                                               QryFundoInvest.FieldByName('IDGESTORCARTEIRA').AsInteger,
                                               -107, pRPI.IDTIPOCLIENTEEMI);
            iPlano         := -1;
            iPlanilha      := -1;
            iDocumento     := -1;

            //Transferência Saída
            If Not ContabilizacaoFinanceiro(iPlano, iPlanilha, iDocumento,
                                            -107,
                                            iTipoInvestUsu,
                                            QryFundoInvest.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                            QryFundoInvest.FieldByName('IDTIPOFUNDOINVEST').AsInteger,
                                            iIdForCli,
                                            QryFundoInvest.FieldByName('IDFUNDOINVEST').AsInteger,
                                            StrToDate(dbDtaOperacao.Text),
                                            StrToDate(dbDtaOperacao.Text),
                                            'OPE',
                                            sNaturezaS,
                                            QryFundoInvest.FieldByName('DESCFUNDOINVEST').AsString+' / '+sPlanPrevCtbPatro,
                                            True,
                                            fValorTransf{Operação},
                                            0, 0, 0, 0, 0,
                                            fValorVarTransf{Variação},
                                            -1, 0, 0, 0, 0,
                                            QryPlanoPatroOrigem.FieldByName('IDPLANOPREV').AsInteger,
                                            QryPlanoPatroOrigem.FieldByName('IDPATRO').AsInteger,
                                            fValorIofTransf) Then
               Raise Exception.Create('Ocorreu um problema ao Contabilizar a Operação de Origem.');

            if ((iPlano > 0) or (iPlanilha > 0) or (iDocumento > 0)) then
            begin
               if not ExecutaQuery(QryAux, 'UPDATE OPERACAOFUNDO SET '+
                                    ' PLANO        = '+OperComum.IIF(iPlano > 0,IntToStr(iPlano),'NULL')+','+
                                    ' PLNCODIGO    = '+OperComum.IIF(iPlanilha > 0,IntToStr(iPlanilha),'NULL')+','+
                                    ' CODDOCUMENTO = '+OperComum.IIF(iDocumento > 0,IntToStr(iDocumento),'NULL')+
                                    ' WHERE IDTIPOINVEST      = '+IntToStr(iTipoInvestUsu)+' AND '+
                                    '       IDPLANPREVCTBPATR = '+QryPlanoPatroOrigem.FieldByName('IDPLANPREVCTBPATR').AsString+' AND '+
                                    '       IDFUNDOINVEST     = '+dblkFundoInvest.LookupValue+' AND '+
                                    '       IDTIPOOPERACAO    = -107 AND '+
                                    '       DATAOPERACAO      =  TO_DATE('+QuotedStr(dbDtaOperacao.Text)+',''DD/MM/YYYY'') AND '+
                                    OperComum.IIF(((dblkTipoCota.Visible) And (Trim(dblkTipoCota.Text) <> '')),
                                                   ' IDTIPOCOTA = '+dblkTipoCota.LookupValue+'  AND ','')+
                                    '       IDLOTE            = '+QuotedStr(sLote)) then
                  Raise Exception.Create('Ocorreu um problema ao carimbar o Lote de origem com as integralizações.');
            end;

            fraMens.Incrementa;

            iIdForCli := OperComum.BuscaForCli(iTipoInvestUsu,
                                               QryFundoInvest.FieldByName('IDGESTORCARTEIRA').AsInteger,
                                               -108, pRPI.IDTIPOCLIENTEEMI);
            iPlano         := -1;
            iPlanilha      := -1;
            iDocumento     := -1;

            //Transferência Entrada
            If Not ContabilizacaoFinanceiro(iPlano, iPlanilha, iDocumento,
                                            -108,
                                            iTipoInvestUsu,
                                            QryFundoInvest.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                            QryFundoInvest.FieldByName('IDTIPOFUNDOINVEST').AsInteger,
                                            iIdForCli,
                                            QryFundoInvest.FieldByName('IDFUNDOINVEST').AsInteger,
                                            StrToDate(dbDtaOperacao.Text),
                                            StrToDate(dbDtaOperacao.Text),
                                            'OPE',
                                            sNaturezaS,
                                            QryFundoInvest.FieldByName('DESCFUNDOINVEST').AsString+' / '+sPlanPrevCtbPatro,
                                            True,
                                            fValorTransf{Operação},
                                            0, 0, 0, 0, 0,
                                            fValorVarTransf{Variação},
                                            -1, 0, 0, 0, 0,
                                            QryPlanoPatroDestino.FieldByName('IDPLANOPREV').AsInteger,
                                            QryPlanoPatroDestino.FieldByName('IDPATRO').AsInteger,
                                            fValorIofTransf*-1) Then
               Raise Exception.Create('Ocorreu um problema ao Contabilizar a Operação de Destino.');

            if ((iPlano > 0) or (iPlanilha > 0) or (iDocumento > 0)) then
            begin
               if not ExecutaQuery(QryAux, 'UPDATE OPERACAOFUNDO SET '+
                                    ' PLANO        = '+OperComum.IIF(iPlano > 0,IntToStr(iPlano),'NULL')+','+
                                    ' PLNCODIGO    = '+OperComum.IIF(iPlanilha > 0,IntToStr(iPlanilha),'NULL')+','+
                                    ' CODDOCUMENTO = '+OperComum.IIF(iDocumento > 0,IntToStr(iDocumento),'NULL')+
                                    ' WHERE IDTIPOINVEST      = '+IntToStr(iTipoInvestUsu)+' AND '+
                                    '       IDPLANPREVCTBPATR = '+QryPlanoPatroDestino.FieldByName('IDPLANPREVCTBPATR').AsString+' AND '+
                                    '       IDFUNDOINVEST     = '+dblkFundoInvest.LookupValue+' AND '+
                                    '       IDTIPOOPERACAO    = -108 AND '+
                                    '       DATAOPERACAO      =  TO_DATE('+QuotedStr(dbDtaOperacao.Text)+',''DD/MM/YYYY'') AND '+
                                    OperComum.IIF(((dblkTipoCota.Visible) And (Trim(dblkTipoCota.Text) <> '')),
                                                   ' IDTIPOCOTA = '+dblkTipoCota.LookupValue+'  AND ','')+
                                    '       IDLOTE            = '+QuotedStr(sLote)) then
                  Raise Exception.Create('Ocorreu um problema ao carimbar o Lote de destino com as integralizações.');
            end;

            //AL_1
            if not ExecutaQuery(QryAux, 'UPDATE OPERACAOFUNDO SET PERCENTUAL = '+FloatToStrCM(redtPercentual.Value)+
                                        ' WHERE IDLOTE = '+QuotedStr(sLote)) then
               Raise Exception.Create('Ocorreu um problema ao carimbar o Lote com o percentual.');

         end;

         fraMens.Incrementa;

         dtmBaseDados.dbBaseDados.Commit;

         OperComum.LimpaParametros(QryTipoFundoInvest);
         QryTipoFundoInvest.ParamByName('IDTIPOFUNDOINVEST').AsInteger := QryFundoInvest.FieldByName('IDTIPOFUNDOINVEST').AsInteger;
         QryTipoFundoInvest.ParamByName('IDTIPOINVEST').AsInteger      := iTipoInvestUsu;
         QryTipoFundoInvest.Open;

         if dbDtaOperacao.Date < QryTipoFundoInvest.FieldByName('DATAULTFECH').AsDateTime Then
         begin
            if Not Reprocessamento(iTipoInvestUsu,
                                   QryTipoFundoInvest.FieldByName('IDTIPOFUNDOINVEST').AsInteger,
                                   QryFundoInvest.FieldByName('IDFUNDOINVEST').AsInteger,
                                   -1,
                                   dbDtaOperacao.Date,
                                   QryTipoFundoInvest.FieldByName('DATAULTFECH').AsDateTime,
                                   QryFundoInvest.FieldByName('DTAINIPROC').AsDateTime, True,
                                   OperComum.IIF(((dblkTipoCota.Visible) And (Trim(dblkTipoCota.Text) <> '')),
                                             QryTipoCota.FieldByName('IDTIPOCOTA').AsInteger, -1)) Then
               MsgDlg('Atenção : Não foi possível efetuar o Reprocessamento para esse Fundo!',
                      'Mensagem do Sistema', MtInformation,[MbOk],0)
            else
               MsgDlg('Operação Concluida com Sucesso.','Mensagem do Sistema', MtConfirmation,[MbOk],0);
         end
         else
            MsgDlg('Operação Concluida com Sucesso.','Mensagem do Sistema', MtConfirmation,[MbOk],0);

         QryTipoFundoInvest.Close;

      except
          On E:Exception Do Begin
             MsgDlg('Não foi possivel confirmar a Operação :'+#13+
                    E.Message,'Mensagem do Sistema',mtWarning,[mbOk],0);
             If dtmBaseDados.dbBaseDados.InTransaction then
                dtmBaseDados.dbBaseDados.Rollback;
          End;
      end;
   finally
      //Prepara o ambiente para consulta de transferências
      pnlSaldos.SendToBack;
      OperComum.LimpaParametros(qrySaldoTransf);
      dsSaldoTransfStateChange(Self);
      CmeCadastro.AtualizaBotoes(Self);
      SelLote;
      fraMens.Apaga;
      QryAux.Close;      
   end;
end;

procedure TfrmCadTransfPlanoFdoLote.redtPercentualTransfEnter(
  Sender: TObject);
begin
  inherited;
   fPercAnt := QrySaldoTransfPERCENTUALTRANSF.AsFloat;
end;

procedure TfrmCadTransfPlanoFdoLote.redtPercentualTransfExit(Sender: TObject);
begin
  inherited;
   if fPercAnt <> QrySaldoTransfPERCENTUALTRANSF.AsFloat then
   begin
      // Recalcula os valores
      QrySaldoTransfVLRAPLTRANSF.AsFloat   :=
         RoundCM(QrySaldoTransfVLRAPLTRANSF.AsFloat * (redtPercentualTransf.Value / 100), 2);

      if QryFundoInvest.FieldByName('QTDDECQTD').AsInteger > 0 then
         QrySaldoTransfSALDOQTDTRANSF.AsFloat :=
            RoundCM(QrySaldoTransfSALDOQTDCOTAS.AsFloat * (redtPercentualTransf.Value / 100), QryFundoInvest.FieldByName('QTDDECQTD').AsInteger)
      else
         QrySaldoTransfSALDOQTDTRANSF.AsFloat :=
            RoundCM(QrySaldoTransfSALDOQTDCOTAS.AsFloat * (redtPercentualTransf.Value / 100), 12);
      qrySaldoTransfSALDOVLRTRANSF.AsFloat :=
         RoundCM(QrySaldoTransfSALDOVLRFUNDO.AsFloat * (redtPercentualTransf.Value / 100), 2);
      QrySaldoTransfVLRIOFTRANSF.AsFloat   :=
         RoundCM(QrySaldoTransfVLRIOFPROV.AsFloat * (redtPercentualTransf.Value / 100), 2);
      QrySaldoTransfVLRVARTRANSF.AsFloat   :=
         RoundCM(QrySaldoTransfVLRVARIACAO.AsFloat * (redtPercentualTransf.Value / 100), 2);
   end;
end;

procedure TfrmCadTransfPlanoFdoLote.dblkTipoFundoExit(Sender: TObject);
begin
  inherited;
   if dblkTipoFundo.Text <> '' then
   begin
      dbDtaOperacao.Text := QryTipoFundo.FieldByName('DATAULTFECH').AsString;

      OperComum.LimpaParametros(QryFundoInvest);
      QryFundoInvest.ParamByName('IDTIPOINVEST').AsInteger := iTipoInvestUsu;
      QryFundoInvest.ParamByName('DATAMOVFUNDO').AsString       :=
                     QryTipoFundo.FieldByName('DATAULTFECH').AsString;
      QryFundoInvest.ParamByName('IDTIPOFUNDOINVEST').AsInteger :=
                     QryTipoFundo.FieldByName('IDTIPOFUNDOINVEST').AsInteger;
      QryFundoInvest.Open;
   end;
end;

Procedure TfrmCadTransfPlanoFdoLote.dbDtaOperacaoExit(Sender: TObject);
Begin
   Inherited;

   //Paulo Nobre - 07/01/2009 - N. Sol 105491 -  N. Kintana 471918
   bDataOper := True;
   If iTipoInvestUsu <> 7 Then // Se for diferente de Fundo Imobiliário
   begin
      If Not DiasUteisInv.DiaUtil(dbDtaOperacao.Date, -1, 1, '', True, True, True) Then
      begin
         MsgDlg('A data informada não é um dia útil.', 'Mensagem do Sistema', mtInformation, [mbOK], 0);
         bDataOper := False;
      end;
   end;

   If ((dbDtaOperacao.Text <> '') And (dblkTipoFundo.Text <> '')) Then
   Begin
      OperComum.LimpaParametros(QryFundoInvest);
      QryFundoInvest.ParamByName('IDTIPOINVEST').AsInteger := iTipoInvestUsu;
      QryFundoInvest.ParamByName('DATAMOVFUNDO').AsString  := dbDtaOperacao.Text;
      QryFundoInvest.ParamByName('IDTIPOFUNDOINVEST').AsInteger :=
                     QryTipoFundo.FieldByName('IDTIPOFUNDOINVEST').AsInteger;
      QryFundoInvest.Open;
   End;

End;


procedure TfrmCadTransfPlanoFdoLote.dblkPlanPatroOrigExit(Sender: TObject);
begin
  inherited;
   if dblkPlanPatroOrig.Text <> '' then
   begin
      OperComum.LimpaParametros(QryPlanoPatroDestino);
      QryPlanoPatroDestino.ParamByName('IDPLANPREVCTBPATR').AsInteger :=
                           QryPlanoPatroOrigem.FieldByName('IDPLANPREVCTBPATR').AsInteger;
      QryPlanoPatroDestino.Open;
   end;
end;

procedure TfrmCadTransfPlanoFdoLote.sbtnApagarClick(Sender: TObject);
var wStr : string;
    //AL_1
    //Essa variável controla a deleção de transf. antiga, onde o idoperacaofundo não era gravado no histório
    bDeleta : Boolean;
begin
//   inherited;
   //AL_1
   bDeleta := False;

   if not VerificaFechamentoOperacao(Qry.FieldByName('DATAOPERACAO').AsString) then
      Exit;

   if VerEmAbertura(Qry.FieldByName('IDTIPOFUNDOINVEST').AsInteger) then
      Exit;

   //AL_1
   //Essa rotina verifica se a Lote a excluir é a ultima lançada
   if VerLoteExclusao(Qry.FieldByName('IDFUNDOINVEST').AsInteger,
                      Qry.FieldByName('IDPLANPREVCTBPATRO').AsInteger,
                      Qry.FieldByName('DATAOPERACAO').AsDateTime,
                      Qry.FieldByName('IDLOTE').AsString) then
   begin
      MsgDlg('Não é possível excluir esse Lote. '+#13+
             'Iniciar a exclusão desse Fundo pela maior Lote do dia.',
             'Mensagem do Sistema',mtInformation,[mbOK],0);
      Exit;
   end;

   if not CtrlInvContab.TestaPeriodo(Qry.FieldByName('DATAOPERACAO').AsString, iTipoInvestUsu) then
   begin
      MsgDlg(CtrlInvContab.MessageInfo,'Mensagem do Sistema',mtInformation,[mbOK],0);
      Exit;
   end;

  //AL_1
  If MsgDlg('Confirma Exclusão ?','Mensagem ', mtInformation, [mbYes, mbNo],0) = mrNo Then
     Exit;

   Try
      if not dtmBaseDados.dbBaseDados.InTransaction then
         dtmBaseDados.dbBaseDados.StartTransaction;

      //AL_1
      //Exclui Contábil/Financeiro da operação do Fundo - Origem/Destino
      FazQuery(QryAux,'SELECT DISTINCT OPERACAOFUNDO.IDPLANPREVCTBPATR, OPERACAOFUNDO.PLANO, '+
                      'OPERACAOFUNDO.PLNCODIGO, OPERACAOFUNDO.CODDOCUMENTO, '+
                      'OPERACAOFUNDO.DATAOPERACAO FROM OPERACAOFUNDO WHERE '+
                      'OPERACAOFUNDO.IDLOTE = '+ QuotedStr(Qry.FieldByName('IDLOTE').AsString));

      fraMens.Mostra;
      fraMens.Max := QryAux.RecordCount + 1;
      fraMens.Pos := 0;

      fraMens.Mes := 'Excluindo Transferências '+ #13 +
                     'Lote : '+ Qry.FieldByName('IDLOTE').AsString;
      //AL_1
      QryAux.First;
      While Not QryAux.Eof do
      begin
         if not ProcExcluiFundo(QryAux.FieldByName('CODDOCUMENTO').AsInteger,
                                QryAux.FieldByName('PLNCODIGO').AsInteger,
                                QryAux.FieldByName('PLANO').AsInteger,
                                iTipoInvestUsu,
                                QryAux.FieldByName('DATAOPERACAO').AsDateTime, True, -1,
                                QryAux.FieldByName('IDPLANPREVCTBPATR').AsInteger) Then
            Raise Exception.Create('Ocorreu um problema ao excluir a integração Contábil e Financeira.');

         QryAux.Next;
         fraMens.Incrementa;
      end;

      //AL_1
      //Origem/Destino - HISTÓRICO
      FazQuery(QryAux,'SELECT OPERACAOFUNDO.IDOPERACAOFUNDO FROM OPERACAOFUNDO WHERE '+
                      'OPERACAOFUNDO.IDLOTE = '+ QuotedStr(Qry.FieldByName('IDLOTE').AsString)+' '+
                      'ORDER BY OPERACAOFUNDO.IDOPERACAOFUNDO');
      fraMens.Apaga;
      fraMens.Mostra;
      fraMens.Max := QryAux.RecordCount + 1;
      fraMens.Pos := 0;

      fraMens.Mes := 'Excluindo Transferências '+ #13 +
                     'Lote : '+ Qry.FieldByName('IDLOTE').AsString;
      QryAux.First;
      While Not QryAux.Eof do
      begin
         //Verifica se exite registros na histfundo
         if FazQuery(QryAux1,'SELECT HISTFUNDO.PLANO, HISTFUNDO.PLNCODIGO FROM HISTFUNDO WHERE '+
                             'HISTFUNDO.IDOPERACAOFUNDO = '+ QuotedStr(QryAux.FieldByName('IDOPERACAOFUNDO').AsString)+' '+
                             'ORDER BY HISTFUNDO.DATAMOVFUNDO, HISTFUNDO.IDHISTFUNDO') then
         begin
            QryAux1.First;
            While Not QryAux1.Eof do
            begin
              //Exclui a atualização contábil
               if (QryAux1.FieldByName('PLNCODIGO').AsInteger > 0) then
               begin
                  If Not ProcExcluiContabil(QryAux1.FieldByName('PLANO').AsInteger,
                                            QryAux1.FieldByName('PLNCODIGO').AsInteger) then
                     Raise Exception.Create('Não foi Possível efetuar a exclusão contábil da Operação.');
               end;
               QryAux1.Next;
            end;

            if not ExecutaQuery(QryAux1,'DELETE FROM HISTFUNDO WHERE HISTFUNDO.IDOPERACAOFUNDO = '+
                                         QuotedStr(QryAux.FieldByName('IDOPERACAOFUNDO').AsString)) then
               Raise Exception.Create('Ocorreu um problema ao excluir o histórico da operação.');
         end
         else
            bDeleta := True;
         QryAux.Next;

         fraMens.Incrementa;
      end;

      QryAux1.Close;

      //AL_1
      if bDeleta then
      begin
         if not ExecutaQuery(QryAux,'DELETE FROM HISTFUNDO WHERE (IDTIPOINVEST = '+IntToStr(iTipoInvestUsu)+')  AND '+
                                    '((IDPLANPREVCTBPATR = '+Qry.FieldByName('IDPLANPREVCTBPATRO').AsString+')  OR  '+
                                    ' (IDPLANPREVCTBPATR = '+Qry.FieldByName('IDPLANPREVCTBPATRD').AsString+')) AND '+
                                    ' (IDFUNDOINVEST     = '+Qry.FieldByName('IDFUNDOINVEST').AsString+')       AND '+
                                    ' (DATAAPLICACAO    <= TO_DATE('+QuotedStr(Qry.FieldByName('DATAOPERACAO').AsString)+',''DD/MM/YYYY'')'+') AND '+
                                    ' (DATAMOVFUNDO      = TO_DATE('+QuotedStr(Qry.FieldByName('DATAOPERACAO').AsString)+',''DD/MM/YYYY'')'+') AND '+
                                    ' (IDTIPOOPERACAO   IN (-107,-108)) ') then
            Raise Exception.Create('Ocorreu um problema ao excluir o histórico da operação.');
      end;

      //Origem/Destino - OPERAÇÃO
      if not ExecutaQuery(QryAux,'DELETE FROM OPERACAOFUNDO WHERE OPERACAOFUNDO.IDLOTE = '+
                                  QuotedStr(Qry.FieldByName('IDLOTE').AsString)) then
         Raise Exception.Create('Ocorreu um problema ao excluir o Lote da Operação.');

      fraMens.Incrementa;

      QryAux.Close;

      DtmBaseDados.dbBaseDados.Commit;

      OperComum.LimpaParametros(QryTipoFundoInvest);
      QryTipoFundoInvest.ParamByName('IDTIPOFUNDOINVEST').AsInteger := Qry.FieldByName('IDTIPOFUNDOINVEST').AsInteger;
      QryTipoFundoInvest.ParamByName('IDTIPOINVEST').AsInteger      := iTipoInvestUsu;
      QryTipoFundoInvest.Open;

      if Qry.FieldByName('DATAOPERACAO').AsDateTime <= QryTipoFundoInvest.FieldByName('DATAULTFECH').AsDateTime Then
      begin
         if Not Reprocessamento(iTipoInvestUsu,
                                QryTipoFundoInvest.FieldByName('IDTIPOFUNDOINVEST').AsInteger,
                                Qry.FieldByName('IDFUNDOINVEST').AsInteger,
                                -1,
                                Qry.FieldByName('DATAOPERACAO').AsDateTime,
                                QryTipoFundoInvest.FieldByName('DATAULTFECH').AsDateTime,
                                Qry.FieldByName('DTAINIPROC').AsDateTime, True,
                                OperComum.IIF(((dblkTipoCota.Visible) And (Trim(dblkTipoCota.Text) <> '')),
                                          QryTipoCota.FieldByName('IDTIPOCOTA').AsInteger, -1)) Then
            MsgDlg('Atenção : Não foi possível efetuar o Reprocessamento para esse Fundo!',
                   'Mensagem do Sistema', MtInformation,[MbOk],0)
         else
            MsgDlg('Operação Excluída com Sucesso.','Mensagem do Sistema', MtConfirmation,[MbOk],0);
      end
      else
         MsgDlg('Operação Excluída com Sucesso.','Mensagem do Sistema', MtConfirmation,[MbOk],0);

      QryTipoFundoInvest.Close;

   Except
      On E:Exception Do Begin
         MsgDlg('Não foi possível Excluir a Operação :'+#13+
                E.Message,'Mensagem do Sistema',mtWarning,[mbOk],0);
         //Cancela Transação
         If dtmBaseDados.dbBaseDados.InTransaction then
            dtmBaseDados.dbBaseDados.Rollback;
      End;
   end;
   QryAux1.Close;
   QryAux.Close;
   fraMens.Apaga;
   sbtnApagar.Enabled := False;
   bbtnCancelarClick(Sender);
end;

//AL_1
function TfrmCadTransfPlanoFdoLote.VerLoteExclusao(iFundo, iPlano : Integer;
                                                   dData   : TDateTime;
                                                   sLote   : String) : Boolean;
begin
   //Busca lotes com maior idlote{a order de exclusão e decrescente}
   if FazQuery(QryAux,'SELECT OPERACAOFUNDO.IDLOTE FROM OPERACAOFUNDO WHERE '+
                      '     OPERACAOFUNDO.IDTIPOINVEST      = '+IntToStr(iTipoInvestUsu)+
                      ' AND OPERACAOFUNDO.IDPLANPREVCTBPATR = '+IntToStr(iPlano)+
                      ' AND OPERACAOFUNDO.IDFUNDOINVEST     = '+IntToStr(iFundo)+
                      ' AND OPERACAOFUNDO.DATAOPERACAO      = TO_DATE('+QuotedStr(DateToStr(dData))+','+QuotedStr('DD/MM/YYYY')+')'+
                      ' AND OPERACAOFUNDO.IDTIPOOPERACAO    = -107'+
                      ' AND OPERACAOFUNDO.IDLOTE            > '+QuotedStr(sLote)) Then
      Result := True
   else
      Result := False;

   QryAux.Close;
end;

//Ricardo Cristiano - 05/11/2008 - N. Sol 100340 -  N. Kintana 443684
function TfrmCadTransfPlanoFdoLote.AbreSaldoTransf(dDataOper : TDateTime;
                                                   iTipoInvest, iPlano, iFundo, iTipoFundo, iTipoCota : Integer;
                                                   fPerc, fQtdDec : Double): Boolean;
begin
   if fQtdDec <= 0 then
      fQtdDec := 12;

   OperComum.LimpaParametros(QrySaldoTransf);
   QrySaldoTransf.SQL.Clear;
   QrySaldoTransf.SQL.Add('SELECT ');
   QrySaldoTransf.SQL.Add('   TF.DESCTIPOFUNDOINV, ');
   QrySaldoTransf.SQL.Add('   FI.DESCFUNDOINVEST   , FI.PZOLIQRESG        , FI.PZOLIQAPLIC   , FI.DATACOTIZACAO, ');
   QrySaldoTransf.SQL.Add('   FI.QTDDECQTD         , FI.QTDDECVALOR       , FI.PZOCOTAPLIC   , FI.PZOCOTRESG, ');
   QrySaldoTransf.SQL.Add('   H1.DATAAPLICACAO     , H1.DATAMOVFUNDO      , H1.VLRAPLICADO   , H1.IDOPERACAOFUNDO, ');
   QrySaldoTransf.SQL.Add('   NVL(H1.VLRIRPROV,0)  AS   VLRIRPROV         , ');
   QrySaldoTransf.SQL.Add('   NVL(H1.VLRIOFPROV,0) AS   VLRIOFPROV        , ');
   QrySaldoTransf.SQL.Add('   0 AS VLRVARIACAO     , H1.COTASMOVFUNDO     , H1.VLRMOVFUNDO   , ');
   QrySaldoTransf.SQL.Add('   H1.SALDOQTDCOTAS     , H1.SALDOQTDCOTASBLQ  , H1.SALDOVLRFUNDO , ');
   QrySaldoTransf.SQL.Add('   H1.COTAAPLICACAO       AS VLRCOTAAPLICACAO  , ');
   QrySaldoTransf.SQL.Add('   ROUND((H1.VLRAPLICADO  *('+FloatToStrCM(fPerc)+' / 100)),2) AS VLRAPLTRANSF, ');
   QrySaldoTransf.SQL.Add('   ROUND((H1.SALDOQTDCOTAS*('+FloatToStrCM(fPerc)+' / 100)),'+FloatToStrCM(fQtdDec)+') AS SALDOQTDTRANSF, ');
   QrySaldoTransf.SQL.Add('   ROUND((H1.SALDOVLRFUNDO*('+FloatToStrCM(fPerc)+' / 100)),2) AS SALDOVLRTRANSF, ');
   QrySaldoTransf.SQL.Add('   ROUND((H1.VLRIOFPROV   *('+FloatToStrCM(fPerc)+' / 100)),2) AS VLRIOFTRANSF, ');
   QrySaldoTransf.SQL.Add('   0 AS VLRVARTRANSF, ');
   QrySaldoTransf.SQL.Add('  (1 * NVL('+FloatToStrCM(fPerc)+',0)) AS PERCENTUALTRANSF ');
   QrySaldoTransf.SQL.Add('FROM HISTFUNDO H1, ');
   QrySaldoTransf.SQL.Add('    (SELECT ');
   QrySaldoTransf.SQL.Add('        HF1.IDFUNDOINVEST, HF1.IDTIPOFUNDOINVEST, HF1.DESCFUNDOINVEST, HF1.PZOLIQRESG, ');
   QrySaldoTransf.SQL.Add('        HF1.PZOLIQAPLIC, HF1.QTDDECQTD, HF1.QTDDECVALOR, HF1.PZOCOTAPLIC, ');
   QrySaldoTransf.SQL.Add('        HF1.PZOCOTRESG, HF1.DATACOTIZACAO ');
   QrySaldoTransf.SQL.Add('     FROM HISTFUNDOINVEST HF1 ');
   QrySaldoTransf.SQL.Add('     WHERE (HF1.IDFUNDOINVEST || TO_CHAR(HF1.DTAVIGENCIA,'+QuotedStr('DD/MM/YYYY, HH24:MI:SS')+') ');
   QrySaldoTransf.SQL.Add('            IN (SELECT HF.IDFUNDOINVEST || TO_CHAR(MAX(HF.DTAVIGENCIA),'+QuotedStr('DD/MM/YYYY, HH24:MI:SS')+') ');
   QrySaldoTransf.SQL.Add('                FROM HISTFUNDOINVEST HF ');
   QrySaldoTransf.SQL.Add('                WHERE ');

   if iFundo > 0 then
      QrySaldoTransf.SQL.Add('                     (HF.IDFUNDOINVEST     = '+IntToStr(iFundo)+') ')
   else
      QrySaldoTransf.SQL.Add('                     (HF.IDFUNDOINVEST > 0) ');

   QrySaldoTransf.SQL.Add('                AND  (HF.DTAVIGENCIA < TO_DATE('+QuotedStr(DateToStr(dDataOper))+','+QuotedStr('DD/MM/YYYY')+')+1) ');

   if iTipoFundo > 0 then
      QrySaldoTransf.SQL.Add('                AND  (HF.IDTIPOFUNDOINVEST = '+IntToStr(iTipoFundo)+') ')
   else
      QrySaldoTransf.SQL.Add('                AND  (HF.IDTIPOFUNDOINVEST > 0) ');

   QrySaldoTransf.SQL.Add('                GROUP BY HF.IDFUNDOINVEST)) ');

   if iTipoFundo > 0 then
      QrySaldoTransf.SQL.Add('     AND   (HF1.IDTIPOFUNDOINVEST = '+IntToStr(iTipoFundo)+') ')
   else
      QrySaldoTransf.SQL.Add('     AND   (HF1.IDTIPOFUNDOINVEST > 0) ');

   QrySaldoTransf.SQL.Add('           ) FI, ');

   QrySaldoTransf.SQL.Add('    TIPOFUNDOINVEST TF, ');
   QrySaldoTransf.SQL.Add('   (SELECT MAX(H2.IDHISTFUNDO) AS IDHISTFUNDO ');
   QrySaldoTransf.SQL.Add('    FROM   HISTFUNDO H2, ');
   QrySaldoTransf.SQL.Add('          (SELECT ');
   QrySaldoTransf.SQL.Add('               HI.IDTIPOINVEST, HI.IDPLANPREVCTBPATR, HI.IDFUNDOINVEST, ');
   QrySaldoTransf.SQL.Add('               HI.DATAAPLICACAO, MAX(HI.DATAMOVFUNDO) AS DATAMOVFUNDO, ');
   QrySaldoTransf.SQL.Add('               HI.IDTIPOCOTA ');
   QrySaldoTransf.SQL.Add('           FROM HISTFUNDO HI, TIPOOPERACAO TP ');
   QrySaldoTransf.SQL.Add('           WHERE ');
   QrySaldoTransf.SQL.Add('                 (HI.IDTIPOINVEST       = '+IntToStr(iTipoInvest)+') ');

   if iPlano > 0 then
      QrySaldoTransf.SQL.Add('           AND   (HI.IDPLANPREVCTBPATR  = '+IntToStr(iPlano)+') ')
   else
      QrySaldoTransf.SQL.Add('           AND   (HI.IDPLANPREVCTBPATR > 0) ');

   if iFundo > 0 then
      QrySaldoTransf.SQL.Add('           AND   (HI.IDFUNDOINVEST      = '+IntToStr(iFundo)+') ')
   else
      QrySaldoTransf.SQL.Add('           AND   (HI.IDFUNDOINVEST > 0) ');

   QrySaldoTransf.SQL.Add('           AND   (HI.DATAAPLICACAO     < TO_DATE('+QuotedStr(DateToStr(dDataOper))+','+QuotedStr('DD/MM/YYYY')+')) ');
   QrySaldoTransf.SQL.Add('           AND   (HI.DATAMOVFUNDO      < TO_DATE('+QuotedStr(DateToStr(dDataOper))+','+QuotedStr('DD/MM/YYYY')+')) ');

   if iTipoCota > 0 then
      QrySaldoTransf.SQL.Add('           AND   (HI.IDTIPOCOTA     = '+IntToStr(iTipoCota)+') ');

   QrySaldoTransf.SQL.Add('           AND (((HI.IDTIPOINVEST IN (9,10))     AND (HI.IDTIPOCOTA > 0)) OR  ');
   QrySaldoTransf.SQL.Add('                ((HI.IDTIPOINVEST NOT IN (9,10)) AND (HI.IDTIPOCOTA IS NULL))) ');
   QrySaldoTransf.SQL.Add('           AND   (HI.TIPMOVFUNDO       <> ''PIR'') ');
   QrySaldoTransf.SQL.Add('           AND   (TP.NATUREZAOPERACAO  <> ''R'') ');
   QrySaldoTransf.SQL.Add('           AND   (TP.IDTIPOINVEST       = HI.IDTIPOINVEST) ');
   QrySaldoTransf.SQL.Add('           AND   (TP.IDTIPOOPERACAO     = HI.IDTIPOOPERACAO) ');
   QrySaldoTransf.SQL.Add('           GROUP BY  HI.IDTIPOINVEST, HI.IDPLANPREVCTBPATR, HI.IDFUNDOINVEST, HI.DATAAPLICACAO, ');
   QrySaldoTransf.SQL.Add('                     HI.IDTIPOCOTA) H3 ');
   QrySaldoTransf.SQL.Add('    WHERE ');
   QrySaldoTransf.SQL.Add('         (H2.IDTIPOINVEST      = H3.IDTIPOINVEST) ');
   QrySaldoTransf.SQL.Add('    AND  (H2.IDPLANPREVCTBPATR = H3.IDPLANPREVCTBPATR) ');
   QrySaldoTransf.SQL.Add('    AND  (H2.IDFUNDOINVEST     = H3.IDFUNDOINVEST) ');
   QrySaldoTransf.SQL.Add('    AND  (H2.DATAAPLICACAO     = H3.DATAAPLICACAO) ');
   QrySaldoTransf.SQL.Add('    AND  (H2.DATAMOVFUNDO      = H3.DATAMOVFUNDO) ');

   if iTipoCota > 0 then
      QrySaldoTransf.SQL.Add('    AND  (H2.IDTIPOCOTA = H3.IDTIPOCOTA) ');

   QrySaldoTransf.SQL.Add('    GROUP BY H2.IDTIPOINVEST, H2.IDPLANPREVCTBPATR, H2.IDFUNDOINVEST, H2.DATAAPLICACAO, ');
   QrySaldoTransf.SQL.Add('             H2.DATAMOVFUNDO, H2.IDTIPOCOTA) HMAX ');
   QrySaldoTransf.SQL.Add('WHERE ');
   QrySaldoTransf.SQL.Add('      (H1.IDHISTFUNDO = HMAX.IDHISTFUNDO) ');
   QrySaldoTransf.SQL.Add('  AND (H1.SALDOQTDCOTAS > 0) ');
   QrySaldoTransf.SQL.Add('  AND (H1.IDCOMPOSICAOFUNDO IS NULL) ');
   QrySaldoTransf.SQL.Add('  AND (FI.IDFUNDOINVEST     = H1.IDFUNDOINVEST) ');
   QrySaldoTransf.SQL.Add('  AND (TF.IDTIPOINVEST      = H1.IDTIPOINVEST) ');
   QrySaldoTransf.SQL.Add('  AND (TF.IDTIPOFUNDOINVEST = FI.IDTIPOFUNDOINVEST) ');
   QrySaldoTransf.SQL.Add('ORDER BY DESCFUNDOINVEST, DATAAPLICACAO DESC ');
   QrySaldoTransf.Open;

   Result := True;

end;

//Ricardo Cristiano - 05/12/2008 - N. Sol 100716 -  N. Kintana 447117
procedure TfrmCadTransfPlanoFdoLote.redtPercentualExit(Sender: TObject);
begin
  inherited;
   AbreSaldoTransf(0,0,0,0,0,0,0,0);
end;

end.
