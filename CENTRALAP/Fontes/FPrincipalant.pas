(*******************************************************************************
 Analista Responsável: Gustavo Viegas
 - Atualizado em 13/09/2000
 - 14/10/2000
   Alterações nos menus Cadastros\RUBS;
   Implementação do Relacionamento Termos X Benefícios
*******************************************************************************)

unit FPrincipal;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Menus, Wwintl, ExtCtrls, Buttons,  ComCtrls, FCMPrincipal, TB97,
  Db, Wwdatsrc, DBTables, Wwquery, wwdblook, StdCtrls, Mask, wwdbedit,
  DBCtrls, TB97Tlwn, TB97Tlbr, TB97Ctls, IvDictio, IvAMulti, IvBinDic,
  IvMulti, IvEMulti, CorreioCM, UDataBase, fcLabel, fcOutlookList,
  fcButton, fcImgBtn, fcShapeBtn, fcClearPanel, fcButtonGroup, fcOutlookBar,
  ftelaAut, uMensErro, uRubs, AppEvnts, CMApplicationEvents, StdActns,
  ActnList, ImgList, fcStatusBar, MontaSelect, UConsPart;

type
  TfrmPrincipal = class(TfrmCMPrincipal)
    Atendimento1: TMenuItem;
    Assunto1: TMenuItem;
    FormadeAtendimento1: TMenuItem;
    EstatsticadeAtendimentos1: TMenuItem;
    Atendimentos1: TMenuItem;
    Previdencirio1: TMenuItem;
    Assistencial1: TMenuItem;
    Emprstimo1: TMenuItem;
    FolhadePagamento1: TMenuItem;
    Inscrio1: TMenuItem;
    Contrato1: TMenuItem;
    N5: TMenuItem;
    SimulaodeParcelas1: TMenuItem;
    Inscrio2: TMenuItem;
    N6: TMenuItem;
    ContribuiesdoParticipante1: TMenuItem;
    ConsultadeEventos1: TMenuItem;
    EstimativadeContribuies1: TMenuItem;
    N7: TMenuItem;
    RelatriodePartcicpantesAssistenciais1: TMenuItem;
    N8: TMenuItem;
    ConsultadeContribuiesdoParticipante1: TMenuItem;
    EstimativadeBenefcios1: TMenuItem;
    ConsultadeBenefciosdoParticipante1: TMenuItem;
    N9: TMenuItem;
    ContraCheque1: TMenuItem;
    EstatsticadeMassa1: TMenuItem;
    N10: TMenuItem;
    RelatriodeParticipantesemDbito1: TMenuItem;
    BeneficirioseContribuies1: TMenuItem;
    N11: TMenuItem;
    ConsultadeBenefcios1: TMenuItem;
    ConsultaderubricassalariaisdeAssistidos1: TMenuItem;
    Coonsultaderubricassalariais1: TMenuItem;
    EstatsticadeMassa2: TMenuItem;
    Inscrio3: TMenuItem;
    qry: TwwQuery;
    ConsultadeHistricodeMovimentaodeReservas1: TMenuItem;
    ExtratodeReservas1: TMenuItem;
    N3: TMenuItem;
    FormatodeDocumentosdaRUB1: TMenuItem;
    DocumentosporBenefcios1: TMenuItem;
    TiposdeRecebimentos1: TMenuItem;
    SituaodoBeneficionaRUB1: TMenuItem;
    BenefcioXSituao1: TMenuItem;
    N4: TMenuItem;
    N12: TMenuItem;
    Ca1: TMenuItem;
    CadastrodeDocumentos1: TMenuItem;
    N13: TMenuItem;
    BtnAtende: TToolbarButton97;
    ToolbarSep971: TToolbarSep97;
    TotalPrev1: TMenuItem;
    LocaisdeAtendimento1: TMenuItem;
    RespostasPadro1: TMenuItem;
    MnuGrupoAssunto: TMenuItem;
    MnuRubs: TMenuItem;
    MnuSep2: TMenuItem;
    MnuOperacoes: TMenuItem;
    MnuOperacoesRubs: TMenuItem;
    Manuteno1: TMenuItem;
    CartadeAviso1: TMenuItem;
    Configurao1: TMenuItem;
    Emisso2: TMenuItem;
    MnuConsRubs: TMenuItem;
    TipodeArquivosXPatrocinadoraXPlanoXBenefcioXSituao1: TMenuItem;
    N14: TMenuItem;
    N15: TMenuItem;
    ParmetrosdeEmisso1: TMenuItem;
    TemoXDocumento1: TMenuItem;
    ToolbarButton971: TToolbarButton97;
    f1: TMenuItem;
    N1: TMenuItem;
    Assunto2: TMenuItem;
    ComplementodoAssunto1: TMenuItem;
    Firio1: TMenuItem;
    Firio2: TMenuItem;
    DescriodoBenefcio1: TMenuItem;
    MontaSelectPart: TMontaSelect;
    ConsPart1: TConsPart;
    procedure Inscrio1Click(Sender: TObject);
    procedure Assunto1Click(Sender: TObject);
    procedure FormadeAtendimento1Click(Sender: TObject);
    procedure EstimativadeBenefcios1Click(Sender: TObject);
    procedure EstatsticadeAtendimentos1Click(Sender: TObject);
    procedure Atendimentos1Click(Sender: TObject);
    procedure RelatriodeContribuies1Click(Sender: TObject);
    procedure EstatsticadeMassa1Click(Sender: TObject);
    procedure RelatriodeParticipantesemDbito1Click(Sender: TObject);
    procedure Inscrio2Click(Sender: TObject);
    procedure EstimativadeContribuies1Click(Sender: TObject);
    procedure BeneficirioseContribuies1Click(Sender: TObject);
    procedure ContribuiesdoParticipante1Click(Sender: TObject);
    procedure ConsultadeEventos1Click(Sender: TObject);
    procedure RelatriodePartcicpantesAssistenciais1Click(Sender: TObject);
    procedure nmuConfigParametrosClick(Sender: TObject);
    procedure ConsultadeBenefcios1Click(Sender: TObject);
    procedure ConsultaderubricassalariaisdeAssistidos1Click(
      Sender: TObject);
    procedure Coonsultaderubricassalariais1Click(Sender: TObject);
    procedure ContraCheque1Click(Sender: TObject);
    procedure Contrato1Click(Sender: TObject);
    procedure SimulaodeParcelas1Click(Sender: TObject);
    procedure EstatsticadeMassa2Click(Sender: TObject);
    procedure Inscrio3Click(Sender: TObject);
    procedure ConsultadeContribuiesdoParticipante1Click(Sender: TObject);
    procedure ConsultadeBenefciosdoParticipante1Click(Sender: TObject);
    procedure ConsultadeHistricodeMovimentaodeReservas1Click(
      Sender: TObject);
    procedure ExtratodeReservas1Click(Sender: TObject);
    procedure DocumentosporBenefcios1Click(Sender: TObject);
    procedure TiposdeRecebimentos1Click(Sender: TObject);
    procedure SituaodoBeneficionaRUB1Click(Sender: TObject);
    procedure BenefcioXSituao1Click(Sender: TObject);
    procedure Ca1Click(Sender: TObject);
    procedure CadastrodeDocumentos1Click(Sender: TObject);
    procedure Atendimento1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure LocaisdeAtendimento1Click(Sender: TObject);
    procedure RespostasPadro1Click(Sender: TObject);
    procedure FormatodeDocumentosdaRUB1Click(Sender: TObject);
    procedure MnuGrupoAssuntoClick(Sender: TObject);
    procedure Manuteno1Click(Sender: TObject);
    procedure Configurao1Click(Sender: TObject);
    procedure TipodeArquivosXPatrocinadoraXPlanoXBenefcioXSituao1Click(
      Sender: TObject);
    procedure MnuConsRubsClick(Sender: TObject);
    procedure ParmetrosdeEmisso1Click(Sender: TObject);
    procedure TemoXDocumento1Click(Sender: TObject);
    procedure mnuCadastroClick(Sender: TObject);
    procedure AppPadraoAfterLogin(Sender: TObject);
    procedure AppPadraoCreateFormReports(Sender: TObject);
    procedure Assunto2Click(Sender: TObject);
    procedure ComplementodoAssunto1Click(Sender: TObject);
    procedure Firio1Click(Sender: TObject);
    procedure MnuOperacoesClick(Sender: TObject);
    procedure mnuConsultaClick(Sender: TObject);
    procedure Firio2Click(Sender: TObject);
    procedure DescriodoBenefcio1Click(Sender: TObject);
    procedure MnuConsPart_PadraoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;


