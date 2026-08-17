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
   uCtrlParamOrcamento, uCtrlPlanPrevContabil, uCtrlPatro;

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

      procedure CmeCadastroAtualizaBotoes(Sender: TObject);
      procedure CmeCadastroEdit(Sender: TObject);
      procedure CmeCadastroFind(Sender: TObject);
      procedure FormCreate(Sender: TObject);
      procedure FormClose(Sender: TObject; var Action: TCloseAction);
      procedure CmeCadastroBeforeConfirma(sender: TObject; var Accept: Boolean);
      procedure CmeCadastroConfirma(Sender: TObject);
      procedure btnAlteraPlanoClick(Sender: TObject);
      procedure btnAlteraPatroClick(Sender: TObject);
      procedure FormShow(Sender: TObject);
      procedure btnCancelaPlanoClick(Sender: TObject);
      procedure btnConfirmaPlanoClick(Sender: TObject);
      procedure btnCancelaPatroClick(Sender: TObject);
      procedure btnConfirmaPatroClick(Sender: TObject);
      procedure CmeCadastroCancel(Sender: TObject);
      procedure bbtnConfirmarClick(Sender: TObject);
      procedure bbtnCancelarClick(Sender: TObject);


   private  // Private declarations

      CtrlParamOrcamento   : TCtrlParamOrcamento;
      CtrlPlanPrevContabil : TCtrlPlanPrevContabil;
      CtrlPatro            : TCtrlPatro;

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
begin
	Result := False;

	try

      if dbcboSaldos.text = '' then
         raise EValidacao.CreateVal('Tratamento do Saldo não preenchido.', dbcboSaldos);

      if trim(dblcPlanoOrc.text) = '' then
         raise EValidacao.CreateVal('Plano Orçamentário não preenchido.', dblcPlanoOrc);

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
{
   if cds.FieldByName('FLGUSACOD1').IsNull then cds.FieldByName('FLGUSACOD1').AsInteger := 0;
   if cds.FieldByName('FLGUSACOD2').IsNull then cds.FieldByName('FLGUSACOD2').AsInteger := 0;
   if cds.FieldByName('FLGUSACOD3').IsNull then cds.FieldByName('FLGUSACOD3').AsInteger := 0;
   if cds.FieldByName('FLGUSACOD4').IsNull then cds.FieldByName('FLGUSACOD4').AsInteger := 0;
   if cds.FieldByName('FLGUSACOD5').IsNull then cds.FieldByName('FLGUSACOD5').AsInteger := 0;
}
   if cds.FieldByName('TAMCOD1').IsNull      then cds.FieldByName('TAMCOD1').AsInteger       := 0;
   if cds.FieldByName('TAMCOD2').IsNull      then cds.FieldByName('TAMCOD2').AsInteger       := 0;
   if cds.FieldByName('TAMCOD3').IsNull      then cds.FieldByName('TAMCOD3').AsInteger       := 0;
   if cds.FieldByName('TAMCOD4').IsNull      then cds.FieldByName('TAMCOD4').AsInteger       := 0;
   if cds.FieldByName('TAMCOD5').IsNull      then cds.FieldByName('TAMCOD5').AsInteger       := 0;

   if cds.FieldByName('FLGTIPOCOD1').IsNull  then cds.FieldByName('FLGTIPOCOD1').AsInteger   := 1;
   if cds.FieldByName('FLGTIPOCOD2').IsNull  then cds.FieldByName('FLGTIPOCOD2').AsInteger   := 2;
   if cds.FieldByName('FLGTIPOCOD3').IsNull  then cds.FieldByName('FLGTIPOCOD3').AsInteger   := 3;
   if cds.FieldByName('FLGTIPOCOD4').IsNull  then cds.FieldByName('FLGTIPOCOD4').AsInteger   := 4;
   if cds.FieldByName('FLGTIPOCOD5').IsNull  then cds.FieldByName('FLGTIPOCOD5').AsInteger   := 5;
end;



procedure TfrmParamOrcamenMT.FormCreate(Sender: TObject);
begin
   inherited;

   CtrlParamOrcamento   := TCtrlParamOrcamento.Create;
   CtrlPlanPrevContabil := TCtrlPlanPrevContabil.Create;
   CtrlPatro            := TCtrlPatro.Create;

   CtrlParamOrcamento.Initialize(DtmBaseDados.dbBaseDados, 
                                 True,
                                 Sistema.ConnectionType,
                                 Sistema.ConnectionSide,
                                 Sistema.AppRemoteServer,
                                 True,
                                 nil,
                                 nil,
                                 False
                                );

   CtrlPlanPrevContabil.Initialize(DtmBaseDados.dbBaseDados,
                                   True,
                                   Sistema.ConnectionType,
                                   Sistema.ConnectionSide,
                                   Sistema.AppRemoteServer,
                                   True,
                                   nil,
                                   nil,
                                   False
                                  );

   CtrlPatro.Initialize(DtmBaseDados.dbBaseDados,
                        True,
                        Sistema.ConnectionType,
                        Sistema.ConnectionSide,
                        Sistema.AppRemoteServer,
                        True,
                        nil,
                        nil,
                        False
                       );

   // Atribui os ClientDataSets local a ser persistido pelo objeto de negócios
   CtrlParamOrcamento.cdsParamOrcamento   := cds;
   CtrlPlanPrevContabil.cds               := cdsPlano;
   CtrlPatro.cds                          := cdsPatro;

   cds.Data := CtrlParamOrcamento.Procurar(-1);
end;




procedure TfrmParamOrcamenMT.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   try
      CtrlParamOrcamento.Free;
      CtrlPlanPrevContabil.Free;
      CtrlPatro.Free;
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

	// só permite alteração
   sbtnInserir.Enabled        := False;
   sbtnAlterar.Enabled        := True;
   sbtnApagar.Enabled         := False;
   sbtnProcurar.Enabled       := False;
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



procedure TfrmParamOrcamenMT.CmeCadastroConfirma(Sender: TObject);
begin
   inherited;

   if not(CtrlParamOrcamento.AplicaOperacaoParamOrcamento) then
   begin
      MsgDlg(CtrlParamOrcamento.MessageInfo, 'Orçamento', mtError, [mbOk], 0);
      Repaint;
   end
   else
   begin
      CtrlPlanPrevContabil.Gravar;
      CtrlPatro.Gravar;

      cds.Data := CtrlParamOrcamento.ListaParamOrcamento(Sistema.IDEmpresa);
   end;
end;



procedure TfrmParamOrcamenMT.FormShow(Sender: TObject);
begin
   pgcParametros.ActivePage := tbsGeral;

   inherited;

   cds.Data          := CtrlParamOrcamento.ListaParamOrcamento(Sistema.IDEmpresa);
   cdsMoeda.Data     := CtrlParamOrcamento.ListaMoeda;
   cdsPlanoOrc.Data  := CtrlParamOrcamento.ListaPlanoOrc;

   cdsPlano.Data     := CtrlPlanPrevContabil.ListaPlanPrevContabil;
   cdsPatro.Data     := CtrlPatro.ListaPatroParaOrcamento;
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



end.
