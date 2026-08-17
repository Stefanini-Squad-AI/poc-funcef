//******************************************************************************
// Data      : 18/03/2008
// Código    : AL_1
// Pendencia :
// Motivo    : Implementação dos TAG´s na propriedade HelpContex(MNU) no menu do
//             Sistema(no final desse form está a descrição do tag / menu)
//******************************************************************************

unit FPrincipal;

interface

uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   FCMPrincipal, Menus, Wwintl, ExtCtrls, Buttons, ComCtrls,
   fTelaAut, uAutorizacao, uSistema, TB97, Db, Wwdatsrc, DBTables, Wwquery,
   wwdblook, StdCtrls, Mask, wwdbedit, DBCtrls, TB97Tlwn, TB97Tlbr,
   TB97Ctls, ImgList, CorreioCM, IvDictio, IvAMulti, IvBinDic, IvMulti,
   IvEMulti, fcLabel, SConnect, MConnect, DBClient, AppEvnts, uMensErro,
   CMApplicationEvents, dBasedados, uCmClientDataSet, StdActns, ActnList,
   fcStatusBar, uCtrlATivoCota, uCtrlParamIntegra, uResource, wwclient, CMDatabase,
   uCtrlPadroes, dLookCota, uCtrlCotaCotacao, uCtrlHstMovCota, uTypesCota, uCtrlParamCota,
  CMNetUsers;


type
   TfrmPrincipal = class(TfrmCMPrincipal)
      mnuEvolucaoCota: TMenuItem;
      CadastraPerfil1: TMenuItem;
      mnuCarteiraSPC: TMenuItem;
      mnuExportaDAIEA: TMenuItem;
      Receitased1: TMenuItem;
      Ativos1: TMenuItem;
      Parmetros1: TMenuItem;
      Emprstimo1: TMenuItem;
      Imobilirio1: TMenuItem;
      Investimento1: TMenuItem;
      Movimentao1: TMenuItem;
      ReceitaseDespesasCotasManuais1: TMenuItem;
      ImportaLanamentos1: TMenuItem;
      PrimeiraCota1: TMenuItem;
      PerfilCadastrado1: TMenuItem;
      Clculoda1Cota1: TMenuItem;
      ClculodeCotas1: TMenuItem;
      ClculodeCotas2: TMenuItem;
      N2: TMenuItem;
      FechamentodePerodo1: TMenuItem;
      N1: TMenuItem;
      N3: TMenuItem;
      N4: TMenuItem;
      N5: TMenuItem;
      N6: TMenuItem;
    mnuUtilExcluiTodasCotas: TMenuItem;
    ExcluirCotas1: TMenuItem;
    PrimeirasCotas1: TMenuItem;
    N7: TMenuItem;
    mnuUtilExcluiPrimCotaImob: TMenuItem;
    mnuUtilExcluiPrimCotaRF: TMenuItem;
    mnuUtilExcluiPrimCotaEP: TMenuItem;
    mnuUtilExcluiPrimCotaRV: TMenuItem;
    mnuUtilExcluiPrimCotaBMF: TMenuItem;
    mnuUtilExcluiPrimCotaFundoRF: TMenuItem;
    mnuUtilExcluiPrimCotaFundoRV: TMenuItem;
    mnuUtilExcluiPrimCotaFundoImob: TMenuItem;
    mnuUtilExcluiPrimCotaFundoDIC: TMenuItem;
    PrimeirasCotas2: TMenuItem;
    mnuUtilExcluiCotaFundoDIC: TMenuItem;
    mnuUtilExcluiCotaFundoImob: TMenuItem;
    mnuUtilExcluiCotaFundoRV: TMenuItem;
    mnuUtilExcluiCotaFundoRF: TMenuItem;
    mnuUtilExcluiCotaBMF: TMenuItem;
    mnuUtilExcluiCotaRV: TMenuItem;
    mnuUtilExcluiCotaRF: TMenuItem;
    mnuUtilExcluiCotaImob: TMenuItem;
    mnuUtilExcluiCotaEP: TMenuItem;

    procedure AppPadraoAfterLogin(Sender: TObject);
    procedure nmuConfigParametrosClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure mnuPerfilClick(Sender: TObject);
    procedure CadastraPerfil1Click(Sender: TObject);
    procedure mnuCarteiraSPCClick(Sender: TObject);
    procedure Receitased1Click(Sender: TObject);
    procedure Ativos1Click(Sender: TObject);
    procedure Imobilirio1Click(Sender: TObject);
    procedure Investimento1Click(Sender: TObject);
    procedure ReceitaseDespesasCotasManuais1Click(Sender: TObject);
    procedure PrimeiraCota1Click(Sender: TObject);
    procedure PerfilCadastrado1Click(Sender: TObject);
    procedure Clculoda1Cota1Click(Sender: TObject);
    procedure ClculodeCotas1Click(Sender: TObject);
    procedure FechamentodePerodo1Click(Sender: TObject);
    procedure mnuUtilExcluiTodasCotasClick(Sender: TObject);
    procedure ImportaLanamentos1Click(Sender: TObject);
    procedure mnuUtilExcluiPrimCotaImobClick(Sender: TObject);
    procedure Emprstimo1Click(Sender: TObject);
    procedure mnuUtilExcluiPrimCotaEPClick(Sender: TObject);
    procedure mnuUtilExcluiPrimCotaRFClick(Sender: TObject);
    procedure mnuUtilExcluiPrimCotaRVClick(Sender: TObject);
    procedure mnuUtilExcluiPrimCotaBMFClick(Sender: TObject);
    procedure mnuUtilExcluiPrimCotaFundoRFClick(Sender: TObject);
    procedure mnuUtilExcluiPrimCotaFundoRVClick(Sender: TObject);
    procedure mnuUtilExcluiPrimCotaFundoImobClick(Sender: TObject);
    procedure mnuUtilExcluiPrimCotaFundoDICClick(Sender: TObject);
    procedure mnuUtilExcluiCotaEPClick(Sender: TObject);
    procedure mnuUtilExcluiCotaImobClick(Sender: TObject);
    procedure mnuUtilExcluiCotaRFClick(Sender: TObject);
    procedure mnuUtilExcluiCotaRVClick(Sender: TObject);
    procedure mnuUtilExcluiCotaBMFClick(Sender: TObject);
    procedure mnuUtilExcluiCotaFundoRFClick(Sender: TObject);
    procedure mnuUtilExcluiCotaFundoRVClick(Sender: TObject);
    procedure mnuUtilExcluiCotaFundoImobClick(Sender: TObject);
    procedure mnuUtilExcluiCotaFundoDICClick(Sender: TObject);
    procedure AppPadraoCreateFormReports(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);


   private

      CtrlAtivoCota   : TCtrlAtivoCota;
      CtrlCotaCotacao : TCtrlCotaCotacao;
      CtrlHstMovCota  : TCtrlHstMovCota;
      CtrlParamCota   : TCtrlParamCota;


   public

   end;



