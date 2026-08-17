unit CRelItensEnviados;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  CRel, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr,
  TB97, ExtCtrls, mContratoEmptmo, Mask, wwdbedit, Wwdbspin, CheckLst,
  wwdblook, db, fcCombo, fcColorCombo, DBTables, Wwquery,

  uTypesEmptmo;

type
   TcfgRelItensEnviados = class(TcfgRel)
      molContratoEmptmo: TmolContratoEmptmo;
      Label6: TLabel;
      lstPatro: TCheckListBox;
      btnInvertePatro: TBitBtn;
      btnMarcaTodosPatro: TBitBtn;
      lstPlano: TCheckListBox;
      Label7: TLabel;
      btnInvertePlano: TBitBtn;
      btnMarcaTodosPlano: TBitBtn;
      DBcboTipoContrato: TwwDBLookupCombo;
      Label2: TLabel;
      Panel1: TPanel;
      Label15: TLabel;
      DBspnAno: TwwDBSpinEdit;
      cboMes: TComboBox;
      GroupBox1: TGroupBox;
      chkFinanceiro: TCheckBox;
      chkFolhaPatro: TCheckBox;
      chkFolhaBenef: TCheckBox;
      Label1: TLabel;
      DBcboTipoEmptmo: TwwDBLookupCombo;
      GroupBox2: TGroupBox;
      chkCorLinha: TCheckBox;
      cboCorLinha: TfcColorCombo;
      chkLinhas: TCheckBox;
      qryTipoContrato: TwwQuery;
      qryTipoContratoIDTIPOCONTREMPTMO: TFloatField;
      qryTipoContratoTCEDESCRICAO: TStringField;
      qryQuitMort: TwwQuery;
      qryQuitacoes: TwwQuery;
      qryAmortizacoes: TwwQuery;
      qryEncargos: TwwQuery;
      qryParcelas: TwwQuery;
      qryConcessoes: TwwQuery;
      qryParcelaAtr: TwwQuery;
      qryConcessoesVALOR: TFloatField;
      qryConcessoesTOTAL: TFloatField;
      qryParcelasVALOR: TFloatField;
      qryParcelasTOTAL: TFloatField;
      qryParcelaAtrVALOR: TFloatField;
      qryParcelaAtrTOTAL: TFloatField;
      qryEncargosVALOR: TFloatField;
      qryEncargosTOTAL: TFloatField;
      qryAmortizacoesVALOR: TFloatField;
      qryAmortizacoesTOTAL: TFloatField;
      qryQuitacoesVALOR: TFloatField;
      qryQuitacoesTOTAL: TFloatField;
      qryQuitMortVALOR: TFloatField;
      qryQuitMortTOTAL: TFloatField;

      procedure FormShow(Sender: TObject);
      procedure btnMarcaTodosPatroClick(Sender: TObject);
      procedure btnMarcaTodosPlanoClick(Sender: TObject);
      procedure btnInvertePatroClick(Sender: TObject);
      procedure btnInvertePlanoClick(Sender: TObject);
      procedure DBcboTipoEmptmoCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
    procedure lstPatroClickCheck(Sender: TObject);
    procedure lstPlanoClickCheck(Sender: TObject);


   private { Private declarations }

      vPatro               : array of TPatro;
      vPlano               : array of TPlano;

      sFormaCobranca : String;
      sTipoFolha     : String;

      procedure PreenchePatro;
      procedure MarcaTodosPatro;
      function PegaPatro: String;

      procedure PreenchePlano;
      procedure MarcaTodosPlano;
      function PegaPlano: String;

      procedure AbreQueries;

      procedure MontaQuery; override;
      procedure FiltraRelatorio;

      function MontaSqlConcessoes : String;
      function MontaSqlParcelasMes : String;
      function MontaSqlParcelasAtrasadas : String;
      function MontaSqlEncargos : String;
      function MontaSqlAmortizacoes : String;
      function MontaSqlQuitacoes : String;
      function MontaSqlQuitacoesMorte : String;

  public { Public declarations }

  end;



var
  cfgRelItensEnviados: TcfgRelItensEnviados;



implementation
{$R *.DFM}
uses
   DLookEmptmo,
   UDiasUteis,
   USistema,
   UfuncoesEmptmo, dRelItensEnviados,
   FProgresso,     (* FrmProgresso *)
   uMensErro;




procedure TcfgRelItensEnviados.PreenchePatro;
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
      vPatro[i-1].NomePatro   := dtmLookEmptmo.qryLookPatroNOME.AsString;
      vPatro[i-1].FlgMarcado  := True;

      lstPatro.Items.Add(dtmLookEmptmo.qryLookPatroNOME.AsString);

      dtmLookEmptmo.qryLookPatro.Next;
   end;
end;



procedure TcfgRelItensEnviados.MarcaTodosPatro;
var
   i : Integer;
begin
   // ...e marca todas por default
   for i := 0 to (lstPatro.Items.Count - 1) do lstPatro.Checked[i] := True;
end;



function TcfgRelItensEnviados.PegaPatro: String;
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
         sPatros := sPatros + IntToStr(vPatro[i].IdPatro);
      end;
      vPatro[i].FlgMarcado := lstPatro.Checked[i];
   end;

   Result := sPatros;
