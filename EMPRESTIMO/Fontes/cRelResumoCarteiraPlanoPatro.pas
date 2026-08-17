unit cRelResumoCarteiraPlanoPatro;

interface

uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   CRel, fcCombo, fcColorCombo, StdCtrls, Mask, wwdbedit, Wwdbspin,
   wwdblook, IvDictio, IvMulti, IvEMulti, MAHlpBtn, Buttons, TB97Tlbr, TB97,
   ExtCtrls, Db, CheckLst, DBTables, Wwquery,

   uTypesEmptmo;

type
   TcfgRelResumoCarteiraPlanoPatro = class(TcfgRel)
      Panel1: TPanel;
      Label15: TLabel;
      DBspnAno: TwwDBSpinEdit;
      cboMes: TComboBox;
      GroupBox1: TGroupBox;
      chkCorLinha: TCheckBox;
      cboCorLinha: TfcColorCombo;
      chkLinhas: TCheckBox;
      Label1: TLabel;
      Label2: TLabel;
      DBcboTipoEmptmo: TwwDBLookupCombo;
      DBcboTipoContrato: TwwDBLookupCombo;
      chkItens: TCheckBox;
      Label3: TLabel;
      Label6: TLabel;
      Label7: TLabel;
      lstPatro: TCheckListBox;
      btnInvertePatro: TBitBtn;
      btnMarcaTodosPatro: TBitBtn;
      lstPlano: TCheckListBox;
      btnInvertePlano: TBitBtn;
      btnMarcaTodosPlano: TBitBtn;
      qryTipoContrato: TwwQuery;
      qryTipoContratoIDTIPOCONTREMPTMO: TFloatField;
      qryTipoContratoTCEDESCRICAO: TStringField;
      qryTipoEmptmo: TwwQuery;
      qryTipoEmptmoIDTIPOEMPTMO: TFloatField;
      qryTipoEmptmoDESCTIPOEMPTMO: TStringField;
      qrySaldo: TwwQuery;
      qryConcessoes: TwwQuery;
      qrySaldoVALOR: TFloatField;
      qryRenovacoes: TwwQuery;
      qryParcelas: TwwQuery;
      qryEncargos: TwwQuery;
      qryAmortizacoes: TwwQuery;
      qryQuitacoes: TwwQuery;
      qryQuitMort: TwwQuery;
      qrySaldoTOTAL: TFloatField;
      qryConcessoesVALOR: TFloatField;
      qryConcessoesTOTAL: TFloatField;
      qryRenovacoesVALOR: TFloatField;
      qryRenovacoesTOTAL: TFloatField;
      qryEncargosVALOR: TFloatField;
      qryEncargosTOTAL: TFloatField;
      qryParcelasVALOR: TFloatField;
      qryParcelasTOTAL: TFloatField;
      qryAmortizacoesVALOR: TFloatField;
      qryAmortizacoesTOTAL: TFloatField;
      qryQuitacoesVALOR: TFloatField;
      qryQuitacoesTOTAL: TFloatField;
      qryQuitMortVALOR: TFloatField;
      qryQuitMortTOTAL: TFloatField;

      procedure FormShow(Sender: TObject);
      procedure DBcboTipoEmptmoCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
      procedure DBcboTipoEmptmoExit(Sender: TObject);
      procedure btnMarcaTodosPatroClick(Sender: TObject);
      procedure btnMarcaTodosPlanoClick(Sender: TObject);
      procedure btnInvertePatroClick(Sender: TObject);
      procedure btnInvertePlanoClick(Sender: TObject);
      procedure lstPatroClickCheck(Sender: TObject);
      procedure lstPlanoClickCheck(Sender: TObject);


   private { Private declarations }

      vPlano : array of TPlano;
      vPatro : array of TPatro;

      procedure AbreQueries;

      procedure MontaQuery; override;
      procedure FiltraRelatorio;

      procedure PreenchePatro;
      procedure MarcaTodosPatro;
      function  PegaPatro: String;
      procedure PreenchePlano;
      procedure MarcaTodosPlano;
      function  PegaPlano: String;

   public { Public declarations }


   end;



