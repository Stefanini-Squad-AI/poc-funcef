// Alterações:
{
--------------------------------------------------------------------------------
 Responsável: Everson Cunha
 Data.......: 10/05/2021
 SIG........: 134236
 Descrição..: Histórico mov. Centro Respon (Desmembramento, unificação..)
              DE/PARA
--------------------------------------------------------------------------------
Nº SIG......: 20240
Data........: 04/05/2016
Responsável.: Marcelo Cardoso
Descrição...: Erro ao inserir o registro na tabela CENTRESPON, o erro é
              informado pois o campo AVALIAFORNECEDOR não pode ser Nulo.
--------------------------------------------------------------------------------
Rotina......: -
Nº SOL......: 136120
Nº KINTANA..: 812527
Data........: 28/11/2011
Responsável.: Thaise Amaral Martins
Descrição...: Adicionar campo AVALIAFORNECEDOR
--------------------------------------------------------------------------------
Rotina    : CmeCadastroBeforeConfirma
Data      : 15/12/2003
Pendencia : 14802
Descrição : A Função Modulo.CalcGrau está trazendo o código EXTERNO do Centro de
            custo. Não está sendo localizado o pai corretamente.
            Foi retirada a verificação (temporariamente).
--------------------------------------------------------------------------------
Rotina    : -
Data      : 29/10/2003
Pendencia : 14802
Descrição : Implementação das alterações em função do De/Para de Centros de
            Responsabilidade
--------------------------------------------------------------------------------
Rotina    : Várias
Data      : 27/05/2004 (término)
Pendencia : 15166
Descrição : Implementação do cadastro de responsáveis por centros de custo e de
            responsabilida e suas respectivas vigências.
--------------------------------------------------------------------------------}

unit FCadCReponMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroMT, StdCtrls, DBCtrls, wwdblook, wwdbedit, Buttons, Mask,
  ComCtrls, CMTree, MontaSelect, Db, DBClient, uCMClientDataSet, uModulo,
  CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, TB97Tlbr, TB97Ctls, TB97, ExtCtrls, DBTables, uAutorizacao,uCtrlPadroes,
  uCMTreeViewMT, uCtrlCentRespon, uCtrlCentroCusto, uCtrlParamIntegra,uCtrlCadPlanCentRespon,
  CMDBLookupCombo, uCmSqlParams, Grids, Wwdbigrd, Wwdbgrid,uCmTypes,
  wwdbdatetimepicker, CMProcura, TabControlDetalhe;