end;



procedure TcfgRelItensEnviados.PreenchePlano;
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



procedure TcfgRelItensEnviados.MarcaTodosPlano;
var
   i : Integer;
begin
   // ...e marca todas por default
   for i := 0 to (lstPlano.Items.Count - 1) do lstPlano.Checked[i] := True;
end;



function TcfgRelItensEnviados.PegaPlano: String;
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
         sPlanos := sPlanos + IntToStr(vPlano[i].IdPlano);
      end;
      vPlano[i].FlgMarcado := lstPatro.Checked[i];
   end;

   Result := sPlanos;
end;



procedure TcfgRelItensEnviados.AbreQueries;
begin
   with dtmLookEmptmo.qryLookTipoEmptmo do begin
      LimpaParametros(dtmLookEmptmo.qryLookTipoEmptmo);
      ParamByName('PIDEMPRESAPROP').AsInteger := Sistema.IDEmpresa;
      Open;
   end;

   // Tipo de Contrato
   LimpaParametros(dtmLookEmptmo.qryLookPlanPrev);
   dtmLookEmptmo.qryLookPlanPrev.Open;
end;




procedure TcfgRelItensEnviados.MontaQuery;
begin
   inherited;

   with dtmRelItensEnviados do begin

      sMesCompetencia := cboMes.Text + ' / ' + DBspnAno.Text;
      bCorLinha       := chkCorLinha.Checked;
      CorLinha        := cboCorLinha.SelectedColor;

   end;

   FiltraRelatorio;
end;



procedure TcfgRelItensEnviados.FiltraRelatorio;
var
   i, j, k : Integer;
   iTOTALCONCMES, iTOTALPARCMES, iTOTALPARCATR, iTOTALENC, iTOTALAMO, iTOTALQUI, iTOTALQUM   : Integer;
   fVLRCONCMES, fVLRPARCMES, fVLRPARCATR, fVLRENCARGO, fVLRAMORT, fVLRQUITACAO, fVLRQUITMORT : Currency;