var
  cfgRelResumoCarteiraPlanoPatro: TcfgRelResumoCarteiraPlanoPatro;



implementation
{$R *.DFM}
uses
   DLookEmptmo,
   UDiasUteis,
   UMensErro,
   USistema,
   UfuncoesEmptmo,
   dRelResumoCarteiraPlanoPatro,
   FProgresso;




procedure TcfgRelResumoCarteiraPlanoPatro.AbreQueries;
begin
   // Tipo de Empréstimo
   with dtmLookEmptmo.qryLookTipoEmptmo do begin
      LimpaParametros(dtmLookEmptmo.qryLookTipoEmptmo);
      ParamByName('PIDEMPRESAPROP').AsInteger := Sistema.IDEmpresa;
      Open;
   end;

   // Tipo de Contrato
   LimpaParametros(dtmLookEmptmo.qryLookPlanPrev);
   dtmLookEmptmo.qryLookPlanPrev.Open;
end;



procedure TcfgRelResumoCarteiraPlanoPatro.MontaQuery;
begin
   inherited;

   with dtmRelResumoCarteiraPlanoPatro do begin

      sMesCompetencia   := cboMes.Text + ' / ' + DBspnAno.Text;

      bSeparador        := chkLinhas.Checked;

      // determina se as linhas do relatório serão impressas em cores alternadas, e qual cor usar
      bCorlinha         := chkCorLinha.Checked;
      CorLinha          := cboCorLinha.SelectedColor;
   end;

   FiltraRelatorio;
end;



procedure TcfgRelResumoCarteiraPlanoPatro.FiltraRelatorio;
var
   fSALDOANTERIOR, fVLRCONCMES, fVLRRENOV, fVLRPARCMES, fVLRENCARGO,
   fVLRAMORT, fVLRQUITACAO, fVLRQUITMORT, fSALDOATUAL : Currency;

   iSALDOANTERIOR, iVLRCONCMES, iVLRRENOV, iVLRPARCMES, iVLRENCARGO,
   iVLRAMORT, iVLRQUITACAO, iVLRQUITMORT, iSALDOATUAL : Integer;

   i, j, k  : Integer;
   sSQL     : String;

   dDataAnt : TDateTime;
   dDataPos : TDateTime;
begin
   dDataPos := DiasUteis.UltDiaMes(Trunc(DBspnAno.Value), (cboMes.ItemIndex + 1));
   dDataAnt := EncodeDate(Trunc(DBspnAno.Value), (cboMes.ItemIndex + 1), 1);
   dDataAnt := DiasUteis.SomaMeses(dDataAnt, -1);
   dDataAnt := DiasUteis.UltDiaMes(DiasUteis.ExtraiAno(dDataAnt), DiasUteis.ExtraiMes(dDataAnt));

   try

      (* abre a query do relatório, onde serão inseridos os registro *)
      dtmRelResumoCarteiraPlanoPatro.qryResumoCarteira.Close;
      dtmRelResumoCarteiraPlanoPatro.qryResumoCarteira.Open;

      with qryTipoEmptmo do begin
         LimpaParametros(qryTipoEmptmo);
         ParamByName('PIDEMPRESAPROP').AsInteger := Sistema.IDEmpresa;
         ParamByName('PIDTIPOEMPTMO').Clear;
         if DBcboTipoEmptmo.LookupValue <> '' then ParamByName('PIDTIPOEMPTMO').AsInteger := StrToInt(DBcboTipoEmptmo.LookupValue);
         Open;
      end;

      while not(qryTipoEmptmo.EOF) do begin

         with qryTipoContrato do begin
            LimpaParametros(qryTipoContrato);
            ParamByName('PIDTIPOEMPTMO').AsInteger := qryTipoEmptmoIDTIPOEMPTMO.AsInteger;
            ParamByName('PIDTIPOCONTREMPTMO').Clear;
            if DBcboTipoContrato.LookupValue <> '' then ParamByName('PIDTIPOCONTREMPTMO').AsInteger := StrToInt(DBcboTipoContrato.LookupValue);
            Open;