type

   // Início - P: 20372 - 02/02/06
   TItem = record
      CodExterno   : string;
      CodCentRespon  : string;
      NomeCentRespon : string;
      FlgAnaSint   : string;
   end;

   pItem = ^TItem;
   // Fim - 02/02/2006
     TfrmCadCRespon = class(TFrmCadastroMT)
      CdsCCusto: TCMClientDataSet;
      pnlArvore: TPanel;
      Label2: TLabel;
      Label3: TLabel;
      Label5: TLabel;
      dbedDescricao: TDBEdit;
      pnAnaSint: TPanel;
      sbtnAnalitico: TSpeedButton;
      sbtnSintetico: TSpeedButton;
      dbedCod: TwwDBEdit;
      DBCkbAtivo: TDBCheckBox;
      dblkCCusto: TwwDBLookupCombo;
      CdsCentRespon: TCMClientDataSet;
      CdsAux: TCMClientDataSet;
      CmeDetalhe: TCmEventosCadastro;
      cdsDet: TCMClientDataSet;
      dsDet: TwwDataSource;
      msPessoa: TMontaSelect;
      tbcDetalhe: TTabControlDetalhe;
      dbgrdDet: TwwDBGrid;
      pnlControlesDet: TPanel;
      Label1: TLabel;
      Label4: TLabel;
      Label7: TLabel;
      cmpPessoa: TCMProcura;
      dtIniVig: TwwDBDateTimePicker;
      dtFimVig: TwwDBDateTimePicker;
      Dock973: TDock97;
      tb97BotoesDetalhe: TToolbar97;
      sbtnInsDet: TToolbarButton97;
      sbtnAltDet: TToolbarButton97;
      sbtnExcluiDet: TToolbarButton97;
      Dock974: TDock97;
      tb97Detalhe: TToolbar97;
      bbtnOkDet: TBitBtn;
      bbtnCancelarDet: TBitBtn;
      bbtnVoltarDet: TBitBtn;
      CMSqlParams1: TCMSqlParams;
      TreeCRespon: TTreeView;
      CdsPlanoCR: TCMClientDataSet;
      DsPlanoCR: TDataSource;
      CMSqlParams2: TCMSqlParams;
      DbLcbPlanoCR: TCMDBLookupCombo;
      imgTreeView: TImageList;
      Label8: TLabel;
    cbkObrigaAval: TDBCheckBox;
    dsMovimentacao: TwwDataSource;
    CdsMovimentacao: TCMClientDataSet;
    pgcDetalhe: TPageControl;
    tbsResponsaveis: TTabSheet;
    tbsMovimentacao: TTabSheet;

      procedure FormCreate(Sender: TObject);
      procedure FormClose(Sender: TObject; var Action: TCloseAction);
      procedure CmeCadastroFind(Sender: TObject);
      procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
      procedure CmeCadastroAbortConfirma(sender: TObject; OrigemAbortConfirma: TOrigemAbortConfirma);
      procedure CmeCadastroEdit(Sender: TObject);
      procedure CmeCadastroInsert(Sender: TObject);
      procedure CdsAfterScroll(DataSet: TDataSet);
      procedure CmeCadastroAtualizaBotoes(Sender: TObject);
      procedure CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
      procedure CmeCadastroDelete(Sender: TObject);
      procedure CmeCadastroBeforeConfirma(sender: TObject; var Accept: Boolean);
      procedure CmeCadastroCancel(Sender: TObject);
      procedure sbtnAnaliticoClick(Sender: TObject);
      procedure sbtnSinteticoClick(Sender: TObject);
      procedure sbtnInsDetClick(Sender: TObject);
      procedure sbtnAltDetClick(Sender: TObject);
      procedure sbtnExcluiDetClick(Sender: TObject);
      procedure bbtnOkDetClick(Sender: TObject);
      procedure bbtnCancelarDetClick(Sender: TObject);
      procedure dbgrdDetDblClick(Sender: TObject);
      procedure bbtnVoltarDetClick(Sender: TObject);
      procedure tbcDetalheChange(Sender: TObject);
      procedure tbcDetalheChanging(Sender: TObject;
        var AllowChange: Boolean);
      procedure CmeCadastroConfirma(Sender: TObject);
      procedure CmeDetalheInsert(Sender: TObject);
      procedure CmeDetalheEdit(Sender: TObject);
      procedure CmeDetalheDelete(Sender: TObject);
      procedure CmeDetalheConfirma(Sender: TObject);
      procedure CmeDetalheCancel(Sender: TObject);
      procedure CmeDetalheAtualizaBotoes(Sender: TObject);
      procedure CmeDetalheBeforeConfirma(sender: TObject;
        var Accept: Boolean);
      procedure TreeCResponChange(Sender: TObject; Node: TTreeNode);
      procedure DbLcPlanoCRCloseUp(Sender: TObject;
        LookupTable, FillTable: TDataSet; modified: Boolean);
      procedure sbtnApagarClick(Sender: TObject);
      procedure bbtnCancelarClick(Sender: TObject);
      procedure bbtnConfirmarClick(Sender: TObject);
      procedure dbedCodExit(Sender: TObject);

   private  // Private declarations

      sMascCRespon      : String;
      sMascCCusto       : String;
      ind               : Integer;
      lNivel            : array[0..20] of Integer;
      bMontandoArvore   : Boolean;
      bDeletando        : Boolean;
      // Inicio P:21368 - 31/01/2006
      fPlanCentRespon   : Extended;
      CtrlCadPlanCentRespon : TCtrlCadPlanCentRespon;
      sFiltro       : String ;
      // Fim P:21368 - 31/01/2006
      // P:21368 - 31/01/2006
      procedure MontaArvore(iIdEmpresa: integer; fIdPlanoCentRespon: Double; sMascara: string);
      function  RetornaCod(sCod: string): string;
      function  AcharNo(sCod: string): boolean;
      function  InserePasta(bEumaPasta:
                Boolean;  Arvore: TTreeView; NoDestino: TTreeNode; pDesc: pItem): TTreeNode;
      procedure InserePapel(Arvore: TTreeView; NoDestino: TTreeNode; pDesc: pItem);
      function  VerificaMestre : boolean;
      procedure FazerVoltarDet;



   public   // Public declarations

      CentRespon     : TCtrlCentRespon;
      CentroCusto    : TCtrlCentroCusto;

      fPlanCRespon   : Extended;
      fPlanCCust     : Extended;

      procedure PegaRegCentRespon(State: TDataSetState; PegaFilhos: Boolean = False);
      procedure CopiaRegCentRespon(State: TDataSetState);

      procedure Seleciona
                        (IDPessoa           : Extended = 0;
                         fPlanCRespon       : Extended = 0;
                         IdCentRespon       : String = ''
                         );

   end;



var
  frmCadCRespon: TfrmCadCRespon;



implementation
{$R *.DFM}
uses
   uMensErro, dBasedados, uSistema, uMidasUtil, dGlobal;



procedure TfrmCadCRespon.PegaRegCentRespon(State: TDataSetState; PegaFilhos: Boolean = False);
begin
   if State = DsInsert then
   begin
      CdsCentRespon.Data := CentRespon.ListaCentRespon(-1);
   end
   else
   begin
      CdsCentRespon.Data := CentRespon.ListaCentRespon(Sistema.IdEmpresa,
                                                       Cds.FieldByName('CODCENTRORESPON').AsString,
                                                       0,
                                                       '',
                                                       fPlanCentRespon,

                                                      );

   if PegaFilhos then
   begin
      cdsDet.Data          := CentRespon.RecuperaRespPorCentRespon( Sistema.IdEmpresa, Cds.FieldByName('CODCENTRORESPON').AsString );
      CdsMovimentacao.Data := CentRespon.ListaCentroResponOrigem(Cds.FieldByName('CODCENTRORESPON').AsString); //Everson Cunha - SIG134236
   end;

   end;
end;



procedure TfrmCadCRespon.CopiaRegCentRespon(State: TDatasetState);
var
  i: Integer;
  snome: String;