begin
   (* monta a forma de cobrança ------------------------------------------------------------------- *)

   with dtmRelItensEnviados do begin

      sMesCompetencia := cboMes.Text + ' / ' + DBspnAno.Text;
      bCorLinha       := chkCorLinha.Checked;
      CorLinha        := cboCorLinha.SelectedColor;

   end;

   sFormaCobranca := '';
   sTipoFolha     := '';

   if chkFinanceiro.Checked then sFormaCobranca := QuotedStr('C');

   if ( (chkFolhaPatro.Checked) or (chkFolhaBenef.Checked) ) then begin
      if sFormaCobranca <> '' then begin
         sFormaCobranca := sFormaCobranca + ',' + QuotedStr('F')
      end else begin
         sFormaCobranca := QuotedStr('F');
      end;
   end;

   if chkFolhaPatro.Checked then sTipoFolha := QuotedStr('P');

   if chkFolhaBenef.Checked then begin
      if sTipoFolha <> '' then begin
         sTipoFolha := sTipoFolha + ',' + QuotedStr('B')
      end else begin
         sTipoFolha := QuotedStr('B');
      end;
   end;

   with dtmRelItensEnviados.qryItensEnviados do begin
      Close;
      Open;
   end;

   qryTipoContrato.Sql.Clear;
   qryTipoContrato.Sql.Add('SELECT IDTIPOCONTREMPTMO, TCEDESCRICAO');
   qryTipoContrato.Sql.Add('FROM TIPOCONTREMPTMO');
   if DBcboTipoContrato.Text <> '' then
      qryTipoContrato.Sql.Add('WHERE IDTIPOCONTREMPTMO = ' + DBcboTipoContrato.LookupValue);
   qryTipoContrato.Sql.Add('ORDER BY TCEDESCRICAO');
   qryTipoContrato.Open;


   for k := 0 to High(vPatro) do begin

      if vPatro[k].FlgMarcado then begin
         for j := 0 to High(vPlano) do begin

            if vPlano[j].FlgMarcado then begin
               qryTipoContrato.First;

               MostraFormProgresso('Gerando informações para: ' + vPatro[k].NomePatro + ' / ' + vPlano[j].NomePlano + '...', 0, qryTipoContrato.RecordCount, True, True);
               i := 0;

               while not qryTipoContrato.Eof do begin

                  (* Atualizando a Barra de Progresso *)
                  AndaFormProgresso(i);

                  (* Verifica se o usuário Cancelou a Operação *)
                  if frmProgresso.Cancelou then Exit;

                  iTOTALCONCMES := 0;
                  iTOTALPARCMES := 0;
                  iTOTALPARCATR := 0;
                  iTOTALENC     := 0;
                  iTOTALAMO     := 0;
                  iTOTALQUI     := 0;
                  iTOTALQUM     := 0;

                  fVLRCONCMES   := 0;
                  fVLRPARCMES   := 0;
                  fVLRPARCATR   := 0;
                  fVLRENCARGO   := 0;
                  fVLRAMORT     := 0;
                  fVLRQUITACAO  := 0;
                  fVLRQUITMORT  := 0;

                  (* Busca Concessões *)
                  with qryConcessoes do begin
                     LimpaParametros(qryConcessoes);
                     ParamByName('PHMEMESCOMPETENCIA').AsInteger  := cboMes.ItemIndex + 1;
                     ParamByName('PHMEANOCOMPETENCIA').AsInteger  := trunc(DBspnAno.Value);
                     ParamByName('PIDPESSOA').AsInteger           := vPatro[k].IDPatro;
                     ParamByName('PIDPLANOPREV').AsInteger        := vPlano[j].IDPlano;
                     ParamByName('PIDTIPOCONTREMPTMO').AsInteger  := qryTipoContratoIDTIPOCONTREMPTMO.AsInteger;
                     ParamByName('PIDEMPRESAPROP').AsInteger      := Sistema.IDEmpresa;
                     Open;

                     if not(isEmpty) then begin
                        fVLRCONCMES   := qryConcessoesVALOR.AsCurrency;
                        iTOTALCONCMES := qryConcessoesTOTAL.AsInteger;
                     end;
                     Close;
                  end;

                  Repaint;
                  Application.ProcessMessages;

                  (* Busca Parcelas *)
                  with qryParcelas do begin
                     LimpaParametros(qryParcelas);
                     ParamByName('PHMEMESCOMPETENCIA').AsInteger  := cboMes.ItemIndex + 1;
                     ParamByName('PHMEANOCOMPETENCIA').AsInteger  := trunc(DBspnAno.Value);
                     ParamByName('PIDPESSOA').AsInteger           := vPatro[k].IDPatro;
                     ParamByName('PIDPLANOPREV').AsInteger        := vPlano[j].IDPlano;
                     ParamByName('PIDTIPOCONTREMPTMO').AsInteger  := qryTipoContratoIDTIPOCONTREMPTMO.AsInteger;
                     ParamByName('PIDEMPRESAPROP').AsInteger      := Sistema.IDEmpresa;
                     Open;

                     if not(isEmpty) then begin
                        fVLRPARCMES   := qryParcelasVALOR.AsCurrency;
                        iTOTALPARCMES := qryParcelasTOTAL.AsInteger;
                     end;
                     Close;
                  end;

                  Repaint;
                  Application.ProcessMessages;


                  (* Busca Totais de Parcelas Atrasadas *)

                  with qryParcelaAtr do begin
                     LimpaParametros(qryParcelaAtr);
                     ParamByName('PHMEMESCOMPETENCIA').AsInteger  := cboMes.ItemIndex + 1;
                     ParamByName('PHMEANOCOMPETENCIA').AsInteger  := trunc(DBspnAno.Value);
                     ParamByName('PIDPESSOA').AsInteger           := vPatro[k].IDPatro;
                     ParamByName('PIDPLANOPREV').AsInteger        := vPlano[j].IDPlano;
                     ParamByName('PIDTIPOCONTREMPTMO').AsInteger  := qryTipoContratoIDTIPOCONTREMPTMO.AsInteger;
                     ParamByName('PIDEMPRESAPROP').AsInteger      := Sistema.IDEmpresa;
                     Open;

                     if not(isEmpty) then begin
                        fVLRPARCATR   := qryParcelaAtrVALOR.AsCurrency;
                        iTOTALPARCATR := qryParcelaAtrTOTAL.AsInteger;
                     end;
                     Close;
                  end;

                  Repaint;
                  Application.ProcessMessages;


                  (* Busca Encargos *)
                  with qryEncargos do begin
                     LimpaParametros(qryEncargos);
                     ParamByName('PHMEMESCOMPETENCIA').AsInteger  := cboMes.ItemIndex + 1;
                     ParamByName('PHMEANOCOMPETENCIA').AsInteger  := trunc(DBspnAno.Value);
                     ParamByName('PIDPESSOA').AsInteger           := vPatro[k].IDPatro;
                     ParamByName('PIDPLANOPREV').AsInteger        := vPlano[j].IDPlano;
                     ParamByName('PIDTIPOCONTREMPTMO').AsInteger  := qryTipoContratoIDTIPOCONTREMPTMO.AsInteger;
                     ParamByName('PIDEMPRESAPROP').AsInteger      := Sistema.IDEmpresa;
                     Open;

                     if not(isEmpty) then begin
                        fVLRENCARGO := qryEncargosVALOR.AsCurrency;
                        iTOTALENC   := qryEncargosTOTAL.AsInteger;
                     end;
                     Close;
                  end;

                  Repaint;
                  Application.ProcessMessages;

                  (* Busca Amortizações *)
                  with qryAmortizacoes do begin
                     LimpaParametros(qryAmortizacoes);
                     ParamByName('PHMEMESCOMPETENCIA').AsInteger  := cboMes.ItemIndex + 1;
                     ParamByName('PHMEANOCOMPETENCIA').AsInteger  := trunc(DBspnAno.Value);
                     ParamByName('PIDPESSOA').AsInteger           := vPatro[k].IDPatro;
                     ParamByName('PIDPLANOPREV').AsInteger        := vPlano[j].IDPlano;
                     ParamByName('PIDTIPOCONTREMPTMO').AsInteger  := qryTipoContratoIDTIPOCONTREMPTMO.AsInteger;
                     ParamByName('PIDEMPRESAPROP').AsInteger      := Sistema.IDEmpresa;
                     Open;

                     if not(isEmpty) then begin
                        fVLRAMORT := qryAmortizacoesVALOR.AsCurrency;
                        iTOTALAMO := qryAmortizacoesTOTAL.AsInteger;
                     end;
                     Close;
                  end;

                  Repaint;
                  Application.ProcessMessages;

                  (* Busca Quitacoes *)
                  with qryQuitacoes do begin
                     LimpaParametros(qryQuitacoes);
                     ParamByName('PHMEMESCOMPETENCIA').AsInteger  := cboMes.ItemIndex + 1;
                     ParamByName('PHMEANOCOMPETENCIA').AsInteger  := trunc(DBspnAno.Value);
                     ParamByName('PIDPESSOA').AsInteger           := vPatro[k].IDPatro;
                     ParamByName('PIDPLANOPREV').AsInteger        := vPlano[j].IDPlano;
                     ParamByName('PIDTIPOCONTREMPTMO').AsInteger  := qryTipoContratoIDTIPOCONTREMPTMO.AsInteger;
                     ParamByName('PIDEMPRESAPROP').AsInteger      := Sistema.IDEmpresa;
                     Open;
                     if not(IsEmpty) then begin
                        fVLRQUITACAO := qryQuitacoesVALOR.AsCurrency;
                        iTOTALQUI    := qryQuitacoesTOTAL.AsInteger;
                     end;
                     Close;
                  end;

                  Repaint;
                  Application.ProcessMessages;

                  (* Busca Quitacoes por Morte *)
                  with qryQuitMort do begin
                     LimpaParametros(qryQuitMort);
                     ParamByName('PHMEMESCOMPETENCIA').AsInteger  := cboMes.ItemIndex + 1;
                     ParamByName('PHMEANOCOMPETENCIA').AsInteger  := trunc(DBspnAno.Value);
                     ParamByName('PIDPESSOA').AsInteger           := vPatro[k].IDPatro;
                     ParamByName('PIDPLANOPREV').AsInteger        := vPlano[j].IDPlano;
                     ParamByName('PIDTIPOCONTREMPTMO').AsInteger  := qryTipoContratoIDTIPOCONTREMPTMO.AsInteger;
                     ParamByName('PIDEMPRESAPROP').AsInteger      := Sistema.IDEmpresa;
                     Open;
                     if not(IsEmpty) then begin
                        fVLRQUITMORT := qryQuitMortVALOR.AsCurrency;
                        iTOTALQUM    := qryQuitMortTOTAL.AsInteger;
                     end;
                     Close;
                  end;

                  Repaint;
                  Application.ProcessMessages;


                  if iTOTALCONCMES + iTOTALPARCMES + iTOTALPARCATR + iTOTALENC +
                     iTOTALAMO + iTOTALQUI + iTOTALQUM > 0 then begin

                     (* Grava na Tabela Virtual *)
                     with dtmRelItensEnviados do begin
                        qryItensEnviados.Append;
                        qryItensEnviadosIDPESSOA.AsInteger           := vPatro[k].IDPatro;
                        qryItensEnviadosNOME.AsString                := vPatro[k].NomePatro;
                        qryItensEnviadosIDPLANOPREV.ASInteger        := vPlano[j].IdPlano;
                        qryItensEnviadosDESCPLANO.AsString           := vPlano[j].NomePlano;
                        qryItensEnviadosIDTIPOCONTREMPTMO.AsInteger  := qryTipoContratoIDTIPOCONTREMPTMO.AsInteger;
                        qryItensEnviadosTCEDESCRICAO.AsString        := qryTipoContratoTCEDESCRICAO.AsString;
                        qryItensEnviadosTOTALCONCMES.AsInteger       := iTOTALCONCMES;
                        qryItensEnviadosVLRCONCMES.AsCurrency        := fVLRCONCMES;
                        qryItensEnviadosTOTALPARCMES.AsInteger       := iTOTALPARCMES;
                        qryItensEnviadosVLRPARCMES.AsCurrency        := fVLRPARCMES;
                        qryItensEnviadosTOTALPARCATR.AsInteger       := iTOTALPARCATR;
                        qryItensEnviadosVLRPARCATR.AsCurrency        := fVLRPARCATR;
                        qryItensEnviadosTOTALENC.AsInteger           := iTOTALENC;
                        qryItensEnviadosVLRENCARGO.AsCurrency        := fVLRENCARGO;
                        qryItensEnviadosTOTALAMO.AsInteger           := iTOTALAMO;
                        qryItensEnviadosVLRAMORT.AsCurrency          := fVLRAMORT;
                        qryItensEnviadosTOTALQUI.AsInteger           := iTOTALQUI;
                        qryItensEnviadosVLRQUITACAO.AsCurrency       := fVLRQUITACAO;
                        qryItensEnviadosTOTALQUM.AsInteger           := iTOTALQUM;
                        qryItensEnviadosVLRQUITMORT.AsCurrency       := fVLRQUITMORT;
                        qryItensEnviados.Post;
                     end;

                  end;

                  qryTipoContrato.Next;
                  inc(i);

               end;
               EscondeFormProgresso;
            end;
         end;
      end;
   end;

   dtmRelItensEnviados.qryItensEnviados.First;
   qryTipoContrato.Close;