//            First;
         end;



         (* loop menos detalhado (por Plano) *)
         for j := 0 to high(vPlano) do begin

            if vPlano[j].FlgMarcado then begin

               (* loop menos detalhado (por Patro) *)
               for k := 0 to high(vPatro) do begin

                  if vPatro[k].FlgMarcado then begin

                     MostraFormProgresso('Gerando informações para: ' + vPlano[j].NomePlano + ' / ' + vPatro[k].NomePatro + '...', 0, qryTipoContrato.RecordCount, True, True);
                     i := 0;

                     qryTipoContrato.First;
                     while not(qryTipoContrato.EOF) do begin

                        (* Atualizando a Barra de Progresso *)
                        AndaFormProgresso(i);

                        (* Verifica se o usuário Cancelou a Operação *)
                        if frmProgresso.Cancelou then Exit;

                        fSALDOANTERIOR := 0;
                        fVLRCONCMES    := 0;
                        fVLRRENOV      := 0;
                        fVLRPARCMES    := 0;
                        fVLRENCARGO    := 0;
                        fVLRAMORT      := 0;
                        fVLRQUITACAO   := 0;
                        fVLRQUITMORT   := 0;
                        fSALDOATUAL    := 0;

                        iSALDOANTERIOR := 0;
                        iVLRCONCMES    := 0;
                        iVLRRENOV      := 0;
                        iVLRPARCMES    := 0;
                        iVLRENCARGO    := 0;
                        iVLRAMORT      := 0;
                        iVLRQUITACAO   := 0;
                        iVLRQUITMORT   := 0;
                        iSALDOATUAL    := 0;

                        (* Busca Saldo Anterior *)
                        with qrySaldo do begin
                           LimpaParametros(qrySaldo);
                           ParamByName('PHMEDATAATUALIZA').AsDateTime   := dDataAnt;
                           ParamByName('PIDTIPOEMPTMO').AsInteger       := qryTipoEmptmoIDTIPOEMPTMO.AsInteger;
                           ParamByName('PIDPESSOA').AsInteger           := vPatro[k].IDPatro;
                           ParamByName('PIDPLANOPREV').AsInteger        := vPlano[j].IDPlano;
                           ParamByName('PIDTIPOCONTREMPTMO').AsInteger  := qryTipoContratoIDTIPOCONTREMPTMO.AsInteger;
                           ParamByName('PIDEMPRESAPROP').AsInteger      := Sistema.IDEmpresa;
                           Open;

                           if not(isEmpty) then begin
                              fSALDOANTERIOR := qrySaldoVALOR.AsCurrency;
                              iSALDOANTERIOR := qrySaldoTOTAL.AsInteger;
                           end;

//                           Close;
                        end;

                        Repaint;
                        Application.ProcessMessages;


                        (* Busca Concessões *)
                        with qryConcessoes do begin
                           LimpaParametros(qryConcessoes);
                           ParamByName('PHMEMESCOMPETENCIA').AsInteger  := cboMes.ItemIndex + 1;
                           ParamByName('PHMEANOCOMPETENCIA').AsInteger  := trunc(DBspnAno.Value);
                           ParamByName('PIDTIPOEMPTMO').AsInteger       := qryTipoEmptmoIDTIPOEMPTMO.AsInteger;
                           ParamByName('PIDPESSOA').AsInteger           := vPatro[k].IDPatro;
                           ParamByName('PIDPLANOPREV').AsInteger        := vPlano[j].IDPlano;
                           ParamByName('PIDTIPOCONTREMPTMO').AsInteger  := qryTipoContratoIDTIPOCONTREMPTMO.AsInteger;
                           ParamByName('PIDEMPRESAPROP').AsInteger      := Sistema.IDEmpresa;
                           Open;

                           if not(isEmpty) then begin
                              fVLRCONCMES := qryConcessoesVALOR.AsCurrency;
                              iVLRCONCMES := qryConcessoesTOTAL.AsInteger;
                           end;