begin
   if State = dsInsert then
   begin
      CdsCentRespon.Append
   end
   else
   begin
      CdsCentRespon.Edit;
   end;

   for i := 0 to (Cds.Fields.Count - 1) do
   begin
      snome := Cds.Fields[i].FieldName;
      CdsCentRespon.FieldByName(snome).Value := Cds.FieldByName(snome).Value;
   end;

   CdsCentRespon.Post;
end;



procedure TfrmCadCRespon.Seleciona(IDPessoa           : Extended;
                                   fPlanCRespon       : Extended;
                                   IdCentRespon       : String
                                  );
begin
   Cds.Data := CentRespon.ListaCentRespon(IdPessoa,
                                          IdCentRespon,
                                          1,
                                          '',
                                          fPlanCRespon
                                         );

   Cds.FieldByName('CODEXTERNO').EditMask       := sMascCRespon + ';0; ';
   Cds.FieldByName('CODCENTROCUSTO').EditMask   := sMascCCusto + ';1; ';
end;



procedure TfrmCadCRespon.FormCreate(Sender: TObject);
begin

  inherited;

  tbcDetalhe.TabIndex := 0;
  tbcDetalheChange(tbcDetalhe);

   bMontandoArvore   := False;
   bDeletando        := False;
   sMascCRespon      := '';

   CentRespon        := TCtrlCentRespon.Create;
   CentroCusto       := TCtrlCentroCusto.Create;

   CentRespon.Initialize(DtmBaseDados.dbBaseDados, True, Sistema.ConnectionType,
                           Sistema.ConnectionSide, Sistema.AppRemoteServer, True);

   CentroCusto.InitializeAs(CentRespon);

   // P:21368 - 06/02/2006
   CtrlCadPlanCentRespon := TCtrlCadPlanCentRespon.Create;
   CtrlCadPlanCentRespon.InitializeAs(Padroes);
   CdsPlanoCR.Data       := CtrlCadPlanCentRespon.Procurar(0);

   // fim

   CentRespon.InitializeAs(CentRespon);

   CentRespon.cds  := CdsCentRespon;
   CentRespon.cdsRespCentRespon := cdsDet;


   //  pendência 14802 - 29/10/2003
   // ----------------------------------------------------------------------------------------------
   dtmGlobal.cdsParamGlobal.Close;

   dtmGlobal.sqlParamGlobal.Prepare;
   dtmGlobal.sqlParamGlobal.ParamByName('PIDPESSOA').AsInteger := Sistema.IDEmpresa;
   dtmGlobal.sqlParamGlobal.Open;

    fPlanCentRespon := dtmGlobal.CdsParamGlobal.FieldByName('IDPLANCRESPON').AsFloat;
   // P:21368 - 06/02/2006
     sMascCRespon := dtmGlobal.CdsParamGlobal.FieldByName('MASCCENTRORESPON').AsString;
     sMascCCusto  := dtmGlobal.CdsParamGlobal.FieldByName('MASCARACC').AsString;

    DbLcbPlanoCR.Lookupvalue:=Floattostr(fPlanCentRespon);
    //

    dtmGlobal.cdsParamGlobal.Close;
   // ----------------------------------------------------------------------------------------------
   // FIM - pendência 14802 - 29/10/2003

   try
      if not(Modulo.VerificaMascara(sMascCCusto, lNivel, ind)) then
      begin
         MessageBeep(0);
         ShowMessage(Translate('Máscara do Centro de Custo Inválida'));
         Exit;
      end;

      ind := 0;
      bMontandoArvore := False;

      if not(Modulo.VerificaMascara(sMascCRespon, lNivel, ind)) then
      begin
         MessageBeep(0);
         ShowMessage(Translate('Máscara do Centro de Responsabilidade Inválida'));
         Exit;
      end;


      Seleciona(Sistema.IdEmpresa, fPlanCentRespon);
      CdsCentRespon.Data := Cds.Data;
      CdsCentRespon.EmptyDataSet;
      MontaArvore(Sistema.IdEmpresa,fPlanCentRespon,'');
      MontaSelect.Filtro.Add('CRE.IDPESSOA      = ' + IntToStr(Sistema.IdEmpresa));
      Sfiltro:=MontaSelect.Filtro.Text;
      CdsCcusto.Data := CentroCusto.ListaCentroCusto(Sistema.IdEmpresa,'',True,0,'',ParamIntegra.PlanoCentroCusto);
      CdsCCusto.FieldByName('CODEXTERNO').EditMask := sMascCCusto + ';0; ';

      if not Cds.IsEmpty then CmeCadastro.Operacao := OpIdle;
   except
      Raise;
   end;
end;



procedure TfrmCadCRespon.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   inherited;

   dtmGlobal.cdsParamGlobal.Close;

   CentroCusto.Free;
   CentRespon.Free;
end;



procedure TfrmCadCRespon.CmeCadastroFind(Sender: TObject);
begin
   inherited;
   if MontaSelect.RetornouValor then
   begin
     cds.Locate('CODCENTRORESPON', MontaSelect.ValoresChave[0], [loPartialKey]);
     AcharNo(Cds.FieldByName('CODEXTERNO').AsString);
    end;
    Repaint;

end;