end;



procedure TcfgRelItensEnviados.FormShow(Sender: TObject);
begin
   inherited;

   molContratoEmptmo.btnLimpaContrato.Click;

   (* preenche a data de lançamento e o ano de referência/competência *)
   cboMes.ItemIndex        := DiasUteis.ExtraiMes(Date) - 1;
   DBspnAno.Value          := DiasUteis.ExtraiAno(Date);

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



procedure TcfgRelItensEnviados.btnMarcaTodosPatroClick(Sender: TObject);
begin
   inherited;
   {* Marca todos os Patrocinadores *}
   MarcaCheckListBox(lstPatro);
   PreenchePatro;
end;



procedure TcfgRelItensEnviados.btnMarcaTodosPlanoClick(Sender: TObject);
begin
   inherited;
   {* Marca todos os Planos *}
   MarcaCheckListBox(lstPlano);
   PreenchePlano;
end;



procedure TcfgRelItensEnviados.btnInvertePatroClick(Sender: TObject);
begin
   inherited;
   (* inverte a seleção patrocinador *)
   InverteChekListBox(lstPatro);
   PegaPatro;
end;



procedure TcfgRelItensEnviados.btnInvertePlanoClick(Sender: TObject);
begin
   inherited;
   (* inverte a seleção plano *)
   InverteChekListBox(lstPlano);
   PegaPlano;