var
  frmPrincipal: TfrmPrincipal;



implementation
{$R *.DFM}
uses
   fParamCota, fCadPerfil, fCadPerfilCota, fCadCarteiraSPC, fCadTipoOper, fCadAtivos,
   fCadParamEmprestimo, fAguarde, fCadParamImobiliario, fCadParamInvestimento,
   fCadHstMovCota, fExecCalcCota, fExecCalcPrimCota, fCadPrimCota, fConsultaPerfil,
   fCadCotaTipoOper, fExecFechamento, fExecImportaLancamento,
   dRelParamAtivo, dRelPerfilConsolidado, dRelMovCota;





procedure TfrmPrincipal.AppPadraoAfterLogin(Sender: TObject);
begin
   inherited;

   if Sistema.FezLogin then
   begin
      stbarStatusBar.Panels[2].Text := Sistema.AliasServidor;

      ParamIntegra.GetParams(Sistema.IdEmpresa, 0, '', '', tiSistema);

      //inciia o CtrlHstMovCota
      CtrlHstMovCota := TCtrlHstMovCota.Create;
      CtrlHstMovCota.InitializeAs(padroes);
      //  Carrega os dados da empresa para o Cds...
      dtmLookCotas.CdsDadosFundacao.Data := CtrlHstMovCota.CarregaDadosEmpresa;
      FreeAndNil(CtrlHstMovCota);


      //inicia o CtrlObject AtivoCota
      CtrlAtivoCota  :=  TCtrlAtivoCota.Create;
      CtrlAtivoCota.InitializeAs(padroes);


      //executa instrução do CtrlObject AtivoCota
      if not CtrlAtivoCota.TransfereDados then
      begin
         MsgDlg (CtrlAtivoCota.MessageInfo, Sistema.NomeAplicativo, mtError, [mbok], 0 );
         Repaint;
      end
      else
      begin
         // verifica se foi encontrado(s) registro(s) novo(s)
         // se o resultado for positivo, então exibe a mensagem ao usuário
         if CtrlAtivoCota.TotalAtivos > 0 then
         begin
            MsgDlg('Foram inserido(s) o(s) seguinte(s) registro(s) de ativo(s) novo(s):'                + #13 +
                   '  '                                                                                 + #13 +
                   'Investimento                      =  '+  IntToStr(CtrlAtivoCota.TAInvestimento)     + #13 +
                   'Imóvel                            =  '+ IntToStr(CtrlAtivoCota.TAImovel)            + #13 +
                   'Tipo de Contrato de Empréstimo    =  '+ IntToStr(CtrlAtivoCota.TATipoContrEmptmo )  + #13 +
                   'Fundo de Investimento             =  '+ IntToStr(CtrlAtivoCota.TAFundoInvest)       + #13 +
                   '  '                                                                        + #13 +
                   'Total de '+IntToStr(CtrlAtivoCota.TotalAtivos)+' registro(s) de ativo(s) novo(s)',
                   'Atualização de dados', mtWarning,[mbOk],0);

            Repaint;
         end;
      end;
   end;
