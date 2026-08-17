// Alterações:
{ --------------------------------------------------------------------------------------------------
Rotina......: ValidaDados, msGrupoOrigem, msGrupoDestino, LimpaControles
Nº SOL......: 190311
Nº KINTANA..: 1799290
Data........: 15/04/2013
Responsável.: Edilaine Ferraresi
Descrição...: permitir transferencia entre grupos diferentes
--------------------------------------------------------------------------------------------------
Data      : 28/03/2012
Autor     : Edilaine Ferraresi
Sol       : 172383-7762
Kintana   : 1556974
Rotina    : *.dfm (Label2, dblcPlanoOrc, Label3, edMascara  visible = false)
Descrição : retirada do parametro PLANO ORÇAMENTARIO e MÁSCARA da parametrização do módulo
{ --------------------------------------------------------------------------------------------------
Data         : 17/08/2011
Autor        : Ricardo de Freitas Araújo Silva
Sol\ Kintana : 159212 \ 1337867
Descrição    : Implementação de rotinas para a gravação de códigos para o códgigo das contas, por
               Programa e Tipo de Despesa
{ --------------------------------------------------------------------------------------------------
Data      : 28/08/2006
Autor     : Rodolpho da Silva
Pendencia : 22851
Descrição : Implementação de rotinas para a gravação de códigos para o códgigo das contas, por
            Atividade/Projeto
{ --------------------------------------------------------------------------------------------------
Rotina    : VerificaPreenchimento
Data      : 17/12/2003
Autor     : André Pontes
Pendencia : 16005 / 15699 / 15700
Descrição : Verificação do tamanho total dos códigos das contas
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : dblcPlanoOrcCloseUp e dblcPlanoOrcExit
Data      : 16/12/2003
Autor     : André Pontes
Pendencia : 15805
Descrição : Preenchimento do campo de máscara do grupo a partir do cadastrado no Plano Orçamentário
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : -
Data      : 26/11/2003
Autor     : André Pontes
Pendencia : 15699
Descrição : - Gravação dos novos campos nas tabelas PlanPrevContabil e Patro;
            - Gravação dos novos campos FLGTIPOCOD6 e TAMCOD6;
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : -
Data      :
Autor     : André Pontes
Pendencia : 16005
Descrição : - Parâmetros para composição dos códigos das contas orçamentárias;
            - Gravação dos campos necessários nas tabelas PlanPrevContabil e Patro;
---------------------------------------------------------------------------------------------------}

unit FParamOrcamenMT;

interface

uses
   {$IFNDEF VERSAO0505} uCMTypes, {$ENDIF}
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   FCadastroCS, MontaSelect, DBTables, Db, Wwdatsrc, Wwquery, TB97Ctls,
   MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls, wwdblook, ComCtrls,
   Mask, MskEdDlg, wwdbedit, IvDictio, IvMulti, IvEMulti, Wwdotdot, Wwdbcomb,
   DBCtrls, CmEventosCadastro, ImgList, uCmSqlParams, FCadastroMT, DBClient,
   uCMClientDataSet, TREdit, Wwdbspin, Grids, DBGrids, Wwdbigrd, Wwdbgrid,
   uCtrlParamOrcamento, uCtrlPlanPrevContabil, uCtrlPatro, uCtrlPadroes;

type
   TfrmParamOrcamenMT = class(TFrmCadastroMT)
      pgcParametros: TPageControl;
      tbsGeral: TTabSheet;
      dblcMoeda: TwwDBLookupCombo;
      Label1: TLabel;
      dblcPlanoOrc: TwwDBLookupCombo;
      Label2: TLabel;
      edMascara: TwwDBEdit;
      Label3: TLabel;
      dbcboSaldos: TwwDBComboBox;
      Label4: TLabel;
      dbchkPermite: TDBCheckBox;
      dbchkTransfGrupos: TDBCheckBox;
      Label5: TLabel;
      cdsMoeda: TCMClientDataSet;
      cdsPlanoOrc: TCMClientDataSet;
      tbsCodConta: TTabSheet;
      GroupBox1: TGroupBox;
      Label7: TLabel;
      Label8: TLabel;
      spnTam1: TwwDBSpinEdit;
      spnTam2: TwwDBSpinEdit;
      spnTam3: TwwDBSpinEdit;
      spnTam4: TwwDBSpinEdit;
      DBcboTipoCod1: TwwDBComboBox;
      DBcboTipoCod2: TwwDBComboBox;
      DBcboTipoCod3: TwwDBComboBox;
      DBcboTipoCod4: TwwDBComboBox;
      DBcboTipoCod5: TwwDBComboBox;
      spnTam5: TwwDBSpinEdit;
      Bevel1: TBevel;
      Bevel3: TBevel;
      Bevel4: TBevel;
      Bevel5: TBevel;
      Bevel6: TBevel;
      Bevel8: TBevel;
      tbsCodOrcamento: TTabSheet;
      Label9: TLabel;
      Label10: TLabel;
      btnAlteraPlano: TBitBtn;
      btnAlteraPatro: TBitBtn;
      sqlTeste: TCMSqlParams;
      cdsPlano: TCMClientDataSet;
      cdsPatro: TCMClientDataSet;
      btnConfirmaPatro: TBitBtn;
      btnConfirmaPlano: TBitBtn;
      btnCancelaPlano: TBitBtn;
      btnCancelaPatro: TBitBtn;
      dtsPlano: TwwDataSource;
      wwDBGrid1: TwwDBGrid;
      wwDBGrid2: TwwDBGrid;
      dtsPatro: TwwDataSource;
    sqlPAtro: TCMSqlParams;
    Bevel2: TBevel;
    spnTam6: TwwDBSpinEdit;
    DBcboTipoCod6: TwwDBComboBox;
    CdsAtivProj: TCMClientDataSet;
    GridAtivProj: TwwDBGrid;
    Label6: TLabel;
    dsAtivProj: TDataSource;
    Bevel7: TBevel;
    Bevel9: TBevel;
    spnTam8: TwwDBSpinEdit;
    DBcboTipoCod8: TwwDBComboBox;
    DBcboTipoCod7: TwwDBComboBox;
    spnTam7: TwwDBSpinEdit;
    Label11: TLabel;
    GridPrograma: TwwDBGrid;
    GridTipoDespesa: TwwDBGrid;
    Label12: TLabel;
    ds_Programa: TwwDataSource;
    ds_Tipo_Despesa: TwwDataSource;
    cdsPrograma: TClientDataSet;
    CdsTipoDespesa: TClientDataSet;

      procedure CmeCadastroAtualizaBotoes(Sender: TObject);
      procedure CmeCadastroEdit(Sender: TObject);
      procedure CmeCadastroFind(Sender: TObject);
      procedure FormCreate(Sender: TObject);
      procedure FormClose(Sender: TObject; var Action: TCloseAction);
      procedure CmeCadastroBeforeConfirma(sender: TObject; var Accept: Boolean);
      procedure btnAlteraPlanoClick(Sender: TObject);
      procedure btnAlteraPatroClick(Sender: TObject);
      procedure btnCancelaPlanoClick(Sender: TObject);
      procedure btnConfirmaPlanoClick(Sender: TObject);
      procedure btnCancelaPatroClick(Sender: TObject);
      procedure btnConfirmaPatroClick(Sender: TObject);
      procedure CmeCadastroCancel(Sender: TObject);
      procedure bbtnConfirmarClick(Sender: TObject);
      procedure bbtnCancelarClick(Sender: TObject);
    procedure dblcPlanoOrcCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure dblcPlanoOrcExit(Sender: TObject);
    procedure GridAtivProjCalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont;
      ABrush: TBrush);
    procedure GridAtivProjTopRowChanged(Sender: TObject);
    procedure CdsAtivProjAfterOpen(DataSet: TDataSet);
    procedure CdsAtivProjAfterScroll(DataSet: TDataSet);
    procedure CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
    procedure cdsPlanoAfterOpen(DataSet: TDataSet);
    procedure CdsAtivProjBeforePost(DataSet: TDataSet);
    procedure CdsAtivProjAfterPost(DataSet: TDataSet);
    procedure GridAtivProjExit(Sender: TObject);
    procedure GridProgramaExit(Sender: TObject);
    procedure GridTipoDespesaExit(Sender: TObject);
    procedure GridProgramaCalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont;
      ABrush: TBrush);
    procedure GridTipoDespesaCalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont;
      ABrush: TBrush);
    procedure GridProgramaTopRowChanged(Sender: TObject);
    procedure GridTipoDespesaTopRowChanged(Sender: TObject);


   private  // Private declarations

      CtrlParamOrcamento   : TCtrlParamOrcamento;
      CtrlPlanPrevContabil : TCtrlPlanPrevContabil;
      CtrlPatro            : TCtrlPatro;
      _Cds                 : TClientDataSet;

      function  VerificaPreenchimento: Boolean;

   procedure PreencheDefaults;


   public   // Public declarations

   end;



