//************************************************************************************************//
// Data      : 12/08/2005
// Código    : AL_2
// Descrição : Inversão dos combos Plano e Patrocinadora (Posição na Tela) (DFM)
//************************************************************************************************//
// Data      : 04/08/2005
// Código    : AL_1
// Descrição : Implementação de radio para seleção de relatório expandido ou não
//************************************************************************************************//
unit cRelMovCota;

interface

uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   CRel, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr,
   TB97, ExtCtrls, fcCombo, fcColorCombo, wwdbdatetimepicker, wwdblook,
   CMDBLookupCombo, mAtivoCota, uSistema, dBaseDados, uCtrlHstMovCota, MontaSelect,
   Db, DBClient, uTypesCota, uCtrlPlanPrevContabPatro, uCtrlCotaCotacao,
   uCMClientDataSet, uCtrlPadroes;

type
   TcfgRelMovCota = class(TcfgRel)
      GroupBox1: TGroupBox;
      chkCorLinha: TCheckBox;
      cboCorLinha: TfcColorCombo;
      chkLinhas: TCheckBox;
      GroupBox3: TGroupBox;
      Label5: TLabel;
      Label6: TLabel;
      edtDataIni: TwwDBDateTimePicker;
      edtDataFim: TwwDBDateTimePicker;
      Label4: TLabel;
      DBcboPlano: TCMDBLookupCombo;
      Label1: TLabel;
      DBcboPatro: TCMDBLookupCombo;
      molAtivoCota1: TmolAtivoCota;
      MontaSelect: TMontaSelect;
      CdsPlano: TCMClientDataSet;
      CdsPatro: TCMClientDataSet;
    chkExpandido: TCheckBox;

      procedure molAtivoCota1btnBuscaContratoClick(Sender: TObject);
      procedure FormCreate(Sender: TObject);
      procedure DBcboPlanoEnter(Sender: TObject);
      procedure DBcboPatroEnter(Sender: TObject);
      procedure bbtnConfirmarClick(Sender: TObject);


   private  // Private declarations

      CtrlHstMovCota : TCtrlHstMovCota;
      CtrlPlanPrevContabPatro: TCtrlPlanPrevContabPatro;
      CtrlCotaCotacao : TCtrlCotaCotacao;

      procedure MensErroMt (sMsgInfo: string);

      function VerificaPreenchimento: boolean;


   public   // Public declarations


   end;



var
  cfgRelMovCota: TcfgRelMovCota;



implementation
{$R *.DFM}
uses
   uMensErro, dRelMovCota, uVerificaPreenchimento;



function TcfgRelMovCota.VerificaPreenchimento: boolean;
begin
   Result := False;

   try
      if molAtivoCota1.edtDescAtivo.Text = '' then
         raise EValidacao.CreateVal('O campo ''DESCRIÇÃO'' não pode estar em branco!', molAtivoCota1.edtDescAtivo);
      if DBcboPlano.Text = '' then
         raise EValidacao.CreateVal('O campo ''PLANO'' não pode estar em branco!', DBcboPlano);
      if DBcboPatro.Text = '' then
         raise EValidacao.CreateVal('O campo ''PATRO'' não pode estar em branco!', DBcboPatro);
      if edtDataIni.Text = '' then
         raise EValidacao.CreateVal('O campo ''DATA INICIAL'' não pode estar em branco!', edtDataIni);
      if edtDataFim.Text = '' then
         raise EValidacao.CreateVal('O campo ''DATA FINAL'' não pode estar em branco!', edtDataFim);
      if edtDataIni.Date > edtDataFim.Date then
         raise EValidacao.CreateVal('A data inicial não pode ser maior que a data final!', edtDataIni);

      
   except

      on ev : EValidacao do
      begin
         if ev.Show then MsgDlg(ev.message, 'Aviso', mtWarning, [mbOk], 0);
         Repaint;
         if ev.Control.CanFocus then ev.Control.SetFocus;
         Exit;
      end;
   end;

   Result := True;
end;



procedure TcfgRelMovCota.molAtivoCota1btnBuscaContratoClick(Sender: TObject);
begin
   inherited;

   MontaSelect.Executar;

   if MontaSelect.RetornouValor then
   begin
     molAtivoCota1.edtDescAtivo.Text := montaselect.ValoresChave[1];

   end;
end;




procedure TcfgRelMovCota.FormCreate(Sender: TObject);
begin
   CtrlHstMovCota :=  TCtrlHstMovCota.Create;

   CtrlHstMovCota.Initialize (dtmBaseDados.dbBaseDados,true, Sistema.ConnectionType,
                                Sistema.ConnectionSide, Sistema.AppRemoteServer, true,
                                MensErroMT);

   CtrlPlanPrevContabPatro := TCtrlPlanPrevContabPatro.Create;
   CtrlPlanPrevContabPatro.InitializeAs(CtrlHstMovCota);

   CtrlCotaCotacao := TCtrlCotaCotacao.Create;
   CtrlCotaCotacao.InitializeAs(CtrlHstMovCota);


   inherited;
end;



procedure TcfgRelMovCota.MensErroMt(sMsgInfo: string);
begin
   MsgDlg(sMsgInfo, Sistema.NomeAplicativo, mtWarning,[mbOk],0);
end;