//                           Close;
                        end;

                        Repaint;
                        Application.ProcessMessages;


                        (* Busca Renovacoes *)
                        with qryRenovacoes do begin
                           LimpaParametros(qryRenovacoes);
                           ParamByName('PHMEMESCOMPETENCIA').AsInteger  := cboMes.ItemIndex + 1;
                           ParamByName('PHMEANOCOMPETENCIA').AsInteger  := trunc(DBspnAno.Value);
                           ParamByName('PIDTIPOEMPTMO').AsInteger       := qryTipoEmptmoIDTIPOEMPTMO.AsInteger;
                           ParamByName('PIDPESSOA').AsInteger           := vPatro[k].IDPatro;
                           ParamByName('PIDPLANOPREV').AsInteger        := vPlano[j].IDPlano;
                           ParamByName('PIDTIPOCONTREMPTMO').AsInteger  := qryTipoContratoIDTIPOCONTREMPTMO.AsInteger;
                           ParamByName('PIDEMPRESAPROP').AsInteger      := Sistema.IDEmpresa;
                           Open;

                           if not(isEmpty) then begin
                              fVLRRENOV := qryRenovacoesVALOR.AsCurrency;
                              iVLRRENOV := qryRenovacoesTOTAL.AsInteger;
                           end;
//                           Close;
                        end;

                        Repaint;
                        Application.ProcessMessages;


                        (* Busca Parcelas *)
                        with qryParcelas do begin
                           LimpaParametros(qryParcelas);
                           ParamByName('PHMEMESCOMPETENCIA').AsInteger  := cboMes.ItemIndex + 1;
                           ParamByName('PHMEANOCOMPETENCIA').AsInteger  := trunc(DBspnAno.Value);
                           ParamByName('PIDTIPOEMPTMO').AsInteger       := qryTipoEmptmoIDTIPOEMPTMO.AsInteger;
                           ParamByName('PIDPESSOA').AsInteger           := vPatro[k].IDPatro;
                           ParamByName('PIDPLANOPREV').AsInteger        := vPlano[j].IDPlano;
                           ParamByName('PIDTIPOCONTREMPTMO').AsInteger  := qryTipoContratoIDTIPOCONTREMPTMO.AsInteger;
                           ParamByName('PIDEMPRESAPROP').AsInteger      := Sistema.IDEmpresa;
                           Open;

                           if not(isEmpty) then begin
                              fVLRPARCMES := qryParcelasVALOR.AsCurrency;
                              iVLRPARCMES := qryParcelasTOTAL.AsInteger;
                           end;
//                           Close;
                        end;

                        Repaint;
                        Application.ProcessMessages;


                        (* Busca Encargos *)
                        with qryEncargos do begin
                           LimpaParametros(qryEncargos);
                           ParamByName('PHMEMESCOMPETENCIA').AsInteger  := cboMes.ItemIndex + 1;
                           ParamByName('PHMEANOCOMPETENCIA').AsInteger  := trunc(DBspnAno.Value);
                           ParamByName('PIDTIPOEMPTMO').AsInteger       := qryTipoEmptmoIDTIPOEMPTMO.AsInteger;
                           ParamByName('PIDPESSOA').AsInteger           := vPatro[k].IDPatro;
                           ParamByName('PIDPLANOPREV').AsInteger        := vPlano[j].IDPlano;
                           ParamByName('PIDEMPRESAPROP').AsInteger      := Sistema.IDEmpresa;
                           ParamByName('PIDTIPOCONTREMPTMO').AsInteger  := qryTipoContratoIDTIPOCONTREMPTMO.AsInteger;
                           Open;

                           if not(isEmpty) then begin
                              fVLRENCARGO := qryEncargosVALOR.AsCurrency;
                              iVLRENCARGO := qryEncargosTOTAL.AsInteger;
                           end;