var
  frmParamOrcamenMT: TfrmParamOrcamenMT;



implementation
{$R *.DFM}
uses
   uMensErro, uDataBase, dBaseDados, uModulo, uSistema, uVerificaPreenchimento;



function TfrmParamOrcamenMT.VerificaPreenchimento: Boolean;
var
   sMsg     : String;
   iTamanho : Integer;
begin
	Result := False;

	try

      if dbcboSaldos.text = '' then
         raise EValidacao.CreateVal('É necessário indicar a forma de Tratamento do Saldo para Processos!', dbcboSaldos);

      if trim(dblcPlanoOrc.text) = '' then
         raise EValidacao.CreateVal('É necessário indicar o Plano Orçamentário ativo!', dblcPlanoOrc);


      iTamanho := (cds.FieldByname('TAMCOD1').AsInteger + cds.FieldByname('TAMCOD2').AsInteger +
                   cds.FieldByname('TAMCOD3').AsInteger + cds.FieldByname('TAMCOD4').AsInteger +
                   cds.FieldByname('TAMCOD5').AsInteger + cds.FieldByname('TAMCOD6').AsInteger);

      sMsg     := 'A Regra de formação do código das Contas Orçamentárias está definindo um tamanho ' +
                  'de código maior que o permitido!' + #13 + #13 +
                  'O código pode ter, no máximo, 30 posições.';

      if iTamanho > 30 then
         raise EValidacao.CreateVal(sMsg, spnTam1);

   except

      on ev : EValidacao do begin
		   if ev.Show then MsgDlg(ev.message, 'Orçamento', mtWarning, [mbOk], 0);
			Repaint;
         if ev.Control.CanFocus then ev.Control.SetFocus;
         Exit;
      end;

   end;

   Result := True;