implementation

uses DBaseDados, uString, umoduloCap, fCadAssunto,
     fformaatend, FGrafAtend, Fconsatend, FAtend, FCadLocalidades,
     FCadRespostaPadrao, FDocxBenef, FCadRecebimento, FCadSitBenef,
     FBenefxSituacao, FCadServicos, FCadDocumentos, uSistema, uModulo,
     FCadModeloRub, fCadGrupoAssunto, fManutRubs, fConfigCartaAviso,
     uAtendimento, FTermosxBenef, ftermoxdoc1, dRelCentralAP,
     FCADASTROASSUNTO, FCADCOMPASSUNTO, FMOVFIARIO, fconsultafiario,
     fbenefrubs, FParamCentralAP;

{$R *.DFM}

procedure TfrmPrincipal.Inscrio1Click(Sender: TObject);
begin
  inherited;

  
end;

procedure TfrmPrincipal.Assunto1Click(Sender: TObject);
begin
  inherited;
  AbrirForm( frmCadAssunto, TfrmCadAssunto,false);
end;

procedure TfrmPrincipal.FormadeAtendimento1Click(Sender: TObject);
begin
  inherited;
  AbrirForm(  frmformaatend , TfrmformaAtend , false );
end;

procedure TfrmPrincipal.EstimativadeBenefcios1Click(Sender: TObject);
begin
  inherited;