procedure TfrmCadCRespon.CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
begin
   inherited;
   Cds.FieldByName('IDUSUARIOINCLUSAO').AsFloat := Sistema.IdUsuario;
   if not bMontandoArvore then
  begin
      if sbtnAnalitico.Down = True then
         Cds.FieldByName('ANALITICOSINTET').AsString := 'A'
      else
         if  sbtnSintetico.Down = True  then
         Cds.FieldByName('ANALITICOSINTET').AsString := 'S';
   end;
   CopiaRegCentRespon(DsInsert);
   Accept := CentRespon.Gravar;
   if Accept then
      MontaArvore(Sistema.IdEmpresa,fPlanCentRespon,'');
end;



procedure TfrmCadCRespon.CmeCadastroAbortConfirma(sender: TObject; OrigemAbortConfirma: TOrigemAbortConfirma);
begin
   inherited;

   MsgDlg(CentRespon.MessageInfo, 'Erro', mtError, [mbOK], 0);
   Repaint;
end;



procedure TfrmCadCRespon.CmeCadastroEdit(Sender: TObject);
begin
   inherited;

   PegaRegCentRespon(DsEdit);
   dbedCod.Enabled  := False;
   DbLcbPlanoCR.Enabled:= False;
   if dbedDescricao.CanFocus then dbedDescricao.SetFocus;
end;



procedure TfrmCadCRespon.CmeCadastroInsert(Sender: TObject);
begin
   inherited;
   PegaRegCentRespon(DsInsert);
   cds.FieldByName('IDPESSOA').AsFloat              := Sistema.IdEmpresa;
   Cds.FieldByName('IDPLANCRESPON').AsFloat         := fPlanCentRespon;
   cds.FieldByName('IDEMPRESA').AsFloat             := Sistema.IdEmpresa;
   cds.FieldByName('ATIVO').AsString                := 'S';
   cds.FieldByName('AVALIAFORNECEDOR').AsString     := 'N';    //Marcelo Cardoso  - SIG20240
   treeCRespon.Enabled := False;
   DbLcbPlanoCR.Enabled:= False;
   dbedCod.Enabled := true;
   dbedCod.SetFocus;
   cdsDet.Data := CentRespon.RecuperaRespPorCentRespon( Sistema.IdEmpresa, Cds.FieldByName('CODCENTRORESPON').AsString );
   CdsMovimentacao.Data := CentRespon.ListaCentroResponOrigem(Cds.FieldByName('CODCENTRORESPON').AsString); //Everson Cunha - SIG134236
end;



procedure TfrmCadCRespon.CdsAfterScroll(DataSet: TDataSet);
begin
   inherited;

   if not(bMontandoArvore) then
   begin
      if cds.FieldByName('ANALITICOSINTET').AsString = 'A' then
      begin
         sbtnAnalitico.Down := True;
      end
      else
      begin
         if cds.FieldByName('ANALITICOSINTET').AsString = 'S' then
         begin
            sbtnSintetico.Down := True;
         end;
      end;

      if not(bDeletando) then
      begin
        cdsDet.Data := CentRespon.RecuperaRespPorCentRespon( Sistema.IdEmpresa, cds.FieldByName('CODCENTRORESPON').AsString );
        CdsMovimentacao.Data := CentRespon.ListaCentroResponOrigem(Cds.FieldByName('CODCENTRORESPON').AsString); //Everson Cunha - SIG134236
      end;
   end;
end;



procedure TfrmCadCRespon.CmeCadastroAtualizaBotoes(Sender: TObject);
begin
   inherited;
  CmeDetalhe.Atualizabotoes(Self);
  pnlFundo.Enabled := true;

   if CmeCadastro.Operacao = OpInserir then sbtnAlterar.Enabled := False;
   if CmeCadastro.Operacao = OpIdle    then sbtnApagar.Enabled  := not cds.IsEmpty;

   pnlFundo.Enabled    := True;
   pnAnaSint.Enabled   := bbtnConfirmar.Enabled;

   TreeCRespon.Enabled      := ( not( cds.IsEmpty ) ) and ( not bbtnConfirmar.Enabled );
   dbedCod.ReadOnly         := not bbtnConfirmar.Enabled;
   dblkCCusto.ReadOnly      := not bbtnConfirmar.Enabled;
   dbedDescricao.ReadOnly   := not bbtnConfirmar.Enabled;
   DBCkbAtivo.ReadOnly      := not bbtnConfirmar.Enabled;
end;



procedure TfrmCadCRespon.CmeCadastroDelete(Sender: TObject);
begin
   try
      bDeletando := True;

      if treeCRespon.Selected.HasChildren then
      begin
         MsgDlg('O Centro de Responsabilidade possui Filho(s)', 'Atenção', mtWarning, [mbok], 0);
         Repaint;
      end
      else
      begin
         PegaRegCentRespon(DsEdit, True);

         CdsDet.First;
         while not(CdsDet.EOF) do CdsDet.Delete;
      end;
           bDeletando := False;

   except
     Raise;
   end;
         inherited;

end;





procedure TfrmCadCRespon.CmeCadastroCancel(Sender: TObject);
var
   i : integer;