end;



procedure TfrmParamOrcamenMT.PreencheDefaults;
begin

   if cds.FieldByName('TAMCOD1').IsNull      then cds.FieldByName('TAMCOD1').AsInteger       := 0;
   if cds.FieldByName('TAMCOD2').IsNull      then cds.FieldByName('TAMCOD2').AsInteger       := 0;
   if cds.FieldByName('TAMCOD3').IsNull      then cds.FieldByName('TAMCOD3').AsInteger       := 0;
   if cds.FieldByName('TAMCOD4').IsNull      then cds.FieldByName('TAMCOD4').AsInteger       := 0;
   if cds.FieldByName('TAMCOD5').IsNull      then cds.FieldByName('TAMCOD5').AsInteger       := 0;
   if cds.FieldByName('TAMCOD6').IsNull      then cds.FieldByName('TAMCOD6').AsInteger       := 0;

   if cds.FieldByName('FLGTIPOCOD1').IsNull  then cds.FieldByName('FLGTIPOCOD1').AsInteger   := 1;
   if cds.FieldByName('FLGTIPOCOD2').IsNull  then cds.FieldByName('FLGTIPOCOD2').AsInteger   := 2;
   if cds.FieldByName('FLGTIPOCOD3').IsNull  then cds.FieldByName('FLGTIPOCOD3').AsInteger   := 3;
   if cds.FieldByName('FLGTIPOCOD4').IsNull  then cds.FieldByName('FLGTIPOCOD4').AsInteger   := 4;
   if cds.FieldByName('FLGTIPOCOD5').IsNull  then cds.FieldByName('FLGTIPOCOD5').AsInteger   := 5;
   if cds.FieldByName('FLGTIPOCOD6').IsNull  then cds.FieldByName('FLGTIPOCOD6').AsInteger   := 6;
end;