end;


procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
     inherited;

     Sistema.NomeAplicativo := 'Controle de Cotas & Informações SPC';

     CtrlParamCota := TCtrlParamCota.Create;
     CtrlParamCota.Initialize(DtmBaseDados.dbBaseDados,
                              True,
                              Sistema.ConnectionType,
                              Sistema.ConnectionSide,
                              Sistema.AppRemoteServer,
                              True, nil, nil, False);
end;



// -------------------------------------------------------------------------------------------------
// -------------------------------------------------------------------------------------------------
// -------------------------------------------------------------------------------------------------
// -------------------------------------------------------------------------------------------------
// -------------------------------------------------------------------------------------------------

procedure TfrmPrincipal.nmuConfigParametrosClick(Sender: TObject);
begin
  inherited;
  AbrirForm(frmParamCota, TfrmParamCota, False);
end;

procedure TfrmPrincipal.mnuPerfilClick(Sender: TObject);
begin
   inherited;
   AbrirForm(frmCadPerfil, TfrmCadPerfil, False);
end;

procedure TfrmPrincipal.CadastraPerfil1Click(Sender: TObject);
begin
   inherited;
   AbrirForm(frmCadPerfilCota, TfrmCadPerfilCota, False);
end;

procedure TfrmPrincipal.mnuCarteiraSPCClick(Sender: TObject);
begin
   inherited;
   AbrirForm(frmCadCarteiraSPC, TfrmCadCarteiraSPC, False);
end;

procedure TfrmPrincipal.Receitased1Click(Sender: TObject);
begin
   inherited;
   AbrirForm(frmCadCotaTipoOper, TfrmCadCotaTipoOper, False);
end;

procedure TfrmPrincipal.Ativos1Click(Sender: TObject);
begin
   inherited;
   AbrirForm(FrmCadAtivos,TFrmCadAtivos,False);
end;

procedure TfrmPrincipal.Imobilirio1Click(Sender: TObject);
begin
   inherited;
   AbrirForm(frmCadParamImobiliario, TfrmCadParamImobiliario, False);
end;

procedure TfrmPrincipal.Investimento1Click(Sender: TObject);
begin
   inherited;
   AbrirForm(frmCadParamInvestimento, TfrmCadParamInvestimento, False);
end;

procedure TfrmPrincipal.ReceitaseDespesasCotasManuais1Click(Sender: TObject);
begin
   inherited;
   AbrirForm(frmCadHstMovCota, TfrmCadHstMovCota, False);
end;

procedure TfrmPrincipal.PrimeiraCota1Click(Sender: TObject);
begin
   inherited;
   AbrirForm(FrmCadPrimCota,TFrmCadPrimCota,False);
end;

procedure TfrmPrincipal.PerfilCadastrado1Click(Sender: TObject);
begin
   inherited;
   AbrirForm(frmConsultaPerfil,TfrmConsultaPerfil,False);
end;

procedure TfrmPrincipal.Clculoda1Cota1Click(Sender: TObject);
begin
   inherited;
   AbrirForm(frmExecCalcPrimCota, TfrmExecCalcPrimCota, False);
end;

procedure TfrmPrincipal.ClculodeCotas1Click(Sender: TObject);
begin
   inherited;
   AbrirForm(frmExecCalcCota, TfrmExecCalcCota, False);
end;

procedure TfrmPrincipal.FechamentodePerodo1Click(Sender: TObject);
begin
   inherited;
   AbrirForm(frmExecFechamento, TfrmExecFechamento, False);
end;

procedure TfrmPrincipal.ImportaLanamentos1Click(Sender: TObject);
begin
   inherited;
   AbrirForm(frmExecImportaLancamento, TfrmExecImportaLancamento, False);
end;

procedure TfrmPrincipal.Emprstimo1Click(Sender: TObject);
begin
   inherited;
   AbrirForm(frmCadParamEmprestimo, TfrmCadParamEmprestimo, False);
end;

// -------------------------------------------------------------------------------------------------
// -------------------------------------------------------------------------------------------------
// -------------------------------------------------------------------------------------------------
// -------------------------------------------------------------------------------------------------
// -------------------------------------------------------------------------------------------------