end;

procedure TfrmPrincipal.EstatsticadeAtendimentos1Click(Sender: TObject);
begin
  inherited;
  AbrirForm ( frmGrafAtend, TfrmGrafAtend, false );
end;

procedure TfrmPrincipal.Atendimentos1Click(Sender: TObject);
begin
  inherited;
  AbrirForm( frmConsAtend, TfrmConsAtend, false);
end;

procedure TfrmPrincipal.RelatriodeContribuies1Click(Sender: TObject);
begin
  inherited;

end;

procedure TfrmPrincipal.EstatsticadeMassa1Click(Sender: TObject);
begin
  inherited;

end;

procedure TfrmPrincipal.RelatriodeParticipantesemDbito1Click(
  Sender: TObject);
begin
  inherited;

end;

procedure TfrmPrincipal.Inscrio2Click(Sender: TObject);
begin
  inherited;

end;

procedure TfrmPrincipal.EstimativadeContribuies1Click(Sender: TObject);
begin
  inherited;

end;

procedure TfrmPrincipal.BeneficirioseContribuies1Click(Sender: TObject);
begin
  inherited;

end;

procedure TfrmPrincipal.ContribuiesdoParticipante1Click(Sender: TObject);
begin
  inherited;

end;

procedure TfrmPrincipal.ConsultadeEventos1Click(Sender: TObject);
begin
  inherited;

end;

procedure TfrmPrincipal.RelatriodePartcicpantesAssistenciais1Click(
  Sender: TObject);
begin
  inherited;

end;

procedure TfrmPrincipal.nmuConfigParametrosClick(Sender: TObject);
begin
  inherited;
  AbrirForm(frmParamCentralAP, TfrmParamCentralAP,false);
end;

procedure TfrmPrincipal.ConsultadeBenefcios1Click(Sender: TObject);
begin
  inherited;

end;

procedure TfrmPrincipal.ConsultaderubricassalariaisdeAssistidos1Click(
  Sender: TObject);
begin
  inherited;

end;

procedure TfrmPrincipal.Coonsultaderubricassalariais1Click(
  Sender: TObject);
begin
  inherited;

end;

procedure TfrmPrincipal.ContraCheque1Click(Sender: TObject);
begin                                                      
  inherited;

end;

procedure TfrmPrincipal.Contrato1Click(Sender: TObject);
begin
  inherited;

end;

procedure TfrmPrincipal.SimulaodeParcelas1Click(Sender: TObject);
begin
  inherited;

end;

procedure TfrmPrincipal.EstatsticadeMassa2Click(Sender: TObject);
begin
  inherited;

end;

procedure TfrmPrincipal.Inscrio3Click(Sender: TObject);
begin
  inherited;

end;

procedure TfrmPrincipal.ConsultadeContribuiesdoParticipante1Click(
  Sender: TObject);
begin
  inherited;

end;

procedure TfrmPrincipal.ConsultadeBenefciosdoParticipante1Click(
  Sender: TObject);
begin
  inherited;

end;