procedure TfrmParamOrcamenMT.FormCreate(Sender: TObject);
begin
   inherited;

   CtrlParamOrcamento   := TCtrlParamOrcamento.Create;
   CtrlParamOrcamento.InitializeAs(Padroes);

   CtrlPlanPrevContabil := TCtrlPlanPrevContabil.Create;
   CtrlPlanPrevContabil.InitializeAs(Padroes);

   CtrlPatro            := TCtrlPatro.Create;
   CtrlPatro.InitializeAs(Padroes);

   // Atribui os ClientDataSets local a ser persistido pelo objeto de negócios
   CtrlParamOrcamento.cdsParamOrcamento   := Cds;

   CtrlParamOrcamento.CdsAtivProj := CdsAtivProj;
   _Cds                           := TClientDataSet.Create(nil);

   CtrlPlanPrevContabil.cds       := CdsPlano;
   CtrlPatro.cds                  := CdsPatro;

   Cds.Data          := CtrlParamOrcamento.ListaParamOrcamento(Sistema.IDEmpresa);
   CdsMoeda.Data     := CtrlParamOrcamento.ListaMoeda;
   CdsPlanoOrc.Data  := CtrlParamOrcamento.ListaPlanoOrc;

   CdsAtivProj.Data  := CtrlParamOrcamento.ListaAtivProj(Sistema.IdEmpresa);
   _Cds.Data         := CdsAtivProj.Data;

   cdsPlano.Data     := CtrlPlanPrevContabil.ListaPlanPrevContabil;
   cdsPatro.Data     := CtrlPatro.ListaPatroParaOrcamento;

   //Ricardo de Freitas SOL: 159212 - Kintana 1337867
   cdsPrograma.Data     := CtrlParamOrcamento.ListaProgramaOrcamentario();
   cdsTipoDespesa.Data := CtrlParamOrcamento.ListaTipoDespesaOrcamentario();
   //Ricardo de Freitas SOL: 159212 - Kintana 1337867 - fim

   pgcParametros.ActivePage := tbsGeral;
   CmeCadastro.Operacao := opIdle;
   CmeCadastro.AtualizaBotoes(self);
end;




procedure TfrmParamOrcamenMT.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   try
      CtrlParamOrcamento.Free;
      CtrlPlanPrevContabil.Free;
      CtrlPatro.Free;
      FreeAndNil(_Cds);
   finally
      inherited;
   end;
end;



procedure TfrmParamOrcamenMT.CmeCadastroAtualizaBotoes(Sender: TObject);
begin
	inherited;

   // habilita o painel de fundo (que contém o PageControl - orelhas)
   pnlFundo.Enabled           := True;
   pgcParametros.Enabled      := True;

   tbsGeral.Enabled           := False;
   tbsCodConta.Enabled        := False;
   tbsCodOrcamento.Enabled    := False;

   if CmeCadastro.Operacao in [opInserir, opAlterar] then
   begin
      tbsGeral.Enabled        := True;
      tbsCodConta.Enabled     := True;
      tbsCodOrcamento.Enabled := True;
   end;
end;




procedure TfrmParamOrcamenMT.CmeCadastroEdit(Sender: TObject);
begin
   tbsGeral.Enabled:= True;

   if cds.IsEmpty then
   begin
      ds.DataSet.Insert;
      cds.FieldByName('IDPESSOA').AsInteger:= Sistema.IdEmpresa;
   end;

   inherited;

   if cds.State in dsEditModes then PreencheDefaults;

   pgcParametros.ActivePage := tbsGeral;
   dblcMoeda.SetFocus;
end;




procedure TfrmParamOrcamenMT.CmeCadastroFind(Sender: TObject);
begin
   inherited;

   if MontaSelect.RetornouValor then
   begin
      cds.Data := CtrlParamOrcamento.Procurar( StrtoFloat(MontaSelect.ValoresChave[0]) );
   end;
end;



procedure TfrmParamOrcamenMT.CmeCadastroBeforeConfirma(sender: TObject; var Accept: Boolean);
begin
   Modulo.iPlanoOrc := StrToInt(dblcPlanoOrc.LookupValue);

   Accept := VerificaPreenchimento;
   inherited;
end;



procedure TfrmParamOrcamenMT.btnAlteraPlanoClick(Sender: TObject);
begin
   inherited;
   //
end;



procedure TfrmParamOrcamenMT.btnAlteraPatroClick(Sender: TObject);
begin
   inherited;
   //
end;



procedure TfrmParamOrcamenMT.btnCancelaPlanoClick(Sender: TObject);
begin
   inherited;

   cdsPlano.Close;
   cdsPlano.Data := CtrlPlanPrevContabil.ListaPlanPrevContabil;
end;



procedure TfrmParamOrcamenMT.btnConfirmaPlanoClick(Sender: TObject);
begin
   inherited;
   CtrlPlanPrevContabil.Gravar;
end;