end;



procedure TcfgRelItensEnviados.DBcboTipoEmptmoCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
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



function TcfgRelItensEnviados.MontaSqlConcessoes : String;
var sSQL : String;
begin
   sSQL :=
   '   SELECT '                                                                           + #13 +
   '      COUNT(H.IDCONTRATOEMPTMO) AS TOTAL, '                                           + #13 +
   '      NVL(SUM(HMEVLRPREVISTO),0) AS VALOR '                                           + #13 +
   '   FROM '                                                                             + #13 +
   '      HISTMOVEMPTMO H, CONTRATOEMPTMO C, TIPOCONTREMPTMO TCE, TIPOEMPTMO TE '         + #13 +
   '   WHERE '                                                                            + #13 +
   '          FLGENVIO            IS NULL '                                               + #13 +
   '      AND C.IDCONTRQUITACAO   IS NULL '                                               + #13 +
   '      AND H.HMETIPOMOV        = 0 '                                                   + #13 +
   '      AND H.HMECENTRALIZA     = 1 '                                                   + #13 +
   '      AND H.FLGESTORNADO      IS NULL '                                               + #13 +
   '      AND H.HMEANOCOBRANCA    = ' + NumeroIngles(DBspnAno.Value)                      + #13 +
   '      AND H.HMEMESCOBRANCA    = ' + IntToStr(cboMes.ItemIndex + 1)                    + #13 +
   '      AND C.IDPATRO           = :PIDPESSOA'                                           + #13 +
   '      AND C.IDPLANOPREV       = :PIDPLANOPREV'                                        + #13 +
   '      AND C.IDTIPOCONTREMPTMO = :PIDTIPOCONTREMPTMO'                                  + #13;

   (* filtro por "destino" do Envio *)
   if sFormaCobranca <> '' then begin
      sSQL := sSQL +
   '      AND H.HMEFORMACOBRANCA  IN (' + sFormaCobranca + ') '                           + #13;
   end;

   if sTipoFolha <> '' then begin
      sSQL := sSQL +
   '      AND H.HMETIPOFOLHA      IN (' + sTipoFolha + ') '                               + #13;
   end;

   (* filtro por Empresa Proprietátia *)
   sSQL := sSQL +
   '    AND TE.IDEMPRESAPROP       = ' + IntToStr(Sistema.IDEmpresa)                       + #13 +
   '    AND TE.IDTIPOEMPTMO        = TCE.IDTIPOEMPTMO'                                     + #13;


   sSQL := sSQL +
   '      AND H.IDCONTRATOEMPTMO  = C.IDCONTRATOEMPTMO '                                  + #13;
   Result := sSQL;
end;