procedure TfrmPrincipal.ConsultadeHistricodeMovimentaodeReservas1Click(
  Sender: TObject);
begin
  inherited;

end;

procedure TfrmPrincipal.ExtratodeReservas1Click(Sender: TObject);
begin
  inherited;

end;

procedure TfrmPrincipal.DocumentosporBenefcios1Click(Sender: TObject);
begin
  inherited;
  AbrirForm(FrmDocxBenef, TFrmDocxBenef, false);
end;

procedure TfrmPrincipal.TiposdeRecebimentos1Click(Sender: TObject);
begin
  inherited;
  AbrirForm(FrmCadTpRecebXCancelamento, TFrmCadTpRecebXCancelamento, false);
end;

procedure TfrmPrincipal.SituaodoBeneficionaRUB1Click(Sender: TObject);
begin
  inherited;
  AbrirForm(FrmCadSitBenef, TFrmCadSitBenef, false);
end;

procedure TfrmPrincipal.BenefcioXSituao1Click(Sender: TObject);
begin
  inherited;
  AbrirForm(FrmBenefxSituacao, TFrmBenefxSituacao, false);
end;

procedure TfrmPrincipal.Ca1Click(Sender: TObject);
begin
  inherited;
  AbrirForm(FrmCadServicos, TFrmCadServicos, false);
end;

procedure TfrmPrincipal.CadastrodeDocumentos1Click(Sender: TObject);
begin
  inherited;
  AbrirForm(FrmCadDocumentos, TFrmCadDocumentos, false);
end;


procedure TfrmPrincipal.Atendimento1Click(Sender: TObject);
begin
  inherited;
  If ModuloCap.IdLocaAtendxCpu = 0 Then
     MsgDlg('Este Computador não está autenticado para atendimento','Atenção',mtError,[mbOk],0)
  Else
     AbrirForm (frmAtend , TfrmAtend , false);
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
  inherited;

end;

procedure TfrmPrincipal.LocaisdeAtendimento1Click(Sender: TObject);
begin
  inherited;
  AbrirForm (FrmCadLocalidades , TFrmCadLocalidades , false);
end;

procedure TfrmPrincipal.RespostasPadro1Click(Sender: TObject);
begin
  inherited;
  AbrirForm (FrmCadRespostaPadrao , TFrmCadRespostaPadrao , false);
end;

procedure TfrmPrincipal.FormatodeDocumentosdaRUB1Click(Sender: TObject);
begin
  inherited;
  AbrirForm (FrmCadModeloRub , TFrmCadModeloRub , false);
end;

procedure TfrmPrincipal.MnuGrupoAssuntoClick(Sender: TObject);
begin
  inherited;
  AbrirForm (FrmCadGrupoAssunto , TFrmCadGrupoAssunto , false);
end;

procedure TfrmPrincipal.Manuteno1Click(Sender: TObject);
begin
  inherited;
  AbrirForm (frmManutRubs , TfrmManutRubs , false);
  frmManutRubs.ConfiguraConsulta(False);
end;

procedure TfrmPrincipal.Configurao1Click(Sender: TObject);
begin
  inherited;
  AbrirForm (frmConfigCartaAviso , TfrmConfigCartaAviso , false);
  frmConfigCartaAviso.HabilitaImpressao((Sender As TMenuItem).Tag = 1);
end;

procedure TfrmPrincipal.TipodeArquivosXPatrocinadoraXPlanoXBenefcioXSituao1Click(
  Sender: TObject);
begin
  inherited;
  AbrirForm (FrmTermosxBenef , TFrmTermosxBenef , false);
end;

procedure TfrmPrincipal.MnuConsRubsClick(Sender: TObject);
begin
  inherited;
  AbrirForm (frmManutRubs , TfrmManutRubs , false);
  frmManutRubs.ConfiguraConsulta(True);
end;

procedure TfrmPrincipal.ParmetrosdeEmisso1Click(Sender: TObject);
begin
  inherited;
  Rubs.GetComplementosRUBS;
end;

procedure TfrmPrincipal.TemoXDocumento1Click(Sender: TObject);
begin
  inherited;
 AbrirForm (FrmTermoxDco1 , TFrmTermoxDco1 , false);
end;

procedure TfrmPrincipal.mnuCadastroClick(Sender: TObject);
begin
  inherited;


end;

procedure TfrmPrincipal.AppPadraoAfterLogin(Sender: TObject);
Var
  cComputerName :Array [0..255] of char;
  sComputerName :String;
  nsize :Cardinal;