procedure TfrmParamOrcamenMT.btnCancelaPatroClick(Sender: TObject);
begin
   inherited;
   cdsPatro.Close;
   cdsPatro.Data := CtrlPatro.ListaPatroParaOrcamento;
end;



procedure TfrmParamOrcamenMT.btnConfirmaPatroClick(Sender: TObject);
begin
   inherited;
   CtrlPatro.Gravar;
end;



procedure TfrmParamOrcamenMT.CmeCadastroCancel(Sender: TObject);
begin
   cdsPlano.Close;
   cdsPlano.Data := CtrlPlanPrevContabil.ListaPlanPrevContabil;

   cdsPatro.Close;
   cdsPatro.Data := CtrlPatro.ListaPatroParaOrcamento;

   CdsAtivProj.Data := CtrlParamOrcamento.ListaAtivProj(Sistema.IdEmpresa);

   inherited;
end;



procedure TfrmParamOrcamenMT.bbtnConfirmarClick(Sender: TObject);
begin
   inherited;
   pgcParametros.ActivePage := tbsGeral;
end;



procedure TfrmParamOrcamenMT.bbtnCancelarClick(Sender: TObject);
begin
   inherited;
   pgcParametros.ActivePage := tbsGeral;
end;



procedure TfrmParamOrcamenMT.dblcPlanoOrcCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
begin
   inherited;
   if cds.State in [dsInsert, dsEdit] then
      cds.FieldByName('MASCGRUPOORC').AsString := cdsPlanoOrc.FieldByName('MASCARAGRUPO').AsString;
end;



procedure TfrmParamOrcamenMT.dblcPlanoOrcExit(Sender: TObject);
begin
   inherited;

   if cds.State in [dsInsert, dsEdit] then
   begin
      cds.FieldByName('MASCGRUPOORC').AsString := cdsPlanoOrc.FieldByName('MASCARAGRUPO').AsString;
   end;
end;



procedure TfrmParamOrcamenMT.GridAtivProjCalcCellColors(Sender: TObject;
  Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont;
  ABrush: TBrush);
begin
  inherited;
  // faz com que as linhas do grid tenham cores alternadas
  if State <> [gdSelected] then begin
     if not Highlight then begin
        // linhas ímpares = amarelo, linhas pares = branco
        if ((Sender as TwwDBGrid).CalcCellRow mod 2) = 0 then begin
           ABrush.Color := $00C0FFFF; // amarelo bebê
        end else begin
           ABrush.Color := clWhite;
        end;
     end;
  end else begin
     ABrush.Color := clHighLight;
     AFont.Color  := clHighLightText;
  end;
end;




procedure TfrmParamOrcamenMT.GridAtivProjTopRowChanged(Sender: TObject);
begin
  inherited;
  (sender as TwwDBGrid).Invalidate;
end;




procedure TfrmParamOrcamenMT.CdsAtivProjAfterOpen(DataSet: TDataSet);
begin
  inherited;
  TStringField(DataSet.FieldByName('NOME')).ReadOnly := True;
  TStringField(DataSet.FieldByName('TIPO')).ReadOnly := True;
end;



procedure TfrmParamOrcamenMT.CdsAtivProjAfterScroll(DataSet: TDataSet);
begin
  inherited;
  TIntegerField(DataSet.FieldByName('CODORCAMEN')).ReadOnly := (DataSet.FieldByName('VALIDAR').AsString <> 'S');
end;