function TcfgRelItensEnviados.MontaSqlParcelasMes : String;
var sSQL : String;
begin
   sSQL :=
   '   SELECT '                                                                           + #13 +
   '      COUNT(H.IDCONTRATOEMPTMO) AS TOTAL, '                                           + #13 +
   '      NVL(SUM(HMEVLRPREVISTO),0) AS VALOR '                                           + #13 +
   '   FROM '                                                                             + #13 +
   '      HISTMOVEMPTMO H, CONTRATOEMPTMO C, TIPOCONTREMPTMO TCE, TIPOEMPTMO TE '         + #13 +
   '   WHERE '                                                                            + #13 +
   '          FLGENVIO            IS NULL '                                               + #13 +
   '      AND C.IDCONTRQUITACAO   IS NULL '                                               + #13 +
   '      AND H.HMETIPOMOV        IN (1, 6, 7) '                                          + #13 +
   '      AND H.HMECENTRALIZA     = 1 '                                                   + #13 +
   '      AND H.FLGESTORNADO      IS NULL '                                               + #13 +
   '      AND H.HMEANOCOBRANCA    = ' + NumeroIngles(DBspnAno.Value)                      + #13 +
   '      AND H.HMEMESCOBRANCA    = ' + IntToStr(cboMes.ItemIndex + 1)                    + #13 +
   '      AND C.IDPATRO           = :PIDPESSOA'                                           + #13 +
   '      AND C.IDPLANOPREV       = :PIDPLANOPREV'                                        + #13 +
   '      AND C.IDTIPOCONTREMPTMO = :PIDTIPOCONTREMPTMO'                                  + #13;

   (* filtro por "destino" do Envio *)
   if sFormaCobranca <> '' then begin
      sSQL := sSQL +
   '      AND H.HMEFORMACOBRANCA IN (' + sFormaCobranca + ') '                            + #13;
   end;

   if sTipoFolha <> '' then begin
      sSQL := sSQL +
   '      AND H.HMETIPOFOLHA IN (' + sTipoFolha + ') '                                    + #13;
   end;

   (* filtro por Empresa Proprietátia *)
   sSQL := sSQL +
   '    AND TE.IDEMPRESAPROP       = ' + IntToStr(Sistema.IDEmpresa)                       + #13 +
   '    AND TE.IDTIPOEMPTMO        = TCE.IDTIPOEMPTMO'                                     + #13;

   sSQL := sSQL +
   '      AND H.HMEANOCOMPETENCIA = H.HMEANOCOBRANCA '                                    + #13 +
   '      AND H.HMEMESCOMPETENCIA = H.HMEMESCOBRANCA '                                    + #13 +
   '      AND H.IDCONTRATOEMPTMO  = C.IDCONTRATOEMPTMO '                                  + #13;
   Result := sSQL;
end;



function TcfgRelItensEnviados.MontaSqlParcelasAtrasadas : String;
var sSQL : String;
begin
   sSQL :=
   '   SELECT '                                                                           + #13 +
   '      COUNT(H.IDCONTRATOEMPTMO) AS TOTAL, '                                           + #13 +
   '      NVL(SUM(HMEVLRPREVISTO),0) AS VALOR '                                           + #13 +
   '   FROM '                                                                             + #13 +
   '      HISTMOVEMPTMO H, CONTRATOEMPTMO C, TIPOCONTREMPTMO TCE, TIPOEMPTMO TE '         + #13 +
   '   WHERE '                                                                            + #13 +
   '          FLGENVIO            IS NULL '                                               + #13 +
   '      AND C.IDCONTRQUITACAO   IS NULL '                                               + #13 +
   '      AND H.HMETIPOMOV        IN (1, 6, 7) '                                          + #13 +
   '      AND H.HMECENTRALIZA     = 1 '                                                   + #13 +
   '      AND H.FLGESTORNADO      IS NULL '                                               + #13 +
   '      AND H.HMEANOCOBRANCA    = ' + NumeroIngles(DBspnAno.Value)                      + #13 +
   '      AND H.HMEMESCOBRANCA    = ' + IntToStr(cboMes.ItemIndex + 1)                    + #13 +
   '      AND C.IDPATRO           = :PIDPESSOA'                                           + #13 +
   '      AND C.IDPLANOPREV       = :PIDPLANOPREV'                                        + #13 +
   '      AND C.IDTIPOCONTREMPTMO = :PIDTIPOCONTREMPTMO'                                  + #13;

   (* filtro por "destino" do Envio *)
   if sFormaCobranca <> '' then begin
      sSQL := sSQL +
   '      AND H.HMEFORMACOBRANCA  IN (' + sFormaCobranca + ') '                           + #13;
   end;

   if sTipoFolha <> '' then begin
      sSQL := sSQL +
   '      AND H.HMETIPOFOLHA      IN (' + sTipoFolha + ') '                               + #13;
   end;

   (* filtro por Empresa Proprietátia *)
   sSQL := sSQL +
   '    AND TE.IDEMPRESAPROP       = ' + IntToStr(Sistema.IDEmpresa)                       + #13 +
   '    AND TE.IDTIPOEMPTMO        = TCE.IDTIPOEMPTMO'                                     + #13;

   sSQL := sSQL +
   '      AND (RTRIM(LTRIM(H.HMEANOCOMPETENCIA)) || RTRIM(LTRIM(HMEMESCOMPETENCIA))) < '  +
             '(RTRIM(LTRIM(H.HMEANOCOBRANCA)) || RTRIM(LTRIM(H.HMEMESCOBRANCA))) '        + #13 +
   '      AND H.IDCONTRATOEMPTMO  = C.IDCONTRATOEMPTMO '                                  + #13;
   Result := sSQL;
end;