begin
  inherited;
  If Sistema.FezLogin Then
  Begin
    ModuloCap.IdLocaAtendxCpu := 0;

    nsize := MAX_COMPUTERNAME_LENGTH + 1;
    GetComputerName(cComputerName,nsize);
     sComputerName := (cComputerName);
    If FazQuery(DtmBaseDados.Qry,'SELECT X.IDLOCALATENDXCPU, LA.IDTIPOATEND ' +
                                 ' FROM LOCALATENDXCPU X, CPUATEND C, LOCALATEND LA ' +
                                 ' WHERE ' +
                                 '  (UPPER(C.DESCCPUATEND) = UPPER('''+ sComputerName + ''')) AND (LA.IDLOCALATEND = X.IDLOCALATEND) AND ' +
                                 '  (X.IDCPUATEND = C.IDCPUATEND)') Then
    Begin
       ModuloCap.IdLocaAtendxCpu := DtmBaseDados.Qry.Fields[0].AsInteger;
       ModuloCap.IdTipoAtend := DtmBaseDados.Qry.Fields[1].AsInteger;
       BtnAtende.Enabled := Atendimento1.Enabled;

       If BtnAtende.Enabled Then BtnAtende.Click;
    End
    Else
    Begin
       MsgDlg('Este Computador não está autenticado para atendimento','Atenção',mtError,[mbOk],0);
    End;
    Rubs.SetParamEmissao;
  End;
  MnuConsPart_Padrao.Visible := True;
end;

procedure TfrmPrincipal.AppPadraoCreateFormReports(Sender: TObject);
begin
  inherited;
  Application.CreateForm(TdtmRelCentralAP,dtmRelCentralAP);
end;

procedure TfrmPrincipal.Assunto2Click(Sender: TObject);
begin
  inherited;
 AbrirForm (Frmcadastroassunto , TFrmcadastroassunto , false);
end;

procedure TfrmPrincipal.ComplementodoAssunto1Click(Sender: TObject);
begin
  inherited;
AbrirForm (FRMCADCOMPLASSUNTO  , TFRMCADCOMPLASSUNTO  , false);
end;

procedure TfrmPrincipal.Firio1Click(Sender: TObject);
begin
  inherited;
  AbrirForm (FRMMOVFIARIO  , TFRMMOVFIARIO , false);
end;

procedure TfrmPrincipal.MnuOperacoesClick(Sender: TObject);
begin
  inherited;

end;

procedure TfrmPrincipal.mnuConsultaClick(Sender: TObject);
begin
  inherited;

end;

procedure TfrmPrincipal.Firio2Click(Sender: TObject);
begin
  inherited;
 AbrirForm (Frmconsultafiario  , TFrmconsultafiario , false)
end;

procedure TfrmPrincipal.DescriodoBenefcio1Click(Sender: TObject);
begin
  inherited;
 AbrirForm (Frmbenefrub  , TFrmbenefrub , false)
end;

procedure TfrmPrincipal.MnuConsPart_PadraoClick(Sender: TObject);
begin
  MontaSelectPart.Filtro[4] := 'PLANPREV.TPPLANOPREV =  ' + '''F''';
  MontaSelectPart.Executar;
  if (MontaSelectPart.ValoresChave.Count > 0) and (MontaSelectPart.ValoresChave[0] <> '')
  then begin
     // Consulta Participante
     ConsPart1.sIdPessoa    := MontaSelectPart.ValoresChave[0];
     ConsPart1.sIdPessjur   := MontaSelectPart.ValoresChave[1];
     ConsPart1.sIdPlanoprev := MontaSelectPart.ValoresChave[2];
     ConsPart1.sSeqProposta := MontaSelectPart.ValoresChave[6];
     ConsPart1.DataBaseName := 'BaseDados';

     ConsPart1.MostraConsulta;
  end;

end;

initialization

   Sistema.NomeModulo := 'Central de Atendimentos';
   Sistema.IdModulo := 19 ;
   Sistema.Versao := '3.01.19';
   Sistema.NomeAplicativo := 'Central de Atendimento ao Público';
   Modulo := TModulo.Create  ;
   ModuloCap := TModuloCap.Create  ;

   Rubs := TRubs.Create;

finalization
   Modulo.free;
   ModuloCap.Free;
   Rubs.Free;

end.