//                           Close;
                        end;

                        Repaint;
                        Application.ProcessMessages;


                        (* Busca Amortizações *)
                        with qryAmortizacoes do begin
                           LimpaParametros(qryAmortizacoes);
                           ParamByName('PHMEMESCOMPETENCIA').AsInteger  := cboMes.ItemIndex + 1;
                           ParamByName('PHMEANOCOMPETENCIA').AsInteger  := trunc(DBspnAno.Value);
                           ParamByName('PIDTIPOEMPTMO').AsInteger       := qryTipoEmptmoIDTIPOEMPTMO.AsInteger;
                           ParamByName('PIDPESSOA').AsInteger           := vPatro[k].IDPatro;
                           ParamByName('PIDPLANOPREV').AsInteger        := vPlano[j].IDPlano;
                           ParamByName('PIDTIPOCONTREMPTMO').AsInteger  := qryTipoContratoIDTIPOCONTREMPTMO.AsInteger;
                           ParamByName('PIDEMPRESAPROP').AsInteger      := Sistema.IDEmpresa;
                           Open;

                           if not(isEmpty) then begin
                              fVLRAMORT := qryAmortizacoesVALOR.AsCurrency;
                              iVLRAMORT := qryAmortizacoesTOTAL.AsInteger;
                           end;
//                           Close;
                        end;

                        Repaint;
                        Application.ProcessMessages;

                        (* Busca Quitacoes *)
                        with qryQuitacoes do begin
                           LimpaParametros(qryQuitacoes);
                           ParamByName('PHMEMESCOMPETENCIA').AsInteger  := cboMes.ItemIndex + 1;
                           ParamByName('PHMEANOCOMPETENCIA').AsInteger  := trunc(DBspnAno.Value);
                           ParamByName('PIDTIPOEMPTMO').AsInteger       := qryTipoEmptmoIDTIPOEMPTMO.AsInteger;
                           ParamByName('PIDPESSOA').AsInteger           := vPatro[k].IDPatro;
                           ParamByName('PIDPLANOPREV').AsInteger        := vPlano[j].IDPlano;
                           ParamByName('PIDTIPOCONTREMPTMO').AsInteger  := qryTipoContratoIDTIPOCONTREMPTMO.AsInteger;
                           ParamByName('PIDEMPRESAPROP').AsInteger      := Sistema.IDEmpresa;
                           Open;
                           if not(IsEmpty) then begin
                              fVLRQUITACAO := qryQuitacoesVALOR.AsCurrency;
                              iVLRQUITACAO := qryQuitacoesTOTAL.AsInteger;
                           end;
//                           Close;
                        end;

                        Repaint;
                        Application.ProcessMessages;

                        (* Busca Quitacoes por Morte *)
                        with qryQuitMort do begin
                           LimpaParametros(qryQuitMort);
                           ParamByName('PHMEMESCOMPETENCIA').AsInteger  := cboMes.ItemIndex + 1;
                           ParamByName('PHMEANOCOMPETENCIA').AsInteger  := trunc(DBspnAno.Value);
                           ParamByName('PIDTIPOEMPTMO').AsInteger       := qryTipoEmptmoIDTIPOEMPTMO.AsInteger;
                           ParamByName('PIDPESSOA').AsInteger           := vPatro[k].IDPatro;
                           ParamByName('PIDPLANOPREV').AsInteger        := vPlano[j].IDPlano;
                           ParamByName('PIDTIPOCONTREMPTMO').AsInteger  := qryTipoContratoIDTIPOCONTREMPTMO.AsInteger;
                           ParamByName('PIDEMPRESAPROP').AsInteger      := Sistema.IDEmpresa;
                           Open;
                           if not(IsEmpty) then begin
                              fVLRQUITMORT := qryQuitMortVALOR.AsCurrency;
                              iVLRQUITMORT := qryQuitMortTOTAL.AsInteger;
                           end;