begin
   CmeDetalhe.Cancel(Self);
   i := 0;
   while (i < ComponentCount) do begin
         if (Components[i] Is TCmClientDataSet) and
            (TCmClientDataSet(Components[i]).Active) and
            (TCmClientDataSet(Components[i]).ChangeCount > 0) then
            TCmClientDataSet(Components[i]).CancelUpdates;
         Inc(i);
   end;
   inherited;
   TreeCRespon.Enabled := True;
   DbLcbPlanoCR.Enabled:= True;
end;



procedure TfrmCadCRespon.sbtnAnaliticoClick(Sender: TObject);
begin
   inherited;
   Cds.FieldByName('ANALITICOSINTET').AsString := 'A';
end;



procedure TfrmCadCRespon.sbtnSinteticoClick(Sender: TObject);
begin
   inherited;
   Cds.FieldByname('ANALITICOSINTET').AsString := 'S';
end;



procedure TfrmCadCRespon.CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
begin
   inherited;
   CopiaRegCentRespon(DsEdit);
   Accept := CentRespon.Gravar;
   //  P:21368 - 31/01/2006
   if Accept then
      MontaArvore(Sistema.IdEmpresa,fPlanCentRespon,'');
end;



procedure TfrmCadCRespon.CmeCadastroBeforeConfirma(sender: TObject; var Accept: Boolean);
var
   iGrau     : Integer;
   sPai      : String;
   EstadoQry : TDatasetState;
begin
   inherited;

  CmeDetalhe.Confirma(Self);
  Accept := CmeDetalhe.ConfirmaCadastro;

   if EstadoQry In [DsEdit, DsInsert] then
   begin
      try
            if not(Modulo.VerificaMascara(sMascCRespon, lNivel, ind)) then
            begin
               MessageBeep(0);
               ShowMessage(Translate('Máscara do Centro de Responsabilidade Inválida'));
               Exit;
            end;

            // Verifica se o tipo de Desemb já está cadastrado
            CdsAux.Data := CentRespon.ListaCentRespon(Sistema.IdEmpresa,
                                                      Trim(dbEdCod.Text),
                                                      0,
                                                      '',
                                                      fPlanCentRespon
                                                     );

            if not CdsAux.IsEmpty then
            begin
               CdsAux.Close;
               CentRespon.MessageInfo := 'Centro de Responsabilidade já cadastrado';
               Accept := False;
               DbEdCod.SetFocus;
               Exit;
            end;

            CdsAux.Close;

            if dbedCod.Modified then
            begin
               if not(cdsDet.IsEmpty) then
               begin
                  cdsDet.First;
                  while not(cdsDet.EOF) do
                  begin
                     cdsDet.Edit;
                     cdsDet.FieldByName('CODCENTRORESPON').AsString := Cds.FieldByName('CODCENTRORESPON').AsString;
                     cdsDet.FieldByName('IDEMPRESA').AsInteger := Sistema.IdEmpresa;
                     cdsDet.Post;
                     cdsDet.Next;
                  end;
                  cdsDet.First;
               end;
            end;
       except
         Raise;
       end;

      if sbtnAnalitico.Down then
         Cds.FieldByName('ANALITICOSINTET').AsString := 'A'
      else
         Cds.FieldByName('ANALITICOSINTET').AsString := 'S';

         TreeCRespon.Enabled := (Cds.State = dsEdit);
   end;
end;



procedure TfrmCadCRespon.FazerVoltarDet;
begin
   if (CdsDet <> nil) and (CdsDet.State in [dsEdit,dsInsert]) then
      CdsDet.Cancel;

   tb97Detalhe.Visible := false;

   if dbgrdDet <> nil then dbgrdDet.BringToFront;

   CmeDetalhe.Atualizabotoes(Self);
end;

function TfrmCadCRespon.VerificaMestre: boolean;
begin
   if Cds.Active then
   begin
        if Cds.State in ([dsInsert,dsEdit]) then
           Result := true
        else
            if (Cds.IsEmpty) then
               Result := false
            else
                Result := true;
   end
   else
       Result := false;
end;



procedure TfrmCadCRespon.sbtnInsDetClick(Sender: TObject);
begin
  inherited;
  if sbtnInsDet.Down then
  begin
       dbgrdDet.SendToBack;
       tb97Detalhe.Visible := true;
       CmeDetalhe.Insert(Self);
       CmeDetalhe.Atualizabotoes(Self);
       CmeDetalhe.Operacao := OpInserir;
  end
  else
      sbtnInsDet.Down := true;
end;

procedure TfrmCadCRespon.sbtnAltDetClick(Sender: TObject);
begin
  inherited;
  if sbtnAltDet.Down then
  begin
       dbgrdDet.SendToBack;
       tb97Detalhe.Visible := true;
       CmeDetalhe.Edit(Self);
       CmeDetalhe.Atualizabotoes(Self);
       CmeDetalhe.Operacao := OpAlterar;
  end
  else
      sbtnAltDet.Down := true;
end;

procedure TfrmCadCRespon.sbtnExcluiDetClick(Sender: TObject);
begin
  inherited;
  CmeDetalhe.Operacao := OpApagar;
  CmeDetalhe.Delete(Self);
  CmeDetalhe.Atualizabotoes(Self);
end;

procedure TfrmCadCRespon.bbtnOkDetClick(Sender: TObject);
begin
  inherited;
  CmeDetalhe.Confirma(Self);
end;