function TcfgRelItensEnviados.MontaSqlEncargos : String;
var sSQL : String;
begin
   sSQL :=
   '   SELECT '                                                                           + #13 +
   '      COUNT(H.IDCONTRATOEMPTMO) AS TOTAL, '                                           + #13 +
   '      NVL(SUM(HMEVLRPREVISTO),0) AS VALOR '                                           + #13 +
   '   FROM '                                                                             + #13 +
   '      HISTMOVEMPTMO H, CONTRATOEMPTMO C, TIPOCONTREMPTMO TCE, TIPOEMPTMO TE '         + #13 +
   '   WHERE '                                                                            + #13 +
   '          FLGENVIO            IS NULL '                                               + #13 +
   '      AND C.IDCONTRQUITACAO   IS NULL '                                               + #13 +
   '      AND HMETIPOMOV          = 4 '                                                   + #13 +
   '      AND HMECENTRALIZA       = 0 '                                                   + #13 +
   '      AND FLGESTORNADO        IS NULL '                                               + #13 +
   '      AND H.HMEANOCOBRANCA    = ' + NumeroIngles(DBspnAno.Value)                      + #13 +
   '      AND H.HMEMESCOBRANCA    = ' + IntToStr(cboMes.ItemIndex + 1)                    + #13 +
   '      AND C.IDPATRO           = :PIDPESSOA'                                           + #13 +
   '      AND C.IDPLANOPREV       = :PIDPLANOPREV'                                        + #13 +
   '      AND C.IDTIPOCONTREMPTMO = :PIDTIPOCONTREMPTMO'                                  + #13;

   (* filtro por "destino" do Envio *)
   if sFormaCobranca <> '' then begin
      sSQL := sSQL +
   '      AND H.HMEFORMACOBRANCA  IN (' + sFormaCobranca + ') '                           + #13;
   end;

   if sTipoFolha <> '' then begin
      sSQL := sSQL +
   '      AND H.HMETIPOFOLHA      IN (' + sTipoFolha + ') '                               + #13;
   end;


   (* filtro por Empresa Proprietátia *)
   sSQL := sSQL +
   '    AND TE.IDEMPRESAPROP       = ' + IntToStr(Sistema.IDEmpresa)                       + #13 +
   '    AND TE.IDTIPOEMPTMO        = TCE.IDTIPOEMPTMO'                                     + #13;

   sSQL := sSQL +
   '      AND H.IDCONTRATOEMPTMO  = C.IDCONTRATOEMPTMO '                                  + #13;
   Result := sSQL;
end;



function TcfgRelItensEnviados.MontaSqlAmortizacoes : String;
var sSQL : String;
begin
   sSQL :=
   '   SELECT '                                                                           + #13 +
   '      COUNT(H.IDCONTRATOEMPTMO) AS TOTAL, '                                           + #13 +
   '      NVL(SUM(HMEVLRPREVISTO),0) AS VALOR '                                           + #13 +
   '   FROM '                                                                             + #13 +
   '      HISTMOVEMPTMO H, CONTRATOEMPTMO C, TIPOCONTREMPTMO TCE, TIPOEMPTMO TE '         + #13 +
   '   WHERE '                                                                            + #13 +
   '          FLGENVIO            IS NULL '                                               + #13 +
   '      AND C.IDCONTRQUITACAO   IS NULL '                                               + #13 +
   '      AND HMETIPOMOV          = 2 '                                                   + #13 +
   '      AND HMECENTRALIZA       = 1 '                                                   + #13 +
   '      AND FLGESTORNADO        IS NULL '                                               + #13 +
   '      AND H.HMEANOCOBRANCA    = ' + NumeroIngles(DBspnAno.Value)                      + #13 +
   '      AND H.HMEMESCOBRANCA    = ' + IntToStr(cboMes.ItemIndex + 1)                    + #13 +
   '      AND C.IDPATRO           = :PIDPESSOA'                                           + #13 +
   '      AND C.IDPLANOPREV       = :PIDPLANOPREV'                                        + #13 +
   '      AND C.IDTIPOCONTREMPTMO = :PIDTIPOCONTREMPTMO'                                  + #13;

   (* filtro por "destino" do Envio *)
   if sFormaCobranca <> '' then begin
      sSQL := sSQL +
   '      AND H.HMEFORMACOBRANCA  IN (' + sFormaCobranca + ') '                           + #13;
   end;

   if sTipoFolha <> '' then begin
      sSQL := sSQL +
   '      AND H.HMETIPOFOLHA      IN (' + sTipoFolha + ') '                               + #13;
   end;

   (* filtro por Empresa Proprietátia *)
   sSQL := sSQL +
   '    AND TE.IDEMPRESAPROP       = ' + IntToStr(Sistema.IDEmpresa)                       + #13 +
   '    AND TE.IDTIPOEMPTMO        = TCE.IDTIPOEMPTMO'                                     + #13;

   sSQL := sSQL +
   '      AND H.IDCONTRATOEMPTMO  = C.IDCONTRATOEMPTMO '                                  + #13;
   Result := sSQL;
end;