procedure TcfgRelMovCota.DBcboPlanoEnter(Sender: TObject);
begin
   inherited;

   if DBcboPatro.Text = '' then
      cdsPlano.Data := CtrlHstMovCota.ListaPlanoContabil
   else
      cdsPlano.Data := CtrlPlanPrevContabPatro.ListaPlanoPatro(-1,CdsPatro.FieldByName('IDPATRO').AsInteger,-1);
end;



procedure TcfgRelMovCota.DBcboPatroEnter(Sender: TObject);
begin
   inherited;

   // AL_2
   if Trim(DBcboPatro.Text) = '' then
      CdsPatro.Data := CtrlHstMovCota.ListaPatro;
end;


procedure TcfgRelMovCota.bbtnConfirmarClick(Sender: TObject);
var
   iFlgOrigemAtivo   : Integer;
   iIdAtivo          : Integer;
   iIdPlano          : Integer;
   iIdPatro          : Integer;
   dDtInicio         : TDateTime;
   dDtFim            : TDateTime;
begin
   if VerificaPreenchimento then
   begin
      dtmRelMovCota.LbDtInicio.Caption := edtDataIni.Text;
      dtmRelMovCota.LbDtFim.Caption    := edtDataFim.Text;
      dtmRelMovCota.ppLbAtivo.Caption  := MontaSelect.ValoresChave[1];
      dtmRelMovCota.ppLbPlano.Caption  := DBcboPlano.Text;
      dtmRelMovCota.ppLbPatro.Caption  := DBcboPatro.Text;
      dtmRelMovCota.CorLinha           := cboCorLinha.SelectedColor;
      dtmRelMovCota.bCorLinha          := chkCorLinha.Checked;
      dtmRelMovCota.bSeparador         := chkLinhas.Checked;

      iIdAtivo        := StrToInt(MontaSelect.ValoresChave[0]);
      iIdPlano        := CdsPlano.FieldByName('IDPLANOPREV').AsInteger;
      iIdPatro        := CdsPatro.FieldByName('IDPATRO').AsInteger;
      iFlgOrigemAtivo := StrToInt(MontaSelect.ValoresChave[2]);
      dDtInicio       := edtDataIni.Date;
      dDtFim          := edtDataFim.Date;

      dtmRelMovCota.CdsMovCota.Data := CtrlHstMovCota.FiltraRelatorio(iIdAtivo,iIdPlano,iIdPatro,dDtInicio,dDtFim);

//      Tabela de Identificação de Origem-Ativos
//      ========================================
//
//      1  - Ativo Manual
//      2  - Empréstimo
//      3  - Imobiliario
//      4  - Investimento RF
//      5  - Investimento RV
//      6  - Investimento Imobiliario
//      8  - Investimento BM&F
//      9  - Fundo de Investimento RF
//      10 - Fundo de Investimento RV
//      11 - Fundo de Investimento Imobiliario
//      12 - Fundo de Investimento DIC
//      13 - Carteira SPC

      case iFlgOrigemAtivo of

         // Ativo Manual
         1: dtmRelMovCota.CdsSub.Data := CtrlHstMovCota.MovCotaAtivoManual(iIdAtivo,iIdPlano,iIdPatro,dDtInicio,dDtFim);

         // Empréstimo
         2: dtmRelMovCota.CdsSub.Data := CtrlHstMovCota.MovCotaEmprestimo(iIdAtivo,iIdPlano,iIdPatro,dDtInicio,dDtFim);

         // Imobiliário
         3: dtmRelMovCota.CdsSub.Data := CtrlHstMovCota.MovCotaAtivoImobiliario(iIdAtivo,iIdPlano,iIdPatro,dDtInicio,dDtFim);

         // Investimento - Renda Fixa
         4: dtmRelMovCota.CdsSub.Data := CtrlHstMovCota.MovCotaAtivoInvestRendaFixa(iIdAtivo,iIdPlano,iIdPatro,dDtInicio,dDtFim);

         // Investimento - Renda Variável
         5: dtmRelMovCota.CdsSub.Data  := CtrlHstMovCota.MovCotaAtivoInvestRendaVariavel(iIdAtivo,iIdPlano,iIdPatro,dDtInicio,dDtFim);

         // Fundo de Investimento - Renda Fixa
         9: dtmRelMovCota.CdsSub.Data := CtrlHstMovCota.MovCotaAtivoFundoRendaFixa(iIdAtivo,iIdPlano,iIdPatro,dDtInicio,dDtFim);

         // Fundo de Investimento - Renda Variável
        10: dtmRelMovCota.CdsSub.Data := CtrlHstMovCota.MovCotaAtivoFundoRendaVariavel(iIdAtivo,iIdPlano,iIdPatro,dDtInicio,dDtFim);

        // Fundo de Investimento - Imobiliário
        11: dtmRelMovCota.CdsSub.Data := CtrlHstMovCota.MovCotaAtivoFundoImobiliario(iIdAtivo,iIdPlano,iIdPatro,dDtInicio,dDtFim);

        // Fundo de Investimento - DIC
        12: dtmRelMovCota.CdsSub.Data := CtrlHstMovCota.MovCotaAtivoFundoDIC(iIdAtivo,iIdPlano,iIdPatro,dDtInicio,dDtFim);

      end;

      // AL_1
      dtmRelMovCota.ppSubReport1.ExpandAll := chkExpandido.Checked;

      inherited;

   end;
end;



end.