procedure TfrmCadCRespon.bbtnCancelarDetClick(Sender: TObject);
begin
  inherited;
  CmeDetalhe.Cancel(Self);
end;

procedure TfrmCadCRespon.dbgrdDetDblClick(Sender: TObject);
begin
  inherited;
  If (CmeCadastro.Operacao In [OpInserir, OpAlterar]) Then
     If (dbgrdDet.DataSource.DataSet.IsEmpty) Then
       sbtnInsDet.Click
     Else
       sbtnAltDet.Click;
end;

procedure TfrmCadCRespon.bbtnVoltarDetClick(Sender: TObject);
begin
  inherited;
  FazerVoltarDet;
end;


procedure TfrmCadCRespon.tbcDetalheChange(Sender: TObject);
begin
  inherited;

  pgcDetalhe.ActivePageIndex := tbcDetalhe.TabIndex;  //Everson Cunha - SIG134236

  if tbcDetalhe.detdbGrids.count > 0 then
  begin
       dbgrdDet := TwwDBGrid(TComponent(sender).Owner.FindComponent(tbcDetalhe.detdbGrids[tbcDetalhe.TabIndex]));
       if dbgrdDet <> nil then
          cdsDet := TCMClientDataSet(dbgrdDet.DataSource.DataSet)
       else
           cdsDet := nil;

       //if tbcDetalhe.detdbGrids[tbcDetalhe.TabIndex] = '' then //Everson Cunha - SIG134236
       if (tbcDetalhe.detdbGrids[tbcDetalhe.TabIndex] = '') or (tbcDetalhe.detdbGrids[tbcDetalhe.TabIndex] = 'dbgrdMovimentacao') then //Everson Cunha - SIG134236
          tb97BotoesDetalhe.Visible := false
       else
           tb97BotoesDetalhe.Visible := true;

       bbtnVoltarDetClick(Self);
  end;
end;

procedure TfrmCadCRespon.tbcDetalheChanging(Sender: TObject;
  var AllowChange: Boolean);
var
   mResult : TModalResult;
   sEstado,
   sEstadoCaption : string;