//                           Close;
                        end;

                        Repaint;
                        Application.ProcessMessages;

                        (* Busca Saldo Atual *)
                        with qrySaldo do begin
                           LimpaParametros(qrySaldo);
                           ParamByName('PHMEDATAATUALIZA').AsDateTime   := dDataPos;
                           ParamByName('PIDTIPOEMPTMO').AsInteger       := qryTipoEmptmoIDTIPOEMPTMO.AsInteger;
                           ParamByName('PIDPESSOA').AsInteger           := vPatro[k].IDPatro;
                           ParamByName('PIDPLANOPREV').AsInteger        := vPlano[j].IDPlano;
                           ParamByName('PIDTIPOCONTREMPTMO').AsInteger  := qryTipoContratoIDTIPOCONTREMPTMO.AsInteger;
                           ParamByName('PIDEMPRESAPROP').AsInteger      := Sistema.IDEmpresa;
                           Open;
                           if not(IsEmpty) then begin
                              fSALDOATUAL := qrySaldoVALOR.AsCurrency;
                              iSALDOATUAL := qrySaldoTOTAL.AsInteger;
                           end;
//                           Close;
                        end;

                        Repaint;
                        Application.ProcessMessages;

                        with dtmRelResumoCarteiraPlanoPatro do begin
                           qryResumoCarteira.Append;

                           qryResumoCarteiraIDTIPOEMPTMO.AsInteger      := qryTipoEmptmoIDTIPOEMPTMO.AsInteger;
                           qryResumoCarteiraDESCTIPOEMPTMO.AsString     := qryTipoEmptmoDESCTIPOEMPTMO.AsString;
                           qryResumoCarteiraIDPESSOA.AsInteger          := vPatro[k].IDPatro;
                           qryResumoCarteiraNOME.AsString               := vPatro[k].NomePatro;
                           qryResumoCarteiraIDPLANOPREV.AsInteger       := vPlano[j].IdPlano;
                           qryResumoCarteiraDESCPLANO.AsString          := vPlano[j].NomePlano;
                           qryResumoCarteiraIDTIPOCONTREMPTMO.AsInteger := qryTipoContratoIDTIPOCONTREMPTMO.AsInteger;
                           qryResumoCarteiraTCEDESCRICAO.AsString       := qryTipoContratoTCEDESCRICAO.AsString;
                           qryResumoCarteiraSALDOANTERIOR.ASCurrency    := fSALDOANTERIOR;
                           qryResumoCarteiraVLRCONCMES.ASCurrency       := fVLRCONCMES;
                           qryResumoCarteiraVLRRENOVMES.ASCurrency      := fVLRRENOV;
                           qryResumoCarteiraVLRPARCMES.ASCurrency       := fVLRPARCMES;
                           qryResumoCarteiraVLRENCARGO.ASCurrency       := fVLRENCARGO;
                           qryResumoCarteiraVLRAMORT.ASCurrency         := fVLRAMORT;
                           qryResumoCarteiraVLRQUITACAO.ASCurrency      := fVLRQUITACAO;
                           qryResumoCarteiraVLRQUITMORT.ASCurrency      := fVLRQUITMORT;
                           qryResumoCarteiraSALDOATUAL.ASCurrency       := fSALDOATUAL;
                           qryResumoCarteiraTSALDOANTERIOR.AsInteger    := iSALDOANTERIOR;
                           qryResumoCarteiraTVLRCONCMES.AsInteger       := iVLRCONCMES;
                           qryResumoCarteiraTVLRRENOVMES.AsInteger      := iVLRRENOV;
                           qryResumoCarteiraTVLRPARCMES.AsInteger       := iVLRPARCMES;
                           qryResumoCarteiraTVLRENCARGO.AsInteger       := iVLRENCARGO;
                           qryResumoCarteiraTVLRAMORT.AsInteger         := iVLRAMORT;
                           qryResumoCarteiraTVLRQUITACAO.AsInteger      := iVLRQUITACAO;
                           qryResumoCarteiraTVLRQUITMORT.AsInteger      := iVLRQUITMORT;
                           qryResumoCarteiraTSALDOATUAL.AsInteger       := iSALDOATUAL;

                           qryResumoCarteira.Post;
                        end;


                        qryTipoContrato.Next;
                        inc(i);

                     end;

                     EscondeFormProgresso;
                  end;
               end;
            end;
         end;

         qryTipoEmptmo.Next;
      end;

   finally
      qryTipoEmptmo.Close;
      qryTipoContrato.Close;

      dtmRelResumoCarteiraPlanoPatro.qryResumoCarteira.First;
   end;