procedure TfrmParamOrcamenMT.CmeCadastroApplyEdit(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
   Accept := CtrlParamOrcamento.AplicaOperacaoParamOrcamento;
   if not Accept then
   begin
      MsgDlg('Houve um erro ao alterar os dados. ' + #13 + 'Mensagem: ' + CtrlParamOrcamento.MessageInfo, 'Orçamento', mtError, [mbOk], 0);
      Exit;
   end;

   Accept := CtrlPlanPrevContabil.Gravar;
   if not Accept then
   begin
      MsgDlg('Houve um erro ao alterar os dados. ' + #13 + 'Mensagem: ' + CtrlPlanPrevContabil.MessageInfo, 'Orçamento', mtError, [mbOk], 0);
      Exit;
   end;

   Accept := CtrlPatro.Gravar;
   if not Accept then
   begin
      MsgDlg('Houve um erro ao alterar os dados. ' + #13 + 'Mensagem: ' + CtrlPatro.MessageInfo, 'Orçamento', mtError, [mbOk], 0);
      Exit;
   end;

   Cds.Data := CtrlParamOrcamento.ListaParamOrcamento(Sistema.IDEmpresa);

   // ATUALIZA PARAMETROS DO MODULO
   // Edilaine - SOL 190311 / KTN 1799290
   Modulo.sTipoSaldo       := cds.FieldByName('FLGTIPOSALDO').AsString;
   Modulo.sPermiteSaldoNeg := cds.FieldByName('FLGVERIFICASALDO').AsString;

   if cds.FieldByName('FLGPERMITETRANSF').isNull then
      Modulo.sPermiteTransf := 'N'
   else
      Modulo.sPermiteTransf := cds.FieldByName('FLGPERMITETRANSF').AsString;
   // Edilaine - SOL 190311 / KTN 1799290 - fim

end;




procedure TfrmParamOrcamenMT.cdsPlanoAfterOpen(DataSet: TDataSet);
begin
  inherited;
  TStringField(DataSet.FieldByName('NOME')).ReadOnly           := True;
  TStringField(DataSet.FieldByName('SIGLAORCAMENTO')).ReadOnly := True;
  TStringField(DataSet.FieldByName('CODSPC')).ReadOnly         := True;
end;




procedure TfrmParamOrcamenMT.CdsAtivProjBeforePost(DataSet: TDataSet);
begin
  inherited;
  if not DataSet.FieldByName('CODORCAMEN').IsNull then
  begin
     try
       _Cds.Filter   := 'CODORCAMEN = ' +  DataSet.FieldByName('CODORCAMEN').AsString;
       _Cds.Filtered := true;
       if not _Cds.IsEmpty then
       begin
          MsgDlg('Código já cadastrado','Erro',mtError,[mbOk],0);
          Abort;
       end;

     finally
        _Cds.Filtered := false;
     end;
  end;
end;




procedure TfrmParamOrcamenMT.CdsAtivProjAfterPost(DataSet: TDataSet);
begin
  inherited;
  _Cds.Data := CdsAtivProj.Data;
end;




procedure TfrmParamOrcamenMT.GridAtivProjExit(Sender: TObject);
begin
  inherited;
  if CdsAtivProj.State = dsEdit then
     CdsAtivProj.Post;
end;

procedure TfrmParamOrcamenMT.GridProgramaExit(Sender: TObject);
begin
  inherited;
  if cdsPrograma.State = dsEdit then
     CdsPrograma.Post;
end;

procedure TfrmParamOrcamenMT.GridTipoDespesaExit(Sender: TObject);
begin
  inherited;
  if CdsTipoDespesa.State = dsEdit then
     CdsTipoDespesa.Post;
end;

procedure TfrmParamOrcamenMT.GridProgramaCalcCellColors(Sender: TObject;
  Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont;
  ABrush: TBrush);
begin
  inherited;
  // faz com que as linhas do grid tenham cores alternadas
  if State <> [gdSelected] then begin
     if not Highlight then begin
        // linhas ímpares = amarelo, linhas pares = branco
        if ((Sender as TwwDBGrid).CalcCellRow mod 2) = 0 then begin
           ABrush.Color := $00C0FFFF; // amarelo bebê
        end else begin
           ABrush.Color := clWhite;
        end;
     end;
  end else begin
     ABrush.Color := clHighLight;
     AFont.Color  := clHighLightText;
  end;
end;

procedure TfrmParamOrcamenMT.GridTipoDespesaCalcCellColors(Sender: TObject;
  Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont;
  ABrush: TBrush);
begin
  inherited;
  // faz com que as linhas do grid tenham cores alternadas
  if State <> [gdSelected] then begin
     if not Highlight then begin
        // linhas ímpares = amarelo, linhas pares = branco
        if ((Sender as TwwDBGrid).CalcCellRow mod 2) = 0 then begin
           ABrush.Color := $00C0FFFF; // amarelo bebê
        end else begin
           ABrush.Color := clWhite;
        end;
     end;
  end else begin
     ABrush.Color := clHighLight;
     AFont.Color  := clHighLightText;
  end;
end;

procedure TfrmParamOrcamenMT.GridProgramaTopRowChanged(Sender: TObject);
begin
  inherited;
  (sender as TwwDBGrid).Invalidate;
end;

procedure TfrmParamOrcamenMT.GridTipoDespesaTopRowChanged(Sender: TObject);
begin
  inherited;
  (sender as TwwDBGrid).Invalidate;
end;

end.