begin
  inherited;
  if (cdsDet <> nil) and (cdsDet.state in [dsInsert,dsEdit]) then
  begin
       if cdsDet.state in [dsInsert] then
       begin
            sEstado := 'inclusão';
            sEstadoCaption := 'Inclusão';
       end
       else
       begin
            sEstado := 'alteração';
            sEstadoCaption := 'Alteração';
       end;

     mResult := MsgDlg('Você está tentando mudar de pasta sem confirmar a '+sEstado+' de '+tbcDetalhe.Tabs[tbcDetalhe.TabIndex]+'.'+#13+#10+'Confirma a '+sEstado+' de '+tbcDetalhe.Tabs[tbcDetalhe.TabIndex]+'?', sEstadoCaption+' não confirmada', mtConfirmation, [mbYes, mbNo, mbCancel],0);
     try
        if mResult = mrYes then
        begin
             CmeDetalhe.RepetirInsert := false;
             bbtnOkDet.Click;
             CmeDetalhe.RepetirInsert := true;
        end
        else if mResult = mrNo then
             bbtnCancelarDet.Click
        else if mResult = mrCancel then
             AllowChange := false;
     except end;
  end;
end;

procedure TfrmCadCRespon.CmeCadastroConfirma(Sender: TObject);
begin
  inherited;
  FazerVoltarDet;
  inherited;
  CmeDetalhe.Atualizabotoes(Self);
end;

procedure TfrmCadCRespon.CmeDetalheInsert(Sender: TObject);
begin
  inherited;
  cdsDet.Insert;
end;

procedure TfrmCadCRespon.CmeDetalheEdit(Sender: TObject);
begin
  inherited;
  cdsDet.Edit;
end;

procedure TfrmCadCRespon.CmeDetalheDelete(Sender: TObject);
begin
  inherited;
  cdsDet.Delete;
  bbtnOkDetClick(Self);
end;

procedure TfrmCadCRespon.CmeDetalheConfirma(Sender: TObject);
var
  bRepete : boolean;
begin
  if (cdsDet <> nil ) and (cdsDet.State in [dsInsert, dsEdit]) then
  begin
      bRepete := (CmeDetalhe.RepetirInsert) and (cdsDet.State = dsInsert);
      try
         cdsDet.Post;
         if bRepete then
            CmeDetalhe.Insert(Self)
         else
             FazerVoltarDet;
      except end;
      CmeDetalhe.Atualizabotoes(Self);
  end;
end;

procedure TfrmCadCRespon.CmeDetalheCancel(Sender: TObject);
begin
  inherited;
  if cdsDet <> nil then
  begin
      cdsDet.Cancel;
      dbgrdDet.BringToFront;
  end;

  tb97Detalhe.Visible := false;
  CmeDetalhe.Atualizabotoes(Self);
end;

procedure TfrmCadCRespon.CmeDetalheAtualizaBotoes(Sender: TObject);
var
  lTemReg : Boolean;
begin
  inherited;
  If  (cdsDet <> nil) Then
  Begin
     sbtnInsDet.Down := (cdsDet.State = dsInsert);
     sbtnAltDet.Down := (cdsDet.State = dsEdit);
  End;

  if (CmeCadastro.Operacao in [opInserir,opAlterar]) and
     (VerificaMestre) then
  begin
    if (cdsDet <> nil) and (not cdsDet.IsEmpty) then
       lTemReg := true
    else
        lTemReg := false;

    sbtnInsDet.Enabled := (Not sbtnAltDet.Down);
    sbtnAltDet.Enabled := lTemReg And (Not sbtnInsDet.Down);
    sbtnExcluiDet.Enabled := lTemReg And (Not sbtnInsDet.Down) And (Not sbtnAltDet.Down);
  end
  else
  begin
     sbtnInsDet.Enabled := false;
     sbtnAltDet.Enabled := false;
     sbtnExcluiDet.Enabled := false;
  end;

  AutorizarForm(afSoDesabilitar);
end;

procedure TfrmCadCRespon.CmeDetalheBeforeConfirma(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  if cdsDet.State in [dsInsert, dsEdit] then
  begin
    cdsDet.FieldByName('NOME').AsString := cmpPessoa.Text;

    if cdsDet.FieldByName('IDPESSOA').IsNull then
    begin
      ShowMessage('Selecione o responsável.');
      Abort;
    end;

    if ( dtIniVig.Text <> '' ) and ( dtFimVig.Text <> '' ) then
    begin
      if dtIniVig.Date > dtFimVig.Date then
      begin
        ShowMessage('O início da vigência não pode ser posterior ao seu término.');
        Abort;
      end;
    end;
  end;
end;

procedure TfrmCadCRespon.TreeCResponChange(Sender: TObject;
  Node: TTreeNode);

begin
  inherited;

  if not bMontandoArvore then

    //  P 21368    03/02/06
    Cds.Locate('CODEXTERNO',pItem(TREECRESPON.SELECTED.Data)^.CodEXTERNO,[]);
  begin
      if Cds.FieldByName('ANALITICOSINTET').AsString = 'A' then
         sbtnAnalitico.Down := True
      else
         if Cds.FieldByName('ANALITICOSINTET').AsString = 'S' then
            sbtnSintetico.Down := True;
   end;

   cbkObrigaAval.Refresh;

end;

procedure TfrmCadCRespon.MontaArvore(iIdEmpresa: integer; fIdPlanoCentRespon: Double; sMascara: string);
 var
  ItemNo      : pItem;
  No          : TTreeNode;
  sCodPaiGrup : string;
begin
    // P:21368 - 03/02/2006

    Seleciona(iIdEmpresa, fPlanCentRespon);

   try
      TreeCRespon.Items.Clear;
      No := TreeCRespon.Items.GetFirstNode;
      bMontandoArvore := true;

      Cds.DisableControls;
      Cds.First;
      sCodPaiGrup := Cds.FieldByName('CODEXTERNO').AsString;

      while not Cds.Eof do
      begin
         new(ItemNo);
         ItemNo.CodExterno   := Cds.FieldByName('CODEXTERNO').AsString;
         ItemNo.NomeCentRespon := RetornaCod(Cds.FieldByName('CODEXTERNO').DisplayText) + ' - ' + Cds.FieldByName('NOME').AsString;
         ItemNo.FlgAnaSint   := Cds.FieldByName('ANALITICOSINTET').AsString;


         if (No <> nil) then
         begin
            while pItem(No.Data)^.CodExterno <> Copy(Cds.FieldByName('CODEXTERNO').AsString,1,Length(pItem(No.Data)^.CodExterno)) do
            begin
               if sCodPaiGrup = Copy(Cds.FieldByName('CODEXTERNO').AsString,1,Length(sCodPaiGrup)) then
                  No := No.Parent
               else
               begin
                  sCodPaiGrup := Cds.FieldByName('CODEXTERNO').AsString;
                  No          := nil;
                  Break;
               end;
            end;
         end;

         if ItemNo.FlgAnaSint = 'S' then
         begin
            No          := InserePasta(False, TreeCRespon,No,ItemNo);
         end
         else
            InserePapel(TreeCRespon,No,ItemNo);
            Cds.Next;
      end;


   finally
      bMontandoArvore := False;
      ItemNo := nil;
      Cds.EnableControls;

   end;



end;



function TfrmCadCRespon.RetornaCod(sCod: string): string;
var
  i: integer;
begin
   for i := Length(sCod) downto 1 do
   begin
      if sCod[i] in ['0'..'9'] then
      begin
         Result := Copy(sCod,1,i);
         Break
      end;
   end;
end;

function TfrmCadCRespon.AcharNo(sCod: string): Boolean;
var
  No: TTreeNode;
begin
   No := TreeCRespon.Items.GetFirstNode;
   // 09/02
   if  (no <> nil) then
   begin
        while (trim(pItem(No.Data)^.CodExterno) <> Trim(sCod)) do
        begin
               if Trim(pItem(No.Data)^.CodExterno) = Copy(sCod,1,Length(pItem(No.Data)^.CodExterno)) then
                   No := No.GetNext
               else
          No := No.getNextSibling;
               if No = nil then Break;
   end;
    end;
   Result := (No <> nil);

end;

function TfrmCadCRespon.InserePasta(bEumaPasta: Boolean;
  Arvore: TTreeView; NoDestino: TTreeNode; pDesc: pItem): TTreeNode;
var
  No: TTreeNode;

begin
  if bEumaPasta then
    No := Arvore.Items.AddObject(NoDestino,pDesc.NomeCentRespon,pDesc)
  else
    No := Arvore.Items.AddChildObject(NoDestino,pDesc.NomeCentRespon,pDesc);
  No.ImageIndex    := 0;
  No.SelectedIndex := 1;
  Result := No;
end;

procedure TfrmCadCRespon.InserePapel(Arvore: TTreeView;
  NoDestino: TTreeNode; pDesc: pItem);
var
  No: TTreeNode;

begin
  No := Arvore.Items.AddChildObject(NoDestino,pDesc.NomeCentRespon,pDesc);
  No.ImageIndex    := 2;
  No.SelectedIndex := 3;
end;

procedure TfrmCadCRespon.DbLcPlanoCRCloseUp(
  Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  // P:21368 - 06/02/2006
  fPlanCentRespon := cdsPlanoCR.FieldbyName('IdPlanCRespon').AsFloat;
  sMascCRespon    := cdsPlanoCR.FieldbyName('MASCARA').Asstring;
  MontaSelect.Filtro.text:=sfiltro;
  MontaSelect.Filtro.Add('CRE.IDPLANCRESPON = ' + FormatFloat('#0', fPlanCentRespon));
  MontaArvore(Sistema.IdEmpresa,
              fPlanCentRespon,
              cdsPlanoCR.FieldbyName('Mascara').Asstring);

end;

procedure TfrmCadCRespon.sbtnApagarClick(Sender: TObject);
begin
   if (mrOk = Msgdlg('Confirma exclusão', 'Confirmação', mtConfirmation, [ mbOk, mbCancel ], 0)) then
   begin
       Repaint;
       if not CentRespon.CentResponExclui(cds.FieldByName('CODCENTRORESPON').AsInteger,cds.FieldByName('IDEMPRESA').AsFloat) then
    begin
      MsgDlg(CentRespon.MessageInfo, 'Erro', mtError, [ mbOk ], 0);
      Repaint;
    end else begin
      TreeCRespon.Selected.Delete;
      MontaArvore(Sistema.IdEmpresa,fPlanCentRespon,'');
    end;
  end;
  bbtnCancelarClick(Self);
end;

procedure TfrmCadCRespon.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  DbLcbPlanoCR.Enabled:= True;
end;

procedure TfrmCadCRespon.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  DbLcbPlanoCR.Enabled:= True;
end;

procedure TfrmCadCRespon.dbedCodExit(Sender: TObject);
var
  i : integer;
  sParte : string;
  s, sCodigo : string;
  bEncontrouPai : boolean;

begin
  inherited;

  if not( cds.State in [dsInsert, dsEdit] ) then
    exit;

  // 13/02/06
  if Trim(dbedCod.Text) = '' then
     Exit;

  sCodigo := cds.FieldByName('CODEXTERNO').DisplayText;

  sParte := '';
  i := length( sCodigo );
  while i > 0 do
  begin
    if sCodigo[i] = '0' then
    begin
      sParte := sCodigo[i] + sParte;
      dec( i );
      Continue;
    end;

    if sCodigo[i] = '.' then
    begin
      if StrToIntDef( sParte, 0 ) = 0 then
        sCodigo := Copy( sCodigo, 1, i - 1 );
      i := length( sCodigo );
      Continue;
    end;

    if sCodigo[i] = ' ' then
    begin
      dec( i );
      Continue;
    end;

    break;
  end;

  sCodigo := StringReplace( sCodigo, '.', '', [rfReplaceAll] );
  if StrToIntDef( sCodigo, 0 ) = 0 then sCodigo := '';

  cds.FieldByName('CODEXTERNO').AsString := sCodigo;

  sCodigo := cds.FieldByName('CODEXTERNO').DisplayText;
  sCodigo := StringReplace( sCodigo, ' ', '', [rfReplaceAll] );
  while Pos( '..', sCodigo ) > 0 do
    sCodigo := StringReplace( sCodigo, '..', '.', [rfReplaceAll] );
  sCodigo := Copy( sCodigo, 1, length( sCodigo ) - 1 );

  i := length( sCodigo );
  while i > 0 do
  begin
    if sCodigo[i] = '.' then break;
    dec( i );
  end;

  if i > 0 then
  begin
    sCodigo := Copy( sCodigo, 1, i - 1 );

    bEncontrouPai := False;
    for i := 0 to ( TreeCRespon.Items.Count - 1 ) do
    begin
      s := TreeCRespon.Items[i].Text;
      s := Copy( s, 1, Pos( ' ', s ) - 1 );
      if s = sCodigo then
      begin
        bEncontrouPai := True;
        break;
      end;
    end;

    if not bEncontrouPai then
    begin
      MsgDlg('Não é possível inserir este ' + Caption + ',   pois não há um pai cadastrado.','Aviso',mtWarning,[mbOk],0);
      cds.FieldByName('CODEXTERNO').Clear;
      dbedCod.SetFocus;
    end;
  end;


      if AcharNo(dbedCod.Text) then
           begin
            MsgDlg('Não é possível inserir este Centro de Responsabilidade, pois ele já existe','Aviso',mtWarning,[mbOk],0);
            dbedCod.SetFocus;

           end;
//13/02/06


 end;

end.