procedure TfrmPrincipal.mnuUtilExcluiTodasCotasClick(Sender: TObject);
begin
   if MsgDlg('Deseja realmente EXCLUIR TODAS as cotações já calculadas?',
             'Cotas', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
   begin
      Repaint;

      CtrlCotaCotacao   := TCtrlCotaCotacao.Create;

      CtrlCotaCotacao.Initialize(DtmBaseDados.dbBaseDados,
                                 True,
                                 Sistema.ConnectionType,
                                 Sistema.ConnectionSide,
                                 Sistema.AppRemoteServer,
                                 True, nil, nil, False
                                );

      try
         if CtrlCotaCotacao.ApagaCota(-1, -1, -1, -1, -1) then
         begin
            MsgDlg('Cotações excluídas.', 'Cotas', mtInformation, [mbOk], 0);
            Repaint;
         end
         else
         begin
            MsgDlg('ERRO ao excluir cotações!', 'Cotas', mtError, [mbOk], 0);
            Repaint;
         end;
      finally
         FreeAndNil(CtrlCotaCotacao);
      end;
   end;
   Repaint;
end;


procedure TfrmPrincipal.mnuUtilExcluiPrimCotaEPClick(Sender: TObject);
begin
   if MsgDlg('Deseja realmente EXCLUIR as PRIMEIRAS cotações já calculadas? ',
             'Cotas', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
   begin
      CtrlParamCota.GetParams(Sistema.IdEmpresa);
      
      Repaint;

      CtrlCotaCotacao   := TCtrlCotaCotacao.Create;

      CtrlCotaCotacao.Initialize(DtmBaseDados.dbBaseDados,
                                 True,
                                 Sistema.ConnectionType,
                                 Sistema.ConnectionSide,
                                 Sistema.AppRemoteServer,
                                 True, nil, nil, False
                                );
      try
         if CtrlCotaCotacao.ApagaCotaPorSegmento(ttEmprestimo, CtrlParamCota.DtPrimeira, CtrlParamCota.DtPrimeira) then
         begin
            MsgDlg('Cotações excluídas.', 'Cotas', mtInformation, [mbOk], 0);
            Repaint;
         end
         else
         begin
            MsgDlg('ERRO ao excluir cotações!', 'Cotas', mtError, [mbOk], 0);
            Repaint;
         end;
      finally
         FreeAndNil(CtrlCotaCotacao);
      end;
   end;
   Repaint;
end;

procedure TfrmPrincipal.mnuUtilExcluiPrimCotaImobClick(Sender: TObject);
begin
   if MsgDlg('Deseja realmente EXCLUIR as PRIMEIRAS cotações já calculadas? ',
             'Cotas', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
   begin
      CtrlParamCota.GetParams(Sistema.IdEmpresa);
      
      Repaint;

      CtrlCotaCotacao   := TCtrlCotaCotacao.Create;

      CtrlCotaCotacao.Initialize(DtmBaseDados.dbBaseDados,
                                 True,
                                 Sistema.ConnectionType,
                                 Sistema.ConnectionSide,
                                 Sistema.AppRemoteServer,
                                 True, nil, nil, False
                                );

      try
         if CtrlCotaCotacao.ApagaCotaPorSegmento(ttImobiliario, CtrlParamCota.DtPrimeira, CtrlParamCota.DtPrimeira) then
         begin
            MsgDlg('Cotações excluídas.', 'Cotas', mtInformation, [mbOk], 0);
            Repaint;
         end
         else
         begin
            MsgDlg('ERRO ao excluir cotações!', 'Cotas', mtError, [mbOk], 0);
            Repaint;
         end;
      finally
         FreeAndNil(CtrlCotaCotacao);
      end;
   end;
   Repaint;
end;


procedure TfrmPrincipal.mnuUtilExcluiPrimCotaRFClick(Sender: TObject);
begin
   if MsgDlg('Deseja realmente EXCLUIR as PRIMEIRAS cotações já calculadas? ',
             'Cotas', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
   begin
      CtrlParamCota.GetParams(Sistema.IdEmpresa);
      
      Repaint;

      CtrlCotaCotacao   := TCtrlCotaCotacao.Create;

      CtrlCotaCotacao.Initialize(DtmBaseDados.dbBaseDados,
                                 True,
                                 Sistema.ConnectionType,
                                 Sistema.ConnectionSide,
                                 Sistema.AppRemoteServer,
                                 True, nil, nil, False
                                );

      try
         if CtrlCotaCotacao.ApagaCotaPorSegmento(ttRF, CtrlParamCota.DtPrimeira, CtrlParamCota.DtPrimeira) then
         begin
            MsgDlg('Cotações excluídas.', 'Cotas', mtInformation, [mbOk], 0);
            Repaint;
         end
         else
         begin
            MsgDlg('ERRO ao excluir cotações!', 'Cotas', mtError, [mbOk], 0);
            Repaint;
         end;
      finally
         FreeAndNil(CtrlCotaCotacao);
      end;
   end;
   Repaint;
end;

procedure TfrmPrincipal.mnuUtilExcluiPrimCotaRVClick(Sender: TObject);
begin
   if MsgDlg('Deseja realmente EXCLUIR as PRIMEIRAS cotações já calculadas? ',
             'Cotas', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
   begin
      CtrlParamCota.GetParams(Sistema.IdEmpresa);
      
      Repaint;

      CtrlCotaCotacao   := TCtrlCotaCotacao.Create;

      CtrlCotaCotacao.Initialize(DtmBaseDados.dbBaseDados,
                                 True,
                                 Sistema.ConnectionType,
                                 Sistema.ConnectionSide,
                                 Sistema.AppRemoteServer,
                                 True, nil, nil, False
                                );

      try
         if CtrlCotaCotacao.ApagaCotaPorSegmento(ttRV, CtrlParamCota.DtPrimeira, CtrlParamCota.DtPrimeira) then
         begin
            MsgDlg('Cotações excluídas.', 'Cotas', mtInformation, [mbOk], 0);
            Repaint;
         end
         else
         begin
            MsgDlg('ERRO ao excluir cotações!', 'Cotas', mtError, [mbOk], 0);
            Repaint;
         end;
      finally
         FreeAndNil(CtrlCotaCotacao);
      end;
   end;
   Repaint;
end;

procedure TfrmPrincipal.mnuUtilExcluiPrimCotaBMFClick(Sender: TObject);
begin
   if MsgDlg('Deseja realmente EXCLUIR as PRIMEIRAS cotações já calculadas? ',
             'Cotas', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
   begin
      CtrlParamCota.GetParams(Sistema.IdEmpresa);
      
      Repaint;

      CtrlCotaCotacao   := TCtrlCotaCotacao.Create;

      CtrlCotaCotacao.Initialize(DtmBaseDados.dbBaseDados,
                                 True,
                                 Sistema.ConnectionType,
                                 Sistema.ConnectionSide,
                                 Sistema.AppRemoteServer,
                                 True, nil, nil, False
                                );

      try
         if CtrlCotaCotacao.ApagaCotaPorSegmento(ttBMF, CtrlParamCota.DtPrimeira, CtrlParamCota.DtPrimeira) then
         begin
            MsgDlg('Cotações excluídas.', 'Cotas', mtInformation, [mbOk], 0);
            Repaint;
         end
         else
         begin
            MsgDlg('ERRO ao excluir cotações!', 'Cotas', mtError, [mbOk], 0);
            Repaint;
         end;
      finally
         FreeAndNil(CtrlCotaCotacao);
      end;
   end;
   Repaint;
end;

procedure TfrmPrincipal.mnuUtilExcluiPrimCotaFundoRFClick(Sender: TObject);
begin
   if MsgDlg('Deseja realmente EXCLUIR as PRIMEIRAS cotações já calculadas? ',
             'Cotas', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
   begin
      Repaint;

      CtrlCotaCotacao   := TCtrlCotaCotacao.Create;

      CtrlCotaCotacao.Initialize(DtmBaseDados.dbBaseDados,
                                 True,
                                 Sistema.ConnectionType,
                                 Sistema.ConnectionSide,
                                 Sistema.AppRemoteServer,
                                 True, nil, nil, False
                                );

      try
         if CtrlCotaCotacao.ApagaCotaPorSegmento(ttFundoRF, CtrlParamCota.DtPrimeira, CtrlParamCota.DtPrimeira) then
         begin
            MsgDlg('Cotações excluídas.', 'Cotas', mtInformation, [mbOk], 0);
            Repaint;
         end
         else
         begin
            MsgDlg('ERRO ao excluir cotações!', 'Cotas', mtError, [mbOk], 0);
            Repaint;
         end;
      finally
         FreeAndNil(CtrlCotaCotacao);
      end;
   end;
   Repaint;
end;

procedure TfrmPrincipal.mnuUtilExcluiPrimCotaFundoRVClick(Sender: TObject);
begin
   if MsgDlg('Deseja realmente EXCLUIR as PRIMEIRAS cotações já calculadas? ',
             'Cotas', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
   begin
      CtrlParamCota.GetParams(Sistema.IdEmpresa);
      
      Repaint;

      CtrlCotaCotacao   := TCtrlCotaCotacao.Create;

      CtrlCotaCotacao.Initialize(DtmBaseDados.dbBaseDados,
                                 True,
                                 Sistema.ConnectionType,
                                 Sistema.ConnectionSide,
                                 Sistema.AppRemoteServer,
                                 True, nil, nil, False
                                );

      try
         if CtrlCotaCotacao.ApagaCotaPorSegmento(ttFundoRV, CtrlParamCota.DtPrimeira, CtrlParamCota.DtPrimeira) then
         begin
            MsgDlg('Cotações excluídas.', 'Cotas', mtInformation, [mbOk], 0);
            Repaint;
         end
         else
         begin
            MsgDlg('ERRO ao excluir cotações!', 'Cotas', mtError, [mbOk], 0);
            Repaint;
         end;
      finally
         FreeAndNil(CtrlCotaCotacao);
      end;
   end;
   Repaint;
end;

procedure TfrmPrincipal.mnuUtilExcluiPrimCotaFundoImobClick(Sender: TObject);
begin
   if MsgDlg('Deseja realmente EXCLUIR as PRIMEIRAS cotações já calculadas? ',
             'Cotas', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
   begin
      CtrlParamCota.GetParams(Sistema.IdEmpresa);

      Repaint;

      CtrlCotaCotacao   := TCtrlCotaCotacao.Create;

      CtrlCotaCotacao.Initialize(DtmBaseDados.dbBaseDados,
                                 True,
                                 Sistema.ConnectionType,
                                 Sistema.ConnectionSide,
                                 Sistema.AppRemoteServer,
                                 True, nil, nil, False
                                );

      try
         if CtrlCotaCotacao.ApagaCotaPorSegmento(ttFundoImob, CtrlParamCota.DtPrimeira, CtrlParamCota.DtPrimeira) then
         begin
            MsgDlg('Cotações excluídas.', 'Cotas', mtInformation, [mbOk], 0);
            Repaint;
         end
         else
         begin
            MsgDlg('ERRO ao excluir cotações!', 'Cotas', mtError, [mbOk], 0);
            Repaint;
         end;
      finally
         FreeAndNil(CtrlCotaCotacao);
      end;
   end;
   Repaint;
end;

procedure TfrmPrincipal.mnuUtilExcluiPrimCotaFundoDICClick(Sender: TObject);
begin
   if MsgDlg('Deseja realmente EXCLUIR as PRIMEIRAS cotações já calculadas? ',
             'Cotas', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
   begin
      CtrlParamCota.GetParams(Sistema.IdEmpresa);
      
      Repaint;

      CtrlCotaCotacao   := TCtrlCotaCotacao.Create;

      CtrlCotaCotacao.Initialize(DtmBaseDados.dbBaseDados,
                                 True,
                                 Sistema.ConnectionType,
                                 Sistema.ConnectionSide,
                                 Sistema.AppRemoteServer,
                                 True, nil, nil, False
                                );

      try
         if CtrlCotaCotacao.ApagaCotaPorSegmento(ttFundoDIC, CtrlParamCota.DtPrimeira, CtrlParamCota.DtPrimeira) then
         begin
            MsgDlg('Cotações excluídas.', 'Cotas', mtInformation, [mbOk], 0);
            Repaint;
         end
         else
         begin
            MsgDlg('ERRO ao excluir cotações!', 'Cotas', mtError, [mbOk], 0);
            Repaint;
         end;
      finally
         FreeAndNil(CtrlCotaCotacao);
      end;
   end;
   Repaint;
end;

procedure TfrmPrincipal.mnuUtilExcluiCotaEPClick(Sender: TObject);
begin
   if MsgDlg('Deseja realmente EXCLUIR as cotações já calculadas? ',
             'Cotas', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
   begin
      Repaint;

      CtrlCotaCotacao   := TCtrlCotaCotacao.Create;

      CtrlCotaCotacao.Initialize(DtmBaseDados.dbBaseDados,
                                 True,
                                 Sistema.ConnectionType,
                                 Sistema.ConnectionSide,
                                 Sistema.AppRemoteServer,
                                 True, nil, nil, False
                                );

      try
         if CtrlCotaCotacao.ApagaCotaPorSegmento(ttEmprestimo, StrToDate('02/01/2004'), StrToDate('01/01/3001')) then
         begin
            MsgDlg('Cotações excluídas.', 'Cotas', mtInformation, [mbOk], 0);
            Repaint;
         end
         else
         begin
            MsgDlg('ERRO ao excluir cotações!', 'Cotas', mtError, [mbOk], 0);
            Repaint;
         end;
      finally
         FreeAndNil(CtrlCotaCotacao);
      end;
   end;
   Repaint;
end;

procedure TfrmPrincipal.mnuUtilExcluiCotaImobClick(Sender: TObject);
begin
   if MsgDlg('Deseja realmente EXCLUIR as cotações já calculadas? ',
             'Cotas', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
   begin
      Repaint;

      CtrlCotaCotacao   := TCtrlCotaCotacao.Create;

      CtrlCotaCotacao.Initialize(DtmBaseDados.dbBaseDados,
                                 True,
                                 Sistema.ConnectionType,
                                 Sistema.ConnectionSide,
                                 Sistema.AppRemoteServer,
                                 True, nil, nil, False
                                );

      try
         if CtrlCotaCotacao.ApagaCotaPorSegmento(ttImobiliario, StrToDate('02/01/2004'), StrToDate('01/01/3001')) then
         begin
            MsgDlg('Cotações excluídas.', 'Cotas', mtInformation, [mbOk], 0);
            Repaint;
         end
         else
         begin
            MsgDlg('ERRO ao excluir cotações!', 'Cotas', mtError, [mbOk], 0);
            Repaint;
         end;
      finally
         FreeAndNil(CtrlCotaCotacao);
      end;
   end;
   Repaint;
end;

procedure TfrmPrincipal.mnuUtilExcluiCotaRFClick(Sender: TObject);
begin
   if MsgDlg('Deseja realmente EXCLUIR as cotações já calculadas? ',
             'Cotas', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
   begin
      Repaint;

      CtrlCotaCotacao   := TCtrlCotaCotacao.Create;

      CtrlCotaCotacao.Initialize(DtmBaseDados.dbBaseDados,
                                 True,
                                 Sistema.ConnectionType,
                                 Sistema.ConnectionSide,
                                 Sistema.AppRemoteServer,
                                 True, nil, nil, False
                                );

      try
         if CtrlCotaCotacao.ApagaCotaPorSegmento(ttRF, StrToDate('02/01/2004'), StrToDate('01/01/3001')) then
         begin
            MsgDlg('Cotações excluídas.', 'Cotas', mtInformation, [mbOk], 0);
            Repaint;
         end
         else
         begin
            MsgDlg('ERRO ao excluir cotações!', 'Cotas', mtError, [mbOk], 0);
            Repaint;
         end;
      finally
         FreeAndNil(CtrlCotaCotacao);
      end;
   end;
   Repaint;
end;

procedure TfrmPrincipal.mnuUtilExcluiCotaRVClick(Sender: TObject);
begin
   if MsgDlg('Deseja realmente EXCLUIR as cotações já calculadas? ',
             'Cotas', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
   begin
      Repaint;

      CtrlCotaCotacao   := TCtrlCotaCotacao.Create;

      CtrlCotaCotacao.Initialize(DtmBaseDados.dbBaseDados,
                                 True,
                                 Sistema.ConnectionType,
                                 Sistema.ConnectionSide,
                                 Sistema.AppRemoteServer,
                                 True, nil, nil, False
                                );

      try
         if CtrlCotaCotacao.ApagaCotaPorSegmento(ttRV, StrToDate('02/01/2004'), StrToDate('01/01/3001')) then
         begin
            MsgDlg('Cotações excluídas.', 'Cotas', mtInformation, [mbOk], 0);
            Repaint;
         end
         else
         begin
            MsgDlg('ERRO ao excluir cotações!', 'Cotas', mtError, [mbOk], 0);
            Repaint;
         end;
      finally
         FreeAndNil(CtrlCotaCotacao);
      end;
   end;
   Repaint;
end;

procedure TfrmPrincipal.mnuUtilExcluiCotaBMFClick(Sender: TObject);
begin
   if MsgDlg('Deseja realmente EXCLUIR as cotações já calculadas? ',
             'Cotas', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
   begin
      Repaint;

      CtrlCotaCotacao   := TCtrlCotaCotacao.Create;

      CtrlCotaCotacao.Initialize(DtmBaseDados.dbBaseDados,
                                 True,
                                 Sistema.ConnectionType,
                                 Sistema.ConnectionSide,
                                 Sistema.AppRemoteServer,
                                 True, nil, nil, False
                                );

      try
         if CtrlCotaCotacao.ApagaCotaPorSegmento(ttBMF, StrToDate('02/01/2004'), StrToDate('01/01/3001')) then
         begin
            MsgDlg('Cotações excluídas.', 'Cotas', mtInformation, [mbOk], 0);
            Repaint;
         end
         else
         begin
            MsgDlg('ERRO ao excluir cotações!', 'Cotas', mtError, [mbOk], 0);
            Repaint;
         end;
      finally
         FreeAndNil(CtrlCotaCotacao);
      end;
   end;
   Repaint;
end;

procedure TfrmPrincipal.mnuUtilExcluiCotaFundoRFClick(Sender: TObject);
begin
   if MsgDlg('Deseja realmente EXCLUIR as cotações já calculadas? ',
             'Cotas', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
   begin
      Repaint;

      CtrlCotaCotacao   := TCtrlCotaCotacao.Create;

      CtrlCotaCotacao.Initialize(DtmBaseDados.dbBaseDados,
                                 True,
                                 Sistema.ConnectionType,
                                 Sistema.ConnectionSide,
                                 Sistema.AppRemoteServer,
                                 True, nil, nil, False
                                );

      try
         if CtrlCotaCotacao.ApagaCotaPorSegmento(ttFundoRF, StrToDate('02/01/2004'), StrToDate('01/01/3001')) then
         begin
            MsgDlg('Cotações excluídas.', 'Cotas', mtInformation, [mbOk], 0);
            Repaint;
         end
         else
         begin
            MsgDlg('ERRO ao excluir cotações!', 'Cotas', mtError, [mbOk], 0);
            Repaint;
         end;
      finally
         FreeAndNil(CtrlCotaCotacao);
      end;
   end;
   Repaint;
end;

procedure TfrmPrincipal.mnuUtilExcluiCotaFundoRVClick(Sender: TObject);
begin
   if MsgDlg('Deseja realmente EXCLUIR as cotações já calculadas? ',
             'Cotas', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
   begin
      Repaint;

      CtrlCotaCotacao   := TCtrlCotaCotacao.Create;

      CtrlCotaCotacao.Initialize(DtmBaseDados.dbBaseDados,
                                 True,
                                 Sistema.ConnectionType,
                                 Sistema.ConnectionSide,
                                 Sistema.AppRemoteServer,
                                 True, nil, nil, False
                                );

      try
         if CtrlCotaCotacao.ApagaCotaPorSegmento(ttFundoRV, StrToDate('02/01/2004'), StrToDate('01/01/3001')) then
         begin
            MsgDlg('Cotações excluídas.', 'Cotas', mtInformation, [mbOk], 0);
            Repaint;
         end
         else
         begin
            MsgDlg('ERRO ao excluir cotações!', 'Cotas', mtError, [mbOk], 0);
            Repaint;
         end;
      finally
         FreeAndNil(CtrlCotaCotacao);
      end;
   end;
   Repaint;
end;

procedure TfrmPrincipal.mnuUtilExcluiCotaFundoImobClick(Sender: TObject);
begin
   if MsgDlg('Deseja realmente EXCLUIR as cotações já calculadas? ',
             'Cotas', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
   begin
      Repaint;

      CtrlCotaCotacao   := TCtrlCotaCotacao.Create;

      CtrlCotaCotacao.Initialize(DtmBaseDados.dbBaseDados,
                                 True,
                                 Sistema.ConnectionType,
                                 Sistema.ConnectionSide,
                                 Sistema.AppRemoteServer,
                                 True, nil, nil, False
                                );

      try
         if CtrlCotaCotacao.ApagaCotaPorSegmento(ttFundoImob, StrToDate('02/01/2004'), StrToDate('01/01/3001')) then
         begin
            MsgDlg('Cotações excluídas.', 'Cotas', mtInformation, [mbOk], 0);
            Repaint;
         end
         else
         begin
            MsgDlg('ERRO ao excluir cotações!', 'Cotas', mtError, [mbOk], 0);
            Repaint;
         end;
      finally
         FreeAndNil(CtrlCotaCotacao);
      end;
   end;
   Repaint;
end;

procedure TfrmPrincipal.mnuUtilExcluiCotaFundoDICClick(Sender: TObject);
begin
   if MsgDlg('Deseja realmente EXCLUIR as cotações já calculadas? ',
             'Cotas', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
   begin
      Repaint;

      CtrlCotaCotacao   := TCtrlCotaCotacao.Create;

      CtrlCotaCotacao.Initialize(DtmBaseDados.dbBaseDados,
                                 True,
                                 Sistema.ConnectionType,
                                 Sistema.ConnectionSide,
                                 Sistema.AppRemoteServer,
                                 True, nil, nil, False
                                );

      try
         if CtrlCotaCotacao.ApagaCotaPorSegmento(ttFundoDIC, StrToDate('02/01/2004'), StrToDate('01/01/3001')) then
         begin
            MsgDlg('Cotações excluídas.', 'Cotas', mtInformation, [mbOk], 0);
            Repaint;
         end
         else
         begin
            MsgDlg('ERRO ao excluir cotações!', 'Cotas', mtError, [mbOk], 0);
            Repaint;
         end;
      finally
         FreeAndNil(CtrlCotaCotacao);
      end;
   end;
   Repaint;
end;

// -------------------------------------------------------------------------------------------------
// -------------------------------------------------------------------------------------------------
// -------------------------------------------------------------------------------------------------
// -------------------------------------------------------------------------------------------------
// -------------------------------------------------------------------------------------------------



procedure TfrmPrincipal.AppPadraoCreateFormReports(Sender: TObject);
begin
   inherited;

   Application.CreateForm(TdtmRelPerfilConsolidado, dtmRelPerfilConsolidado);
   Application.CreateForm(TdtmRelParamAtivo, dtmRelParamAtivo);
   Application.CreateForm(TdtmRelMovCota, dtmRelMovCota);

end;



// -------------------------------------------------------------------------------------------------
// -------------------------------------------------------------------------------------------------
// -------------------------------------------------------------------------------------------------
// -------------------------------------------------------------------------------------------------
// -------------------------------------------------------------------------------------------------




procedure TfrmPrincipal.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;

  FreeAndNil(CtrlParamCota);
end;

initialization

   Sistema.NomeModulo      := 'Cotas';             // Nome do Módulo
   Sistema.IdModulo        := 545;                 // IdModulo cadastrado no SAD
   Sistema.Versao := '3.18.01c';
   Sistema.NomeAplicativo  := 'Controle de Cotas & Informações SPC'; // e Informações SPC;


finalization


end.

{
Configuração 							Tag
	Parâmetros do sistema						545001
							
Utilitários							
	Exporta DAIEA						545002
	Importa Lançamentos						545003
	Exclui Cotas						
		Exclui Todas as Cotas Calculadas					545004
		Primeira Cotas					
				Empréstimo			545005
				Imobiliário			545006
				Renda Fixa			545007
				Renda Variável			545008
				BM&F			545009
				Fundos de Renda Fixa			545010
				Fundos de Renda Variável			545011
				Fundos Imobiliários			545012
				Fundos de Direito Creditório			545013
Cadastros							
	Carteira SPC						545014
	Ativos						545015
	Perfil						545016
	Parâmetros para Movimentação						
			Empréstimo 				545017
			Imobiliário				545018
			Investimento				545019
Movimentações Manuais							
	Receitas e Despesas Para Lançamento Manual						545020
	Primeira Cota						545021
	Lançamento de Movimentações						545022
Cálculo de Cotas							
	Cálculo da Primeira Cota						545023
	Cálculo de Cotas						545024
	Fechamento de Período						545025
	Perfil Consolidado						545026

}