end;



procedure TcfgRelResumoCarteiraPlanoPatro.FormShow(Sender: TObject);
begin
   inherited;

   (* preenche a data de lançamento e o ano de referência/competência *)
   cboMes.ItemIndex := DiasUteis.ExtraiMes(Date) - 1;
   DBspnAno.Value   := DiasUteis.ExtraiAno(Date);

   AbreQueries;
   (* Preenche a listbox de patrocinadoras... *)
   PreenchePatro;
   (* ...e marca todas por default *)
   MarcaTodosPatro;

   (* Preenche a listbox de Planos... *)
   PreenchePlano;
   (* ...e marca todos por default *)
   MarcaTodosPlano;
end;



procedure TcfgRelResumoCarteiraPlanoPatro.DBcboTipoEmptmoCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
begin
   inherited;

   // seleciona apenas os Tipos de Contrato do Tipo de Empréstimo selecionado
   with dtmLookEmptmo.qryLookTipoContrato do begin
      LimpaParametros(dtmLookEmptmo.qryLookTipoContrato);

      if DBcboTipoEmptmo.LookupValue <> '' then begin
         ParamByName('PIDTIPOEMPTMO').AsInteger    := StrToInt(DBcboTipoEmptmo.LookupValue);
         ParamByName('PIDEMPRESAPROP').AsInteger   := Sistema.IDEmpresa;
      end;

      Open;

      DBcboTipoContrato.Enabled := True;
   end;
end;



procedure TcfgRelResumoCarteiraPlanoPatro.DBcboTipoEmptmoExit(Sender: TObject);
begin
   inherited;

   // seleciona apenas os Tipos de Contrato do Tipo de Empréstimo selecionado
   with dtmLookEmptmo.qryLookTipoContrato do begin
      LimpaParametros(dtmLookEmptmo.qryLookTipoContrato);

      if DBcboTipoEmptmo.LookupValue <> '' then begin
         ParamByName('PIDTIPOEMPTMO').AsInteger    := StrToInt(DBcboTipoEmptmo.LookupValue);
         ParamByName('PIDEMPRESAPROP').AsInteger   := Sistema.IDEmpresa;
      end;

      Open;

      DBcboTipoContrato.Enabled := True;
   end;
end;



procedure TcfgRelResumoCarteiraPlanoPatro.btnMarcaTodosPatroClick(Sender: TObject);
begin
   inherited;
   {* Marca todos os Patrocinadores *}
   MarcaCheckListBox(lstPatro);
end;



procedure TcfgRelResumoCarteiraPlanoPatro.btnMarcaTodosPlanoClick(Sender: TObject);
begin
   inherited;
   {* Marca todos os Planos *}
   MarcaCheckListBox(lstPlano);
end;



procedure TcfgRelResumoCarteiraPlanoPatro.btnInvertePatroClick(Sender: TObject);
begin
   inherited;
   (* inverte a seleção patrocinador *)
   InverteChekListBox(lstPatro);
   PegaPatro;
end;



procedure TcfgRelResumoCarteiraPlanoPatro.btnInvertePlanoClick(Sender: TObject);
begin
   inherited;
   (* inverte a seleção plano *)
   InverteChekListBox(lstPlano);
   PegaPlano;
end;



procedure TcfgRelResumoCarteiraPlanoPatro.PreenchePatro;
var
   i : Integer;