function TcfgRelItensEnviados.MontaSqlQuitacoes : String;
var sSQL : String;
begin
   sSQL :=
   '   SELECT '                                                                           + #13 +
   '      COUNT(H.IDCONTRATOEMPTMO) AS TOTAL, '                                           + #13 +
   '      NVL(SUM(HMEVLRPREVISTO),0) AS VALOR '                                           + #13 +
   '   FROM '                                                                             + #13 +
   '      HISTMOVEMPTMO H, CONTRATOEMPTMO C, TIPOCONTREMPTMO TCE, TIPOEMPTMO TE '         + #13 +
   '   WHERE '                                                                            + #13 +
   '          FLGENVIO            IS NULL '                                               + #13 +
   '      AND C.IDCONTRQUITACAO   IS NULL '                                               + #13 +
   '      AND HMETIPOMOV          = 3 '                                                   + #13 +
   '      AND HMECENTRALIZA       = 1 '                                                   + #13 +
   '      AND FLGESTORNADO        IS NULL '                                               + #13 +
   '      AND H.HMEANOCOBRANCA    = ' + NumeroIngles(DBspnAno.Value)                      + #13 +
   '      AND H.HMEMESCOBRANCA    = ' + IntToStr(cboMes.ItemIndex + 1)                    + #13 +
   '      AND C.IDPATRO           = :PIDPESSOA'                                           + #13 +
   '      AND C.IDPLANOPREV       = :PIDPLANOPREV'                                        + #13 +
   '      AND C.IDTIPOCONTREMPTMO = :PIDTIPOCONTREMPTMO'                                  + #13;

   (* filtro por "destino" do Envio *)
   if sFormaCobranca <> '' then begin
      sSQL := sSQL +
   '      AND H.HMEFORMACOBRANCA  IN (' + sFormaCobranca + ') '                           + #13;
   end;

   if sTipoFolha <> '' then begin
      sSQL := sSQL +
   '      AND H.HMETIPOFOLHA      IN (' + sTipoFolha + ') '                               + #13;
   end;

   (* filtro por Empresa Proprietátia *)
   sSQL := sSQL +
   '    AND TE.IDEMPRESAPROP       = ' + IntToStr(Sistema.IDEmpresa)                       + #13 +
   '    AND TE.IDTIPOEMPTMO        = TCE.IDTIPOEMPTMO'                                     + #13;

   sSQL := sSQL +
   '      AND H.IDCONTRATOEMPTMO  = C.IDCONTRATOEMPTMO '                                  + #13;
   Result := sSQL;
end;



function TcfgRelItensEnviados.MontaSqlQuitacoesMorte : String;
var sSQL : String;
begin
   sSQL :=
   '   SELECT '                                                                           + #13 +
   '      COUNT(H.IDCONTRATOEMPTMO) AS TOTAL, '                                           + #13 +
   '      NVL(SUM(HMEVLRPREVISTO),0) AS VALOR '                                           + #13 +
   '   FROM '                                                                             + #13 +
   '      HISTMOVEMPTMO H, CONTRATOEMPTMO C, TIPOCONTREMPTMO TCE, TIPOEMPTMO TE '         + #13 +
   '   WHERE '                                                                            + #13 +
   '          FLGENVIO            IS NULL '                                               + #13 +
   '      AND C.IDCONTRQUITACAO   IS NULL '                                               + #13 +
   '      AND HMETIPOMOV          = 3 '                                                   + #13 +
   '      AND HMEORIGEM           = 8 '                                                   + #13 +
   '      AND HMECENTRALIZA       = 1 '                                                   + #13 +
   '      AND FLGESTORNADO        IS NULL '                                               + #13 +
   '      AND H.HMEANOCOBRANCA    = ' + NumeroIngles(DBspnAno.Value)                      + #13 +
   '      AND H.HMEMESCOBRANCA    = ' + IntToStr(cboMes.ItemIndex + 1)                    + #13 +
   '      AND C.IDPATRO           = :PIDPESSOA'                                           + #13 +
   '      AND C.IDPLANOPREV       = :PIDPLANOPREV'                                        + #13 +
   '      AND C.IDTIPOCONTREMPTMO = :PIDTIPOCONTREMPTMO'                                  + #13;

   (* filtro por "destino" do Envio *)
   if sFormaCobranca <> '' then begin
      sSQL := sSQL +
   '      AND H.HMEFORMACOBRANCA  IN (' + sFormaCobranca + ') '                           + #13;
   end;

   if sTipoFolha <> '' then begin
      sSQL := sSQL +
   '      AND H.HMETIPOFOLHA      IN (' + sTipoFolha + ') '                               + #13;
   end;

   (* filtro por Empresa Proprietátia *)
   sSQL := sSQL +
   '    AND TE.IDEMPRESAPROP       = ' + IntToStr(Sistema.IDEmpresa)                       + #13 +
   '    AND TE.IDTIPOEMPTMO        = TCE.IDTIPOEMPTMO'                                     + #13;

   sSQL := sSQL +
   '      AND H.IDCONTRATOEMPTMO  = C.IDCONTRATOEMPTMO '                                  + #13;
   Result := sSQL;
end;




procedure TcfgRelItensEnviados.lstPatroClickCheck(Sender: TObject);
begin
  inherited;
   PegaPatro;
end;

procedure TcfgRelItensEnviados.lstPlanoClickCheck(Sender: TObject);
begin
  inherited;
   PegaPlano;
end;

end.