begin
   // Abre a tabela de patrocinadoras
   if not(dtmLookEmptmo.qryLookPatro.Active) then dtmLookEmptmo.qryLookPatro.Open;
   dtmLookEmptmo.qryLookPatro.First;

   // Limpa a lista
   lstPatro.Items.Clear;

   // Inicializa o vetor
   i := 0;

   // Preenche a listbox de patrocinadoras e o vetor...
   while not(dtmLookEmptmo.qryLookPatro.EOF) do begin

      inc(i);
      SetLength(vPatro, i);
      vPatro[i-1].IDPatro     := dtmLookEmptmo.qryLookPatroIDPESSOA.AsInteger;
      vPatro[i-1].NomePAtro   := dtmLookEmptmo.qryLookPatroNOME.AsString;
      vPatro[i-1].FlgMarcado  := True;

      lstPatro.Items.Add(dtmLookEmptmo.qryLookPatroNOME.AsString);

      dtmLookEmptmo.qryLookPatro.Next;
   end;
end;



procedure TcfgRelResumoCarteiraPlanoPatro.MarcaTodosPatro;
var
   i : Integer;
begin
   // ...e marca todas por default
   for i := 0 to (lstPatro.Items.Count - 1) do lstPatro.Checked[i] := True;
end;



function TcfgRelResumoCarteiraPlanoPatro.PegaPatro: String;
var
   i        : Integer;
   sPatros  : String;
begin
   inherited;

   sPatros := '';

   // concatena a String de patros
   for i := 0 to (lstPatro.Items.Count - 1) do begin
      if lstPatro.Checked[i] then begin
         if sPatros <> '' then sPatros := sPatros + ', ';
         sPatros := sPatros + IntToStr(vPatro[i].IDPatro);
      end;
      vPatro[i].FlgMarcado := lstPatro.Checked[i];
   end;

   Result := sPatros;
end;



procedure TcfgRelResumoCarteiraPlanoPatro.PreenchePlano;
var
   i : Integer;
begin
   // Abre a tabela de Planos
   if not(dtmLookEmptmo.qryLookPlanPrev.Active) then dtmLookEmptmo.qryLookPlanPrev.Open;
   dtmLookEmptmo.qryLookPlanPrev.First;

   // Limpa a lista
   lstPlano.Items.Clear;

   // Inicializa o vetor
   i := 0;

   // Preenche a listbox de planos e o vetor...
   while not(dtmLookEmptmo.qryLookPlanPrev.EOF) do begin

      inc(i);
      SetLength(vPlano, i);
      vPlano[i-1].IDPlano     := dtmLookEmptmo.qryLookPlanPrevIDPLANOPREV.AsInteger;
      vPlano[i-1].NomePlano   := dtmLookEmptmo.qryLookPlanPrevNOME.AsString;
      vPlano[i-1].FlgMarcado  := True;

      lstPlano.Items.Add(dtmLookEmptmo.qryLookPlanPrevNOME.AsString);

      dtmLookEmptmo.qryLookPlanPrev.Next;
   end;
end;



procedure TcfgRelResumoCarteiraPlanoPatro.MarcaTodosPlano;
var
   i : Integer;
begin
   // ...e marca todas por default
   for i := 0 to (lstPlano.Items.Count - 1) do lstPlano.Checked[i] := True;
end;



function TcfgRelResumoCarteiraPlanoPatro.PegaPlano: String;
var
   i        : Integer;
   sPlanos  : String;
begin
   inherited;

   sPlanos := '';

   // concatena a String de planos
   for i := 0 to (lstPlano.Items.Count - 1) do begin
      if lstPlano.Checked[i] then begin
         if sPlanos <> '' then sPlanos := sPlanos + ', ';
         sPlanos := sPlanos + IntToStr(vPlano[i].IDPlano);
      end;
   end;
   vPlano[i].FlgMarcado := lstPlano.Checked[i];

   Result := sPlanos;
end;




procedure TcfgRelResumoCarteiraPlanoPatro.lstPatroClickCheck(
  Sender: TObject);
begin
  inherited;
   PegaPatro;
end;

procedure TcfgRelResumoCarteiraPlanoPatro.lstPlanoClickCheck(
  Sender: TObject);
begin
  inherited;
   PegaPlano;
end;

end.
